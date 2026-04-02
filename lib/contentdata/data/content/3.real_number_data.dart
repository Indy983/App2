import '../../../ui/content_models.dart';

// === ระบบจำนวนจริง (Real Number System) ===

final realIntroLesson = ContentLesson(
  title: "ระบบจำนวนจริง",
  sections: [
    ContentSection(
      headerL1: "ประเภทของจำนวน",
      blocks: [
        ContentBlock("r1", "text", {"content": r"จำนวนนับ (N): 1, 2, 3, ..."}),
        ContentBlock("r2", "text", {"content": r"จำนวนเต็ม (Z): ..., -2, -1, 0, 1, 2, ..."}),
        ContentBlock("r3", "text", {"content": r"จำนวนตรรกยะ (Q): a/b โดย a, b เป็นจำนวนเต็ม"}),
        ContentBlock("q1", "question_choice", {
          "content": r"√2 เป็นจำนวนประเภทใด",
          "options": ["ตรรกยะ", "อตรรกยะ", "เต็ม"],
          "correct": "อตรรกยะ",
        }),
      ],
    ),
  ],
);

final realPropertiesLesson = ContentLesson(
  title: "สมบัติของจำนวนจริง",
  sections: [
    ContentSection(
      headerL1: "สมบัติพื้นฐาน",
      blocks: [
        ContentBlock("rp1", "text", {"content": r"สมบัติสลับที่: a + b = b + a"}),
        ContentBlock("rp2", "text", {"content": r"สมบัติเชื่อมโยง: (a + b) + c = a + (b + c)"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"5 × 3 = 3 × {{BOX}}",
          "correct": "5",
        }),
      ],
    ),
  ],
);

final realInequalitiesLesson = ContentLesson(
  title: "อสมการ",
  sections: [
    ContentSection(
      headerL1: "การแก้อสมการ",
      blocks: [
        ContentBlock("ri1", "text", {"content": r"อสมการคือความสัมพันธ์ที่ใช้ <, >, ≤, ≥"}),
        ContentBlock("q1", "question_choice", {
          "content": r"2x + 3 < 7 แก้ได้ x <",
          "options": ["1", "2", "3"],
          "correct": "2",
        }),
      ],
    ),
  ],
);