// สำหรับหน้าแรก (Catalog)
class Topic {
  final String title;
  final List<LessonSummary> lessons;
  Topic({required this.title, required this.lessons});
}

class LessonSummary {
  final String id;
  final String title;
  final List<SubLesson> subtopics;
  LessonSummary({required this.id, required this.title, required this.subtopics});
}

class SubLesson {
  final String? id; // null if this is a group header
  final String title;
  final String? exerciseLessonId; // Optional: ID of exercise lesson after this subtopic
  final bool isGroupHeader; // true = group header, false = clickable lesson
  
  SubLesson({
    this.id, 
    required this.title,
    this.exerciseLessonId,
    this.isGroupHeader = false, // default = clickable lesson
  });
}

// สำหรับหน้าเนื้อหา (Lesson Content)
class ContentLesson {
  final String title;
  final List<ContentSection> sections;
  ContentLesson({required this.title, required this.sections});
}

class ContentSection {
  final String headerL1;
  final List<ContentBlock> blocks;
  ContentSection({required this.headerL1, required this.blocks});
}

class ContentBlock {
  final String id;
  final String type;
  final Map<String, dynamic> data;
  ContentBlock(this.id, this.type, this.data);
}

// สำหรับหน้าแบบฝึกหัด (Exercise)
class ExerciseLesson {
  final String title;
  final String description;
  final List<ExerciseSet> sets;
  ExerciseLesson({
    required this.title, 
    required this.description,
    required this.sets,
  });
}

class ExerciseSet {
  final String id;
  final String title;
  final String description;
  final List<ExerciseProblem> problems;
  ExerciseSet({
    required this.id, 
    required this.title,
    required this.description,
    required this.problems,
  });
}

class ExerciseProblem {
  final String id;
  final String type; // 'question_choice', 'question_fill_in', 'drag_and_drop'
  final Map<String, dynamic> data;
  ExerciseProblem({
    required this.id, 
    required this.type, 
    required this.data,
  });
}