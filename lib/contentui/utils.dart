import 'package:flutter/material.dart';
import '../db/app_database.dart';
import '../db/sync_service.dart';

class QuestionParams {
  final String id;
  final Map data;
  final Map state;
  final String lessonId;
  final AppDatabase database;
  final SyncService syncService;
  final bool isChecked;
  final Map<String, bool>? checkedStates;
  final Map<String, int>? attemptCounts;

  const QuestionParams({
    required this.id,
    required this.data,
    required this.state,
    required this.lessonId,
    required this.database,
    required this.syncService,
    this.isChecked = false,
    this.checkedStates,
    this.attemptCounts,
  });
}

bool checkAnswer(dynamic userAnswer, dynamic correctAnswer) {
  if (userAnswer == null) return false;
  
  if (correctAnswer is Map && userAnswer is Map) {
    for (var key in correctAnswer.keys) {
      if (userAnswer[key]?.toString() != correctAnswer[key]?.toString()) {
        return false;
      }
    }
    return true;
  }
  
  return userAnswer.toString() == correctAnswer.toString();
}

Color? getBorderColor({
  required bool isChecked,
  required dynamic userAnswer,
  required dynamic correctAnswer,
  String? key,
}) {
  if (!isChecked) return null;
  if (userAnswer == null) return null;
  
  if (key != null && correctAnswer is Map && userAnswer is Map) {
    var answer = userAnswer[key];
    if (answer == null || answer.toString().isEmpty) return null;
    return answer.toString() == correctAnswer[key].toString()
        ? Colors.green
        : Colors.red;
  }
  
  if (userAnswer.toString().isEmpty) return null;
  return checkAnswer(userAnswer, correctAnswer) ? Colors.green : Colors.red;
}