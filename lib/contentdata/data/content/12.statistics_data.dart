import '../../../ui/content_models.dart';

// === สถิติ (Statistics) ===

final statIntroLesson = ContentLesson(
  title: "แนะนำสถิติ",
  sections: [
    ContentSection(
      headerL1: "สถิติเบื้องต้น",
      blocks: [
        ContentBlock("s1", "text", {"content": r"สถิติคือการเก็บรวบรวมและวิเคราะห์ข้อมูล"}),
        ContentBlock("s2", "text", {"content": r"ประชากร (Population) vs ตัวอย่าง (Sample)"}),
        ContentBlock("q1", "question_choice", {
          "content": r"การสำรวจนักเรียนทั้งโรงเรียนเป็นการศึกษา",
          "options": ["ประชากร", "ตัวอย่าง"],
          "correct": "ประชากร",
        }),
      ],
    ),
  ],
);

final statCentralLesson = ContentLesson(
  title: "ค่ากลาง",
  sections: [
    ContentSection(
      headerL1: "Mean, Median, Mode",
      blocks: [
        ContentBlock("sc1", "text", {"content": r"Mean (ค่าเฉลี่ย) = ผลรวม / จำนวน"}),
        ContentBlock("sc2", "text", {"content": r"Median (มัธยฐาน) = ค่ากลาง"}),
        ContentBlock("sc3", "text", {"content": r"Mode (ฐานนิยม) = ค่าที่ปรากฏบ่อยที่สุด"}),
        ContentBlock("q1", "question_fill_in", {
          "content": r"ค่าเฉลี่ยของ 2, 4, 6 = {{BOX}}",
          "correct": "4",
        }),
      ],
    ),
  ],
);

final statDispersionLesson = ContentLesson(
  title: "การกระจาย",
  sections: [
    ContentSection(
      headerL1: "Variance และ Standard Deviation",
      blocks: [
        ContentBlock("sd1", "text", {"content": r"ส่วนเบี่ยงเบนมาตรฐาน (σ) วัดการกระจายของข้อมูล"}),
        ContentBlock("sd2", "text", {"content": r"ความแปรปรวน (σ²) = ค่าเฉลี่ยของ (x - μ)²"}),
        ContentBlock("q1", "question_choice", {
          "content": r"ข้อมูลที่มี σ สูงหมายถึง",
          "options": ["กระจายมาก", "กระจายน้อย", "ไม่กระจาย"],
          "correct": "กระจายมาก",
        }),
      ],
    ),
  ],
);