import 'package:flutter/material.dart';
import '../../../ui/content_models.dart';
import 'exercise_problem_screen.dart';
import '../../../db/sync_service.dart';
import '../../../db/app_database.dart';

class ExerciseListScreen extends StatefulWidget {
  final ExerciseLesson exerciseLesson;
  final SyncService syncService;

  const ExerciseListScreen({
    Key? key,
    required this.exerciseLesson,
    required this.syncService,
  }) : super(key: key);

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  late AppDatabase _database;
  Map<String, Map<String, bool>> _setProgress = {}; // setId -> {problemId: isCorrect}

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    for (var set in widget.exerciseLesson.sets) {
      final state = await _database.loadLessonState(set.id);
      Map<String, bool> progress = {};
      
      for (var problem in set.problems) {
        // Check if problem was answered correctly
        bool isCorrect = state['checkedStates'][problem.id] == true &&
                        state['answers'][problem.id] != null;
        progress[problem.id] = isCorrect;
      }
      
      _setProgress[set.id] = progress;
    }
    
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  int _getCorrectCount(String setId) {
    return _setProgress[setId]?.values.where((v) => v).length ?? 0;
  }

  int _getTotalCount(String setId) {
    final set = widget.exerciseLesson.sets.firstWhere((s) => s.id == setId);
    return set.problems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseLesson.title),
      ),
      body: Column(
        children: [
          // Description header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.exerciseLesson.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "เลือกชุดแบบฝึกหัดที่ต้องการฝึก",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          
          // Exercise sets list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.exerciseLesson.sets.length,
              itemBuilder: (context, index) {
                final set = widget.exerciseLesson.sets[index];
                final correct = _getCorrectCount(set.id);
                final total = _getTotalCount(set.id);
                final progress = total > 0 ? correct / total : 0.0;
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseProblemScreen(
                            exerciseSet: set,
                            syncService: widget.syncService,
                          ),
                        ),
                      );
                      // Reload progress after returning
                      _loadProgress();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  set.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.blue[700],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            set.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 12),
                          
                          // Progress bar
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 8,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      progress == 1.0 ? Colors.green : Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "$correct/$total",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: progress == 1.0 ? Colors.green : Colors.blue[700],
                                ),
                              ),
                            ],
                          ),
                          
                          // Problem count
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.quiz, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                "${set.problems.length} ข้อ",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}