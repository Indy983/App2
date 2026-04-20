import '../../../ui/content_models.dart';

// =====================================================================
// GROUP 1: พื้นฐานเมทริกซ์
// =====================================================================

// Lesson 1: พื้นฐานและการบวกลบเมทริกซ์
final matrixBasicsLesson = ContentLesson(
  title: "พื้นฐานและการบวกลบเมทริกซ์",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: เมทริกซ์ คืออะไร? (รวมการเท่ากัน)
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"เมทริกซ์ คืออะไร?",
      blocks: [
        ContentBlock("mat_t_001", "text", {
          "content": [
            r'''เมทริกซ์ก็คือการเอาตัวเลขมาจัดเรียงเป็นตาราง เหมือนที่นั่งในห้องเรียนนั่นเอง! 🪑''',
            r'''ลองนึกภาพห้องเรียนที่มี 3 แถว 4 หลัก แล้วจดคะแนนสอบตามตำแหน่งที่นั่ง ก็จะได้เมทริกซ์ขึ้นมา''',
          ],
        }),
        ContentBlock("mat_img_001", "image", {
          "path": "assets/matrix_classroom.png",
        }),
        ContentBlock("mat_t_002", "text", {
          "content": [
            r'''เขียนเป็นคณิตศาสตร์จะได้แบบนี้ $$\begin{bmatrix} 10 & 8 & 8 & 6 \\ 7 & 8 & 5 & 6 \\ 8 & 7 & 6 & 5 \end{bmatrix}$$''',
            r'''แนวนอนเรียกว่า **แถว** (row) แนวตั้งเรียกว่า **หลัก** (column) เมทริกซ์นี้มี 3 แถว 4 หลัก เรียกว่าขนาด $3 \times 4$''',
          ],
        }),
        ContentBlock("mat_t_003", "text", {
          "content": [
            r'''$a_{ij}$ คือตัวเลขที่อยู่ **แถวที่ $i$ หลักที่ $j$** เช่น $a_{12}$ หมายถึงแถวที่ 1 หลักที่ 2 ซึ่งในเมทริกซ์ข้างบนก็คือ 8''',
            r'''Note = จำง่ายๆ: ตัวเลขตัวแรกคือแถว ตัวหลังคือหลัก''',
          ],
        }),

        // Q1: อ่านตำแหน่งพื้นฐาน
        ContentBlock("mat_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $A_{12}$ ของ $$A = \begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix}$$''',
          ],
          "options": ["3", "4", "5", "6"],
          "correct": "6",
          "explanation": r'''$a_{12}$ = แถวที่ 1 หลักที่ 2 = **6**''',
        }),

        // Q2: ตำแหน่ง + ขนาดเมทริกซ์
        ContentBlock("mat_q_002", "question_choice", {
          "content": [
            r'''2. ให้เมทริกซ์ $A = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}$ มีขนาด $m \times n$ จงหา $A_{23} + m + n$''',
          ],
          "options": ["9", "12", "15", "18"],
          "correct": "12",
          "explanation": r'''เมทริกซ์นี้มี 3 แถว 3 หลัก ดังนั้น $m = 3$ และ $n = 3$

$A_{23}$ = แถว 2 หลัก 3 = **6**

รวมกัน $6 + 3 + 3 = 12$''',
        }),

        // ── headerL2: การเท่ากัน ──
        ContentBlock("mat_h_001", "header", {
          "title": r"การเท่ากันของเมทริกซ์",
          "level": 2,
        }),
        ContentBlock("mat_t_004", "text", {
          "content": [
            r'''เมทริกซ์สองตัวจะเท่ากันก็ต่อเมื่อ **ทุกตำแหน่งมีค่าตรงกัน**''',
            r'''วิธีคิดง่ายๆ คือ มองตำแหน่งเดียวกัน ตั้งสมการ แล้วแก้หาตัวแปรเลย''',
          ],
        }),

        // DDQ: ฝึกเทียบตำแหน่งหาตัวแปร
        ContentBlock("mat_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mat_ddq_001_s1",
              "content": [
                r'''ให้ $\begin{bmatrix} x+1 & 2y \\ 3 & 5 \end{bmatrix} = \begin{bmatrix} 4 & 6 \\ 3 & 5 \end{bmatrix}$

เทียบตำแหน่งเดียวกัน:

ตำแหน่ง $(1,1)$: $x + 1 = 4$ ได้ $x = $ ''',
                {"drop": "0"},
                r'''

ตำแหน่ง $(1,2)$: $2y = 6$ ได้ $y = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"1", r"2", r"3", r"4", r"5"],
              "correctAnswers": {"0": r"3", "1": r"3"},
              "explanation": r'''เทียบตำแหน่งเดียวกันแล้วแก้สมการ: $x + 1 = 4 \to x = 3$ และ $2y = 6 \to y = 3$''',
            },
          ],
        }),

        // Q3: การเท่ากัน — หา x
        ContentBlock("mat_q_003", "question_choice", {
          "content": [
            r'''3. จงหา $x$ เมื่อ $$\begin{bmatrix} 2 & 3 & 4 \\ -1 & 8 & 6 \\ 0 & 5 & 6 \end{bmatrix} = \begin{bmatrix} 2 & 3 & 4 \\ -1 & 8 & 6 \\ 0 & 2x+1 & 6 \end{bmatrix}$$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r'''ตำแหน่ง $(3,2)$: $5 = 2x + 1$

$2x = 4$ จึงได้ $x = 2$''',
        }),

        // Q4: การเท่ากัน — สองตัวแปร + ขนาด
        ContentBlock("mat_q_004", "question_choice", {
          "content": [
            r'''4. ให้เมทริกซ์ขนาด $m \times n$ $$\begin{bmatrix} x+1 & 2y \\ 5 & 7 \end{bmatrix} = \begin{bmatrix} 4 & 6 \\ 5 & 7 \end{bmatrix}$$ จงหา $x + y + m \cdot n$''',
          ],
          "options": ["8", "10", "12", "14"],
          "correct": "10",
          "explanation": r'''ตำแหน่ง $(1,1)$: $x + 1 = 4 \to x = 3$

ตำแหน่ง $(1,2)$: $2y = 6 \to y = 3$

เมทริกซ์มี 2 แถว 2 หลัก ดังนั้น $m \cdot n = 2 \times 2 = 4$

$x + y + m \cdot n = 3 + 3 + 4 = 10$''',
        }),

        // Q5: เท่ากัน — นิพจน์ซับซ้อน + อ่านตำแหน่ง
        ContentBlock("mat_q_005", "question_choice", {
          "content": [
            r'''5. ให้ $\begin{bmatrix} a & 3b - 1 \\ c^2 - 2c + 8 & d \end{bmatrix} = \begin{bmatrix} 2 & 5 \\ 7 & 3 \end{bmatrix}$ จงหา $A_{21} \cdot a + \dfrac{b \cdot d}{c}$''',
          ],
          "options": ["16", "18", "20", "22"],
          "correct": "20",
          "explanation": r'''เทียบทีละตำแหน่ง:

$(1,1)$: $a = 2$

$(1,2)$: $3b - 1 = 5 \to b = 2$

$(2,1)$: $c^2 - 2c + 8 = 7 \to c^2 - 2c + 1 = 0 \to (c - 1)^2 = 0 \to c = 1$

$(2,2)$: $d = 3$

$A_{21}$ คือค่าที่แถว 2 หลัก 1 = **7**

แทนค่า: $7 \cdot 2 + \dfrac{2 \cdot 3}{1} = 14 + 6 = 20$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: การบวกลบเมทริกซ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"การบวกลบเมทริกซ์",
      blocks: [
        ContentBlock("mat_add_t_001", "text", {
          "content": [
            r'''การบวกลบเมทริกซ์ทำได้ง่ายมาก แค่ **บวกหรือลบตัวเลขในตำแหน่งเดียวกัน** 📏''',
            r'''แต่มีเงื่อนไขสำคัญ: **เมทริกซ์ต้องมีขนาดเท่ากัน** ถ้าขนาดไม่เท่ากันจะบวกลบไม่ได้เลย ❌''',
          ],
        }),
        ContentBlock("mat_add_t_002", "text", {
          "content": [
            r'''ตัวอย่างเช่น $$\begin{bmatrix} 2 & 3 \\ 4 & 5 \end{bmatrix} + \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} = \begin{bmatrix} 3 & 5 \\ 7 & 9 \end{bmatrix}$$''',
            r'''เห็นไหม? แค่บวกทีละตำแหน่ง: $2+1=3$, $3+2=5$, $4+3=7$, $5+4=9$''',
          ],
        }),

        // DDQ: ขนาดไม่เท่ากัน บวกได้ไหม?
        ContentBlock("mat_add_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mat_add_ddq_001_s1",
              "content": [
                r'''$C = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$ มีขนาด $2 \times 3$

$D = \begin{bmatrix} 7 & 8 \\ 9 & 10 \end{bmatrix}$ มีขนาด $2 \times 2$

สามารถหา $C + D$ ได้หรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"ได้", r"ไม่ได้"],
              "correctAnswers": {"0": r"ไม่ได้"},
              "explanation": r'''ขนาดไม่เท่ากัน ($2 \times 3$ กับ $2 \times 2$) จึงบวกกันไม่ได้''',
            },
          ],
        }),

        // DDQ: ลองลบเมทริกซ์
        ContentBlock("mat_add_ddq_002", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mat_add_ddq_002_s1",
              "content": [
                r'''ลองหา $\begin{bmatrix} 5 & 8 \\ 3 & 7 \end{bmatrix} - \begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$

ลบทีละตำแหน่งจะได้ ''',
                {"drop": "0"}
              ],
              "draggableItems": [r"$\begin{bmatrix} 3 & 2 \\ 5 & 2 \end{bmatrix}$", r"$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$", r"$\begin{bmatrix} 3 & 5 \\ 2 & 3 \end{bmatrix}$", r"$\begin{bmatrix} 5 & 8 \\ 3 & 7 \end{bmatrix}$"],
              "correctAnswers": {"0": r"$\begin{bmatrix} 3 & 5 \\ 2 & 3 \end{bmatrix}$"},
              "explanation": r'''ลบทีละตำแหน่ง: $5-2=3$, $8-3=5$, $3-1=2$, $7-4=3$''',
            },
          ],
        }),

        // Q1: บวกเมทริกซ์
        ContentBlock("mat_add_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $A + B$ เมื่อ $A = \begin{bmatrix} 3 & 5 \\ 7 & 9 \end{bmatrix}$ และ $B = \begin{bmatrix} 2 & 4 \\ 6 & 8 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 9 \\ 13 & 17 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 6 & 20 \\ 42 & 72 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 1 \\ 1 & 1 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 5 & 9 \\ 13 & 17 \end{bmatrix}$",
          "explanation": r'''บวกทีละตำแหน่ง: $3+2=5$, $5+4=9$, $7+6=13$, $9+8=17$''',
        }),

        // Q2: ลบเมทริกซ์ 2×3
        ContentBlock("mat_add_q_002", "question_choice", {
          "content": [
            r'''2. จงหา $C - D$ เมื่อ $C = \begin{bmatrix} 10 & 8 & 6 \\ 4 & 2 & 0 \end{bmatrix}$ และ $D = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 9 & 6 & 3 \\ 0 & -3 & -6 \end{bmatrix}$",
            r"$\begin{bmatrix} 11 & 10 & 9 \\ 8 & 7 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 10 & 16 & 18 \\ 16 & 10 & 0 \end{bmatrix}$",
            r"ไม่สามารถคำนวณได้",
          ],
          "correct": r"$\begin{bmatrix} 9 & 6 & 3 \\ 0 & -3 & -6 \end{bmatrix}$",
          "explanation": r'''ลบทีละตำแหน่ง ได้ $\begin{bmatrix} 9 & 6 & 3 \\ 0 & -3 & -6 \end{bmatrix}$''',
        }),

        // Q3: หาตัวแปรจากการบวก
        ContentBlock("mat_add_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $\begin{bmatrix} x & 3 \\ 5 & y \end{bmatrix} + \begin{bmatrix} 2 & 1 \\ 3 & 4 \end{bmatrix} = \begin{bmatrix} 5 & 4 \\ 8 & 9 \end{bmatrix}$ จงหา $x + y$''',
          ],
          "options": ["7", "8", "9", "10"],
          "correct": "8",
          "explanation": r'''ตำแหน่ง $(1,1)$: $x + 2 = 5 \to x = 3$

ตำแหน่ง $(2,2)$: $y + 4 = 9 \to y = 5$

ดังนั้น $x + y = 8$''',
        }),

        // Q4: หา B จาก A - B
        ContentBlock("mat_add_q_004", "question_choice", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ และ $A - B = \begin{bmatrix} 0 & 1 \\ 1 & 2 \end{bmatrix}$ จงหา $b_{22}$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r'''จาก $A - B$ จัดรูปได้ $B = A - (A - B)$

$B = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} - \begin{bmatrix} 0 & 1 \\ 1 & 2 \end{bmatrix} = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix}$

ดังนั้น $b_{22} = 2$''',
        }),

        // Q5: ขนาดต่างกัน — บวกไม่ได้
        ContentBlock("mat_add_q_005", "question_choice", {
          "content": [
            r'''5. ให้ $E = \begin{bmatrix} 1 & 2 \end{bmatrix}$ และ $F = \begin{bmatrix} 3 \\ 4 \end{bmatrix}$ จงหา $E + F$''',
          ],
          "options": [
            r"$\begin{bmatrix} 4 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 \\ 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 2 \\ 1 & 4 \end{bmatrix}$",
            r"ไม่สามารถคำนวณได้",
          ],
          "correct": r"ไม่สามารถคำนวณได้",
          "explanation": r'''$E$ มีขนาด $1 \times 2$ ส่วน $F$ มีขนาด $2 \times 1$

ขนาดไม่เท่ากัน จึงบวกกันไม่ได้''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: การคูณเมทริกซ์ด้วยค่าคงที่
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"การคูณเมทริกซ์ด้วยค่าคงที่",
      blocks: [
        // DDQ: ลองเดาก่อน
        ContentBlock("mat_sc_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mat_sc_ddq_001_s1",
              "content": [
                r'''🎲 ลองเดาดูว่า $5 \cdot \begin{bmatrix} 1 & 2 & 3 \\ 0 & 1 & 2 \end{bmatrix}$ ตำแหน่ง $a_{23}$ จะได้เท่าไหร่?

$a_{23} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"2", r"5", r"7", r"10", r"15"],
              "correctAnswers": {"0": r"10"},
              "explanation": r'''ตำแหน่ง $a_{23}$ เดิมคือ 2 เมื่อคูณด้วย 5 จะได้ $2 \times 5 = 10$''',
            },
          ],
        }),

        ContentBlock("mat_sc_t_001", "text", {
          "content": [
            r'''หลักการง่ายมาก: **คูณค่าคงที่เข้ากับทุกตัวในเมทริกซ์** $$k \cdot A = [k \cdot a_{ij}]$$''',
            r'''เช่น $3 \cdot \begin{bmatrix} 2 & 4 \\ 6 & 8 \end{bmatrix} = \begin{bmatrix} 6 & 12 \\ 18 & 24 \end{bmatrix}$''',
          ],
        }),

        // Q1: คูณตรงๆ
        ContentBlock("mat_sc_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $4 \cdot \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 4 & 8 \\ 12 & 16 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 6 \\ 7 & 8 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 4 \\ 4 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 4 & 8 \\ 12 & 16 \end{bmatrix}$",
          "explanation": r'''คูณทุกตัวด้วย 4: $1 \times 4 = 4$, $2 \times 4 = 8$, $3 \times 4 = 12$, $4 \times 4 = 16$''',
        }),

        // Q2: ย้อนกลับหา A จาก kA
        ContentBlock("mat_sc_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $2A = \begin{bmatrix} 6 & 10 \\ 14 & 18 \end{bmatrix}$ จงหา $a_{12}$''',
          ],
          "options": ["3", "5", "10", "20"],
          "correct": "5",
          "explanation": r'''ถ้า $2A$ ให้ผลลัพธ์แบบนี้ แสดงว่า $A$ ต้องหารด้วย 2

$A = \begin{bmatrix} 3 & 5 \\ 7 & 9 \end{bmatrix}$ ดังนั้น $a_{12} = 5$''',
        }),

        // Q3: คูณแล้วมีตัวแปร x²
        ContentBlock("mat_sc_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $2 \cdot \begin{bmatrix} x & 3 \\ 4 & x^2 \end{bmatrix} = \begin{bmatrix} 6 & 6 \\ 8 & 18 \end{bmatrix}$ จงหาค่า $x$ ที่เป็นจำนวนเต็มบวก''',
          ],
          "options": ["2", "3", "6", "9"],
          "correct": "3",
          "explanation": r'''ตำแหน่ง $(1,1)$: $2x = 6 \to x = 3$

ตรวจสอบตำแหน่ง $(2,2)$: $2x^2 = 2(9) = 18$ ✓''',
        }),

        // Q4: 3A - 2B หา b₂₁
        ContentBlock("mat_sc_q_004", "question_choice", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 3 & 5 \\ 7 & 9 \end{bmatrix}$ และ $3A - 2B = \begin{bmatrix} 7 & 9 \\ 11 & 13 \end{bmatrix}$ จงหา $b_{21}$''',
          ],
          "options": ["1", "3", "5", "10"],
          "correct": "5",
          "explanation": r'''$3A = \begin{bmatrix} 9 & 15 \\ 21 & 27 \end{bmatrix}$

$2B = 3A - \begin{bmatrix} 7 & 9 \\ 11 & 13 \end{bmatrix} = \begin{bmatrix} 2 & 6 \\ 10 & 14 \end{bmatrix}$

$B = \begin{bmatrix} 1 & 3 \\ 5 & 7 \end{bmatrix}$ ดังนั้น $b_{21} = 5$''',
        }),

        // Q5: A + 2A = 3A
        ContentBlock("mat_sc_q_005", "question_choice", {
          "content": [
            r'''5. ให้ $A + 2A = \begin{bmatrix} 9 & 12 \\ 15 & 18 \end{bmatrix}$ จงหา $a_{22}$''',
          ],
          "options": ["3", "6", "9", "18"],
          "correct": "6",
          "explanation": r'''$A + 2A = 3A = \begin{bmatrix} 9 & 12 \\ 15 & 18 \end{bmatrix}$

ดังนั้น $A = \begin{bmatrix} 3 & 4 \\ 5 & 6 \end{bmatrix}$ และ $a_{22} = 6$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: แบบฝึกหัดผสม
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"แบบฝึกหัดผสม",
      blocks: [
        ContentBlock("mat_mix_t_001", "text", {
          "content": [
            r'''ลองทำโจทย์ที่ผสมทุกเรื่องเข้าด้วยกัน ใช้แนวคิดเรื่องตำแหน่ง ความเท่ากัน การบวกลบ และการคูณค่าคงที่มาช่วยกันได้เลย 💪''',
          ],
        }),

        // Q1: scalar + บวก + หาตัวแปร
        ContentBlock("mat_mix_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $2 \cdot \begin{bmatrix} a & 1 \\ 3 & b \end{bmatrix} + \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} = \begin{bmatrix} 7 & 4 \\ 9 & 14 \end{bmatrix}$ จงหา $a + b$''',
          ],
          "options": ["6", "7", "8", "9"],
          "correct": "8",
          "explanation": r'''คูณก่อน: $2 \cdot \begin{bmatrix} a & 1 \\ 3 & b \end{bmatrix} = \begin{bmatrix} 2a & 2 \\ 6 & 2b \end{bmatrix}$

ตำแหน่ง $(1,1)$: $2a + 1 = 7 \to a = 3$

ตำแหน่ง $(2,2)$: $2b + 4 = 14 \to b = 5$

ดังนั้น $a + b = 8$''',
        }),

        // Q2: หา B จากสมการ 3A - B
        ContentBlock("mat_mix_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $3A - B = \begin{bmatrix} 5 & 7 \\ 1 & 3 \end{bmatrix}$ เมื่อ $A = \begin{bmatrix} 2 & 3 \\ 1 & 2 \end{bmatrix}$ จงหา $b_{12}$''',
          ],
          "options": ["1", "2", "3", "7"],
          "correct": "2",
          "explanation": r'''$3A = \begin{bmatrix} 6 & 9 \\ 3 & 6 \end{bmatrix}$

$B = 3A - \begin{bmatrix} 5 & 7 \\ 1 & 3 \end{bmatrix} = \begin{bmatrix} 1 & 2 \\ 2 & 3 \end{bmatrix}$

ดังนั้น $b_{12} = 2$''',
        }),

        // Q3: เท่ากัน + นิพจน์สองตัวแปร
        ContentBlock("mat_mix_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $\begin{bmatrix} 2x & x+y \\ 3 & 5 \end{bmatrix} = \begin{bmatrix} 6 & 7 \\ 3 & 5 \end{bmatrix}$ จงหา $2x - y$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r'''ตำแหน่ง $(1,1)$: $2x = 6 \to x = 3$

ตำแหน่ง $(1,2)$: $x + y = 7 \to 3 + y = 7 \to y = 4$

ดังนั้น $2x - y = 6 - 4 = 2$''',
        }),

        // Q4: รวมค่าคงที่ก่อนคิด
        ContentBlock("mat_mix_q_004", "question_choice", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & -1 \\ 2 & 0 \end{bmatrix}$ จงหา $2A + 3A - 4A$''',
          ],
          "options": [
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & -1 \\ 2 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & -2 \\ 4 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & -5 \\ 10 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 1 & -1 \\ 2 & 0 \end{bmatrix}$",
          "explanation": r'''รวมค่าคงที่ก่อน: $2A + 3A - 4A = (2 + 3 - 4)A = 1 \cdot A = A$

ดังนั้นคำตอบก็คือ $A$ เอง!''',
        }),

        // Q5: ระบบสมการเมทริกซ์ A+B, A-B
        ContentBlock("mat_mix_q_005", "question_choice", {
          "content": [
            r'''5. ให้ $A + B = \begin{bmatrix} 6 & 8 \\ 10 & 12 \end{bmatrix}$ และ $A - B = \begin{bmatrix} 2 & 4 \\ 6 & 8 \end{bmatrix}$ จงหา $a_{11}$''',
          ],
          "options": ["2", "3", "4", "6"],
          "correct": "4",
          "explanation": r'''เอาสมการทั้งสองมาบวกกัน:

$(A + B) + (A - B) = 2A$

$2A = \begin{bmatrix} 6+2 & 8+4 \\ 10+6 & 12+8 \end{bmatrix} = \begin{bmatrix} 8 & 12 \\ 16 & 20 \end{bmatrix}$

$A = \begin{bmatrix} 4 & 6 \\ 8 & 10 \end{bmatrix}$ ดังนั้น $a_{11} = 4$''',
        }),

        // Q6: คูณค่าคงที่ + ขนาดเมทริกซ์
        ContentBlock("mat_mix_q_006", "question_choice", {
          "content": [
            r'''6. ให้ $2A = \begin{bmatrix} 4 & 6 & 8 \\ 10 & 12 & 14 \end{bmatrix}$ โดย $A$ มีขนาด $m \times n$ จงหา $a_{12} + m \cdot n$''',
          ],
          "options": ["6", "9", "12", "15"],
          "correct": "9",
          "explanation": r'''$A = \begin{bmatrix} 2 & 3 & 4 \\ 5 & 6 & 7 \end{bmatrix}$ ดังนั้น $a_{12} = 3$

$A$ มี 2 แถว 3 หลัก จึงได้ $m = 2$ และ $n = 3$

$a_{12} + m \cdot n = 3 + (2 \times 3) = 3 + 6 = 9$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 5: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("mat_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**เมทริกซ์** คือตารางตัวเลข ใช้ $a_{ij}$ อ่านค่าจากแถวที่ $i$ หลักที่ $j$ ขนาด $m \times n$ คือจำนวนแถว $\times$ จำนวนหลัก''',
            r'''**เท่ากัน** = ทุกตำแหน่งตรงกัน → เทียบตำแหน่งแล้วตั้งสมการหาตัวแปรได้เลย''',
            r'''**บวกลบ** ทำได้เมื่อขนาดเท่ากัน แค่บวก/ลบทีละตำแหน่ง''',
            r'''**คูณค่าคงที่** กระจายคูณทุกตัวในเมทริกซ์''',
          ],
        }),
      ],
    ),
  ],
);
// ─────────────────────────────────────────────────────────────────────────────
// Lesson 2: การคูณเมทริกซ์
// ─────────────────────────────────────────────────────────────────────────────
final matrixMultiplicationLesson = ContentLesson(
  title: "การคูณเมทริกซ์",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: การคูณเมทริกซ์ด้วยเมทริกซ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"การคูณเมทริกซ์ด้วยเมทริกซ์",
      blocks: [
        ContentBlock("mmul_t_001", "text", {
          "content": [
            r'''การคูณเมทริกซ์ไม่เหมือนการบวกลบ ที่แค่ทำทีละตำแหน่ง — มันซับซ้อนกว่านิดหน่อย แต่เข้าใจหลักการแล้วทำได้แน่นอน!''',
          ],
        }),

        // ── เงื่อนไขการคูณ ──
        ContentBlock("mmul_h_001", "header", {
          "title": r"เมื่อไหร่ถึงคูณได้?",
          "level": 2,
        }),
        ContentBlock("mmul_t_002", "text", {
          "content": [
            r'''ลองนึกภาพต่อจิ๊กซอว์ 🧩 ชิ้นซ้ายกับชิ้นขวาจะต่อกันได้ ปุ่มต้องพอดีกัน''',
            r'''เมทริกซ์ก็เหมือนกัน: **จำนวนหลักของตัวหน้า** ต้องเท่ากับ **จำนวนแถวของตัวหลัง** ถึงจะคูณกันได้''',
          ],
        }),
        ContentBlock("mmul_t_003", "text", {
          "content": [
            r'''ถ้า $A$ ขนาด $m \times \colorbox{yellow}{n}$ คูณกับ $B$ ขนาด $\colorbox{yellow}{n} \times p$ → ตรงกลางต้องเท่ากัน!''',
            r'''ผลลัพธ์จะเป็นเมทริกซ์ขนาด $m \times p$ (เอาด้านนอกสุดมาประกอบกัน)''',
          ],
        }),
        ContentBlock("mmul_img_001", "image", {
          "path": "assets/matrix_multiply_condition.png",
        }),
        ContentBlock("mmul_t_004", "text", {
          "content": [
            r'''Note = จำง่ายๆ: ตรงกลางต้องเท่ากันถึงคูณได้ ผลลัพธ์เอาด้านนอกมาประกอบ''',
          ],
        }),

        // ── แต่ละช่องคิดยังไง? ──
        ContentBlock("mmul_h_002", "header", {
          "title": r"แต่ละช่องของผลลัพธ์มาจากไหน?",
          "level": 2,
        }),
        ContentBlock("mmul_t_005", "text", {
          "content": [
            r'''ค่าในช่อง $c_{ij}$ ของผลคูณ $AB$ ได้จาก: เอา **แถวที่ $i$ ของ $A$** มาจับคู่กับ **หลักที่ $j$ ของ $B$** แล้วคูณทีละคู่แล้วบวกรวมกัน''',
          ],
        }),
        ContentBlock("mmul_t_006", "text", {
          "content": [
            r'''ตัวอย่าง: $\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix} \begin{bmatrix} 2 & 0 \\ 1 & 3 \end{bmatrix}$''',
            r'''หา $c_{12}$: ใช้แถว 1 ของ $A$ คือ $[1, 2]$ จับกับหลัก 2 ของ $B$ คือ $[0, 3]$ ได้ $1 \cdot 0 + 2 \cdot 3 = 6$''',
          ],
        }),
        ContentBlock("mmul_img_002", "image", {
          "path": "assets/matrix_multiply_row_col.png",
        }),
        ContentBlock("mmul_t_007", "text", {
          "content": [
            r'''สังเกตว่าเราไม่ต้องคิดทั้งเมทริกซ์ทีเดียว แค่โฟกัสทีละช่อง: **แถวไหนของ A จับกับหลักไหนของ B** แค่นั้นเอง''',
          ],
        }),

        // DDQ: ลองจับคู่แถว-หลักด้วยตัวเอง
        ContentBlock("mmul_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mmul_ddq_001_s1",
              "content": [
                r'''ค่า $c_{ij}$ ในผลคูณ $AB$ ได้จากการใช้ ''',
                {"drop": "0"},
                r''' ที่ $i$ ของ $A$ จับคู่กับ ''',
                {"drop": "1"},
                r''' ที่ $j$ ของ $B$''',
              ],
              "draggableItems": [r"แถว", r"หลัก", r"ตำแหน่ง"],
              "correctAnswers": {"0": r"แถว", "1": r"หลัก"},
              "explanation": r'''$c_{ij}$ = แถวที่ $i$ ของ $A$ จับคู่กับหลักที่ $j$ ของ $B$ แล้วคูณทีละคู่บวกรวม''',
            },
            {
              "questionId": "mmul_ddq_001_s2",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$, $B = \begin{bmatrix} 2 & 0 \\ 1 & 3 \end{bmatrix}$

หา $c_{12}$: แถว 1 ของ $A$ คือ $[1, 2]$ จับกับหลัก 2 ของ $B$ คือ $[0, 3]$

$c_{12} = 1 \cdot 0 + 2 \cdot 3 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"2", r"4", r"6", r"8"],
              "correctAnswers": {"0": r"6"},
              "explanation": r'''$c_{12} = 1 \cdot 0 + 2 \cdot 3 = 0 + 6 = 6$ ✅''',
            },
            {
              "questionId": "mmul_ddq_001_s3",
              "content": [
                r'''ลองหา $c_{21}$: แถว 2 ของ $A$ คือ $[3, 4]$ จับกับหลัก 1 ของ $B$ คือ $[2, 1]$

$c_{21} = 3 \cdot 2 + 4 \cdot 1 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"7", r"8", r"10", r"12"],
              "correctAnswers": {"0": r"10"},
              "explanation": r'''$c_{21} = 3 \cdot 2 + 4 \cdot 1 = 6 + 4 = 10$ ✅''',
            },
          ],
        }),

        // Q1: คูณ 2×2 ง่ายๆ
        ContentBlock("mmul_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $AB$ เมื่อ $A = \begin{bmatrix} 2 & 1 \\ 0 & 3 \end{bmatrix}$ และ $B = \begin{bmatrix} 1 & 4 \\ 2 & 5 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 4 & 13 \\ 6 & 15 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 4 \\ 0 & 15 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 9 \\ 6 & 15 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 9 \\ 2 & 15 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 4 & 13 \\ 6 & 15 \end{bmatrix}$",
          "explanation": r'''แถว 1 × หลัก 1: $2 \cdot 1 + 1 \cdot 2 = 4$
แถว 1 × หลัก 2: $2 \cdot 4 + 1 \cdot 5 = 13$
แถว 2 × หลัก 1: $0 \cdot 1 + 3 \cdot 2 = 6$
แถว 2 × หลัก 2: $0 \cdot 4 + 3 \cdot 5 = 15$''',
        }),

        // Q2: ขนาดเมทริกซ์ — คูณได้ไหม?
        ContentBlock("mmul_q_002", "question_choice", {
          "content": [
            r'''2. ถ้า $A$ มีขนาด $3 \times 2$ และ $B$ มีขนาด $2 \times 4$ ผลคูณ $AB$ จะมีขนาดเท่าไหร่?''',
          ],
          "options": [
            r"$3 \times 4$",
            r"$2 \times 2$",
            r"$3 \times 2$",
            r"ไม่สามารถคูณได้",
          ],
          "correct": r"$3 \times 4$",
          "explanation": r'''หลักของ $A$ = 2 = แถวของ $B$ → คูณได้ ✅

ผลลัพธ์เอาด้านนอก: แถวของ $A$ × หลักของ $B$ = $3 \times 4$''',
        }),

        // Q3: fill_in — คูณ 2×3 กับ 3×1
        ContentBlock("mmul_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$ และ $B = \begin{bmatrix} 1 \\ 0 \\ 2 \end{bmatrix}$ จงหาค่า $c_{21}$ ของ $AB$''',
            {"box": "0"},
          ],
          "correct": "16",
          "explanation": r'''$c_{21}$ ใช้แถว 2 ของ $A$ คือ $[4, 5, 6]$ จับกับหลัก 1 ของ $B$ คือ $[1, 0, 2]$

$4 \cdot 1 + 5 \cdot 0 + 6 \cdot 2 = 4 + 0 + 12 = 16$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: ฝึกคูณเมทริกซ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"ฝึกคูณเมทริกซ์",
      blocks: [
        ContentBlock("mmul_t_008", "text", {
          "content": [
            r'''มาลองทำโจทย์ที่ท้าทายขึ้นอีกนิด เน้นฝึกเลือกคิดเฉพาะช่องที่ถาม ไม่ต้องคูณทั้งเมทริกซ์ก็ได้ 💡''',
          ],
        }),

        // Q1: หา element เฉพาะตำแหน่ง (ไม่ต้องคูณทั้งหมด)
        ContentBlock("mmul_q_003", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 1 & 0 & 2 \\ 3 & 1 & -1 \end{bmatrix}$ และ $B = \begin{bmatrix} 2 & 1 \\ 0 & 3 \\ 4 & 2 \end{bmatrix}$ จงหา $c_{11} + c_{22}$ ของ $AB$''',
          ],
          "options": ["12", "14", "16", "18"],
          "correct": "14",
          "explanation": r'''$c_{11}$: แถว 1 × หลัก 1 = $1 \cdot 2 + 0 \cdot 0 + 2 \cdot 4 = 10$

$c_{22}$: แถว 2 × หลัก 2 = $3 \cdot 1 + 1 \cdot 3 + (-1) \cdot 2 = 4$

$c_{11} + c_{22} = 10 + 4 = 14$

🧠 **ข้อสังเกต:** ไม่จำเป็นต้องคิดทุกช่อง คิดเฉพาะช่องที่โจทย์ถามก็พอ''',
        }),

        // Q2: AB ≠ BA
        ContentBlock("mmul_q_004", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$ และ $B = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}$ ข้อใดกล่าว**ถูกต้อง**?''',
          ],
          "options": [
            r"$AB = BA$",
            r"$AB \neq BA$",
            r"$AB$ และ $BA$ คูณกันไม่ได้",
            r"$AB = BA = I$",
          ],
          "correct": r"$AB \neq BA$",
          "explanation": r'''$AB = \begin{bmatrix} 2 & 1 \\ 1 & 0 \end{bmatrix}$ แต่ $BA = \begin{bmatrix} 0 & 1 \\ 1 & 2 \end{bmatrix}$

