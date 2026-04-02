import '../../../ui/content_models.dart';

// === เรขาคณิตวิเคราะห์ (Analytical Geometry) ===

final geometryCoordinateLesson = ContentLesson(
  title: "ระบบพิกัด",
  sections: [
    ContentSection(
      headerL1: "ระบบพิกัดคาร์ทีเซียน",
      blocks: [
        ContentBlock("gc1", "text", {"content": r"จุดบนระนาบแทนด้วย (x, y)"}),
        ContentBlock("gc2", "text", {"content": r"x เรียกว่า abscissa, y เรียกว่า ordinate"}),
        ContentBlock("q1", "question_choice", {
          "content": r"จุด (3, -2) อยู่ในจตุภาคที่",
          "options": ["I", "II", "IV"],
          "correct": "IV",
        }),
      ],
    ),
  ],
);

final geometryDistanceLesson = ContentLesson(
  title: "ระยะทางและจุดกึ่งกลาง",
  sections: [
    ContentSection(
      headerL1: "สูตรระยะทาง",
      blocks: [
        ContentBlock("gd1", "text", {"content": r"ระยะทางระหว่างสองจุด: d = √((x₂-x₁)² + (y₂-y₁)²)"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"ระยะทางระหว่าง (0,0) กับ (3,4) = {{BOX}}",
          "correct": "5",
        }),
      ],
    ),
    ContentSection(
      headerL1: "จุดกึ่งกลาง",
      blocks: [
        ContentBlock("gd2", "text", {"content": r"จุดกึ่งกลาง: M = ((x₁+x₂)/2, (y₁+y₂)/2)"}),
        ContentBlock("q2", "question_choice", {
          "content": r"จุดกึ่งกลางของ (2,4) กับ (6,8) คือ",
          "options": ["(4,6)", "(8,12)", "(4,4)"],
          "correct": "(4,6)",
        }),
      ],
    ),
  ],
);

final geometryLinesLesson = ContentLesson(
  title: "เส้นตรง",
  sections: [
    ContentSection(
      headerL1: "สมการเส้นตรง",
      blocks: [
        ContentBlock("gl1", "text", {"content": r"y = mx + c โดย m คือความชัน"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"เส้นตรง y = 2x + 3 มีความชัน {{BOX}}",
          "correct": "2",
        }),
      ],
    ),
  ],
);

final geometryCircleLesson = ContentLesson(
  title: "วงกลม",
  sections: [
    ContentSection(
      headerL1: "สมการวงกลม",
      blocks: [
        ContentBlock("gci1", "text", {"content": r"(x-h)² + (y-k)² = r² โดย (h,k) คือศูนย์กลาง"}),
        ContentBlock("q1", "question_choice", {
          "content": r"วงกลม x² + y² = 25 มีรัศมีเท่ากับ",
          "options": ["5", "10", "25"],
          "correct": "5",
        }),
      ],
    ),
  ],
);

final geometryParabolaLesson = ContentLesson(
  title: "พาราโบลา",
  sections: [
    ContentSection(
      headerL1: "สมการพาราโบลา",
      blocks: [
        ContentBlock("gp1", "text", {"content": r"y² = 4px หรือ x² = 4py"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"y² = 8x มีโฟกัสที่ ({{BOX}}, 0)",
          "correct": "2",
        }),
      ],
    ),
  ],
);

final geometryEllipseLesson = ContentLesson(
  title: "วงรี",
  sections: [
    ContentSection(
      headerL1: "สมการวงรี",
      blocks: [
        ContentBlock("ge1", "text", {"content": r"x²/a² + y²/b² = 1"}),
        ContentBlock("q1", "question_choice", {
          "content": r"x²/9 + y²/4 = 1 มีแกนเอกยาว",
          "options": ["3", "4", "6"],
          "correct": "6",
        }),
      ],
    ),
  ],
);

final geometryHyperbolaLesson = ContentLesson(
  title: "ไฮเพอร์โบลา",
  sections: [
    ContentSection(
      headerL1: "สมการไฮเพอร์โบลา",
      blocks: [
        ContentBlock("gh1", "text", {"content": r"x²/a² - y²/b² = 1 หรือ y²/a² - x²/b² = 1"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"x²/9 - y²/16 = 1 มีเส้นกำกับ y = ±{{BOX}}x",
          "correct": "4/3",
        }),
      ],
    ),
  ],
);