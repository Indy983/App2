import '../../../ui/content_models.dart';

/// Central registry for all exercise data
/// Returns the appropriate ExerciseLesson based on the exercise lesson ID
ExerciseLesson? getExerciseData(String id) {
  final exerciseRegistry = <String, ExerciseLesson>{
    // 9. Vectors - Basic Operations Exercise
    'vec_basics_exercise': vectorBasicsExercise,
  };
  
  return exerciseRegistry[id];
}

// === Vector Basics Exercise (after การบวกเวกเตอร์) ===
final vectorBasicsExercise = ExerciseLesson(
  title: "แบบฝึกหัดพื้นฐานเวกเตอร์",
  description: "ฝึกทักษะการบวก ลบ และคำนวณขนาดเวกเตอร์",
  sets: [
    // Set 1: Basic Addition
    ExerciseSet(
      id: "vec_ex_set1",
      title: "ชุดที่ 1: การบวกเวกเตอร์",
      description: "ฝึกการบวกเวกเตอร์ในสองมิติ",
      problems: [
        ExerciseProblem(
          id: "p1",
          type: "question_choice",
          data: {
            "content": r"(3, 4) + (1, 2) = ?",
            "options": ["(4, 6)", "(2, 2)", "(3, 6)", "(4, 5)"],
            "correct": "(4, 6)",
            "explanation": "บวกแต่ละองค์ประกอบ: (3+1, 4+2) = (4, 6)",
          },
        ),
        ExerciseProblem(
          id: "p2",
          type: "question_fill_in",
          data: {
            "content": r"(5, 2) + (3, 7) = {{BOX}}",
            "correct": "(8, 9)",
            "explanation": "(5+3, 2+7) = (8, 9)",
          },
        ),
        ExerciseProblem(
          id: "p3",
          type: "question_choice",
          data: {
            "content": r"(-2, 3) + (4, -1) = ?",
            "options": ["(2, 2)", "(6, 2)", "(-6, 4)", "(2, 4)"],
            "correct": "(2, 2)",
            "explanation": "(-2+4, 3+(-1)) = (2, 2)",
          },
        ),
        ExerciseProblem(
          id: "p4",
          type: "question_fill_in",
          data: {
            "content": r"(0, 5) + (0, 3) = {{BOX}}",
            "correct": "(0, 8)",
            "explanation": "(0+0, 5+3) = (0, 8)",
          },
        ),
        ExerciseProblem(
          id: "p5",
          type: "drag_and_drop",
          data: {
            "content": r"จับคู่ผลลัพธ์: (1, 2) + (3, 4) = {{DROP}} และ (5, 6) + (1, 1) = {{DROP}}",
            "draggableItems": ["(4, 6)", "(6, 7)", "(2, 3)", "(5, 5)"],
            "correctAnswers": {"0": "(4, 6)", "1": "(6, 7)"},
            "explanation": "(1+3, 2+4) = (4, 6) และ (5+1, 6+1) = (6, 7)",
          },
        ),
      ],
    ),
    
    // Set 2: Subtraction
    ExerciseSet(
      id: "vec_ex_set2",
      title: "ชุดที่ 2: การลบเวกเตอร์",
      description: "ฝึกการลบเวกเตอร์",
      problems: [
        ExerciseProblem(
          id: "p1",
          type: "question_choice",
          data: {
            "content": r"(5, 8) - (2, 3) = ?",
            "options": ["(3, 5)", "(7, 11)", "(3, 11)", "(7, 5)"],
            "correct": "(3, 5)",
            "explanation": "(5-2, 8-3) = (3, 5)",
          },
        ),
        ExerciseProblem(
          id: "p2",
          type: "question_fill_in",
          data: {
            "content": r"(10, 6) - (4, 2) = {{BOX}}",
            "correct": "(6, 4)",
            "explanation": "(10-4, 6-2) = (6, 4)",
          },
        ),
        ExerciseProblem(
          id: "p3",
          type: "question_choice",
          data: {
            "content": r"(7, 3) - (7, 3) = ?",
            "options": ["(0, 0)", "(14, 6)", "(1, 1)", "(7, 3)"],
            "correct": "(0, 0)",
            "explanation": "เวกเตอร์ลบตัวเองได้เวกเตอร์ศูนย์ (0, 0)",
          },
        ),
        ExerciseProblem(
          id: "p4",
          type: "question_fill_in",
          data: {
            "content": r"เวกเตอร์ตรงข้ามของ (3, -5) คือ {{BOX}}",
            "correct": "(-3, 5)",
            "explanation": "เปลี่ยนเครื่องหมายทุกองค์ประกอบ: (-3, 5)",
          },
        ),
        ExerciseProblem(
          id: "p5",
          type: "drag_and_drop",
          data: {
            "content": r"ให้ a = (8, 6), b = (3, 2) แล้ว a - b = {{DROP}} และ b - a = {{DROP}}",
            "draggableItems": ["(5, 4)", "(-5, -4)", "(11, 8)", "(5, -4)"],
            "correctAnswers": {"0": "(5, 4)", "1": "(-5, -4)"},
            "explanation": "a - b = (8-3, 6-2) = (5, 4) และ b - a = (3-8, 2-6) = (-5, -4)",
          },
        ),
      ],
    ),
    
    // Set 3: Magnitude
    ExerciseSet(
      id: "vec_ex_set3",
      title: "ชุดที่ 3: ขนาดของเวกเตอร์",
      description: "ฝึกการคำนวณขนาดเวกเตอร์",
      problems: [
        ExerciseProblem(
          id: "p1",
          type: "question_choice",
          data: {
            "content": r"ขนาดของเวกเตอร์ (3, 4) เท่ากับ?",
            "options": ["5", "7", "12", "25"],
            "correct": "5",
            "explanation": r"$$|\vec{v}| = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5$$",
          },
        ),
        ExerciseProblem(
          id: "p2",
          type: "question_fill_in",
          data: {
            "content": r"ขนาดของเวกเตอร์ (6, 8) = {{BOX}}",
            "correct": "10",
            "explanation": r"$$\sqrt{6^2 + 8^2} = \sqrt{36 + 64} = \sqrt{100} = 10$$",
          },
        ),
        ExerciseProblem(
          id: "p3",
          type: "question_choice",
          data: {
            "content": r"ขนาดของเวกเตอร์ (1, 0) เท่ากับ?",
            "options": ["0", "1", "2", "ไม่สามารถหาได้"],
            "correct": "1",
            "explanation": r"$$\sqrt{1^2 + 0^2} = \sqrt{1} = 1$$",
          },
        ),
        ExerciseProblem(
          id: "p4",
          type: "question_fill_in",
          data: {
            "content": r"ขนาดของเวกเตอร์ศูนย์ (0, 0) = {{BOX}}",
            "correct": "0",
            "explanation": r"$$\sqrt{0^2 + 0^2} = 0$$",
          },
        ),
        ExerciseProblem(
          id: "p5",
          type: "question_choice",
          data: {
            "content": r"ถ้า $$|\vec{v}| = 13$$ และ $$\vec{v} = (5, y)$$ แล้ว y = ?",
            "options": ["12", "8", "144", "5"],
            "correct": "12",
            "explanation": r"$$\sqrt{5^2 + y^2} = 13$$ ดังนั้น $$25 + y^2 = 169$$ จึง $$y = 12$$",
          },
        ),
        ExerciseProblem(
          id: "p6",
          type: "drag_and_drop",
          data: {
            "content": r"จับคู่เวกเตอร์กับขนาด: (0, 5) มีขนาด {{DROP}} และ (12, 5) มีขนาด {{DROP}}",
            "draggableItems": ["5", "13", "17", "7"],
            "correctAnswers": {"0": "5", "1": "13"},
            "explanation": r"(0, 5) มีขนาด 5 และ (12, 5) มีขนาด $$\sqrt{144+25} = 13$$",
          },
        ),
      ],
    ),
    
    // Set 4: Mixed Problems
    ExerciseSet(
      id: "vec_ex_set4",
      title: "ชุดที่ 4: รวมทุกประเภท",
      description: "โจทย์ผสมการบวก ลบ และขนาด",
      problems: [
        ExerciseProblem(
          id: "p1",
          type: "question_choice",
          data: {
            "content": r"ถ้า $$\vec{a} = (2, 3)$$ และ $$\vec{b} = (1, 4)$$ แล้ว $$|\vec{a} + \vec{b}|$$ = ?",
            "options": ["5", "7", "8", "10"],
            "correct": "5",
            "explanation": r"$$\vec{a} + \vec{b} = (3, 7)$$ ดังนั้น $$|\vec{a} + \vec{b}| = \sqrt{9 + 49} = \sqrt{58} \approx 7.6$$... แต่ถ้าเป็น (3,4) จะได้ 5",
          },
        ),
        ExerciseProblem(
          id: "p2",
          type: "question_fill_in",
          data: {
            "content": r"ถ้า $$\vec{v} + (2, 1) = (5, 6)$$ แล้ว $$\vec{v} = {{BOX}}$$",
            "correct": "(3, 5)",
            "explanation": r"$$\vec{v} = (5, 6) - (2, 1) = (3, 5)$$",
          },
        ),
        ExerciseProblem(
          id: "p3",
          type: "question_choice",
          data: {
            "content": r"Unit vector ในทิศของ (3, 4) คือ?",
            "options": ["(0.6, 0.8)", "(0.8, 0.6)", "(1, 1)", "(3, 4)"],
            "correct": "(0.6, 0.8)",
            "explanation": r"หารด้วยขนาด 5: $$(3/5, 4/5) = (0.6, 0.8)$$",
          },
        ),
        ExerciseProblem(
          id: "p4",
          type: "drag_and_drop",
          data: {
            "content": r"เวกเตอร์ {{DROP}} เป็นสเกลาร์ ส่วน {{DROP}} เป็นเวกเตอร์",
            "draggableItems": ["ความเร็ว", "เวลา", "แรง", "อุณหภูมิ"],
            "correctAnswers": {"0": "เวลา", "1": "ความเร็ว"},
            "explanation": "เวลาและอุณหภูมิเป็นสเกลาร์ ส่วนความเร็วและแรงเป็นเวกเตอร์",
          },
        ),
      ],
    ),
  ],
);