เห็นชัดว่า $AB \neq BA$

🧠 **ข้อสังเกต:** การคูณเมทริกซ์ **สลับที่ไม่ได้** โดยทั่วไป ต่างจากการคูณตัวเลขปกติ''',
        }),

        // Q3: AB = C หาตัวแปร
        ContentBlock("mmul_q_005", "question_choice", {
          "content": [
            r'''3. ให้ $\begin{bmatrix} x & 2 \\ 1 & 3 \end{bmatrix} \begin{bmatrix} 3 & 1 \\ 0 & 2 \end{bmatrix} = \begin{bmatrix} 6 & 6 \\ 3 & 7 \end{bmatrix}$ จงหา $x$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "2",
          "explanation": r'''ดูตำแหน่ง $c_{11}$: แถว 1 × หลัก 1 = $x \cdot 3 + 2 \cdot 0 = 3x$

จากผลลัพธ์ $c_{11} = 6$ ดังนั้น $3x = 6 \to x = 2$

ตรวจ $c_{12}$: $2 \cdot 1 + 2 \cdot 2 = 6$ ✅''',
        }),

        // Q4: fill_in — ขนาดผลลัพธ์ + element
        ContentBlock("mmul_fi_002", "question_fill_in", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 0 \\ 2 & 1 \end{bmatrix}$ และ $B = \begin{bmatrix} 1 & 0 & 3 \\ 2 & 1 & 0 \end{bmatrix}$ ถ้าผลคูณ $AB$ มีขนาด $m \times n$ จงหา $c_{23} + m \cdot n$''',
            {"box": "0"},
          ],
          "correct": "18",
          "explanation": r'''$A$ ขนาด $3 \times 2$, $B$ ขนาด $2 \times 3$ → ผลลัพธ์ $3 \times 3$ ดังนั้น $m = 3, n = 3$

$c_{23}$: แถว 2 × หลัก 3 = $3 \cdot 3 + 0 \cdot 0 = 9$

$c_{23} + m \cdot n = 9 + 9 = 18$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: โจทย์ประยุกต์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ประยุกต์",
      blocks: [
        ContentBlock("mmul_t_009", "text", {
          "content": [
            r'''ถึงเวลาเอาทุกเรื่องที่เรียนมามาใช้ด้วยกัน! ทั้งตำแหน่ง ขนาด บวกลบ คูณค่าคงที่ และคูณเมทริกซ์ 🔥''',
          ],
        }),

        // Q1: kA · B
        ContentBlock("mmul_q_006", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 1 & 3 \\ 2 & 1 \end{bmatrix}$ และ $B = \begin{bmatrix} 2 & 0 \\ 1 & 4 \end{bmatrix}$ จงหา $c_{12}$ ของ $(2A) \cdot B$''',
          ],
          "options": ["8", "12", "24", "34"],
          "correct": "24",
          "explanation": r'''$2A = \begin{bmatrix} 2 & 6 \\ 4 & 2 \end{bmatrix}$

$c_{12}$: แถว 1 × หลัก 2 = $2 \cdot 0 + 6 \cdot 4 = 24$''',
        }),

        // Q2: A(B + C)
        ContentBlock("mmul_q_007", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$, $B = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$, $C = \begin{bmatrix} 2 & 1 \\ 1 & 0 \end{bmatrix}$ จงหา $c_{11}$ ของ $A(B + C)$''',
          ],
          "options": ["3", "4", "5", "6"],
          "correct": "5",
          "explanation": r'''$B + C = \begin{bmatrix} 3 & 1 \\ 1 & 1 \end{bmatrix}$

$c_{11}$: แถว 1 × หลัก 1 = $1 \cdot 3 + 2 \cdot 1 = 5$''',
        }),

        // Q3: AB = C หาสองตัวแปร (ใช้การเท่ากัน)
        ContentBlock("mmul_q_008", "question_choice", {
          "content": [
            r'''3. ให้ $\begin{bmatrix} a & 1 \\ 2 & b \end{bmatrix} \begin{bmatrix} 1 & 3 \\ 2 & 0 \end{bmatrix} = \begin{bmatrix} 5 & 9 \\ 8 & 6 \end{bmatrix}$ จงหา $a + b$''',
          ],
          "options": ["4", "5", "6", "7"],
          "correct": "6",
          "explanation": r'''$c_{11} = a + 2 = 5 \to a = 3$

$c_{12} = 3a + 0 = 9$ ตรวจ: $3 \cdot 3 = 9$ ✅

$c_{21} = 2 + 2b = 8 \to b = 3$

$a + b = 3 + 3 = 6$''',
        }),

        // Q4: (A+B)C = AC + BC (distributive)
        ContentBlock("mmul_q_009", "question_choice", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 0 \\ 0 & 2 \end{bmatrix}$, $B = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}$, $C = \begin{bmatrix} 2 & 1 \\ 0 & 3 \end{bmatrix}$ ข้อใดเท่ากับ $(A + B)C$?''',
          ],
          "options": [
            r"$AC + BC$",
            r"$CA + CB$",
            r"$AC + CB$",
            r"ไม่เท่ากับตัวเลือกใดเลย",
          ],
          "correct": r"$AC + BC$",
          "explanation": r'''$(A+B)C = \begin{bmatrix} 1 & 1 \\ 1 & 2 \end{bmatrix} \begin{bmatrix} 2 & 1 \\ 0 & 3 \end{bmatrix} = \begin{bmatrix} 2 & 4 \\ 2 & 7 \end{bmatrix}$

$AC = \begin{bmatrix} 2 & 1 \\ 0 & 6 \end{bmatrix}$, $BC = \begin{bmatrix} 0 & 3 \\ 2 & 1 \end{bmatrix}$

$AC + BC = \begin{bmatrix} 2 & 4 \\ 2 & 7 \end{bmatrix}$ ✅

🧠 **ข้อสังเกต:** สมบัติการแจกแจง $(A+B)C = AC + BC$ ใช้ได้กับเมทริกซ์ แต่ต้องระวังลำดับ!''',
        }),

        // Q5: (2A - 3B) · C
        ContentBlock("mmul_q_010", "question_choice", {
          "content": [
            r'''5. ให้ $A = \begin{bmatrix} 2 & 1 \\ 1 & 3 \end{bmatrix}$, $B = \begin{bmatrix} 1 & 1 \\ 0 & 2 \end{bmatrix}$, $C = \begin{bmatrix} 1 & 0 \\ 2 & 1 \end{bmatrix}$ จงหา $c_{11} + c_{22}$ ของ $(2A - 3B) \cdot C$''',
          ],
          "options": ["-1", "0", "1", "3"],
          "correct": "-1",
          "explanation": r'''$2A = \begin{bmatrix} 4 & 2 \\ 2 & 6 \end{bmatrix}$, $3B = \begin{bmatrix} 3 & 3 \\ 0 & 6 \end{bmatrix}$

$2A - 3B = \begin{bmatrix} 1 & -1 \\ 2 & 0 \end{bmatrix}$

คูณกับ $C$:
$c_{11} = 1 \cdot 1 + (-1) \cdot 2 = -1$
$c_{22} = 2 \cdot 0 + 0 \cdot 1 = 0$

$c_{11} + c_{22} = -1 + 0 = -1$''',
        }),

        // Q6: fill_in — ย้อนกลับหา element ของ B
        ContentBlock("mmul_fi_003", "question_fill_in", {
          "content": [
            r'''6. ให้ $A = \begin{bmatrix} 2 & 1 \\ 0 & 3 \end{bmatrix}$ และ $AB = \begin{bmatrix} 8 & 5 \\ 6 & 9 \end{bmatrix}$ จงหา $b_{11} + b_{22}$''',
            {"box": "0"},
          ],
          "correct": "6",
          "explanation": r'''ให้ $B = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$

จาก $AB$: แถว 2 ให้ $3c = 6 \to c = 2$ และ $3d = 9 \to d = 3$

แถว 1 ให้ $2a + c = 8 \to 2a + 2 = 8 \to a = 3$ และ $2b + d = 5 \to 2b + 3 = 5 \to b = 1$

$b_{11} + b_{22} = 3 + 3 = 6$''',
        }),

        // Q7: ขนาด + ตัวแปร
        ContentBlock("mmul_q_011", "question_choice", {
          "content": [
            r'''7. ถ้า $A$ มีขนาด $m \times 3$ และ $B$ มีขนาด $3 \times n$ โดยที่ $AB$ มีขนาด $2 \times 4$ จงหา $m + n$''',
          ],
          "options": ["4", "5", "6", "8"],
          "correct": "6",
          "explanation": r'''ผลลัพธ์ $AB$ มีขนาด $m \times n$ ซึ่งเท่ากับ $2 \times 4$

ดังนั้น $m = 2$ และ $n = 4$

$m + n = 2 + 4 = 6$''',
        }),

        // Q8: โจทย์รวมยาก — 2AB + C = D
        ContentBlock("mmul_q_012", "question_choice", {
          "content": [
            r'''8. ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 0 \end{bmatrix}$, $B = \begin{bmatrix} 0 & 1 \\ 2 & 3 \end{bmatrix}$, $C = \begin{bmatrix} 1 & 1 \\ 2 & 2 \end{bmatrix}$ ถ้า $D = 2AB + C$ จงหา $d_{12}$''',
          ],
          "options": ["12", "14", "15", "16"],
          "correct": "15",
          "explanation": r'''$AB$: $c_{12} = 1 \cdot 1 + 2 \cdot 3 = 7$

$2AB$ ตำแหน่ง $(1,2)$: $2 \cdot 7 = 14$

$d_{12} = 14 + 1 = 15$

🧠 **ข้อสังเกต:** ไม่ต้องหาทุกช่อง คิดเฉพาะตำแหน่งที่ถามก็พอ!''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("mmul_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**คูณได้เมื่อไหร่?** จำนวนหลักของตัวหน้าต้องเท่ากับจำนวนแถวของตัวหลัง ผลลัพธ์มีขนาด = แถวตัวหน้า × หลักตัวหลัง''',
            r'''**คิดทีละช่อง:** $c_{ij}$ = เอาแถวที่ $i$ ของ $A$ จับคู่กับหลักที่ $j$ ของ $B$ คูณทีละคู่แล้วบวกรวม''',
            r'''**$AB \neq BA$** โดยทั่วไปสลับที่ไม่ได้ แต่สมบัติแจกแจง $(A+B)C = AC + BC$ ยังใช้ได้''',
            r'''**ประยุกต์ร่วมกับบทก่อน:** ใช้การบวกลบ คูณค่าคงที่ และการเท่ากันของเมทริกซ์ร่วมกับการคูณเมทริกซ์ได้เลย''',
          ],
        }),
      ],
    ),
  ],
);

