import '../../../ui/content_models.dart';

// === ตรรกศาสตร์เบื้องต้น (Logic) ===

final logicIntroLesson = ContentLesson(
  title: "ประพจน์และตรรกศาสตร์",
  sections: [
    ContentSection(
      headerL1: "ประพจน์",
      blocks: [
        ContentBlock("l1", "text", {"content": r"ประพจน์คือข้อความที่มีค่าความจริงเป็นจริงหรือเท็จ"}),
        ContentBlock("q1", "question_choice", {
          "content": r"'2 + 2 = 4' เป็นประพจน์ไหม",
          "options": ["ใช่", "ไม่ใช่"],
          "correct": "ใช่",
        }),
      ],
    ),
    ContentSection(
      headerL1: "ค่าความจริง",
      blocks: [
        ContentBlock("l2", "text", {"content": r"ประพจน์มีค่าความจริงเป็น True (T) หรือ False (F)"}),
        ContentBlock("q2", "question_fill_in", {
          "content": r"ประพจน์ '3 > 5' มีค่าความจริงเป็น {{BOX}}",
          "correct": "F",
        }),
      ],
    ),
  ],
);

final logicOperatorsLesson = ContentLesson(
  title: "ตัวดำเนินการทางตรรกะ",
  sections: [
    ContentSection(
      headerL1: "AND, OR, NOT",
      blocks: [
        ContentBlock("lo1", "text", {"content": r"AND (∧): จริงเมื่อทั้งสองข้างจริง"}),
        ContentBlock("lo2", "text", {"content": r"OR (∨): จริงเมื่ออย่างน้อยหนึ่งข้างจริง"}),
        ContentBlock("lo3", "text", {"content": r"NOT (¬): กลับค่าความจริง"}),
        ContentBlock("q1", "question_choice", {
          "content": r"T ∧ F มีค่าเท่ากับ",
          "options": ["T", "F"],
          "correct": "F",
        }),
      ],
    ),
    ContentSection(
      headerL1: "Implication",
      blocks: [
        ContentBlock("lo4", "text", {"content": r"If-Then (→): p → q เท็จเมื่อ p จริงแต่ q เท็จ"}),
        ContentBlock("q2", "question_fill_in", {
          "content": r"T → F มีค่าเท่ากับ {{BOX}}",
          "correct": "F",
        }),
      ],
    ),
  ],
);

final logicTruthTableLesson = ContentLesson(
  title: "ตารางค่าความจริง",
  sections: [
    ContentSection(
      headerL1: "สร้างตารางค่าความจริง",
      blocks: [
        ContentBlock("tt1", "text", {"content": r"ตารางค่าความจริงแสดงค่าความจริงของประพจน์ทุกกรณี"}),
        ContentBlock("tt2", "image", {"path": "assets/truth_table.png"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ในตารางค่าความจริงของ p ∧ q มีแถวกี่แถว",
          "options": ["2", "4", "8"],
          "correct": "4",
        }),
      ],
    ),
  ],
);