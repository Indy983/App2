import '../../../ui/content_models.dart';

// === ฟังก์ชันตรีโกณมิติและการประยุกต์ (Trigonometry) ===

final trigIntroLesson = ContentLesson(
  title: "แนะนำตรีโกณมิติ",
  sections: [
    ContentSection(
      headerL1: "ตรีโกณมิติในสามเหลี่ยมมุมฉาก",
      blocks: [
        ContentBlock("t1", "text", {"content": r"ตรีโกณมิติศึกษาความสัมพันธ์ระหว่างมุมกับด้าน"}),
        ContentBlock("t2", "image", {"path": "assets/right_triangle.png"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ในสามเหลี่ยมมุมฉาก มุมทั้งหมดรวมกันเท่ากับ",
          "options": ["90°", "180°", "360°"],
          "correct": "180°",
        }),
      ],
    ),
  ],
);

final trigRatiosLesson = ContentLesson(
  title: "อัตราส่วนตรีโกณมิติ",
  sections: [
    ContentSection(
      headerL1: "sin, cos, tan",
      blocks: [
        ContentBlock("tr1", "text", {"content": r"sin(θ) = ตรงข้าม/ด้านตรง"}),
        ContentBlock("tr2", "text", {"content": r"cos(θ) = ประชิด/ด้านตรง"}),
        ContentBlock("tr3", "text", {"content": r"tan(θ) = ตรงข้าม/ประชิด"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"sin(30°) = {{BOX}}",
          "correct": "1/2",
        }),
      ],
    ),
    ContentSection(
      headerL1: "อัตราส่วนอื่นๆ",
      blocks: [
        ContentBlock("tr4", "text", {"content": r"csc(θ) = 1/sin(θ)"}),
        ContentBlock("tr5", "text", {"content": r"sec(θ) = 1/cos(θ)"}),
        ContentBlock("tr6", "text", {"content": r"cot(θ) = 1/tan(θ)"}),
        ContentBlock("q2", "question_choice", {
          "content": r"cos(60°) เท่ากับ",
          "options": ["1/2", "√3/2", "1"],
          "correct": "1/2",
        }),
      ],
    ),
  ],
);

final trigIdentitiesLesson = ContentLesson(
  title: "เอกลักษณ์ตรีโกณมิติ",
  sections: [
    ContentSection(
      headerL1: "เอกลักษณ์พื้นฐาน",
      blocks: [
        ContentBlock("ti1", "text", {"content": r"sin²(θ) + cos²(θ) = 1"}),
        ContentBlock("ti2", "text", {"content": r"1 + tan²(θ) = sec²(θ)"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"ถ้า sin(θ) = 3/5 แล้ว cos²(θ) = {{BOX}}",
          "correct": "16/25",
        }),
      ],
    ),
  ],
);

final trigGraphsLesson = ContentLesson(
  title: "กราฟฟังก์ชันตรีโกณมิติ",
  sections: [
    ContentSection(
      headerL1: "กราฟ sin และ cos",
      blocks: [
        ContentBlock("tg1", "text", {"content": r"กราฟ sin และ cos เป็นคลื่น"}),
        ContentBlock("tg2", "text", {"content": r"คาบของ sin(x) และ cos(x) คือ 2π"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ค่าสูงสุดของ sin(x) คือ",
          "options": ["0", "1", "π"],
          "correct": "1",
        }),
      ],
    ),
  ],
);

final trigEquationsLesson = ContentLesson(
  title: "สมการตรีโกณมิติ",
  sections: [
    ContentSection(
      headerL1: "แก้สมการตรีโกณมิติ",
      blocks: [
        ContentBlock("te1", "text", {"content": r"ใช้เอกลักษณ์และมุมอ้างอิง"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"sin(x) = 1 แก้ได้ x = {{BOX}}° (0° ≤ x < 360°)",
          "correct": "90",
        }),
      ],
    ),
  ],
);