// ─────────────────────────────────────────────────────────────────────────────
// Lesson 3: ชนิดเมทริกซ์
// ─────────────────────────────────────────────────────────────────────────────
final matrixTypesLesson = ContentLesson(
  title: "ชนิดของเมทริกซ์",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: เมทริกซ์จัตุรัสและเมทริกซ์ศูนย์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"เมทริกซ์จัตุรัสและเมทริกซ์ศูนย์",
      blocks: [
        ContentBlock("mtype_t_001", "text", {
          "content": [
            r'''ก่อนจะรู้จักชนิดเมทริกซ์แบบพิเศษทั้งหลาย เรามาเริ่มจากสองชนิดที่เจอบ่อยสุดกันก่อน นั่นคือ **เมทริกซ์จัตุรัส** และ **เมทริกซ์ศูนย์** 🧱''',
          ],
        }),

        // ── headerL2: จัตุรัส ──
        ContentBlock("mtype_h_001", "header", {
          "title": r"เมทริกซ์จัตุรัส",
          "level": 2,
        }),
        ContentBlock("mtype_t_002", "text", {
          "content": [
            r'''**เมทริกซ์จัตุรัส** (Square Matrix) คือเมทริกซ์ที่มี**จำนวนแถวเท่ากับจำนวนหลัก** หรือก็คือขนาด $n \times n$''',
            r'''เช่น $\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ เป็นจัตุรัสขนาด $2 \times 2$ และ $\begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}$ เป็นจัตุรัสขนาด $3 \times 3$''',
          ],
        }),
        ContentBlock("mtype_t_003", "text", {
          "content": [
            r'''ในเมทริกซ์จัตุรัส สมาชิกที่ตำแหน่ง $a_{11}, a_{22}, a_{33}, \ldots$ เรียกว่า **เส้นทแยงมุมหลัก** (main diagonal) — แนวทแยงจากมุมซ้ายบนไปมุมขวาล่าง''',
            r'''Note = เมทริกซ์ชนิดพิเศษเกือบทั้งหมดที่เรียนต่อจากนี้ ต้องเป็น**จัตุรัส**ก่อนเสมอ!''',
          ],
        }),

        // DDQ: ระบุว่าเป็นจัตุรัสหรือไม่
        ContentBlock("mtype_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mtype_ddq_001_s1",
              "content": [
                r'''$A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ เป็นเมทริกซ์จัตุรัสหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"จัตุรัส", r"ไม่จัตุรัส"],
              "correctAnswers": {"0": r"จัตุรัส"},
              "explanation": r'''ขนาด $2 \times 2$ แถว = หลัก = 2 เป็นจัตุรัส ✅''',
            },
            {
              "questionId": "mtype_ddq_001_s2",
              "content": [
                r'''$B = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$ เป็นเมทริกซ์จัตุรัสหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"จัตุรัส", r"ไม่จัตุรัส"],
              "correctAnswers": {"0": r"ไม่จัตุรัส"},
              "explanation": r'''ขนาด $2 \times 3$ แถว ≠ หลัก จึงไม่เป็นจัตุรัส ❌''',
            },
            {
              "questionId": "mtype_ddq_001_s3",
              "content": [
                r'''$C = \begin{bmatrix} 5 \end{bmatrix}$ เป็นเมทริกซ์จัตุรัสหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"จัตุรัส", r"ไม่จัตุรัส"],
              "correctAnswers": {"0": r"จัตุรัส"},
              "explanation": r'''ขนาด $1 \times 1$ แถว = หลัก = 1 เป็นจัตุรัส ✅ (เมทริกซ์เล็กสุดก็นับนะ!)''',
            },
          ],
        }),

        // Q1: หาผลบวกเส้นทแยงมุมหลัก
        ContentBlock("mtype_q_001", "question_choice", {
          "content": [
            r'''1. จงหาผลบวกของสมาชิกบนเส้นทแยงมุมหลักของ $A = \begin{bmatrix} 2 & 1 & 5 \\ 3 & 4 & 7 \\ 6 & 8 & 9 \end{bmatrix}$''',
          ],
          "options": ["12", "15", "18", "45"],
          "correct": "15",
          "explanation": r'''เส้นทแยงมุมหลักคือ $a_{11}, a_{22}, a_{33} = 2, 4, 9$

ผลบวก = $2 + 4 + 9 = 15$''',
        }),

        // FI1: จัตุรัสจากสูตร a_ij
        ContentBlock("mtype_fi_001", "question_fill_in", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์จัตุรัสขนาด $3 \times 3$ ที่ $a_{ij} = i + j$ จงหา $a_{22} + a_{33}$ ''',
            {"box": "0"},
          ],
          "correct": "10",
          "explanation": r'''$a_{22} = 2 + 2 = 4$

$a_{33} = 3 + 3 = 6$

$a_{22} + a_{33} = 4 + 6 = 10$''',
        }),

        // ── headerL2: ศูนย์ ──
        ContentBlock("mtype_h_002", "header", {
          "title": r"เมทริกซ์ศูนย์",
          "level": 2,
        }),
        ContentBlock("mtype_t_004", "text", {
          "content": [
            r'''**เมทริกซ์ศูนย์** (Zero Matrix) คือเมทริกซ์ที่สมาชิก**ทุกตัวเป็น 0** เขียนแทนด้วยสัญลักษณ์ $0$''',
            r'''เมทริกซ์ศูนย์มีได้ทุกขนาด เช่น $\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$ หรือ $\begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}$ (ไม่ต้องเป็นจัตุรัสก็ได้)''',
          ],
        }),
        ContentBlock("mtype_t_005", "text", {
          "content": [
            r'''สมบัติง่ายๆ ที่ควรรู้: $A + 0 = A$ (บวกกับศูนย์ได้ตัวเดิม) และ $k \cdot 0 = 0$ (คูณค่าคงที่ใดๆ ยังได้ศูนย์)''',
          ],
        }),

        // Q2: A + B = A, หา B
        ContentBlock("mtype_q_002", "question_choice", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} 3 & 5 \\ 7 & 2 \end{bmatrix}$ และ $A + B = A$ ข้อใดคือเมทริกซ์ $B$?''',
          ],
          "options": [
            r"$\begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 5 \\ 7 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} -3 & -5 \\ -7 & -2 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          "explanation": r'''$A + B = A$ แสดงว่า $B$ ต้องไม่เปลี่ยนค่า $A$ เลย

จึงต้องเป็น**เมทริกซ์ศูนย์** $\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$''',
        }),

        // Q3: คูณค่าคงที่กับเมทริกซ์ศูนย์
        ContentBlock("mtype_q_003", "question_choice", {
          "content": [
            r'''4. จงหา $3 \cdot \begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 3 & 3 \\ 3 & 3 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$3$",
          ],
          "correct": r"$\begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix}$",
          "explanation": r'''กระจายคูณเข้าทุกตัว แต่ $3 \times 0 = 0$ จึงได้เมทริกซ์ศูนย์เหมือนเดิม''',
        }),

        // Q4: A - B = 0 หา element ของ B
        ContentBlock("mtype_q_004", "question_choice", {
          "content": [
            r'''5. ให้ $A = \begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$ และ $A - B = 0$ (เมทริกซ์ศูนย์) จงหา $b_{12}$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "3",
          "explanation": r'''$A - B = 0$ แสดงว่า $B = A$

ดังนั้น $B = \begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$ และ $b_{12} = 3$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: เมทริกซ์ทแยงมุม
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"เมทริกซ์ทแยงมุม",
      blocks: [
        ContentBlock("mtype_diag_t_001", "text", {
          "content": [
            r'''**เมทริกซ์ทแยงมุม** (Diagonal Matrix) คือเมทริกซ์**จัตุรัส**ที่สมาชิก**นอกเส้นทแยงมุมหลักเป็น 0 ทั้งหมด**''',
            r'''บนเส้นทแยงจะเป็นเลขอะไรก็ได้ (รวมถึง 0 ก็ยังถือว่าเป็นทแยงมุมอยู่)''',
          ],
        }),
        ContentBlock("mtype_diag_t_002", "text", {
          "content": [
            r'''ตัวอย่างเช่น $\begin{bmatrix} 3 & 0 \\ 0 & 5 \end{bmatrix}$ และ $\begin{bmatrix} 2 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 7 \end{bmatrix}$ ก็เป็นเมทริกซ์ทแยงมุม''',
            r'''Note = ต้องเป็นจัตุรัสก่อน! ถ้าไม่จัตุรัสต่อให้นอกทแยงเป็น 0 ก็ไม่ใช่เมทริกซ์ทแยงมุม''',
          ],
        }),

        // DDQ: จำแนกว่าเป็นทแยงมุมหรือไม่
        ContentBlock("mtype_diag_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mtype_diag_ddq_001_s1",
              "content": [
                r'''$A = \begin{bmatrix} 4 & 0 \\ 0 & 7 \end{bmatrix}$ เป็นเมทริกซ์ทแยงมุมหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"เป็น", r"ไม่เป็น"],
              "correctAnswers": {"0": r"เป็น"},
              "explanation": r'''จัตุรัส $2 \times 2$ และนอกทแยง ($a_{12}, a_{21}$) เป็น 0 หมด ✅''',
            },
            {
              "questionId": "mtype_diag_ddq_001_s2",
              "content": [
                r'''$B = \begin{bmatrix} 2 & 0 & 0 \\ 0 & 3 & 0 \end{bmatrix}$ เป็นเมทริกซ์ทแยงมุมหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"เป็น", r"ไม่เป็น"],
              "correctAnswers": {"0": r"ไม่เป็น"},
              "explanation": r'''ถึงนอกทแยงจะเป็น 0 หมด แต่ขนาด $2 \times 3$ **ไม่ใช่จัตุรัส** จึงไม่ใช่เมทริกซ์ทแยงมุม ❌''',
            },
            {
              "questionId": "mtype_diag_ddq_001_s3",
              "content": [
                r'''$C = \begin{bmatrix} 1 & 0 \\ 2 & 3 \end{bmatrix}$ เป็นเมทริกซ์ทแยงมุมหรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"เป็น", r"ไม่เป็น"],
              "correctAnswers": {"0": r"ไม่เป็น"},
              "explanation": r'''จัตุรัสแล้วจริง แต่ $c_{21} = 2 \neq 0$ (นอกทแยงยังไม่เป็น 0 หมด) ❌''',
            },
          ],
        }),

        // Q1: ตั้งทแยงมุมจากเงื่อนไข
        ContentBlock("mtype_diag_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $A$ เป็นเมทริกซ์ทแยงมุมขนาด $2 \times 2$ ที่ $a_{11} = 3$ และ $a_{22} = 4$ ข้อใดคือเมทริกซ์ $A$?''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 4 \\ 4 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 0 \\ 0 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 4 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 3 \\ 4 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 0 \\ 0 & 4 \end{bmatrix}$",
          "explanation": r'''ทแยงมุม = นอกทแยงต้องเป็น 0

บนทแยง: $a_{11} = 3, a_{22} = 4$

นอกทแยง: $a_{12} = a_{21} = 0$''',
        }),

        // Q2: ทแยงมุม + element นอกทแยง
        ContentBlock("mtype_diag_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์ทแยงมุม $3 \times 3$ ที่มี $a_{11} = 2, a_{22} = -3, a_{33} = 5$ จงหา $a_{12} + a_{23} + a_{33}$''',
          ],
          "options": ["0", "2", "5", "10"],
          "correct": "5",
          "explanation": r'''ทแยงมุม: นอกทแยงเป็น 0 ทั้งหมด → $a_{12} = 0, a_{23} = 0$

$a_{12} + a_{23} + a_{33} = 0 + 0 + 5 = 5$''',
        }),

        // FI: ผลบวกสมาชิกทั้งหมดของทแยงมุม
        ContentBlock("mtype_diag_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์ทแยงมุม $3 \times 3$ ที่ $a_{11} = 2, a_{22} = -1, a_{33} = 5$ จงหา**ผลบวกของสมาชิกทั้งหมด**ใน $A$ ''',
            {"box": "0"},
          ],
          "correct": "6",
          "explanation": r'''สมาชิกนอกทแยงเป็น 0 หมด เหลือแค่บวกสมาชิกบนทแยง

$2 + (-1) + 5 = 6$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: เมทริกซ์สเกลาร์และเมทริกซ์เอกลักษณ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"เมทริกซ์สเกลาร์และเมทริกซ์เอกลักษณ์",
      blocks: [
        ContentBlock("mtype_scal_t_001", "text", {
          "content": [
            r'''คราวนี้เรามาดูเมทริกซ์ทแยงมุมเวอร์ชันพิเศษกันบ้าง มีสองแบบคือ **เมทริกซ์สเกลาร์** และ **เมทริกซ์เอกลักษณ์** ⭐''',
          ],
        }),

        // ── headerL2: สเกลาร์ ──
        ContentBlock("mtype_scal_h_001", "header", {
          "title": r"เมทริกซ์สเกลาร์",
          "level": 2,
        }),
        ContentBlock("mtype_scal_t_002", "text", {
          "content": [
            r'''**เมทริกซ์สเกลาร์** (Scalar Matrix) คือเมทริกซ์ทแยงมุมที่**ค่าบนเส้นทแยงเท่ากันหมด**''',
            r'''เช่น $\begin{bmatrix} 5 & 0 \\ 0 & 5 \end{bmatrix}$ และ $\begin{bmatrix} 7 & 0 & 0 \\ 0 & 7 & 0 \\ 0 & 0 & 7 \end{bmatrix}$ เป็นเมทริกซ์สเกลาร์''',
          ],
        }),

        // DDQ: แยกสเกลาร์ vs ทแยงมุมเท่านั้น vs อื่น
        ContentBlock("mtype_scal_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mtype_scal_ddq_001_s1",
              "content": [
                r'''$\begin{bmatrix} 3 & 0 \\ 0 & 3 \end{bmatrix}$ เป็นเมทริกซ์ชนิดใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"สเกลาร์", r"ทแยงมุมเท่านั้น", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"สเกลาร์"},
              "explanation": r'''ค่าบนทแยงเท่ากัน (3 ทั้งคู่) และนอกทแยงเป็น 0 → เป็น**สเกลาร์**''',
            },
            {
              "questionId": "mtype_scal_ddq_001_s2",
              "content": [
                r'''$\begin{bmatrix} 2 & 0 \\ 0 & 5 \end{bmatrix}$ เป็นเมทริกซ์ชนิดใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"สเกลาร์", r"ทแยงมุมเท่านั้น", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"ทแยงมุมเท่านั้น"},
              "explanation": r'''ค่าบนทแยงต่างกัน (2 กับ 5) → เป็นทแยงมุมแต่**ไม่ใช่**สเกลาร์''',
            },
            {
              "questionId": "mtype_scal_ddq_001_s3",
              "content": [
                r'''$\begin{bmatrix} 4 & 1 \\ 0 & 4 \end{bmatrix}$ เป็นเมทริกซ์ชนิดใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"สเกลาร์", r"ทแยงมุมเท่านั้น", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"ไม่ใช่ทั้งคู่"},
              "explanation": r'''$a_{12} = 1 \neq 0$ ยังไม่ใช่ทแยงมุมด้วยซ้ำ → ไม่ใช่ทั้งคู่''',
            },
          ],
        }),

        // Q1: สเกลาร์ → หาค่าบนทแยง
        ContentBlock("mtype_scal_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $A$ เป็นเมทริกซ์สเกลาร์ขนาด $2 \times 2$ ที่ $a_{11} = 7$ จงหา $a_{22}$''',
          ],
          "options": ["0", "1", "7", "14"],
          "correct": "7",
          "explanation": r'''สเกลาร์: ค่าบนทแยงเท่ากันหมด

ดังนั้น $a_{22} = a_{11} = 7$''',
        }),

        // Q2: ตั้งสเกลาร์จากค่า
        ContentBlock("mtype_scal_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์สเกลาร์ $2 \times 2$ ที่สมาชิกบนทแยงเท่ากับ $-2$ ข้อใดคือ $A$?''',
          ],
          "options": [
            r"$\begin{bmatrix} -2 & -2 \\ -2 & -2 \end{bmatrix}$",
            r"$\begin{bmatrix} -2 & 0 \\ 0 & -2 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 0 \\ 0 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} -2 & 0 \\ 0 & 2 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} -2 & 0 \\ 0 & -2 \end{bmatrix}$",
          "explanation": r'''สเกลาร์: ค่าทแยงเท่ากันและนอกทแยงเป็น 0''',
        }),

        // FI: สเกลาร์ 3x3 จากผลบวกทแยง
        ContentBlock("mtype_scal_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์สเกลาร์ $3 \times 3$ ถ้าผลบวกของสมาชิกบนเส้นทแยงมุมเท่ากับ $12$ จงหา $a_{22}$ ''',
            {"box": "0"},
          ],
          "correct": "4",
          "explanation": r'''สเกลาร์: ค่าบนทแยงเท่ากันหมด สมมติให้เท่ากับ $k$

$k + k + k = 12 \to k = 4$

ดังนั้น $a_{22} = 4$''',
        }),

        // ── headerL2: เอกลักษณ์ ──
        ContentBlock("mtype_id_h_001", "header", {
          "title": r"เมทริกซ์เอกลักษณ์",
          "level": 2,
        }),
        ContentBlock("mtype_id_t_001", "text", {
          "content": [
            r'''**เมทริกซ์เอกลักษณ์** (Identity Matrix) คือเมทริกซ์สเกลาร์กรณีพิเศษ ที่**ค่าบนทแยงเป็น 1 ทั้งหมด** เขียนแทนด้วย $I$ หรือ $I_n$ (เมื่อต้องการระบุขนาด)''',
            r'''เช่น $I_2 = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$ และ $I_3 = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$''',
          ],
        }),
        ContentBlock("mtype_id_t_002", "text", {
          "content": [
            r'''สมบัติสำคัญ: $A \cdot I = I \cdot A = A$ (เหมือนเลข 1 ที่คูณกับอะไรก็ได้ตัวเดิม) รายละเอียดเพิ่มเติมจะเจอในบทถัดไป''',
            r'''Note = ความสัมพันธ์: **เอกลักษณ์** ⊂ **สเกลาร์** ⊂ **ทแยงมุม** ⊂ **จัตุรัส**''',
          ],
        }),

        // Q1: ระบุ I_3
        ContentBlock("mtype_id_q_001", "question_choice", {
          "content": [
            r'''4. ข้อใดคือเมทริกซ์เอกลักษณ์ $I_3$?''',
          ],
          "options": [
            r"$\begin{bmatrix} 1 & 1 & 1 \\ 1 & 1 & 1 \\ 1 & 1 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 & 1 \\ 0 & 1 & 0 \\ 1 & 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 0 & 0 \\ 0 & 3 & 0 \\ 0 & 0 & 3 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$",
          "explanation": r'''เอกลักษณ์: บนทแยงเป็น 1 ทั้งหมด นอกทแยงเป็น 0''',
        }),

        // Q2: I_2 + B
        ContentBlock("mtype_id_q_002", "question_choice", {
          "content": [
            r'''5. จงหา $I_2 + \begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 3 \\ 1 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 4 \\ 2 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 3 \\ 1 & 5 \end{bmatrix}$",
          "explanation": r'''ตั้ง $I_2 = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$

บวกทีละตำแหน่ง: $\begin{bmatrix} 1+2 & 0+3 \\ 0+1 & 1+4 \end{bmatrix} = \begin{bmatrix} 3 & 3 \\ 1 & 5 \end{bmatrix}$''',
        }),

        // FI: 3 * I_2
        ContentBlock("mtype_id_fi_001", "question_fill_in", {
          "content": [
            r'''6. ให้ $A = 3 I_2$ จงหา $a_{11} + a_{22}$ ''',
            {"box": "0"},
          ],
          "correct": "6",
          "explanation": r'''$3 I_2 = 3 \cdot \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} = \begin{bmatrix} 3 & 0 \\ 0 & 3 \end{bmatrix}$

$a_{11} + a_{22} = 3 + 3 = 6$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: เมทริกซ์สามเหลี่ยม
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"เมทริกซ์สามเหลี่ยม",
      blocks: [
        ContentBlock("mtype_tri_t_001", "text", {
          "content": [
            r'''**เมทริกซ์สามเหลี่ยม** (Triangular Matrix) เป็นเมทริกซ์**จัตุรัส**ที่เลขไปกระจุกอยู่ครึ่งหนึ่ง อีกครึ่งเป็น 0 แบ่งเป็น 2 แบบ 🔺''',
          ],
        }),
        ContentBlock("mtype_tri_t_002", "text", {
          "content": [
            r'''**สามเหลี่ยมบน** (Upper): สมาชิก**ใต้**เส้นทแยงมุมหลักเป็น 0 ทั้งหมด (เลขกระจุกข้างบน) เช่น $\begin{bmatrix} 1 & 2 & 3 \\ 0 & 4 & 5 \\ 0 & 0 & 6 \end{bmatrix}$''',
            r'''**สามเหลี่ยมล่าง** (Lower): สมาชิก**เหนือ**เส้นทแยงมุมหลักเป็น 0 ทั้งหมด (เลขกระจุกข้างล่าง) เช่น $\begin{bmatrix} 1 & 0 & 0 \\ 2 & 3 & 0 \\ 4 & 5 & 6 \end{bmatrix}$''',
          ],
        }),
        ContentBlock("mtype_tri_t_003", "text", {
          "content": [
            r'''วิธีจำ: ดูว่า **0 อยู่ด้านไหน** — 0 อยู่ข้างล่าง → สามเหลี่ยม**บน** / 0 อยู่ข้างบน → สามเหลี่ยม**ล่าง**''',
            r'''Note = **เมทริกซ์ทแยงมุมเป็นทั้งสามเหลี่ยมบนและล่างพร้อมกัน** เพราะทั้งใต้ทแยงและเหนือทแยงเป็น 0 หมด''',
          ],
        }),

        // DDQ: จำแนกสามเหลี่ยมบน/ล่าง/ทั้งสอง/ไม่ใช่
        ContentBlock("mtype_tri_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mtype_tri_ddq_001_s1",
              "content": [
                r'''$\begin{bmatrix} 1 & 2 & 3 \\ 0 & 4 & 5 \\ 0 & 0 & 6 \end{bmatrix}$ เป็นสามเหลี่ยมแบบใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"บน", r"ล่าง", r"ทั้งสองแบบ", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"บน"},
              "explanation": r'''ใต้ทแยงเป็น 0 หมด (เลขกระจุกข้างบน) → สามเหลี่ยมบน''',
            },
            {
              "questionId": "mtype_tri_ddq_001_s2",
              "content": [
                r'''$\begin{bmatrix} 1 & 0 & 0 \\ 2 & 3 & 0 \\ 4 & 5 & 6 \end{bmatrix}$ เป็นสามเหลี่ยมแบบใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"บน", r"ล่าง", r"ทั้งสองแบบ", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"ล่าง"},
              "explanation": r'''เหนือทแยงเป็น 0 หมด (เลขกระจุกข้างล่าง) → สามเหลี่ยมล่าง''',
            },
            {
              "questionId": "mtype_tri_ddq_001_s3",
              "content": [
                r'''$\begin{bmatrix} 2 & 0 \\ 0 & 3 \end{bmatrix}$ เป็นสามเหลี่ยมแบบใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"บน", r"ล่าง", r"ทั้งสองแบบ", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"ทั้งสองแบบ"},
              "explanation": r'''เมทริกซ์ทแยงมุม: ทั้งใต้และเหนือทแยงเป็น 0 หมด จึงเป็นทั้งสามเหลี่ยมบนและล่างพร้อมกัน''',
            },
            {
              "questionId": "mtype_tri_ddq_001_s4",
              "content": [
                r'''$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ เป็นสามเหลี่ยมแบบใด? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"บน", r"ล่าง", r"ทั้งสองแบบ", r"ไม่ใช่ทั้งคู่"],
              "correctAnswers": {"0": r"ไม่ใช่ทั้งคู่"},
              "explanation": r'''ทั้งใต้ทแยง ($a_{21}=3$) และเหนือทแยง ($a_{12}=2$) ไม่เป็น 0 → ไม่ใช่สามเหลี่ยมทั้งคู่''',
            },
          ],
        }),

        // Q1: เงื่อนไขให้เป็นสามเหลี่ยมบน
        ContentBlock("mtype_tri_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $M = \begin{bmatrix} 1 & 2 & 3 \\ x & 4 & 5 \\ y & z & 6 \end{bmatrix}$ เงื่อนไขใดทำให้ $M$ เป็นเมทริกซ์สามเหลี่ยมบน?''',
          ],
          "options": [
            r"$x = 0$ เท่านั้น",
            r"$x = y = 0$",
            r"$x = y = z = 0$",
            r"ไม่มีเงื่อนไข",
          ],
          "correct": r"$x = y = z = 0$",
          "explanation": r'''สามเหลี่ยมบน = ใต้ทแยงต้องเป็น 0 ทั้งหมด

ใต้ทแยงคือตำแหน่ง $a_{21}, a_{31}, a_{32}$ ซึ่งก็คือ $x, y, z$

จึงต้อง $x = y = z = 0$''',
        }),

        // Q2: ตั้งสามเหลี่ยมล่างจากเงื่อนไข
        ContentBlock("mtype_tri_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์สามเหลี่ยมล่าง $2 \times 2$ ที่ $a_{11} = 3, a_{21} = 5, a_{22} = 7$ ข้อใดคือ $A$?''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 5 \\ 0 & 7 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 0 \\ 5 & 7 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 5 \\ 5 & 7 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 3 \\ 5 & 7 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 0 \\ 5 & 7 \end{bmatrix}$",
          "explanation": r'''สามเหลี่ยมล่าง: เหนือทแยง ($a_{12}$) ต้องเป็น 0

แทนค่าที่โจทย์ให้ ได้ $\begin{bmatrix} 3 & 0 \\ 5 & 7 \end{bmatrix}$''',
        }),

        // FI: สามเหลี่ยมล่างจากสูตร
        ContentBlock("mtype_tri_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์สามเหลี่ยมล่าง $3 \times 3$ ที่ $a_{ij} = i + j$ เมื่อ $i \geq j$ จงหา $a_{31} + a_{13}$ ''',
            {"box": "0"},
          ],
          "correct": "4",
          "explanation": r'''$a_{31}$: $i = 3 \geq j = 1$ ดังนั้น $a_{31} = 3 + 1 = 4$

$a_{13}$: $i = 1 < j = 3$ (อยู่เหนือทแยง) สามเหลี่ยมล่างจึงเป็น 0

$a_{31} + a_{13} = 4 + 0 = 4$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 5: โจทย์ประยุกต์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ประยุกต์",
      blocks: [
        ContentBlock("mtype_app_t_001", "text", {
          "content": [
            r'''ลองทำโจทย์ที่ต้อง **ตั้งเมทริกซ์จากชนิดที่โจทย์บอก** แล้วนำไปคำนวณต่อร่วมกับความรู้บทก่อน (บวกลบ คูณค่าคงที่ คูณเมทริกซ์ เท่ากัน) 💪''',
          ],
        }),

        // Q1: ทแยงมุม × เมทริกซ์ทั่วไป
        ContentBlock("mtype_app_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $A$ เป็นเมทริกซ์ทแยงมุม $2 \times 2$ ที่ $a_{11} = 2, a_{22} = 3$ และ $B = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ จงหา $c_{12}$ ของ $AB$''',
          ],
          "options": ["2", "4", "6", "8"],
          "correct": "4",
          "explanation": r'''ตั้ง $A$ ก่อน: ทแยงมุม $2 \times 2$ → $A = \begin{bmatrix} 2 & 0 \\ 0 & 3 \end{bmatrix}$

$c_{12}$ ของ $AB$: แถว 1 ของ $A$ × หลัก 2 ของ $B$ = $2 \cdot 2 + 0 \cdot 4 = 4$''',
        }),

        // Q2: สเกลาร์ + คูณค่าคงที่ + ลบ
        ContentBlock("mtype_app_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์สเกลาร์ $2 \times 2$ ที่ค่าบนทแยงเท่ากับ $4$ จงหา $2A - \begin{bmatrix} 3 & 1 \\ 0 & 2 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 5 & -1 \\ 0 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & -1 \\ 0 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 1 \\ 0 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 8 & -1 \\ 0 & 6 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 5 & -1 \\ 0 & 6 \end{bmatrix}$",
          "explanation": r'''ตั้ง $A = \begin{bmatrix} 4 & 0 \\ 0 & 4 \end{bmatrix}$

$2A = \begin{bmatrix} 8 & 0 \\ 0 & 8 \end{bmatrix}$

$2A - \begin{bmatrix} 3 & 1 \\ 0 & 2 \end{bmatrix} = \begin{bmatrix} 5 & -1 \\ 0 & 6 \end{bmatrix}$''',
        }),

        // FI: สามเหลี่ยมบน × สามเหลี่ยมล่าง
        ContentBlock("mtype_app_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A$ เป็นสามเหลี่ยมบน $2 \times 2$ ที่ $a_{11} = 2, a_{12} = 3, a_{22} = 1$ และ $B$ เป็นสามเหลี่ยมล่าง $2 \times 2$ ที่ $b_{11} = 1, b_{21} = 4, b_{22} = 2$ จงหา $c_{21}$ ของ $AB$ ''',
            {"box": "0"},
          ],
          "correct": "4",
          "explanation": r'''ตั้ง $A$: สามเหลี่ยมบน ใต้ทแยงเป็น 0 → $A = \begin{bmatrix} 2 & 3 \\ 0 & 1 \end{bmatrix}$

ตั้ง $B$: สามเหลี่ยมล่าง เหนือทแยงเป็น 0 → $B = \begin{bmatrix} 1 & 0 \\ 4 & 2 \end{bmatrix}$

$c_{21}$: แถว 2 ของ $A$ × หลัก 1 ของ $B$ = $0 \cdot 1 + 1 \cdot 4 = 4$''',
        }),

        // Q3: ทแยงมุม + เท่ากัน + บวกเมทริกซ์
        ContentBlock("mtype_app_q_003", "question_choice", {
          "content": [
            r'''4. ให้ $A$ เป็นเมทริกซ์ทแยงมุม $3 \times 3$ และ $A + A = \begin{bmatrix} 4 & 0 & 0 \\ 0 & -2 & 0 \\ 0 & 0 & 6 \end{bmatrix}$ จงหาผลบวกของสมาชิกบนเส้นทแยงมุมของ $A$''',
          ],
          "options": ["2", "4", "6", "8"],
          "correct": "4",
          "explanation": r'''$A + A = 2A$ ดังนั้น $A = \begin{bmatrix} 2 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & 3 \end{bmatrix}$

ผลบวกสมาชิกบนทแยง = $2 + (-1) + 3 = 4$''',
        }),

        // Q4: จัตุรัสจากสูตร + เมทริกซ์ศูนย์ + คูณค่าคงที่
        ContentBlock("mtype_app_q_004", "question_choice", {
          "content": [
            r'''5. ให้ $A$ เป็นเมทริกซ์จัตุรัส $2 \times 2$ ที่ $a_{ij} = i \cdot j$ และ $B$ เป็นเมทริกซ์ศูนย์ขนาด $2 \times 2$ จงหา $3A + B$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 6 \\ 6 & 12 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 0 \\ 0 & 12 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 6 \\ 6 & 12 \end{bmatrix}$",
          "explanation": r'''ตั้ง $A$: $a_{ij} = i \cdot j$ → $A = \begin{bmatrix} 1 & 2 \\ 2 & 4 \end{bmatrix}$

$3A = \begin{bmatrix} 3 & 6 \\ 6 & 12 \end{bmatrix}$

$B$ เป็นเมทริกซ์ศูนย์ → $3A + B = 3A = \begin{bmatrix} 3 & 6 \\ 6 & 12 \end{bmatrix}$''',
        }),

        // Q5: สเกลาร์ × เมทริกซ์ + หาตัวแปร
        ContentBlock("mtype_app_q_005", "question_choice", {
          "content": [
            r'''6. ให้ $A$ เป็นเมทริกซ์สเกลาร์ $2 \times 2$ ที่ค่าบนทแยงเท่ากับ $k$ และ $B = \begin{bmatrix} 1 & 2 \\ 0 & 3 \end{bmatrix}$ ถ้า $c_{22}$ ของ $AB$ เท่ากับ $15$ จงหาค่า $k$''',
          ],
          "options": ["2", "3", "5", "15"],
          "correct": "5",
          "explanation": r'''ตั้ง $A = \begin{bmatrix} k & 0 \\ 0 & k \end{bmatrix}$

$c_{22}$ ของ $AB$: แถว 2 ของ $A$ × หลัก 2 ของ $B$ = $0 \cdot 2 + k \cdot 3 = 3k$

$3k = 15 \to k = 5$

🧠 **ข้อสังเกต:** เมื่อคูณเมทริกซ์สเกลาร์ $k$ กับ $B$ จะเหมือน $kB$ เลย!''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 6: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("mtype_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**จัตุรัส**: แถว = หลัก ($n \times n$) รู้จัก**เส้นทแยงมุมหลัก** ($a_{11}, a_{22}, \ldots$)''',
            r'''**ศูนย์**: ทุกตัวเป็น 0 มีได้ทุกขนาด สมบัติ $A + 0 = A$''',
            r'''**ทแยงมุม**: จัตุรัส + นอกทแยงเป็น 0 หมด''',
            r'''**สเกลาร์**: ทแยงมุม + ค่าบนทแยงเท่ากันหมด''',
            r'''**เอกลักษณ์ ($I$)**: สเกลาร์ที่ค่าบนทแยงเป็น 1 ทั้งหมด สมบัติ $A \cdot I = I \cdot A = A$''',
            r'''**สามเหลี่ยมบน/ล่าง**: จัตุรัส + ครึ่งหนึ่งเป็น 0 (0 อยู่ล่าง → บน, 0 อยู่บน → ล่าง)''',
          ],
        }),
        ContentBlock("mtype_sum_t_002", "text", {
          "content": [
            r'''🔗 **ความสัมพันธ์ระหว่างชนิด:** เอกลักษณ์ ⊂ สเกลาร์ ⊂ ทแยงมุม ⊂ จัตุรัส และ **สามเหลี่ยมบน ∩ สามเหลี่ยมล่าง = ทแยงมุม**''',
            r'''Note = เทคนิคสำคัญ: โจทย์บอกแค่**ชื่อชนิด** → ตั้งเมทริกซ์ตามลักษณะเด่น → แก้ต่อด้วยเครื่องมือจากบทก่อน (บวกลบ คูณค่าคงที่ คูณเมทริกซ์ เท่ากัน)''',
          ],
        }),
      ],
    ),
  ],
);
// ─────────────────────────────────────────────────────────────────────────────
// Lesson 4: การประยุกต์เมทริกซ์เอกลักษณ์
// ─────────────────────────────────────────────────────────────────────────────
// ─────────────────────────────────────────────────────────────────────────────
// Lesson: การประยุกต์เมทริกซ์เอกลักษณ์
// ─────────────────────────────────────────────────────────────────────────────
final matrixIdentityLesson = ContentLesson(
  title: "การประยุกต์เมทริกซ์เอกลักษณ์",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: ทบทวนสมบัติเมทริกซ์เอกลักษณ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"ทบทวนสมบัติเมทริกซ์เอกลักษณ์",
      blocks: [
        ContentBlock("mid_t_001", "text", {
          "content": [
            r'''ก่อนจะไปประยุกต์ มาทบทวนสมบัติสำคัญของเมทริกซ์เอกลักษณ์ $I$ กันก่อน 🔑''',
          ],
        }),
        ContentBlock("mid_t_002", "text", {
          "content": [
            r'''$AI = IA = A$ — คูณกับ $I$ ได้ตัวเดิม (เหมือนคูณเลขด้วย 1)''',
            r'''$I^n = I$ สำหรับ $n \geq 1$ ใดๆ — จะยกกำลังเท่าไหร่ก็ยังเป็น $I$''',
          ],
        }),
        ContentBlock("mid_t_003", "text", {
          "content": [
            r'''$kI$ (ค่าคงที่ $\times$ เอกลักษณ์) ก็คือ**เมทริกซ์สเกลาร์** เช่น $3I_2 = \begin{bmatrix} 3 & 0 \\ 0 & 3 \end{bmatrix}$''',
            r'''Note = สมบัติเหล่านี้ทำให้เราลดรูปนิพจน์เมทริกซ์ที่ดูซับซ้อนได้ทันที — ลองดูตัวอย่างกัน''',
          ],
        }),

        // DDQ: ทบทวนสมบัติ
        ContentBlock("mid_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mid_ddq_001_s1",
              "content": [
                r'''$I^{100}$ มีค่าเท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$I$", r"$100I$", r"$100$"],
              "correctAnswers": {"0": r"$I$"},
              "explanation": r'''$I^n = I$ สำหรับ $n \geq 1$ ใดๆ ไม่ว่ายกกำลังเท่าไหร่ก็ได้ $I$ เหมือนเดิม''',
            },
            {
              "questionId": "mid_ddq_001_s2",
              "content": [
                r'''ถ้า $A$ เป็นเมทริกซ์ใดๆ ที่ขนาดเข้ากันได้ แล้ว $A \cdot I$ จะเท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$I$", r"$A$", r"$2A$", r"$0$"],
              "correctAnswers": {"0": r"$A$"},
              "explanation": r'''$AI = A$ เสมอ เหมือนคูณตัวเลขด้วย 1''',
            },
          ],
        }),

        // Q1: ลดรูปนิพจน์กำลัง I
        ContentBlock("mid_q_001", "question_choice", {
          "content": [
            r'''1. จงหาค่าของ $3I^2 + 2I + \begin{bmatrix} 2 & 3 \\ 4 & 5 \end{bmatrix}$ เมื่อ $I = I_2$''',
          ],
          "options": [
            r"$\begin{bmatrix} 7 & 3 \\ 4 & 8 \end{bmatrix}$",
            r"$\begin{bmatrix} 8 & 3 \\ 4 & 9 \end{bmatrix}$",
            r"$\begin{bmatrix} 7 & 3 \\ 4 & 10 \end{bmatrix}$",
            r"$\begin{bmatrix} 10 & 3 \\ 4 & 11 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 7 & 3 \\ 4 & 10 \end{bmatrix}$",
          "explanation": r'''$I^2 = I$ ดังนั้น $3I^2 + 2I = 3I + 2I = 5I = \begin{bmatrix} 5 & 0 \\ 0 & 5 \end{bmatrix}$

$5I + \begin{bmatrix} 2 & 3 \\ 4 & 5 \end{bmatrix} = \begin{bmatrix} 7 & 3 \\ 4 & 10 \end{bmatrix}$

🧠 **ข้อสังเกต:** เจอ $I$ ยกกำลัง ยุบเป็น $I$ ก่อนเสมอ แล้วค่อยรวมพจน์''',
        }),

        // Q2: IA - AI
        ContentBlock("mid_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ใดๆ จงหา $IA - AI$''',
          ],
          "options": [
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$A$",
            r"$2A$",
            r"ข้อมูลไม่เพียงพอ",
          ],
          "correct": r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          "explanation": r'''$IA = A$ และ $AI = A$

ดังนั้น $IA - AI = A - A = $ เมทริกซ์ศูนย์

🧠 **ข้อสังเกต:** ไม่ต้องรู้ว่า $A$ คืออะไร ใช้สมบัติ $AI = IA = A$ ได้ทันที''',
        }),

        // Q3: หลายพจน์ กำลังสูง
        ContentBlock("mid_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ใดๆ จงหา $I^{50} \cdot A + A \cdot I^{30} - 2A$''',
          ],
          "options": [
            r"$A$",
            r"$80A$",
            r"เมทริกซ์ศูนย์",
            r"$2A$",
          ],
          "correct": r"เมทริกซ์ศูนย์",
          "explanation": r'''$I^{50} = I$ และ $I^{30} = I$

ดังนั้น $I \cdot A + A \cdot I - 2A = A + A - 2A = 0$''',
        }),

        // FI: ลดรูปรวมแล้วอ่านค่า
        ContentBlock("mid_fi_001", "question_fill_in", {
          "content": [
            r'''4. จงหา $a_{11}$ ของ $2I^3 + 5I^2 - 3I$ เมื่อ $I = I_2$''',
            {"box": "0"},
          ],
          "correct": "4",
          "explanation": r'''$I^3 = I$ และ $I^2 = I$

$2I + 5I - 3I = 4I = \begin{bmatrix} 4 & 0 \\ 0 & 4 \end{bmatrix}$

ดังนั้น $a_{11} = 4$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: สมการเมทริกซ์ที่ใช้ I
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สมการเมทริกซ์ที่ใช้ I",
      blocks: [
        ContentBlock("mid_eq_t_001", "text", {
          "content": [
            r'''ในสมการเมทริกซ์หลายแบบ $I$ จะโผล่มาเป็นตัวช่วย เพราะ $kI$ บวกลบกับเมทริกซ์อื่นได้ง่าย — มันแค่เปลี่ยนค่าบนเส้นทแยงเท่านั้น 💡''',
          ],
        }),

        // DDQ: แนะนำการจัดรูปสมการ
        ContentBlock("mid_eq_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mid_eq_ddq_001_s1",
              "content": [
                r'''จากสมการ $2A + 3I_2 = B$

ถ้าจะหา $A$ ต้องจัดรูปเป็น $2A = B -$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$3I$", r"$2I$", r"$B$", r"$I$"],
              "correctAnswers": {"0": r"$3I$"},
              "explanation": r'''ย้าย $3I$ ไปอีกฝั่ง ได้ $2A = B - 3I$''',
            },
            {
              "questionId": "mid_eq_ddq_001_s2",
              "content": [
                r'''ให้ $B = \begin{bmatrix} 7 & 4 \\ 6 & 9 \end{bmatrix}$

$B - 3I_2 = \begin{bmatrix} 7 & 4 \\ 6 & 9 \end{bmatrix} - \begin{bmatrix} 3 & 0 \\ 0 & 3 \end{bmatrix} = \begin{bmatrix} 4 & 4 \\ 6 & 6 \end{bmatrix}$

ดังนั้น $a_{11} = \dfrac{4}{2} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"1", r"2", r"3", r"4"],
              "correctAnswers": {"0": r"2"},
              "explanation": r'''$2A = \begin{bmatrix} 4 & 4 \\ 6 & 6 \end{bmatrix}$ ดังนั้น $A = \begin{bmatrix} 2 & 2 \\ 3 & 3 \end{bmatrix}$ และ $a_{11} = 2$''',
            },
          ],
        }),

        // Q1: 2A + 3I = B
        ContentBlock("mid_eq_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $2A + 3I_2 = \begin{bmatrix} 7 & 4 \\ 6 & 9 \end{bmatrix}$ จงหา $a_{11} + a_{22}$''',
          ],
          "options": ["4", "5", "6", "8"],
          "correct": "5",
          "explanation": r'''$2A = \begin{bmatrix} 7 & 4 \\ 6 & 9 \end{bmatrix} - 3I_2 = \begin{bmatrix} 4 & 4 \\ 6 & 6 \end{bmatrix}$

$A = \begin{bmatrix} 2 & 2 \\ 3 & 3 \end{bmatrix}$

$a_{11} + a_{22} = 2 + 3 = 5$''',
        }),

        // Q2: A - 2I = B → หา AI (trick: AI = A)
        ContentBlock("mid_eq_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A - 2I_2 = \begin{bmatrix} 1 & 3 \\ 5 & 2 \end{bmatrix}$ จงหา $A \cdot I_2$''',
          ],
          "options": [
            r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 3 \\ 5 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 3 \\ 5 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 6 & 6 \\ 10 & 8 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 3 \\ 5 & 4 \end{bmatrix}$",
          "explanation": r'''$A = \begin{bmatrix} 1 & 3 \\ 5 & 2 \end{bmatrix} + 2I_2 = \begin{bmatrix} 3 & 3 \\ 5 & 4 \end{bmatrix}$

แต่ $A \cdot I_2 = A$ อยู่แล้ว! ดังนั้นคำตอบคือ $A$ เอง

🧠 **ข้อสังเกต:** เจอ $A \cdot I$ ไม่ต้องคูณจริง ตอบ $A$ ได้เลย''',
        }),

        // Q3: 3A + B = 5I
        ContentBlock("mid_eq_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $3A + B = 5I_2$ เมื่อ $B = \begin{bmatrix} 2 & 3 \\ 0 & -1 \end{bmatrix}$ จงหา $a_{12}$''',
          ],
          "options": [r"$-3$", r"$-1$", r"$0$", r"$1$"],
          "correct": r"$-1$",
          "explanation": r'''$3A = 5I_2 - B = \begin{bmatrix} 5 & 0 \\ 0 & 5 \end{bmatrix} - \begin{bmatrix} 2 & 3 \\ 0 & -1 \end{bmatrix} = \begin{bmatrix} 3 & -3 \\ 0 & 6 \end{bmatrix}$

$A = \begin{bmatrix} 1 & -1 \\ 0 & 2 \end{bmatrix}$ ดังนั้น $a_{12} = -1$''',
        }),

        // Q4: A² = A (idempotent)
        ContentBlock("mid_eq_q_004", "question_choice", {
          "content": [
            r'''4. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ที่ $A^2 = A$ ข้อใดเท่ากับ $5A^2 - 4A$?''',
          ],
          "options": [
            r"$5A$",
            r"$A$",
            r"$I$",
            r"เมทริกซ์ศูนย์",
          ],
          "correct": r"$A$",
          "explanation": r'''แทน $A^2 = A$ เข้าไปตรงๆ:

$5A^2 - 4A = 5A - 4A = A$

🧠 **ข้อสังเกต:** พอรู้ว่า $A^2 = A$ ก็แทนค่าแล้วรวมพจน์ได้เลย ไม่ต้องรู้ว่า $A$ เป็นเมทริกซ์อะไร''',
        }),

        // Q5: A - 3I (สะพานสู่ section 3)
        ContentBlock("mid_eq_q_005", "question_choice", {
          "content": [
            r'''5. ให้ $A = \begin{bmatrix} 3 & 1 \\ 0 & 3 \end{bmatrix}$ จงหา $A - 3I_2$''',
          ],
          "options": [
            r"$\begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 1 \\ 0 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$",
          "explanation": r'''$A - 3I_2 = \begin{bmatrix} 3-3 & 1-0 \\ 0-0 & 3-3 \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$

🧠 **ข้อสังเกต:** สังเกตว่าเขียน $A$ เป็น $3I + B$ ได้ โดย $B = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$ ลองคิดดูว่า $B^2$ เท่ากับอะไร? (จะเจอในหัวข้อถัดไป!)''',
        }),

        // FI: A² - 4A + 4I (factored = (A-2I)²)
        ContentBlock("mid_eq_fi_001", "question_fill_in", {
          "content": [
            r'''6. ให้ $A = \begin{bmatrix} 2 & 1 \\ 0 & 2 \end{bmatrix}$ จงหาผลรวมของสมาชิกทั้งหมดใน $A^2 - 4A + 4I_2$''',
            {"box": "0"},
          ],
          "correct": "0",
          "explanation": r'''$A^2 = \begin{bmatrix} 4 & 4 \\ 0 & 4 \end{bmatrix}$

$4A = \begin{bmatrix} 8 & 4 \\ 0 & 8 \end{bmatrix}$, $4I = \begin{bmatrix} 4 & 0 \\ 0 & 4 \end{bmatrix}$

$A^2 - 4A + 4I = \begin{bmatrix} 4-8+4 & 4-4+0 \\ 0-0+0 & 4-8+4 \end{bmatrix} = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$

ผลรวม $= 0$

🧠 **ข้อสังเกต:** ถ้าลองตั้ง $B = A - 2I = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$ จะพบว่า $A^2 - 4A + 4I = (A - 2I)^2 = B^2 = 0$ — การแยกตัวประกอบใช้กับเมทริกซ์ได้เหมือนกัน!''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: โจทย์ท้าทาย — กำลังสูงและทวินาม
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ท้าทาย — กำลังสูงและทวินาม",
      blocks: [
        ContentBlock("mid_ch_t_001", "text", {
          "content": [
            r'''ถ้าเขียน $A = kI + B$ แล้ว $B$ มีคุณสมบัติพิเศษ เช่น $B^2 = 0$ เราจะหากำลังสูงๆ ของ $A$ ได้ง่ายขึ้นมาก เพราะพจน์ที่มี $B^2, B^3, \ldots$ จะหายไปหมด! 🚀''',
          ],
        }),

        // DDQ: แยก A = I + B แล้วลอง B²
        ContentBlock("mid_ch_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "mid_ch_ddq_001_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$ ลองเขียน $A = I + B$

$B = A - I = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$",
                r"$\begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$",
                r"$\begin{bmatrix} 2 & 2 \\ 0 & 2 \end{bmatrix}$",
              ],
              "correctAnswers": {"0": r"$\begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$"},
              "explanation": r'''$B = A - I = \begin{bmatrix} 1-1 & 2-0 \\ 0-0 & 1-1 \end{bmatrix} = \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$''',
            },
            {
              "questionId": "mid_ch_ddq_001_s2",
              "content": [
                r'''$B = \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$ แล้ว $B^2 = B \cdot B = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
                r"$\begin{bmatrix} 0 & 4 \\ 0 & 0 \end{bmatrix}$",
                r"$\begin{bmatrix} 4 & 0 \\ 0 & 4 \end{bmatrix}$",
              ],
              "correctAnswers": {"0": r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$"},
              "explanation": r'''$B^2 = \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix} \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix} = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$

เมทริกซ์แบบนี้ ($B^2 = 0$) เรียกว่า **nilpotent** — พจน์ที่มี $B^2$ ขึ้นไปจะกลายเป็น 0 หมด!''',
            },
          ],
        }),

        // Q1: (A - I)² nilpotent
        ContentBlock("mid_ch_q_001", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 1 & 3 \\ 0 & 1 \end{bmatrix}$ จงหา $(A - I_2)^2$''',
          ],
          "options": [
            r"$\begin{bmatrix} 0 & 3 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 6 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 9 & 0 \\ 0 & 9 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          "explanation": r'''ตั้ง $B = A - I = \begin{bmatrix} 0 & 3 \\ 0 & 0 \end{bmatrix}$

$B^2 = \begin{bmatrix} 0 & 3 \\ 0 & 0 \end{bmatrix} \begin{bmatrix} 0 & 3 \\ 0 & 0 \end{bmatrix} = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$

🧠 **ข้อสังเกต:** เมทริกซ์ที่มีตัวเลขเฉพาะแนวทแยงและมุมเดียว มักจะยกกำลัง 2 แล้วเป็นศูนย์''',
        }),

        // Q2: (I + B)³ ทวินาม
        ContentBlock("mid_ch_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $B = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix}$ (ทราบว่า $B^2 = 0$) จงหา $(I_2 + B)^3$''',
          ],
          "options": [
            r"$\begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 3 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 3 \\ 0 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 1 & 3 \\ 0 & 1 \end{bmatrix}$",
          "explanation": r'''กระจายแบบทวินาม:

$(I + B)^3 = I^3 + 3I^2 B + 3I B^2 + B^3$

$= I + 3B + 3 \cdot 0 + 0 = I + 3B$

$= \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} + \begin{bmatrix} 0 & 3 \\ 0 & 0 \end{bmatrix} = \begin{bmatrix} 1 & 3 \\ 0 & 1 \end{bmatrix}$

🧠 **ข้อสังเกต:** พอ $B^2 = 0$ ทวินามจะเหลือแค่ $I + nB$ — ง่ายมาก!''',
        }),

        // Q3: A² = I (involutory)
        ContentBlock("mid_ch_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ที่ $A^2 = I$ ข้อใดเท่ากับ $(A + I)^2 - 2A$?''',
          ],
          "options": [
            r"$I$",
            r"$2I$",
            r"$A$",
            r"$2A$",
          ],
          "correct": r"$2I$",
          "explanation": r'''กระจาย $(A + I)^2 = A^2 + AI + IA + I^2 = I + A + A + I = 2I + 2A$

$(A + I)^2 - 2A = 2I + 2A - 2A = 2I$''',
        }),

        // FI: A^100 กำลังสูง
        ContentBlock("mid_ch_fi_001", "question_fill_in", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 5 \\ 0 & 1 \end{bmatrix}$ จงหา $a_{12}$ ของ $A^{100}$''',
            {"box": "0"},
          ],
          "correct": "500",
          "explanation": r'''เขียน $A = I + B$ โดย $B = \begin{bmatrix} 0 & 5 \\ 0 & 0 \end{bmatrix}$ ซึ่ง $B^2 = 0$

$(I + B)^{100} = I + 100B = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} + \begin{bmatrix} 0 & 500 \\ 0 & 0 \end{bmatrix} = \begin{bmatrix} 1 & 500 \\ 0 & 1 \end{bmatrix}$

