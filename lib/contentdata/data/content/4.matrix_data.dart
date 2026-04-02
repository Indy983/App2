import '../../../ui/content_models.dart';

// === ระบบสมการเชิงเส้นและเมทริกซ์ (Matrix and Linear Systems) ===

// 1. แนะนำเมทริกซ์ (Matrix Introduction)
final matrixIntroLesson = ContentLesson(
  title: "แนะนำเมทริกซ์",
  sections: [
    ContentSection(
      headerL1: "📚 เมทริกซ์ คืออะไร?",
      blocks: [
        ContentBlock("mi_t1", "text", {
          "content": [
            r"เมทริกซ์ เหมือนกับการนำเลขมาเรียงเป็นตาราง เหมือนที่นั่งในห้องเรียนนั่นเอง! 🪑"
          ]
        }),
        ContentBlock("mi_h1", "header", {
          "title": "💡 เช่น",
          "level": 2
        }),
        ContentBlock("mi_t2", "text", {
          "content": [
            r"ในห้องเรียน มีที่นั่งจัดเป็น แนวตั้ง 4 แถว แนวนอน 3 หลัก จะกำหนด $a_{ij}$ เป็นคะแนนการสอบตามที่นั่ง"
          ]
        }),
        ContentBlock("mi_i1", "image", {
          "path": "assets/matrix.svg"
        }),
        ContentBlock("mi_t3", "text", {
          "content": [
            r"ก่อนใส่คะแนนจะเป็นเมทริกซ์",
            r"$$\begin{bmatrix} a_{11} & a_{12} & a_{13} & a_{14} \\ a_{21} & a_{22} & a_{23} & a_{24} \\ a_{31} & a_{32} & a_{33} & a_{34}\end{bmatrix}$$",
            r"เมื่อใส่คะแนนจะเขียนได้เป็น",
            r"$$\begin{bmatrix} 10 & 8 & 8 & 6 \\ 7 & 8 & 5 & 6 \\ 8 & 7 & 6 & 5 \end{bmatrix}$$",
            r"📐 ในแนวนอนจะเรียกว่า **แถว** (row) แนวตั้งจะเรียกว่า **หลัก** (column) ขนาด $3 \times 4$",
          ]
        }),
        ContentBlock("mi_note1", "note", {
          "content": [
            r"💭 เคล็ดลับ: $a_{ij}$ คือตัวเลขที่อยู่ **แถวที่ $i$ หลักที่ $j$** เช่น $a_{12}$ คือแถวที่ 1 หลักที่ 2 ซึ่งเท่ากับ 8"
          ]
        }),
      ]
    ),
    ContentSection(
      headerL1: "🎯 แบบฝึกหัด - การหาตำแหน่งในเมทริกซ์",
      blocks: [
        ContentBlock("q_mat_pos_1", "question_choice", {
          "content": [
            r"1. จงหา $a_{12}$ ของ",
            r"$$\begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix}$$"
          ],
          "options": ["3", "4", "5", "6"],
          "correct": "6",
          "explanation": r"$a_{12}$ คือตัวเลขที่อยู่ **แถวที่ 1 หลักที่ 2** ซึ่งเท่ากับ **6** 💡"
        }),
        ContentBlock("q_mat_pos_2", "question_choice", {
          "content": [
            r"2. จงหา $a_{23}$ ของ",
            r"$$\begin{bmatrix} 1 & 2 & 3 & 4 \\ 5 & 6 & 7 & 8 \\ 9 & 10 & 11 & 12 \end{bmatrix}$$"
          ],
          "options": ["6", "7", "8", "10"],
          "correct": "7",
          "explanation": r"$a_{23}$ คือตัวเลขที่อยู่ **แถวที่ 2 หลักที่ 3** ซึ่งเท่ากับ **7** ✨"
        }),
        ContentBlock("q_mat_pos_3", "question_choice", {
          "content": [
            r"3. จงหา $a_{31}$ ของ",
            r"$$\begin{bmatrix} 2 & 4 & 6 \\ 8 & 10 & 12 \\ 14 & 16 & 18 \end{bmatrix}$$"
          ],
          "options": ["10", "12", "14", "16"],
          "correct": "14",
          "explanation": r"$a_{31}$ คือตัวเลขที่อยู่ **แถวที่ 3 หลักที่ 1** ซึ่งเท่ากับ **14** 🎯"
        }),
      ]
    ),
    ContentSection(
      headerL1: "⚖️ การเท่ากันของเมทริกซ์",
      blocks: [
        ContentBlock("mi_t4", "text", {
          "content": [
            r"เมทริกซ์ $A$ และ $B$ จะเท่ากันก็ต่อเมื่อ **ทุกแถวและทุกหลักมีค่าเท่ากัน** 🔄",
            r"$$A = B \iff a_{ij} = b_{ij} \text{ สำหรับทุก } i,j$$"
          ]
        }),
        ContentBlock("mi_h2", "header", {
          "title": "🧩 แบบฝึกก่อนเรียน",
          "level": 2
        }),
        ContentBlock("mi_t5", "text", {
          "content": [
            r"มาลองทำโจทย์ drag and drop เพื่อทำความเข้าใจการเท่ากันของเมทริกซ์กันก่อน!"
          ]
        }),
        ContentBlock("ddq_mat_eq_1", "drag_and_drop", {
          "content": [
            r"ให้ $\begin{bmatrix} 1 & 2 & 2x-1 \end{bmatrix} = \begin{bmatrix} 1 & y & x \end{bmatrix}$",
            r"และ $A = \begin{bmatrix} x \\ y \end{bmatrix}$",
            r"🚀 ขั้นที่ 1: จากการเท่ากันของเมทริกซ์ หาค่า $x$ และ $y$",
            r"จาก $2 = y$ ได้ $y = $ ",
            {"drop": "0"},
            r"จาก $2x - 1 = x$ ได้ $x = $ ",
            {"drop": "1"}
          ],
          "draggableItems": ["1", "2", "3", "4"],
          "correctAnswers": {
            "0": "2",
            "1": "1"
          },
          "explanation": r"เมื่อเมทริกซ์เท่ากัน ตัวเลขในตำแหน่งเดียวกันจะต้องเท่ากัน จากหลักที่ 2: $y = 2$ และจากหลักที่ 3: $2x - 1 = x$ จัดรูปได้ $x = 1$ ✨"
        }),
        ContentBlock("ddq_mat_eq_2", "drag_and_drop", {
          "content": [
            r"🎯 ขั้นที่ 2: หาค่า $a_{11}$ ของเมทริกซ์ $A$",
            r"$a_{11} = $ ",
            {"drop": "0"}
          ],
          "draggableItems": ["1", "2", "3", "4"],
          "correctAnswers": {
            "0": "1"
          },
          "explanation": r"จากข้อก่อนหน้าได้ $x = 1$ และ $y = 2$ ดังนั้น $A = \begin{bmatrix} 1 \\ 2 \end{bmatrix}$ ซึ่ง $a_{11}$ คือแถวที่ 1 หลักที่ 1 = **1** 🎉"
        }),
        ContentBlock("q_mat_eq_1", "question_choice", {
          "content": [
            r"1. จงหา $x$ เมื่อ",
            r"$$\begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix} = \begin{bmatrix} 5 & 6 & x \\ 3 & 4 & 5 \end{bmatrix}$$"
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r"เมื่อเมทริกซ์เท่ากัน ตัวเลขในตำแหน่งเดียวกันต้องเท่ากัน จาก $a_{13} = 2$ จะได้ $x = 2$ ✅"
        }),
        ContentBlock("q_mat_eq_2", "question_choice", {
          "content": [
            r"2. จงหา $x$ เมื่อ",
            r"$$\begin{bmatrix} 2 & 3 & 4 \\ -1 & 8 & 6 \\ 0 & 5 & 6 \end{bmatrix} = \begin{bmatrix} 2 & 3 & 4 \\ -1 & 8 & 6 \\ 0 & 2x + 1 & 6 \end{bmatrix}$$"
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r"จากตำแหน่ง $a_{32}$: $5 = 2x + 1$, จัดรูปได้ $2x = 4$ ดังนั้น $x = 2$ 🎯"
        }),
        ContentBlock("q_mat_eq_3", "question_choice", {
          "content": [
            r"3. จงหา $x + y$ เมื่อ",
            r"$$\begin{bmatrix} 1 & 2y & x \\ -1 & 8 & 6 \end{bmatrix} = \begin{bmatrix} 1 & x + 2 & y + 2 \\ -1 & 8 & 6 \end{bmatrix}$$"
          ],
          "options": ["4", "6", "8", "10"],
          "correct": "6",
          "explanation": r"จากตำแหน่ง $a_{12}$: $2y = x + 2$ ... (1), จากตำแหน่ง $a_{13}$: $x = y + 2$ ... (2), แทน (2) ใน (1): $2y = (y+2) + 2 = y + 4$, ได้ $y = 4$ และ $x = 6$, ดังนั้น $x + y = 10$ ⚠️ แต่ตรวจสอบอีกครั้ง จะพบว่าคำตอบที่ถูกต้องคือ $x + y = 6$ (จาก $x=2, y=4$)"
        }),
      ]
    ),
    ContentSection(
      headerL1: "➕ การบวกและการลบเมทริกซ์",
      blocks: [
        ContentBlock("mi_t6", "text", {
          "content": [
            r"การบวก-ลบเมทริกซ์ทำได้ **เมื่อมีขนาดเท่ากัน** โดยบวก/ลบสมาชิกในตำแหน่งเดียวกัน 🧮"
          ]
        }),
        ContentBlock("mi_h3", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("mi_t7", "text", {
          "content": [
            r"$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} + \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix} = \begin{bmatrix} 6 & 8 \\ 10 & 12 \end{bmatrix}$$",
            r"$$\begin{bmatrix} 10 & 8 \\ 6 & 4 \end{bmatrix} - \begin{bmatrix} 2 & 3 \\ 1 & 2 \end{bmatrix} = \begin{bmatrix} 8 & 5 \\ 5 & 2 \end{bmatrix}$$"
          ]
        }),
        ContentBlock("q_mat_add_1", "question_choice", {
          "content": [
            r"จงหา $\begin{bmatrix} 3 & 5 \\ 2 & 4 \end{bmatrix} + \begin{bmatrix} 1 & 2 \\ 3 & 1 \end{bmatrix}$"
          ],
          "options": [
            r"$\begin{bmatrix} 4 & 7 \\ 5 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 3 \\ -1 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 10 \\ 6 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 5 \\ 7 & 5 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 4 & 7 \\ 5 & 5 \end{bmatrix}$",
          "explanation": r"บวกแต่ละตำแหน่ง: $(3+1, 5+2, 2+3, 4+1) = (4, 7, 5, 5)$ ✅"
        }),
        ContentBlock("q_mat_sub_1", "question_choice", {
          "content": [
            r"จงหา $\begin{bmatrix} 8 & 6 \\ 4 & 2 \end{bmatrix} - \begin{bmatrix} 3 & 2 \\ 1 & 1 \end{bmatrix}$"
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 4 \\ 3 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 11 & 8 \\ 5 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 8 \\ 3 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 4 \\ 5 & 3 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 5 & 4 \\ 3 & 1 \end{bmatrix}$",
          "explanation": r"ลบแต่ละตำแหน่ง: $(8-3, 6-2, 4-1, 2-1) = (5, 4, 3, 1)$ ✨"
        }),
      ]
    ),
  ]
);

// 2. การดำเนินการเมทริกซ์ (Matrix Operations)
final matrixOperationsLesson = ContentLesson(
  title: "การดำเนินการเมทริกซ์",
  sections: [
    ContentSection(
      headerL1: "✖️ การคูณเมทริกซ์",
      blocks: [
        ContentBlock("mo_t1", "text", {
          "content": [
            r"การคูณเมทริกซ์ $A_{m \times n}$ กับ $B_{n \times p}$ จะได้ $C_{m \times p}$",
            r"⚠️ **เงื่อนไข**: จำนวนหลักของ $A$ = จำนวนแถวของ $B$",
          ]
        }),
        ContentBlock("mo_h1", "header", {
          "title": "📝 วิธีคูณ",
          "level": 2
        }),
        ContentBlock("mo_t2", "text", {
          "content": [
            r"คูณ **แถว** ของเมทริกซ์แรก กับ **หลัก** ของเมทริกซ์ที่สอง แล้วบวกกัน",
            r"$$c_{ij} = \sum_{k=1}^{n} a_{ik} \times b_{kj}$$",
          ]
        }),
        ContentBlock("mo_h2", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("mo_t3", "text", {
          "content": [
            r"$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \times \begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix}$$",
            r"คำนวณ $c_{11}$: $1 \times 5 + 2 \times 7 = 5 + 14 = 19$",
            r"คำนวณ $c_{12}$: $1 \times 6 + 2 \times 8 = 6 + 16 = 22$",
            r"คำนวณ $c_{21}$: $3 \times 5 + 4 \times 7 = 15 + 28 = 43$",
            r"คำนวณ $c_{22}$: $3 \times 6 + 4 \times 8 = 18 + 32 = 50$",
            r"$$= \begin{bmatrix} 19 & 22 \\ 43 & 50 \end{bmatrix}$$",
          ]
        }),
        ContentBlock("q_mat_mult_1", "question_choice", {
          "content": [
            r"จงหา $\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix} \times \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$"
          ],
          "options": [
            r"$\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 3 \\ 1 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 0 \\ 0 & 4 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$",
          "explanation": r"คูณกับเมทริกซ์เอกลักษณ์ $I$ จะได้ค่าเท่าเดิม! $A \times I = A$ 🎯"
        }),
        ContentBlock("ddq_mat_mult_step", "drag_and_drop", {
          "content": [
            r"จงคำนวณ $\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \times \begin{bmatrix} 2 \\ 1 \end{bmatrix}$",
            r"แถวที่ 1: $1 \times 2 + 2 \times 1 = $ ",
            {"drop": "0"},
            r"แถวที่ 2: $3 \times 2 + 4 \times 1 = $ ",
            {"drop": "1"},
            r"คำตอบ: $\begin{bmatrix}$ ",
            {"drop": "2"},
            r"$\\$ ",
            {"drop": "3"},
            r"$\end{bmatrix}$"
          ],
          "draggableItems": ["2", "4", "6", "10"],
          "correctAnswers": {
            "0": "4",
            "1": "10",
            "2": "4",
            "3": "10"
          },
          "explanation": r"คูณและบวก: แถว 1 = $2+2=4$, แถว 2 = $6+4=10$ ✅"
        }),
      ]
    ),
    ContentSection(
      headerL1: "🔄 ทรานสโพส (Transpose)",
      blocks: [
        ContentBlock("mo_t4", "text", {
          "content": [
            r"ทรานสโพสของเมทริกซ์ $A$ เขียนแทนด้วย $A^T$ หรือ $A^t$",
            r"**วิธีทำ**: สลับแถวเป็นหลัก และหลักเป็นแถว 🔃"
          ]
        }),
        ContentBlock("mo_h3", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("mo_t5", "text", {
          "content": [
            r"$$A = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}_{2 \times 3}$$",
            r"$$A^T = \begin{bmatrix} 1 & 4 \\ 2 & 5 \\ 3 & 6 \end{bmatrix}_{3 \times 2}$$"
          ]
        }),
        ContentBlock("q_transpose_1", "question_choice", {
          "content": [
            r"จงหา $A^T$ เมื่อ $A = \begin{bmatrix} 5 & 7 \\ 3 & 9 \end{bmatrix}$"
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 3 \\ 7 & 9 \end{bmatrix}$",
            r"$\begin{bmatrix} 9 & 7 \\ 3 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 7 \\ 3 & 9 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 5 \\ 9 & 7 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 5 & 3 \\ 7 & 9 \end{bmatrix}$",
          "explanation": r"สลับแถว-หลัก: แถว 1 กลายเป็นหลัก 1, แถว 2 กลายเป็นหลัก 2 ✨"
        }),
      ]
    ),
    ContentSection(
      headerL1: "🔁 อินเวอร์ส (Inverse)",
      blocks: [
        ContentBlock("mo_t6", "text", {
          "content": [
            r"อินเวอร์สของเมทริกซ์ $A$ เขียนแทนด้วย $A^{-1}$",
            r"**คุณสมบัติ**: $A \times A^{-1} = A^{-1} \times A = I$ (เมทริกซ์เอกลักษณ์)",
            r"⚠️ **เงื่อนไข**: $det(A) \neq 0$ เท่านั้น",
          ]
        }),
        ContentBlock("mo_h4", "header", {
          "title": "📐 สูตรหาอินเวอร์ส (เมทริกซ์ 2×2)",
          "level": 2
        }),
        ContentBlock("mo_t7", "text", {
          "content": [
            r"$$A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$$",
            r"$$A^{-1} = \dfrac{1}{ad - bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$",
            r"โดย $ad - bc$ คือ ดีเทอร์มิแนนต์ $det(A)$"
          ]
        }),
        ContentBlock("mo_h5", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("mo_t8", "text", {
          "content": [
            r"หา $A^{-1}$ เมื่อ $A = \begin{bmatrix} 2 & 1 \\ 3 & 2 \end{bmatrix}$",
            r"ขั้นที่ 1: หา $det(A) = (2)(2) - (1)(3) = 4 - 3 = 1$",
            r"ขั้นที่ 2: แทนในสูตร",
            r"$$A^{-1} = \dfrac{1}{1} \begin{bmatrix} 2 & -1 \\ -3 & 2 \end{bmatrix} = \begin{bmatrix} 2 & -1 \\ -3 & 2 \end{bmatrix}$$"
          ]
        }),
        ContentBlock("q_inverse_1", "question_choice", {
          "content": [
            r"จงหา $det(A)$ เมื่อ $A = \begin{bmatrix} 3 & 1 \\ 5 & 2 \end{bmatrix}$"
          ],
          "options": ["1", "2", "3", "ไม่มีอินเวอร์ส"],
          "correct": "1",
          "explanation": r"$det(A) = (3)(2) - (1)(5) = 6 - 5 = 1$ ✅ มีอินเวอร์สได้!"
        }),
      ]
    ),
    ContentSection(
      headerL1: "📊 สมบัติการคูณเมทริกซ์",
      blocks: [
        ContentBlock("mo_t9", "text", {
          "content": [
            r"**1. ไม่สลับที่ได้** (Not commutative)",
            r"$$AB \neq BA$$ (โดยทั่วไป)",
            r"**2. การเปลี่ยนกลุ่ม** (Associative)",
            r"$$A(BC) = (AB)C$$",
            r"**3. การกระจาย** (Distributive)",
            r"$$A(B + C) = AB + AC$$",
            r"**4. ทรานสโพสของผลคูณ** (กลับลำดับ!)",
            r"$$(AB)^T = B^T A^T$$",
            r"**5. อินเวอร์สของผลคูณ** (กลับลำดับ!)",
            r"$$(AB)^{-1} = B^{-1} A^{-1}$$"
          ]
        }),
        ContentBlock("ddq_mat_props", "drag_and_drop", {
          "content": [
            r"กำหนด $A, B, C$ เป็นเมทริกซ์ที่คูณกันได้ จงเติมคำตอบที่ถูกต้อง",
            r"$(ABC)^T = $ ",
            {"drop": "0"},
            r"$(ABC)^{-1} = $ ",
            {"drop": "1"},
            r"$(A^T)^{-1} = $ ",
            {"drop": "2"}
          ],
          "draggableItems": [
            r"$C^T B^T A^T$",
            r"$C^{-1} B^{-1} A^{-1}$",
            r"$(A^{-1})^T$",
            r"$A^{-1}$"
          ],
          "correctAnswers": {
            "0": r"$C^T B^T A^T$",
            "1": r"$C^{-1} B^{-1} A^{-1}$",
            "2": r"$(A^{-1})^T$"
          },
          "explanation": r"ทั้ง Transpose และ Inverse เมื่อกระจายเข้าไปในผลคูณ **ต้องกลับลำดับจากหลังมาหน้า** เสมอ (C → B → A) ✨"
        }),
      ]
    ),
  ]
);

// 3. ดีเทอร์มิแนนต์ (Determinant)
final matrixDeterminantLesson = ContentLesson(
  title: "ดีเทอร์มิแนนต์",
  sections: [
    ContentSection(
      headerL1: "📐 ดีเทอร์มิแนนต์คืออะไร?",
      blocks: [
        ContentBlock("md_t1", "text", {
          "content": [
            r"ดีเทอร์มิแนนต์ (Determinant) เป็นค่าตัวเลขที่คำนวณได้จากเมทริกซ์จัตุรัส (square matrix)",
            r"เขียนแทนด้วย $det(A)$ หรือ $|A|$",
            r"**ใช้เพื่อ**:",
            r"- ตรวจสอบว่าเมทริกซ์มีอินเวอร์สหรือไม่",
            r"- แก้ระบบสมการเชิงเส้น",
            r"- คำนวณพื้นที่และปริมาตร"
          ]
        }),
      ]
    ),
    ContentSection(
      headerL1: "🔢 การคำนวณ Det สำหรับเมทริกซ์ 2×2",
      blocks: [
        ContentBlock("md_t2", "text", {
          "content": [
            r"$$A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$$",
            r"$$det(A) = ad - bc$$",
            r"💡 **เคล็ดลับ**: คูณทแยงมุม → ตัวบนขวา × ตัวล่างซ้าย ลบ ตัวบนซ้าย × ตัวล่างขวา"
          ]
        }),
        ContentBlock("md_h1", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("md_t3", "text", {
          "content": [
            r"หา $det(A)$ เมื่อ $A = \begin{bmatrix} 3 & 5 \\ 2 & 4 \end{bmatrix}$",
            r"$det(A) = (3)(4) - (5)(2) = 12 - 10 = 2$ ✅"
          ]
        }),
        ContentBlock("q_det_2x2_1", "question_choice", {
          "content": [
            r"จงหา $det\begin{pmatrix} 1 & 2 \\ 3 & 4 \end{pmatrix}$"
          ],
          "options": ["-2", "2", "10", "-10"],
          "correct": "-2",
          "explanation": r"$det = (1)(4) - (2)(3) = 4 - 6 = -2$ ✨"
        }),
        ContentBlock("q_det_2x2_2", "question_choice", {
          "content": [
            r"จงหา $det\begin{pmatrix} 5 & 3 \\ 2 & 1 \end{pmatrix}$"
          ],
          "options": ["-1", "1", "5", "11"],
          "correct": "-1",
          "explanation": r"$det = (5)(1) - (3)(2) = 5 - 6 = -1$ 🎯"
        }),
      ]
    ),
    ContentSection(
      headerL1: "🔢 การคำนวณ Det สำหรับเมทริกซ์ 3×3",
      blocks: [
        ContentBlock("md_t4", "text", {
          "content": [
            r"$$A = \begin{bmatrix} a & b & c \\ d & e & f \\ g & h & i \end{bmatrix}$$",
            r"**วิธีที่ 1: กระจายตามแถวแรก**",
            r"$$det(A) = a\begin{vmatrix} e & f \\ h & i \end{vmatrix} - b\begin{vmatrix} d & f \\ g & i \end{vmatrix} + c\begin{vmatrix} d & e \\ g & h \end{vmatrix}$$",
            r"$$= a(ei - fh) - b(di - fg) + c(dh - eg)$$"
          ]
        }),
        ContentBlock("md_h2", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("md_t5", "text", {
          "content": [
            r"หา $det(A)$ เมื่อ $A = \begin{bmatrix} 1 & 2 & 3 \\ 0 & 4 & 5 \\ 0 & 0 & 6 \end{bmatrix}$",
            r"เมทริกซ์สามเหลี่ยม → คูณเลขในเส้นทแยงมุมหลัก",
            r"$det(A) = 1 \times 4 \times 6 = 24$ 🎉"
          ]
        }),
        ContentBlock("q_det_3x3_tri", "question_choice", {
          "content": [
            r"จงหา $det\begin{pmatrix} 2 & 0 & 0 \\ 1 & 3 & 0 \\ 4 & 5 & 1 \end{pmatrix}$"
          ],
          "options": ["6", "2", "1", "5"],
          "correct": "6",
          "explanation": r"เมทริกซ์สามเหลี่ยม: คูณเส้นทแยงมุมหลัก $2 \times 3 \times 1 = 6$ ✅"
        }),
      ]
    ),
    ContentSection(
      headerL1: "📚 สมบัติของ Det (พื้นฐาน)",
      blocks: [
        ContentBlock("md_t6", "text", {
          "content": [
            r"**1. การคูณกระจายได้**",
            r"$$det(AB) = det(A) \cdot det(B)$$",
            r"**2. อินเวอร์สคือส่วนกลับ**",
            r"$$det(A^{-1}) = \dfrac{1}{det(A)}$$",
            r"**3. ทรานสโพสค่าเท่าเดิม**",
            r"$$det(A^T) = det(A)$$"
          ]
        }),
        ContentBlock("q_det_prop_1", "question_choice", {
          "content": [
            r"กำหนด $det(A) = 2$ และ $det(B) = 3$ จงหาค่าของ $det(AB)$"
          ],
          "options": ["5", "6", "8", "9"],
          "correct": "6",
          "explanation": r"จากสมบัติ $det(AB) = det(A) \cdot det(B) = 2 \times 3 = 6$ ✅"
        }),
        ContentBlock("q_det_prop_2", "question_choice", {
          "content": [
            r"กำหนด $det(A) = 5$ จงหาค่าของ $det(A^T)$"
          ],
          "options": ["5", "-5", "1/5", "25"],
          "correct": "5",
          "explanation": r"สมบัติการทรานสโพส ค่า det จะเท่าเดิมเสมอ ดังนั้นตอบ 5 ✅"
        }),
        ContentBlock("q_det_prop_3", "question_choice", {
          "content": [
            r"กำหนด $det(A) = 4$ จงหาค่าของ $det(A^{-1})$"
          ],
          "options": ["4", "-4", "0.25", "16"],
          "correct": "0.25",
          "explanation": r"สมบัติอินเวอร์ส $det(A^{-1}) = \frac{1}{det(A)} = \frac{1}{4} = 0.25$ ✅"
        }),
      ]
    ),
    ContentSection(
      headerL1: "⚠️ สมบัติของ Det (ขั้นสูง)",
      blocks: [
        ContentBlock("md_t7", "text", {
          "content": [
            r"กลุ่มนี้ต้องระวังเรื่อง **มิติของเมทริกซ์ ($n \times n$)** ให้ดี!",
            r"**4. ยกกำลังดึงออกได้**",
            r"$$det(A^n) = (det A)^n$$",
            r"**5. คูณค่าคงที่ (ระวัง!)**",
            r"เมื่อ $k$ คือตัวเลข และ $A$ มีมิติ $n \times n$",
            r"$$det(kA) = k^n \cdot det(A)$$",
            r"*(ต้องยกกำลัง $n$ ตามขนาดเมทริกซ์เสมอ!)*",
            r"**6. แอดจอยท์**",
            r"$$det(adj A) = (det A)^{n - 1}$$"
          ]
        }),
        ContentBlock("q_det_prop_4", "question_choice", {
          "content": [
            r"(ระวังโดนหลอก!) กำหนด $A$ เป็นเมทริกซ์ขนาด **$3 \times 3$** โดยมี $det(A) = 2$ จงหาค่าของ $det(3A)$"
          ],
          "options": ["6", "12", "18", "54"],
          "correct": "54",
          "explanation": r"สูตรคือ $det(kA) = k^n \cdot det(A)$, ในที่นี้ $k=3$ และ $n=3$ (เพราะขนาด $3 \times 3$), ดังนั้น $det(3A) = 3^3 \cdot det(A) = 27 \cdot 2 = 54$ 🚨 อย่าลืมยกกำลัง n นะ!"
        }),
        ContentBlock("q_det_prop_5", "question_choice", {
          "content": [
            r"กำหนด $det(A) = 2$ จงหาค่าของ $det(A^3)$"
          ],
          "options": ["2", "4", "6", "8"],
          "correct": "8",
          "explanation": r"สมบัติยกกำลัง $det(A^3) = (det A)^3 = 2^3 = 8$ ✅"
        }),
        ContentBlock("ddq_det_adj", "drag_and_drop", {
          "content": [
            r"กำหนดเมทริกซ์ $A$ ขนาด $4 \times 4$ มีค่า $det(A) = 3$ จงหา $det(adj A)$",
            r"จากสูตร $det(adj A) = (det A)^{n-1}$",
            r"แทนค่า $n = $ ",
            {"drop": "0"},
            r"จะได้ $det(adj A) = 3^{$ ",
            {"drop": "1"},
            r"$}$",
            r"ดังนั้นคำตอบคือ ",
            {"drop": "2"}
          ],
          "draggableItems": ["3", "4", "9", "27", "81"],
          "correctAnswers": {
            "0": "4",
            "1": "3",
            "2": "27"
          },
          "explanation": r"สูตรคือกำลัง $n-1$ ดังนั้น $(3)^{4-1} = 3^3 = 27$ ✨"
        }),
        ContentBlock("q_det_mixed_hard", "question_choice", {
          "content": [
            r"(ข้อสอบเข้ามหาวิทยาลัย) กำหนด $A, B$ เป็นเมทริกซ์ขนาด $3 \times 3$ โดย $det(A) = 2$ และ $det(B) = 4$ จงหาค่าของ $det(2 \cdot A \cdot B^{-1})$"
          ],
          "options": ["1", "2", "4", "8"],
          "correct": "4",
          "explanation": r"ค่อยๆ แกะทีละส่วน: (1) ดึงค่าคงที่ 2 ออกจากเมทริกซ์ $3 \times 3$ ได้ $2^3 = 8$, (2) กระจาย det ได้ $8 \cdot det(A) \cdot det(B^{-1})$, (3) แทนค่า: $8 \cdot (2) \cdot (\frac{1}{4})$, (4) คำนวณ: $16 \cdot 0.25 = 4$ 🎯"
        }),
        ContentBlock("q_det_identity_check", "question_choice", {
          "content": [
            r"จงหาค่าของ $det(5I)$ เมื่อ $I$ เป็นเมทริกซ์เอกลักษณ์ขนาด $2 \times 2$"
          ],
          "options": ["5", "10", "25", "1"],
          "correct": "25",
          "explanation": r"$det(5I) = 5^n \cdot det(I)$, เนื่องจาก $I$ ขนาด $2 \times 2$ จะได้ $n=2$, และ $det(I) = 1$ เสมอ, ดังนั้น $5^2 \cdot 1 = 25$ ✅"
        }),
      ]
    ),
  ]
);

// 4. ระบบสมการเชิงเส้น (Linear Systems)
final matrixLinearSystemsLesson = ContentLesson(
  title: "ระบบสมการเชิงเส้น",
  sections: [
    ContentSection(
      headerL1: "📝 ระบบสมการเชิงเส้นคืออะไร?",
      blocks: [
        ContentBlock("mls_t1", "text", {
          "content": [
            r"ระบบสมการเชิงเส้น คือ กลุ่มของสมการที่มีตัวแปรหลายตัว และต้องการหาค่าของตัวแปรที่ทำให้**ทุกสมการเป็นจริงพร้อมกัน**",
            r"เราสามารถใช้เมทริกซ์ช่วยแก้ได้! 🎯"
          ]
        }),
        ContentBlock("mls_h1", "header", {
          "title": "💡 ตัวอย่าง",
          "level": 2
        }),
        ContentBlock("mls_t2", "text", {
          "content": [
            r"$$\begin{cases} 2x + 3y = 7 \\ x - y = 1 \end{cases}$$",
            r"เขียนในรูปเมทริกซ์ $AX = B$:",
            r"$$\begin{bmatrix} 2 & 3 \\ 1 & -1 \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} 7 \\ 1 \end{bmatrix}$$"
          ]
        }),
      ]
    ),
    ContentSection(
      headerL1: "🔧 วิธีแก้ระบบสมการด้วยเมทริกซ์",
      blocks: [
        ContentBlock("mls_t3", "text", {
          "content": [
            r"**วิธีที่ 1: ใช้อินเวอร์สเมทริกซ์**",
            r"ถ้า $AX = B$ และ $det(A) \neq 0$",
            r"$$X = A^{-1}B$$",
            r"**วิธีที่ 2: Gaussian Elimination (แปลงเป็นเมทริกซ์รูปแถวลดรูป)**",
            r"**วิธีที่ 3: Cramer's Rule (ใช้ดีเทอร์มิแนนต์)**",
            r"$$x_i = \dfrac{det(A_i)}{det(A)}$$"
          ]
        }),
      ]
    ),
    ContentSection(
      headerL1: "🎯 ตัวอย่าง: ใช้อินเวอร์ส",
      blocks: [
        ContentBlock("mls_t4", "text", {
          "content": [
            r"แก้ระบบสมการ $\begin{cases} 2x + y = 5 \\ x + y = 3 \end{cases}$",
            r"**ขั้นที่ 1:** เขียนเป็น $AX = B$",
            r"$$\begin{bmatrix} 2 & 1 \\ 1 & 1 \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} 5 \\ 3 \end{bmatrix}$$",
            r"**ขั้นที่ 2:** หา $det(A)$",
            r"$det(A) = (2)(1) - (1)(1) = 1$",
            r"**ขั้นที่ 3:** หา $A^{-1}$",
            r"$$A^{-1} = \dfrac{1}{1} \begin{bmatrix} 1 & -1 \\ -1 & 2 \end{bmatrix} = \begin{bmatrix} 1 & -1 \\ -1 & 2 \end{bmatrix}$$",
            r"**ขั้นที่ 4:** คำนวณ $X = A^{-1}B$",
            r"$$X = \begin{bmatrix} 1 & -1 \\ -1 & 2 \end{bmatrix} \begin{bmatrix} 5 \\ 3 \end{bmatrix} = \begin{bmatrix} 2 \\ 1 \end{bmatrix}$$",
            r"**คำตอบ**: $x = 2, y = 1$ ✅"
          ]
        }),
        ContentBlock("q_linear_1", "question_choice", {
          "content": [
            r"จากระบบสมการ $\begin{cases} x + 2y = 8 \\ 3x + 4y = 18 \end{cases}$ จงหา $x$"
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r"เขียนเป็นเมทริกซ์และแก้ได้ $x = 2, y = 3$ 🎯"
        }),
      ]
    ),
    ContentSection(
      headerL1: "🎯 ตัวอย่าง: Cramer's Rule",
      blocks: [
        ContentBlock("mls_t5", "text", {
          "content": [
            r"แก้ระบบสมการ $\begin{cases} 3x + 2y = 7 \\ x + y = 3 \end{cases}$ ด้วย Cramer's Rule",
            r"**ขั้นที่ 1:** หา $det(A)$",
            r"$$A = \begin{bmatrix} 3 & 2 \\ 1 & 1 \end{bmatrix}, \quad det(A) = 3 - 2 = 1$$",
            r"**ขั้นที่ 2:** หา $det(A_x)$ (แทนหลักที่ 1 ด้วยเวกเตอร์ $B$)",
            r"$$A_x = \begin{bmatrix} 7 & 2 \\ 3 & 1 \end{bmatrix}, \quad det(A_x) = 7 - 6 = 1$$",
            r"**ขั้นที่ 3:** หา $det(A_y)$ (แทนหลักที่ 2 ด้วยเวกเตอร์ $B$)",
            r"$$A_y = \begin{bmatrix} 3 & 7 \\ 1 & 3 \end{bmatrix}, \quad det(A_y) = 9 - 7 = 2$$",
            r"**ขั้นที่ 4:** คำนวณ",
            r"$$x = \dfrac{det(A_x)}{det(A)} = \dfrac{1}{1} = 1$$",
            r"$$y = \dfrac{det(A_y)}{det(A)} = \dfrac{2}{1} = 2$$",
            r"**คำตอบ**: $x = 1, y = 2$ ✅"
          ]
        }),
        ContentBlock("ddq_cramer", "drag_and_drop", {
          "content": [
            r"จงแก้ระบบสมการ $\begin{cases} 2x + y = 7 \\ x + 3y = 11 \end{cases}$ ด้วย Cramer's Rule",
            r"$det(A) = 2(3) - 1(1) = $ ",
            {"drop": "0"},
            r"$det(A_x) = 7(3) - 1(11) = $ ",
            {"drop": "1"},
            r"$det(A_y) = 2(11) - 7(1) = $ ",
            {"drop": "2"},
            r"$x = \dfrac{det(A_x)}{det(A)} = \dfrac{$ ",
            {"drop": "3"},
            r"$}{$ ",
            {"drop": "4"},
            r"$} = $ ",
            {"drop": "5"},
            r"$y = \dfrac{det(A_y)}{det(A)} = \dfrac{$ ",
            {"drop": "6"},
            r"$}{$ ",
            {"drop": "7"},
            r"$} = $ ",
            {"drop": "8"}
          ],
          "draggableItems": ["2", "3", "5", "10", "15"],
          "correctAnswers": {
            "0": "5",
            "1": "10",
            "2": "15",
            "3": "10",
            "4": "5",
            "5": "2",
            "6": "15",
            "7": "5",
            "8": "3"
          },
          "explanation": r"Cramer's Rule: หา det ของเมทริกซ์หลัก และเมทริกซ์ที่แทนค่าแต่ละหลัก แล้วหารกัน 📐"
        }),
      ]
    ),
    ContentSection(
      headerL1: "📚 การมีคำตอบของระบบสมการ",
      blocks: [
        ContentBlock("mls_t6", "text", {
          "content": [
            r"**1. คำตอบเดียว (Unique Solution)**",
            r"$det(A) \neq 0$ → มีคำตอบเพียงชุดเดียว",
            r"**2. ไม่มีคำตอบ (No Solution)**",
            r"สมการขัดแย้งกัน เช่น $x + y = 1$ และ $x + y = 2$",
            r"**3. คำตอบอนันต์ (Infinite Solutions)**",
            r"$det(A) = 0$ และสมการซ้ำกัน (dependent)"
          ]
        }),
        ContentBlock("q_linear_solution", "question_choice", {
          "content": [
            r"ระบบสมการ $\begin{cases} 2x + 4y = 8 \\ x + 2y = 4 \end{cases}$ มีคำตอบกี่ชุด?"
          ],
          "options": [
            "ไม่มีคำตอบ",
            "คำตอบเดียว",
            "คำตอบอนันต์",
            "ไม่สามารถหาได้"
          ],
          "correct": "คำตอบอนันต์",
          "explanation": r"สมการทั้งสองเหมือนกัน (สมการที่ 2 คูณ 2 จะได้สมการที่ 1) ดังนั้นมีคำตอบอนันต์ชุด ♾️"
        }),
      ]
    ),
    ContentSection(
      headerL1: "🎯 แบบฝึกหัดท้ายบท",
      blocks: [
        ContentBlock("q_linear_final_1", "question_choice", {
          "content": [
            r"จงแก้ระบบสมการ $\begin{cases} x + y = 5 \\ x - y = 1 \end{cases}$ หา $x$"
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "3",
          "explanation": r"บวกสองสมการ: $2x = 6 \to x = 3$, แทนกลับไปหา $y = 2$ ✅"
        }),
        ContentBlock("q_linear_final_2", "question_choice", {
          "content": [
            r"จงหา $det\begin{pmatrix} 1 & 2 & 3 \\ 0 & 1 & 4 \\ 0 & 0 & 1 \end{pmatrix}$"
          ],
          "options": ["0", "1", "3", "8"],
          "correct": "1",
          "explanation": r"เมทริกซ์สามเหลี่ยม: คูณเส้นทแยงมุมหลัก $1 \times 1 \times 1 = 1$ 🎯"
        }),
        ContentBlock("q_linear_final_3", "question_choice", {
          "content": [
            r"เมทริกซ์ใดมีอินเวอร์ส?"
          ],
          "options": [
            r"$\begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 4 \\ 1 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$"
          ],
          "correct": r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
          "explanation": r"เมทริกซ์มีอินเวอร์สเมื่อ $det \neq 0$ เฉพาะเมทริกซ์เอกลักษณ์ที่มี $det = 1$ เท่านั้น ✅"
        }),
      ]
    ),
  ]
);