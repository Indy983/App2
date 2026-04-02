import '../../../ui/content_models.dart';

// === ฟังก์ชัน Exponential และ Logarithm ===

final expoIntroLesson = ContentLesson(
  title: "ฟังก์ชันเอ็กซ์โพเนนเชียล",
  sections: [
    ContentSection(
      headerL1: "ฟังก์ชันเลขยกกำลัง",
      blocks: [
        ContentBlock("e1", "text", {"content": r"f(x) = aˣ โดย a > 0, a ≠ 1"}),
        ContentBlock("e2", "text", {"content": r"e ≈ 2.71828 เป็นฐานธรรมชาติ"}),
        ContentBlock("q1", "question_choice", {
          "content": r"2³ เท่ากับ",
          "options": ["6", "8", "9"],
          "correct": "8",
        }),
      ],
    ),
  ],
);

final expoPropertiesLesson = ContentLesson(
  title: "สมบัติเลขยกกำลัง",
  sections: [
    ContentSection(
      headerL1: "กฎของเลขยกกำลัง",
      blocks: [
        ContentBlock("ep1", "text", {"content": r"aᵐ × aⁿ = aᵐ⁺ⁿ"}),
        ContentBlock("ep2", "text", {"content": r"aᵐ ÷ aⁿ = aᵐ⁻ⁿ"}),
        ContentBlock("ep3", "text", {"content": r"(aᵐ)ⁿ = aᵐⁿ"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"2⁴ × 2³ = 2^{{BOX}}",
          "correct": "7",
        }),
      ],
    ),
  ],
);

final expoLogIntroLesson = ContentLesson(
  title: "ฟังก์ชันลอการิทึม",
  sections: [
    ContentSection(
      headerL1: "ลอการิทึม",
      blocks: [
        ContentBlock("l1", "text", {"content": r"logₐ(x) = y หมายถึง aʸ = x"}),
        ContentBlock("l2", "text", {"content": r"ln(x) = logₑ(x) คือลอการิทึมธรรมชาติ"}),
        ContentBlock("q1", "question_choice", {
          "content": r"log₂(8) เท่ากับ",
          "options": ["2", "3", "4"],
          "correct": "3",
        }),
      ],
    ),
  ],
);

final expoLogPropertiesLesson = ContentLesson(
  title: "สมบัติลอการิทึม",
  sections: [
    ContentSection(
      headerL1: "กฎของลอการิทึม",
      blocks: [
        ContentBlock("lp1", "text", {"content": r"log(ab) = log(a) + log(b)"}),
        ContentBlock("lp2", "text", {"content": r"log(a/b) = log(a) - log(b)"}),
        ContentBlock("lp3", "text", {"content": r"log(aⁿ) = n·log(a)"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"log₂(16) - log₂(4) = log₂({{BOX}})",
          "correct": "4",
        }),
      ],
    ),
  ],
);