ดังนั้น $a_{12} = 500$

🧠 **ข้อสังเกต:** เมทริกซ์แบบ $\begin{bmatrix} 1 & c \\ 0 & 1 \end{bmatrix}$ ยกกำลัง $n$ จะได้ $\begin{bmatrix} 1 & nc \\ 0 & 1 \end{bmatrix}$ เสมอ''',
        }),

        // Q5: recurrence A² = 3A - 2I → A³
        ContentBlock("mid_ch_q_004", "question_choice", {
          "content": [
            r'''5. ให้ $A$ เป็นเมทริกซ์ที่ $A^2 = 3A - 2I$ ถ้าเขียน $A^3 = pA + qI$ จงหา $p + q$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"$5$"],
          "correct": r"$1$",
          "explanation": r'''$A^3 = A \cdot A^2 = A(3A - 2I) = 3A^2 - 2A$

แทน $A^2 = 3A - 2I$ อีกที:

$= 3(3A - 2I) - 2A = 9A - 6I - 2A = 7A - 6I$

$p = 7, q = -6$ ดังนั้น $p + q = 1$

🧠 **ข้อสังเกต:** เมื่อรู้ว่า $A^2$ เขียนในรูป $pA + qI$ ได้ ก็หา $A^3, A^4, \ldots$ ต่อได้เรื่อยๆ โดยแทน $A^2$ ซ้ำ''',
        }),

        // Q6: Fibonacci — A² = A + I → A⁵
        ContentBlock("mid_ch_q_005", "question_choice", {
          "content": [
            r'''6. ให้ $A$ เป็นเมทริกซ์ที่ $A^2 = A + I$ ถ้าเขียน $A^5 = pA + qI$ จงหา $p + q$''',
          ],
          "options": [r"$5$", r"$7$", r"$8$", r"$13$"],
          "correct": r"$8$",
          "explanation": r'''แทน $A^2 = A + I$ ซ้ำไปเรื่อยๆ:

$A^3 = A \cdot A^2 = A(A + I) = A^2 + A = 2A + I$

$A^4 = A \cdot A^3 = A(2A + I) = 2A^2 + A = 2(A+I) + A = 3A + 2I$

$A^5 = A \cdot A^4 = A(3A + 2I) = 3A^2 + 2A = 3(A+I) + 2A = 5A + 3I$

$p = 5, q = 3$ ดังนั้น $p + q = 8$

🧠 **ข้อสังเกต:** ดูสัมประสิทธิ์ของ $A$: $1, 1, 2, 3, 5, \ldots$ นี่คือ**ลำดับ Fibonacci** นั่นเอง! สัมประสิทธิ์ของ $I$ ก็เป็น Fibonacci เช่นกัน ($0, 1, 1, 2, 3, \ldots$)''',
        }),

        // FI: Fibonacci concrete — A⁶ element
        ContentBlock("mid_ch_fi_002", "question_fill_in", {
          "content": [
            r'''7. ให้ $A = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix}$ ทราบว่า $A^2 = A + I$ และจากข้อก่อนสัมประสิทธิ์เป็นไปตามลำดับ Fibonacci ถ้า $A^6 = 8A + 5I$ จงหา $a_{11}$ ของ $A^6$''',
            {"box": "0"},
          ],
          "correct": "13",
          "explanation": r'''$A^6 = 8A + 5I = 8 \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix} + 5 \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} = \begin{bmatrix} 8 & 8 \\ 8 & 0 \end{bmatrix} + \begin{bmatrix} 5 & 0 \\ 0 & 5 \end{bmatrix} = \begin{bmatrix} 13 & 8 \\ 8 & 5 \end{bmatrix}$

$a_{11} = 13$

🧠 **ข้อสังเกต:** ตัวเลขในเมทริกซ์ $A^n$ ล้วนเป็น Fibonacci! $(13, 8, 8, 5)$ ก็คือ $F_7, F_6, F_6, F_5$ — เมทริกซ์ $A$ ตัวนี้เป็นเครื่องมือสร้าง Fibonacci ได้อย่างมหัศจรรย์''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("mid_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**สมบัติพื้นฐาน:** $AI = IA = A$ และ $I^n = I$ ใช้ลดรูปนิพจน์ที่มี $I$ ได้ทันที''',
            r'''**สมการเมทริกซ์:** จัดรูป $pA + qI = B$ แล้วแก้หา $A$ เหมือนแก้สมการตัวแปรเดียว''',
            r'''**กำลังสูง:** ถ้าเขียน $A = kI + B$ แล้ว $B^2 = 0$ จะได้ $A^n = k^n I + nk^{n-1}B$ — กำลังสูงแค่ไหนก็หาได้''',
          ],
        }),
        ContentBlock("mid_sum_t_002", "text", {
          "content": [
            r'''**Recurrence:** ถ้ารู้ว่า $A^2 = pA + qI$ ก็หา $A^3, A^4, \ldots$ ได้โดยแทน $A^2$ ซ้ำ''',
            r'''**Fibonacci กับเมทริกซ์:** $A = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix}$ มี $A^2 = A + I$ สัมประสิทธิ์ใน $A^n = F_n A + F_{n-1} I$ เป็นลำดับ Fibonacci!''',
            r'''Note = เทคนิคหลัก: มองหาว่า $A$ เขียนเป็น $kI + B$ ได้ไหม แล้วดูว่า $B$ มีคุณสมบัติพิเศษอะไร — นี่คือกุญแจสำคัญของโจทย์ยากเรื่องเมทริกซ์เอกลักษณ์''',
          ],
        }),
      ],
    ),
  ],
);

// =====================================================================
// GROUP 2: การดำเนินการ
// =====================================================================

// Lesson 5: การทรานสโพส
final matrixTransposeLesson = ContentLesson(
  title: "การทรานสโพส",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: ทรานสโพส คืออะไร?
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"ทรานสโพส คืออะไร?",
      blocks: [
        ContentBlock("trn_t_001", "text", {
          "content": [
            r'''ทรานสโพสก็คือการ **สลับแถวกับหลัก** ของเมทริกซ์ แถวที่ 1 กลายเป็นหลักที่ 1 แถวที่ 2 กลายเป็นหลักที่ 2 ไปเรื่อยๆ 🔄''',
            r'''เขียนแทนด้วยสัญลักษณ์ $A^t$ (บางตำราใช้ $A^T$ หรือ $A'$ ก็เหมือนกัน)''',
          ],
        }),
        ContentBlock("trn_t_002", "text", {
          "content": [
            r'''ตัวอย่างเช่น $$\begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix}^t = \begin{bmatrix} 5 & 3 \\ 6 & 4 \\ 2 & 5 \end{bmatrix}$$''',
            r'''สังเกตว่าเมทริกซ์เดิมขนาด $2 \times 3$ พอทรานสโพสแล้วกลายเป็น $3 \times 2$ — มิติสลับกัน!''',
          ],
        }),
        ContentBlock("trn_img_001", "image", {
          "path": "assets/transpose_swap.png",
        }),
        ContentBlock("trn_t_003", "text", {
          "content": [
            r'''พูดง่ายๆ คือ **ตัวเลขที่เคยอยู่แถวที่ $i$ หลักที่ $j$ จะย้ายไปอยู่แถวที่ $j$ หลักที่ $i$** นั่นคือ $(A^t)_{ij} = a_{ji}$''',
            r'''Note = ถ้า $A$ มีขนาด $m \times n$ แล้ว $A^t$ จะมีขนาด $n \times m$''',
          ],
        }),

        // DDQ: ลองทรานสโพสด้วยตัวเอง
        ContentBlock("trn_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "trn_ddq_001_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \\ 5 & 6 \end{bmatrix}$

แถวที่ 1 ของ $A$ คือ $[1, 2]$ → กลายเป็น**หลักที่ 1** ของ $A^t$
แถวที่ 2 ของ $A$ คือ $[3, 4]$ → กลายเป็น**หลักที่ 2** ของ $A^t$

ดังนั้น $A^t$ มีขนาด ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2 \times 3$", r"$3 \times 2$", r"$3 \times 3$"],
              "correctAnswers": {"0": r"$2 \times 3$"},
              "explanation": r'''$A$ ขนาด $3 \times 2$ → $A^t$ ขนาด $2 \times 3$ (มิติสลับกัน)''',
            },
            {
              "questionId": "trn_ddq_001_s2",
              "content": [
                r'''$A^t = \begin{bmatrix} 1 & 3 & 5 \\ 2 & 4 & 6 \end{bmatrix}$

$(A^t)_{12}$ ก็คือ $a_{21}$ ของเมทริกซ์เดิม ซึ่งเท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"1", r"2", r"3", r"4"],
              "correctAnswers": {"0": r"3"},
              "explanation": r'''$(A^t)_{12} = a_{21} = 3$ — ตำแหน่งสลับกัน!''',
            },
          ],
        }),

        // Q1: ทรานสโพสตรงๆ
        ContentBlock("trn_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $\begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix}^t$''',
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 3 \\ 6 & 4 \\ 2 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 6 & 2 \\ 3 & 4 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 5 & 6 \\ 5 & 4 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 4 & 5 \\ 5 & 6 & 2 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 5 & 3 \\ 6 & 4 \\ 2 & 5 \end{bmatrix}$",
          "explanation": r'''สลับแถวกับหลัก: แถว $[5, 6, 2]$ กลายเป็นหลักแรก แถว $[3, 4, 5]$ กลายเป็นหลักที่สอง ✅''',
        }),

        // Q2: อ่านตำแหน่งจากทรานสโพส
        ContentBlock("trn_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & 7 & 3 \\ 2 & 5 & 8 \end{bmatrix}$ จงหา $(A^t)_{31}$''',
          ],
          "options": ["1", "2", "3", "8"],
          "correct": "3",
          "explanation": r'''$(A^t)_{31} = a_{13} = 3$

จำว่า $(A^t)_{ij} = a_{ji}$ — ตำแหน่งสลับกัน''',
        }),

        // Q3: fill_in — มิติ + element
        ContentBlock("trn_fi_001", "question_fill_in", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} 2 & 5 \\ 1 & 3 \end{bmatrix}$ ถ้า $A^t$ มีขนาด $m \times n$ จงหา $m + n + (A^t)_{21}$''',
            {"box": "0"},
          ],
          "correct": "9",
          "explanation": r'''$A$ ขนาด $2 \times 2$ → $A^t$ ขนาด $2 \times 2$ ดังนั้น $m = 2, n = 2$

$(A^t)_{21} = a_{12} = 5$

