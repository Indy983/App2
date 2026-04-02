import '../../../ui/content_models.dart';

// === เซต (Sets) ===

final setIntroLesson = ContentLesson(
  title: "แนะนำเซต",
  sections: [
    ContentSection(
      headerL1: "เซตคืออะไร",
      blocks: [
        ContentBlock("s1", "text", {"content": r"เซตคือกลุ่มของวัตถุที่มีคุณสมบัติเหมือนกัน"}),
        ContentBlock("s2", "text", {"content": r"เขียนแทนด้วย A = {1, 2, 3}"}),
        ContentBlock("q1", "question_choice", {
          "content": r"เซต A = {1, 2, 3} มีสมาชิกกี่ตัว",
          "options": ["2", "3", "4"],
          "correct": "3",
        }),
// ======================================
// 1. SINGLE STEP (Backward Compatible)
// ======================================
ContentBlock("ddq_vec_type_1", "drag_and_drop", {
  "content": [
    "2 เวกเตอร์นี้ เป็น ", 
    {"drop": "0"}, 
    {"drop": "1"},
    " กัน"
  ],
  "draggableItems": [
    "เวกเตอร์ 0", 
    "เวกเตอร์กลับทิศ", 
    "เวกเตอร์ขนาน", 
    "ไม่เป็นทั้ง 3 อย่าง"
  ],
  "correctAnswers": {"0": "เวกเตอร์ขนาน"},
  "explanation": "เวกเตอร์ทั้งสองมีทิศทางเดียวกัน"
}),

// หรือใช้ format ใหม่แบบ steps (แนะนำ)
ContentBlock("ddq_vec_type_1", "drag_and_drop", {
  "steps": [
    {
      "questionId": "ddq_vec_type_1", // ใช้ parent ID ถ้า step เดียว
      "content": [
        "2 เวกเตอร์นี้ เป็น ", 
        {"drop": "0"}, 
        {"drop": "1"},
        " กัน"
      ],
      "draggableItems": ["เวกเตอร์ 0", "เวกเตอร์กลับทิศ", "เวกเตอร์ขนาน"],
      "correctAnswers": {"0": "เวกเตอร์ขนาน"},
      "explanation": "เวกเตอร์ทั้งสองมีทิศทางเดียวกัน"
    }
  ]
}),


// ======================================
// 2. MULTI-STEP (New Feature!)
// ======================================
ContentBlock("proof_derivative", "drag_and_drop", {
  "steps": [
    // ขั้นที่ 1
    {
      "questionId": "proof_derivative_step1",
      "content": [
        "ขั้นที่ 1: เขียน definition ของอนุพันธ์",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}",
        r"f'(x) = f(x+h) - f(x)",
        r"f'(x) = \frac{f(x+h)}{h}"
      ],
      "correctAnswers": {
        "0": r"f'(x) = \lim_{h \to 0} \frac{f(x+h)-f(x)}{h}"
      },
      "explanation": "นี่คือ definition ของอนุพันธ์จากหลักการ first principle"
    },
    
    // ขั้นที่ 2
    {
      "questionId": "proof_derivative_step2",
      "content": [
        "ขั้นที่ 2: แทนค่า f(x) = x^n",
        r"\lim_{h \to 0} ",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"\frac{(x+h)^n - x^n}{h}",
        r"\frac{(x+h)^n}{h}",
        r"(x+h)^n - x^n"
      ],
      "correctAnswers": {
        "0": r"\frac{(x+h)^n - x^n}{h}"
      },
      "explanation": "แทนค่า f(x) = x^n และ f(x+h) = (x+h)^n"
    },
    
    // ขั้นที่ 3
    {
      "questionId": "proof_derivative_step3",
      "content": [
        "ขั้นที่ 3: ใช้ binomial theorem แล้ว simplify",
        r"\lim_{h \to 0} \frac{nx^{n-1}h + ... + h^n}{h} = ",
        {"drop": "0"},
        r" เมื่อ h → 0 เทอมที่มี h กำลังสูงกว่าจะหายไป เหลือแค่ ",
        {"drop": "1"},
      ],
      "draggableItems": [
        r"nx^{n-1}",
        r"x^n",
        r"(n-1)x^{n-2}"
      ],
      "correctAnswers": {
        "0": r"nx^{n-1}",
        "1": r"เทอมที่มี h กำลังสูงกว่าจะหายไป"
      },
      "explanation": "เมื่อ h → 0 เทอมที่มี h กำลังสูงกว่าจะหายไป เหลือแค่ nx^{n-1}"
    }
  ]
}),


// ======================================
// 3. ตัวอย่างอื่นๆ
// ======================================

// พิสูจน์สูตรพีทาโกรัส
ContentBlock("pythagorean_proof", "drag_and_drop", {
  "steps": [
    {
      "questionId": "pyth_step1",
      "content": [
        "วาดสี่เหลี่ยมจัตุรัสด้านละ a+b แล้วใส่สามเหลี่ยมมุมฉาก 4 อัน",
        "พื้นที่รวม = ",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"(a+b)^2",
        r"a^2 + b^2",
        r"4 \cdot \frac{1}{2}ab"
      ],
      "correctAnswers": {"0": r"(a+b)^2"},
      "explanation": "พื้นที่สี่เหลี่ยมจัตุรัสด้าน a+b"
    },
    {
      "questionId": "pyth_step2",
      "content": [
        "พื้นที่รวม = พื้นที่สี่เหลี่ยมตรงกลาง + พื้นที่สามเหลี่ยม 4 อัน = ",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"c^2 + 4 \cdot \frac{1}{2}ab",
        r"c^2 + 2ab",
        r"c^2"
      ],
      "correctAnswers": {"0": r"c^2 + 4 \cdot \frac{1}{2}ab"},
      "explanation": "สี่เหลี่ยมตรงกลางมีด้าน c และมีสามเหลี่ยม 4 อัน"
    },
    {
      "questionId": "pyth_step3",
      "content": [
        r"(a+b)^2 = c^2 + 2ab",
        r"a^2 + 2ab + b^2 = c^2 + 2ab",
        "ดังนั้น ",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"a^2 + b^2 = c^2",
        r"a + b = c",
        r"ab = c^2"
      ],
      "correctAnswers": {"0": r"a^2 + b^2 = c^2"},
      "explanation": "ตัด 2ab ออกจากทั้งสองฝั่งได้สูตรพีทาโกรัส"
    }
  ]
}),
      ],
    ),
    ContentSection(
      headerL1: "ประเภทของเซต",
      blocks: [
        ContentBlock("s3", "text", {"content": r"เซตว่าง (Empty Set) คือเซตที่ไม่มีสมาชิก เขียนแทนด้วย ∅"}),
        ContentBlock("q2", "question_fill_in", {
          "content": r"เซตของจำนวนเต็มระหว่าง 1 ถึง 2 คือเซต {{BOX}}",
          "correct": "ว่าง",
        }),
      ],
    ),
  ],
);

