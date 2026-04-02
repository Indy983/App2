import 'package:flutter/material.dart';
import 'content_models.dart';
import '../contentdata/data/lesson_data_registry.dart';
import '../contentdata/data/exercise/exercise_data_registry.dart';
import '../db/sync_service.dart';
import 'lesson_screen.dart';
import '../contentdata/data/exercise/exercise_list_screen.dart';

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  final SyncService syncService;

  TopicDetailScreen({
    required this.topic,
    required this.syncService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: ListView.builder(
        itemCount: topic.lessons.length,
        itemBuilder: (context, lessonIndex) {
          final lesson = topic.lessons[lessonIndex];
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lesson header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                margin: EdgeInsets.only(top: lessonIndex == 0 ? 0 : 16),
                color: Colors.blue[50],
                child: Text(
                  lesson.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              // Subtopics and exercises
              ..._buildSubtopicsWithExercises(context, lesson.subtopics),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildSubtopicsWithExercises(BuildContext context, List<SubLesson> subtopics) {
    List<Widget> widgets = [];
    
    for (var subtopic in subtopics) {
      if (subtopic.isGroupHeader) {
        // Display Group Header (sub-section header with left border accent)
        widgets.add(
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                left: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text(
              subtopic.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
        );
      } else {
        // Display Subtopic ListTile (clickable lesson)
        widgets.add(
          ListTile(
            title: Text(subtopic.title),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              final data = getLessonData(subtopic.id!);
              if (data != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonScreen(
                      lesson: data,
                      lessonId: subtopic.id!,
                      syncService: syncService,
                    ),
                  ),
                );
              }
            },
          ),
        );
        
        // Add exercise button if this subtopic has exercises
        if (subtopic.exerciseLessonId != null) {
          final exerciseData = getExerciseData(subtopic.exerciseLessonId!);
          if (exerciseData != null) {
            widgets.add(
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseListScreen(
                          exerciseLesson: exerciseData,
                          syncService: syncService,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.assignment, size: 20),
                  label: Text("📝 แบบฝึกหัด: ${exerciseData.title}"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[400],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      }
    }
    
    return widgets;
  }
}