$m + n + (A^t)_{21} = 2 + 2 + 5 = 9$''',
        }),

        // Q4: ทรานสโพสแล้วคูณ
        ContentBlock("trn_q_003", "question_choice", {
          "content": [
            r'''4. จงหา $A^t \cdot B$ เมื่อ $A = \begin{bmatrix} 1 & 3 \\ 2 & 4 \end{bmatrix}$ และ $B = \begin{bmatrix} 1 & 0 \\ 2 & 1 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 2 \\ 11 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 6 \\ 2 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & 3 \\ 10 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 2 \\ 11 & 6 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 5 & 2 \\ 11 & 4 \end{bmatrix}$",
          "explanation": r'''$A^t = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$

$A^t B$: แถว 1 × หลัก 1: $1 \cdot 1 + 2 \cdot 2 = 5$
แถว 1 × หลัก 2: $1 \cdot 0 + 2 \cdot 1 = 2$
แถว 2 × หลัก 1: $3 \cdot 1 + 4 \cdot 2 = 11$
แถว 2 × หลัก 2: $3 \cdot 0 + 4 \cdot 1 = 4$''',
        }),

        // Q5: ย้อนกลับ — รู้ A^t หา a_ij
        ContentBlock("trn_q_004", "question_choice", {
          "content": [
            r'''5. ให้ $A^t = \begin{bmatrix} 3 & 1 \\ 5 & 2 \\ 4 & 6 \end{bmatrix}$ จงหา $a_{12} + a_{23}$''',
          ],
          "options": ["9", "10", "11", "12"],
          "correct": "11",
          "explanation": r'''$a_{ij} = (A^t)_{ji}$

$a_{12} = (A^t)_{21} = 5$

$a_{23} = (A^t)_{32} = 6$

$a_{12} + a_{23} = 5 + 6 = 11$''',
        }),

        // Q6: ทรานสโพสเมทริกซ์ทแยงมุม
        ContentBlock("trn_q_005", "question_choice", {
          "content": [
            r'''6. ให้ $D = \begin{bmatrix} 4 & 0 \\ 0 & 7 \end{bmatrix}$ จงหา $D^t$''',
          ],
          "options": [
            r"$\begin{bmatrix} 4 & 0 \\ 0 & 7 \end{bmatrix}$",
            r"$\begin{bmatrix} 7 & 0 \\ 0 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 4 \\ 7 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 7 \\ 4 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 4 & 0 \\ 0 & 7 \end{bmatrix}$",
          "explanation": r'''สลับแถวกับหลัก: $D^t = \begin{bmatrix} 4 & 0 \\ 0 & 7 \end{bmatrix} = D$

🧠 **ข้อสังเกต:** เมทริกซ์ทแยงมุมทรานสโพสแล้วได้ตัวเดิมเสมอ! เพราะค่าที่ต้องสลับคือ 0 กับ 0''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: สมบัติและการประยุกต์เบื้องต้น
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สมบัติและการประยุกต์เบื้องต้น",
      blocks: [
        // ── headerL2: สมบัติพื้นฐาน ──
        ContentBlock("trn_h_001", "header", {
          "title": r"สมบัติพื้นฐานของทรานสโพส",
          "level": 2,
        }),
        ContentBlock("trn_t_004", "text", {
          "content": [
            r'''$(A^t)^t = A$ — ทรานสโพสซ้ำสองรอบได้ตัวเดิมกลับมา (สลับแถวหลักสองที ก็กลับที่เดิม)''',
            r'''$(A + B)^t = A^t + B^t$ — ทรานสโพสของผลบวก = บวกทรานสโพสแต่ละตัว''',
          ],
        }),
        ContentBlock("trn_t_005", "text", {
          "content": [
            r'''$(kA)^t = kA^t$ — ค่าคงที่ดึงออกมาได้เลย''',
            r'''$I^t = I$ — เมทริกซ์เอกลักษณ์ทรานสโพสแล้วได้ตัวเดิม (เพราะเป็นทแยงมุม)''',
          ],
        }),
        ContentBlock("trn_t_006", "text", {
          "content": [
            r'''$$(AB)^t = B^t A^t$$''',
            r'''Note = ระวัง! ลำดับสลับกัน — $B$ มาก่อน $A$ คล้ายกับการถอดถุงเท้ากับรองเท้า ใส่รองเท้าทีหลัง แต่ถอดรองเท้าก่อน 🧦👟''',
          ],
        }),

        // DDQ: ฝึกสมบัติ (AB)^t
        ContentBlock("trn_ddq_002", "drag_and_drop", {
          "steps": [
            {
              "questionId": "trn_ddq_002_s1",
              "content": [
                r'''$(AB)^t$ เท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$A^t B^t$", r"$B^t A^t$", r"$(BA)^t$"],
              "correctAnswers": {"0": r"$B^t A^t$"},
              "explanation": r'''$(AB)^t = B^t A^t$ — ลำดับสลับกัน!''',
            },
            {
              "questionId": "trn_ddq_002_s2",
              "content": [
                r'''ดังนั้น $(ABC)^t$ จะเท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$A^t B^t C^t$", r"$C^t B^t A^t$", r"$C^t A^t B^t$"],
              "correctAnswers": {"0": r"$C^t B^t A^t$"},
              "explanation": r'''$(ABC)^t = C^t (AB)^t = C^t B^t A^t$ — กลับลำดับทั้งหมด!''',
            },
          ],
        }),

        // ── headerL2: เมทริกซ์สมมาตรและกึ่งสมมาตร ──
        ContentBlock("trn_h_002", "header", {
          "title": r"เมทริกซ์สมมาตรและกึ่งสมมาตร",
          "level": 2,
        }),
        ContentBlock("trn_t_007", "text", {
          "content": [
            r'''**เมทริกซ์สมมาตร** (Symmetric): $A^t = A$ — ทรานสโพสแล้วได้ตัวเดิม หมายความว่า $a_{ij} = a_{ji}$ ทุกตำแหน่ง''',
            r'''เช่น $\begin{bmatrix} 1 & 3 \\ 3 & 5 \end{bmatrix}$ สังเกตว่าค่าสะท้อนกันผ่านเส้นทแยง''',
          ],
        }),
        ContentBlock("trn_t_008", "text", {
          "content": [
            r'''**เมทริกซ์กึ่งสมมาตร** (Skew-Symmetric): $A^t = -A$ — ทรานสโพสแล้วได้ค่าตรงข้าม หมายความว่า $a_{ij} = -a_{ji}$''',
            r'''เช่น $\begin{bmatrix} 0 & 3 \\ -3 & 0 \end{bmatrix}$ — สมาชิกบนเส้นทแยงมุมต้องเป็น 0 เสมอ (เพราะ $a_{ii} = -a_{ii}$)''',
          ],
        }),

        // Q1: (AB)^t = B^t A^t ใช้จริง
        ContentBlock("trn_q_006", "question_choice", {
          "content": [
            r'''1. ให้ $AB = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ จงหา $B^t A^t + \begin{bmatrix} 2 & 0 \\ 1 & 2 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 2 \\ 4 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 3 \\ 3 & 6 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 0 \\ 1 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 2 \\ 4 & 6 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 3 \\ 3 & 6 \end{bmatrix}$",
          "explanation": r'''$B^t A^t = (AB)^t = \begin{bmatrix} 1 & 3 \\ 2 & 4 \end{bmatrix}$

$\begin{bmatrix} 1 & 3 \\ 2 & 4 \end{bmatrix} + \begin{bmatrix} 2 & 0 \\ 1 & 2 \end{bmatrix} = \begin{bmatrix} 3 & 3 \\ 3 & 6 \end{bmatrix}$

🧠 **ข้อสังเกต:** ไม่ต้องรู้ว่า $A$ กับ $B$ คืออะไร แค่รู้ว่า $B^tA^t = (AB)^t$ ก็ทำได้เลย''',
        }),

        // Q2: สมมาตร — หา x
        ContentBlock("trn_q_007", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & x \\ 3 & 4 \end{bmatrix}$ เป็นเมทริกซ์สมมาตร จงหา $x$''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "3",
          "explanation": r'''สมมาตร: $A^t = A$ ดังนั้น $a_{12} = a_{21}$

$x = 3$''',
        }),

        // Q3: กึ่งสมมาตร — ผลบวกเส้นทแยง
        ContentBlock("trn_q_008", "question_choice", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์กึ่งสมมาตร ($A^t = -A$) ขนาด $3 \times 3$ จงหา $a_{11} + a_{22} + a_{33}$''',
          ],
          "options": ["0", "1", "3", "ข้อมูลไม่เพียงพอ"],
          "correct": "0",
          "explanation": r'''กึ่งสมมาตร: $a_{ij} = -a_{ji}$

เมื่อ $i = j$: $a_{ii} = -a_{ii}$ → $2a_{ii} = 0$ → $a_{ii} = 0$

สมาชิกบนเส้นทแยงมุมเป็น 0 ทั้งหมด ดังนั้นผลบวก = 0

🧠 **ข้อสังเกต:** เมทริกซ์กึ่งสมมาตร**ทุกตัว**มีเส้นทแยงมุมเป็น 0 เสมอ''',
        }),

        // Q4: (kA)^t
        ContentBlock("trn_q_009", "question_choice", {
          "content": [
            r'''4. จงหา $(3A)^t$ เมื่อ $A = \begin{bmatrix} 1 & 2 \\ 4 & 5 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 12 \\ 6 & 15 \end{bmatrix}$",
            r"$\begin{bmatrix} 3 & 6 \\ 12 & 15 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 4 \\ 2 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 12 & 3 \\ 15 & 6 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 12 \\ 6 & 15 \end{bmatrix}$",
          "explanation": r'''$(3A)^t = 3A^t = 3 \begin{bmatrix} 1 & 4 \\ 2 & 5 \end{bmatrix} = \begin{bmatrix} 3 & 12 \\ 6 & 15 \end{bmatrix}$''',
        }),

        // Q5: A^t + 2I → หา a_12
        ContentBlock("trn_q_010", "question_choice", {
          "content": [
            r'''5. ให้ $A^t + 2I_2 = \begin{bmatrix} 5 & 1 \\ 3 & 6 \end{bmatrix}$ จงหา $a_{12}$''',
          ],
          "options": ["1", "3", "4", "5"],
          "correct": "3",
          "explanation": r'''$A^t = \begin{bmatrix} 5 & 1 \\ 3 & 6 \end{bmatrix} - 2I_2 = \begin{bmatrix} 3 & 1 \\ 3 & 4 \end{bmatrix}$

$a_{12} = (A^t)_{21} = 3$''',
        }),

        // Q6: fill_in — สมมาตร A + A^t = 2A
        ContentBlock("trn_fi_002", "question_fill_in", {
          "content": [
            r'''6. ให้ $A$ เป็นเมทริกซ์สมมาตร $2 \times 2$ ที่ $a_{11} = 2, a_{12} = 3, a_{22} = 5$ จงหาผลรวมของสมาชิกทั้งหมดใน $A + A^t$''',
            {"box": "0"},
          ],
          "correct": "26",
          "explanation": r'''สมมาตร: $A^t = A$ ดังนั้น $A + A^t = 2A$

$A = \begin{bmatrix} 2 & 3 \\ 3 & 5 \end{bmatrix}$ (สมมาตร: $a_{21} = a_{12} = 3$)

$2A = \begin{bmatrix} 4 & 6 \\ 6 & 10 \end{bmatrix}$

ผลรวม = $4 + 6 + 6 + 10 = 26$''',
        }),

        // Q7: สมการ 2A^t - 3I → หา a_12
        ContentBlock("trn_q_011", "question_choice", {
          "content": [
            r'''7. ให้ $2A^t - 3I_2 = \begin{bmatrix} 1 & 4 \\ -2 & 5 \end{bmatrix}$ จงหา $a_{12}$''',
          ],
          "options": [r"$-1$", r"$1$", r"$2$", r"$4$"],
          "correct": r"$-1$",
          "explanation": r'''$2A^t = \begin{bmatrix} 1 & 4 \\ -2 & 5 \end{bmatrix} + 3I_2 = \begin{bmatrix} 4 & 4 \\ -2 & 8 \end{bmatrix}$

$A^t = \begin{bmatrix} 2 & 2 \\ -1 & 4 \end{bmatrix}$

$a_{12} = (A^t)_{21} = -1$''',
        }),

        // Q8: A^tA หาช่อง
        ContentBlock("trn_q_012", "question_choice", {
          "content": [
            r'''8. ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 3 \end{bmatrix}$ จงหา $c_{11}$ ของ $A^t A$''',
          ],
          "options": ["1", "4", "5", "13"],
          "correct": "1",
          "explanation": r'''$A^t = \begin{bmatrix} 1 & 0 \\ 2 & 3 \end{bmatrix}$

$c_{11}$ ของ $A^t A$: แถว 1 ของ $A^t$ × หลัก 1 ของ $A = 1 \cdot 1 + 0 \cdot 0 = 1$

🧠 **ข้อสังเกต:** $A^t A$ จะได้เมทริกซ์**สมมาตร**เสมอ (ลองตรวจดูได้!)''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: โจทย์ท้าทาย
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ท้าทาย",
      blocks: [
        ContentBlock("trn_t_009", "text", {
          "content": [
            r'''ลองนำสมบัติทรานสโพสมาใช้ร่วมกับเมทริกซ์เอกลักษณ์ กำลังสูง และสมการเมทริกซ์ — โจทย์ส่วนนี้ต้องมองให้เห็นว่าใช้สมบัติไหนก่อนแล้วจะง่ายขึ้น 🔥''',
          ],
        }),

        // Q1: A - A^t กึ่งสมมาตรเสมอ
        ContentBlock("trn_q_013", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 3 & 5 \\ 1 & 2 \end{bmatrix}$ และ $B = A - A^t$ จงหา $b_{11} + b_{22}$''',
          ],
          "options": ["-5", "-1", "0", "5"],
          "correct": "0",
          "explanation": r'''$A^t = \begin{bmatrix} 3 & 1 \\ 5 & 2 \end{bmatrix}$

$B = A - A^t = \begin{bmatrix} 0 & 4 \\ -4 & 0 \end{bmatrix}$

$b_{11} + b_{22} = 0 + 0 = 0$

🧠 **ข้อสังเกต:** $A - A^t$ จะเป็นเมทริกซ์กึ่งสมมาตรเสมอ ไม่ว่า $A$ จะเป็นอะไร เพราะ $(A - A^t)^t = A^t - A = -(A - A^t)$''',
        }),

        // Q2: A + A^t = 2I → หา a_12 + a_21
        ContentBlock("trn_q_014", "question_choice", {
          "content": [
            r'''2. ให้ $A + A^t = 2I_2$ จงหา $a_{12} + a_{21}$''',
          ],
          "options": ["-2", "-1", "0", "2"],
          "correct": "0",
          "explanation": r'''$(A + A^t)_{12} = a_{12} + (A^t)_{12} = a_{12} + a_{21}$

จากโจทย์ $(2I)_{12} = 0$

ดังนั้น $a_{12} + a_{21} = 0$

🧠 **ข้อสังเกต:** ไม่จำเป็นต้องรู้ค่าแต่ละตัว แค่ใช้สมบัติของ $I$ ที่นอกทแยงเป็น 0 ก็พอ''',
        }),

        // Q3: สมมาตร + A² = I → (A^t)^10
        ContentBlock("trn_q_015", "question_choice", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ที่ $A^t = A$ และ $A^2 = I$ จงหา $(A^t)^{10}$''',
          ],
          "options": [
            r"$A$",
            r"$A^{10}$",
            r"$I$",
            r"$10A$",
          ],
          "correct": r"$I$",
          "explanation": r'''$A^t = A$ ดังนั้น $(A^t)^{10} = A^{10}$

$A^{10} = (A^2)^5 = I^5 = I$''',
        }),

        // Q4: fill_in — (A^t)^100 nilpotent
        ContentBlock("trn_fi_003", "question_fill_in", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$ จงหา $c_{21}$ ของ $(A^t)^{100}$''',
            {"box": "0"},
          ],
          "correct": "200",
          "explanation": r'''$A^t = \begin{bmatrix} 1 & 0 \\ 2 & 1 \end{bmatrix}$

เขียน $A^t = I + C$ โดย $C = \begin{bmatrix} 0 & 0 \\ 2 & 0 \end{bmatrix}$

$C^2 = \begin{bmatrix} 0 & 0 \\ 2 & 0 \end{bmatrix} \begin{bmatrix} 0 & 0 \\ 2 & 0 \end{bmatrix} = \begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$

$B^2 = 0$ → $(I + C)^{100} = I + 100C = \begin{bmatrix} 1 & 0 \\ 200 & 1 \end{bmatrix}$

$c_{21} = 200$''',
        }),

        // Q5: A^t = A + 2I → ขัดแย้ง
        ContentBlock("trn_q_016", "question_choice", {
          "content": [
            r'''5. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ที่สอดคล้อง $A^t = A + 2I_2$ ข้อใดกล่าวถูกต้อง?''',
          ],
          "options": [
            r"$A$ เป็นเมทริกซ์ศูนย์",
            r"$A = -I$",
            r"ไม่มีเมทริกซ์ $A$ ที่สอดคล้อง",
            r"$A$ เป็นเมทริกซ์สมมาตร",
          ],
          "correct": r"ไม่มีเมทริกซ์ $A$ ที่สอดคล้อง",
          "explanation": r'''ทรานสโพสทั้งสองข้าง: $(A^t)^t = (A + 2I)^t$

$A = A^t + 2I$ (เพราะ $I^t = I$)

แทน $A^t = A + 2I$ กลับเข้าไป: $A = (A + 2I) + 2I = A + 4I$

ได้ $0 = 4I$ ซึ่งเป็นไปไม่ได้!

🧠 **ข้อสังเกต:** ใช้ $(A^t)^t = A$ เป็นเครื่องมือตรวจสอบว่าสมการเป็นไปได้หรือไม่''',
        }),

        // Q6: สมมาตร + สมการ 3A + 2A^t = 5B
        ContentBlock("trn_q_017", "question_choice", {
          "content": [
            r'''6. ให้ $A$ เป็นเมทริกซ์สมมาตรที่ $3A + 2A^t = 5\begin{bmatrix} 1 & 2 \\ 2 & 3 \end{bmatrix}$ จงหา $a_{12}$''',
          ],
          "options": ["1", "2", "3", "5"],
          "correct": "2",
          "explanation": r'''สมมาตร: $A^t = A$ ดังนั้น $3A + 2A = 5A = 5\begin{bmatrix} 1 & 2 \\ 2 & 3 \end{bmatrix}$

$A = \begin{bmatrix} 1 & 2 \\ 2 & 3 \end{bmatrix}$ ดังนั้น $a_{12} = 2$''',
        }),

        // Q7: AA^t - A^tA
        ContentBlock("trn_q_018", "question_choice", {
          "content": [
            r'''7. ให้ $A = \begin{bmatrix} 2 & 1 \\ 0 & 2 \end{bmatrix}$ จงหา $AA^t - A^t A$''',
          ],
          "options": [
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}$",
            r"$\begin{bmatrix} -1 & 0 \\ 0 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} 1 & 2 \\ 2 & 1 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}$",
          "explanation": r'''$A^t = \begin{bmatrix} 2 & 0 \\ 1 & 2 \end{bmatrix}$

$AA^t = \begin{bmatrix} 5 & 2 \\ 2 & 4 \end{bmatrix}$, $A^t A = \begin{bmatrix} 4 & 2 \\ 2 & 5 \end{bmatrix}$

$AA^t - A^t A = \begin{bmatrix} 1 & 0 \\ 0 & -1 \end{bmatrix}$

🧠 **ข้อสังเกต:** $AA^t \neq A^t A$ โดยทั่วไป แต่ทั้ง $AA^t$ และ $A^tA$ จะเป็นเมทริกซ์**สมมาตร**เสมอ (ตรวจดูได้: $(AA^t)^t = (A^t)^t A^t = AA^t$)''',
        }),

        // Q8: fill_in — ระบบสมการ A+A^t, A-A^t → หา A
        ContentBlock("trn_fi_004", "question_fill_in", {
          "content": [
            r'''8. ให้ $A + A^t = \begin{bmatrix} 4 & 6 \\ 6 & 10 \end{bmatrix}$ และ $A - A^t = \begin{bmatrix} 0 & 2 \\ -2 & 0 \end{bmatrix}$ จงหา $a_{12}$''',
            {"box": "0"},
          ],
          "correct": "4",
          "explanation": r'''เอาสองสมการมาบวกกัน:

$(A + A^t) + (A - A^t) = 2A$

$2A = \begin{bmatrix} 4+0 & 6+2 \\ 6-2 & 10+0 \end{bmatrix} = \begin{bmatrix} 4 & 8 \\ 4 & 10 \end{bmatrix}$

$A = \begin{bmatrix} 2 & 4 \\ 2 & 5 \end{bmatrix}$ ดังนั้น $a_{12} = 4$

🧠 **ข้อสังเกต:** เทคนิคนี้คล้ายกับการหา $A$ จาก $A + B$ กับ $A - B$ ที่เรียนมาแล้ว — ทรานสโพสเหมือนเป็นอีก "เมทริกซ์" ตัวหนึ่งที่ช่วยตั้งระบบสมการ''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("trn_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**ทรานสโพส** ($A^t$) คือการสลับแถวกับหลัก โดย $(A^t)_{ij} = a_{ji}$ ถ้า $A$ ขนาด $m \times n$ → $A^t$ ขนาด $n \times m$''',
            r'''**สมบัติหลัก:** $(A^t)^t = A$, $(A + B)^t = A^t + B^t$, $(kA)^t = kA^t$, $I^t = I$''',
            r'''**ลำดับสลับ:** $(AB)^t = B^t A^t$ — ระวังเรื่องลำดับ!''',
          ],
        }),
        ContentBlock("trn_sum_t_002", "text", {
          "content": [
            r'''**สมมาตร:** $A^t = A$ → ค่าสะท้อนกันผ่านเส้นทแยง | **กึ่งสมมาตร:** $A^t = -A$ → เส้นทแยงเป็น 0 เสมอ''',
            r'''**ผลคูณพิเศษ:** $A^t A$ และ $AA^t$ เป็นเมทริกซ์สมมาตรเสมอ และ $A - A^t$ เป็นกึ่งสมมาตรเสมอ''',
            r'''Note = เทคนิคสำคัญ: ใช้ $(A^t)^t = A$ ตรวจสอบว่าสมการเป็นไปได้หรือไม่ และใช้ $A + A^t$ กับ $A - A^t$ ตั้งระบบสมการเพื่อหา $A$''',
          ],
        }),
      ],
    ),
  ],
);

// ─────────────────────────────────────────────────────────────────────────────
// Lesson 6: การ Det
// ─────────────────────────────────────────────────────────────────────────────

