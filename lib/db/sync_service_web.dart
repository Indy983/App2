import 'app_database.dart';
import 'sync_service.dart';

/// Web-only SyncService that [implements] SyncService, making it
/// type-compatible with every widget that expects a real SyncService.
/// All server-side operations are no-ops.
class SyncServiceWeb implements SyncService {
  final AppDatabase _localDb;

  SyncServiceWeb(this._localDb);

  @override
  Future<void> initialSync() async {
    // No-op: no server to sync from on web
  }

  @override
  Future<void> incrementalSync() async {
    // No-op
  }

  @override
  Future<void> writeAnswer({
    required String lessonId,
    required String questionId,
    required dynamic answerData,
  }) async {
    // No-op: no server to push to on web
  }

  @override
  Future<void> checkAnswer({
    required String lessonId,
    required String questionId,
    required bool isCorrect,
  }) async {
    // No-op
  }

  @override
  Future<void> retryQuestion({
    required String lessonId,
    required String questionId,
  }) async {
    // Local-only retry
    await _localDb.retryQuestion(lessonId, questionId);
  }

  @override
  Future<void> logout() async {
    await _localDb.clearAllData();
  }
}