import '../../../ui/content_models.dart';

// === จำนวนเชิงซ้อน (Complex Numbers) ===

final complexIntroLesson = ContentLesson(
  title: "แนะนำจำนวนเชิงซ้อน",
  sections: [
    ContentSection(
      headerL1: "จำนวนเชิงซ้อน",
      blocks: [
        ContentBlock("c1", "text", {"content": r"จำนวนเชิงซ้อน z = a + bi โดย i² = -1"}),
        ContentBlock("c2", "text", {"content": r"a เรียกว่าส่วนจริง, b เรียกว่าส่วนจินตภาพ"}),
        ContentBlock("q1", "question_choice", {
          "content": r"i² เท่ากับ",
          "options": ["-1", "0", "1"],
          "correct": "-1",
        }),
      ],
    ),
  ],
);

final complexOperationsLesson = ContentLesson(
  title: "การดำเนินการ",
  sections: [
    ContentSection(
      headerL1: "บวก ลบ คูณ หาร",
      blocks: [
        ContentBlock("co1", "text", {"content": r"(a+bi) + (c+di) = (a+c) + (b+d)i"}),
        ContentBlock("co2", "text", {"content": r"(a+bi)(c+di) = (ac-bd) + (ad+bc)i"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"(2+3i) + (1+4i) = {{BOX}}",
          "correct": "3+7i",
        }),
      ],
    ),
  ],
);

final complexPolarLesson = ContentLesson(
  title: "รูปเชิงขั้ว",
  sections: [
    ContentSection(
      headerL1: "รูปเชิงขั้ว",
      blocks: [
        ContentBlock("cp1", "text", {"content": r"z = r(cos θ + i sin θ) = r·cis(θ)"}),
        ContentBlock("cp2", "text", {"content": r"r = |z| = √(a² + b²)"}),
        ContentBlock("q1", "question_choice", {
          "content": r"|3+4i| เท่ากับ",
          "options": ["5", "7", "25"],
          "correct": "5",
        }),
      ],
    ),
  ],
);

final complexDemoivreLesson = ContentLesson(
  title: "ทฤษฎีบทเดอมัวฟร์",
  sections: [
    ContentSection(
      headerL1: "De Moivre's Theorem",
      blocks: [
        ContentBlock("cd1", "text", {"content": r"[r·cis(θ)]ⁿ = rⁿ·cis(nθ)"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"[cis(30°)]² = cis({{BOX}}°)",
          "correct": "60",
        }),
      ],
    ),
  ],
);