final matrixDetLesson = ContentLesson(
  title: "การหา Det",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: การ Det
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"การ Det",
      blocks: [
        ContentBlock("det_t_001", "text", {
          "content": [
            r'''**ดีเทอร์มิแนนต์** (Determinant) หรือเรียกสั้นๆ ว่า **Det** คือค่าตัวเลข**ตัวเดียว**ที่คำนวณออกมาจากเมทริกซ์จัตุรัส 🔢''',
            r'''สัญลักษณ์: เขียนได้สองแบบ $\det A$ หรือ $|A|$ (ใส่แท่งตรงสองข้าง) ความหมายเหมือนกัน''',
          ],
        }),
        ContentBlock("det_t_002", "text", {
          "content": [
            r'''สิ่งสำคัญคือ **หา Det ได้เฉพาะเมทริกซ์จัตุรัสเท่านั้น** ถ้าเมทริกซ์ไม่จัตุรัส ($m \neq n$) จะหา Det ไม่ได้เลย ❌''',
          ],
        }),
        ContentBlock("det_t_003", "text", {
          "content": [
            r'''ในบทนี้จะเรียนรู้ 2 วิธีในการหา Det:''',
            r'''**วิธีคูณลง – คูณขึ้น** เหมาะกับเมทริกซ์เล็ก ($2 \times 2$ และ $3 \times 3$) ทำได้เร็วมาก''',
            r'''**วิธี Cofactor Expansion** ใช้ได้กับทุกขนาด ยิ่งเมทริกซ์ใหญ่ยิ่งจำเป็น''',
          ],
        }),

        // DDQ: เมทริกซ์ไหนหา Det ได้?
        ContentBlock("det_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_001_s1",
              "content": [
                r'''$A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ หา Det ได้หรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"ได้", r"ไม่ได้"],
              "correctAnswers": {"0": r"ได้"},
              "explanation": r'''ขนาด $2 \times 2$ เป็นจัตุรัส → หา Det ได้ ✅''',
            },
            {
              "questionId": "det_ddq_001_s2",
              "content": [
                r'''$B = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \end{bmatrix}$ หา Det ได้หรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"ได้", r"ไม่ได้"],
              "correctAnswers": {"0": r"ไม่ได้"},
              "explanation": r'''ขนาด $2 \times 3$ ไม่ใช่จัตุรัส → หา Det ไม่ได้ ❌''',
            },
            {
              "questionId": "det_ddq_001_s3",
              "content": [
                r'''$C = \begin{bmatrix} 7 \end{bmatrix}$ หา Det ได้หรือไม่? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"ได้", r"ไม่ได้"],
              "correctAnswers": {"0": r"ได้"},
              "explanation": r'''ขนาด $1 \times 1$ เป็นจัตุรัส → หา Det ได้ ✅ (และ $\det C = 7$ ก็คือตัวเลขตัวนั้นเลย)''',
            },
          ],
        }),

        // Q1: ขนาดไหนหา Det ได้
        ContentBlock("det_q_001", "question_choice", {
          "content": [
            r'''1. เมทริกซ์ขนาดใดต่อไปนี้**สามารถ**หา Det ได้?''',
          ],
          "options": [
            r"$2 \times 3$",
            r"$4 \times 4$",
            r"$1 \times 3$",
            r"$3 \times 1$",
          ],
          "correct": r"$4 \times 4$",
          "explanation": r'''ต้องเป็นจัตุรัสเท่านั้น (แถว = หลัก) ซึ่งมีแค่ $4 \times 4$ ที่เป็นจัตุรัส''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: วิธีคูณลง – คูณขึ้น
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"วิธีคูณลง – คูณขึ้น",
      blocks: [
        // ── headerL2: 2×2 ──
        ContentBlock("det_h_001", "header", {
          "title": r"เมทริกซ์ $2 \times 2$",
          "level": 2,
        }),
        ContentBlock("det_t_004", "text", {
          "content": [
            r'''สำหรับเมทริกซ์ $2 \times 2$: $$\begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc$$''',
            r'''แค่เอา**ทแยงหลักคูณกัน** ($ad$) แล้ว**ลบด้วยทแยงรองคูณกัน** ($bc$) ง่ายมาก!''',
          ],
        }),
        ContentBlock("det_img_001", "image", {
          "path": "assets/det_2x2_diagonal.png",
        }),
        ContentBlock("det_t_005", "text", {
          "content": [
            r'''Note = จำง่ายๆ: คูณทแยง↘ ลบ คูณทแยง↗''',
          ],
        }),

        // DDQ: ลองทำ 2×2
        ContentBlock("det_ddq_002", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_002_s1",
              "content": [
                r'''จงหา $\begin{vmatrix} 1 & 2 \\ 4 & 5 \end{vmatrix}$

คูณทแยง↘: $1 \cdot 5 = $ ''',
                {"drop": "0"},
                r'''

คูณทแยง↗: $2 \cdot 4 = $ ''',
                {"drop": "1"},
                r'''

$\det = $ คูณทแยง↘ $-$ คูณทแยง↗ $= $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$3$", r"$5$", r"$8$", r"$-3$", r"$-5$", r"$0$"],
              "correctAnswers": {"0": r"$5$", "1": r"$8$", "2": r"$-3$"},
              "explanation": r'''$1 \cdot 5 - 2 \cdot 4 = 5 - 8 = -3$ 🎯''',
            },
          ],
        }),

        // Q1: 2×2 ตรงๆ
        ContentBlock("det_q_002", "question_choice", {
          "content": [
            r'''1. จงหา $\begin{vmatrix} 3 & 7 \\ 2 & 5 \end{vmatrix}$''',
          ],
          "options": ["1", "-1", "15", "29"],
          "correct": "1",
          "explanation": r'''$3 \cdot 5 - 7 \cdot 2 = 15 - 14 = 1$''',
        }),

        // Q2: 2×2 มีลบ
        ContentBlock("det_q_003", "question_choice", {
          "content": [
            r'''2. จงหา $\begin{vmatrix} 4 & -2 \\ 3 & 6 \end{vmatrix}$''',
          ],
          "options": ["18", "30", "26", "-18"],
          "correct": "30",
          "explanation": r'''$4 \cdot 6 - (-2) \cdot 3 = 24 - (-6) = 24 + 6 = 30$

🧠 **ข้อสังเกต:** ระวังเครื่องหมายลบ! ลบจำนวนลบเท่ากับบวก''',
        }),

        // Q3: 2×2 fill_in
        ContentBlock("det_fi_001", "question_fill_in", {
          "content": [
            r'''3. จงหา $\begin{vmatrix} -1 & 3 \\ 2 & -4 \end{vmatrix}$''',
            {"box": "0"},
          ],
          "correct": "-2",
          "explanation": r'''$(-1)(-4) - (3)(2) = 4 - 6 = -2$''',
        }),

        // ── headerL2: 3×3 ──
        ContentBlock("det_h_002", "header", {
          "title": r"เมทริกซ์ $3 \times 3$ (วิธี Sarrus)",
          "level": 2,
        }),
        ContentBlock("det_t_006", "text", {
          "content": [
            r'''สำหรับ $3 \times 3$ ใช้**วิธี Sarrus** โดยเอา 2 หลักแรกมาเขียนต่อทางขวา แล้วคูณทแยง↘ ลบ คูณทแยง↗''',
          ],
        }),
        ContentBlock("det_img_002", "image", {
          "path": "assets/det_3x3_sarrus.png",
        }),
        ContentBlock("det_t_007", "text", {
          "content": [
            r'''$$\begin{vmatrix} a & b & c \\ d & e & f \\ g & h & i \end{vmatrix} = (aei + bfg + cdh) - (ceg + bdi + afh)$$''',
            r'''ทแยง↘ มี 3 เส้น: $aei$, $bfg$, $cdh$ → **บวกรวมกัน**''',
            r'''ทแยง↗ มี 3 เส้น: $ceg$, $bdi$, $afh$ → **บวกรวมกันแล้วลบออก**''',
          ],
        }),
        ContentBlock("det_t_008", "text", {
          "content": [
            r'''Note = วิธีนี้ใช้ได้กับ $2 \times 2$ และ $3 \times 3$ เท่านั้น! เมทริกซ์ใหญ่กว่านี้ต้องใช้วิธี Cofactor Expansion''',
          ],
        }),

        // DDQ: ลองทำ 3×3
        ContentBlock("det_ddq_003", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_003_s1",
              "content": [
                r'''จงหา $\begin{vmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{vmatrix}$

ทแยง↘: $1 \cdot 5 \cdot 9 + 2 \cdot 6 \cdot 7 + 3 \cdot 4 \cdot 8 = 45 + 84 + 96 = $ ''',
                {"drop": "0"},
                r'''

ทแยง↗: $3 \cdot 5 \cdot 7 + 2 \cdot 4 \cdot 9 + 1 \cdot 6 \cdot 8 = 105 + 72 + 48 = $ ''',
                {"drop": "1"},
                r'''

$\det = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$225$", r"$210$", r"$-225$", r"$15$", r"$0$", r"$-15$"],
              "correctAnswers": {"0": r"$225$", "1": r"$225$", "2": r"$0$"},
              "explanation": r'''$225 - 225 = 0$ 🎯

🧠 **ข้อสังเกต:** Det ออกมาได้เป็น 0 ก็ได้นะ! ไม่ผิดปกติ''',
            },
          ],
        }),

        // Q4: I₃ det
        ContentBlock("det_q_004", "question_choice", {
          "content": [
            r'''4. จงหา $\begin{vmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{vmatrix}$''',
          ],
          "options": ["1", "0", "-1", "3"],
          "correct": "1",
          "explanation": r'''ทแยง↘: $1 \cdot 1 \cdot 1 + 0 + 0 = 1$

ทแยง↗: $0 + 0 + 0 = 0$

$\det = 1 - 0 = 1$

🧠 **ข้อสังเกต:** $\det I = 1$ เสมอ ไม่ว่าจะขนาดเท่าไหร่!''',
        }),

        // Q5: 3×3
        ContentBlock("det_q_005", "question_choice", {
          "content": [
            r'''5. จงหา $\begin{vmatrix} 2 & 3 & 1 \\ 1 & 0 & 2 \\ 3 & 1 & 0 \end{vmatrix}$''',
          ],
          "options": ["-5", "5", "15", "-15"],
          "correct": "15",
          "explanation": r'''ทแยง↘: $(2)(0)(0) + (3)(2)(3) + (1)(1)(1) = 0 + 18 + 1 = 19$

ทแยง↗: $(1)(0)(3) + (3)(1)(0) + (2)(2)(1) = 0 + 0 + 4 = 4$

$\det = 19 - 4 = 15$''',
        }),

        // Q6: fill_in 3×3
        ContentBlock("det_fi_002", "question_fill_in", {
          "content": [
            r'''6. จงหา $\begin{vmatrix} 1 & 0 & 2 \\ 3 & 1 & 0 \\ 0 & 2 & 1 \end{vmatrix}$''',
            {"box": "0"},
          ],
          "correct": "13",
          "explanation": r'''ทแยง↘: $(1)(1)(1) + (0)(0)(0) + (2)(3)(2) = 1 + 0 + 12 = 13$

ทแยง↗: $(2)(1)(0) + (0)(3)(1) + (1)(0)(2) = 0 + 0 + 0 = 0$

$\det = 13 - 0 = 13$''',
        }),

        // Q7: 2×2 หาตัวแปร
        ContentBlock("det_q_006", "question_choice", {
          "content": [
            r'''7. ให้ $\begin{vmatrix} x & 2 \\ 3 & x \end{vmatrix} = 10$ จงหาค่า $x$ ที่เป็นจำนวนเต็มบวก''',
          ],
          "options": ["2", "3", "4", "5"],
          "correct": "4",
          "explanation": r'''$x^2 - 6 = 10 \to x^2 = 16 \to x = \pm 4$

เลือกจำนวนเต็มบวก: $x = 4$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: Minor และ Cofactor
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"Minor และ Cofactor",
      blocks: [
        ContentBlock("det_t_009", "text", {
          "content": [
            r'''ก่อนจะไปวิธีที่ 2 ต้องรู้จักสองคำนี้ก่อน: **Minor** กับ **Cofactor** — เป็นเครื่องมือสำคัญที่ทำให้หา Det ของเมทริกซ์ใหญ่ได้ 🧰''',
          ],
        }),

        // ── headerL2: Minor ──
        ContentBlock("det_h_003", "header", {
          "title": r"Minor",
          "level": 2,
        }),
        ContentBlock("det_t_010", "text", {
          "content": [
            r'''**Minor** $M_{ij}$ ของสมาชิก $a_{ij}$ คือ **Det ของเมทริกซ์ที่ตัดแถวที่ $i$ และหลักที่ $j$ ออกไป**''',
            r'''ลองนึกว่าเอาไม้บรรทัดปิดแถวนั้นกับหลักนั้น ส่วนที่เหลือก็เอามาหา Det ได้เลย''',
          ],
        }),
        ContentBlock("det_t_011", "text", {
          "content": [
            r'''ตัวอย่าง: ให้ $A = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}$''',
            r'''$M_{12}$ = ตัดแถว 1 และหลัก 2 ออก เหลือ $\begin{vmatrix} 4 & 6 \\ 7 & 9 \end{vmatrix} = 4 \cdot 9 - 6 \cdot 7 = 36 - 42 = -6$''',
          ],
        }),
        ContentBlock("det_img_003", "image", {
          "path": "assets/det_minor_cross_out.png",
        }),
        ContentBlock("det_t_012", "text", {
          "content": [
            r'''สังเกตว่า Minor ของเมทริกซ์ $3 \times 3$ จะได้ Det ของเมทริกซ์ $2 \times 2$ — เมทริกซ์เล็กลงหนึ่งขนาดเสมอ''',
          ],
        }),

        // DDQ: ฝึกหา Minor
        ContentBlock("det_ddq_004", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_004_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}$

$M_{11}$ = ตัดแถว 1 หลัก 1 ออก เหลือ $\begin{vmatrix} 5 & 6 \\ 8 & 9 \end{vmatrix}$

$M_{11} = 5 \cdot 9 - 6 \cdot 8 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3$", r"$3$", r"$-6$", r"$6$"],
              "correctAnswers": {"0": r"$-3$"},
              "explanation": r'''$45 - 48 = -3$ ✅''',
            },
            {
              "questionId": "det_ddq_004_s2",
              "content": [
                r'''$M_{21}$ = ตัดแถว 2 หลัก 1 ออก เหลือ $\begin{vmatrix} 2 & 3 \\ 8 & 9 \end{vmatrix}$

$M_{21} = 2 \cdot 9 - 3 \cdot 8 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-6$", r"$6$", r"$-3$", r"$3$"],
              "correctAnswers": {"0": r"$-6$"},
              "explanation": r'''$18 - 24 = -6$ ✅''',
            },
          ],
        }),

        // ── headerL2: Cofactor ──
        ContentBlock("det_h_004", "header", {
          "title": r"Cofactor",
          "level": 2,
        }),
        ContentBlock("det_t_013", "text", {
          "content": [
            r'''**Cofactor** $C_{ij}$ ก็คือ Minor แต่ **ติดเครื่องหมาย $\pm$ ตามตำแหน่ง**: $$C_{ij} = (-1)^{i+j} \cdot M_{ij}$$''',
            r'''$(-1)^{i+j}$ จะสลับเครื่องหมายเป็นลายกระดานหมากรุก: $\begin{bmatrix} + & - & + \\ - & + & - \\ + & - & + \end{bmatrix}$''',
          ],
        }),
        ContentBlock("det_t_014", "text", {
          "content": [
            r'''ตัวอย่าง: จาก $M_{12} = -6$ ข้างต้น''',
            r'''$C_{12} = (-1)^{1+2} \cdot (-6) = (-1)^3 \cdot (-6) = (-1)(-6) = 6$''',
          ],
        }),
        ContentBlock("det_t_015", "text", {
          "content": [
            r'''Note = $(-1)^{i+j}$ คิดง่ายๆ: ถ้า $i+j$ เป็นเลขคู่ → เครื่องหมาย $+$ / ถ้า $i+j$ เป็นเลขคี่ → เครื่องหมาย $-$''',
          ],
        }),

        // DDQ: ฝึก Cofactor
        ContentBlock("det_ddq_005", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_005_s1",
              "content": [
                r'''จากเมทริกซ์เดิม $M_{11} = -3$

$C_{11} = (-1)^{1+1} \cdot (-3) = (+1)(-3) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3$", r"$3$"],
              "correctAnswers": {"0": r"$-3$"},
              "explanation": r'''$(-1)^2 = 1$ → เครื่องหมาย $+$ ดังนั้น $C_{11} = -3$''',
            },
            {
              "questionId": "det_ddq_005_s2",
              "content": [
                r'''$M_{21} = -6$

$C_{21} = (-1)^{2+1} \cdot (-6) = (-1)(-6) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-6$", r"$6$"],
              "correctAnswers": {"0": r"$6$"},
              "explanation": r'''$(-1)^3 = -1$ → เครื่องหมาย $-$ ดังนั้น $C_{21} = 6$''',
            },
          ],
        }),

        // Q1: หา Minor
        ContentBlock("det_q_007", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 2 & 1 & 3 \\ 0 & 4 & 5 \\ 1 & 2 & 0 \end{bmatrix}$ จงหา $M_{13}$''',
          ],
          "options": ["-4", "4", "-8", "8"],
          "correct": "-4",
          "explanation": r'''ตัดแถว 1 หลัก 3 ออก เหลือ $\begin{vmatrix} 0 & 4 \\ 1 & 2 \end{vmatrix} = 0 \cdot 2 - 4 \cdot 1 = -4$''',
        }),

        // Q2: หา Cofactor
        ContentBlock("det_q_008", "question_choice", {
          "content": [
            r'''2. จากข้อที่แล้ว จงหา $C_{13}$''',
          ],
          "options": ["-4", "4", "-8", "8"],
          "correct": "-4",
          "explanation": r'''$C_{13} = (-1)^{1+3} \cdot M_{13} = (+1)(-4) = -4$

ในกรณีนี้ $1+3 = 4$ เป็นเลขคู่ จึงได้เครื่องหมาย $+$ ค่าไม่เปลี่ยน''',
        }),

        // Q3: fill_in Cofactor
        ContentBlock("det_fi_003", "question_fill_in", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} 1 & 3 & 2 \\ 0 & 5 & 1 \\ 4 & 0 & 3 \end{bmatrix}$ จงหา $C_{32}$''',
            {"box": "0"},
          ],
          "correct": "-1",
          "explanation": r'''$M_{32}$: ตัดแถว 3 หลัก 2 ออก เหลือ $\begin{vmatrix} 1 & 2 \\ 0 & 1 \end{vmatrix} = 1 - 0 = 1$

$C_{32} = (-1)^{3+2} \cdot 1 = (-1)^5 \cdot 1 = -1$''',
        }),

        // Q4: Cofactor ของเมทริกซ์ที่มี 0 เยอะ
        ContentBlock("det_q_009", "question_choice", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 5 & 0 & 0 \\ 2 & 3 & 0 \\ 1 & 4 & 7 \end{bmatrix}$ จงหา $C_{11}$''',
          ],
          "options": ["15", "21", "28", "-21"],
          "correct": "21",
          "explanation": r'''$M_{11}$: ตัดแถว 1 หลัก 1 → $\begin{vmatrix} 3 & 0 \\ 4 & 7 \end{vmatrix} = 21 - 0 = 21$

$C_{11} = (-1)^{1+1} \cdot 21 = (+1)(21) = 21$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: Cofactor Expansion
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"Cofactor Expansion",
      blocks: [
        ContentBlock("det_t_016", "text", {
          "content": [
            r'''พอรู้จัก Minor กับ Cofactor แล้ว ก็เอามาใช้หา Det ได้เลย หลักการคือ: **เลือกแถวหรือหลักใดก็ได้ 1 แถว/หลัก** แล้วคำนวณ''',
            r'''$$\det A = a_{i1} C_{i1} + a_{i2} C_{i2} + \cdots + a_{in} C_{in}$$''',
          ],
        }),
        ContentBlock("det_t_017", "text", {
          "content": [
            r'''พูดง่ายๆ คือ **เอาสมาชิกแต่ละตัวในแถว/หลักที่เลือก คูณกับ Cofactor ของตัวนั้น แล้วบวกรวมกัน** แค่นั้นเอง''',
            r'''ที่เจ๋งคือ **จะเลือกแถวไหนหรือหลักไหนก็ได้ ผลลัพธ์เท่ากันเสมอ!**''',
          ],
        }),
        ContentBlock("det_t_018", "text", {
          "content": [
            r'''Note = เลือกแถว/หลักที่**มี 0 เยอะ**จะดีมาก! เพราะสมาชิกที่เป็น 0 คูณกับ Cofactor ก็ได้ 0 → ไม่ต้องคิด Cofactor ของตัวนั้นเลย ประหยัดเวลาไปเลย ⏱️''',
          ],
        }),

        // DDQ: ลอง expand 3×3 ทีละแถว
        ContentBlock("det_ddq_006", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_006_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 2 & 0 & 1 \\ 3 & 1 & 0 \\ 0 & 4 & 2 \end{bmatrix}$ ลอง expand ตาม**แถว 1**

$\det A = a_{11} C_{11} + a_{12} C_{12} + a_{13} C_{13}$

$a_{12} = 0$ ดังนั้นพจน์นี้ = 0 ไม่ต้องคิดเลย!

$C_{11}$: ตัดแถว 1 หลัก 1 → $\begin{vmatrix} 1 & 0 \\ 4 & 2 \end{vmatrix} = 2$, เครื่องหมาย $(-1)^{1+1} = +$ → $C_{11} = 2$

$C_{13}$: ตัดแถว 1 หลัก 3 → $\begin{vmatrix} 3 & 1 \\ 0 & 4 \end{vmatrix} = 12$, เครื่องหมาย $(-1)^{1+3} = +$ → $C_{13} = 12$

$\det A = 2(2) + 0 + 1(12) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$14$", r"$16$", r"$24$"],
              "correctAnswers": {"0": r"$16$"},
              "explanation": r'''$\det A = 4 + 0 + 12 = 16$ ✅

ลองเทียบกับ Sarrus ก็ได้ผลเท่ากัน!''',
            },
          ],
        }),

        // Q1: 3×3 expand โดยเลือกแถว/หลักที่มี 0 เยอะ
        ContentBlock("det_q_010", "question_choice", {
          "content": [
            r'''1. จงหา $\begin{vmatrix} 0 & 3 & 0 \\ 2 & 1 & 4 \\ 0 & 5 & 0 \end{vmatrix}$''',
          ],
          "options": ["0", "6", "-6", "24"],
          "correct": "0",
          "explanation": r'''สังเกตหลัก 1: มี $0, 2, 0$ → expand ตามหลัก 1 เหลือแค่ตัวเดียวที่ต้องคิด

$\det = 0 \cdot C_{11} + 2 \cdot C_{21} + 0 \cdot C_{31} = 2 \cdot C_{21}$

$M_{21} = \begin{vmatrix} 3 & 0 \\ 5 & 0 \end{vmatrix} = 0$

ดังนั้น $\det = 2 \cdot (-1)^{2+1}(0) = 0$

🧠 **ข้อสังเกต:** หรือจะมองอีกแบบ — หลัก 1 กับหลัก 3 เป็นสัดส่วนกัน (เท่ากันเลย) ทำให้ $\det = 0$ ก็ได้''',
        }),

        // Q2: 3×3 expand ทั่วไป
        ContentBlock("det_q_011", "question_choice", {
          "content": [
            r'''2. จงหา $\begin{vmatrix} 1 & 0 & 2 \\ 0 & 3 & 0 \\ 4 & 0 & 1 \end{vmatrix}$ โดยเลือกแถวหรือหลักที่ทำให้คิดน้อยที่สุด''',
          ],
          "options": ["-21", "-9", "9", "21"],
          "correct": "-21",
          "explanation": r'''**แถว 2** มี 0 สองตัว เหลือคิดแค่ $a_{22} = 3$

$C_{22} = (-1)^{2+2} \begin{vmatrix} 1 & 2 \\ 4 & 1 \end{vmatrix} = (+1)(1 - 8) = -7$

$\det = 0 + 3(-7) + 0 = -21$''',
        }),

        // ── headerL2: 4×4 ──
        ContentBlock("det_h_005", "header", {
          "title": r"ขยายไปสู่เมทริกซ์ $4 \times 4$",
          "level": 2,
        }),
        ContentBlock("det_t_019", "text", {
          "content": [
            r'''Cofactor Expansion ใช้กับเมทริกซ์ทุกขนาด — เมทริกซ์ $4 \times 4$ ก็ expand ออกมาเป็น Cofactor ของเมทริกซ์ $3 \times 3$ แล้วค่อยหา Det $3 \times 3$ ต่อ''',
            r'''ยิ่งเมทริกซ์ใหญ่ ยิ่งต้อง**เลือกแถว/หลักให้ดี** เพราะทุก Cofactor ที่ไม่จำเป็นต้องคิด = ประหยัดงานมหาศาล''',
          ],
        }),

        // DDQ: 4×4 expand
        ContentBlock("det_ddq_007", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_007_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 2 & 0 & 0 & 3 \\ 1 & 5 & 0 & 0 \\ 0 & 0 & 4 & 0 \\ 1 & 0 & 0 & 2 \end{bmatrix}$

แถวไหนมี 0 เยอะที่สุด?

**แถว 3** มี 0 สามตัว เหลือ expand แค่ตัวเดียวคือ $a_{33} = 4$

เครื่องหมาย: $(-1)^{3+3} = (+1)$

Minor $M_{33}$ = ตัดแถว 3 หลัก 3 → $\begin{vmatrix} 2 & 0 & 3 \\ 1 & 5 & 0 \\ 1 & 0 & 2 \end{vmatrix}$

(ใช้ Sarrus หรือ expand ต่อก็ได้)

$M_{33} = (2)(5)(2) + (0)(0)(1) + (3)(1)(0) - (3)(5)(1) - (0)(1)(2) - (2)(0)(0)$

$= 20 + 0 + 0 - 15 - 0 - 0 = 5$

$\det A = 4 \cdot (+1) \cdot 5 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-20$", r"$5$", r"$20$", r"$40$"],
              "correctAnswers": {"0": r"$20$"},
              "explanation": r'''$\det A = 4 \times 5 = 20$ ✅

แค่เลือกแถว 3 ที่มี 0 เยอะ ก็ลดงานจากคิด 4 Cofactor เหลือแค่ 1!''',
            },
          ],
        }),

        // Q3: 4×4
        ContentBlock("det_q_012", "question_choice", {
          "content": [
            r'''3. จงหา $\begin{vmatrix} 1 & 0 & 2 & 0 \\ 0 & 3 & 0 & 0 \\ 2 & 0 & 1 & 0 \\ 0 & 0 & 0 & 4 \end{vmatrix}$''',
          ],
          "options": ["-24", "-36", "24", "36"],
          "correct": "-36",
          "explanation": r'''expand ตาม**หลัก 4** (มี 0 สามตัว) → เหลือแค่ $a_{44} = 4$

$C_{44} = (-1)^{4+4} \begin{vmatrix} 1 & 0 & 2 \\ 0 & 3 & 0 \\ 2 & 0 & 1 \end{vmatrix}$

Minor $3 \times 3$: expand แถว 2 (มี 0 สองตัว) → $3 \cdot (-1)^{2+2} \begin{vmatrix} 1 & 2 \\ 2 & 1 \end{vmatrix} = 3(1-4) = -9$

$\det = 4 \cdot (+1) \cdot (-9) = -36$''',
        }),

        // Q4: fill_in 4×4
        ContentBlock("det_fi_004", "question_fill_in", {
          "content": [
            r'''4. จงหา $\begin{vmatrix} 5 & 0 & 0 & 0 \\ 0 & 2 & 0 & 0 \\ 0 & 0 & 3 & 0 \\ 0 & 0 & 0 & 4 \end{vmatrix}$''',
            {"box": "0"},
          ],
          "correct": "120",
          "explanation": r'''เมทริกซ์ทแยงมุม! expand ตามแถว 1 เหลือแค่ $a_{11} = 5$

$\det = 5 \cdot \begin{vmatrix} 2 & 0 & 0 \\ 0 & 3 & 0 \\ 0 & 0 & 4 \end{vmatrix} = 5 \cdot 2 \cdot 3 \cdot 4 = 120$

🧠 **ข้อสังเกต:** Det ของเมทริกซ์**ทแยงมุม** = ผลคูณของสมาชิกบนเส้นทแยง เสมอ!''',
        }),

        // Q5: 3×3 ที่มี 0 เยอะ
        ContentBlock("det_q_013", "question_choice", {
          "content": [
            r'''5. จงหา $\begin{vmatrix} 0 & 0 & 5 \\ 0 & 3 & 0 \\ 2 & 0 & 0 \end{vmatrix}$''',
          ],
          "options": ["-30", "-15", "15", "30"],
          "correct": "-30",
          "explanation": r'''expand ตามแถว 1 (มี 0 สองตัว) → เหลือ $a_{13} = 5$

$C_{13} = (-1)^{1+3} \begin{vmatrix} 0 & 3 \\ 2 & 0 \end{vmatrix} = (+1)(0 - 6) = -6$

$\det = 5(-6) = -30$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 5: โจทย์ประยุกต์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ประยุกต์",
      blocks: [
        ContentBlock("det_t_020", "text", {
          "content": [
            r'''ถึงเวลาเอาทุกเรื่องมาใช้ร่วมกัน — ทั้ง Det, สมบัติเมทริกซ์จากบทก่อน, ตัวแปร, และเมทริกซ์พิเศษ 🔥''',
          ],
        }),

        // ── headerL2: สมบัติ Det ที่ควรรู้ ──
        ContentBlock("det_h_006", "header", {
          "title": r"สมบัติ Det ที่ควรรู้",
          "level": 2,
        }),
        ContentBlock("det_t_021", "text", {
          "content": [
            r'''$\det(A^t) = \det A$ — ทรานสโพสแล้ว Det ไม่เปลี่ยน''',
            r'''$\det(kA) = k^n \det A$ เมื่อ $A$ ขนาด $n \times n$ — ค่าคงที่ยกกำลัง $n$ ไม่ใช่แค่คูณ!''',
          ],
        }),
        ContentBlock("det_t_022", "text", {
          "content": [
            r'''$\det I = 1$ — Det ของเอกลักษณ์เป็น 1 เสมอ''',
            r'''Det ของเมทริกซ์**สามเหลี่ยม** (หรือทแยงมุม) = **ผลคูณของสมาชิกบนเส้นทแยงมุมหลัก**''',
          ],
        }),

        // DDQ: det(kA) — ทำไมไม่ใช่แค่ k × det A?
        ContentBlock("det_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "det_ddq_008_s1",
              "content": [
                r'''ให้ $A$ ขนาด $2 \times 2$ ที่ $\det A = 3$ แล้ว $\det(2A) = ?$

เมื่อคูณ 2 เข้าทุกตัว ทุกแถวถูกคูณด้วย 2

มี 2 แถว → Det ถูกคูณด้วย $2^2 = 4$

$\det(2A) = 4 \times 3 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$6$", r"$8$", r"$12$", r"$24$"],
              "correctAnswers": {"0": r"$12$"},
              "explanation": r'''$\det(kA) = k^n \det A = 2^2 \times 3 = 12$ ✅

ไม่ใช่แค่ $2 \times 3 = 6$ นะ!''',
            },
          ],
        }),

        // Q1: det(kA) สำหรับ 3×3
        ContentBlock("det_q_014", "question_choice", {
          "content": [
            r'''1. ให้ $A$ เป็นเมทริกซ์ $3 \times 3$ ที่ $\det A = 5$ จงหา $\det(2A)$''',
          ],
          "options": ["10", "20", "40", "80"],
          "correct": "40",
          "explanation": r'''$\det(2A) = 2^3 \cdot \det A = 8 \times 5 = 40$

ทุกแถวถูกคูณด้วย 2 → Det ถูกคูณด้วย $2^3 = 8$''',
        }),

        // Q2: det(A^t)
        ContentBlock("det_q_015", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$ จงหา $\det(A) + \det(A^t)$''',
          ],
          "options": ["-2", "-4", "0", "4"],
          "correct": "-4",
          "explanation": r'''$\det A = 1(4) - 2(3) = -2$

$\det(A^t) = \det A = -2$

$\det(A) + \det(A^t) = -2 + (-2) = -4$

🧠 **ข้อสังเกต:** ไม่ต้องทรานสโพสแล้วคำนวณใหม่ แค่ใช้สมบัติ $\det(A^t) = \det A$ ได้เลย''',
        }),

        // Q3: สามเหลี่ยม → det = ผลคูณทแยง
        ContentBlock("det_q_016", "question_choice", {
          "content": [
            r'''3. ให้ $A$ เป็นเมทริกซ์สามเหลี่ยมบน $3 \times 3$ ที่ $a_{11} = 2, a_{22} = -3, a_{33} = 4$ จงหา $\det A$''',
          ],
          "options": ["-24", "-3", "3", "24"],
          "correct": "-24",
          "explanation": r'''Det ของเมทริกซ์สามเหลี่ยม = ผลคูณสมาชิกบนเส้นทแยง

$\det A = 2 \times (-3) \times 4 = -24$

ไม่ต้องรู้ค่านอกทแยงเลย!''',
        }),

        // Q4: 3×3 หาตัวแปร
        ContentBlock("det_q_017", "question_choice", {
          "content": [
            r'''4. ให้ $\begin{vmatrix} 2 & x & 1 \\ 0 & 3 & -1 \\ 1 & 2 & x \end{vmatrix} = 16$ จงหาค่า $x$ ที่เป็นจำนวนเต็มบวก''',
          ],
          "options": ["1", "2", "3", "4"],
          "correct": "3",
          "explanation": r'''expand ตามหลัก 1 ($a_{21} = 0$ ไม่ต้องคิด):

$a_{11} C_{11} = 2 \begin{vmatrix} 3 & -1 \\ 2 & x \end{vmatrix} = 2(3x + 2)$

$a_{31} C_{31} = 1 \begin{vmatrix} x & 1 \\ 3 & -1 \end{vmatrix} = (-x - 3)$

$\det = 6x + 4 - x - 3 = 5x + 1$

$5x + 1 = 16 \to x = 3$ ✅''',
        }),

        // Q5: det สมการเปรียบเทียบ
        ContentBlock("det_fi_005", "question_fill_in", {
          "content": [
            r'''5. ให้ $\begin{vmatrix} a & 1 \\ 2 & a \end{vmatrix} = \begin{vmatrix} 3 & 1 \\ 0 & 2 \end{vmatrix}$ จงหาผลบวกของค่า $a$ ที่เป็นไปได้ทั้งหมด''',
            {"box": "0"},
          ],
          "correct": "0",
          "explanation": r'''ฝั่งซ้าย: $a^2 - 2$

ฝั่งขวา: $3(2) - 1(0) = 6$

$a^2 - 2 = 6 \to a^2 = 8 \to a = \pm 2\sqrt{2}$

ผลบวก $= 2\sqrt{2} + (-2\sqrt{2}) = 0$

🧠 **ข้อสังเกต:** สมการกำลังสอง $a^2 = k$ มีสองราก $\pm\sqrt{k}$ ซึ่งบวกกันได้ 0 เสมอ!''',
        }),

        // Q6: det(3A^t) — รวมสองสมบัติ
        ContentBlock("det_q_018", "question_choice", {
          "content": [
            r'''6. ให้ $A$ เป็นเมทริกซ์ $3 \times 3$ ที่ $\det A = 4$ จงหา $\det(3A^t)$''',
          ],
          "options": ["12", "36", "108", "324"],
          "correct": "108",
          "explanation": r'''$\det(3A^t) = 3^3 \cdot \det(A^t) = 27 \cdot \det A = 27 \times 4 = 108$

ใช้สมบัติสองตัวรวมกัน: $\det(kA) = k^n \det A$ และ $\det(A^t) = \det A$''',
        }),

        // Q7: 4×4 ซ้อนสองชั้น
        ContentBlock("det_q_019", "question_choice", {
          "content": [
            r'''7. จงหา $\begin{vmatrix} 3 & 0 & 0 & 0 \\ 2 & 1 & 0 & 0 \\ 5 & 4 & -2 & 0 \\ 1 & 3 & 7 & 4 \end{vmatrix}$''',
          ],
          "options": ["-24", "-12", "12", "24"],
          "correct": "-24",
          "explanation": r'''เมทริกซ์นี้เป็น**สามเหลี่ยมล่าง**!

Det = ผลคูณสมาชิกบนเส้นทแยง = $3 \times 1 \times (-2) \times 4 = -24$

ไม่ต้อง expand เลย 🧠''',
        }),

        // Q8: fill_in — det ของ k*I
        ContentBlock("det_fi_006", "question_fill_in", {
          "content": [
            r'''8. จงหา $\det(5 I_3)$''',
            {"box": "0"},
          ],
          "correct": "125",
          "explanation": r'''$\det(5I_3) = 5^3 \cdot \det(I_3) = 125 \times 1 = 125$

หรือจะมองว่า $5I_3 = \begin{bmatrix} 5 & 0 & 0 \\ 0 & 5 & 0 \\ 0 & 0 & 5 \end{bmatrix}$ เป็นทแยงมุม → ผลคูณทแยง $= 5^3 = 125$ ก็ได้เช่นกัน''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 6: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("det_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**Det** คือค่าตัวเลขของเมทริกซ์จัตุรัส เขียนเป็น $\det A$ หรือ $|A|$''',
            r'''**วิธีคูณลง – คูณขึ้น (Sarrus):** ใช้กับ $2 \times 2$ ($ad - bc$) และ $3 \times 3$ (เขียนซ้ำ 2 หลัก คูณทแยง↘ ลบ คูณทแยง↗) เท่านั้น''',
          ],
        }),
        ContentBlock("det_sum_t_002", "text", {
          "content": [
            r'''**Minor** ($M_{ij}$): Det ของเมทริกซ์ที่ตัดแถว $i$ หลัก $j$ ออก | **Cofactor** ($C_{ij}$): $(-1)^{i+j} M_{ij}$''',
            r'''**Cofactor Expansion:** เลือกแถว/หลักใดก็ได้ → $\det = \sum a_{ij} C_{ij}$ ใช้ได้ทุกขนาด เลือกแถว/หลักที่มี 0 เยอะจะประหยัดเวลา''',
          ],
        }),
        ContentBlock("det_sum_t_003", "text", {
          "content": [
            r'''**สมบัติสำคัญ:** $\det(A^t) = \det A$ / $\det(kA) = k^n \det A$ / $\det I = 1$ / Det ของเมทริกซ์สามเหลี่ยม = ผลคูณเส้นทแยง''',
            r'''Note = เทคนิคหลัก: มองหา 0 ก่อนเลือกวิธี expand — ยิ่งมี 0 เยอะ ยิ่งทำน้อย!''',
          ],
        }),
      ],
    ),
  ],
);

