import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_database.dart';
import 'package:drift/drift.dart';

class SyncService {
  final AppDatabase _localDb;
  final SupabaseClient _supabase;
  
  SyncService(this._localDb, this._supabase);
  
  String? get _userId => _supabase.auth.currentUser?.id;
  
  /// Initial sync: Fetch all data on login
  Future<void> initialSync() async {
    if (_userId == null) throw Exception('User not authenticated');
    
    // Clear local data
    await _localDb.clearAllData();
    
    // Fetch all user data from Supabase
    final List<dynamic> allData = await _supabase
        .from('user_answers')
        .select()
        .eq('user_id', _userId!);
    
    // Insert into local DB
    for (final row in allData) {
      await _insertLocalFromServer(row);
    }
    
    // Save sync timestamp
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_sync_timestamp', DateTime.now().toIso8601String());
  }
  
  /// Incremental sync: Fetch only changes since last sync
  Future<void> incrementalSync() async {
    if (_userId == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    final lastSync = prefs.getString('last_sync_timestamp');
    
    // Build query
    var query = _supabase
        .from('user_answers')
        .select()
        .eq('user_id', _userId!);
    
    // Filter by last sync time
    if (lastSync != null) {
      query = query.gt('updated_at', lastSync);
    }
    
    final List<dynamic> changes = await query;
    
    if (changes.isEmpty) return;
    
    // Apply changes to local DB
    for (final row in changes) {
      await _insertLocalFromServer(row);
    }
    
    // Update timestamp
    final newestTimestamp = changes
        .map((r) => DateTime.parse(r['updated_at'] as String))
        .reduce((a, b) => a.isAfter(b) ? a : b)
        .toIso8601String();
    await prefs.setString('last_sync_timestamp', newestTimestamp);
  }
  
  /// Write answer: Local first, server in background
  Future<void> writeAnswer({
    required String lessonId,
    required String questionId,
    required dynamic answerData,
  }) async {
    // Sync to server (don't await)
    _pushToServer(lessonId, questionId, answerData: answerData);
  }
  
/// Check answer: Sync to server only (local DB already updated by widget)
Future<void> checkAnswer({
  required String lessonId,
  required String questionId,
  required bool isCorrect,
}) async {
  // Get attempt count from local DB (already incremented by widget)
  final state = await _localDb.getQuestionState(lessonId, questionId);
  
  // Push to server
  _pushToServer(
    lessonId, 
    questionId, 
    isCorrect: isCorrect,
    attemptCount: state?.attemptCount ?? 1,
  );
}

/// Retry question: Clear answer both locally and on server
Future<void> retryQuestion({
  required String lessonId,
  required String questionId,
}) async {
  // Clear local DB
  await _localDb.retryQuestion(lessonId, questionId);
  
  // Clear on server (set answer_data and is_correct to null)
  if (_userId != null) {
    try {
      await _supabase.from('user_answers').upsert({
        'user_id': _userId,
        'lesson_id': lessonId,
        'question_id': questionId,
        'answer_data': null,
        'is_correct': null,
        // Keep attempt_count as-is
      });
    } catch (e) {
      print('Retry sync error: $e');
    }
  }
}
  
  /// Logout: Clear everything
  Future<void> logout() async {
    await _localDb.clearAllData();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('last_sync_timestamp');
  }
  
  // ============ Private Helpers ============
  
  Future<void> _insertLocalFromServer(Map<String, dynamic> row) async {
    final lessonId = row['lesson_id'] as String;
    final questionId = row['question_id'] as String;
    final answerDataStr = row['answer_data'] as String?;
    final isCorrect = row['is_correct'] as bool?;
    final attemptCount = row['attempt_count'] as int? ?? 0;
    
    // Parse answer
    dynamic parsedAnswer;
    if (answerDataStr != null) {
      try {
        parsedAnswer = jsonDecode(answerDataStr);
      } catch (e) {
        parsedAnswer = answerDataStr;
      }
    }
    
    // Upsert to local DB
    await _localDb.into(_localDb.userAnswers).insertOnConflictUpdate(
      UserAnswersCompanion.insert(
        lessonId: lessonId,
        questionId: questionId,
        answerData: Value(answerDataStr),
        isCorrect: Value(isCorrect),
        attemptCount: Value(attemptCount),
        lastAttemptedAt: DateTime.now(),
      ),
    );
  }
  
  Future<void> _pushToServer(
    String lessonId,
    String questionId, {
    dynamic answerData,
    bool? isCorrect,
    int? attemptCount,
  }) async {
    if (_userId == null) return;
    
    try {
      final Map<String, dynamic> data = {
        'user_id': _userId,
        'lesson_id': lessonId,
        'question_id': questionId,
      };
      
      if (answerData != null) {
        data['answer_data'] = jsonEncode(answerData);
      }
      if (isCorrect != null) {
        data['is_correct'] = isCorrect;
      }
      if (attemptCount != null) {
        data['attempt_count'] = attemptCount;
      }
      
      await _supabase.from('user_answers').upsert(data);
    } catch (e) {
      print('Sync error: $e');
    }
  }
}