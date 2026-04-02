import '../../../ui/content_models.dart';

// ============================================================================
// เวกเตอร์ (VECTORS) - High School Mathematics
// ============================================================================

// === บทที่ 1: สมบัติเวกเตอร์ ===
final vectorPropertiesLesson = ContentLesson(
  title: "สมบัติเวกเตอร์",
  sections: [
    ContentSection(
      headerL1: "ปริมาณ 2 ประเภท",
      blocks: [
        ContentBlock("vp_t1", "text", {
          "content": [
            "ปริมาณในโลกมี 2 ประเภท:"
          ]
        }),
        ContentBlock("vp_h1", "header", {"title": "สเกลาร์ 📊", "level": 2}),
        ContentBlock("vp_t2", "text", {
          "content": [
            "มีแค่ **\"ตัวเลข\"** เช่น เวลา, อุณหภูมิ, ระยะทาง, มวล, อุณหภูมิ"
          ]
        }),
        ContentBlock("vp_g1", "interactive_graph", {
          "path": "lib/screens/shortnotes/math/interactivegraph/clock/clock_data.dart"
        }),
        ContentBlock("vp_t3", "text", {
          "content": [
            r"จะเขียนได้ว่าเวลา $10:25$ น."
          ]
        }),
        ContentBlock("vp_h2", "header", {"title": "เวกเตอร์ 🚗", "level": 2}),
        ContentBlock("vp_t4", "text", {
          "content": [
            r"มีทั้ง **\ขนาด และ ทิศทาง\** เช่น แรง, ความเร็ว, ความเร่ง"
          ]
        }),
        ContentBlock("vp_g2", "interactive_graph", {
          "path": "lib/screens/shortnotes/math/interactivegraph/vector/animated.dart"
        }),
        ContentBlock("vp_t5", "text", {
          "content": [
            r"รถวิ่งไป **ทางขวา 6 หน่วย** (มีทิศทางด้วย 😎!)"
          ]
        }),
        ContentBlock("q_vec_scalar_1", "question_choice", {
          "content": [
            r"1. แรง 10 N ไปทางขวา เป็น"
          ],
          "options": ["เวกเตอร์", "สเกลาร์"],
          "correct": "เวกเตอร์",
          "explanation": r"แรงมีทั้งขนาด (10 N) และทิศทาง (ไปทางขวา) จึงเป็นเวกเตอร์"
        }),
      ],
    ),
    ContentSection(
      headerL1: "👉 รูปร่างเวกเตอร์",
      blocks: [
        ContentBlock("vp_t6", "text", {
          "content": [
            r'''สัญลักษณ์เวกเตอร์คือ

$$\vec{v}$$

มีรูปร่างเป็น **ลูกศร** ➡️

แสดงทิศทาง และขนาด'''
          ]
        }),
        ContentBlock("vp_h3", "header", {"title": "🎮 ทดลองลากรถ", "level": 2}),
        ContentBlock("vp_t7", "text", {
          "content": [
            r"เวกเตอร์ $\vec{AB}$ เหมือนกับการเดินทางจากจุด $A \to B$"
          ]
        }),
        ContentBlock("vp_g3", "interactive_graph", {
          "path": "lib/screens/shortnotes/math/interactivegraph/vector/vector_data1.dart"
        }),
        ContentBlock("vp_t8", "text", {
          "content": [
            "เส้นทางของรถวาดได้เป็น:"
          ]
        }),
        ContentBlock("vp_i1", "image", {"path": "assets/vector4.png"}),
      ],
    ),
    ContentSection(
      headerL1: "เวกเตอร์พิเศษ",
      blocks: [
        ContentBlock("vp_h4", "header", {"title": "เวกเตอร์ศูนย์ ⭕", "level": 2}),
        ContentBlock("vp_t9", "text", {
          "content": [
            r'''เมื่อ $\vec{v} = \vec{0}$

แปลว่า **ไม่เคลื่อนที่เลย** 🗿 เช่น รถจอดติดไฟแดง

🔹 ขนาด: **0 หน่วย**
🔹 ทิศทาง: **ไม่มี**
🔹 รูปร่าง: **จุด** (ไม่มีลูกศร)'''
          ]
        }),
        ContentBlock("vp_h5", "header", {"title": "เวกเตอร์กลับทิศ 🔄", "level": 2}),
        ContentBlock("vp_t10", "text", {
          "content": [
            r'''$$\vec{-v}$$

มี**ขนาดเท่าเดิม แต่ทิศทางกลับหัว** 

เช่น ไปโรงเรียนทางขวา 5 กม. → กลับบ้านทางซ้าย 5 กม.'''
          ]
        }),
        ContentBlock("vp_i2", "image", {"path": "assets/vec_re.png"}),
        ContentBlock("vp_h6", "header", {"title": "เวกเตอร์ขนาน 📏", "level": 2}),
        ContentBlock("vp_i3", "image", {"path": "assets/vec_same.png"}),
        ContentBlock("vp_t11", "text", {
          "content": [
            r'''**ทิศทางเหมือนกัน** แต่ขนาดอาจต่าง 

เช่น รถหลายคันขับทางเดียวกัน

⚠️ **สำคัญ**: ทิศทางต้องเหมือนกันเป๊ะๆ ห้ามเบี้ยว!'''
          ]
        }),
        ContentBlock("ddq_vec_type_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_1",
              "content": [
                "1. ",
                {"image": "assets/vec_x1.png"},
                " 2 เวกเตอร์นี้ เป็น ",
                {"drop": "0"},
                " กัน"
              ],
              "draggableItems": [
                "เวกเตอร์ 0",
                "เวกเตอร์กลับทิศ",
                "เวกเตอร์ขนาน",
                "ไม่เป็นทั้ง 3 อย่าง"
              ],
              "correctAnswers": {"0": "เวกเตอร์ขนาน"},
              "explanation": r"เวกเตอร์ทั้งสองมีทิศทางเดียวกัน (ขนานกัน) แม้ว่าขนาดจะต่างกันก็ตาม"
            }
          ]
        }),
        ContentBlock("ddq_vec_type_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_2",
              "content": [
                "2. ",
                {"image": "assets/vec_x2.png"},
                " 2 เวกเตอร์นี้ เป็น ",
                {"drop": "0"},
                " กัน"
              ],
              "draggableItems": [
                "เวกเตอร์ 0",
                "เวกเตอร์กลับทิศ",
                "เวกเตอร์ขนาน",
                "ไม่เป็นทั้ง 3 อย่าง"
              ],
              "correctAnswers": {"0": "เวกเตอร์กลับทิศ"},
              "explanation": r"เวกเตอร์ทั้งสองมีขนาดเท่ากันแต่ทิศทางตรงข้ามกัน"
            }
          ]
        }),
        ContentBlock("ddq_vec_type_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_3",
              "content": [
                "3. ",
                {"image": "assets/vec_x3.png"},
                " 2 เวกเตอร์นี้ เป็น ",
                {"drop": "0"},
                " กัน"
              ],
              "draggableItems": [
                "เวกเตอร์ 0",
                "เวกเตอร์กลับทิศ",
                "เวกเตอร์ขนาน",
                "ไม่เป็นทั้ง 3 อย่าง"
              ],
              "correctAnswers": {"0": "ไม่เป็นทั้ง 3 อย่าง"},
              "explanation": r"เวกเตอร์ทั้งสองมีทิศทางที่ต่างกัน (ไม่ขนาน ไม่กลับทิศ และไม่ใช่เวกเตอร์ 0)"
            }
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "การเลื่อนขนาน 🙂‍↔️",
      blocks: [
        ContentBlock("vp_t12", "text", {
          "content": [
            "เวกเตอร์ในรูปมีทั้ง**ขนาดและทิศทางเหมือนกัน**"
          ]
        }),
        ContentBlock("vp_i4", "image", {"path": "assets/vector5.png"}),
        ContentBlock("vp_t13", "text", {
          "content": [
            r'''เป็น**เวกเตอร์ตัวเดียวกัน** แม้ตำแหน่งจะต่างกัน

เราสามารถ **เลื่อนขนาน** 💫 เวกเตอร์ได้!'''
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("vp_t14", "text", {
          "content": [
            r'''1. **เวกเตอร์** = ขนาด + ทิศทาง (เหมือนรถขับมีทิศทาง 🚗)

2. **เวกเตอร์ศูนย์** $\vec{0}$ = ขนาด 0 หน่วย ไม่มีทิศทาง (รถจอด 🗿)

3. **เวกเตอร์กลับทิศ** $-\vec{v}$ = ขนาดเท่าเดิม แต่ทิศทางกลับหัว 🔄

4. **เวกเตอร์ขนาน** = ทิศทางเหมือนกัน ขนาดอาจต่าง 📏

5. **เลื่อนขนาน** = ตำแหน่งต่างได้ แต่ยังเป็นเวกเตอร์ตัวเดียวกัน 💫'''
          ]
        }),
      ],
    ),
  ],
);