// ─────────────────────────────────────────────────────────────────────────────
// Lesson 7: แอดจอยซ์และอินเวอร์ส
// ─────────────────────────────────────────────────────────────────────────────
final matrixAdjInverseLesson = ContentLesson(
  title: "แอดจอยซ์และอินเวอร์ส",
  sections: [
    // ──────────────────────────────────────────────
    // Section 1: แอดจอยซ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"แอดจอยซ์",
      blocks: [
        ContentBlock("ainv_t_001", "text", {
          "content": [
            r'''ในบทที่แล้วเราเรียนเรื่อง Cofactor ($C_{ij}$) กันแล้ว คราวนี้เราจะเอา Cofactor ทุกตัวมาประกอบร่างเป็นเมทริกซ์ตัวใหม่ที่เรียกว่า **แอดจอยซ์** (Adjoint) 🧩''',
          ],
        }),
        ContentBlock("ainv_h_001", "header", {
          "title": r"เมทริกซ์โคแฟกเตอร์",
          "level": 2,
        }),
        ContentBlock("ainv_t_002", "text", {
          "content": [
            r'''ถ้าเราหา Cofactor ของ**ทุกตำแหน่ง**ในเมทริกซ์ $A$ แล้วเอามาใส่ตำแหน่งเดิม จะได้**เมทริกซ์โคแฟกเตอร์** เช่น''',
            r'''$A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}$ → เมทริกซ์โคแฟกเตอร์ $= \begin{bmatrix} C_{11} & C_{12} \\ C_{21} & C_{22} \end{bmatrix}$''',
          ],
        }),
        ContentBlock("ainv_h_002", "header", {
          "title": r"แอดจอยซ์คืออะไร?",
          "level": 2,
        }),
        ContentBlock("ainv_t_003", "text", {
          "content": [
            r'''**แอดจอยซ์** ($\text{adj}(A)$) ก็คือ **เมทริกซ์โคแฟกเตอร์ที่ทรานสโพสแล้ว** นั่นเอง''',
            r'''$$\text{adj}(A) = \begin{bmatrix} C_{11} & C_{12} \\ C_{21} & C_{22} \end{bmatrix}^t = \begin{bmatrix} C_{11} & C_{21} \\ C_{12} & C_{22} \end{bmatrix}$$''',
          ],
        }),
        ContentBlock("ainv_t_004", "text", {
          "content": [
            r'''Note = สังเกตว่าตำแหน่ง $(i,j)$ ของ $\text{adj}(A)$ คือ $C_{ji}$ ไม่ใช่ $C_{ij}$ — ตัว subscript สลับกันเพราะมีการทรานสโพส!''',
          ],
        }),
        ContentBlock("ainv_ddq_001", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_001_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix}$

หา Cofactor ทีละตัว:

$C_{11} = (+1) \cdot 5 = 5$, $C_{12} = (-1) \cdot 2 = -2$
$C_{21} = (-1) \cdot 1 = -1$, $C_{22} = (+1) \cdot 3 = 3$

เมทริกซ์โคแฟกเตอร์ $= \begin{bmatrix} 5 & -2 \\ -1 & 3 \end{bmatrix}$

$\text{adj}(A)$ = ทรานสโพสเมทริกซ์โคแฟกเตอร์ $= $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$",
                r"$\begin{bmatrix} 5 & -2 \\ -1 & 3 \end{bmatrix}$",
                r"$\begin{bmatrix} 3 & -1 \\ -2 & 5 \end{bmatrix}$",
              ],
              "correctAnswers": {"0": r"$\begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$"},
              "explanation": r'''ทรานสโพส: สลับ $C_{12}$ กับ $C_{21}$ → $\text{adj}(A) = \begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$''',
            },
          ],
        }),
        ContentBlock("ainv_h_003", "header", {
          "title": r"ทางลัดสำหรับ $2 \times 2$",
          "level": 2,
        }),
        ContentBlock("ainv_t_005", "text", {
          "content": [
            r'''สำหรับเมทริกซ์ $2 \times 2$ มีทางลัดที่เร็วมาก: $$A = \begin{bmatrix} a & b \\ c & d \end{bmatrix} \quad \Rightarrow \quad \text{adj}(A) = \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$$''',
            r'''พูดง่ายๆ คือ **สลับตำแหน่งทแยงหลัก** ($a \leftrightarrow d$) แล้ว**เปลี่ยนเครื่องหมายนอกทแยง** ($b \to -b$, $c \to -c$)''',
          ],
        }),
        ContentBlock("ainv_t_006", "text", {
          "content": [
            r'''ลองตรวจกับตัวอย่างข้างบน: $A = \begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix}$ → สลับ $3 \leftrightarrow 5$, เปลี่ยนเครื่องหมาย $1 \to -1$ และ $2 \to -2$''',
            r'''ได้ $\text{adj}(A) = \begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$ ตรงกัน ✅''',
          ],
        }),
        ContentBlock("ainv_q_001", "question_choice", {
          "content": [
            r'''1. จงหา $\text{adj}\begin{pmatrix} 4 & 3 \\ 7 & 2 \end{pmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 2 & -3 \\ -7 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & -7 \\ -3 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & -3 \\ -7 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} -2 & 3 \\ 7 & -4 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 2 & -3 \\ -7 & 4 \end{bmatrix}$",
          "explanation": r'''สลับทแยง: $4 \leftrightarrow 2$ / เปลี่ยนเครื่องหมายนอกทแยง: $3 \to -3$, $7 \to -7$''',
        }),
        ContentBlock("ainv_h_004", "header", {
          "title": r"สมบัติที่สำคัญที่สุด",
          "level": 2,
        }),
        ContentBlock("ainv_t_007", "text", {
          "content": [
            r'''แอดจอยซ์ถูกออกแบบมาให้มีสมบัติพิเศษนี้: $$A \cdot \text{adj}(A) = \text{adj}(A) \cdot A = \det(A) \cdot I$$''',
            r'''นี่คือเหตุผลว่าทำไมต้อง**ทรานสโพส** — ถ้าไม่ทรานสโพส สมบัตินี้จะไม่เป็นจริง!''',
          ],
        }),
        ContentBlock("ainv_t_008", "text", {
          "content": [
            r'''Note = สมบัตินี้เป็นรากฐานของทุกอย่างในบทนี้ — จำไว้ให้ดี เพราะเดี๋ยวจะเอาไปสร้างสูตรอินเวอร์ส 🔑''',
          ],
        }),
        ContentBlock("ainv_q_002", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 3 & 1 \\ 2 & 4 \end{bmatrix}$ จงหาผลรวมของสมาชิกทั้งหมดใน $A \cdot \text{adj}(A)$''',
          ],
          "options": ["10", "14", "20", "28"],
          "correct": "20",
          "explanation": r'''$\det A = 3(4) - 1(2) = 10$

$A \cdot \text{adj}(A) = 10I_2 = \begin{bmatrix} 10 & 0 \\ 0 & 10 \end{bmatrix}$

ผลรวม $= 10 + 0 + 0 + 10 = 20$

🧠 **ข้อสังเกต:** ไม่ต้องหา adj เลย! แค่หา det แล้วใช้สมบัติ $A \cdot \text{adj}(A) = \det(A) \cdot I$ ได้ทันที''',
        }),
        ContentBlock("ainv_h_005", "header", {
          "title": r"แอดจอยซ์ของเมทริกซ์ $3 \times 3$",
          "level": 2,
        }),
        ContentBlock("ainv_t_009", "text", {
          "content": [
            r'''สำหรับ $3 \times 3$ ไม่มีทางลัดเหมือน $2 \times 2$ ต้องหา Cofactor ทั้ง 9 ตัวแล้วทรานสโพส — แต่ถ้าโจทย์ถามแค่ตำแหน่งเดียว ก็**หาแค่ตำแหน่งนั้นพอ**''',
            r'''จำไว้ว่า: ตำแหน่ง $(i,j)$ ของ $\text{adj}(A)$ คือ $C_{ji}$ (subscript สลับกัน เพราะทรานสโพส)''',
          ],
        }),
        ContentBlock("ainv_ddq_002", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_002_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 2 & 0 & 1 \\ 0 & 3 & 0 \\ 4 & 0 & 5 \end{bmatrix}$

ถ้าต้องการหาตำแหน่ง $(1,3)$ ของ $\text{adj}(A)$ → subscript สลับเป็น $(3,1)$ ดังนั้นต้องหา ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$C_{13}$", r"$C_{31}$", r"$C_{33}$"],
              "correctAnswers": {"0": r"$C_{31}$"},
              "explanation": r'''ตำแหน่ง $(1,3)$ ของ adj = $C_{31}$ (subscript สลับ)''',
            },
            {
              "questionId": "ainv_ddq_002_s2",
              "content": [
                r'''$C_{31} = (-1)^{3+1} \begin{vmatrix} 0 & 1 \\ 3 & 0 \end{vmatrix} = (+1)(0 - 3) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3$", r"$3$", r"$-1$", r"$1$"],
              "correctAnswers": {"0": r"$-3$"},
              "explanation": r'''$C_{31} = -3$ ดังนั้นตำแหน่ง $(1,3)$ ของ $\text{adj}(A) = -3$''',
            },
          ],
        }),
        ContentBlock("ainv_q_003", "question_choice", {
          "content": [
            r'''3. ให้ $D = \begin{bmatrix} 2 & 0 \\ 0 & 5 \end{bmatrix}$ จงหา $\text{adj}(D)$''',
          ],
          "options": [
            r"$\begin{bmatrix} 5 & 0 \\ 0 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 0 \\ 0 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} -5 & 0 \\ 0 & -2 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 5 \\ 2 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 5 & 0 \\ 0 & 2 \end{bmatrix}$",
          "explanation": r'''ใช้ทางลัด: สลับทแยง $2 \leftrightarrow 5$, เปลี่ยนเครื่องหมายนอกทแยง $0 \to 0$

🧠 **ข้อสังเกต:** adj ของเมทริกซ์ทแยงมุมก็เป็นทแยงมุม — ค่าแต่ละช่องบนทแยงคือ "ผลคูณของค่าทแยงตัวอื่นๆ"''',
        }),
        // FI: adj 3×3 — ตำแหน่ง (1,2) ใช้ C_21
        // A = [[1,3,2],[0,5,1],[4,0,3]]
        // M_21: ตัดแถว2 หลัก1 → |3 2; 0 3| = 9-0 = 9
        // C_21 = (-1)^3 · 9 = -9
        ContentBlock("ainv_fi_001", "question_fill_in", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 1 & 3 & 2 \\ 0 & 5 & 1 \\ 4 & 0 & 3 \end{bmatrix}$ จงหาตำแหน่ง $(1,2)$ ของ $\text{adj}(A)$''',
            {"box": "0"},
          ],
          "correct": "-9",
          "explanation": r'''ตำแหน่ง $(1,2)$ ของ adj → subscript สลับ → ต้องหา $C_{21}$

$M_{21}$: ตัดแถว 2 หลัก 1 ออก → $\begin{vmatrix} 3 & 2 \\ 0 & 3 \end{vmatrix} = 9 - 0 = 9$

$C_{21} = (-1)^{2+1} \cdot 9 = -9$

ดังนั้นตำแหน่ง $(1,2)$ ของ $\text{adj}(A) = -9$''',
        }),
        ContentBlock("ainv_q_004", "question_choice", {
          "content": [
            r'''5. ให้ $A$ เป็นเมทริกซ์ $3 \times 3$ ที่ $\det A = 4$ จงหา $\det(\text{adj}(A))$''',
          ],
          "options": ["4", "8", "12", "16"],
          "correct": "16",
          "explanation": r'''จาก $A \cdot \text{adj}(A) = \det(A) \cdot I$ หา det ทั้งสองฝั่ง:

$\det(A) \cdot \det(\text{adj}(A)) = (\det A)^3$

$4 \cdot \det(\text{adj}(A)) = 64$

$\det(\text{adj}(A)) = 16 = (\det A)^{n-1}$

🧠 **ข้อสังเกต:** $\det(\text{adj}(A)) = (\det A)^{n-1}$ เสมอ สำหรับ $n \times n$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 2: อินเวอร์สของเมทริกซ์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"อินเวอร์สของเมทริกซ์",
      blocks: [
        ContentBlock("ainv_h_006", "header", {
          "title": r"อินเวอร์สการบวก",
          "level": 2,
        }),
        ContentBlock("ainv_t_010", "text", {
          "content": [
            r'''**อินเวอร์สการบวก** ของ $A$ ก็คือ $-A$ ง่ายๆ เลย: $A + (-A) = 0$''',
            r'''เหมือนตัวเลข: $5 + (-5) = 0$ → บวกกันแล้วได้เมทริกซ์ศูนย์''',
          ],
        }),
        ContentBlock("ainv_h_007", "header", {
          "title": r"อินเวอร์สการคูณ",
          "level": 2,
        }),
        ContentBlock("ainv_t_011", "text", {
          "content": [
            r'''**อินเวอร์สการคูณ** ของ $A$ เขียนแทนด้วย $A^{-1}$ คือเมทริกซ์ที่: $$A \cdot A^{-1} = A^{-1} \cdot A = I$$''',
            r'''เหมือนตัวเลข: $5 \times \frac{1}{5} = 1$ → คูณกันแล้วได้เมทริกซ์เอกลักษณ์''',
          ],
        }),
        ContentBlock("ainv_t_012", "text", {
          "content": [
            r'''แต่ไม่ใช่ทุกเมทริกซ์จะมีอินเวอร์สการคูณ! ต้องเป็น**เมทริกซ์จัตุรัส**ที่ $\det A \neq 0$ เท่านั้น''',
            r'''ถ้า $\det A = 0$ เรียกว่า **เมทริกซ์เอกฐาน** (Singular Matrix) → ไม่มีอินเวอร์สการคูณ ❌''',
          ],
        }),
        ContentBlock("ainv_h_008", "header", {
          "title": r"สูตรหาอินเวอร์ส",
          "level": 2,
        }),
        ContentBlock("ainv_t_013", "text", {
          "content": [
            r'''จากสมบัติของแอดจอยซ์: $A \cdot \text{adj}(A) = \det(A) \cdot I$''',
            r'''ลองหารทั้งสองฝั่งด้วย $\det(A)$: $A \cdot \dfrac{\text{adj}(A)}{\det(A)} = I$''',
          ],
        }),
        ContentBlock("ainv_t_014", "text", {
          "content": [
            r'''$\dfrac{\text{adj}(A)}{\det(A)}$ คูณกับ $A$ แล้วได้ $I$ → มันก็คือ $A^{-1}$ นั่นเอง! $$\boxed{A^{-1} = \dfrac{1}{\det A} \cdot \text{adj}(A)}$$''',
            r'''Note = สูตรนี้มาจากสมบัติ $A \cdot \text{adj}(A) = \det(A) \cdot I$ โดยตรง — ไม่ใช่สูตรท่องจำ แต่เป็นผลลัพธ์ที่สมเหตุสมผล 💡''',
          ],
        }),
        ContentBlock("ainv_ddq_003", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_003_s1",
              "content": [
                r'''ถ้า $\det A = 0$ แล้วแทนลงในสูตร $A^{-1} = \dfrac{1}{\det A} \cdot \text{adj}(A)$ จะเกิดปัญหาอะไร? ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"หารด้วย 0 ไม่ได้", r"adj(A) เป็นศูนย์", r"ไม่มีปัญหา"],
              "correctAnswers": {"0": r"หารด้วย 0 ไม่ได้"},
              "explanation": r'''$\frac{1}{0}$ ไม่นิยาม → ไม่สามารถหา $A^{-1}$ ได้ ❌''',
            },
          ],
        }),
        ContentBlock("ainv_q_005", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 2 & 4 \\ 1 & 2 \end{bmatrix}$ เมทริกซ์ $A$ มีอินเวอร์สการคูณหรือไม่?''',
          ],
          "options": [r"มี", r"ไม่มี"],
          "correct": r"ไม่มี",
          "explanation": r'''$\det A = 2(2) - 4(1) = 0$ → เป็นเมทริกซ์เอกฐาน ไม่มีอินเวอร์ส ❌''',
        }),
        ContentBlock("ainv_ddq_004", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_004_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 2 & 1 \\ 5 & 3 \end{bmatrix}$

$\det A = 2(3) - 1(5) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$1$", r"$-1$", r"$11$"],
              "correctAnswers": {"0": r"$1$"},
              "explanation": r'''$\det A = 6 - 5 = 1$ → มีอินเวอร์ส ✅''',
            },
            {
              "questionId": "ainv_ddq_004_s2",
              "content": [
                r'''$\text{adj}(A) = \begin{bmatrix} 3 & -1 \\ -5 & 2 \end{bmatrix}$ (สลับทแยง เปลี่ยนเครื่องหมายนอกทแยง)

$A^{-1} = \dfrac{1}{1} \begin{bmatrix} 3 & -1 \\ -5 & 2 \end{bmatrix}$

ดังนั้น $a^{-1}_{11} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2$", r"$3$", r"$-1$", r"$-5$"],
              "correctAnswers": {"0": r"$3$"},
              "explanation": r'''$A^{-1} = \begin{bmatrix} 3 & -1 \\ -5 & 2 \end{bmatrix}$ ดังนั้น $a^{-1}_{11} = 3$''',
            },
          ],
        }),
        ContentBlock("ainv_q_006", "question_choice", {
          "content": [
            r'''2. จงหา $A^{-1}$ เมื่อ $A = \begin{bmatrix} 4 & 3 \\ 5 & 4 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 4 & -3 \\ -5 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} -4 & 3 \\ 5 & -4 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & 3 \\ 5 & 4 \end{bmatrix}$",
            r"ไม่มีอินเวอร์ส",
          ],
          "correct": r"$\begin{bmatrix} 4 & -3 \\ -5 & 4 \end{bmatrix}$",
          "explanation": r'''$\det A = 16 - 15 = 1$

$A^{-1} = \frac{1}{1} \begin{bmatrix} 4 & -3 \\ -5 & 4 \end{bmatrix} = \begin{bmatrix} 4 & -3 \\ -5 & 4 \end{bmatrix}$''',
        }),
        ContentBlock("ainv_q_007", "question_choice", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} k & 2 \\ 3 & k \end{bmatrix}$ จงหาค่า $k$ ที่เป็นจำนวนเต็มบวกซึ่งทำให้ $A$ **ไม่มี**อินเวอร์ส''',
          ],
          "options": [r"ไม่มี $k$ ที่เป็นจำนวนเต็มบวก", r"$1$", r"$2$", r"$3$"],
          "correct": r"ไม่มี $k$ ที่เป็นจำนวนเต็มบวก",
          "explanation": r'''ไม่มีอินเวอร์สเมื่อ $\det A = 0$: $k^2 - 6 = 0 \to k = \pm\sqrt{6} \approx \pm 2.449$

ไม่มีค่าใดที่เป็นจำนวนเต็ม!''',
        }),
        ContentBlock("ainv_fi_002", "question_fill_in", {
          "content": [
            r'''4. ให้ $A = \begin{bmatrix} 3 & 1 \\ 2 & 1 \end{bmatrix}$ จงหา $a^{-1}_{21}$''',
            {"box": "0"},
          ],
          "correct": "-2",
          "explanation": r'''$\det A = 3 - 2 = 1$

$A^{-1} = \begin{bmatrix} 1 & -1 \\ -2 & 3 \end{bmatrix}$ ดังนั้น $a^{-1}_{21} = -2$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 3: ฝึกหาอินเวอร์ส
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"ฝึกหาอินเวอร์ส",
      blocks: [
        ContentBlock("ainv_t_015", "text", {
          "content": [
            r'''มาฝึกหาอินเวอร์สให้คล่อง ทั้ง $2 \times 2$ ที่ det ไม่เท่ากับ 1 และ $3 \times 3$ ที่ต้องหาเฉพาะตำแหน่ง 💪''',
          ],
        }),
        ContentBlock("ainv_q_008", "question_choice", {
          "content": [
            r'''1. จงหา $A^{-1}$ เมื่อ $A = \begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$''',
          ],
          "options": [
            r"$\begin{bmatrix} -2 & 1 \\ \frac{3}{2} & -\frac{1}{2} \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & -2 \\ -3 & 1 \end{bmatrix}$",
            r"$\begin{bmatrix} -2 & 1 \\ 3 & -1 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & -1 \\ -\frac{3}{2} & \frac{1}{2} \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} -2 & 1 \\ \frac{3}{2} & -\frac{1}{2} \end{bmatrix}$",
          "explanation": r'''$\det A = 4 - 6 = -2$

$A^{-1} = \frac{1}{-2} \begin{bmatrix} 4 & -2 \\ -3 & 1 \end{bmatrix} = \begin{bmatrix} -2 & 1 \\ \frac{3}{2} & -\frac{1}{2} \end{bmatrix}$''',
        }),
        ContentBlock("ainv_q_009", "question_choice", {
          "content": [
            r'''2. ให้ $A = \begin{bmatrix} 1 & 2 \\ 3 & 7 \end{bmatrix}$ จงหาตำแหน่ง $(1,2)$ ของ $A \cdot A^{-1}$''',
          ],
          "options": [r"$0$", r"$1$", r"$2$", r"ข้อมูลไม่เพียงพอ"],
          "correct": r"$0$",
          "explanation": r'''$A \cdot A^{-1} = I$ เสมอ

ตำแหน่ง $(1,2)$ ของ $I$ คือ $0$ (นอกเส้นทแยง)

🧠 **ข้อสังเกต:** ไม่ต้องหา $A^{-1}$ เลย! แค่รู้ว่า $AA^{-1} = I$ ก็ตอบได้ทันที''',
        }),
        ContentBlock("ainv_h_009", "header", {
          "title": r"อินเวอร์สของ $3 \times 3$",
          "level": 2,
        }),
        ContentBlock("ainv_t_016", "text", {
          "content": [
            r'''สำหรับ $3 \times 3$ ใช้สูตรเดียวกัน แค่งานมากขึ้น แต่ถ้าโจทย์ถามแค่ตำแหน่งเดียว: $a^{-1}_{ij} = \dfrac{C_{ji}}{\det A}$ → หาแค่ Cofactor ตัวเดียวก็พอ''',
          ],
        }),
        ContentBlock("ainv_ddq_005", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_005_s1",
              "content": [
                r'''ให้ $A = \begin{bmatrix} 1 & 0 & 2 \\ 0 & 3 & 0 \\ 1 & 0 & 1 \end{bmatrix}$

หา $\det A$: expand ตามแถว 2 (มี 0 สองตัว)

$\det A = 3 \cdot (+1) \begin{vmatrix} 1 & 2 \\ 1 & 1 \end{vmatrix} = 3(1-2) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3$", r"$3$", r"$-1$", r"$1$"],
              "correctAnswers": {"0": r"$-3$"},
              "explanation": r'''$\det A = 3(-1) = -3$ → มีอินเวอร์ส ✅''',
            },
            {
              "questionId": "ainv_ddq_005_s2",
              "content": [
                r'''ถ้าต้องการหา $a^{-1}_{13}$ → ต้องหา $C_{31}$ (subscript สลับ)

$C_{31} = (+1) \begin{vmatrix} 0 & 2 \\ 3 & 0 \end{vmatrix} = 0-6 = -6$

$a^{-1}_{13} = \dfrac{-6}{-3} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-2$", r"$2$", r"$\frac{1}{2}$", r"$6$"],
              "correctAnswers": {"0": r"$2$"},
              "explanation": r'''$a^{-1}_{13} = 2$ ✅ คิดเฉพาะตำแหน่งที่ต้องการ ไม่ต้องหา adj ทั้งหมด!''',
            },
          ],
        }),
        // FI: 3×3 สามเหลี่ยม
        // A = [[1,1,0],[0,1,0],[0,0,1]], det=1
        // a^{-1}_{12} = C_{21}/det = C_{21}
        // M_{21}: ตัดแถว2 หลัก1 → |1 0; 0 1| = 1
        // C_{21} = (-1)^3 · 1 = -1
        ContentBlock("ainv_fi_003", "question_fill_in", {
          "content": [
            r'''3. ให้ $A = \begin{bmatrix} 1 & 1 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$ จงหา $a^{-1}_{12}$''',
            {"box": "0"},
          ],
          "correct": "-1",
          "explanation": r'''เมทริกซ์สามเหลี่ยมบน: $\det A = 1 \times 1 \times 1 = 1$

$a^{-1}_{12} = \frac{C_{21}}{\det A} = C_{21}$

$M_{21}$: ตัดแถว 2 หลัก 1 → $\begin{vmatrix} 1 & 0 \\ 0 & 1 \end{vmatrix} = 1$

$C_{21} = (-1)^{2+1} \cdot 1 = -1$

🧠 **ข้อสังเกต:** อินเวอร์สของเมทริกซ์สามเหลี่ยมบนก็ยังเป็นสามเหลี่ยมบน!''',
        }),
        ContentBlock("ainv_q_010", "question_choice", {
          "content": [
            r'''4. จงหา $(5I_2)^{-1}$''',
          ],
          "options": [
            r"$5I_2$",
            r"$\frac{1}{5}I_2$",
            r"$-5I_2$",
            r"$I_2$",
          ],
          "correct": r"$\frac{1}{5}I_2$",
          "explanation": r'''$5I \cdot \frac{1}{5}I = \frac{5}{5} I^2 = I$ ✅

หรือจะใช้ $(kA)^{-1} = \frac{1}{k}A^{-1}$ ก็ได้: $(5I)^{-1} = \frac{1}{5}I^{-1} = \frac{1}{5}I$''',
        }),
        ContentBlock("ainv_q_011", "question_choice", {
          "content": [
            r'''5. ให้ $A = \begin{bmatrix} 2 & 1 \\ 5 & 3 \end{bmatrix}$ และ $B = \begin{bmatrix} 3 \\ 7 \end{bmatrix}$ จงหาผลรวมของสมาชิกทั้งหมดใน $A^{-1} B$''',
          ],
          "options": ["1", "2", "3", "10"],
          "correct": "1",
          "explanation": r'''$\det A = 6-5 = 1$ → $A^{-1} = \begin{bmatrix} 3 & -1 \\ -5 & 2 \end{bmatrix}$

$A^{-1}B = \begin{bmatrix} 9-7 \\ -15+14 \end{bmatrix} = \begin{bmatrix} 2 \\ -1 \end{bmatrix}$

ผลรวม $= 2 + (-1) = 1$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 4: สมบัติของอินเวอร์ส
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สมบัติของอินเวอร์ส",
      blocks: [
        ContentBlock("ainv_t_017", "text", {
          "content": [
            r'''อินเวอร์สมีสมบัติหลายตัวที่ช่วยลดงานได้มาก — บางข้อไม่ต้องหา $A^{-1}$ จริงๆ ก็ตอบได้ 🔑''',
          ],
        }),
        ContentBlock("ainv_t_018", "text", {
          "content": [
            r'''$(A^{-1})^{-1} = A$ — อินเวอร์สของอินเวอร์สก็คือตัวเดิม''',
            r'''$(AB)^{-1} = B^{-1} A^{-1}$ — **ลำดับสลับกัน** เหมือนทรานสโพสของผลคูณ!''',
          ],
        }),
        ContentBlock("ainv_t_019", "text", {
          "content": [
            r'''$(A^t)^{-1} = (A^{-1})^t$ — จะทรานสโพสก่อนหรืออินเวอร์สก่อนก็ได้ ผลเหมือนกัน''',
            r'''$\det(A^{-1}) = \dfrac{1}{\det A}$ — Det ของอินเวอร์สคือส่วนกลับ''',
          ],
        }),
        ContentBlock("ainv_t_020", "text", {
          "content": [
            r'''$(kA)^{-1} = \dfrac{1}{k} A^{-1}$ — ค่าคงที่ดึงออกมาเป็นส่วนกลับ''',
            r'''Note = $(AB)^{-1} = B^{-1}A^{-1}$ ลำดับกลับเหมือน $(AB)^t = B^t A^t$ เลย — เป็นรูปแบบเดียวกัน 🧦👟''',
          ],
        }),
        ContentBlock("ainv_ddq_006", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ainv_ddq_006_s1",
              "content": [
                r'''$(ABC)^{-1}$ เท่ากับ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$A^{-1}B^{-1}C^{-1}$", r"$C^{-1}B^{-1}A^{-1}$", r"$C^{-1}A^{-1}B^{-1}$"],
              "correctAnswers": {"0": r"$C^{-1}B^{-1}A^{-1}$"},
              "explanation": r'''กลับลำดับทั้งหมด → $C^{-1}B^{-1}A^{-1}$''',
            },
            {
              "questionId": "ainv_ddq_006_s2",
              "content": [
                r'''ให้ $\det A = 2$ (ขนาด $3 \times 3$) แล้ว $\det(A^{-1}) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2$", r"$\frac{1}{2}$", r"$-2$", r"$\frac{1}{8}$"],
              "correctAnswers": {"0": r"$\frac{1}{2}$"},
              "explanation": r'''$\det(A^{-1}) = \frac{1}{\det A} = \frac{1}{2}$''',
            },
          ],
        }),
        ContentBlock("ainv_q_012", "question_choice", {
          "content": [
            r'''1. ให้ $A$ ขนาด $3 \times 3$ ที่ $\det A = 5$ จงหา $\det(2A^{-1})$''',
          ],
          "options": [r"$\frac{2}{5}$", r"$\frac{8}{5}$", r"$\frac{10}{5}$", r"$\frac{40}{5}$"],
          "correct": r"$\frac{8}{5}$",
          "explanation": r'''$\det(2A^{-1}) = 2^3 \cdot \det(A^{-1}) = 8 \cdot \frac{1}{5} = \frac{8}{5}$''',
        }),
        ContentBlock("ainv_q_013", "question_choice", {
          "content": [
            r'''2. ให้ $A^{-1} = \begin{bmatrix} 2 & 1 \\ 3 & 4 \end{bmatrix}$ จงหา $(A^t)^{-1}$''',
          ],
          "options": [
            r"$\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$",
            r"$\begin{bmatrix} 4 & -1 \\ -3 & 2 \end{bmatrix}$",
            r"$\begin{bmatrix} 2 & 1 \\ 3 & 4 \end{bmatrix}$",
            r"ข้อมูลไม่เพียงพอ",
          ],
          "correct": r"$\begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$",
          "explanation": r'''$(A^t)^{-1} = (A^{-1})^t = \begin{bmatrix} 2 & 3 \\ 1 & 4 \end{bmatrix}$

🧠 **ข้อสังเกต:** ไม่ต้องหา $A$ เลย ใช้สมบัติตรงๆ!''',
        }),
        ContentBlock("ainv_q_014", "question_choice", {
          "content": [
            r'''3. ให้ $(AB)^{-1} = \begin{bmatrix} 1 & 2 \\ 0 & 3 \end{bmatrix}$ และ $B = \begin{bmatrix} 1 & 0 \\ 1 & 1 \end{bmatrix}$ จงหา $a^{-1}_{22}$''',
          ],
          "options": ["3", "4", "5", "6"],
          "correct": "5",
          "explanation": r'''$(AB)^{-1} = B^{-1}A^{-1}$ → $A^{-1} = B \cdot (AB)^{-1}$

$A^{-1} = \begin{bmatrix} 1 & 0 \\ 1 & 1 \end{bmatrix} \begin{bmatrix} 1 & 2 \\ 0 & 3 \end{bmatrix} = \begin{bmatrix} 1 & 2 \\ 1 & 5 \end{bmatrix}$

$a^{-1}_{22} = 5$''',
        }),
        ContentBlock("ainv_q_015", "question_choice", {
          "content": [
            r'''4. ให้ $A^{-1} = \begin{bmatrix} 5 & 2 \\ 3 & 1 \end{bmatrix}$ จงหา $a_{11}$''',
          ],
          "options": [r"$-1$", r"$1$", r"$-5$", r"$5$"],
          "correct": r"$-1$",
          "explanation": r'''$A = (A^{-1})^{-1}$

$\det(A^{-1}) = 5-6 = -1$

$A = \frac{1}{-1} \begin{bmatrix} 1 & -2 \\ -3 & 5 \end{bmatrix} = \begin{bmatrix} -1 & 2 \\ 3 & -5 \end{bmatrix}$

$a_{11} = -1$''',
        }),
        ContentBlock("ainv_fi_004", "question_fill_in", {
          "content": [
            r'''5. ให้ $A$ เป็นเมทริกซ์ $2 \times 2$ ที่ $\det A = 3$ จงหา $\det(A^{-1} \cdot A^t)$''',
            {"box": "0"},
          ],
          "correct": "1",
          "explanation": r'''$\det(A^{-1} \cdot A^t) = \det(A^{-1}) \cdot \det(A^t) = \frac{1}{3} \cdot 3 = 1$

🧠 **ข้อสังเกต:** ไม่ว่า $\det A$ จะเป็นเท่าไหร่ ผลลัพธ์เป็น 1 เสมอ!''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 5: โจทย์ประยุกต์
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"โจทย์ประยุกต์",
      blocks: [
        ContentBlock("ainv_t_021", "text", {
          "content": [
            r'''ถึงเวลาเอาทุกเรื่องมาใช้ร่วมกัน 🔥''',
          ],
        }),
        ContentBlock("ainv_h_010", "header", {
          "title": r"แก้สมการเมทริกซ์ด้วยอินเวอร์ส",
          "level": 2,
        }),
        ContentBlock("ainv_t_022", "text", {
          "content": [
            r'''$AX = B$ → คูณ $A^{-1}$ ทาง**ซ้าย** → $X = A^{-1}B$''',
            r'''$XA = B$ → คูณ $A^{-1}$ ทาง**ขวา** → $X = BA^{-1}$''',
          ],
        }),
        ContentBlock("ainv_t_023", "text", {
          "content": [
            r'''Note = **ระวังลำดับ!** ลำดับการคูณเมทริกซ์สลับที่ไม่ได้ $A^{-1}$ ต้องอยู่ฝั่งเดียวกับ $A$ ถึงจะหักล้างเป็น $I$ ได้''',
          ],
        }),
        // Q1: AX = B
        // A = [[2,1],[5,3]], det=1, A⁻¹ = [[3,-1],[-5,2]]
        // X = A⁻¹[[3],[7]] = [[9-7],[-15+14]] = [[2],[-1]]
        // x1+x2 = 1
        ContentBlock("ainv_q_016", "question_choice", {
          "content": [
            r'''1. ให้ $A = \begin{bmatrix} 2 & 1 \\ 5 & 3 \end{bmatrix}$ และ $AX = \begin{bmatrix} 3 \\ 7 \end{bmatrix}$ จงหา $x_1 + x_2$''',
          ],
          "options": ["0", "1", "2", "3"],
          "correct": "1",
          "explanation": r'''$\det A = 1$ → $A^{-1} = \begin{bmatrix} 3 & -1 \\ -5 & 2 \end{bmatrix}$

$X = A^{-1}B = \begin{bmatrix} 9-7 \\ -15+14 \end{bmatrix} = \begin{bmatrix} 2 \\ -1 \end{bmatrix}$

$x_1 + x_2 = 2 + (-1) = 1$''',
        }),
        // Q2: XA = B
        // A = [[1,2],[1,3]], det=1, A⁻¹ = [[3,-2],[-1,1]]
        // X = BA⁻¹ = [[5,8],[1,3]][[3,-2],[-1,1]]
        // x11 = 5(3)+8(-1) = 15-8 = 7
        ContentBlock("ainv_q_017", "question_choice", {
          "content": [
            r'''2. ให้ $XA = \begin{bmatrix} 5 & 8 \\ 1 & 3 \end{bmatrix}$ โดย $A = \begin{bmatrix} 1 & 2 \\ 1 & 3 \end{bmatrix}$ จงหา $x_{11}$''',
          ],
          "options": ["3", "5", "7", "15"],
          "correct": "7",
          "explanation": r'''$X = B \cdot A^{-1}$ (คูณทาง**ขวา**)

$\det A = 1$ → $A^{-1} = \begin{bmatrix} 3 & -2 \\ -1 & 1 \end{bmatrix}$

$x_{11} = 5(3) + 8(-1) = 15 - 8 = 7$''',
        }),
        ContentBlock("ainv_h_011", "header", {
          "title": r"หาอินเวอร์สจากสมการเมทริกซ์",
          "level": 2,
        }),
        ContentBlock("ainv_t_024", "text", {
          "content": [
            r'''บางครั้งไม่ต้องใช้สูตร $\frac{1}{\det A} \text{adj}(A)$ เลย — แค่จัดรูปให้เป็น $A \cdot (\cdots) = I$ แล้ว "อะไรที่อยู่ข้างหลัง" ก็คือ $A^{-1}$''',
          ],
        }),
        // Q3: A²-5A+6I=0 → A(A-5I) = -6I → A⁻¹ = (5I-A)/6
        ContentBlock("ainv_q_018", "question_choice", {
          "content": [
            r'''3. ให้ $A^2 - 5A + 6I = 0$ ข้อใดเท่ากับ $A^{-1}$?''',
          ],
          "options": [
            r"$\frac{A - 5I}{6}$",
            r"$\frac{5I - A}{6}$",
            r"$\frac{A + 5I}{6}$",
            r"$5A - 6I$",
          ],
          "correct": r"$\frac{5I - A}{6}$",
          "explanation": r'''$A^2 - 5A = -6I$ → $A(A - 5I) = -6I$

$A \cdot \dfrac{-(A-5I)}{6} = I$ → $A^{-1} = \dfrac{5I - A}{6}$

🧠 **ข้อสังเกต:** แค่จัดรูปเป็น $A \cdot (\cdots) = I$ — ไม่มีขั้นตอนตายตัว''',
        }),
        ContentBlock("ainv_q_019", "question_choice", {
          "content": [
            r'''4. ให้ $A^2 = I$ จงหา $A^{-1}$''',
          ],
          "options": [r"$A$", r"$I$", r"$-A$", r"ข้อมูลไม่เพียงพอ"],
          "correct": r"$A$",
          "explanation": r'''$A \cdot A = I$ → $A^{-1} = A$

🧠 **ข้อสังเกต:** เมทริกซ์ที่ $A^2 = I$ เรียกว่า **involutory** — ตัวมันเองเป็นอินเวอร์สของตัวเอง!''',
        }),
        ContentBlock("ainv_h_012", "header", {
          "title": r"ผสมกับความรู้จากบทก่อน",
          "level": 2,
        }),
        // Q5: (A^100)⁻¹
        // A = [[1,2],[0,1]], A^100 = [[1,200],[0,1]]
        // (A^100)⁻¹ = [[1,-200],[0,1]], position (1,2) = -200
        ContentBlock("ainv_fi_005", "question_fill_in", {
          "content": [
            r'''5. ให้ $A = \begin{bmatrix} 1 & 2 \\ 0 & 1 \end{bmatrix}$ จงหาตำแหน่ง $(1,2)$ ของ $(A^{100})^{-1}$''',
            {"box": "0"},
          ],
          "correct": "-200",
          "explanation": r'''จากบทก่อน: $A = I + B$ โดย $B = \begin{bmatrix} 0 & 2 \\ 0 & 0 \end{bmatrix}$, $B^2 = 0$

$A^{100} = I + 100B = \begin{bmatrix} 1 & 200 \\ 0 & 1 \end{bmatrix}$

$(A^{100})^{-1}$: $\det = 1$, สลับทแยง เปลี่ยนเครื่องหมาย → $\begin{bmatrix} 1 & -200 \\ 0 & 1 \end{bmatrix}$

ตำแหน่ง $(1,2) = -200$

🧠 **ข้อสังเกต:** $\begin{bmatrix} 1 & c \\ 0 & 1 \end{bmatrix}^{-1} = \begin{bmatrix} 1 & -c \\ 0 & 1 \end{bmatrix}$ เสมอ!''',
        }),
        // Q6: adj(adj(A)) = A สำหรับ 2×2
        ContentBlock("ainv_q_020", "question_choice", {
          "content": [
            r'''6. ให้ $A = \begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix}$ จงหา $\text{adj}(\text{adj}(A))$''',
          ],
          "options": [
            r"$\begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix}$",
            r"$\begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$",
            r"$\begin{bmatrix} 13 & 0 \\ 0 & 13 \end{bmatrix}$",
            r"$\begin{bmatrix} 0 & 0 \\ 0 & 0 \end{bmatrix}$",
          ],
          "correct": r"$\begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix}$",
          "explanation": r'''$\text{adj}(A) = \begin{bmatrix} 5 & -1 \\ -2 & 3 \end{bmatrix}$

$\text{adj}(\text{adj}(A))$: สลับ $5 \leftrightarrow 3$, เปลี่ยนเครื่องหมาย $-1 \to 1$, $-2 \to 2$

$= \begin{bmatrix} 3 & 1 \\ 2 & 5 \end{bmatrix} = A$

🧠 **ข้อสังเกต:** สำหรับ $2 \times 2$: $\text{adj}(\text{adj}(A)) = A$ เสมอ!''',
        }),
        ContentBlock("ainv_q_021", "question_choice", {
          "content": [
            r'''7. ให้ $A$ เป็นเมทริกซ์สมมาตร ($A^t = A$) ที่มีอินเวอร์ส ข้อใดกล่าวถูกต้อง?''',
          ],
          "options": [
            r"$A^{-1}$ เป็นสมมาตรเสมอ",
            r"$A^{-1}$ ไม่เป็นสมมาตร",
            r"$A^{-1} = A$",
            r"ข้อมูลไม่เพียงพอ",
          ],
          "correct": r"$A^{-1}$ เป็นสมมาตรเสมอ",
          "explanation": r'''$(A^{-1})^t = (A^t)^{-1} = A^{-1}$ (เพราะ $A^t = A$)

ดังนั้น $A^{-1}$ เป็นสมมาตร!

🧠 **ข้อสังเกต:** อินเวอร์สของสมมาตรก็สมมาตร — ใช้ $(A^t)^{-1} = (A^{-1})^t$ พิสูจน์ได้''',
        }),
        // Q8: A²=3A-2I → A⁻¹ = (3I-A)/2 → p=-1/2, q=3/2, p+q=1
        ContentBlock("ainv_q_022", "question_choice", {
          "content": [
            r'''8. ให้ $A^2 = 3A - 2I$ ถ้าเขียน $A^{-1} = pA + qI$ จงหา $p + q$''',
          ],
          "options": [r"$\frac{1}{2}$", r"$1$", r"$\frac{3}{2}$", r"$2$"],
          "correct": r"$1$",
          "explanation": r'''$A(A - 3I) = -2I$ → $A^{-1} = \dfrac{3I - A}{2} = -\dfrac{1}{2}A + \dfrac{3}{2}I$

$p = -\dfrac{1}{2}$, $q = \dfrac{3}{2}$ → $p + q = 1$''',
        }),
      ],
    ),

    // ──────────────────────────────────────────────
    // Section 6: สรุป
    // ──────────────────────────────────────────────
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("ainv_sum_t_001", "text", {
          "content": [
            r'''🎯 **สิ่งที่ได้เรียน:**''',
            r'''**แอดจอยซ์** ($\text{adj}(A)$): โคแฟกเตอร์ทรานสโพส ตำแหน่ง $(i,j)$ คือ $C_{ji}$ | สมบัติ: $A \cdot \text{adj}(A) = \det(A) \cdot I$''',
            r'''**อินเวอร์สการบวก:** $-A$ | **อินเวอร์สการคูณ:** $A^{-1} = \frac{1}{\det A} \text{adj}(A)$ มีเมื่อ $\det A \neq 0$''',
          ],
        }),
        ContentBlock("ainv_sum_t_002", "text", {
          "content": [
            r'''**ทางลัด $2 \times 2$:** สลับทแยงหลัก เปลี่ยนเครื่องหมายนอกทแยง หารด้วย $\det$ | **ถามเฉพาะตำแหน่ง:** $a^{-1}_{ij} = \frac{C_{ji}}{\det A}$''',
            r'''**สมบัติ:** $(AB)^{-1} = B^{-1}A^{-1}$ / $(A^t)^{-1} = (A^{-1})^t$ / $\det(A^{-1}) = \frac{1}{\det A}$ / $(A^{-1})^{-1} = A$''',
          ],
        }),
        ContentBlock("ainv_sum_t_003", "text", {
          "content": [
            r'''**การประยุกต์:** $AX = B → X = A^{-1}B$ / $XA = B → X = BA^{-1}$ ระวังลำดับ!''',
            r'''Note = เทคนิคสำคัญ: ทุกอย่างมาจาก $A \cdot A^{-1} = I$ — จาก $A^2 = pA + qI$ ก็ดึง $A$ ออก จัดรูปเป็น $A \cdot (\cdots) = I$ ก็หา $A^{-1}$ ได้เลย''',
          ],
        }),
      ],
    ),
  ],
);

// =====================================================================
// GROUP 3: สมบัติและโจทย์เพิ่มเติม
// =====================================================================

// Lesson 8: สมบัติการบวกและคูณ
final matrixPropMultLesson = ContentLesson(
  title: "สมบัติการบวกและคูณ",
  sections: [
    ContentSection(
      headerL1: "สมบัติการคูณ",
      blocks: [
        ContentBlock("mat_propm_t1", "text", {
          "content": [
            r"**สมบัติ 1.** $AB$ ไม่จำเป็นต้องเท่ากับ $BA$",
            r"**สมบัติ 2.** $A(BC) = (AB)C$ (สมบัติการเปลี่ยนหมู่)",
            r"**สมบัติ 3.** $(A + B)C = AC + BC$ และ $(B + C)A = BA + CA$ (สมบัติการแจกแจง)",
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "ทบทวนสมบัติสำคัญ",
      blocks: [
        ContentBlock("mat_propm_t2", "text", {
          "content": [
            r"1. $A \cdot I = I \cdot A = A$",
            r"2. $A \cdot A^{-1} = A^{-1} \cdot A = I$",
          ]
        }),
      ],
    ),
  ],
);

// ─────────────────────────────────────────────────────────────────────────────
// Lesson 9: สมบัติการดำเนินการ
// ─────────────────────────────────────────────────────────────────────────────
final matrixPropOpsLesson = ContentLesson(
  title: "สมบัติการดำเนินการ",
  sections: [
    ContentSection(
      headerL1: "สมบัติทรานสโพส",
      blocks: [
        ContentBlock("mat_propo_t1", "text", {
          "content": [
            r"**สมบัติ 1.** $(AB)^t = B^t \cdot A^t$",
            r"**สมบัติ 2.** $(A^n)^t = (A^t)^n$",
            r"**สมบัติ 3.** $(kA)^t = k \cdot A^t$",
          ]
        }),
      ],
    ),
    ContentSection(
      headerL1: "สมบัติอินเวอร์สการคูณ",
      blocks: [
        ContentBlock("mat_propo_t2", "text", {
          "content": [
            r"**สมบัติ 1.** $(AB)^{-1} = B^{-1} \cdot A^{-1}$",
            r"**สมบัติ 2.** $(A^n)^{-1} = (A^{-1})^n$",
            r"**สมบัติ 3.** $(kA)^{-1} = \dfrac{1}{k} \cdot A^{-1}$",
          ]
        }),
      ],
    ),
  ],
);

// ─────────────────────────────────────────────────────────────────────────────
// Lesson 10: สมบัติการ det
// ─────────────────────────────────────────────────────────────────────────────
final matrixPropDetLesson = ContentLesson(
  title: "สมบัติการ det",
  sections: [
    ContentSection(
      headerL1: "สมบัติการ det",
      blocks: [
        ContentBlock("mat_propd_t1", "text", {
          "content": [
            r"**สมบัติ 1.** $\det(AB) = \det(A) \cdot \det(B)$",
            r"**สมบัติ 2.** $\det(A^{-1}) = \dfrac{1}{\det(A)}$",
            r"**สมบัติ 3.** $\det(A^t) = \det(A)$",
            r"**สมบัติ 4.** $\det(A^n) = (\det A)^n$",
            r"**สมบัติ 5.** $\det(kA) = k^n \cdot \det A$ โดย $n$ คือมิติของ $A_{n \times n}$",
            r"**สมบัติ 6.** $\det(\text{adj } A) = (\det A)^{n-1}$ โดย $n$ คือมิติของ $A_{n \times n}$",
          ]
        }),
      ],
    ),
  ],
);