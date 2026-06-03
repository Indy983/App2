import 'dart:convert';
import 'package:drift/drift.dart';
import 'connection.dart';

part 'app_database.g.dart';

// Table definition
class UserAnswers extends Table {
  TextColumn get lessonId => text()();
  TextColumn get questionId => text()();
  TextColumn get answerData => text().nullable()();
  BoolColumn get isCorrect => boolean().nullable()();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAttemptedAt => dateTime()();
  
  @override
  Set<Column> get primaryKey => {lessonId, questionId};
}

@DriftDatabase(tables: [UserAnswers])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 1. Load all data for a specific lesson
  Future<Map<String, dynamic>> loadLessonState(String lessonId) async {
    final rows = await (select(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId))).get();
    
    Map<String, dynamic> answers = {};
    Map<String, int> attemptCounts = {};
    Map<String, bool> checkedStates = {};
    
    for (var row in rows) {
      // Parse answerData from JSON
      if (row.answerData != null) {
        try {
          var decoded = jsonDecode(row.answerData!);
          // Convert integers to strings to match expected types
          answers[row.questionId] = _convertToExpectedType(decoded);
        } catch (e) {
          // If it's a simple string, use as-is
          answers[row.questionId] = row.answerData;
        }
      }
      attemptCounts[row.questionId] = row.attemptCount;
      // Checked state: if isCorrect is not null, question was checked
      checkedStates[row.questionId] = row.isCorrect != null;
    }
    
    return {
      'answers': answers,
      'attemptCounts': attemptCounts,
      'checkedStates': checkedStates,
    };
  }

  // Helper function to convert decoded JSON to expected types
  dynamic _convertToExpectedType(dynamic value) {
    if (value is int) {
      // Convert int to string (main fix for the error)
      return value.toString();
    } else if (value is List) {
      // For multiple fill-in answers: convert each item
      return value.map((item) {
        if (item is int) return item.toString();
        return item;
      }).toList();
    } else if (value is Map) {
      // For drag-and-drop answers: convert values in map
      final Map<String, dynamic> converted = {};
      value.forEach((key, val) {
        if (val is int) {
          converted[key.toString()] = val.toString();
        } else {
          converted[key.toString()] = val;
        }
      });
      return converted;
    }
    return value;
  }

  // 2. Save answer (always use jsonEncode)
  Future<void> saveAnswer(String lessonId, String questionId, dynamic answerData) async {
    String? jsonData;
    if (answerData != null) {
      // Always use jsonEncode to ensure proper JSON format
      // This ensures "2" becomes "\"2\"" in the database
      jsonData = jsonEncode(answerData);
    }
    
    await into(userAnswers).insertOnConflictUpdate(
      UserAnswersCompanion.insert(
        lessonId: lessonId,
        questionId: questionId,
        answerData: Value(jsonData),
        isCorrect: const Value(null),
        lastAttemptedAt: DateTime.now(),
      ),
    );
  }

  // 3. Check answer and increment attempt count
  Future<void> checkAnswer(String lessonId, String questionId, bool isCorrect) async {
    // Get current attempt count
    final existing = await (select(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId) & t.questionId.equals(questionId)))
      .getSingleOrNull();
    
    int newAttemptCount = (existing?.attemptCount ?? 0) + 1;
    
    await (update(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId) & t.questionId.equals(questionId)))
      .write(UserAnswersCompanion(
        isCorrect: Value(isCorrect),
        attemptCount: Value(newAttemptCount),
        lastAttemptedAt: Value(DateTime.now()),
      ));
  }

  // 4. Retry question (clear answer but keep attempt count)
  Future<void> retryQuestion(String lessonId, String questionId) async {
    await (update(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId) & t.questionId.equals(questionId)))
      .write(const UserAnswersCompanion(
        answerData: Value(null),
        isCorrect: Value(null),
        lastAttemptedAt: Value.absent(),
      ));
  }

  // Helper: Get specific question state
  Future<UserAnswer?> getQuestionState(String lessonId, String questionId) async {
    return await (select(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId) & t.questionId.equals(questionId)))
      .getSingleOrNull();
  }

  // 5. Clear lesson state (useful for debugging/testing)
  Future<void> clearLessonState(String lessonId) async {
    await (delete(userAnswers)
      ..where((t) => t.lessonId.equals(lessonId)))
      .go();
  }

  // 6. Clear all data (use with caution!)
  Future<void> clearAllData() async {
    await delete(userAnswers).go();
  }
}

QueryExecutor _openConnection() {
  return createConnection();
}