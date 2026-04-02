import '../../../ui/content_models.dart';

// === ลำดับและอนุกรม (Sequences and Series) ===

final seqIntroLesson = ContentLesson(
  title: "แนะนำลำดับ",
  sections: [
    ContentSection(
      headerL1: "ลำดับ",
      blocks: [
        ContentBlock("seq1", "text", {"content": r"ลำดับคือชุดของจำนวนที่เรียงกัน"}),
        ContentBlock("seq2", "text", {"content": r"aₙ แทนพจน์ที่ n"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ลำดับ 2, 4, 6, 8 พจน์ถัดไปคือ",
          "options": ["9", "10", "12"],
          "correct": "10",
        }),
      ],
    ),
  ],
);

final seqArithmeticLesson = ContentLesson(
  title: "ลำดับเลขคณิต",
  sections: [
    ContentSection(
      headerL1: "Arithmetic Sequence",
      blocks: [
        ContentBlock("sa1", "text", {"content": r"aₙ = a₁ + (n-1)d โดย d คือผลต่างร่วม"}),
        ContentBlock("sa2", "text", {"content": r"ผลรวม Sₙ = n(a₁+aₙ)/2"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"ลำดับ 3, 7, 11, ... พจน์ที่ 5 = {{BOX}}",
          "correct": "19",
        }),
      ],
    ),
  ],
);

final seqGeometricLesson = ContentLesson(
  title: "ลำดับเรขาคณิต",
  sections: [
    ContentSection(
      headerL1: "Geometric Sequence",
      blocks: [
        ContentBlock("sg1", "text", {"content": r"aₙ = a₁ × rⁿ⁻¹ โดย r คืออัตราส่วนร่วม"}),
        ContentBlock("sg2", "text", {"content": r"ผลรวม Sₙ = a₁(1-rⁿ)/(1-r)"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ลำดับ 2, 6, 18, ... อัตราส่วนร่วมคือ",
          "options": ["2", "3", "4"],
          "correct": "3",
        }),
      ],
    ),
  ],
);

final seqSeriesLesson = ContentLesson(
  title: "อนุกรม",
  sections: [
    ContentSection(
      headerL1: "Series",
      blocks: [
        ContentBlock("ser1", "text", {"content": r"อนุกรมคือผลรวมของพจน์ในลำดับ"}),
        ContentBlock("ser2", "text", {"content": r"อนุกรมอนันต์: ∑(n=1 to ∞) aₙ"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"ผลรวมอนันต์ของ 1 + 1/2 + 1/4 + ... = {{BOX}}",
          "correct": "2",
        }),
      ],
    ),
  ],
);