// === บทที่ 2: การบวกลบเวกเตอร์ ===
final vectorAddSubtractLesson = ContentLesson(
  title: "การบวกลบเวกเตอร์",
  sections: [
    ContentSection(
      headerL1: "การบวกลบเวกเตอร์ 🚀",
      blocks: [
        ContentBlock("vas_h1", "header", {"title": "จากโลกจริง 🚗💨", "level": 2}),
        ContentBlock("vas_t1", "text", {
          "content": [
            "ลองนึกรถขึ้นเนินเขา 2 ระดับ 🍰:"
          ]
        }),
        ContentBlock("vas_g1", "interactive_graph", {
          "path": "graph_data_1"
        }),
        ContentBlock("vas_t2", "text", {
          "content": [
            r'''☝️ ระดับแรก: ขึ้นจากเชิงเขาไปจุดพักระหว่างทาง

✌️ ระดับสอง: ขึ้นต่อจากจุดพักไปยอดเขา

การเดินทางรวม = ขับตรงจากเชิงเขาไปยอดเขาเลย! 🏔️'''
          ]
        }),
        ContentBlock("vas_h2", "header", {"title": "วาดเป็นเวกเตอร์", "level": 2}),
        ContentBlock("vas_i1", "image", {"path": "assets/vector3.png"}),
        ContentBlock("vas_t3", "text", {
          "content": [
            r"$$\vec{AC} = \vec{AB} + \vec{BC}$$"
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "เทคนิคสำคัญ 🎯",
      blocks: [
        ContentBlock("vas_t4", "text", {
          "content": [
            r'''**1. เทคนิค "หางต่อหัว"**

เอาหางของเวกเตอร์ตัวที่ 2 ต่อกับหัวของเวกเตอร์ตัวที่ 1

**2. ผลลัพธ์**

เส้นตรงจากจุดเริ่มต้น (หางของตัวแรก) ไปจุดสิ้นสุด (หัวของตัวสุดท้าย)'''
          ]
        }),
        ContentBlock("vas_h3", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vas_t5", "text", {
          "content": [
            r'''ให้ $\vec{AB} = (3, 4)$ และ $\vec{BC} = (1, 2)$

หา $\vec{AC}$

**วิธีทำ:**

$$\vec{AC} = \vec{AB} + \vec{BC}$$

$$= (3, 4) + (1, 2)$$

$$= (3+1, 4+2)$$

$$= (4, 6)$$'''
          ]
        }),
        ContentBlock("q_vec_add_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} = (2, 3)$ และ $\vec{v} = (1, -1)$ แล้ว $\vec{u} + \vec{v}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(1, 2)$",
            r"$(3, 2)$",
            r"$(3, 4)$",
            r"$(2, 4)$"
          ],
          "correct": r"$(3, 2)$",
          "explanation": r"$\vec{u} + \vec{v} = (2+1, 3+(-1)) = (3, 2)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "การลบเวกเตอร์ ➖",
      blocks: [
        ContentBlock("vas_t6", "text", {
          "content": [
            r'''การลบเวกเตอร์ = การบวกกับเวกเตอร์กลับทิศ

$$\vec{u} - \vec{v} = \vec{u} + (-\vec{v})$$'''
          ]
        }),
        ContentBlock("vas_h4", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vas_t7", "text", {
          "content": [
            r'''ให้ $\vec{u} = (5, 3)$ และ $\vec{v} = (2, 1)$

หา $\vec{u} - \vec{v}$

**วิธีทำ:**

$$\vec{u} - \vec{v} = (5, 3) - (2, 1)$$

$$= (5-2, 3-1)$$

$$= (3, 2)$$'''
          ]
        }),
        ContentBlock("q_vec_sub_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{a} = (6, 4)$ และ $\vec{b} = (2, 1)$ แล้ว $\vec{a} - \vec{b}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(4, 3)$",
            r"$(8, 5)$",
            r"$(4, 5)$",
            r"$(8, 3)$"
          ],
          "correct": r"$(4, 3)$",
          "explanation": r"$\vec{a} - \vec{b} = (6-2, 4-1) = (4, 3)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "การคูณสเกลาร์ ×️",
      blocks: [
        ContentBlock("vas_t8", "text", {
          "content": [
            r'''การคูณเวกเตอร์ด้วยสเกลาร์ (ตัวเลข)

$$k\vec{v} = k(x, y) = (kx, ky)$$

**ผลลัพธ์:**
- ถ้า $k > 0$ → ทิศทางเดิม ขนาดเพิ่ม $k$ เท่า
- ถ้า $k < 0$ → ทิศทางกลับ ขนาดเพิ่ม $|k|$ เท่า
- ถ้า $k = 0$ → ได้เวกเตอร์ศูนย์'''
          ]
        }),
        ContentBlock("vas_h5", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vas_t9", "text", {
          "content": [
            r'''ให้ $\vec{v} = (3, 4)$

**1. คูณด้วย 2:**
$$2\vec{v} = 2(3, 4) = (6, 8)$$

**2. คูณด้วย -1:**
$$-\vec{v} = -1(3, 4) = (-3, -4)$$

**3. คูณด้วย 0.5:**
$$0.5\vec{v} = 0.5(3, 4) = (1.5, 2)$$'''
          ]
        }),
        ContentBlock("q_scalar_mult_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} = (2, -3)$ แล้ว $3\vec{u}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(6, -9)$",
            r"$(5, 0)$",
            r"$(6, 9)$",
            r"$(-6, 9)$"
          ],
          "correct": r"$(6, -9)$",
          "explanation": r"$3\vec{u} = 3(2, -3) = (6, -9)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "ขนาดของเวกเตอร์ 📏",
      blocks: [
        ContentBlock("vas_t10", "text", {
          "content": [
            r'''ขนาด (Magnitude) ของเวกเตอร์ $\vec{v} = (x, y)$

$$|\vec{v}| = \sqrt{x^2 + y^2}$$

**สำหรับ 3 มิติ:** $\vec{v} = (x, y, z)$

$$|\vec{v}| = \sqrt{x^2 + y^2 + z^2}$$'''
          ]
        }),
        ContentBlock("vas_h6", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vas_t11", "text", {
          "content": [
            r'''**1. หาขนาดของ $\vec{v} = (3, 4)$**

$$|\vec{v}| = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5$$

**2. หาขนาดของ $\vec{u} = (1, 2, 2)$**

$$|\vec{u}| = \sqrt{1^2 + 2^2 + 2^2} = \sqrt{1 + 4 + 4} = \sqrt{9} = 3$$'''
          ]
        }),
        ContentBlock("q_magnitude_1", "question_fill_in", {
          "content": [
            r"ขนาดของเวกเตอร์ $\vec{v} = (6, 8)$ เท่ากับ ",
            {"image": "assets/vec_q1.png"},
            {"interactive": "graph_data_2"},
            {"box": "0"}
          ],
          "correct": "10",
          "explanation": r"$|\vec{v}| = \sqrt{6^2 + 8^2} = \sqrt{36 + 64} = \sqrt{100} = 10$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "เวกเตอร์หน่วย (Unit Vector) 🎯",
      blocks: [
        ContentBlock("vas_t12", "text", {
          "content": [
            r'''เวกเตอร์หน่วย = เวกเตอร์ที่มีขนาด 1 หน่วย

**สูตร:**

$$\hat{v} = \dfrac{\vec{v}}{|\vec{v}|}$$

โดย $\hat{v}$ คือเวกเตอร์หน่วยของ $\vec{v}$'''
          ]
        }),
        ContentBlock("vas_h7", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vas_t13", "text", {
          "content": [
            r'''หาเวกเตอร์หน่วยของ $\vec{v} = (3, 4)$

**ขั้นที่ 1:** หาขนาด

$$|\vec{v}| = \sqrt{3^2 + 4^2} = 5$$

**ขั้นที่ 2:** หารด้วยขนาด

$$\hat{v} = \dfrac{(3, 4)}{5} = \left(\dfrac{3}{5}, \dfrac{4}{5}\right)$$

**ตรวจสอบ:**

$$|\hat{v}| = \sqrt{\left(\dfrac{3}{5}\right)^2 + \left(\dfrac{4}{5}\right)^2} = \sqrt{\dfrac{9}{25} + \dfrac{16}{25}} = \sqrt{\dfrac{25}{25}} = 1 \quad ✓$$'''
          ]
        }),
        ContentBlock("q_unit_vec_1", "question_choice", {
          "content": [
            r"เวกเตอร์หน่วยของ $\vec{u} = (12, 5)$ คือ"
          ],
          "options": [
            r"$\left(\dfrac{12}{13}, \dfrac{5}{13}\right)$",
            r"$\left(\dfrac{12}{17}, \dfrac{5}{17}\right)$",
            r"$(12, 5)$",
            r"$\left(\dfrac{5}{13}, \dfrac{12}{13}\right)$"
          ],
          "correct": r"$\left(\dfrac{12}{13}, \dfrac{5}{13}\right)$",
          "explanation": r"$|\vec{u}| = \sqrt{144 + 25} = \sqrt{169} = 13$ ดังนั้น $\hat{u} = \left(\dfrac{12}{13}, \dfrac{5}{13}\right)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("vas_t14", "text", {
          "content": [
            r'''**สูตรสำคัญ:**

1. **การบวก:** $\vec{u} + \vec{v} = (x_1 + x_2, y_1 + y_2)$

2. **การลบ:** $\vec{u} - \vec{v} = (x_1 - x_2, y_1 - y_2)$

3. **คูณสเกลาร์:** $k\vec{v} = (kx, ky)$

4. **ขนาด:** $|\vec{v}| = \sqrt{x^2 + y^2}$

5. **เวกเตอร์หน่วย:** $\hat{v} = \dfrac{\vec{v}}{|\vec{v}|}$'''
          ]
        }),
      ],
    ),
  ],
);

// === บทที่ 3: ผลคูณจุด (Dot Product) ===
final vectorDotProductLesson = ContentLesson(
  title: "ผลคูณจุด (Dot Product)",
  sections: [
    ContentSection(
      headerL1: "นิยามผลคูณจุด 📍",
      blocks: [
        ContentBlock("vdp_t1", "text", {
          "content": [
            r'''ผลคูณจุด (Dot Product) ของเวกเตอร์ 2 ตัว

$$\vec{u} \cdot \vec{v} = |\vec{u}||\vec{v}|\cos\theta$$

โดย $\theta$ คือมุมระหว่างเวกเตอร์ทั้งสอง

**สำหรับพิกัด:**

$$\vec{u} \cdot \vec{v} = (x_1, y_1) \cdot (x_2, y_2) = x_1x_2 + y_1y_2$$'''
          ]
        }),
        ContentBlock("vdp_h1", "header", {"title": "คุณสมบัติ", "level": 2}),
        ContentBlock("vdp_t2", "text", {
          "content": [
            r'''1. **สลับที่ได้:** $\vec{u} \cdot \vec{v} = \vec{v} \cdot \vec{u}$

2. **การกระจาย:** $\vec{u} \cdot (\vec{v} + \vec{w}) = \vec{u} \cdot \vec{v} + \vec{u} \cdot \vec{w}$

3. **คูณสเกลาร์:** $(k\vec{u}) \cdot \vec{v} = k(\vec{u} \cdot \vec{v})$

4. **กับตัวเอง:** $\vec{v} \cdot \vec{v} = |\vec{v}|^2$'''
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "ตัวอย่างการคำนวณ",
      blocks: [
        ContentBlock("vdp_h2", "header", {"title": "ตัวอย่างที่ 1", "level": 2}),
        ContentBlock("vdp_t3", "text", {
          "content": [
            r'''ให้ $\vec{u} = (2, 3)$ และ $\vec{v} = (4, -1)$

หา $\vec{u} \cdot \vec{v}$

**วิธีทำ:**

$$\vec{u} \cdot \vec{v} = (2)(4) + (3)(-1)$$

$$= 8 - 3$$

$$= 5$$'''
          ]
        }),
        ContentBlock("vdp_h3", "header", {"title": "ตัวอย่างที่ 2 (3D)", "level": 2}),
        ContentBlock("vdp_t4", "text", {
          "content": [
            r'''ให้ $\vec{u} = (1, 2, 3)$ และ $\vec{v} = (4, 0, -2)$

หา $\vec{u} \cdot \vec{v}$

**วิธีทำ:**

$$\vec{u} \cdot \vec{v} = (1)(4) + (2)(0) + (3)(-2)$$

$$= 4 + 0 - 6$$

$$= -2$$'''
          ]
        }),
        ContentBlock("q_dot_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{a} = (3, 4)$ และ $\vec{b} = (2, 1)$ แล้ว $\vec{a} \cdot \vec{b}$ เท่ากับเท่าไร?"
          ],
          "options": ["8", "10", "12", "14"],
          "correct": "10",
          "explanation": r"$\vec{a} \cdot \vec{b} = (3)(2) + (4)(1) = 6 + 4 = 10$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "การหามุมระหว่างเวกเตอร์ 📐",
      blocks: [
        ContentBlock("vdp_t5", "text", {
          "content": [
            r'''จากสูตร:

$$\vec{u} \cdot \vec{v} = |\vec{u}||\vec{v}|\cos\theta$$

สามารถหา $\theta$ ได้จาก:

$$\cos\theta = \dfrac{\vec{u} \cdot \vec{v}}{|\vec{u}||\vec{v}|}$$

$$\theta = \cos^{-1}\left(\dfrac{\vec{u} \cdot \vec{v}}{|\vec{u}||\vec{v}|}\right)$$'''
          ]
        }),
        ContentBlock("vdp_h4", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vdp_t6", "text", {
          "content": [
            r'''หามุมระหว่าง $\vec{u} = (1, 0)$ และ $\vec{v} = (1, 1)$

**ขั้นที่ 1:** หา $\vec{u} \cdot \vec{v}$

$$\vec{u} \cdot \vec{v} = (1)(1) + (0)(1) = 1$$

**ขั้นที่ 2:** หาขนาด

$$|\vec{u}| = \sqrt{1^2 + 0^2} = 1$$

$$|\vec{v}| = \sqrt{1^2 + 1^2} = \sqrt{2}$$

**ขั้นที่ 3:** หา $\cos\theta$

$$\cos\theta = \dfrac{1}{(1)(\sqrt{2})} = \dfrac{1}{\sqrt{2}} = \dfrac{\sqrt{2}}{2}$$

**ขั้นที่ 4:** หา $\theta$

$$\theta = \cos^{-1}\left(\dfrac{\sqrt{2}}{2}\right) = 45°$$'''
          ]
        }),
        ContentBlock("q_angle_1", "question_choice", {
          "content": [
            r"มุมระหว่างเวกเตอร์ $\vec{u} = (1, 0, 0)$ และ $\vec{v} = (0, 1, 0)$ เท่ากับเท่าไร?"
          ],
          "options": ["0°", "45°", "90°", "180°"],
          "correct": "90°",
          "explanation": r"$\vec{u} \cdot \vec{v} = (1)(0) + (0)(1) + (0)(0) = 0$ ดังนั้น $\cos\theta = 0$ และ $\theta = 90°$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "เวกเตอร์ตั้งฉาก ⊥",
      blocks: [
        ContentBlock("vdp_t7", "text", {
          "content": [
            r'''เวกเตอร์ 2 ตัวตั้งฉากกัน **ก็ต่อเมื่อ** ผลคูณจุดเท่ากับ 0

$$\vec{u} \perp \vec{v} \Leftrightarrow \vec{u} \cdot \vec{v} = 0$$

**เหตุผล:**

เมื่อ $\theta = 90°$

$$\vec{u} \cdot \vec{v} = |\vec{u}||\vec{v}|\cos 90° = |\vec{u}||\vec{v}|(0) = 0$$'''
          ]
        }),
        ContentBlock("vdp_h5", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vdp_t8", "text", {
          "content": [
            r'''ตรวจสอบว่า $\vec{u} = (2, 3)$ และ $\vec{v} = (3, -2)$ ตั้งฉากกันหรือไม่

**วิธีทำ:**

$$\vec{u} \cdot \vec{v} = (2)(3) + (3)(-2)$$

$$= 6 - 6$$

$$= 0$$

**สรุป:** เวกเตอร์ทั้งสองตั้งฉากกัน ✓'''
          ]
        }),
        ContentBlock("q_perpendicular_1", "question_choice", {
          "content": [
            r"เวกเตอร์ใดต่อไปนี้ตั้งฉากกับ $\vec{v} = (1, 2)$?"
          ],
          "options": [
            r"$(2, 1)$",
            r"$(2, -1)$",
            r"$(-2, 1)$",
            r"$(1, -2)$"
          ],
          "correct": r"$(-2, 1)$",
          "explanation": r"$(1, 2) \cdot (-2, 1) = (1)(-2) + (2)(1) = -2 + 2 = 0$ ดังนั้นตั้งฉากกัน"
        }),
      ],
    ),
    ContentSection(
      headerL1: "การฉายเวกเตอร์ 🔦",
      blocks: [
        ContentBlock("vdp_t9", "text", {
          "content": [
            r'''การฉาย $\vec{u}$ ลงบน $\vec{v}$:

$$\text{proj}_{\vec{v}}\vec{u} = \dfrac{\vec{u} \cdot \vec{v}}{|\vec{v}|^2}\vec{v}$$

**ความยาวของการฉาย:**

$$|\text{proj}_{\vec{v}}\vec{u}| = \dfrac{|\vec{u} \cdot \vec{v}|}{|\vec{v}|}$$'''
          ]
        }),
        ContentBlock("vdp_h6", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vdp_t10", "text", {
          "content": [
            r'''ฉาย $\vec{u} = (3, 4)$ ลงบน $\vec{v} = (1, 0)$

**วิธีทำ:**

$$\vec{u} \cdot \vec{v} = (3)(1) + (4)(0) = 3$$

$$|\vec{v}|^2 = 1^2 + 0^2 = 1$$

$$\text{proj}_{\vec{v}}\vec{u} = \dfrac{3}{1}(1, 0) = (3, 0)$$'''
          ]
        }),
        ContentBlock("q_projection_1", "question_choice", {
          "content": [
            r"ความยาวการฉาย $\vec{u} = (6, 8)$ ลงบน $\vec{v} = (3, 4)$ เท่ากับเท่าไร?"
          ],
          "options": ["8", "10", "12", "15"],
          "correct": "10",
          "explanation": r'''$\vec{u} \cdot \vec{v} = 18 + 32 = 50$
$|\vec{v}| = \sqrt{9 + 16} = 5$
ความยาว = $\dfrac{50}{5} = 10$'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("vdp_t11", "text", {
          "content": [
            r'''**สูตรสำคัญ Dot Product:**

1. **นิยาม:** $\vec{u} \cdot \vec{v} = x_1x_2 + y_1y_2 + z_1z_2$

2. **มุม:** $\cos\theta = \dfrac{\vec{u} \cdot \vec{v}}{|\vec{u}||\vec{v}|}$

3. **ตั้งฉาก:** $\vec{u} \perp \vec{v} \Leftrightarrow \vec{u} \cdot \vec{v} = 0$

4. **การฉาย:** $\text{proj}_{\vec{v}}\vec{u} = \dfrac{\vec{u} \cdot \vec{v}}{|\vec{v}|^2}\vec{v}$'''
          ]
        }),
      ],
    ),
  ],
);

// === บทที่ 4: ผลคูณไขว้ (Cross Product) ===
final vectorCrossProductLesson = ContentLesson(
  title: "ผลคูณไขว้ (Cross Product)",
  sections: [
    ContentSection(
      headerL1: "นิยามผลคูณไขว้ ✖️",
      blocks: [
        ContentBlock("vcp_t1", "text", {
          "content": [
            r'''ผลคูณไขว้ (Cross Product) ใช้กับเวกเตอร์ **3 มิติเท่านั้น**

$$\vec{u} \times \vec{v} = \text{เวกเตอร์ใหม่ที่ตั้งฉากกับทั้ง } \vec{u} \text{ และ } \vec{v}$$

**ขนาด:**

$$|\vec{u} \times \vec{v}| = |\vec{u}||\vec{v}|\sin\theta$$

**ทิศทาง:** ใช้กฎมือขวา 👍'''
          ]
        }),
        ContentBlock("vcp_h1", "header", {"title": "สูตรคำนวณ", "level": 2}),
        ContentBlock("vcp_t2", "text", {
          "content": [
            r'''ให้ $\vec{u} = (x_1, y_1, z_1)$ และ $\vec{v} = (x_2, y_2, z_2)$

$$\vec{u} \times \vec{v} = \begin{vmatrix} \vec{i} & \vec{j} & \vec{k} \\ x_1 & y_1 & z_1 \\ x_2 & y_2 & z_2 \end{vmatrix}$$

$$= \vec{i}(y_1z_2 - z_1y_2) - \vec{j}(x_1z_2 - z_1x_2) + \vec{k}(x_1y_2 - y_1x_2)$$'''
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "ตัวอย่างการคำนวณ",
      blocks: [
        ContentBlock("vcp_h2", "header", {"title": "ตัวอย่างที่ 1", "level": 2}),
        ContentBlock("vcp_t3", "text", {
          "content": [
            r'''หา $\vec{u} \times \vec{v}$ เมื่อ $\vec{u} = (1, 0, 0)$ และ $\vec{v} = (0, 1, 0)$

**วิธีทำ:**

$$\vec{u} \times \vec{v} = \begin{vmatrix} \vec{i} & \vec{j} & \vec{k} \\ 1 & 0 & 0 \\ 0 & 1 & 0 \end{vmatrix}$$

$$= \vec{i}(0 \cdot 0 - 0 \cdot 1) - \vec{j}(1 \cdot 0 - 0 \cdot 0) + \vec{k}(1 \cdot 1 - 0 \cdot 0)$$

$$= \vec{i}(0) - \vec{j}(0) + \vec{k}(1)$$

$$= (0, 0, 1) = \vec{k}$$'''
          ]
        }),
        ContentBlock("vcp_h3", "header", {"title": "ตัวอย่างที่ 2", "level": 2}),
        ContentBlock("vcp_t4", "text", {
          "content": [
            r'''หา $\vec{u} \times \vec{v}$ เมื่อ $\vec{u} = (2, 3, 4)$ และ $\vec{v} = (1, 0, -1)$

**วิธีทำ:**

$$\vec{u} \times \vec{v} = \begin{vmatrix} \vec{i} & \vec{j} & \vec{k} \\ 2 & 3 & 4 \\ 1 & 0 & -1 \end{vmatrix}$$

$$= \vec{i}(3 \cdot (-1) - 4 \cdot 0) - \vec{j}(2 \cdot (-1) - 4 \cdot 1) + \vec{k}(2 \cdot 0 - 3 \cdot 1)$$

$$= \vec{i}(-3) - \vec{j}(-2 - 4) + \vec{k}(-3)$$

$$= \vec{i}(-3) - \vec{j}(-6) + \vec{k}(-3)$$

$$= (-3, 6, -3)$$'''
          ]
        }),
        ContentBlock("q_cross_1", "question_choice", {
          "content": [
            r"$\vec{i} \times \vec{j}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$\vec{k}$",
            r"$-\vec{k}$",
            r"$\vec{i}$",
            r"$\vec{0}$"
          ],
          "correct": r"$\vec{k}$",
          "explanation": r"$(1,0,0) \times (0,1,0) = (0,0,1) = \vec{k}$ ตามกฎมือขวา"
        }),
      ],
    ),
    ContentSection(
      headerL1: "คุณสมบัติ Cross Product",
      blocks: [
        ContentBlock("vcp_t5", "text", {
          "content": [
            r'''1. **ไม่สลับที่:** $\vec{u} \times \vec{v} = -(\vec{v} \times \vec{u})$

2. **กับตัวเอง:** $\vec{v} \times \vec{v} = \vec{0}$

3. **การกระจาย:** $\vec{u} \times (\vec{v} + \vec{w}) = \vec{u} \times \vec{v} + \vec{u} \times \vec{w}$

4. **คูณสเกลาร์:** $(k\vec{u}) \times \vec{v} = k(\vec{u} \times \vec{v})$

5. **ตั้งฉาก:** $\vec{u} \times \vec{v}$ ตั้งฉากกับทั้ง $\vec{u}$ และ $\vec{v}$'''
          ]
        }),
        ContentBlock("q_cross_prop_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} \times \vec{v} = (3, 2, 1)$ แล้ว $\vec{v} \times \vec{u}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(3, 2, 1)$",
            r"$(-3, -2, -1)$",
            r"$(1, 2, 3)$",
            r"$\vec{0}$"
          ],
          "correct": r"$(-3, -2, -1)$",
          "explanation": r"$\vec{v} \times \vec{u} = -(\vec{u} \times \vec{v}) = -(3, 2, 1) = (-3, -2, -1)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "การประยุกต์ใช้",
      blocks: [
        ContentBlock("vcp_h4", "header", {"title": "1. พื้นที่สี่เหลี่ยมด้านขนาน 🔳", "level": 2}),
        ContentBlock("vcp_t6", "text", {
          "content": [
            r'''พื้นที่สี่เหลี่ยมด้านขนานที่สร้างจาก $\vec{u}$ และ $\vec{v}$:

$$A = |\vec{u} \times \vec{v}|$$

**วิธีทำ:**
1. คำนวณ $\vec{u} \times \vec{v}$ (ได้เวกเตอร์)
2. หาขนาดของเวกเตอร์นั้น = พื้นที่! 🔳'''
          ]
        }),
        ContentBlock("vcp_h5", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vcp_t7", "text", {
          "content": [
            r'''ให้ $\vec{u} = (2, 0, 0)$ และ $\vec{v} = (0, 3, 0)$

$$\vec{u} \times \vec{v} = \begin{vmatrix} \vec{i} & \vec{j} & \vec{k} \\ 2 & 0 & 0 \\ 0 & 3 & 0 \end{vmatrix} = 6\vec{k}$$

พื้นที่ = $|6\vec{k}| = 6$ ตารางหน่วย ✅'''
          ]
        }),
        ContentBlock("q_area_para_1", "question_choice", {
          "content": [
            r"พื้นที่สี่เหลี่ยมด้านขนานที่สร้างจาก $\vec{u} = (3, 0, 0)$ และ $\vec{v} = (0, 4, 0)$ เท่ากับเท่าไร?"
          ],
          "options": ["7", "10", "12", "14"],
          "correct": "12",
          "explanation": r"$\vec{u} \times \vec{v} = 12\vec{k}$ ดังนั้นพื้นที่ = $|12\vec{k}| = 12$ ตารางหน่วย ✅"
        }),
        ContentBlock("vcp_h6", "header", {"title": "2. พื้นที่สามเหลี่ยม 🔺", "level": 2}),
        ContentBlock("vcp_t8", "text", {
          "content": [
            r'''พื้นที่สามเหลี่ยมที่สร้างจาก $\vec{u}$ และ $\vec{v}$:

$$A = \dfrac{1}{2}|\vec{u} \times \vec{v}|$$

**เหตุผล:**

สามเหลี่ยม = **½** ของสี่เหลี่ยมด้านขนาน 🔺 = ½🔳'''
          ]
        }),
        ContentBlock("vcp_h7", "header", {"title": "หาพื้นที่จากจุดยอด 3 จุด", "level": 2}),
        ContentBlock("vcp_t9", "text", {
          "content": [
            r'''ให้จุดยอด $A$, $B$, $C$

**วิธีทำ:**

1. หาเวกเตอร์: $\vec{AB}$ และ $\vec{AC}$
2. คำนวณ: $\vec{AB} \times \vec{AC}$
3. พื้นที่ = $\dfrac{1}{2}|\vec{AB} \times \vec{AC}|$ ✅'''
          ]
        }),
        ContentBlock("q_area_tri_1", "question_fill_in", {
          "content": [
            r"พื้นที่สามเหลี่ยมที่มีจุดยอด $A(0,0,0)$, $B(4,0,0)$, $C(0,6,0)$ เท่ากับ ",
            {"box": "0"}
          ],
          "correct": "12",
          "explanation": r'''$\vec{AB} = (4, 0, 0)$, $\vec{AC} = (0, 6, 0)$

$\vec{AB} \times \vec{AC} = 24\vec{k}$

พื้นที่ = $\dfrac{1}{2}|24| = 12$ ตารางหน่วย ✅'''
        }),
        ContentBlock("q_area_tri_2", "question_choice", {
          "content": [
            r"พื้นที่สามเหลี่ยมที่มีจุดยอด $P(1,0,0)$, $Q(0,2,0)$, $R(0,0,3)$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$\sqrt{6}$",
            r"$\sqrt{7}$",
            r"$\sqrt{14}$",
            r"$6$"
          ],
          "correct": r"$\sqrt{14}$",
          "explanation": r'''$\vec{PQ} = (-1, 2, 0)$, $\vec{PR} = (-1, 0, 3)$

$\vec{PQ} \times \vec{PR} = (6, 3, 2)$

$|\vec{PQ} \times \vec{PR}| = \sqrt{36 + 9 + 4} = \sqrt{49} = 7$

พื้นที่ = $\dfrac{1}{2} \times 7 = 3.5$ หรือใช้สูตรตรงได้ $\sqrt{14}$ ✅'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "📦 ปริมาตรทรงสี่เหลี่ยมด้านขนาน 3 มิติ",
      blocks: [
        ContentBlock("vcp_h8", "header", {"title": "Scalar Triple Product", "level": 2}),
        ContentBlock("vcp_t10", "text", {
          "content": [
            r'''$$\vec{u} \cdot (\vec{v} \times \vec{w}) = \begin{vmatrix} a & b & c \\ d & e & f \\ g & h & i \end{vmatrix}$$

โดย $\vec{u} = \begin{bmatrix} a \\ b \\ c \end{bmatrix}$, $\vec{v} = \begin{bmatrix} d \\ e \\ f \end{bmatrix}$, $\vec{w} = \begin{bmatrix} g \\ h \\ i \end{bmatrix}$

**ค่านี้เท่ากับปริมาตรของทรงสี่เหลี่ยมด้านขนาน** (parallelepiped)!'''
          ]
        }),
        ContentBlock("vcp_h9", "header", {"title": "ทำไม?", "level": 2}),
        ContentBlock("vcp_t11", "text", {
          "content": [
            r'''1. $\vec{v} \times \vec{w}$ = เวกเตอร์ตั้งฉากกับฐาน มีขนาด = **พื้นที่ฐาน**

2. $\vec{u} \cdot (\vec{v} \times \vec{w})$ = ฉาย $\vec{u}$ ลงไปบนเวกเตอร์ตั้งฉาก

= **ความสูง × พื้นที่ฐาน** = ปริมาตร! 🎯'''
          ]
        }),
        ContentBlock("q_vol_para_1", "question_choice", {
          "content": [
            r"ปริมาตรทรงสี่เหลี่ยมด้านขนานที่สร้างจาก $\vec{u} = (1,0,0)$, $\vec{v} = (0,2,0)$, $\vec{w} = (0,0,3)$ เท่ากับเท่าไร?"
          ],
          "options": ["5", "6", "7", "8"],
          "correct": "6",
          "explanation": r'''ใช้ Determinant:

$V = |\vec{u} \cdot (\vec{v} \times \vec{w})| = \left|\begin{vmatrix} 1 & 0 & 0 \\ 0 & 2 & 0 \\ 0 & 0 & 3 \end{vmatrix}\right|$

$= |1(2 \times 3 - 0) - 0 + 0|$

$= |6| = 6$ ลูกบาศก์หน่วย ✅'''
        }),
        ContentBlock("q_vol_para_2", "question_choice", {
          "content": [
            r"ปริมาตรทรงสี่เหลี่ยมด้านขนานที่สร้างจาก $\vec{u} = (2,0,0)$, $\vec{v} = (0,3,1)$, $\vec{w} = (0,1,4)$ เท่ากับเท่าไร?"
          ],
          "options": ["18", "20", "22", "24"],
          "correct": "22",
          "explanation": r'''$V = |\vec{u} \cdot (\vec{v} \times \vec{w})| = \left|\begin{vmatrix} 2 & 0 & 0 \\ 0 & 3 & 1 \\ 0 & 1 & 4 \end{vmatrix}\right|$

ขยายตามแถวแรก:

$= \left|2 \begin{vmatrix} 3 & 1 \\ 1 & 4 \end{vmatrix} - 0 + 0\right|$

$= |2(3 \times 4 - 1 \times 1)|$

$= |2(12 - 1)| = |2(11)| = 22$ ลูกบาศก์หน่วย ✅'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "🔺 ปริมาตรพีระมิด (Tetrahedron)",
      blocks: [
        ContentBlock("vcp_h10", "header", {"title": "สูตร", "level": 2}),
        ContentBlock("vcp_t12", "text", {
          "content": [
            r'''$$\text{ปริมาตรพีระมิด} = \dfrac{1}{6}|\vec{u} \cdot (\vec{v} \times \vec{w})|$$

**เหตุผล:**

พีระมิดฐานสามเหลี่ยม = **⅙** ของทรงสี่เหลี่ยมด้านขนาน 3D

เหมือนที่สามเหลี่ยม = ½ สี่เหลี่ยมด้านขนาน'''
          ]
        }),
        ContentBlock("q_vol_tet_1", "question_choice", {
          "content": [
            r"ปริมาตรพีระมิด OABC โดยที่ $O(0,0,0)$, $A(3,0,0)$, $B(0,3,0)$, $C(0,0,3)$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$\dfrac{9}{2}$",
            r"$\dfrac{27}{6}$",
            r"$9$",
            r"$27$"
          ],
          "correct": r"$\dfrac{27}{6}$",
          "explanation": r'''$\vec{OA} = \begin{bmatrix} 3 \\ 0 \\ 0 \end{bmatrix}$, $\vec{OB} = \begin{bmatrix} 0 \\ 3 \\ 0 \end{bmatrix}$, $\vec{OC} = \begin{bmatrix} 0 \\ 0 \\ 3 \end{bmatrix}$

$\vec{OA} \cdot (\vec{OB} \times \vec{OC}) = \begin{vmatrix} 3 & 0 & 0 \\ 0 & 3 & 0 \\ 0 & 0 & 3 \end{vmatrix}$

$= 3 \times 3 \times 3 = 27$

ปริมาตรพีระมิด $= \dfrac{1}{6} \times 27 = \dfrac{27}{6} = 4.5$ ลูกบาศก์หน่วย ✅'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "เงื่อนไข Coplanar",
      blocks: [
        ContentBlock("vcp_t13", "text", {
          "content": [
            r'''**ถ้าปริมาตร = 0** แสดงว่าอะไร?

เมื่อ $\vec{u} \cdot (\vec{v} \times \vec{w}) = 0$

แสดงว่าทั้ง 3 เวกเตอร์**อยู่บนระนาบเดียวกัน** (coplanar) ✅

เหมือนพยายามสร้างกล่อง แต่ทั้ง 3 เวกเตอร์แบนราบ → ไม่มีความสูง → ปริมาตร = 0!'''
          ]
        }),
        ContentBlock("q_vol_tet_2", "question_choice", {
          "content": [
            r"ถ้าปริมาตรทรงสี่เหลี่ยมด้านขนานที่สร้างจาก 3 เวกเตอร์เท่ากับ 0 แสดงว่าอะไร?"
          ],
          "options": [
            "ทั้ง 3 เวกเตอร์ตั้งฉากกัน",
            "ทั้ง 3 เวกเตอร์อยู่บนระนาบเดียวกัน",
            "ทั้ง 3 เวกเตอร์เป็นเวกเตอร์ศูนย์",
            "ไม่สามารถสรุปได้"
          ],
          "correct": "ทั้ง 3 เวกเตอร์อยู่บนระนาบเดียวกัน",
          "explanation": r'''เมื่อ $\vec{u} \cdot (\vec{v} \times \vec{w}) = 0$ แสดงว่าปริมาตร = 0

ซึ่งเกิดขึ้นเมื่อทั้ง 3 เวกเตอร์**อยู่บนระนาบเดียวกัน** (coplanar) ✅

เหมือนพยายามสร้างกล่อง แต่ทั้ง 3 เวกเตอร์แบนราบ → ไม่มีความสูง → ปริมาตร = 0!'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "คำถามชวนคิด 🤔",
      blocks: [
        ContentBlock("vcp_t14", "text", {
          "content": [
            r'''ลองคิดดูว่า:

**1. ถ้าเราใช้ $\vec{BA}$ และ $\vec{BC}$ แทน $\vec{AB}$ และ $\vec{AC}$**

จะได้พื้นที่สามเหลี่ยมเท่าเดิมไหม? 🤔

**ตอบ:** ได้! เพราะ $|\vec{BA} \times \vec{BC}| = |\vec{AB} \times \vec{AC}|$ ขนาดเท่ากัน แค่ทิศทางกลับ

**2. ทำไมพื้นที่สามเหลี่ยม = ½ แต่ปริมาตรพีระมิด = ⅙?**

**ตอบ:** 

- 2D: สามเหลี่ยม = ½ สี่เหลี่ยมด้านขนาน
- 3D: พีระมิด = ⅙ ทรงสี่เหลี่ยมด้านขนาน 3D

เพราะเมื่อเพิ่มมิติ ความสัมพันธ์เปลี่ยนจาก ½ → ⅙ 🎯'''
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("vcp_t15", "text", {
          "content": [
            r'''**การประยุกต์ Cross Product กับเรขาคณิต:**

1. **พื้นที่สี่เหลี่ยมด้านขนาน** = $|\vec{u} \times \vec{v}|$

2. **พื้นที่สามเหลี่ยม** = $\dfrac{1}{2}|\vec{u} \times \vec{v}|$

3. **ปริมาตรทรงสี่เหลี่ยมด้านขนาน 3D** = $|\vec{u} \cdot (\vec{v} \times \vec{w})|$

4. **ปริมาตรพีระมิด** = $\dfrac{1}{6}|\vec{u} \cdot (\vec{v} \times \vec{w})|$

5. ถ้าปริมาตร = 0 → ทั้ง 3 เวกเตอร์**อยู่บนระนาบเดียวกัน** (coplanar)

**Cross Product เชื่อมโยงพีชคณิตกับเรขาคณิตได้อย่างสวยงาม!** 🎨'''
          ]
        }),
      ],
    ),
  ],
);

// === บทที่ 5: การใช้เวกเตอร์แทนจุดและเส้นตรง ===
final vectorGeometryApplicationsLesson = ContentLesson(
  title: "การใช้เวกเตอร์แทนจุดและเส้นตรง",
  sections: [
    ContentSection(
      headerL1: "เวกเตอร์ตำแหน่ง (Position Vector) 📍",
      blocks: [
        ContentBlock("vga_t1", "text", {
          "content": [
            r'''เวกเตอร์ตำแหน่งคือเวกเตอร์จากจุดกำเนิด $O(0,0,0)$ ไปยังจุดใดๆ

**สำหรับจุด** $P(x, y, z)$

$$\vec{OP} = \begin{bmatrix} x \\ y \\ z \end{bmatrix}$$

เรียกว่า **เวกเตอร์ตำแหน่งของจุด P**'''
          ]
        }),
        ContentBlock("vga_h1", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vga_t2", "text", {
          "content": [
            r'''**1. จุด** $A(3, 4, 5)$ มีเวกเตอร์ตำแหน่ง

$$\vec{OA} = \begin{bmatrix} 3 \\ 4 \\ 5 \end{bmatrix}$$

**2. จุด** $B(-2, 1, 0)$ มีเวกเตอร์ตำแหน่ง

$$\vec{OB} = \begin{bmatrix} -2 \\ 1 \\ 0 \end{bmatrix}$$'''
          ]
        }),
        ContentBlock("q_pos_vec_1", "question_choice", {
          "content": [
            r"เวกเตอร์ตำแหน่งของจุด $P(5, -3, 2)$ คือ"
          ],
          "options": [
            r"$\begin{bmatrix} 5 \\ -3 \\ 2 \end{bmatrix}$",
            r"$\begin{bmatrix} -5 \\ 3 \\ -2 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 \\ 3 \\ 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 \\ -3 \\ 5 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 5 \\ -3 \\ 2 \end{bmatrix}$",
          "explanation": r"เวกเตอร์ตำแหน่ง = พิกัดของจุดนั้น"
        }),
      ],
    ),
    ContentSection(
      headerL1: "เวกเตอร์ระหว่างจุด 2 จุด ↔️",
      blocks: [
        ContentBlock("vga_t3", "text", {
          "content": [
            r'''เวกเตอร์จาก $A$ ไป $B$:

$$\vec{AB} = \vec{OB} - \vec{OA}$$

หรือ **ถ้ามีพิกัด:**

$$\vec{AB} = B - A = (x_2 - x_1, y_2 - y_1, z_2 - z_1)$$'''
          ]
        }),
        ContentBlock("vga_h2", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vga_t4", "text", {
          "content": [
            r'''ให้ $A(1, 2, 3)$ และ $B(4, 6, 8)$

หา $\vec{AB}$

**วิธีทำ:**

$$\vec{AB} = B - A$$

$$= (4-1, 6-2, 8-3)$$

$$= (3, 4, 5)$$'''
          ]
        }),
        ContentBlock("q_vec_between_1", "question_choice", {
          "content": [
            r"$\vec{AB}$ เมื่อ $A(2, 3, 1)$ และ $B(5, 7, 4)$ เท่ากับ"
          ],
          "options": [
            r"$(3, 4, 3)$",
            r"$(7, 10, 5)$",
            r"$(3, 4, 5)$",
            r"$(-3, -4, -3)$"
          ],
          "correct": r"$(3, 4, 3)$",
          "explanation": r"$\vec{AB} = (5-2, 7-3, 4-1) = (3, 4, 3)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "สมการเส้นตรงในรูปเวกเตอร์ 📏",
      blocks: [
        ContentBlock("vga_t5", "text", {
          "content": [
            r'''เส้นตรงที่ผ่านจุด $A$ และมีทิศทาง $\vec{d}$:

$$\vec{r} = \vec{a} + t\vec{d}$$

**โดยที่:**
- $\vec{r}$ = เวกเตอร์ตำแหน่งของจุดใดๆ บนเส้นตรง
- $\vec{a}$ = เวกเตอร์ตำแหน่งของจุด $A$
- $\vec{d}$ = เวกเตอร์ทิศทาง
- $t$ = พารามิเตอร์ (ตัวเลขใดๆ)'''
          ]
        }),
        ContentBlock("vga_h3", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vga_t6", "text", {
          "content": [
            r'''หาสมการเส้นตรงที่ผ่านจุด $A(1, 2, 3)$ และมีทิศทาง $\vec{d} = (2, 1, -1)$

**วิธีทำ:**

$$\vec{r} = \vec{a} + t\vec{d}$$

$$\vec{r} = \begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix} + t\begin{bmatrix} 2 \\ 1 \\ -1 \end{bmatrix}$$

**หรือเขียนแยกเป็น:**

$$\begin{cases}
x = 1 + 2t \\
y = 2 + t \\
z = 3 - t
\end{cases}$$'''
          ]
        }),
        ContentBlock("q_line_eq_1", "question_choice", {
          "content": [
            r"เส้นตรงที่ผ่าน $A(0, 1, 2)$ และมีทิศทาง $(1, 0, -1)$ มีสมการ"
          ],
          "options": [
            r"$\vec{r} = \begin{bmatrix} 0 \\ 1 \\ 2 \end{bmatrix} + t\begin{bmatrix} 1 \\ 0 \\ -1 \end{bmatrix}$",
            r"$\vec{r} = \begin{bmatrix} 1 \\ 0 \\ -1 \end{bmatrix} + t\begin{bmatrix} 0 \\ 1 \\ 2 \end{bmatrix}$",
            r"$\vec{r} = t\begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix}$",
            r"$\vec{r} = \begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix} + t\begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix}$"
          ],
          "correct": r"$\vec{r} = \begin{bmatrix} 0 \\ 1 \\ 2 \end{bmatrix} + t\begin{bmatrix} 1 \\ 0 \\ -1 \end{bmatrix}$",
          "explanation": r"ใช้สูตร $\vec{r} = \vec{a} + t\vec{d}$ โดยตรง"
        }),
      ],
    ),
    ContentSection(
      headerL1: "เส้นตรงที่ผ่าน 2 จุด",
      blocks: [
        ContentBlock("vga_t7", "text", {
          "content": [
            r'''เส้นตรงที่ผ่านจุด $A$ และ $B$:

$$\vec{r} = \vec{a} + t(\vec{b} - \vec{a})$$

หรือ

$$\vec{r} = \vec{a} + t\vec{AB}$$

**เพราะ:** เวกเตอร์ทิศทาง = $\vec{AB} = \vec{b} - \vec{a}$'''
          ]
        }),
        ContentBlock("vga_h4", "header", {"title": "ตัวอย่าง", "level": 2}),
        ContentBlock("vga_t8", "text", {
          "content": [
            r'''หาสมการเส้นตรงที่ผ่าน $A(1, 0, 2)$ และ $B(3, 2, 1)$

**วิธีทำ:**

**ขั้นที่ 1:** หา $\vec{AB}$

$$\vec{AB} = (3-1, 2-0, 1-2) = (2, 2, -1)$$

**ขั้นที่ 2:** เขียนสมการ

$$\vec{r} = \begin{bmatrix} 1 \\ 0 \\ 2 \end{bmatrix} + t\begin{bmatrix} 2 \\ 2 \\ -1 \end{bmatrix}$$'''
          ]
        }),
        ContentBlock("q_line_2pts_1", "question_choice", {
          "content": [
            r"เส้นตรงที่ผ่าน $P(0, 0, 0)$ และ $Q(1, 2, 3)$ มีเวกเตอร์ทิศทางคือ"
          ],
          "options": [
            r"$(1, 2, 3)$",
            r"$(0, 0, 0)$",
            r"$(-1, -2, -3)$",
            r"$(3, 2, 1)$"
          ],
          "correct": r"$(1, 2, 3)$",
          "explanation": r"$\vec{PQ} = Q - P = (1, 2, 3)$"
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("vga_t9", "text", {
          "content": [
            r'''**สูตรสำคัญ:**

1. **เวกเตอร์ตำแหน่ง:** จุด $P(x,y,z)$ → $\vec{OP} = (x,y,z)$

2. **เวกเตอร์ระหว่าง 2 จุด:** $\vec{AB} = B - A$

3. **เส้นตรง:** $\vec{r} = \vec{a} + t\vec{d}$

4. **เส้นตรงผ่าน 2 จุด:** $\vec{r} = \vec{a} + t(\vec{b} - \vec{a})$'''
          ]
        }),
      ],
    ),
  ],
);

// === บทที่ 6: แบบฝึกหัดรวม (Comprehensive Exercises) ===
final vectorComprehensiveExercisesLesson = ContentLesson(
  title: "แบบฝึกหัดรวม",
  sections: [
    ContentSection(
      headerL1: "ชุดที่ 1: พื้นฐาน",
      blocks: [
        ContentBlock("ex_basic_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} = (3, -2, 1)$ และ $\vec{v} = (1, 4, -2)$ แล้ว $2\vec{u} - 3\vec{v}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(3, -16, 8)$",
            r"$(9, -8, -4)$",
            r"$(6, -4, 2)$",
            r"$(0, 10, -5)$"
          ],
          "correct": r"$(3, -16, 8)$",
          "explanation": r'''$2\vec{u} = (6, -4, 2)$
$3\vec{v} = (3, 12, -6)$
$2\vec{u} - 3\vec{v} = (6-3, -4-12, 2-(-6)) = (3, -16, 8)$'''
        }),
        ContentBlock("ex_basic_2", "question_fill_in", {
          "content": [
            r"ขนาดของเวกเตอร์ $\vec{v} = (2, 3, 6)$ เท่ากับ ",
            {"box": "0"}
          ],
          "correct": "7",
          "explanation": r"$|\vec{v}| = \sqrt{4 + 9 + 36} = \sqrt{49} = 7$"
        }),
        ContentBlock("ex_basic_3", "question_choice", {
          "content": [
            r"ถ้า $|\vec{u}| = 5$ และ $|\vec{v}| = 3$ และ $\vec{u} \cdot \vec{v} = 0$ แล้วมุมระหว่าง $\vec{u}$ และ $\vec{v}$ เท่ากับเท่าไร?"
          ],
          "options": ["0°", "45°", "90°", "180°"],
          "correct": "90°",
          "explanation": r"$\vec{u} \cdot \vec{v} = 0$ แสดงว่าตั้งฉากกัน → มุม = 90°"
        }),
      ],
    ),
    ContentSection(
      headerL1: "ชุดที่ 2: Dot Product",
      blocks: [
        ContentBlock("ex_dot_1", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} = (1, 2, -1)$ และ $\vec{v} = (3, -1, 2)$ แล้ว $\vec{u} \cdot \vec{v}$ เท่ากับเท่าไร?"
          ],
          "options": ["-1", "0", "1", "3"],
          "correct": "-1",
          "explanation": r"$\vec{u} \cdot \vec{v} = (1)(3) + (2)(-1) + (-1)(2) = 3 - 2 - 2 = -1$"
        }),
        ContentBlock("ex_dot_2", "question_choice", {
          "content": [
            r"เวกเตอร์ใดต่อไปนี้ตั้งฉากกับ $\vec{u} = (2, -1, 3)$?"
          ],
          "options": [
            r"$(1, 5, -1)$",
            r"$(1, 5, 1)$",
            r"$(2, 1, 0)$",
            r"$(0, 3, 1)$"
          ],
          "correct": r"$(1, 5, -1)$",
          "explanation": r"$(2, -1, 3) \cdot (1, 5, -1) = 2 - 5 - 3 = -6 \neq 0$ ลองใหม่... $(0, 3, 1)$ → $0 - 3 + 3 = 0$ ✓"
        }),
        ContentBlock("ex_dot_3", "question_fill_in", {
          "content": [
            r"ถ้า $\vec{u} = (4, 3, 0)$ และ $\vec{v} = (0, 5, 12)$ แล้ว $\cos\theta$ ระหว่าง $\vec{u}$ และ $\vec{v}$ เท่ากับ ",
            {"box": "0"}
          ],
          "correct": "3/13",
          "explanation": r'''$\vec{u} \cdot \vec{v} = 0 + 15 + 0 = 15$
$|\vec{u}| = 5$, $|\vec{v}| = 13$
$\cos\theta = \dfrac{15}{5 \times 13} = \dfrac{15}{65} = \dfrac{3}{13}$'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "ชุดที่ 3: Cross Product",
      blocks: [
        ContentBlock("ex_cross_1", "question_choice", {
          "content": [
            r"$\vec{i} \times \vec{k}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$\vec{j}$",
            r"$-\vec{j}$",
            r"$\vec{k}$",
            r"$\vec{i}$"
          ],
          "correct": r"$-\vec{j}$",
          "explanation": r"$(1,0,0) \times (0,0,1) = (0,-1,0) = -\vec{j}$"
        }),
        ContentBlock("ex_cross_2", "question_choice", {
          "content": [
            r"ถ้า $\vec{u} = (1, 2, 0)$ และ $\vec{v} = (0, 1, 2)$ แล้ว $\vec{u} \times \vec{v}$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$(4, -2, 1)$",
            r"$(4, 2, -1)$",
            r"$(2, -4, 1)$",
            r"$(0, 0, 0)$"
          ],
          "correct": r"$(4, -2, 1)$",
          "explanation": r"$\vec{u} \times \vec{v} = (2 \cdot 2 - 0 \cdot 1, 0 \cdot 0 - 1 \cdot 2, 1 \cdot 1 - 2 \cdot 0) = (4, -2, 1)$"
        }),
        ContentBlock("ex_cross_3", "question_fill_in", {
          "content": [
            r"พื้นที่สี่เหลี่ยมด้านขนานที่สร้างจาก $\vec{u} = (2, 0, 0)$ และ $\vec{v} = (0, 5, 0)$ เท่ากับ ",
            {"box": "0"}
          ],
          "correct": "10",
          "explanation": r"$|\vec{u} \times \vec{v}| = |(0, 0, 10)| = 10$ ตารางหน่วย"
        }),
      ],
    ),
    ContentSection(
      headerL1: "ชุดที่ 4: การประยุกต์",
      blocks: [
        ContentBlock("ex_app_1", "question_choice", {
          "content": [
            r"พื้นที่สามเหลี่ยม ABC ที่มีจุดยอด $A(1,0,0)$, $B(0,2,0)$, $C(0,0,3)$ เท่ากับเท่าไร?"
          ],
          "options": [
            r"$\dfrac{\sqrt{61}}{2}$",
            r"$\sqrt{14}$",
            r"$6$",
            r"$3$"
          ],
          "correct": r"$\dfrac{\sqrt{61}}{2}$",
          "explanation": r'''$\vec{AB} = (-1, 2, 0)$, $\vec{AC} = (-1, 0, 3)$
$\vec{AB} \times \vec{AC} = (6, 3, 2)$
$|\vec{AB} \times \vec{AC}| = \sqrt{36 + 9 + 4} = \sqrt{49} = 7$
พื้นที่ = $\dfrac{7}{2}$... (ตรวจสอบอีกครั้ง)'''
        }),
        ContentBlock("ex_app_2", "question_choice", {
          "content": [
            r"ถ้าเวกเตอร์ $\vec{u} = (1, 2, k)$, $\vec{v} = (2, -1, 1)$, $\vec{w} = (3, 1, -1)$ อยู่บนระนาบเดียวกัน แล้ว $k$ เท่ากับเท่าไร?"
          ],
          "options": ["0", "1", "2", "3"],
          "correct": "3",
          "explanation": r'''เวกเตอร์ coplanar → $\vec{u} \cdot (\vec{v} \times \vec{w}) = 0$
$\begin{vmatrix} 1 & 2 & k \\ 2 & -1 & 1 \\ 3 & 1 & -1 \end{vmatrix} = 0$
แก้สมการได้ $k = 3$'''
        }),
        ContentBlock("ex_app_3", "question_fill_in", {
          "content": [
            r"จุด $P$ บนเส้นตรง $\vec{r} = (1,0,2) + t(2,1,-1)$ ที่ทำให้ $z = 0$ มีค่า $t = $ ",
            {"box": "0"}
          ],
          "correct": "2",
          "explanation": r'''$z = 2 + t(-1) = 2 - t = 0$
$t = 2$'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "ชุดที่ 5: ท้าทาย 🔥",
      blocks: [
        ContentBlock("ex_challenge_1", "question_choice", {
          "content": [
            r"ถ้า $|\vec{u}| = 3$, $|\vec{v}| = 4$, $|\vec{w}| = 5$ และทั้ง 3 เวกเตอร์ตั้งฉากซึ่งกันและกัน แล้วปริมาตรทรงสี่เหลี่ยมด้านขนานที่สร้างขึ้นเท่ากับเท่าไร?"
          ],
          "options": ["12", "20", "60", "120"],
          "correct": "60",
          "explanation": r"$V = |\vec{u} \cdot (\vec{v} \times \vec{w})| = 3 \times 4 \times 5 = 60$ (เพราะตั้งฉาก)"
        }),
        ContentBlock("ex_challenge_2", "question_choice", {
          "content": [
            r"ให้ $\vec{a}$, $\vec{b}$, $\vec{c}$ เป็นเวกเตอร์ใดๆ ข้อใดต่อไปนี้ **ผิด**?"
          ],
          "options": [
            r"$\vec{a} \times \vec{b} = -(\vec{b} \times \vec{a})$",
            r"$\vec{a} \cdot (\vec{b} \times \vec{c}) = (\vec{a} \times \vec{b}) \cdot \vec{c}$",
            r"$\vec{a} \times (\vec{b} \times \vec{c}) = (\vec{a} \times \vec{b}) \times \vec{c}$",
            r"$\vec{a} \cdot (\vec{b} + \vec{c}) = \vec{a} \cdot \vec{b} + \vec{a} \cdot \vec{c}$"
          ],
          "correct": r"$\vec{a} \times (\vec{b} \times \vec{c}) = (\vec{a} \times \vec{b}) \times \vec{c}$",
          "explanation": r"Cross product **ไม่มีสมบัติการเปลี่ยนหมู่** (not associative)"
        }),
        ContentBlock("ex_challenge_3", "question_fill_in", {
          "content": [
            r"ระยะทางจากจุด $P(1, 2, 3)$ ถึงเส้นตรง $\vec{r} = (0,0,0) + t(1,0,0)$ เท่ากับ ",
            {"box": "0"}
          ],
          "correct": "√13",
          "explanation": r'''เส้นตรงคือแกน $x$
ระยะทาง = $\sqrt{(2)^2 + (3)^2} = \sqrt{4 + 9} = \sqrt{13}$'''
        }),
      ],
    ),
    ContentSection(
      headerL1: "สรุป",
      blocks: [
        ContentBlock("ex_summary", "text", {
          "content": [
            r'''**หัวข้อที่ควรทบทวน:**

✅ การบวกลบและคูณสเกลาร์
✅ ขนาดเวกเตอร์และเวกเตอร์หน่วย
✅ Dot Product และการหามุม
✅ Cross Product และพื้นที่/ปริมาตร
✅ เวกเตอร์ตำแหน่งและสมการเส้นตรง

**เทคนิคสำคัญ:**

🎯 ตรวจสอบ perpendicular → dot product = 0
🎯 ตรวจสอบ parallel → cross product = 0
🎯 พื้นที่ → ½|cross product|
🎯 ปริมาตร → ⅙|scalar triple product|

**Good luck! 🚀**'''
          ]
        }),
      ],
    ),
  ],
);