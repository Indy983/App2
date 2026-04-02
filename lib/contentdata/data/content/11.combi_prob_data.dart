import '../../../ui/content_models.dart';

// === Combinatorics and Probability ===

final combiCountingLesson = ContentLesson(
  title: "หลักการนับ",
  sections: [
    ContentSection(
      headerL1: "หลักการนับพื้นฐาน",
      blocks: [
        ContentBlock("cc1", "text", {"content": r"หลักการบวก: ทำได้ m หรือ n วิธี = m + n"}),
        ContentBlock("cc2", "text", {"content": r"หลักการคูณ: ทำได้ m และ n วิธี = m × n"}),
        ContentBlock("q1", "question_choice", {
          "content": r"เลือกเสื้อ 3 ตัว กางเกง 2 ตัว มีกี่แบบ",
          "options": ["5", "6", "9"],
          "correct": "6",
        }),
      ],
    ),
  ],
);

final combiPermutationLesson = ContentLesson(
  title: "การเรียงสับเปลี่ยน",
  sections: [
    ContentSection(
      headerL1: "Permutation",
      blocks: [
        ContentBlock("cp1", "text", {"content": r"P(n,r) = n!/(n-r)!"}),
        ContentBlock("cp2", "text", {"content": r"n! = n × (n-1) × ... × 2 × 1"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"P(5,2) = {{BOX}}",
          "correct": "20",
        }),
      ],
    ),
  ],
);

final combiCombinationLesson = ContentLesson(
  title: "การจัดหมู่",
  sections: [
    ContentSection(
      headerL1: "Combination",
      blocks: [
        ContentBlock("cb1", "text", {"content": r"C(n,r) = n!/(r!(n-r)!)"}),
        ContentBlock("q1", "question_choice", {
          "content": r"C(5,2) เท่ากับ",
          "options": ["10", "20", "30"],
          "correct": "10",
        }),
      ],
    ),
  ],
);

final probIntroLesson = ContentLesson(
  title: "แนะนำความน่าจะเป็น",
  sections: [
    ContentSection(
      headerL1: "ความน่าจะเป็น",
      blocks: [
        ContentBlock("p1", "text", {"content": r"P(A) = จำนวนผลลัพธ์ที่ต้องการ / จำนวนผลลัพธ์ทั้งหมด"}),
        ContentBlock("p2", "text", {"content": r"0 ≤ P(A) ≤ 1"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"โยนเหรียญ P(หัว) = {{BOX}}",
          "correct": "1/2",
        }),
      ],
    ),
  ],
);

final probConditionalLesson = ContentLesson(
  title: "ความน่าจะเป็นแบบมีเงื่อนไข",
  sections: [
    ContentSection(
      headerL1: "Conditional Probability",
      blocks: [
        ContentBlock("pc1", "text", {"content": r"P(A|B) = P(A∩B) / P(B)"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ถ้า A และ B เป็นอิสระ P(A|B) =",
          "options": ["P(A)", "P(B)", "P(A∩B)"],
          "correct": "P(A)",
        }),
      ],
    ),
  ],
);