final setOperationsLesson = ContentLesson(
  title: "การดำเนินการเซต",
  sections: [
    ContentSection(
      headerL1: "Union และ Intersection",
      blocks: [
        ContentBlock("so1", "text", {"content": r"Union (∪): รวมสมาชิกทั้งหมด"}),
        ContentBlock("so2", "text", {"content": r"Intersection (∩): สมาชิกร่วม"}),
        ContentBlock("q1", "question_choice", {
          "content": r"A = {1, 2} และ B = {2, 3} แล้ว A ∪ B คือ",
          "options": ["{1, 2, 3}", "{2}", "{1, 3}"],
          "correct": "{1, 2, 3}",
        }),
      ],
    ),
    ContentSection(
      headerL1: "Complement และ Difference",
      blocks: [
        ContentBlock("so3", "text", {"content": r"Complement (A'): สมาชิกที่ไม่อยู่ใน A"}),
        ContentBlock("so4", "text", {"content": r"Difference (A - B): อยู่ใน A แต่ไม่อยู่ใน B"}),
        ContentBlock("q2", "question_fill_in", {
          "content": r"A = {1, 2, 3} และ B = {2, 3, 4} แล้ว A - B = {{BOX}}",
          "correct": "{1}",
        }),
      ],
    ),
  ],
);

final setVennLesson = ContentLesson(
  title: "แผนภาพเวนน์",
  sections: [
    ContentSection(
      headerL1: "แผนภาพเวนน์",
      blocks: [
        ContentBlock("v1", "text", {"content": r"แผนภาพเวนน์แสดงความสัมพันธ์ระหว่างเซต"}),
        ContentBlock("v2", "image", {"path": "assets/venn_diagram.png"}),
        ContentBlock("q1", "question_choice", {
          "content": r"บริเวณที่ทับกันในแผนภาพเวนน์แทน",
          "options": ["Union", "Intersection", "Complement"],
          "correct": "Intersection",
        }),
      ],
    ),
  ],
);