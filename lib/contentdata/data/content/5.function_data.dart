import '../../../ui/content_models.dart';

// === ความสัมพันธ์และฟังก์ชัน (Relations and Functions) ===

final functionIntroLesson = ContentLesson(
  title: "แนะนำฟังก์ชัน",
  sections: [
    ContentSection(
      headerL1: "ฟังก์ชันคืออะไร",
      blocks: [
        ContentBlock("f1", "text", {"content": r"ฟังก์ชัน f: X → Y แต่ละ x มี y เดียว"}),
        ContentBlock("f2", "text", {"content": r"f(x) = y เรียก x ว่า input, y ว่า output"}),
        ContentBlock("q1", "question_choice", {
          "content": r"f(x) = 2x + 1 แล้ว f(3) เท่ากับ",
          "options": ["5", "7", "9"],
          "correct": "7",
        }),
      ],
    ),
  ],
);

final functionTypesLesson = ContentLesson(
  title: "ประเภทของฟังก์ชัน",
  sections: [
    ContentSection(
      headerL1: "One-to-One และ Onto",
      blocks: [
        ContentBlock("ft1", "text", {"content": r"One-to-one: แต่ละ y มาจาก x เพียงตัวเดียว"}),
        ContentBlock("ft2", "text", {"content": r"Onto: ทุก y ใน codomain มี x ที่ชี้ไป"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"f(x) = x² เป็นฟังก์ชันแบบ {{BOX}}",
          "correct": "many-to-one",
        }),
      ],
    ),
  ],
);

final functionCompositionLesson = ContentLesson(
  title: "ฟังก์ชันประกอบ",
  sections: [
    ContentSection(
      headerL1: "การประกอบฟังก์ชัน",
      blocks: [
        ContentBlock("fc1", "text", {"content": r"(f ∘ g)(x) = f(g(x))"}),
        ContentBlock("q1", "question_choice", {
          "content": r"f(x) = 2x, g(x) = x+1 แล้ว (f∘g)(1) เท่ากับ",
          "options": ["2", "3", "4"],
          "correct": "4",
        }),
      ],
    ),
  ],
);

final functionInverseLesson = ContentLesson(
  title: "ฟังก์ชันผกผัน",
  sections: [
    ContentSection(
      headerL1: "ฟังก์ชันผกผัน",
      blocks: [
        ContentBlock("fi1", "text", {"content": r"f⁻¹ สลับ x กับ y"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"f(x) = 2x แล้ว f⁻¹(x) = {{BOX}}",
          "correct": "x/2",
        }),
      ],
    ),
  ],
);