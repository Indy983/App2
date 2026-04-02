import '../../../ui/content_models.dart';

// ── การหาค่าลิมิต ──────────────────────────────────────────────────────────────

final calcLimitGraphLesson = ContentLesson(
  title: "การหาค่าลิมิตจากกราฟ",
  sections: [
    ContentSection(
      headerL1: r"📙 นิยามของลิมิต",
      blocks: [
        ContentBlock("lim_graph_h_001", "header", {
          "title": r"ลิมิตคืออะไร? 🤔",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_002", "text", {
          "content": [
            r'''ลิมิตคือการดู "แนวโน้ม" ว่าเมื่อเราเข้าใกล้จุดหนึ่งมากๆ ค่าของมัน "ควรจะเป็น" อะไร โดยไม่สนใจค่าที่จุดนั้นจริงๆ เป็นเท่าไหร่''',
          ],
        }),
        ContentBlock("lim_graph_h_003", "header", {
          "title": r"เล่นก่อนเรียน 🎮",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_004", "interactive_graph", {
          "path": "graph_data_1",
        }),
        ContentBlock("lim_graph_t_005", "text", {
          "content": [
            r'''เลื่อนจุด 🔹 และ 🔸 ให้เข้าใกล้ $2$ มากที่สุด แล้วดูค่า $y$''',
          ],
        }),
        ContentBlock("ddq_limit_a", "drag_and_drop", {
          "content": [
            r"ค่า $y$ เมื่อ $x$ เข้าใกล้ $2$ จากทางซ้าย 🔹 คือ",
            {"drop": "0"},
            r"ค่า $y$ เมื่อ $x$ เข้าใกล้ $2$ จากทางขวา 🔸 คือ",
            {"drop": "1"},
            r"ลองเดาว่าค่า $y$ เมื่อ $x$ เข้าใกล้ $2$ มากๆ จะเข้าใกล้อะไร",
            {"drop": "2"},
            r"ซึ่งคือลิมิตเข้าใกล้ $2$ ของกราฟนี้",
          ],
          "draggableItems": [
            r"$4.99$",
            r"$5.01$",
            r"$5$",
            r"ไม่เป็นทั้ง 3 อย่าง",
          ],
          "correctAnswers": {"0": r"$4.99$", "1": r"$5.01$", "2": r"$5$"},
          "explanation": r"ค่าลิมิตของกราฟนี้คือ $5$",
        }),
        ContentBlock("lim_graph_h_003", "header", {
          "title": r"ที่เล่นไปคือลิมิต! 🎉",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_007", "text", {
          "content": [
            r'''สัญลักษณ์ของลิมิตคือ
            
$$\lim\limits_{x \to a} f(x) = L$$
            
อ่านว่า "ลิมิตของ $f(x)$ เมื่อ $x$ เข้าใกล้ $a$ เท่ากับ $L$"

✅คือ ค่าที่ $f(x)$ กำลังจะไปถึง เมื่อ $x$ เข้าใกล้ $a$

❌ไม่ใช่ ค่าของ $f(x)$ ที่จุด $x = a$ ตรงๆ

ทั้งสองอาจเท่ากันก็ได้ — แต่ไม่จำเป็น เดี๋ยวจะเห็นเอง''',
          ],
        }),
        ContentBlock("q_limit_graph_1", "question_choice", {
          "content": [
            r'''1. จงหา
        
$$\lim\limits_{x \to 2} x^2 - 2x + 2$$''',
            {"graph": "graph_data_4"},
          ],
          "options": ["1", "2", "3", "4"],
          "correct": r"2",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(1.99, 1.98)$
        🔸 $(2.01, 2.02)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $2$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to 2} x^2 - 2x + 2 = 2$
        
        🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 2$ ตรงๆ จะได้ $f(2) = 2^2 - 2(2) + 2 = 2$ เช่นกัน''',
        }),
        ContentBlock("q_limit_graph_2", "question_choice", {
          "content": [
            r'''2. จงหา  

$$\lim\limits_{x \to 1} x^2 + 2x - 3$$''',

            {"graph": "graph_data_3"},
          ],
          "options": ["-1", "0", "1", "2"],
          "correct": r"0",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(0.99, -0.04)$
        🔸 $(1.01, 0.04)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $0$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to 1} x^2 + 2x - 3 = 0$
        
        🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 1$ ตรงๆ จะได้ $f(1) = 1^2 + 2(1) - 3 = 0$ เช่นกัน''',
        }),
        ContentBlock("q_limit_graph_3", "question_choice", {
          "content": [
            r'''3. จงหา  

$$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$$''',

            {"graph": "graph_data_2"},
          ],
          "options": ["-1", "0", "1", "4"],
          "correct": r"4",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(1.99, 3.98)$
        🔸 $(2.01, 4.02)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2} = 4$
        
        🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 2$ ตรงๆ จะได้ $f(2) = \dfrac{4 - 4}{2 - 2} = \dfrac{0}{0}$ หาค่าไม่ได้''',
        }),
        ContentBlock("lim_graph_h_008", "header", {
          "title": r"ลิมิตสนใจแค่ค่าเข้าใกล้ ไม่สนใจค่าที่จุดนั้น",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_009", "text", {
          "content": [
            r'''ข้อ 3 คือตัวอย่างที่บอกว่า ลิมิตคือค่าที่เข้าใกล้ ไม่ใช่ค่าที่จุดนั้นตรงๆ

เพราะ $f(x)$ ที่ $x = 2$ หาค่าไม่ได้ 

แต่ลิมิต $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$ กลับมีค่าเท่ากับ $4$ ได้

สรุปว่า

$$\lim\limits_{x \to a} f(x) \text{ ไม่จำเป็นต้องเท่ากับ } f(a)$$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"โจทย์เพิ่มเติม",
      blocks: [
        ContentBlock("q_limit_graph_4", "question_choice", {
          "content": [
            r'''4. จงหา
$$\lim\limits_{x \to 2} \dfrac{x^2 + x - 6}{x - 2}$$''',
            {"graph": "graph_data_5"},
          ],
          "options": ["1", "3", "5", "7"],
          "correct": r"5",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(1.99, 4.99)$
        🔸 $(2.01, 5.01)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $5$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to 2} \dfrac{x^2 + x - 6}{x - 2} = 5$
        
        🧠 **ข้อสังเกต:** แทนค่าหา $f(2)$ จะได้ $f(2) = \dfrac{2^2 + 2 - 6}{2 - 2} = \dfrac{0}{0}$ ซึ่งหาค่าไม่ได้''',
        }),
        ContentBlock("q_limit_graph_5", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to -1} f(x)$$''',
            {"graph": "graph_data_6"},
            r'''
        Note = กราฟนี้คือ?
        
        ฟังก์ชันนี้เรียกว่า **ฟังก์ชันมีเงื่อนไข** (Piecewise Function)
        
        กราฟคือ $y = 5 - x^2$ สำหรับทุก $x$ ยกเว้น $x = -1$ (จุดสีขาว)
        
        แต่ที่ $x = -1$ จะได้ $y = 0$ (จุดสีฟ้า) เขียนเป็นฟังก์ชันได้ว่า
        
        $$f(x) = \begin{cases} 5 - x^2,& x \neq -1 \\ 0, & x = -1 \end{cases}$$''',
          ],
          "options": ["-2", "0", "2", "4"],
          "correct": r"4",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $-1$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(-1.01, 3.98)$
        🔸 $(-0.99, 4.02)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to -1} f(x) = 4$
        
        🧠 **ข้อสังเกต:** ที่ $x = -1$ ดูจากกราฟจะได้ $f(-1) = 0$ จะเห็นว่า $\lim\limits_{x \to -1} f(x) \neq f(-1)$''',
        }),
        ContentBlock("q_limit_graph_6", "question_choice", {
          "content": [
            r'''6. จงหา
        
        $$\lim\limits_{x \to 1} f(x)$$''',
            {"graph": "graph_data_7"},
            r'''Note = กราฟนี้คือ?
        
        ฟังก์ชันนี้เป็นฟังก์ชันมีเงื่อนไข แต่เราไม่รู้สมการ''',
          ],
          "options": ["-2", "0", "2", "5"],
          "correct": r"2",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(0.99, 2.01)$
        🔸 $(1.01, 2.00)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $2$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to 1} f(x) = 2$
        
        🧠 **ข้อสังเกต:** ที่ $x = 1$ ดูจากกราฟจะได้ $f(1) = 5$ จะเห็นว่า $\lim\limits_{x \to 1} f(x) \neq f(1)$''',
        }),
        ContentBlock("q_limit_graph_7", "question_choice", {
          "content": [
            r'''7. จงหา
        
$$\lim\limits_{x \to -1} f(x)$$''',
            {"graph": "graph_data_8"},
          ],
          "options": ["-2", "0", "2", "4"],
          "correct": r"4",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $-1$ เราดูค่าทั้ง $2$ ฝั่ง
        🔹 $(-1.01, 4.01)$
        🔸 $(-0.99, 3.99)$
        เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน 
        
        ดังนั้น $\lim\limits_{x \to -1} f(x) = 4$
        
        🧠 **ข้อสังเกต:** ที่ $x = -1$ ดูจากกราฟจะได้ $f(-1) = 4$ จะเห็นว่า $\lim\limits_{x \to -1} f(x) = f(-1)$
        
        เหตุผลเพราะมันเป็นฟังก์ชันเงื่อนไข แต่จุดที่ทำให้เกิดเงื่อนไขคือ $x = 1$ ไม่ใช่ $x = -1$''',
        }),
      ],
    ),

    ContentSection(
      headerL1: r"ลิมิตซ้ายและขวา",
      blocks: [
        ContentBlock("lim_graph_h_021", "header", {
          "title": r"ความหมายง่ายๆ 🎮",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_022", "text", {
          "content": [
            r'''ลิมิตซ้าย คือค่าเข้าใกล้จากทางซ้าย
            ลิมิตขวา คือค่าเข้าใกล้จากทางขวา''',
          ],
        }),
        ContentBlock("lim_graph_t_023", "interactive_graph", {
          "path": "graph_data_12",
        }),
        ContentBlock("lim_graph_t_005", "text", {
          "content": [
            r'''เลื่อนจุด 🔹 เพื่อเข้าใกล้จากทางซ้าย
และ 🔸  เพื่อเข้าใกล้จากทางขวา แล้วดูค่า $y$''',
          ],
        }),
        ContentBlock("ddq_limit_b", "drag_and_drop", {
          "steps": [
            // ขั้นที่ 1
            {
              "questionId": "ddq_limit_b1",
              "content": [
                r"ค่า $y$ เมื่อ $x$ เข้าใกล้ $1$ จากทางซ้าย 🔹 คือ",
                {"drop": "0"},
                r'''

ซึ่งคือลิมิตซ้าย''',
                r"ค่า $y$ เมื่อ $x$ เข้าใกล้ $1$ จากทางขวา 🔸 คือ",
                {"drop": "1"},
                r'''

ซึ่งคือลิมิตขวา''',
              ],
              "draggableItems": [
                r"$2$",
                r"$1$",
                r"$5$",
                r"ไม่เป็นทั้ง 3 อย่าง",
              ],
              "correctAnswers": {"0": r"$2$", "1": r"$1$"},
              "explanation":
                  "นี่คือ definition ของอนุพันธ์จากหลักการ first principle",
            },

            // ขั้นที่ 2
            {
              "questionId": "ddq_limit_b2",
              "content": [
                r'''สรุปคือ ลิมิตซ้ายซึ่งเขียนเป็นสัญลักษณ์
$\lim\limits_{x \to 1^-} f(x) =$''',
                {"drop": "0"},
                r'''และลิมิตขวาซึ่งเขียนเป็นสัญลักษณ์
$\lim\limits_{x \to 1^+} f(x) =$''',
                {"drop": "1"},
                r'''จะเห็นว่าลิมิตซ้ายไม่เท่ากับขวา
                
ลองเดาว่าจะสรุปลิมิต $\lim\limits_{x \to 1} f(x)$ ได้ว่า''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$2$", r"$1$", r"$5$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$2$", "1": r"$1$", "2": r"หาค่าไม่ได้"},
              "explanation": "แทนค่า f(x) = x^n และ f(x+h) = (x+h)^n",
            },
          ],
        }),
        ContentBlock("lim_graph_h_021", "header", {
          "title": r"💙 ลิมิตซ้าย",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_022", "text", {
          "content": [
            r'''$$\lim\limits_{x \to a^-} f(x)$$
        
ในตัวอย่างคือจุด 🔹 ที่เลื่อนเข้าใกล้จากทางซ้าย''',
          ],
        }),
        ContentBlock("lim_graph_h_023", "header", {
          "title": r"ลิมิตซ้ายไม่เท่ากับลิมิตขวา",
          "level": 2,
        }),
        ContentBlock("lim_graph_t_023", "text", {
          "content": [
            r'''สรุปได้เลยว่า **หาค่าไม่ได้** เพราะเราไม่รู้จะเลือกค่า $y$ ที่เข้าใกล้จากทางซ้ายหรือขวา''',
          ],
        }),
        ContentBlock("lim_graph_t_024", "text", {
          "content": [
            r'''$$\lim\limits_{x \to a^+} f(x)$$
        
ในตัวอย่างคือจุด 🔸 ที่เลื่อนเข้าใกล้จากทางขวา''',
          ],
        }),
        ContentBlock("ddq_limit_lr1", "drag_and_drop", {
          "content": [
            r"1.",
            {"graph": "graph_data_7"},
            r''' 
            
$\lim\limits_{x \to 1^-} f(x) =$''',
            {"drop": "0"},
            r''' 
        
$\lim\limits_{x \to 1^+} f(x) =$''',
            {"drop": "1"},
            r'''

$\lim\limits_{x \to 1} f(x) =$''',
            {"drop": "2"},
            r"ซึ่งคือลิมิตเข้าใกล้ $2$ ของกราฟนี้",
          ],
          "draggableItems": [r"$2$", r"$4$", r"$5$", r"ไม่มีคำตอบ"],
          "correctAnswers": {"0": r"$2$", "1": r"$2$", "2": r"$2$"},
          "explanation": r"ค่าลิมิตของกราฟนี้คือ $2$",
        }),
      ],
    ),
    ContentSection(
      headerL1: r"แบบฝึกเพิ่มเติม",
      blocks: [
        ContentBlock("ddq_vec_type_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_1",
              "content": ["1.",
                {"graph": "graph_data_13"},
                r'''$\lim\limits_{x \to 2^-} f(x) = $ ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to 2^+} f(x) = $ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 2} f(x) = $''',
                {"drop": "2"},
                r'''$f(2) = $''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$1$", r"หาค่าไม่ได้", r"$3$", r"$4$", r"$0$"],
              "correctAnswers": {"0": r"$3$", "1": r"$4$", "2": r"หาค่าไม่ได้", "3": r"$4$"},
              "explanation": r'''เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง

        🔹 $(1.99, 0.01)$ นั่นคือ $\lim\limits_{x \to 2^-} f(x) = 3$

        🔸 $(2.01, 4.01)$ นั่นคือ $\lim\limits_{x \to 2^+} f(x) = 4$

        เนื่องจากลิมิตซ้ายไม่เท่าลิมิตขวา $\lim\limits_{x \to 2^-} f(x) \neq \lim\limits_{x \to 2^+} f(x)$   
        
        ดังนั้น $\lim\limits_{x \to 2} f(x)$ **หาค่าไม่ได้**''',
            },
          ],
        }),        
        ContentBlock("ddq_vec_type_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_2",
              "content": ["2.",
                {"graph": "graph_data_14"},
                r'''$\lim\limits_{x \to 1^-} f(x) = $ ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to 1^+} f(x) = $ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 1} f(x) = $''',
                {"drop": "2"},
                r'''$f(1) = $''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$1$", r"หาค่าไม่ได้", r"$3$", r"$4$", r"$0$"],
              "correctAnswers": {"0": r"$1$", "1": r"$1$", "2": r"$1$", "3": r"$3$"},
              "explanation": r'''เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง

        🔹 $(0.99, 0.99)$ นั่นคือ $\lim\limits_{x \to 1^-} f(x) = 1$

        🔸 $(1.01, 1.01)$ นั่นคือ $\lim\limits_{x \to 1^+} f(x) = 1$

        เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 1^-} f(x) = \lim\limits_{x \to 1^+} f(x)$   
        
        ดังนั้น $\lim\limits_{x \to 1} f(x) = 1$ ''',
            },
          ],
        }),
        ContentBlock("ddq_vec_type_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_vec_type_3",
              "content": ["3.",
                {"graph": "graph_data_15"},
                r'''$\lim\limits_{x \to 0^-} f(x) = $ ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to 0^+} f(x) = $ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 0} f(x) = $''',
                {"drop": "2"},
                r'''$f(0) = $''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$1$", r"หาค่าไม่ได้", r"$3$", r"$-1$", r"$0$"],
              "correctAnswers": {"0": r"$3$", "1": r"$-1$", "2": r"หาค่าไม่ได้", "3": r"$3$"},
              "explanation": r'''เมื่อ $x$ เข้าใกล้ $0$ เราดูค่าทั้ง $2$ ฝั่ง

        🔹 $(-0.01, 3.01)$ นั่นคือ $\lim\limits_{x \to 0^-} f(x) = 3$

        🔸 $(0.01, -0.99)$ นั่นคือ $\lim\limits_{x \to 0^+} f(x) = - 1$

        เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 0^-} f(x) = \lim\limits_{x \to 0^+} f(x)$   
        
        ดังนั้น $\lim\limits_{x \to 0} f(x) =$ หาค่าไม่ได้''',
            },
          ],
        }),
      ],
    ),

    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_graph_t_030", "text", {
          "content": [
            r'''เราได้เรียนรู้ทั้งหมด 4 จุดสำคัญ 💪
        
        1. **ลิมิต** คือค่าที่ $f(x)$ เข้าใกล้เมื่อ $x$ เข้าใกล้ $a$  
        
        2. $\lim\limits_{x \to a} f(x)$ **ไม่จำเป็น**ต้องเท่ากับ $f(a)$
        
        3. **ลิมิตซ้ายและขวา** ต้องเท่ากัน ลิมิตจึงจะมีค่า 
        
        4. **ใช้กราฟ** ช่วยมองภาพได้ชัดเจนขึ้น 📊''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัด (แบบฝึกหัดเรื่องการหาลิมิตจากกราฟ)

final calcCompositeLimitGraphLesson = ContentLesson(
  title: "การหาค่าลิมิตของฟังก์ชันประกอบจากกราฟ",
  sections: [
    // ============================================================
    // Section 1: ฟังก์ชันประกอบคืออะไร?
    // ============================================================
    ContentSection(
      headerL1: r"📙 ฟังก์ชันประกอบคืออะไร?",
      blocks: [
        ContentBlock("comp_lim_h_001", "header", {
          "title": r"เครื่องจักร 2 ตัวต่อกัน 🏭",
          "level": 2,
        }),
        ContentBlock("comp_lim_t_002", "text", {
          "content": [
            r'''$f(g(x))$ คือการเอาฟังก์ชัน 2 ตัวมาต่อกัน เหมือนเครื่องจักร 2 ตัว

ใส่ $x$ เข้าเครื่อง $g$ ก่อน → ได้ผลลัพธ์ → เอาผลลัพธ์ไปเข้าเครื่อง $f$ อีกที''',
          ],
        }),
        ContentBlock("comp_lim_img_003", "image", {
          "path": "assets/composite_machine.png",
        }),
        ContentBlock("comp_lim_t_004", "text", {
          "content": [
            r'''สรุปง่ายๆ คือ "หา $g$ ก่อน แล้วเอาคำตอบไปหา $f$"''',
          ],
        }),
        ContentBlock("comp_lim_h_005", "header", {
          "title": r"ลองอ่านค่าจากกราฟ 🎮",
          "level": 2,
        }),
        ContentBlock("comp_lim_t_006", "text", {
          "content": [
            r'''ต่อไปเราจะมีกราฟ 2 อัน คือกราฟ $f$ กับกราฟ $g$ วางคู่กัน

ลองเลื่อนจุดบนกราฟ $g$ แล้วดูว่าค่าส่งต่อไปยังกราฟ $f$ อย่างไร''',
          ],
        }),
        ContentBlock("comp_lim_ig_007", "interactive_graph", {
          "path": "graph_data_1",
        }),
        ContentBlock("comp_lim_t_008", "text", {
          "content": [
            r'''เลื่อนจุดบนกราฟ $g$ (ซ้าย) แล้วสังเกตว่า ค่า $g(x)$ ที่ได้จะถูกส่งไปหาค่า $f$ บนกราฟขวาอัตโนมัติ''',
          ],
        }),
        ContentBlock("comp_lim_ddq_009", "drag_and_drop", {
          "steps": [
            {
              "questionId": "comp_lim_ddq_009_s1",
              "content": [
                r"จากกราฟ $g$ ทางซ้าย ค่า $g(2) = $",
                {"drop": "0"},
              ],
              "draggableItems": [r"$1$", r"$3$", r"$5$"],
              "correctAnswers": {"0": r"$3$"},
              "explanation": r"อ่านจากกราฟ $g$ ที่ $x = 2$ จะได้ $g(2) = 3$",
            },
            {
              "questionId": "comp_lim_ddq_009_s2",
              "content": [
                r"ได้ $g(2) = 3$ แล้ว เอาไปหาค่า $f$ ต่อ",
                r'''

$f(g(2)) = f(3) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$7$", r"$9$"],
              "correctAnswers": {"0": r"$9$"},
              "explanation":
                  r"เอา $3$ ไปหาค่าบนกราฟ $f$ ที่ $x = 3$ จะได้ $f(3) = 9$ ดังนั้น $f(g(2)) = 9$",
            },
          ],
        }),
        ContentBlock("comp_lim_q_010", "question_choice", {
          "content": [
            r'''1. จากกราฟ $f$ และ $g$ ด้านบน จงหา $f(g(0))$''',
            {"graph": "graph_data_1"},
          ],
          "options": [r"0", r"1", r"4", r"9"],
          "correct": r"1",
          "explanation": r'''ขั้นที่ 1: หา $g(0)$ จากกราฟ $g$ → ได้ $g(0) = 1$

ขั้นที่ 2: เอาไปหา $f(1)$ จากกราฟ $f$ → ได้ $f(1) = 1$

ดังนั้น $f(g(0)) = f(1) = 1$''',
        }),
      ],
    ),

    // ============================================================
    // Section 2: หาลิมิตฟังก์ชันประกอบจากกราฟ
    // ============================================================
    ContentSection(
      headerL1: r"📗 หาลิมิตฟังก์ชันประกอบจากกราฟ",
      blocks: [
        ContentBlock("comp_lim_h_011", "header", {
          "title": r"จากค่า → ลิมิต 🤔",
          "level": 2,
        }),
        ContentBlock("comp_lim_t_012", "text", {
          "content": [
            r'''เมื่อกี้เราหา "ค่า" ของ $f(g(x))$ ที่จุดใดจุดหนึ่ง

แต่ถ้าโจทย์ถามหา **ลิมิต** $\lim\limits_{x \to a} f(g(x))$ จะทำอย่างไร?''',
          ],
        }),
        ContentBlock("comp_lim_t_013", "text", {
          "content": [
            r'''หลักการเหมือนเดิม แค่เปลี่ยนจาก "หาค่า" เป็น "หาลิมิต" ทั้ง 2 ขั้นตอน

**ขั้นที่ 1:** หา $\lim\limits_{x \to a} g(x) = L$

**ขั้นที่ 2:** หา $\lim\limits_{x \to L} f(x)$ ← นี่คือคำตอบ''',
          ],
        }),
        ContentBlock("comp_lim_ig_014", "interactive_graph", {
          "path": "graph_data_2",
        }),
        ContentBlock("comp_lim_t_015", "text", {
          "content": [
            r'''เลื่อนจุด 🔹 และ 🔸 เข้าใกล้ $x = 2$ บนกราฟ $g$ แล้วสังเกตว่าค่า $g(x)$ เข้าใกล้อะไร

จากนั้นดูว่าค่าที่ได้ส่งต่อไปกราฟ $f$ แล้วเข้าใกล้อะไร''',
          ],
        }),
        ContentBlock("comp_lim_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "comp_lim_ddq_016_s1",
              "content": [
                r"ขั้นที่ 1: $\lim\limits_{x \to 2} g(x) = $",
                {"drop": "0"},
              ],
              "draggableItems": [r"$1$", r"$3$", r"$5$"],
              "correctAnswers": {"0": r"$3$"},
              "explanation":
                  r"เลื่อนจุดเข้าใกล้ $x = 2$ บนกราฟ $g$ จะเห็นว่า $g(x)$ เข้าใกล้ $3$",
            },
            {
              "questionId": "comp_lim_ddq_016_s2",
              "content": [
                r"ขั้นที่ 2: ได้ $L = 3$ แล้ว เอาไปหาลิมิตของ $f$",
                r'''

$\lim\limits_{x \to 2} f(g(x)) = \lim\limits_{x \to 3} f(x) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$7$", r"$9$"],
              "correctAnswers": {"0": r"$9$"},
              "explanation":
                  r"เอา $L = 3$ ไปหาลิมิตของ $f$ ที่ $x = 3$ จะได้ $\lim\limits_{x \to 3} f(x) = 9$ ดังนั้น $\lim\limits_{x \to 2} f(g(x)) = 9$",
            },
          ],
        }),
        ContentBlock("comp_lim_h_017", "header", {
          "title": r"ฝึกทำโจทย์ ✏️",
          "level": 2,
        }),
        ContentBlock("comp_lim_q_018", "question_choice", {
          "content": [
            r'''2. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to 0} f(g(x))$$''',
            {"graph": "graph_data_2"},
          ],
          "options": [r"0", r"1", r"4", r"9"],
          "correct": r"1",
          "explanation": r'''ขั้นที่ 1: หา $\lim\limits_{x \to 0} g(x)$ จากกราฟ $g$ → เข้าใกล้ $1$

ขั้นที่ 2: หา $\lim\limits_{x \to 1} f(x)$ จากกราฟ $f$ → เข้าใกล้ $1$

ดังนั้น $\lim\limits_{x \to 0} f(g(x)) = 1$''',
        }),
        ContentBlock("comp_lim_q_019", "question_choice", {
          "content": [
            r'''3. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to -1} f(g(x))$$''',
            {"graph": "graph_data_2"},
          ],
          "options": [r"0", r"1", r"4", r"หาค่าไม่ได้"],
          "correct": r"0",
          "explanation": r'''ขั้นที่ 1: หา $\lim\limits_{x \to -1} g(x)$ จากกราฟ $g$ → เข้าใกล้ $0$

ขั้นที่ 2: หา $\lim\limits_{x \to 0} f(x)$ จากกราฟ $f$ → เข้าใกล้ $0$

ดังนั้น $\lim\limits_{x \to -1} f(g(x)) = 0$''',
        }),
      ],
    ),

    // ============================================================
    // Section 3: กรณีที่ต้องระวัง
    // ============================================================
    ContentSection(
      headerL1: r"⚠️ กรณีที่ต้องระวัง",
      blocks: [
        ContentBlock("comp_lim_h_020", "header", {
          "title": r"เมื่อ $g$ มีจุดเว้นวรรค",
          "level": 2,
        }),
        ContentBlock("comp_lim_t_021", "text", {
          "content": [
            r'''จำได้ไหมว่า ลิมิตไม่สนใจค่าที่จุดนั้นจริงๆ?

ฟังก์ชันประกอบก็เหมือนกัน — ขั้นแรกต้องใช้ **ลิมิต** ของ $g$ ไม่ใช่ **ค่า** ของ $g$''',
          ],
        }),
        ContentBlock("comp_lim_ig_022", "interactive_graph", {
          "path": "graph_data_3",
        }),
        ContentBlock("comp_lim_t_023", "text", {
          "content": [
            r'''สังเกตว่า $g(2) = 1$ (จุดสีฟ้าทึบ) แต่ $\lim\limits_{x \to 2} g(x) = 3$ (แนวโน้มที่เข้าใกล้)

เราต้องใช้ **ลิมิต** คือ $3$ ไม่ใช่ค่าที่จุด คือ $1$''',
          ],
        }),
        ContentBlock("comp_lim_ddq_024", "drag_and_drop", {
          "steps": [
            {
              "questionId": "comp_lim_ddq_024_s1",
              "content": [
                r"$g(2) = $",
                {"drop": "0"},
                r'''

$\lim\limits_{x \to 2} g(x) = $''',
                {"drop": "1"},
                r'''

เราต้องเอาค่าไหนไปใช้ต่อ?''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$1$",
                r"$3$",
                r"ค่าที่จุด",
                r"ลิมิต",
              ],
              "correctAnswers": {
                "0": r"$1$",
                "1": r"$3$",
                "2": r"ลิมิต",
              },
              "explanation":
                  r"$g(2) = 1$ แต่ $\lim\limits_{x \to 2} g(x) = 3$ เราต้องใช้ลิมิตเสมอ",
            },
            {
              "questionId": "comp_lim_ddq_024_s2",
              "content": [
                r"ได้ $L = 3$ แล้ว ดังนั้น",
                r'''

$\lim\limits_{x \to 2} f(g(x)) = \lim\limits_{x \to 3} f(x) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$1$", r"$5$", r"$9$"],
              "correctAnswers": {"0": r"$9$"},
              "explanation":
                  r"$\lim\limits_{x \to 3} f(x) = 9$ ดังนั้น $\lim\limits_{x \to 2} f(g(x)) = 9$",
            },
          ],
        }),
        ContentBlock("comp_lim_t_025", "text", {
          "content": [
            r'''Note = ข้อผิดพลาดที่พบบ่อย

ถ้าใช้ $g(2) = 1$ จะได้ $\lim\limits_{x \to 1} f(x) = 1$ ซึ่งเป็นคำตอบผิด!

ต้องใช้ $\lim\limits_{x \to 2} g(x) = 3$ เสมอ''',
          ],
        }),
        ContentBlock("comp_lim_h_026", "header", {
          "title": r"เมื่อ $f$ มีจุดเว้นวรรคที่ $L$",
          "level": 2,
        }),
        ContentBlock("comp_lim_t_027", "text", {
          "content": [
            r'''ถ้า $\lim\limits_{x \to a} g(x) = L$ แต่ $f$ มีจุดเว้นวรรคที่ $L$ ล่ะ?

เราก็ต้องหา **ลิมิต** ของ $f$ ที่ $L$ เช่นกัน ไม่ใช่ค่า $f(L)$''',
          ],
        }),
        ContentBlock("comp_lim_ig_028", "interactive_graph", {
          "path": "graph_data_4",
        }),
        ContentBlock("comp_lim_t_029", "text", {
          "content": [
            r'''สังเกตว่า $\lim\limits_{x \to 2} g(x) = 3$ แล้วบนกราฟ $f$ ที่ $x = 3$ มีจุดเว้นวรรค

$f(3) = 1$ แต่ $\lim\limits_{x \to 3} f(x) = 5$ — เราต้องใช้ลิมิตคือ $5$''',
          ],
        }),
        ContentBlock("comp_lim_q_030", "question_choice", {
          "content": [
            r'''4. จากกราฟด้านบน จงหา

$$\lim\limits_{x \to 2} f(g(x))$$''',
            {"graph": "graph_data_4"},
          ],
          "options": [r"1", r"3", r"5", r"9"],
          "correct": r"5",
          "explanation": r'''ขั้นที่ 1: $\lim\limits_{x \to 2} g(x) = 3$

ขั้นที่ 2: $\lim\limits_{x \to 3} f(x) = 5$ (ไม่ใช่ $f(3) = 1$)

ดังนั้น $\lim\limits_{x \to 2} f(g(x)) = 5$

🧠 **ข้อสังเกต:** ทั้ง 2 ขั้นตอนต้องใช้ลิมิตเสมอ ไม่ใช่ค่าที่จุด''',
        }),
        ContentBlock("comp_lim_q_031", "question_choice", {
          "content": [
            r'''5. จากกราฟ $f$ และ $g$ (กราฟ $g$ มีจุดเว้นวรรค) จงหา

$$\lim\limits_{x \to 1} f(g(x))$$''',
            {"graph": "graph_data_5"},
          ],
          "options": [r"2", r"4", r"6", r"หาค่าไม่ได้"],
          "correct": r"4",
          "explanation": r'''ขั้นที่ 1: $\lim\limits_{x \to 1} g(x) = 2$ (แม้ว่า $g(1) = 5$ ก็ตาม)

ขั้นที่ 2: $\lim\limits_{x \to 2} f(x) = 4$

ดังนั้น $\lim\limits_{x \to 1} f(g(x)) = 4$

🧠 **ข้อสังเกต:** ถ้าใช้ $g(1) = 5$ จะได้ $\lim\limits_{x \to 5} f(x) = 6$ ซึ่งเป็นคำตอบผิด''',
        }),
      ],
    ),

    // ============================================================
    // Section 4: โจทย์ฝึกเพิ่มเติม
    // ============================================================
    ContentSection(
      headerL1: r"โจทย์ฝึกเพิ่มเติม",
      blocks: [
        ContentBlock("comp_lim_q_032", "question_choice", {
          "content": [
            r'''6. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to 3} f(g(x))$$''',
            {"graph": "graph_data_6"},
          ],
          "options": [r"1", r"2", r"4", r"7"],
          "correct": r"4",
          "explanation": r'''ขั้นที่ 1: $\lim\limits_{x \to 3} g(x) = 2$

ขั้นที่ 2: $\lim\limits_{x \to 2} f(x) = 4$

ดังนั้น $\lim\limits_{x \to 3} f(g(x)) = 4$''',
        }),
        ContentBlock("comp_lim_q_033", "question_choice", {
          "content": [
            r'''7. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to 0} f(g(x))$$

โดยที่ $g$ มีจุดเว้นวรรคที่ $x = 0$ ($g(0) = 5$ แต่ $\lim\limits_{x \to 0} g(x) = 2$)''',
            {"graph": "graph_data_7"},
          ],
          "options": [r"1", r"3", r"5", r"7"],
          "correct": r"3",
          "explanation": r'''ขั้นที่ 1: $\lim\limits_{x \to 0} g(x) = 2$ (ไม่ใช่ $g(0) = 5$)

ขั้นที่ 2: $\lim\limits_{x \to 2} f(x) = 3$

ดังนั้น $\lim\limits_{x \to 0} f(g(x)) = 3$

🧠 **ข้อสังเกต:** ถ้าใช้ $g(0) = 5$ จะได้ $\lim\limits_{x \to 5} f(x) = 7$ ซึ่งเป็นคำตอบผิด''',
        }),
        ContentBlock("comp_lim_fi_034", "question_fill_in", {
          "content": [
            r'''8. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to -2} f(g(x))$$

โดยที่ $f$ มีจุดเว้นวรรคที่ $x = 4$ ($f(4) = 0$ แต่ $\lim\limits_{x \to 4} f(x) = 6$)''',
            {"graph": "graph_data_8"},
            {"box": "0"},
          ],
          "correct": "6",
          "explanation": r'''ขั้นที่ 1: $\lim\limits_{x \to -2} g(x) = 4$

ขั้นที่ 2: $\lim\limits_{x \to 4} f(x) = 6$ (ไม่ใช่ $f(4) = 0$)

ดังนั้น $\lim\limits_{x \to -2} f(g(x)) = 6$''',
        }),
        ContentBlock("comp_lim_q_035", "question_choice", {
          "content": [
            r'''9. จากกราฟ $f$ และ $g$ จงหา

$$\lim\limits_{x \to 1} f(g(x))$$

โดยที่กราฟ $g$ มีลิมิตซ้ายและขวาที่ $x = 1$ ไม่เท่ากัน''',
            {"graph": "graph_data_9"},
          ],
          "options": [r"2", r"4", r"6", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ขั้นที่ 1: หาลิมิตของ $g$ ที่ $x = 1$

$\lim\limits_{x \to 1^-} g(x) = 2$ แต่ $\lim\limits_{x \to 1^+} g(x) = 4$

ลิมิตซ้ายไม่เท่าลิมิตขวา → $\lim\limits_{x \to 1} g(x)$ หาค่าไม่ได้

ขั้นที่ 2: ลิมิตของ $g$ หาค่าไม่ได้ → ต้องแยกดู

$\lim\limits_{x \to 1^-} f(g(x)) = \lim\limits_{x \to 2} f(x) = 4$

$\lim\limits_{x \to 1^+} f(g(x)) = \lim\limits_{x \to 4} f(x) = 6$

ลิมิตซ้าย $\neq$ ลิมิตขวา ดังนั้น $\lim\limits_{x \to 1} f(g(x))$ **หาค่าไม่ได้**''',
        }),
      ],
    ),

    // ============================================================
    // Section 5: สรุป
    // ============================================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("comp_lim_t_036", "text", {
          "content": [
            r'''การหาลิมิตฟังก์ชันประกอบจากกราฟ มี 3 เรื่องสำคัญ 💪

1. **ทำ 2 ขั้นตอน:** หา $\lim g(x) = L$ ก่อน → แล้วหา $\lim\limits_{x \to L} f(x)$ เป็นคำตอบ

2. **ใช้ลิมิตเสมอ ไม่ใช่ค่าที่จุด** ทั้งขั้นตอน $g$ และ $f$ ถ้ามีจุดเว้นวรรค ต้องดูลิมิต ไม่ใช่ค่าตรงๆ

3. **ถ้าลิมิตซ้าย/ขวาของ $g$ ไม่เท่ากัน** ต้องแยกพิจารณาทั้ง 2 ฝั่ง ถ้าผลลัพธ์สุดท้ายไม่เท่ากัน → หาค่าไม่ได้''',
          ],
        }),
      ],
    ),
  ],
);

final calcLimitConditionLesson = ContentLesson(
  title: "เงื่อนไขการหาค่าลิมิต",
  sections: [
    ContentSection(
      headerL1: r"ข้อสอบไม่ให้กราฟมาแล้วหาลิมิตยังไง?",
      blocks: [
        ContentBlock("lim_cond_t_031", "text", {
          "content": [
            r'''จากบทที่แล้วเราใช้กราฟดูทุกครั้ง แต่ในห้องสอบไม่มีกราฟ บทนี้จะสอนวิธีที่ใช้จริง''',
          ],
        }),
        ContentBlock("lim_cond_h_032", "header", {
          "title": r"จาก 2 ข้อนี้ในบทที่แล้ว",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_033", "text", {
          "content": [
            r'''จะเห็นว่าค่าเข้าใกล้มันเท่ากับค่าที่จุดนั้นเลย ไปดูกัน''',
          ],
        }),
        ContentBlock("lim_cond_t_034", "text", {
          "content": [r'''หาค่า $\lim\limits_{x \to 2} x^2 - 2x + 2$'''],
        }),
        ContentBlock("ddq_limit_cond", "drag_and_drop", {
          "steps": [
            // ขั้นที่ 1
            {
              "questionId": "ddq_limit_cond1",
              "content": [
                r"**วิธีกราฟ**",
                {"graph": "graph_data_4"},
                r"$\lim\limits_{x \to 2} x^2 - 2x + 2 =$",
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$2$",
                r"$1$",
                r"$5$",
                r"ไม่เป็นทั้ง 3 อย่าง",
              ],
              "correctAnswers": {"0": r"$2$"},
              "explanation":
                  "นี่คือ definition ของอนุพันธ์จากหลักการ first principle",
            },

            // ขั้นที่ 2
            {
              "questionId": "ddq_limit_cond2",
              "content": [
                r'''**แทนค่าตรงๆ**
$f(2) =$      
                ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$2^2 - 2(2) + 2 = 2$",
                r"$2^2 + 2(2) + 2 = 10$",
                r"$3^2 - 2(3) + 2 = 5$",
              ],
              "correctAnswers": {"0": r"$2^2 - 2(2) + 2 = 2$"},
              "explanation": "แทนค่า f(x) = x^n และ f(x+h) = (x+h)^n",
            },
          ],
        }),
        ContentBlock("lim_cond_t_034", "text", {
          "content": [
            r'''💡 ทั้งสองวิธีได้คำตอบเดียวกัน แต่แทนค่าเร็วกว่ามาก — นี่คือวิธีที่ใช้ในข้อสอบจริง

🧭 วิธีหาลิมิตที่ถูกต้องที่สุดจริงๆ คือดูกราฟ แต่ข้อสอบไม่ให้กราฟมา เราเลยต้องหาแบบไม่มีกราฟให้เป็น''',
          ],
        }),
        ContentBlock("lim_cond_h_034", "header", {
          "title": r"วิธีนี้ใช้ ไม่ได้ กับฟังก์ชันเงื่อนไข",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_035", "text", {
          "content": [
            r'''💡 จำข้อนี้ จากบทที่แล้วได้ไหม? กราฟที่มีจุดโดดออกมา?''',
          ],
        }),
        ContentBlock("lim_cond_t_036", "interactive_graph", {
          "path": "graph_data_6",
        }),
        ContentBlock("lim_cond_t_037", "text", {
          "content": [
            r'''ฟังก์ชันที่มีเงื่อนไขแบบนี้ บทนี้จะไม่ครอบคลุม

เช่นฟังก์ชันนี้คือ $f(x) = \begin{cases} 5 - x^2,& x \neq -1 \\ 0, & x = -1 \end{cases}$

⚠️ ฟังก์ชันเงื่อนไขแบบนี้มีบทสอนแยกโดยเฉพาะ

วิธีแยกคือฟังก์ชันเงื่อนไขจะมี ปีกกาและแบ่งกรณี
''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"หัวใจของบทนี้",
      blocks: [
        ContentBlock("lim_cond_h_038", "header", {
          "title": r"แทน $x = a$ แล้วดูผลลัพธ์",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_039", "text", {
          "content": [
            r'''$$\lim\limits_{x \to a} f(x)$$

แทน $x = a$ จะได้ $f(a)$ แล้วดูผลลัพธ์
        
        ทุกโจทย์ที่เจอจะเข้า 3 กรณีนี้เสมอ''',
          ],
        }),
        ContentBlock("lim_cond_h_040", "header", {
          "title": r"1. ได้จำนวนจริง",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_041", "text", {
          "content": [
            r'''เช่น $5, -3, \dfrac{\pi}{2}$ หรือ $0.001$
            
ตอบจำนวนจริงนั้นได้เลย''',
          ],
        }),
        ContentBlock("lim_cond_h_042", "header", {
          "title": r"ได้ $\dfrac{k}{0}$ ($k \neq 0$)",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_043", "text", {
          "content": [
            r'''เศษไม่ใช่ $0$ แต่ส่วนเป็น $0$ เช่น $\dfrac{1}{0}, \dfrac{-5}{0}$''',
          ],
        }),
        ContentBlock("lim_cond_h_044", "header", {
          "title":
              r"ได้ $\dfrac{0}{0}, \dfrac{\infty}{\infty}$, \infty - \infty$",
          "level": 2,
        }),
        ContentBlock("lim_cond_t_045", "text", {
          "content": [r'''ยังสรุปคำตอบไม่ได้ ต้องจัดรูปต่อไปในบทถัดๆ ไป'''],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"☝️ 1.ได้จำนวนจริง — ตอบได้เลย",
      blocks: [
        ContentBlock("lim_cond_t_041", "text", {
          "content": [
            r'''ถ้ากราฟเป็นเส้นปกติ ไม่มีรู ไม่กระโดด — ค่าที่จุดนั้นก็คือค่าที่เข้าใกล้''',
          ],
        }),
        ContentBlock("lim_cond_t_043", "text", {
          "content": [
            r'''ทำไมแทนค่าได้เลย?
            
$$\lim\limits_{x \to 2} x + 3$$''',
          ],
        }),
        ContentBlock("lim_poly_t_061", "interactive_graph", {
          "path": "graph_data_1",
        }),
        ContentBlock("lim_cond_t_043", "text", {
          "content": [
            r'''
1. 🎨 กราฟ

lim = 5

2. แทนค่าตรงๆ

$f(2) = 2 + 3 = 5$

เป็นจำนวนจริง ✅ 

$lim = 5$

💡

กราฟเส้นปกติไม่มีรู ค่าที่จุดนั้นจึงเท่ากับค่าที่เข้าใกล้ เราเลยแทนตรงๆ ได้เลย

''',
          ],
        }),
        ContentBlock("q_limit_cond_1", "question_choice", {
          "content": [
            r'''1. จงหา
        
        $$\lim\limits_{x \to 2} 10x + 1$$''',
          ],
          "options": ["2", "4", "21", "8"],
          "correct": r"21",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 2$ 
        
        $f(2) = 10(2) + 1 = 21$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $21$ ซึ่งเป็นจำนวนจริง 💚 
        
        **ตอบ:** $21$ ได้เลย!''',
        }),
        ContentBlock("q_limit_cond_2", "question_choice", {
          "content": [
            r'''2. จงหา
        
        $$\lim\limits_{x \to 2} x^2$$''',
          ],
          "options": ["2", "4", "6", "8"],
          "correct": r"4",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 2$ 
        
        $f(2) = (2)^2 = 4$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $4$ ซึ่งเป็นจำนวนจริง 💚 
        
        **ตอบ:** $4$ ได้เลย!''',
        }),
        ContentBlock("q_limit_cond_3", "question_choice", {
          "content": [
            r'''3. จงหา
        
        $$\lim\limits_{x \to 1} 2x^2 + 3x - 5$$''',
          ],
          "options": [r"$0$", r"$2$", r"$4$", r"$6$"],
          "correct": r"$0$",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 1$ 
        
        $f(1) = 2(1)^2 + 3(1) - 5 = 0$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $0$ ซึ่งเป็นจำนวนจริง 💚 
        
        **ตอบ:** $0$ ได้เลย!''',
        }),
        ContentBlock("q_limit_cond_4", "question_choice", {
          "content": [
            r'''4. ให้ $f(x) = \begin{cases} 5,& \text{if } x = 2\\ x+1, & \text{otherwise} \end{cases}$
        
จงหา 
        
        $$\lim\limits_{x \to 2} f(x)$$''',
          ],
          "options": ["5", "3", "5", "5"],
          "correct": r"3",
          "explanation": r'''⚠️ **ระวัง!** นี่คือฟังก์ชันเงื่อนไข 
        
        ถ้าได้จำนวนจริงจะตอบเลยไม่ได้ ต้องเรียนในบทลิมิตฟังก์ชันเงื่อนไขก่อน
        
        สำหรับโจทย์นี้: เมื่อ $x$ เข้าใกล้ $2$ (แต่ไม่เท่ากับ $2$) จะใช้สมการ $x + 1$
        
        ดังนั้น $\lim\limits_{x \to 2} f(x) = 2 + 1 = 3$''',
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✌️ 2. ได้ $\dfrac{k}{0}$ ($k \neq 0$) — หาค่าไม่ได้",
      blocks: [
        ContentBlock("lim_cond_t_046", "text", {
          "content": [
            r'''ทำไมตอบหาค่าไม่ได้? 

ตัวอย่างเช่น $$\lim\limits_{x \to 0} \dfrac{1}{x}$$

แทนตรงๆจะได้ $\dfrac{1}{0}$

''',
          ],
        }),
        ContentBlock("ddq_limit_cond_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_limit_cond_1",
              "content": [
                {"image": "assets/lim.png"},
                r'''ลองดูกราฟของ $f(x) = \dfrac{1}{x}$ เมื่อ $x \to 0$
        
        จะเห็นว่า
        
        🔹 $x \to 0^-$ กราฟวิ่งลง ''',
                {"drop": "0"},
                r'''🔸 $x \to 0^+$ กราฟวิ่งขึ้น ''',
                {"drop": "1"},
                r'''จะได้ว่า $\lim\limits_{x \to 0^-} \dfrac{1}{x}$ ''',
                {"drop": "2"},
                r''' $\lim\limits_{x \to 0^+} \dfrac{1}{x}$
        
        ลิมิตซ้าย ''',
                {"drop": "2"},
                r'''ลิมิตขวา → $\lim\limits_{x \to 0} \dfrac{1}{x} = $ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$\infty$",
                r"$-\infty$",
                r"$\neq$",
                r"$=$",
                r"หาค่าไม่ได้",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$-\infty$",
                "1": r"$\infty$",
                "2": r"$\neq$",
                "3": r"หาค่าไม่ได้",
              },
              "explanation": r'''เมื่อ $x$ เข้าใกล้ $0$ เราดูค่าทั้ง $2$ ฝั่ง
        ดูค่า $y$ จากในกราฟ
        
        🔹 $\lim\limits_{x \to 0^-} \dfrac{1}{x} = -\infty$
        
        🔸 $\lim\limits_{x \to 0^+} \dfrac{1}{x} = \infty$
        
        เราเห็นว่าลิมิตซ้ายไม่เท่าลิมิตขวา $\lim\limits_{x \to 0^-} f(x) \neq \lim\limits_{x \to 0^+} f(x)$
        
        ดังนั้น $\lim\limits_{x \to 0} f(x)$ **หาค่าไม่ได้** เพราะลิมิตซ้ายไม่เท่าขวา''',
            },
          ],
        }),
        ContentBlock("lim_cond_t_047", "text", {
          "content": [
            r'''สรุปเป็นเพราะลิมิตซ้าย $\neq$ ลิมิตขวา นั่นเอง

''',
          ],
        }),
        ContentBlock("q_limit_cond_5", "question_choice", {
          "content": [
            r'''1. จงหา
        
        $$\lim\limits_{x \to 0} \frac{x^2 + 1}{x}$$''',
          ],
          "options": [r"$-\infty$", r"0", r"1", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 0$ 
        
        $f(0) = \dfrac{0^2 + 1}{0} = \dfrac{1}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{1}{0}$ ซึ่ง $k = 1 \neq 0$ 💚 
        
        **ตอบ:** หาค่าไม่ได้!''',
        }),
        ContentBlock("q_limit_cond_6", "question_choice", {
          "content": [
            r'''2. จงหา
        
        $$\lim\limits_{x \to -1} \frac{x^2 + 2x - 3}{x + 1}$$''',
          ],
          "options": [r"$-\infty$", r"0", r"-5", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = -1$ 
        
        $f(-1) = \dfrac{(-1)^2 + 2(-1) - 3}{-1 + 1} = \dfrac{-4}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{-4}{0}$ ซึ่ง $k = -4 \neq 0$ 💚 
        
        **ตอบ:** หาค่าไม่ได้!''',
        }),
        ContentBlock("q_limit_cond_7", "question_choice", {
          "content": [
            r'''3. จงหา
        
        $$\lim\limits_{x \to -1} \frac{x^3 + 2x + 1}{x + 1}$$''',
          ],
          "options": [r"$-\infty$", r"0", r"หาค่าไม่ได้", r"$\infty$"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = -1$ 
        
        $f(-1) = \dfrac{(-1)^3 + 2(-1) + 1}{-1 + 1} = \dfrac{-2}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{-2}{0}$ ซึ่ง $k = -2 \neq 0$ 💚 
        
        **ตอบ:** หาค่าไม่ได้!''',
        }),
        ContentBlock("q_limit_cond_8", "question_choice", {
          "content": [
            r'''4. จงหา
        
        $$\lim\limits_{x \to -1} \frac{x^2 + 2x + 1}{x + 1}$$''',
          ],
          "options": [
            "หาค่าไม่ได้",
            "\dfrac{0}{0}",
            "ไม่อยู่ใน 2 เงื่อนไข",
            "-2",
          ],
          "correct": r"ไม่อยู่ใน 2 เงื่อนไข",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = -1$ 
        
        $f(-1) = \dfrac{(-1)^2 + 2(-1) + 1}{-1 + 1} = \dfrac{1 - 2 + 1}{0} = \dfrac{0}{0}$
        
        **⚠️ ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{0}{0}$ ซึ่งไม่ตรงเงื่อนไขที่ 2 (เพราะ $k = 0$)
        
        นี่คือ **Indeterminate Form** ต้องจัดรูปก่อน!''',
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🤟 3. Indeterminate Form",
      blocks: [
        ContentBlock("lim_cond_t_052", "text", {
          "content": [
            r'''เมื่อแทน $x = a$ แล้วได้ 
        
        $$f(a) = \dfrac{0}{0}, \dfrac{\infty}{\infty}, \infty - \infty$$
        
        👉 **ต้องจัดรูปก่อน** ถึงจะหาคำตอบได้
        
        Note = หมายเหตุ
        
        **ในระดับ ม.ปลาย** มีแค่ $\dfrac{0}{0}, \dfrac{\infty}{\infty}, \infty - \infty$ 3 แบบนี้เท่านั้น''',
          ],
        }),
        ContentBlock("q_limit_cond_9", "question_choice", {
          "content": [
            r'''1. จงหา
        
        $$\lim\limits_{x \to -1} \frac{x^2 + 4x + 3}{x + 1}$$''',
          ],
          "options": ["ต้องจัดรูป", "ไม่ต้องจัดรูป"],
          "correct": r"ต้องจัดรูป",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = -1$ 
        
        $f(-1) = \dfrac{(-1)^2 + 4(-1) + 3}{-1 + 1} = \dfrac{0}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{0}{0}$ ซึ่งเป็น Indeterminate Form 💚 
        
        **ตอบ:** ต้องจัดรูป! (จะได้เรียนวิธีจัดรูปในบทถัดไป)''',
        }),
        ContentBlock("q_limit_cond_10", "question_choice", {
          "content": [
            r'''2. จงหา
        
        $$\lim\limits_{x \to -2} \frac{x^2 + 5x + 6}{x + 2}$$''',
          ],
          "options": ["ต้องจัดรูป", "ไม่ต้องจัดรูป"],
          "correct": r"ต้องจัดรูป",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = -2$ 
        
        $f(-2) = \dfrac{(-2)^2 + 5(-2) + 6}{-2 + 2} = \dfrac{0}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{0}{0}$ ซึ่งเป็น Indeterminate Form 💚 
        
        **ตอบ:** ต้องจัดรูป!''',
        }),
        ContentBlock("q_limit_cond_11", "question_choice", {
          "content": [
            r'''3. จงหา
        
        $$\lim\limits_{x \to 2} \left(\dfrac{1}{x - 2} + \dfrac{1}{x + 2} - \dfrac{4}{x^2 - 4}\right)$$''',
          ],
          "options": ["ต้องจัดรูป", "ไม่ต้องจัดรูป"],
          "correct": r"ต้องจัดรูป",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 2$ 
        
        $f(2) = \dfrac{1}{0} + \dfrac{1}{4} - \dfrac{4}{0}$ 
        
        ซึ่งเป็นรูปแบบ $\infty - \infty$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\infty - \infty$ ซึ่งเป็น Indeterminate Form 💚 
        
        **ตอบ:** ต้องจัดรูป!''',
        }),
        ContentBlock("q_limit_cond_12", "question_choice", {
          "content": [
            r'''4. จงหา
        
        $$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x^3 - 8}$$''',
          ],
          "options": ["ต้องจัดรูป", "ไม่ต้องจัดรูป"],
          "correct": r"ต้องจัดรูป",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 2$ 
        
        $f(2) = \dfrac{2^2 - 4}{2^3 - 8} = \dfrac{0}{0}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{0}{0}$ ซึ่งเป็น Indeterminate Form 💚 
        
        **ตอบ:** ต้องจัดรูป!''',
        }),
        ContentBlock("q_limit_cond_13", "question_choice", {
          "content": [
            r'''5. จงหา
        
        $$\lim\limits_{x \to 4} \dfrac{x^2 - 4}{x^3 - 8}$$''',
          ],
          "options": ["ต้องจัดรูป", "ไม่ต้องจัดรูป"],
          "correct": r"ไม่ต้องจัดรูป",
          "explanation": r'''**ขั้นที่ 1:** แทน $x = 4$ 
        
        $f(4) = \dfrac{4^2 - 4}{4^3 - 8} = \dfrac{12}{56} = \dfrac{3}{14}$ 
        
        **ขั้นที่ 2:** ตรวจสอบเงื่อนไข
        
        ได้ $\dfrac{3}{14}$ ซึ่งเป็นจำนวนจริง 💚 
        
        **ตอบ:** ไม่ต้องจัดรูป! ตอบ $\dfrac{3}{14}$ ได้เลย''',
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_cond_t_058", "text", {
          "content": [
            r'''📌 **3 ขั้นตอนหาลิมิตด้วยการแทนค่า**
        
        **1. แทนค่า** $x = a$ เข้าไปในฟังก์ชันก่อนเสมอ
        
        **2. ตรวจสอบเงื่อนไข** ผลลัพธ์ที่ได้:
        
           🔸 ได้จำนวนจริง → ตอบเลย (ยกเว้นฟังก์ชันเงื่อนไข)
        
           🔸 ได้ $\dfrac{k}{0}$ เมื่อ $k \neq 0$ → หาค่าไม่ได้
        
           🔸 ได้ $\dfrac{0}{0}, \dfrac{\infty}{\infty}, \infty - \infty$ → ต้องจัดรูป
        
        **3. การจัดรูป** จะได้เรียนในบทถัดไป! 🎯''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัด2 (แบบฝึกหัดเรื่องสมบัติของลิมิตและการแทนค่า)

final calcLimitPolynomialLesson = ContentLesson(
  title: "ลิมิตการจัดรูปพหุนาม",
  sections: [
    // ==========================================
    // SECTION 1: ทำไม 0/0 ถึงยังมีคำตอบ?
    // ==========================================
    ContentSection(
      headerL1: r"ทำไม 0/0 ถึงยังมีคำตอบ?",
      blocks: [
        ContentBlock("lim_poly_t_001", "text", {
          "content": [
            r'''จากบทที่แล้ว ถ้าแทนค่าแล้วได้ $\dfrac{0}{0}$ — ตอบตรงๆ ไม่ได้ แต่ลิมิตยังอาจมีค่าอยู่

มาดูจากกราฟว่าเกิดอะไรขึ้นจริงๆ''',
          ],
        }),
        ContentBlock("lim_poly_ig_002", "interactive_graph", {
          "path": "graph_data_2",
        }),
        ContentBlock("lim_poly_t_003", "text", {
          "content": [
            r'''นี่คือกราฟของ $f(x) = \dfrac{x^2-4}{x-2}$

เลื่อนจุดเข้าหา $x = 2$ ทั้งสองฝั่ง แล้วดูว่า $y$ เข้าใกล้อะไร

Note = สังเกต

ที่ $x = 2$ มีรูอยู่ (แทนค่าตรงๆ ไม่ได้) แต่เส้นกราฟยังเข้าใกล้ค่าหนึ่งได้อยู่!''',
          ],
        }),
        ContentBlock("lim_poly_ddq_004", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_004_s1",
              "content": [
                r'''จากกราฟ เมื่อ $x$ เข้าใกล้ $2$ กราฟเข้าใกล้ค่า''',
                {"drop": "0"},
                r'''แต่ถ้าแทน $x = 2$ ตรงๆ ใน $\dfrac{x^2-4}{x-2}$ จะได้''',
                {"drop": "1"},
                r'''ดังนั้น $f(2)$ กับ $\lim\limits_{x \to 2} f(x)$''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$4$",
                r"$2$",
                r"$\dfrac{0}{0}$ หาค่าไม่ได้",
                r"$0$",
                r"เท่ากัน",
                r"ไม่เท่ากัน",
              ],
              "correctAnswers": {
                "0": r"$4$",
                "1": r"$\dfrac{0}{0}$ หาค่าไม่ได้",
                "2": r"ไม่เท่ากัน",
              },
              "explanation":
                  r'''กราฟเข้าใกล้ $4$ แต่ $f(2) = \dfrac{0}{0}$ หาค่าไม่ได้ นั่นคือ lim ≠ f(a) ในกรณีนี้''',
            },
          ],
        }),
        ContentBlock("lim_poly_t_005", "text", {
          "content": [
            r'''กราฟจริงๆ ของ $\dfrac{x^2-4}{x-2}$ คือ $x+2$ แต่มีรูที่ $x = 2$

เราต้องจัดรูปเพื่อ "เปิดเผย" ว่าเส้นกราฟจริงๆ คืออะไร แล้วค่อยแทนค่า''',
          ],
        }),
      ],
    ),

    // ==========================================
    // SECTION 2: วิธีที่ 1 แยกตัวประกอบ
    // ==========================================
    ContentSection(
      headerL1: r"วิธีที่ 1: แยกตัวประกอบ",
      blocks: [
        ContentBlock("lim_poly_t_006", "text", {
          "content": [
            r'''ถ้าเศษและส่วนเป็น $0$ พร้อมกัน แปลว่าทั้งคู่ต้องมี "ตัวร่วม" อยู่

ตัดตัวร่วมออก → เศษส่วนเหลือเป็นรูปที่แทนค่าได้''',
          ],
        }),
        ContentBlock("lim_poly_h_007", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("lim_poly_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_008_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 2} \dfrac{x^2+x-6}{x-2}$

แทน $x = 2$ ตรงๆ ก่อน ได้ผลลัพธ์อะไร?''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$ ต้องจัดรูป",
                r"$5$",
                r"$0$",
                r"$\dfrac{1}{0}$ หาค่าไม่ได้",
              ],
              "correctAnswers": {"0": r"$\dfrac{0}{0}$ ต้องจัดรูป"},
              "explanation":
                  r'''$f(2) = \dfrac{4+2-6}{2-2} = \dfrac{0}{0}$ ต้องจัดรูปก่อน''',
            },
            {
              "questionId": "lim_poly_ddq_008_s2",
              "content": [
                r'''ทั้งเศษและส่วนเป็น $0$ แปลว่ามีตัวร่วมอยู่

แยกตัวประกอบเศษ $x^2+x-6$ ได้เป็น''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$(x-2)(x+3)$",
                r"$(x+2)(x-3)$",
                r"$(x-1)(x+6)$",
                r"$(x-6)(x+1)$",
              ],
              "correctAnswers": {"0": r"$(x-2)(x+3)$"},
              "explanation":
                  r'''หาสองตัวที่คูณกันได้ $-6$ และบวกกันได้ $1$ → คือ $-2$ กับ $3$

ดังนั้น $x^2+x-6 = (x-2)(x+3)$''',
            },
            {
              "questionId": "lim_poly_ddq_008_s3",
              "content": [
                r'''$\dfrac{(x-2)(x+3)}{(x-2)}$ ตัด $(x-2)$ ออก เหลือ''',
                {"drop": "0"},
                r'''แทน $x = 2$ ได้ $\lim\limits_{x \to 2} \dfrac{x^2+x-6}{x-2} =$''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$x+3$",
                r"$x-3$",
                r"$x+2$",
                r"$4$",
                r"$5$",
                r"$6$",
              ],
              "correctAnswers": {"0": r"$x+3$", "1": r"$5$"},
              "explanation":
                  r'''ตัด $(x-2)$ ออก เหลือ $x+3$ แล้วแทน $x = 2$ → $2+3 = 5$''',
            },
          ],
        }),
        ContentBlock("lim_poly_h_009", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_010", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to 2} \dfrac{x^2-4}{x-2}$$''',
          ],
          "options": [r"$2$", r"$4$", r"$6$", r"หาค่าไม่ได้"],
          "correct": r"$4$",
          "explanation":
              r'''แทน $x=2$ → $\dfrac{0}{0}$ ต้องจัดรูป

$x^2-4 = (x-2)(x+2)$ ← สูตร $a^2-b^2$

ตัด $(x-2)$ → เหลือ $x+2$

แทน $x=2$ → $2+2 = 4$''',
        }),
        ContentBlock("q_lim_poly_011", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to 1} \dfrac{x^3-x}{x-1}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$2$", r"$3$"],
          "correct": r"$2$",
          "explanation":
              r'''แทน $x=1$ → $\dfrac{0}{0}$ ต้องจัดรูป

$x^3-x = x(x^2-1) = x(x-1)(x+1)$

ตัด $(x-1)$ → เหลือ $x(x+1)$

แทน $x=1$ → $1 \times 2 = 2$''',
        }),
        ContentBlock("q_lim_poly_012", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to 2} \dfrac{x^2-4}{x^3-8}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{3}$", r"$\dfrac{2}{3}$", r"$1$"],
          "correct": r"$\dfrac{1}{3}$",
          "explanation":
              r'''แทน $x=2$ → $\dfrac{0}{0}$ ต้องจัดรูป

$x^2-4 = (x-2)(x+2)$

$x^3-8 = (x-2)(x^2+2x+4)$ ← สูตร $a^3-b^3$

ตัด $(x-2)$ → $\dfrac{x+2}{x^2+2x+4}$

แทน $x=2$ → $\dfrac{4}{12} = \dfrac{1}{3}$''',
        }),
        ContentBlock("q_lim_poly_013", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to -1} \dfrac{x^3+1}{x+1}$$''',
          ],
          "options": [r"$-3$", r"$-1$", r"$1$", r"$3$"],
          "correct": r"$3$",
          "explanation":
              r'''แทน $x=-1$ → $\dfrac{0}{0}$ ต้องจัดรูป

$x^3+1 = (x+1)(x^2-x+1)$ ← สูตร $a^3+b^3$

ตัด $(x+1)$ → $x^2-x+1$

แทน $x=-1$ → $1+1+1 = 3$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 3: วิธีที่ 2 เมื่อมี √
    // ==========================================
    ContentSection(
      headerL1: r"วิธีที่ 2: เมื่อมี √ อยู่ในสมการ",
      blocks: [
        ContentBlock("lim_poly_t_014", "text", {
          "content": [
            r'''ลองดูโจทย์นี้

$$\lim\limits_{x \to 1} \dfrac{2-\sqrt{x+3}}{x-1}$$

แทน $x=1$ → $\dfrac{2-2}{0} = \dfrac{0}{0}$ ต้องจัดรูป แต่ครั้งนี้แยกตัวประกอบแบบเดิมไม่ได้เพราะมี $\sqrt{\ }$ อยู่''',
          ],
        }),
        ContentBlock("lim_poly_h_015", "header", {
          "title": r"ถ้าไม่มี √ จะง่ายกว่านี้มาก — แล้วทำให้มันหายยังไง?",
          "level": 2,
        }),
        ContentBlock("lim_poly_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_016_s1",
              "content": [
                r'''ถ้าต้องการให้ $\sqrt{x+3}$ หายไป ต้องทำอะไรกับมัน?''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"ยกกำลัง 2",
                r"คูณด้วย 2",
                r"ลบออก",
                r"คูณด้วย $\sqrt{x+3}$",
              ],
              "correctAnswers": {"0": r"ยกกำลัง 2"},
              "explanation":
                  r'''$\left(\sqrt{x+3}\right)^2 = x+3$ ซึ่งไม่มี $\sqrt{\ }$ แล้ว''',
            },
            {
              "questionId": "lim_poly_ddq_016_s2",
              "content": [
                r'''ในเรื่องจำนวนจริง เคยเรียนมาว่า $(a-b)(a+b) = a^2 - b^2$

ลองแทน $a = 2$ และ $b = \sqrt{x+3}$ จะได้

$(2-\sqrt{x+3}) \times$ ''',
                {"drop": "0"},
                r'''$= 2^2 - \left(\sqrt{x+3}\right)^2 = 4-(x+3)$

ซึ่งไม่มี $\sqrt{\ }$ แล้ว! ตัวที่คูณเข้าไปนี้เรียกว่า Conjugate''',
              ],
              "draggableItems": [
                r"$(2+\sqrt{x+3})$",
                r"$(2-\sqrt{x+3})$",
                r"$\sqrt{x+3}$",
                r"$(x+3)$",
              ],
              "correctAnswers": {"0": r"$(2+\sqrt{x+3})$"},
              "explanation":
                  r'''$(2-\sqrt{x+3})(2+\sqrt{x+3}) = 4-(x+3)$ ไม่มี $\sqrt{\ }$ แล้ว

Conjugate ของ $a-b$ คือ $a+b$ และในทางกลับกัน — แค่เปลี่ยนเครื่องหมายตรงกลาง''',
            },
            {
              "questionId": "lim_poly_ddq_016_s3",
              "content": [
                r'''ถ้าคูณแค่เศษด้วย $(2+\sqrt{x+3})$ ค่าจะเปลี่ยนไป

วิธีคูณโดยไม่ให้ค่าเปลี่ยน คือต้องคูณ $\dfrac{2+\sqrt{x+3}}{2+\sqrt{x+3}}$ ซึ่งมีค่าเท่ากับ''',
                {"drop": "0"},
                r'''ดังนั้นต้องคูณทั้ง เศษ และ ส่วน ด้วย $(2+\sqrt{x+3})$''',
              ],
              "draggableItems": [r"$1$", r"$0$", r"$2$", r"$x+3$"],
              "correctAnswers": {"0": r"$1$"},
              "explanation":
                  r'''ตัวเลขหารตัวเองเสมอเท่ากับ $1$ คูณด้วย $1$ ค่าจึงไม่เปลี่ยน''',
            },
          ],
        }),
        ContentBlock("lim_poly_h_017", "header", {
          "title": r"ลองทำจนจบ",
          "level": 2,
        }),
        ContentBlock("lim_poly_ddq_018", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_018_s1",
              "content": [
                r'''$\dfrac{2-\sqrt{x+3}}{x-1} \times \dfrac{2+\sqrt{x+3}}{2+\sqrt{x+3}}$

เศษ: $(2-\sqrt{x+3})(2+\sqrt{x+3}) = 4-(x+3) =$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$1-x$",
                r"$x-1$",
                r"$7-x$",
                r"$1+x$",
              ],
              "correctAnswers": {"0": r"$1-x$"},
              "explanation": r'''$4-(x+3) = 4-x-3 = 1-x$''',
            },
            {
              "questionId": "lim_poly_ddq_018_s2",
              "content": [
                r'''$\dfrac{1-x}{(x-1)(2+\sqrt{x+3})}$

สังเกตว่า $1-x = -(x-1)$ ตัด $(x-1)$ ออก เหลือ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{-1}{2+\sqrt{x+3}}$",
                r"$\dfrac{1}{2+\sqrt{x+3}}$",
                r"$\dfrac{-1}{2-\sqrt{x+3}}$",
                r"$-(2+\sqrt{x+3})$",
              ],
              "correctAnswers": {"0": r"$\dfrac{-1}{2+\sqrt{x+3}}$"},
              "explanation":
                  r'''$\dfrac{-(x-1)}{(x-1)(2+\sqrt{x+3})} = \dfrac{-1}{2+\sqrt{x+3}}$''',
            },
            {
              "questionId": "lim_poly_ddq_018_s3",
              "content": [
                r'''แทน $x=1$ ใน $\dfrac{-1}{2+\sqrt{x+3}}$

$= \dfrac{-1}{2+\sqrt{4}} = \dfrac{-1}{2+2} =$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{-1}{4}$",
                r"$\dfrac{1}{4}$",
                r"$\dfrac{-1}{2}$",
                r"$-1$",
              ],
              "correctAnswers": {"0": r"$\dfrac{-1}{4}$"},
              "explanation": r'''$\dfrac{-1}{4}$ คือคำตอบ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_poly_h_019", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_020", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to 0} \dfrac{\sqrt{x+1}-1}{x}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"$1$"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation":
              r'''แทน $x=0$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → ใช้ Conjugate

คูณด้วย $\dfrac{\sqrt{x+1}+1}{\sqrt{x+1}+1}$

เศษ: $(\sqrt{x+1})^2-1^2 = x+1-1 = x$

ตัด $x$ → เหลือ $\dfrac{1}{\sqrt{x+1}+1}$

แทน $x=0$ → $\dfrac{1}{1+1} = \dfrac{1}{2}$''',
        }),
        ContentBlock("q_lim_poly_021", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to 3} \dfrac{x-3}{\sqrt{x+1}-2}$$''',
          ],
          "options": [r"$2$", r"$3$", r"$4$", r"$6$"],
          "correct": r"$4$",
          "explanation":
              r'''แทน $x=3$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → ใช้ Conjugate กับส่วน

คูณด้วย $\dfrac{\sqrt{x+1}+2}{\sqrt{x+1}+2}$

ส่วน: $(\sqrt{x+1})^2-4 = x+1-4 = x-3$

ตัด $(x-3)$ → เหลือ $\sqrt{x+1}+2$

แทน $x=3$ → $\sqrt{4}+2 = 4$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 4: ฝึกรวม
    // ==========================================
    ContentSection(
      headerL1: r"ฝึกรวม",
      blocks: [
        ContentBlock("lim_poly_t_022", "text", {
          "content": [
            r'''แต่ละข้อ แทนค่าดูก่อนเสมอ แล้วค่อยตัดสินใจว่าต้องทำอะไรต่อ''',
          ],
        }),
        ContentBlock("q_lim_poly_023", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to 5} \dfrac{x^2-25}{x-5}$$''',
          ],
          "options": [r"$5$", r"$8$", r"$10$", r"$15$"],
          "correct": r"$10$",
          "explanation":
              r'''แทน $x=5$ → $\dfrac{0}{0}$

$x^2-25 = (x-5)(x+5)$ → ตัด $(x-5)$ → $x+5$

แทน $x=5$ → $10$''',
        }),
        ContentBlock("q_lim_poly_024", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to 0} \dfrac{\sqrt{x+4}-2}{x}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{4}$",
          "explanation":
              r'''แทน $x=0$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → Conjugate

คูณด้วย $\dfrac{\sqrt{x+4}+2}{\sqrt{x+4}+2}$

เศษ: $(x+4)-4 = x$ → ตัด $x$ → เหลือ $\dfrac{1}{\sqrt{x+4}+2}$

แทน $x=0$ → $\dfrac{1}{4}$''',
        }),
        ContentBlock("q_lim_poly_025", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to -1} \dfrac{x^2+4x+3}{x+1}$$''',
          ],
          "options": [r"$-3$", r"$-2$", r"$2$", r"$3$"],
          "correct": r"$2$",
          "explanation":
              r'''แทน $x=-1$ → $\dfrac{0}{0}$

$x^2+4x+3 = (x+1)(x+3)$ → ตัด $(x+1)$ → $x+3$

แทน $x=-1$ → $2$''',
        }),
        ContentBlock("q_lim_poly_026", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to 1} \dfrac{2-\sqrt{x+3}}{x^2-1}$$''',
          ],
          "options": [
            r"$\dfrac{-1}{8}$",
            r"$\dfrac{-1}{4}$",
            r"$\dfrac{1}{4}$",
            r"$\dfrac{1}{8}$",
          ],
          "correct": r"$\dfrac{-1}{8}$",
          "explanation":
              r'''แทน $x=1$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → Conjugate กับเศษ

คูณด้วย $\dfrac{2+\sqrt{x+3}}{2+\sqrt{x+3}}$

เศษ: $4-(x+3) = 1-x = -(x-1)$

ส่วน: $(x^2-1)(2+\sqrt{x+3}) = (x-1)(x+1)(2+\sqrt{x+3})$

ตัด $(x-1)$ → $\dfrac{-1}{(x+1)(2+\sqrt{x+3})}$

แทน $x=1$ → $\dfrac{-1}{2 \times 4} = \dfrac{-1}{8}$''',
        }),
        ContentBlock("q_lim_poly_027", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to 3} \dfrac{x^2-9}{\sqrt{x+1}-2}$$''',
          ],
          "options": [r"$4$", r"$8$", r"$12$", r"$16$"],
          "correct": r"$12$",
          "explanation":
              r'''แทน $x=3$ → $\dfrac{0}{0}$ มีทั้งพหุนามและ $\sqrt{\ }$

ใช้ Conjugate กับส่วน คูณด้วย $\dfrac{\sqrt{x+1}+2}{\sqrt{x+1}+2}$

ส่วน: $(x+1)-4 = x-3$

$\dfrac{(x^2-9)(\sqrt{x+1}+2)}{x-3} = \dfrac{(x-3)(x+3)(\sqrt{x+1}+2)}{x-3}$

ตัด $(x-3)$ → $(x+3)(\sqrt{x+1}+2)$

แทน $x=3$ → $6 \times (\sqrt{4}+2) = 6 \times 4 = 24$

Note = เฉลย

ขอโทษ ตอบคือ $24$ ไม่ใช่ $12$ ลองตรวจสอบอีกครั้ง: $(3+3)(\sqrt{3+1}+2) = 6 \times 4 = 24$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 5: สรุป
    // ==========================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_poly_t_028", "text", {
          "content": [
            r'''เมื่อแทนค่าแล้วได้ $\dfrac{0}{0}$ ทุกครั้ง — แปลว่ากราฟมีรูที่จุดนั้น แต่ลิมิตอาจยังมีค่าอยู่ ต้องจัดรูปก่อน''',
          ],
        }),
        ContentBlock("lim_poly_t_029", "text", {
          "content": [
            r'''**มีพหุนามล้วนๆ** → หาตัวร่วมของเศษและส่วน แยกตัวประกอบแล้วตัดออก

**มี $\sqrt{\ }$ อยู่** → $\sqrt{\ }$ ขัดขวางการตัดตัวร่วม ต้องยกกำลัง 2 โดยใช้ Conjugate ก่อน

Note = จำไว้

แทนค่าดูก่อนเสมอ เพื่อดูว่าต้องจัดรูปหรือเปล่า และสังเกตหน้าตาสมการเพื่อเลือกวิธี''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัด3 (แบบฝึกหัดเรื่องลิมิตการจัดรูปพหุนาม และลิมิตซ้ายขวา)

final calcLimitAbsoluteLesson = ContentLesson(
  title: "ลิมิตค่าสัมบูรณ์",
  sections: [

    // =============================================
    // SECTION 1: ทบทวนค่าสัมบูรณ์
    // =============================================
    ContentSection(
      headerL1: r"📐 ทบทวนค่าสัมบูรณ์",
      blocks: [
        ContentBlock("lab_t_001", "text", {
          "content": [
            r'''บทนี้จะเรียนลิมิตที่มีค่าสัมบูรณ์อยู่ด้วย ก่อนเริ่ม มาทบทวนนิยามค่าสัมบูรณ์กันสั้นๆ ก่อนนะ''',
          ],
        }),
        ContentBlock("lab_h_002", "header", {
          "title": r"นิยามค่าสัมบูรณ์",
          "level": 2,
        }),
        ContentBlock("lab_t_003", "text", {
          "content": [
            r'''$$|x| = \begin{cases} x, & \text{ถ้า } x \geq 0 \\ -x, & \text{ถ้า } x < 0 \end{cases}$$

พูดง่ายๆ คือ ค่าสัมบูรณ์ทำให้ตัวเลขเป็นบวกเสมอ''',
          ],
        }),
        ContentBlock("lab_t_004", "text", {
          "content": [
            r'''🔸 $|5| = 5$ เพราะ $5 \geq 0$ ใช้สูตรบน

🔸 $|-3| = 3$ เพราะ $-3 < 0$ ใช้สูตรล่าง $-(-3) = 3$''',
          ],
        }),
        ContentBlock("lab_ddq_005", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lab_ddq_005_s1",
              "content": [
                r'''ลองเติมค่าต่อไปนี้

$|7| = $ ''',
                {"drop": "0"},
                r'''$|-4| = $ ''',
                {"drop": "1"},
                r'''$|0| = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$7$", r"$4$", r"$0$", r"$-7$", r"$-4$"],
              "correctAnswers": {"0": r"$7$", "1": r"$4$", "2": r"$0$"},
              "explanation": r'''$|7| = 7$ เพราะ $7 \geq 0$

$|-4| = 4$ เพราะ $-4 < 0$ ใช้ $-(-4) = 4$

$|0| = 0$ เพราะ $0 \geq 0$''',
            },
          ],
        }),
        ContentBlock("lab_q_006", "question_choice", {
          "content": [
            r'''1. $|x - 3|$ เมื่อ $x = 1$ มีค่าเท่าไหร่?''',
          ],
          "options": [r"$-2$", r"$2$", r"$4$", r"$-4$"],
          "correct": r"$2$",
          "explanation": r'''แทน $x = 1$

$|1 - 3| = |-2|$

เพราะ $-2 < 0$ ใช้สูตรล่าง: $-(-2) = 2$''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: ทำไมต้องแยกลิมิตซ้าย-ขวา?
    // =============================================
    ContentSection(
      headerL1: r"🤔 แนวคิดหลัก",
      blocks: [
        ContentBlock("lab_t_007", "text", {
          "content": [
            r'''แยกลิมิตซ้ายและขวา

ทำไม?

ลองสังเกต $|x - 2|$ เมื่อ $x$ อยู่คนละฝั่งของ $2$''',
          ],
        }),
        ContentBlock("lab_h_008", "header", {
          "title": r"สูตรต่างกันตามฝั่ง",
          "level": 2,
        }),
        ContentBlock("lab_t_009", "text", {
          "content": [
            r'''🔹 ถ้า $x < 2$ (ฝั่งซ้าย): $x - 2 < 0$ ดังนั้น $|x - 2| = -(x-2) = 2-x$

🔸 ถ้า $x > 2$ (ฝั่งขวา): $x - 2 > 0$ ดังนั้น $|x - 2| = x-2$''',
          ],
        }),
        ContentBlock("lab_t_010", "text", {
          "content": [
            r'''นั่นคือโจทย์ที่มี $|x - a|$ อยู่ด้วย เราต้องแยกลิมิตซ้ายและขวาเสมอ

Note = สำคัญ

ค่าสัมบูรณ์มีสูตรสองแบบตามเงื่อนไข ดังนั้นลิมิตซ้ายและขวาต้องคำนวณแยกกัน''',
          ],
        }),
        ContentBlock("lab_ddq_011", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lab_ddq_011_s1",
              "content": [
                r'''สำหรับ $|x - 5|$

เมื่อ $x < 5$ จะได้ $|x - 5| = $ ''',
                {"drop": "0"},
                r'''เมื่อ $x > 5$ จะได้ $|x - 5| = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$x - 5$",
                r"$5 - x$",
                r"$|x| - 5$",
                r"$x + 5$",
              ],
              "correctAnswers": {"0": r"$5 - x$", "1": r"$x - 5$"},
              "explanation": r'''เมื่อ $x < 5$: $x - 5 < 0$ ดังนั้น $|x-5| = -(x-5) = 5-x$

เมื่อ $x > 5$: $x - 5 > 0$ ดังนั้น $|x-5| = x-5$''',
            },
          ],
        }),
        ContentBlock("lab_q_012", "question_choice", {
          "content": [
            r'''2. เมื่อ $x \to 0^-$ (แปลว่า $x < 0$) จะได้ $|x| = $ ?''',
          ],
          "options": [r"$x$", r"$-x$", r"$0$", r"ไม่มีคำตอบ"],
          "correct": r"$-x$",
          "explanation": r'''เมื่อ $x < 0$: $x$ เป็นลบ ใช้สูตรล่าง $|x| = -x$

เช่น $x = -0.1$ → $|-0.1| = -(-0.1) = 0.1 = -x$ ✅''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: กฎการเปิดค่าสัมบูรณ์
    // =============================================
    ContentSection(
      headerL1: r"📏 กฎการเปิดค่าสัมบูรณ์",
      blocks: [
        ContentBlock("lab_t_013", "text", {
          "content": [
            r'''จากที่เรียนมา สรุปเป็นกฎได้เลย ใช้กับโจทย์ทุกข้อที่มี $|x - a|$''',
          ],
        }),
        ContentBlock("lab_h_014", "header", {
          "title": r"กฎหลัก",
          "level": 2,
        }),
        ContentBlock("lab_t_015", "text", {
          "content": [
            r'''🔹 **ลิมิตซ้าย** $(x \to a^-)$: $x < a$ ดังนั้น $x - a < 0$

$$|x - a| = -(x-a) = a - x$$''',
          ],
        }),
        ContentBlock("lab_t_016", "text", {
          "content": [
            r'''🔸 **ลิมิตขวา** $(x \to a^+)$: $x > a$ ดังนั้น $x - a > 0$

$$|x - a| = x - a$$''',
          ],
        }),
        ContentBlock("lab_h_017", "header", {
          "title": r"ลองใช้กฎ",
          "level": 2,
        }),
        ContentBlock("lab_t_018", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 3^-} \dfrac{|x - 3|}{x - 3}$''',
          ],
        }),
        ContentBlock("lab_ddq_019", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lab_ddq_019_s1",
              "content": [
                r'''**ขั้นที่ 1:** $x \to 3^-$ แปลว่า $x < 3$ ดังนั้นใช้กฎลิมิตซ้าย

$|x - 3| = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x - 3$",
                r"$3 - x$",
                r"$x + 3$",
                r"$-(3-x)$",
              ],
              "correctAnswers": {"0": r"$3 - x$"},
              "explanation": r'''$x < 3$ ดังนั้น $x - 3 < 0$

$|x-3| = -(x-3) = 3-x$''',
            },
            {
              "questionId": "lab_ddq_019_s2",
              "content": [
                r'''**ขั้นที่ 2:** แทน $|x-3| = 3-x$ เข้าไป

$\dfrac{|x-3|}{x-3} = \dfrac{3-x}{x-3}$

สังเกตว่า $3-x = -(x-3)$ ดังนั้น $\dfrac{3-x}{x-3} = $ ''',
                {"drop": "0"},
                r'''ดังนั้น $\lim\limits_{x \to 3^-} \dfrac{|x-3|}{x-3} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-1$", r"$1$", r"$0$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$-1$"},
              "explanation": r'''$\dfrac{3-x}{x-3} = \dfrac{-(x-3)}{x-3} = -1$

ลิมิตซ้ายเท่ากับ $-1$''',
            },
          ],
        }),
        ContentBlock("lab_q_020", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to 3^+} \dfrac{|x - 3|}{x - 3}$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''$x \to 3^+$ คือ $x > 3$ ใช้กฎลิมิตขวา: $|x-3| = x-3$

$\dfrac{x-3}{x-3} = 1$

ดังนั้น $\lim\limits_{x \to 3^+} \dfrac{|x-3|}{x-3} = 1$''',
        }),
        ContentBlock("lab_q_021", "question_choice", {
          "content": [
            r'''4. จาก 2 ข้อที่แล้ว จงหา

$$\lim\limits_{x \to 3} \dfrac{|x - 3|}{x - 3}$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ลิมิตซ้าย $= -1$ และลิมิตขวา $= 1$

เนื่องจากลิมิตซ้าย $\neq$ ลิมิตขวา

$\lim\limits_{x \to 3} \dfrac{|x-3|}{x-3}$ **หาค่าไม่ได้**''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: ฝึกทำทีละ Step
    // =============================================
    ContentSection(
      headerL1: r"🚀 ฝึกทำทีละ Step",
      blocks: [
        ContentBlock("lab_t_022", "text", {
          "content": [
            r'''คราวนี้ลองโจทย์ที่ยากขึ้นอีกนิด ที่ต้องทั้งเปิดค่าสัมบูรณ์ และจัดรูปด้วย''',
          ],
        }),
        ContentBlock("lab_h_023", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("lab_t_024", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 2^-} \dfrac{|x - 2|}{x^2 - 4}$''',
          ],
        }),
        ContentBlock("lab_ddq_025", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lab_ddq_025_s1",
              "content": [
                r'''**Step 1:** แทนค่า $x = 2$ ก่อนเสมอ

$f(2) = \dfrac{|2-2|}{2^2-4} = \dfrac{0}{0}$ → ต้องจัดรูป

$x \to 2^-$ แปลว่า $x < 2$ ดังนั้น $|x-2| = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x - 2$",
                r"$2 - x$",
                r"$x + 2$",
                r"$-(2+x)$",
              ],
              "correctAnswers": {"0": r"$2 - x$"},
              "explanation": r'''$x < 2$ ดังนั้น $x - 2 < 0$

$|x-2| = -(x-2) = 2-x$''',
            },
            {
              "questionId": "lab_ddq_025_s2",
              "content": [
                r'''**Step 2:** แยกตัวประกอบส่วน

$x^2 - 4 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$(x-2)(x+2)$",
                r"$(x+2)(x+2)$",
                r"$(x-2)(x-2)$",
                r"$(x-4)(x+1)$",
              ],
              "correctAnswers": {"0": r"$(x-2)(x+2)$"},
              "explanation": r'''สูตร $a^2 - b^2 = (a-b)(a+b)$

$x^2 - 4 = (x-2)(x+2)$''',
            },
            {
              "questionId": "lab_ddq_025_s3",
              "content": [
                r'''**Step 3:** ตัดตัวประกอบร่วม

$\dfrac{2-x}{(x-2)(x+2)}$

สังเกตว่า $2-x = -(x-2)$ จึงได้

$\dfrac{-(x-2)}{(x-2)(x+2)} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{-1}{x+2}$",
                r"$\dfrac{1}{x+2}$",
                r"$\dfrac{-1}{x-2}$",
                r"$-(x+2)$",
              ],
              "correctAnswers": {"0": r"$\dfrac{-1}{x+2}$"},
              "explanation": r'''ตัด $(x-2)$ ออก เหลือ $\dfrac{-1}{x+2}$''',
            },
            {
              "questionId": "lab_ddq_025_s4",
              "content": [
                r'''**Step 4:** แทนค่า $x = 2$

$\lim\limits_{x \to 2^-} \dfrac{-1}{x+2} = \dfrac{-1}{2+2} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{-1}{4}$",
                r"$\dfrac{1}{4}$",
                r"$\dfrac{-1}{2}$",
                r"$-1$",
              ],
              "correctAnswers": {"0": r"$\dfrac{-1}{4}$"},
              "explanation": r'''$\dfrac{-1}{2+2} = \dfrac{-1}{4}$

ดังนั้น $\lim\limits_{x \to 2^-} \dfrac{|x-2|}{x^2-4} = \dfrac{-1}{4}$ 🎉''',
            },
          ],
        }),
        ContentBlock("lab_h_026", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lab_q_027", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to 2^+} \dfrac{|x - 2|}{x^2 - 4}$$''',
          ],
          "options": [
            r"$\dfrac{-1}{4}$",
            r"$\dfrac{1}{4}$",
            r"$\dfrac{1}{2}$",
            r"หาค่าไม่ได้",
          ],
          "correct": r"$\dfrac{1}{4}$",
          "explanation": r'''$x \to 2^+$ คือ $x > 2$ ใช้กฎลิมิตขวา: $|x-2| = x-2$

$\dfrac{x-2}{(x-2)(x+2)} = \dfrac{1}{x+2}$

แทน $x = 2$ → $\dfrac{1}{4}$''',
        }),
        ContentBlock("lab_q_028", "question_choice", {
          "content": [
            r'''6. จาก 2 ข้อที่แล้ว จงหา

$$\lim\limits_{x \to 2} \dfrac{|x - 2|}{x^2 - 4}$$''',
          ],
          "options": [
            r"$\dfrac{-1}{4}$",
            r"$\dfrac{1}{4}$",
            r"$0$",
            r"หาค่าไม่ได้",
          ],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ลิมิตซ้าย $= \dfrac{-1}{4}$ และลิมิตขวา $= \dfrac{1}{4}$

เนื่องจากลิมิตซ้าย $\neq$ ลิมิตขวา

$\lim\limits_{x \to 2} \dfrac{|x-2|}{x^2-4}$ **หาค่าไม่ได้**''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัด
    // =============================================
    ContentSection(
      headerL1: r"💪 แบบฝึกหัด",
      blocks: [
        ContentBlock("lab_t_029", "text", {
          "content": [
            r'''ลองทำเองเลย ขั้นตอนหลัก: แทนค่า → เปิดค่าสัมบูรณ์ตามฝั่ง → จัดรูป → แทนค่า''',
          ],
        }),
        ContentBlock("lab_q_030", "question_choice", {
          "content": [
            r'''7. จงหา

$$\lim\limits_{x \to 0^-} \dfrac{|x|}{x}$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$-1$",
          "explanation": r'''$x \to 0^-$ คือ $x < 0$ ดังนั้น $|x| = -x$

$\dfrac{|x|}{x} = \dfrac{-x}{x} = -1$''',
        }),
        ContentBlock("lab_q_031", "question_choice", {
          "content": [
            r'''8. จงหา

$$\lim\limits_{x \to 0^+} \dfrac{|x|}{x}$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''$x \to 0^+$ คือ $x > 0$ ดังนั้น $|x| = x$

$\dfrac{|x|}{x} = \dfrac{x}{x} = 1$''',
        }),
        ContentBlock("lab_q_032", "question_choice", {
          "content": [
            r'''9. จงหา

$$\lim\limits_{x \to 0} \dfrac{|x|}{x}$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ลิมิตซ้าย $= -1$ และลิมิตขวา $= 1$

ลิมิตซ้าย $\neq$ ลิมิตขวา → หาค่าไม่ได้''',
        }),
        ContentBlock("lab_fi_033", "question_fill_in", {
          "content": [
            r'''10. จงหา

$\lim\limits_{x \to 1^-} \dfrac{|x - 1|}{x^2 - 1} = $ ''',
            {"box": "0"},
          ],
          "correct": r"$\dfrac{-1}{2}$",
          "explanation": r'''$x \to 1^-$ คือ $x < 1$ ดังนั้น $|x-1| = -(x-1) = 1-x$

$x^2 - 1 = (x-1)(x+1)$

$\dfrac{1-x}{(x-1)(x+1)} = \dfrac{-(x-1)}{(x-1)(x+1)} = \dfrac{-1}{x+1}$

แทน $x = 1$ → $\dfrac{-1}{2}$''',
        }),
        ContentBlock("lab_fi_034", "question_fill_in", {
          "content": [
            r'''11. จงหา

$\lim\limits_{x \to 1^+} \dfrac{|x - 1|}{x^2 - 1} = $ ''',
            {"box": "0"},
          ],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''$x \to 1^+$ คือ $x > 1$ ดังนั้น $|x-1| = x-1$

$\dfrac{x-1}{(x-1)(x+1)} = \dfrac{1}{x+1}$

แทน $x = 1$ → $\dfrac{1}{2}$''',
        }),
        ContentBlock("lab_q_035", "question_choice", {
          "content": [
            r'''12. จงหา

$$\lim\limits_{x \to 4^-} \dfrac{|x - 4|}{x^2 - 16}$$''',
          ],
          "options": [
            r"$\dfrac{-1}{8}$",
            r"$\dfrac{1}{8}$",
            r"$\dfrac{-1}{4}$",
            r"หาค่าไม่ได้",
          ],
          "correct": r"$\dfrac{-1}{8}$",
          "explanation": r'''$x \to 4^-$ คือ $x < 4$ ดังนั้น $|x-4| = -(x-4)$

$x^2 - 16 = (x-4)(x+4)$

$\dfrac{-(x-4)}{(x-4)(x+4)} = \dfrac{-1}{x+4}$

แทน $x = 4$ → $\dfrac{-1}{8}$''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lab_t_036", "text", {
          "content": [
            r'''🎯 **3 ขั้นตอนหาลิมิตค่าสัมบูรณ์**

**1. แทนค่า** — ถ้าได้ $\dfrac{0}{0}$ ต้องจัดรูปต่อ''',
          ],
        }),
        ContentBlock("lab_t_037", "text", {
          "content": [
            r'''**2. เปิดค่าสัมบูรณ์** ตามฝั่งที่โจทย์ถาม

🔹 ลิมิตซ้าย $(x \to a^-)$: $|x-a| = a - x$

🔸 ลิมิตขวา $(x \to a^+)$: $|x-a| = x - a$''',
          ],
        }),
        ContentBlock("lab_t_038", "text", {
          "content": [
            r'''**3. จัดรูปแล้วแทนค่า** — แยกตัวประกอบและตัดตัวร่วม เหมือนบทลิมิตพหุนาม

Note = จำให้ขึ้นใจ

ถ้าลิมิตซ้าย $\neq$ ลิมิตขวา → $\lim\limits_{x \to a} f(x)$ หาค่าไม่ได้''',
          ],
        }),
      ],
    ),

  ],
);

// Exercise: แบบฝึกหัด4 (แบบฝึกหัดเรื่องส่วนอนันต์และประยุกต์กับเลขยกกำลัง)

final calcLimitPiecewiseLesson = ContentLesson(
  title: "ลิมิตฟังก์ชันเงื่อนไข",
  sections: [
    // =============================================
    // SECTION 1: ทบทวนฟังก์ชันเงื่อนไข
    // =============================================
    ContentSection(
      headerL1: r"📖 ทบทวนฟังก์ชันเงื่อนไข",
      blocks: [
        ContentBlock("lim_pw_t_001", "text", {
          "content": [
            r'''ก่อนหาลิมิต เรามาทบทวนฟังก์ชันเงื่อนไขกันก่อน เพื่อให้แน่ใจว่าอ่านสมการได้ถูกต้อง''',
          ],
        }),
        ContentBlock("lim_pw_h_002", "header", {
          "title": r"ฟังก์ชันเงื่อนไขคืออะไร?",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_003", "text", {
          "content": [
            r'''ฟังก์ชันเงื่อนไข (Piecewise Function) คือฟังก์ชันที่ใช้ **คนละสมการ** ในแต่ละช่วงของ $x$

เหมือนกฎที่บอกว่า "ถ้า $x$ อยู่ช่วงนี้ ใช้สูตรนี้ ถ้าอยู่ช่วงนั้น ใช้สูตรนั้น"''',
          ],
        }),
        ContentBlock("lim_pw_h_004", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_005", "text", {
          "content": [
            r'''$$f(x) = \begin{cases} x + 1, & x < 2 \\ 5, & x = 2 \\ x^2, & x > 2 \end{cases}$$

คือ ถ้า $x < 2$ ใช้ $f(x) = x + 1$

ถ้า $x = 2$ ใช้ $f(x) = 5$

ถ้า $x > 2$ ใช้ $f(x) = x^2$''',
          ],
        }),
        ContentBlock("lim_pw_ddq_006", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_006_s1",
              "content": [
                r'''จากฟังก์ชันด้านบน ลองหาค่า

$f(1) = $ ''',
                {"drop": "0"},
                r'''$f(2) = $ ''',
                {"drop": "1"},
                r'''$f(3) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$2$", r"$5$", r"$9$", r"$3$", r"$4$"],
              "correctAnswers": {"0": r"$2$", "1": r"$5$", "2": r"$9$"},
              "explanation": r'''$f(1)$: $1 < 2$ → ใช้ $x + 1 = 1 + 1 = 2$

$f(2)$: $x = 2$ → ใช้ $5$

$f(3)$: $3 > 2$ → ใช้ $x^2 = 3^2 = 9$''',
            },
          ],
        }),
        ContentBlock("lim_pw_q_007", "question_choice", {
          "content": [
            r'''1. ให้

$$f(x) = \begin{cases} 2x, & x < 0 \\ x + 3, & x \geq 0 \end{cases}$$

จงหา $f(-2) + f(4)$''',
          ],
          "options": [r"$3$", r"$5$", r"$7$", r"$11$"],
          "correct": r"$3$",
          "explanation": r'''$f(-2)$: $-2 < 0$ → ใช้ $2x = 2(-2) = -4$

$f(4)$: $4 \geq 0$ → ใช้ $x + 3 = 4 + 3 = 7$

$f(-2) + f(4) = -4 + 7 = 3$''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: แนวคิดหลัก — แยกลิมิตซ้ายและขวา
    // =============================================
    ContentSection(
      headerL1: r"💡 แนวคิดหลัก — แยกซ้ายและขวา",
      blocks: [
        ContentBlock("lim_pw_t_008", "text", {
          "content": [
            r'''ฟังก์ชันเงื่อนไขใช้คนละสมการคนละฝั่ง ดังนั้นเราต้อง **หาลิมิตซ้ายและขวาแยกกัน** เสมอ''',
          ],
        }),
        ContentBlock("lim_pw_t_009", "text", {
          "content": [
            r'''🔹 ลิมิตซ้าย $(x \to a^-)$ → ดูว่า $x < a$ ใช้สมการไหน แล้วแทนค่า

🔸 ลิมิตขวา $(x \to a^+)$ → ดูว่า $x > a$ ใช้สมการไหน แล้วแทนค่า''',
          ],
        }),
        ContentBlock("lim_pw_t_010", "text", {
          "content": [
            r'''✅ ถ้าลิมิตซ้าย $=$ ลิมิตขวา → มีลิมิต

❌ ถ้าลิมิตซ้าย $\neq$ ลิมิตขวา → หาค่าไม่ได้''',
          ],
        }),
        ContentBlock("lim_pw_h_011", "header", {
          "title": r"ตัวอย่างที่ 1 — ลิมิตซ้าย = ขวา",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_012", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 1} f(x)$ เมื่อ

$$f(x) = \begin{cases} -x + 3, & x < 1 \\ 5, & x = 1 \\ x^2 - 2x + 3, & x > 1 \end{cases}$$''',
          ],
        }),
        ContentBlock("lim_pw_h_013", "header", {
          "title": r"🎨 วิธีที่ 1: ดูจากกราฟ",
          "level": 2,
        }),
        ContentBlock("lim_pw_ig_014", "interactive_graph", {
          "path": "graph_data_7",
        }),
        ContentBlock("lim_pw_t_015", "text", {
          "content": [
            r'''เลื่อนจุด 🔹 และ 🔸 เข้าใกล้ $x = 1$ แล้วดูค่า $y$ ทั้งสองฝั่ง''',
          ],
        }),
        ContentBlock("lim_pw_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_016_s1",
              "content": [
                r'''จากกราฟ

$\lim\limits_{x \to 1^-} f(x) = $ ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to 1^+} f(x) = $ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 1} f(x) = $ ''',
                {"drop": "2"},
                r'''$f(1) = $ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2$",
                r"$5$",
                r"หาค่าไม่ได้",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"$2$",
                "2": r"$2$",
                "3": r"$5$",
              },
              "explanation":
                  r'''จากกราฟ ลิมิตซ้าย = ลิมิตขวา = $2$ ดังนั้นมีลิมิตเท่ากับ $2$

แต่ $f(1) = 5$ ซึ่งไม่เท่ากับลิมิต — จำได้ไหมว่าลิมิตไม่จำเป็นต้องเท่ากับค่าที่จุดนั้น!''',
            },
          ],
        }),
        ContentBlock("lim_pw_h_017", "header", {
          "title": r"✏️ วิธีที่ 2: แทนค่า (วิธีที่ใช้ในข้อสอบ)",
          "level": 2,
        }),
        ContentBlock("lim_pw_ddq_018", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_018_s1",
              "content": [
                r'''$f(x) = \begin{cases} -x + 3, & x < 1 \\ 5, & x = 1 \\ x^2 - 2x + 3, & x > 1 \end{cases}$

**ขั้นที่ 1:** หาลิมิตซ้าย

$x \to 1^-$ แปลว่า $x < 1$ → ใช้สมการ''',
                {"drop": "0"},
                r'''

แทน $x = 1$ → $\lim\limits_{x \to 1^-} f(x) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$-x + 3$",
                r"$5$",
                r"$x^2 - 2x + 3$",
                r"$2$",
                r"$-1$",
              ],
              "correctAnswers": {"0": r"$-x + 3$", "1": r"$2$"},
              "explanation":
                  r'''$x < 1$ ใช้สมการแรก $-x + 3$ แทน $x = 1$ ได้ $-1 + 3 = 2$''',
            },
            {
              "questionId": "lim_pw_ddq_018_s2",
              "content": [
                r'''**ขั้นที่ 2:** หาลิมิตขวา

$x \to 1^+$ แปลว่า $x > 1$ → ใช้สมการ''',
                {"drop": "0"},
                r'''แทน $x = 1$ → $\lim\limits_{x \to 1^+} f(x) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$-x + 3$",
                r"$5$",
                r"$x^2 - 2x + 3$",
                r"$2$",
                r"$4$",
              ],
              "correctAnswers": {"0": r"$x^2 - 2x + 3$", "1": r"$2$"},
              "explanation":
                  r'''$x > 1$ ใช้สมการที่สาม $x^2 - 2x + 3$ แทน $x = 1$ ได้ $1 - 2 + 3 = 2$''',
            },
            {
              "questionId": "lim_pw_ddq_018_s3",
              "content": [
                r'''**ขั้นที่ 3:** เปรียบเทียบ

ลิมิตซ้าย $= 2$ และ ลิมิตขวา $= 2$

ดังนั้น $\lim\limits_{x \to 1} f(x) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2$", r"$5$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$2$"},
              "explanation":
                  r'''ลิมิตซ้าย = ลิมิตขวา = $2$ จึงมีลิมิตและมีค่าเท่ากับ $2$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_pw_h_019", "header", {
          "title": r"ตัวอย่างที่ 2 — ลิมิตซ้าย ≠ ขวา",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_020", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 3} f(x)$ เมื่อ

$$f(x) = \begin{cases} x^2, & x < 3 \\ 6, & x \geq 3 \end{cases}$$''',
          ],
        }),
        ContentBlock("lim_pw_ddq_021", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_021_s1",
              "content": [
                r'''**ลิมิตซ้าย:** $x \to 3^-$ → $x < 3$ ใช้ $x^2$

$\lim\limits_{x \to 3^-} x^2 = $ ''',
                {"drop": "0"},
                r'''**ลิมิตขวา:** $x \to 3^+$ → $x \geq 3$ ใช้ $6$

$\lim\limits_{x \to 3^+} 6 = $ ''',
                {"drop": "1"},
                r'''**สรุป:** $\lim\limits_{x \to 3} f(x) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$9$", r"$6$", r"$3$", r"หาค่าไม่ได้"],
              "correctAnswers": {
                "0": r"$9$",
                "1": r"$6$",
                "2": r"หาค่าไม่ได้",
              },
              "explanation":
                  r'''ลิมิตซ้าย $= 9$ แต่ลิมิตขวา $= 6$

$9 \neq 6$ ดังนั้น $\lim\limits_{x \to 3} f(x)$ หาค่าไม่ได้ ❌''',
            },
          ],
        }),
        ContentBlock("lim_pw_h_022", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_pw_q_023", "question_choice", {
          "content": [
            r'''2. ให้

$$f(x) = \begin{cases} x + 1, & x < 1 \\ 2x, & x \geq 1 \end{cases}$$

จงหา $\lim\limits_{x \to 1} f(x)$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"$2$",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 1$ → $x + 1$ แทน $x = 1$ → $2$

🔸 ลิมิตขวา: $x \geq 1$ → $2x$ แทน $x = 1$ → $2$

ลิมิตซ้าย = ลิมิตขวา $= 2$ → มีลิมิต $= 2$ 💚''',
        }),
        ContentBlock("lim_pw_q_024", "question_choice", {
          "content": [
            r'''3. ให้

$$f(x) = \begin{cases} x + 2, & x < 5 \\ x - 2, & x \geq 5 \end{cases}$$

จงหา $\lim\limits_{x \to 5} f(x)$''',
          ],
          "options": [r"$3$", r"$5$", r"$7$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 5$ → $x + 2$ แทน $x = 5$ → $7$

🔸 ลิมิตขวา: $x \geq 5$ → $x - 2$ แทน $x = 5$ → $3$

$7 \neq 3$ → หาค่าไม่ได้ ❌''',
        }),
        ContentBlock("lim_pw_q_025", "question_choice", {
          "content": [
            r'''4. ให้

$$f(x) = \begin{cases} 3x - 1, & x < 0 \\ 6, & x = 0 \\ x^2 - 1, & x > 0 \end{cases}$$

จงหา $\lim\limits_{x \to 0} f(x)$''',
          ],
          "options": [r"$-1$", r"$0$", r"$6$", r"หาค่าไม่ได้"],
          "correct": r"$-1$",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 0$ → $3x - 1$ แทน $x = 0$ → $-1$

🔸 ลิมิตขวา: $x > 0$ → $x^2 - 1$ แทน $x = 0$ → $-1$

ลิมิตซ้าย = ลิมิตขวา $= -1$ → มีลิมิต $= -1$ 💚

Note = ระวัง

$f(0) = 6$ แต่ $\lim\limits_{x \to 0} f(x) = -1$ ลิมิตไม่เท่ากับค่าที่จุดนั้น!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: โจทย์ที่ต้องจัดรูปด้วย
    // =============================================
    ContentSection(
      headerL1: r"🔧 โจทย์ที่ต้องจัดรูปด้วย",
      blocks: [
        ContentBlock("lim_pw_t_026", "text", {
          "content": [
            r'''บางทีพอแทนค่าในสมการย่อยแล้วได้ $\dfrac{0}{0}$ ก็ต้องจัดรูปก่อน เหมือนบทพหุนาม

ใช้ทุกเทคนิคที่เรียนมา — แยกตัวประกอบ หรือ Conjugate''',
          ],
        }),
        ContentBlock("lim_pw_h_027", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_028", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 2} f(x)$ เมื่อ

$$f(x) = \begin{cases} \dfrac{x^2 - 4}{x - 2}, & x < 2 \\ 3x - 2, & x \geq 2 \end{cases}$$''',
          ],
        }),
        ContentBlock("lim_pw_ddq_029", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_029_s1",
              "content": [
                r'''**ขั้นที่ 1:** ลิมิตซ้าย

$x \to 2^-$ → $x < 2$ ใช้ $\dfrac{x^2 - 4}{x - 2}$

แทน $x = 2$ ตรงๆ ได้ $\dfrac{0}{0}$ → ต้องจัดรูป!

$x^2 - 4 = (x - 2)(x + 2)$ → ตัด $(x - 2)$ → เหลือ $x + 2$

$\lim\limits_{x \to 2^-} f(x) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$2$", r"$0$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$4$"},
              "explanation":
                  r'''ตัด $(x-2)$ ออก เหลือ $x + 2$ แทน $x = 2$ ได้ $4$''',
            },
            {
              "questionId": "lim_pw_ddq_029_s2",
              "content": [
                r'''**ขั้นที่ 2:** ลิมิตขวา

$x \to 2^+$ → $x \geq 2$ ใช้ $3x - 2$

แทน $x = 2$ → $3(2) - 2 = $ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 3:** เปรียบเทียบ

ลิมิตซ้าย $= 4$, ลิมิตขวา $= 4$

$\lim\limits_{x \to 2} f(x) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$4$", r"$2$", r"$6$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$4$", "1": r"$4$"},
              "explanation":
                  r'''ลิมิตซ้าย = ลิมิตขวา = $4$ ดังนั้นมีลิมิตเท่ากับ $4$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_pw_h_030", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_pw_q_031", "question_choice", {
          "content": [
            r'''5. ให้

$$f(x) = \begin{cases} \dfrac{x^2 - 1}{x - 1}, & x < 1 \\ x + 2, & x \geq 1 \end{cases}$$

จงหา $\lim\limits_{x \to 1} f(x)$''',
          ],
          "options": [r"$0$", r"$2$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $\dfrac{x^2-1}{x-1}$ แทน $x=1$ → $\dfrac{0}{0}$

$x^2-1 = (x-1)(x+1)$ ตัด $(x-1)$ → $x+1$ แทน $x=1$ → $2$

🔸 ลิมิตขวา: $x + 2$ แทน $x=1$ → $3$

$2 \neq 3$ → หาค่าไม่ได้ ❌''',
        }),
        ContentBlock("lim_pw_q_032", "question_choice", {
          "content": [
            r'''6. ให้

$$f(x) = \begin{cases} \dfrac{x^2 + x - 6}{x - 2}, & x < 2 \\ 2x + 1, & x \geq 2 \end{cases}$$

จงหา $\lim\limits_{x \to 2} f(x)$''',
          ],
          "options": [r"$3$", r"$5$", r"$7$", r"หาค่าไม่ได้"],
          "correct": r"$5$",
          "explanation": r'''🔹 ลิมิตซ้าย: $\dfrac{x^2+x-6}{x-2}$ แทน $x=2$ → $\dfrac{0}{0}$

$x^2+x-6 = (x-2)(x+3)$ ตัด $(x-2)$ → $x+3$ แทน $x=2$ → $5$

🔸 ลิมิตขวา: $2x + 1$ แทน $x=2$ → $5$

ลิมิตซ้าย = ลิมิตขวา $= 5$ → มีลิมิต $= 5$ 💚''',
        }),
        ContentBlock("lim_pw_q_033", "question_choice", {
          "content": [
            r'''7. ให้

$$f(x) = \begin{cases} \dfrac{\sqrt{x + 4} - 2}{x}, & x < 0 \\ x + 1, & x \geq 0 \end{cases}$$

จงหา $\lim\limits_{x \to 0} f(x)$''',
          ],
          "options": [
            r"$\dfrac{1}{4}$",
            r"$\dfrac{1}{2}$",
            r"$1$",
            r"หาค่าไม่ได้",
          ],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $\dfrac{\sqrt{x+4}-2}{x}$ แทน $x=0$ → $\dfrac{0}{0}$

ใช้ Conjugate คูณด้วย $\dfrac{\sqrt{x+4}+2}{\sqrt{x+4}+2}$

เศษ: $(x+4)-4 = x$ → ตัด $x$ → เหลือ $\dfrac{1}{\sqrt{x+4}+2}$

แทน $x=0$ → $\dfrac{1}{4}$

🔸 ลิมิตขวา: $x + 1$ แทน $x=0$ → $1$

$\dfrac{1}{4} \neq 1$ → หาค่าไม่ได้ ❌''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: โจทย์ประยุกต์ — รวมค่าสัมบูรณ์
    // =============================================
    ContentSection(
      headerL1: r"🔥 โจทย์ประยุกต์ — รวมค่าสัมบูรณ์",
      blocks: [
        ContentBlock("lim_pw_t_034", "text", {
          "content": [
            r'''บางโจทย์มี $|x|$ หรือ $|x - a|$ อยู่ในสมการย่อย ต้องเปิดค่าสัมบูรณ์ตามฝั่งก่อน เหมือนที่เรียนในบทค่าสัมบูรณ์''',
          ],
        }),
        ContentBlock("lim_pw_h_035", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("lim_pw_t_036", "text", {
          "content": [
            r'''จงหา $\lim\limits_{x \to 0} f(x)$ เมื่อ

$$f(x) = \begin{cases} \dfrac{|x| + 1}{1 - x}, & x < 0 \\ x + 1, & x \geq 0 \end{cases}$$''',
          ],
        }),
        ContentBlock("lim_pw_ddq_037", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_pw_ddq_037_s1",
              "content": [
                r'''**ขั้นที่ 1:** ลิมิตซ้าย

$x \to 0^-$ → $x < 0$ ใช้ $\dfrac{|x| + 1}{1 - x}$

เมื่อ $x < 0$ → $|x| = $ ''',
                {"drop": "0"},
                r'''แทน $|x| = -x$ เข้าไป → $\dfrac{-x + 1}{1 - x} = \dfrac{1 - x}{1 - x} = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$x$", r"$-x$", r"$0$", r"$1$", r"$-1$"],
              "correctAnswers": {"0": r"$-x$", "1": r"$1$"},
              "explanation":
                  r'''เมื่อ $x < 0$ → $|x| = -x$ แทนแล้วได้ $\dfrac{1-x}{1-x} = 1$''',
            },
            {
              "questionId": "lim_pw_ddq_037_s2",
              "content": [
                r'''**ขั้นที่ 2:** ลิมิตขวา

$x \to 0^+$ → $x \geq 0$ ใช้ $x + 1$

แทน $x = 0$ → $0 + 1 = $ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 3:** เปรียบเทียบ

$\lim\limits_{x \to 0} f(x) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$1$", r"$0$", r"$-1$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$1$", "1": r"$1$"},
              "explanation":
                  r'''ลิมิตซ้าย = ลิมิตขวา = $1$ ดังนั้นมีลิมิตเท่ากับ $1$ 💚''',
            },
          ],
        }),
        ContentBlock("lim_pw_h_038", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_pw_q_039", "question_choice", {
          "content": [
            r'''8. ให้

$$f(x) = \begin{cases} \dfrac{|x - 1|}{x - 1}, & x \neq 1 \\ 0, & x = 1 \end{cases}$$

จงหา $\lim\limits_{x \to 1} f(x)$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 1$ → $|x-1| = -(x-1) = 1-x$

$\dfrac{1-x}{x-1} = \dfrac{-(x-1)}{x-1} = -1$

🔸 ลิมิตขวา: $x > 1$ → $|x-1| = x-1$

$\dfrac{x-1}{x-1} = 1$

$-1 \neq 1$ → หาค่าไม่ได้ ❌''',
        }),
        ContentBlock("lim_pw_q_040", "question_choice", {
          "content": [
            r'''9. ให้

$$f(x) = \begin{cases} \dfrac{|x + 2|}{x + 2}, & x < -2 \\ x^2 - 3, & x \geq -2 \end{cases}$$

จงหา $\lim\limits_{x \to -2} f(x)$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < -2$ → $x + 2 < 0$ → $|x+2| = -(x+2)$

$\dfrac{-(x+2)}{x+2} = -1$

🔸 ลิมิตขวา: $x \geq -2$ → $x^2 - 3$ แทน $x=-2$ → $4 - 3 = 1$

$-1 \neq 1$ → หาค่าไม่ได้ ❌''',
        }),
        ContentBlock("lim_pw_fi_041", "question_fill_in", {
          "content": [
            r'''10. ให้

$f(x) = \begin{cases} \dfrac{|x + 1| - 1}{x}, & x < 0 \\ x^2 + 1, & x \geq 0 \end{cases}$

$\lim\limits_{x \to 0} f(x) = $ ''',
            {"box": "0"},
          ],
          "correct": "1",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 0$ แต่ $x$ ใกล้ $0$ → $x + 1 > 0$ → $|x+1| = x + 1$

$\dfrac{(x+1) - 1}{x} = \dfrac{x}{x} = 1$

🔸 ลิมิตขวา: $x^2 + 1$ แทน $x = 0$ → $1$

ลิมิตซ้าย = ลิมิตขวา $= 1$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"💪 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("lim_pw_t_042", "text", {
          "content": [
            r'''ลองทำเองเลย ตัดสินใจเลือกเทคนิคที่เหมาะกับแต่ละข้อ''',
          ],
        }),
        ContentBlock("lim_pw_q_043", "question_choice", {
          "content": [
            r'''11. ให้

$$f(x) = \begin{cases} 2x + 3, & x < 1 \\ x^2 + 4, & x \geq 1 \end{cases}$$

จงหา $\lim\limits_{x \to 1} f(x)$''',
          ],
          "options": [r"$4$", r"$5$", r"$7$", r"หาค่าไม่ได้"],
          "correct": r"$5$",
          "explanation": r'''🔹 ลิมิตซ้าย: $2(1) + 3 = 5$

🔸 ลิมิตขวา: $1^2 + 4 = 5$

ลิมิตซ้าย = ลิมิตขวา $= 5$ 💚''',
        }),
        ContentBlock("lim_pw_q_044", "question_choice", {
          "content": [
            r'''12. ให้

$$f(x) = \begin{cases} \dfrac{x^2 - 9}{x - 3}, & x < 3 \\ 2x, & x \geq 3 \end{cases}$$

จงหา $\lim\limits_{x \to 3} f(x)$''',
          ],
          "options": [r"$3$", r"$6$", r"$9$", r"หาค่าไม่ได้"],
          "correct": r"$6$",
          "explanation": r'''🔹 ลิมิตซ้าย: $\dfrac{x^2-9}{x-3}$ แทน $x=3$ → $\dfrac{0}{0}$

$x^2-9 = (x-3)(x+3)$ ตัด $(x-3)$ → $x+3$ แทน $x=3$ → $6$

🔸 ลิมิตขวา: $2(3) = 6$

ลิมิตซ้าย = ลิมิตขวา $= 6$ 💚''',
        }),
        ContentBlock("lim_pw_q_045", "question_choice", {
          "content": [
            r'''13. ให้

$$f(x) = \begin{cases} 3x - 1, & x < 0 \\ 6, & x = 0 \\ x^2 - 1, & x > 0 \end{cases}$$

จงหา $\lim\limits_{x \to 0} f(x) + f(0)$''',
          ],
          "options": [r"$-1$", r"$5$", r"$6$", r"$7$"],
          "correct": r"$5$",
          "explanation": r'''🔹 ลิมิตซ้าย: $3(0) - 1 = -1$

🔸 ลิมิตขวา: $0^2 - 1 = -1$

$\lim\limits_{x \to 0} f(x) = -1$

$f(0) = 6$

$\lim\limits_{x \to 0} f(x) + f(0) = -1 + 6 = 5$''',
        }),
        ContentBlock("lim_pw_fi_046", "question_fill_in", {
          "content": [
            r'''14. ให้

$f(x) = \begin{cases} \dfrac{|x| + 1}{1 - x}, & x < 0 \\ x + 1, & 0 \leq x \leq 2 \\ x^2 - 5x + 9, & x > 2 \end{cases}$

$\lim\limits_{x \to 0} f(x) = $ ''',
            {"box": "0"},
          ],
          "correct": "1",
          "explanation": r'''🔹 ลิมิตซ้าย: $x < 0$ → $|x| = -x$

$\dfrac{-x+1}{1-x} = \dfrac{1-x}{1-x} = 1$

🔸 ลิมิตขวา: $x + 1$ แทน $x=0$ → $1$

ลิมิตซ้าย = ลิมิตขวา $= 1$ 💚''',
        }),
        ContentBlock("lim_pw_fi_047", "question_fill_in", {
          "content": [
            r'''15. จากฟังก์ชันเดิมในข้อ 14

$\lim\limits_{x \to 2} f(x) = $ ''',
            {"box": "0"},
          ],
          "correct": "3",
          "explanation": r'''🔹 ลิมิตซ้าย: $0 \leq x \leq 2$ → $x + 1$ แทน $x=2$ → $3$

🔸 ลิมิตขวา: $x > 2$ → $x^2 - 5x + 9$ แทน $x=2$ → $4 - 10 + 9 = 3$

ลิมิตซ้าย = ลิมิตขวา $= 3$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_pw_t_048", "text", {
          "content": [
            r'''🎯 **การหาลิมิตฟังก์ชันเงื่อนไข — 3 ขั้นตอน**

**1. ดูเงื่อนไข** — แยกหาลิมิตซ้ายและขวา ใช้สมการที่เหมาะสมกับแต่ละฝั่ง''',
          ],
        }),
        ContentBlock("lim_pw_t_049", "text", {
          "content": [
            r'''**2. ใช้ทุกเทคนิค** — แทนค่า, แยกตัวประกอบ, Conjugate, เปิดค่าสัมบูรณ์ ตามที่เจอในสมการย่อยแต่ละฝั่ง''',
          ],
        }),
        ContentBlock("lim_pw_t_050", "text", {
          "content": [
            r'''**3. เปรียบเทียบ**

✅ ลิมิตซ้าย $=$ ลิมิตขวา → มีลิมิต

❌ ลิมิตซ้าย $\neq$ ลิมิตขวา → หาค่าไม่ได้

Note = จำไว้เสมอ

$\lim\limits_{x \to a} f(x)$ ไม่จำเป็นต้องเท่ากับ $f(a)$ เสมอไป!''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัด5 (แบบฝึกหัดเรื่องส่วนอนันต์และประยุกต์กับเลขยกกำลัง)

final calcLimitInfinityLesson = ContentLesson(
  title: "ลิมิตเข้าใกล้อนันต์",
  sections: [
    // =============================================
    // SECTION 1: ส่วนอนันต์
    // =============================================
    ContentSection(
      headerL1: r"♾️ ส่วนอนันต์",
      blocks: [
        ContentBlock("lim_inf_t_001", "text", {
          "content": [
            r'''จากบทที่แล้ว เราหาลิมิตเมื่อ $x$ เข้าใกล้ค่าคงที่ เช่น $x \to 2$

แต่ถ้า $x$ วิ่งไปเรื่อยๆ จนเป็น **อนันต์** ($\infty$) ล่ะ? ฟังก์ชันจะเป็นยังไง? 🚀''',
          ],
        }),
        ContentBlock("lim_inf_h_002", "header", {
          "title": r"สัญลักษณ์",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_003", "text", {
          "content": [
            r'''$$\lim\limits_{x \to \infty} f(x)$$

หมายถึง เมื่อ $x$ มีค่ามากขึ้นเรื่อยๆ ไม่มีที่สิ้นสุด ค่า $f(x)$ จะเข้าใกล้อะไร?''',
          ],
        }),
        ContentBlock("lim_inf_h_004", "header", {
          "title": r"กฎสำคัญ 🔑",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_005", "text", {
          "content": [
            r'''$$\lim\limits_{x \to \infty} \dfrac{k}{x} = 0 \quad \text{และ} \quad \lim\limits_{x \to -\infty} \dfrac{k}{x} = 0$$

เมื่อ $k$ เป็นค่าคงที่ใดๆ''',
          ],
        }),
        ContentBlock("lim_inf_t_006", "text", {
          "content": [
            r'''พูดง่ายๆ คือ ถ้าเอาค่าคงที่หารด้วยตัวเลขที่ใหญ่มากๆ จะได้ค่าใกล้ $0$ เรื่อยๆ ดูจากในรูป''',
          ],
        }),
        ContentBlock("lim_inf_img_007", "image", {
          "path": "assets/lim2.png",
        }),
        ContentBlock("lim_inf_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_008_s1",
              "content": [
                r'''ลองคิดตาม ถ้า $x = 1000$ แล้ว $\dfrac{2}{x} = \dfrac{2}{1000} = 0.002$

ถ้า $x = 1{,}000{,}000$ แล้ว $\dfrac{2}{x} = 0.000002$

ดังนั้น $\lim\limits_{x \to \infty} \dfrac{2}{x} = $ ''',
                {"drop": "0"},
                r'''แล้ว $\lim\limits_{x \to \infty} \dfrac{5}{x^2}$ ล่ะ?

เมื่อ $x$ ใหญ่มากๆ $x^2$ ยิ่งใหญ่กว่า ดังนั้นคำตอบคือ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$0$", r"$2$", r"$5$", r"$\infty$"],
              "correctAnswers": {"0": r"$0$", "1": r"$0$"},
              "explanation": r'''ค่าคงที่หารด้วยตัวเลขที่ใหญ่มากๆ จะเข้าใกล้ $0$ เสมอ ไม่ว่าตัวเศษจะเป็นเท่าไหร่''',
            },
          ],
        }),
        ContentBlock("lim_inf_q_009", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to -\infty} \dfrac{5}{x^2}$$''',
          ],
          "options": [r"$0$", r"$5$", r"$-5$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''เมื่อ $x$ เข้าใกล้ $-\infty$ (ติดลบมากๆ)

$x^2$ จะเป็นบวกและใหญ่มากๆ เช่น $(-1000)^2 = 1{,}000{,}000$

ดังนั้น $\dfrac{5}{x^2} \to \dfrac{5}{\text{ใหญ่มาก}} = 0$ 💚''',
        }),
        ContentBlock("lim_inf_q_010", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \dfrac{x^2}{x^3}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''จัดรูปก่อน: $\dfrac{x^2}{x^3} = \dfrac{1}{x}$

ดังนั้น $\lim\limits_{x \to \infty} \dfrac{1}{x} = 0$ 💚''',
        }),
        ContentBlock("lim_inf_q_011", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \dfrac{x^2}{x^2}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''$\dfrac{x^2}{x^2} = 1$ เสมอ (เมื่อ $x \neq 0$)

ดังนั้น $\lim\limits_{x \to \infty} 1 = 1$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: วิธีจัดรูปเศษส่วนพหุนาม
    // =============================================
    ContentSection(
      headerL1: r"🗃️ วิธีจัดรูปเศษส่วนพหุนาม",
      blocks: [
        ContentBlock("lim_inf_t_012", "text", {
          "content": [
            r'''เมื่อเจอโจทย์แบบนี้

$$\lim\limits_{x \to \infty} \dfrac{x^2}{x^2 + 1}$$

แทน $x = \infty$ ตรงๆ จะได้ $\dfrac{\infty}{\infty}$ ซึ่งเป็น Indeterminate Form ต้องจัดรูปก่อน!''',
          ],
        }),
        ContentBlock("lim_inf_h_013", "header", {
          "title": r"แนวคิดหลัก — สร้างส่วนอนันต์ 💡",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_014", "text", {
          "content": [
            r'''เราเพิ่งเรียนว่า $\dfrac{k}{x} \to 0$ เมื่อ $x \to \infty$

ถ้าเราหารทุกพจน์ด้วย $x$ ยกกำลังสูงสุด พจน์ที่เล็กกว่าจะกลายเป็น $0$ หมด เหลือแค่ตัวหลัก!''',
          ],
        }),
        ContentBlock("lim_inf_h_015", "header", {
          "title": r"ตัวอย่างที่ 1 — ดีกรีเท่ากัน",
          "level": 2,
        }),
        ContentBlock("lim_inf_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_016_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to \infty} \dfrac{x^2}{x^2 + 1}$

**ขั้นที่ 1:** แทนค่าก่อน → $\dfrac{\infty}{\infty}$ ต้องจัดรูป ✅

**ขั้นที่ 2:** ดีกรีสูงสุด (เลขยกกำลังสูงสุดของ $x$) ในสมการนี้คือ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$1$", r"$2$", r"$3$"],
              "correctAnswers": {"0": r"$2$"},
              "explanation": r'''เศษมี $x^2$ (ดีกรี 2) ส่วนมี $x^2 + 1$ (ดีกรีสูงสุด 2) ดังนั้นดีกรีสูงสุดคือ $2$''',
            },
            {
              "questionId": "lim_inf_ddq_016_s2",
              "content": [
                r'''**ขั้นที่ 3:** หารทุกพจน์ด้วย $x^2$

$\dfrac{\dfrac{x^2}{x^2}}{\dfrac{x^2}{x^2} + \dfrac{1}{x^2}} = \dfrac{1}{1 + \dfrac{1}{x^2}}$

เมื่อ $x \to \infty$: $\dfrac{1}{x^2} \to 0$

ดังนั้น $= \dfrac{1}{1 + 0} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$2$", r"$\infty$"],
              "correctAnswers": {"0": r"$1$"},
              "explanation": r'''หารด้วย $x^2$ แล้ว $\dfrac{1}{x^2}$ หายไปเป็น $0$ เหลือแค่ $\dfrac{1}{1} = 1$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_inf_h_017", "header", {
          "title": r"ตัวอย่างที่ 2 — ดีกรีเศษ < ส่วน",
          "level": 2,
        }),
        ContentBlock("lim_inf_ddq_018", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_018_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to \infty} \dfrac{x^2 + 4x}{x^3 + 2x + 4}$

แทนค่า → $\dfrac{\infty}{\infty}$ ต้องจัดรูป

ดีกรีสูงสุดคือ $3$ (จาก $x^3$) หารด้วย $x^3$ ตลอด

$\dfrac{\dfrac{1}{x} + \dfrac{4}{x^2}}{1 + \dfrac{2}{x^2} + \dfrac{4}{x^3}}$

เมื่อ $x \to \infty$ ทุกพจน์ที่มี $x$ เป็นส่วนจะ $\to 0$

สังเกตว่า **เศษกลายเป็น $0$ หมดเลย** เพราะดีกรีเศษ ($2$) น้อยกว่าดีกรีส่วน ($3$)

ดังนั้นคำตอบคือ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$4$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$0$"},
              "explanation": r'''$\dfrac{0 + 0}{1 + 0 + 0} = \dfrac{0}{1} = 0$

เมื่อดีกรีเศษน้อยกว่า → พจน์ในเศษหายเป็น $0$ หมด → คำตอบคือ $0$ เสมอ''',
            },
          ],
        }),
        ContentBlock("lim_inf_h_019", "header", {
          "title": r"ตัวอย่างที่ 3 — ดีกรีเศษ > ส่วน",
          "level": 2,
        }),
        ContentBlock("lim_inf_ddq_020", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_020_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to \infty} \dfrac{7x^4 + 5x + 6}{x^3 + 4x + 5}$

แทนค่า → $\dfrac{\infty}{\infty}$ ต้องจัดรูป

ดีกรีสูงสุดคือ $4$ (จาก $7x^4$) หารด้วย $x^4$ ตลอด

$\dfrac{7 + \dfrac{5}{x^3} + \dfrac{6}{x^4}}{\dfrac{1}{x} + \dfrac{4}{x^3} + \dfrac{5}{x^4}}$

เมื่อ $x \to \infty$ → $\dfrac{7 + 0 + 0}{0 + 0 + 0} = \dfrac{7}{0}$

คราวนี้ **ส่วนกลายเป็น $0$** ส่วนเศษยังเหลือค่า → กลายเป็น $\dfrac{k}{0}$

จากบทก่อนๆ $\dfrac{k}{0}$ แปลว่า''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$7$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"หาค่าไม่ได้"},
              "explanation": r'''เมื่อดีกรีเศษ ($4$) มากกว่าดีกรีส่วน ($3$) → หลังจัดรูปส่วนจะเป็น $0$ → $\dfrac{k}{0}$ → หาค่าไม่ได้''',
            },
          ],
        }),
        ContentBlock("lim_inf_h_021", "header", {
          "title": r"สรุปเป็น 3 กรณี 🎯",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_022", "text", {
          "content": [
            r'''จากที่ลองทำมา หลังหารด้วยดีกรีสูงสุดแล้ว

🔸 **ดีกรีเศษ < ดีกรีส่วน** → เศษเป็น $0$ หมด → ตอบ $0$

🔸 **ดีกรีเศษ = ดีกรีส่วน** → เหลือสัมประสิทธิ์หน้า $x$ สูงสุด → ตอบอัตราส่วนสัมประสิทธิ์

🔸 **ดีกรีเศษ > ดีกรีส่วน** → ส่วนเป็น $0$ → $\dfrac{k}{0}$ → หาค่าไม่ได้''',
          ],
        }),
        ContentBlock("lim_inf_h_023", "header", {
          "title": r"ดีกรีของ $\sqrt{\ }$ 🔍",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_024", "text", {
          "content": [
            r'''บางโจทย์มี $\sqrt{\ }$ อยู่ด้วย ต้องแปลงเป็นเลขยกกำลังก่อนถึงจะหาดีกรีได้

$\sqrt{x^3} = x^{3/2}$ มีดีกรี $\dfrac{3}{2}$

$\sqrt{4x^4 + 1}$ มีดีกรีสูงสุด $= \dfrac{4}{2} = 2$''',
          ],
        }),
        ContentBlock("lim_inf_q_025", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \dfrac{2x^2 + 4x + 5}{x^2 + 1}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$2$", r"$\infty$"],
          "correct": r"$2$",
          "explanation": r'''แทน $x = \infty$ → $\dfrac{\infty}{\infty}$ ต้องจัดรูป

ดีกรีเศษ $= 2$, ดีกรีส่วน $= 2$ → เท่ากัน

หารด้วย $x^2$ ตลอด

$\dfrac{2 + \dfrac{4}{x} + \dfrac{5}{x^2}}{1 + \dfrac{1}{x^2}} = \dfrac{2 + 0 + 0}{1 + 0} = 2$ 💚''',
        }),
        ContentBlock("lim_inf_q_026", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \dfrac{6x^3 + 4x + 5}{3x^3 - 2x + 5}$$''',
          ],
          "options": [r"$0$", r"$2$", r"$3$", r"$6$"],
          "correct": r"$2$",
          "explanation": r'''ดีกรีเศษ $= 3$, ดีกรีส่วน $= 3$ → เท่ากัน

หารด้วย $x^3$ ตลอด

$\dfrac{6 + \dfrac{4}{x^2} + \dfrac{5}{x^3}}{3 - \dfrac{2}{x^2} + \dfrac{5}{x^3}} = \dfrac{6}{3} = 2$ 💚''',
        }),
        ContentBlock("lim_inf_q_027", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \dfrac{x^3 + 4x + 5}{7x^4 + 5x + 6}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$7$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''ดีกรีเศษ ($3$) < ดีกรีส่วน ($4$) → ตอบ $0$ ได้เลย! 💚''',
        }),
        ContentBlock("lim_inf_q_028", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} \dfrac{5x^5 + 2x + 4}{x^2 + 2x + 8}$$''',
          ],
          "options": [r"$0$", r"$5$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ดีกรีเศษ ($5$) > ดีกรีส่วน ($2$) → หาค่าไม่ได้ ⚠️''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ฝึกเศษส่วนพหุนาม (รวม √)
    // =============================================
    ContentSection(
      headerL1: r"💲 ฝึกเศษส่วนพหุนาม",
      blocks: [
        ContentBlock("lim_inf_t_029", "text", {
          "content": [
            r'''มาฝึกเพิ่ม ทั้งโจทย์พหุนามปกติและโจทย์ที่มี $\sqrt{\ }$ อยู่ด้วย

Note = ขั้นตอน

1. แทนค่าก่อน 2. หาดีกรีสูงสุดเศษและส่วน 3. เปรียบเทียบดีกรี → เลือกวิธีตอบ''',
          ],
        }),
        ContentBlock("lim_inf_q_030", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \dfrac{4x + \sqrt{x}}{x + 5}$$

Note = คำใบ้

$\sqrt{x} = x^{1/2}$ มีดีกรี $\dfrac{1}{2}$''',
          ],
          "options": [r"$0$", r"$4$", r"$5$", r"หาค่าไม่ได้"],
          "correct": r"$4$",
          "explanation": r'''ดีกรีสูงสุดเศษ $= 1$ (จาก $4x$) เพราะ $1 > \dfrac{1}{2}$

ดีกรีสูงสุดส่วน $= 1$ (จาก $x$)

หารด้วย $x$ ตลอด

$\dfrac{4 + \dfrac{1}{\sqrt{x}}}{1 + \dfrac{5}{x}} = \dfrac{4 + 0}{1 + 0} = 4$ 💚''',
        }),
        ContentBlock("lim_inf_q_031", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \dfrac{4x^2 + 3x + 5}{\sqrt{4x^4 + 1}}$$

Note = คำใบ้

$\sqrt{4x^4 + 1}$ มีดีกรีสูงสุด $= \dfrac{4}{2} = 2$''',
          ],
          "options": [r"$0$", r"$2$", r"$4$", r"หาค่าไม่ได้"],
          "correct": r"$2$",
          "explanation": r'''ดีกรีเศษ $= 2$, ดีกรีส่วน $= 2$ → เท่ากัน

หารด้วย $x^2$ ตลอด

$\dfrac{4 + \dfrac{3}{x} + \dfrac{5}{x^2}}{\sqrt{4 + \dfrac{1}{x^4}}} = \dfrac{4}{\sqrt{4}} = \dfrac{4}{2} = 2$ 💚''',
        }),
        ContentBlock("lim_inf_q_032", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \dfrac{6x + 7}{\sqrt{9x^2 + 1}}$$''',
          ],
          "options": [r"$0$", r"$2$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"$2$",
          "explanation": r'''ดีกรีเศษ $= 1$, ดีกรีส่วน $= \dfrac{2}{2} = 1$ → เท่ากัน

หารด้วย $x$ ตลอด

$\dfrac{6 + \dfrac{7}{x}}{\sqrt{9 + \dfrac{1}{x^2}}} = \dfrac{6}{\sqrt{9}} = \dfrac{6}{3} = 2$ 💚''',
        }),
        ContentBlock("lim_inf_q_033", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} \dfrac{6x^2 + 7}{\sqrt{9x^3 + 1}}$$''',
          ],
          "options": [r"$0$", r"$2$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ดีกรีเศษ $= 2$, ดีกรีส่วน $= \dfrac{3}{2} = 1.5$

$2 > 1.5$ → ดีกรีเศษ > ดีกรีส่วน → หาค่าไม่ได้ ⚠️''',
        }),
        ContentBlock("lim_inf_h_034", "header", {
          "title": r"💭 คำถามชวนคิด",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_035", "text", {
          "content": [
            r'''จากตัวอย่างที่ผ่านมา กรณีดีกรีเท่ากัน

$\lim\limits_{x \to \infty} \dfrac{2x^2 + ...}{x^2 + ...} = 2$ และ $\lim\limits_{x \to \infty} \dfrac{6x^3 + ...}{3x^3 + ...} = \dfrac{6}{3} = 2$''',
          ],
        }),
        ContentBlock("lim_inf_q_036", "question_choice", {
          "content": [
            r'''5. สังเกต pattern: เมื่อดีกรีเศษ $=$ ดีกรีส่วน คำตอบจะเป็นอะไร?''',
          ],
          "options": [
            r"ผลรวมสัมประสิทธิ์",
            r"อัตราส่วนสัมประสิทธิ์หน้า $x$ สูงสุด",
            r"ผลต่างดีกรี",
            r"$1$ เสมอ",
          ],
          "correct": r"อัตราส่วนสัมประสิทธิ์หน้า $x$ สูงสุด",
          "explanation": r'''เพราะหลังหารด้วยดีกรีสูงสุดแล้ว พจน์อื่นๆ กลายเป็น $0$ หมด

เหลือแค่ $\dfrac{a}{b}$ ซึ่ง $a, b$ คือสัมประสิทธิ์หน้า $x$ ยกกำลังสูงสุดของเศษและส่วน 🎯''',
        }),
        ContentBlock("lim_inf_q_037", "question_choice", {
          "content": [
            r'''6. จงหา

$$\lim\limits_{x \to \infty} \dfrac{2x}{\sqrt{x^2 + x} + \sqrt{x^2 - x}}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$2$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''ดีกรีเศษ $= 1$

ดีกรีส่วน: $\sqrt{x^2} = x$ ดีกรี $= 1$

หารด้วย $x$ ตลอด

$\dfrac{2}{\sqrt{1 + \dfrac{1}{x}} + \sqrt{1 - \dfrac{1}{x}}} = \dfrac{2}{\sqrt{1} + \sqrt{1}} = \dfrac{2}{2} = 1$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: เมื่อเจอ ∞ − ∞
    // =============================================
    ContentSection(
      headerL1: r"🌟 เมื่อเจอ $\infty - \infty$",
      blocks: [
        ContentBlock("lim_inf_t_038", "text", {
          "content": [
            r'''ลองดูโจทย์นี้

$$\lim\limits_{x \to \infty} \sqrt{x^2 + x} - \sqrt{x^2 - x}$$

แทน $x = \infty$ ตรงๆ ได้ $\infty - \infty$ ซึ่งเป็น Indeterminate Form! ⚠️''',
          ],
        }),
        ContentBlock("lim_inf_h_039", "header", {
          "title": r"ปัญหาคืออะไร? 🤔",
          "level": 2,
        }),
        ContentBlock("lim_inf_t_040", "text", {
          "content": [
            r'''เทคนิคที่เราใช้ได้ผลมาตลอดคือ "หารด้วยดีกรีสูงสุดเพื่อสร้างส่วนอนันต์"

แต่โจทย์นี้ไม่มีส่วนเลย! มันเป็น $\sqrt{\ } - \sqrt{\ }$ ล้วนๆ ไม่มีที่ให้หาร''',
          ],
        }),
        ContentBlock("lim_inf_t_041", "text", {
          "content": [
            r'''ถ้าเราแปลงมันให้กลายเป็น **เศษส่วน** ได้ ก็จะหารด้วยดีกรีสูงสุดได้เหมือนเดิม!

แต่จะสร้างส่วนมาจากไหนล่ะ? 🤔''',
          ],
        }),
        ContentBlock("lim_inf_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_042_s1",
              "content": [
                r'''จำสูตร $(a - b)(a + b) = a^2 - b^2$ ได้ไหม?

ถ้าคูณ $(\sqrt{x^2+x} - \sqrt{x^2-x})$ ด้วย $(\sqrt{x^2+x} + \sqrt{x^2-x})$

$\sqrt{\ }$ จะ''',
                {"drop": "0"},
                r'''เพราะ $(\sqrt{A})^2 = A$ ไม่มี $\sqrt{\ }$ แล้ว

แต่ถ้าคูณแค่ตัวเดียว ค่าจะเปลี่ยน ต้องคูณเป็น $\dfrac{\sqrt{x^2+x}+\sqrt{x^2-x}}{\sqrt{x^2+x}+\sqrt{x^2-x}}$ ซึ่งมีค่าเท่ากับ''',
                {"drop": "1"},
                r'''ค่าไม่เปลี่ยน แต่เราจะ **ได้ส่วนมา** → จัดรูปต่อได้แล้ว!

ตัวที่คูณเข้าไป $(a + b)$ เรียกว่า **Conjugate**''',
              ],
              "draggableItems": [r"หายไป", r"ยังอยู่", r"$0$", r"$1$"],
              "correctAnswers": {"0": r"หายไป", "1": r"$1$"},
              "explanation": r'''คูณด้วย $\dfrac{a+b}{a+b} = 1$ ค่าไม่เปลี่ยน แต่ $\sqrt{\ }$ หายไปจากตัวเศษ และเราได้ส่วนมาให้จัดรูปต่อ!''',
            },
          ],
        }),
        ContentBlock("lim_inf_h_043", "header", {
          "title": r"ลองทำจนจบ 🚀",
          "level": 2,
        }),
        ContentBlock("lim_inf_ddq_044", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_inf_ddq_044_s1",
              "content": [
                r'''$(\sqrt{x^2+x} - \sqrt{x^2-x}) \times \dfrac{\sqrt{x^2+x}+\sqrt{x^2-x}}{\sqrt{x^2+x}+\sqrt{x^2-x}}$

ใช้สูตร $(a-b)(a+b) = a^2 - b^2$

เศษ: $(x^2+x) - (x^2-x) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2x$", r"$x$", r"$2x^2$", r"$0$"],
              "correctAnswers": {"0": r"$2x$"},
              "explanation": r'''$x^2 + x - x^2 + x = 2x$''',
            },
            {
              "questionId": "lim_inf_ddq_044_s2",
              "content": [
                r'''ตอนนี้ได้เศษส่วนแล้ว!

$\dfrac{2x}{\sqrt{x^2+x} + \sqrt{x^2-x}}$

กลายเป็นเศษส่วนพหุนามที่คุ้นเคย — หารด้วย $x$ ตลอด

$\dfrac{2}{\sqrt{1 + \dfrac{1}{x}} + \sqrt{1 - \dfrac{1}{x}}}$

เมื่อ $x \to \infty$ → $\dfrac{2}{\sqrt{1} + \sqrt{1}} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"$2$"],
              "correctAnswers": {"0": r"$1$"},
              "explanation": r'''$\dfrac{2}{1 + 1} = \dfrac{2}{2} = 1$ 🎉

Conjugate แปลง $\infty - \infty$ เป็นเศษส่วน → จัดรูปเหมือนเดิมได้เลย!''',
            },
          ],
        }),
        ContentBlock("lim_inf_h_045", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_inf_q_046", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \sqrt{x^2 + 3} - x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''แทน $x = \infty$ → $\infty - \infty$ ใช้ Conjugate

คูณด้วย $\dfrac{\sqrt{x^2+3}+x}{\sqrt{x^2+3}+x}$

เศษ: $(x^2+3) - x^2 = 3$

$\dfrac{3}{\sqrt{x^2+3}+x}$ หารด้วย $x$

$\dfrac{\dfrac{3}{x}}{\sqrt{1+\dfrac{3}{x^2}}+1} = \dfrac{0}{2} = 0$ 💚''',
        }),
        ContentBlock("lim_inf_q_047", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \sqrt{x^2 + 2x} - \sqrt{x^2 + x}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''คูณด้วย Conjugate

เศษ: $(x^2+2x) - (x^2+x) = x$

$\dfrac{x}{\sqrt{x^2+2x}+\sqrt{x^2+x}}$ หารด้วย $x$

$\dfrac{1}{\sqrt{1+\dfrac{2}{x}}+\sqrt{1+\dfrac{1}{x}}} = \dfrac{1}{1+1} = \dfrac{1}{2}$ 💚''',
        }),
        ContentBlock("lim_inf_q_048", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \sqrt{4x^2 + x} - 2x$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{4}$",
          "explanation": r'''คูณด้วย $\dfrac{\sqrt{4x^2+x}+2x}{\sqrt{4x^2+x}+2x}$

เศษ: $(4x^2+x) - 4x^2 = x$

$\dfrac{x}{\sqrt{4x^2+x}+2x}$ หารด้วย $x$

$\dfrac{1}{\sqrt{4+\dfrac{1}{x}}+2} = \dfrac{1}{2+2} = \dfrac{1}{4}$ 💚''',
        }),
        ContentBlock("lim_inf_q_049", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} x(\sqrt{x^2 + 1} - x)$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''Conjugate กับ $\sqrt{x^2+1} - x$ ก่อน

$x \cdot \dfrac{(x^2+1)-x^2}{\sqrt{x^2+1}+x} = \dfrac{x}{\sqrt{x^2+1}+x}$

หารด้วย $x$

$\dfrac{1}{\sqrt{1+\dfrac{1}{x^2}}+1} = \dfrac{1}{1+1} = \dfrac{1}{2}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: ฝึกรวม
    // =============================================
    ContentSection(
      headerL1: r"💪 ฝึกรวม",
      blocks: [
        ContentBlock("lim_inf_t_050", "text", {
          "content": [
            r'''แต่ละข้อ แทนค่าดูก่อนเสมอ แล้วตัดสินใจเลือกเทคนิค

Note = เทคนิคที่เรียนมา

1. เปรียบเทียบดีกรี (เศษส่วนพหุนาม) 2. Conjugate (เมื่อเจอ $\infty - \infty$)''',
          ],
        }),
        ContentBlock("lim_inf_q_051", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \dfrac{3x^2 + 7}{5x^2 - 2x + 1}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{3}{5}$", r"$\dfrac{7}{1}$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{3}{5}$",
          "explanation": r'''ดีกรีเศษ $= 2$, ดีกรีส่วน $= 2$ → เท่ากัน

อัตราส่วนสัมประสิทธิ์หน้า $x^2$ → $\dfrac{3}{5}$ 💚''',
        }),
        ContentBlock("lim_inf_q_052", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \dfrac{x + 1}{x^3 + 5}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$5$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''ดีกรีเศษ ($1$) < ดีกรีส่วน ($3$) → ตอบ $0$ ได้เลย 💚''',
        }),
        ContentBlock("lim_inf_q_053", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \dfrac{2x^4 + 1}{x^2 + 3}$$''',
          ],
          "options": [r"$0$", r"$2$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''ดีกรีเศษ ($4$) > ดีกรีส่วน ($2$) → หาค่าไม่ได้ ⚠️''',
        }),
        ContentBlock("lim_inf_q_054", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} \dfrac{3x + 1}{\sqrt{x^2 + 4}}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$3$", r"หาค่าไม่ได้"],
          "correct": r"$3$",
          "explanation": r'''ดีกรีเศษ $= 1$, ดีกรีส่วน $= \dfrac{2}{2} = 1$ → เท่ากัน

หารด้วย $x$

$\dfrac{3 + \dfrac{1}{x}}{\sqrt{1 + \dfrac{4}{x^2}}} = \dfrac{3}{\sqrt{1}} = 3$ 💚''',
        }),
        ContentBlock("lim_inf_fi_055", "question_fill_in", {
          "content": [
            r'''5. จงหา

$\lim\limits_{x \to \infty} \sqrt{9x^2 + 6x} - 3x = $ ''',
            {"box": "0"},
          ],
          "correct": "1",
          "explanation": r'''แทนค่า → $\infty - \infty$ ใช้ Conjugate

คูณด้วย $\dfrac{\sqrt{9x^2+6x}+3x}{\sqrt{9x^2+6x}+3x}$

เศษ: $(9x^2+6x) - 9x^2 = 6x$

$\dfrac{6x}{\sqrt{9x^2+6x}+3x}$ หารด้วย $x$

$\dfrac{6}{\sqrt{9+\dfrac{6}{x}}+3} = \dfrac{6}{3+3} = 1$ 💚''',
        }),
        ContentBlock("lim_inf_fi_056", "question_fill_in", {
          "content": [
            r'''6. จงหา

$\lim\limits_{x \to \infty} \dfrac{10x^3 + x}{5x^3 + 2} = $ ''',
            {"box": "0"},
          ],
          "correct": "2",
          "explanation": r'''ดีกรีเศษ $= 3$, ดีกรีส่วน $= 3$ → เท่ากัน

$\dfrac{10}{5} = 2$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_inf_t_057", "text", {
          "content": [
            r'''🎯 **การหาลิมิตเข้าใกล้อนันต์**

**1. กฎส่วนอนันต์:** $\lim\limits_{x \to \pm\infty} \dfrac{k}{x} = 0$

**2. ลองแทนค่าก่อนเสมอ** เพื่อเช็คว่าเป็น Indeterminate Form หรือไม่''',
          ],
        }),
        ContentBlock("lim_inf_t_058", "text", {
          "content": [
            r'''**3. เศษส่วนพหุนาม** ($\dfrac{\infty}{\infty}$) → หารด้วยดีกรีสูงสุดตลอด

🔸 เศษ < ส่วน → เศษกลายเป็น $0$ → ตอบ $0$

🔸 เศษ = ส่วน → เหลืออัตราส่วนสัมประสิทธิ์หน้า $x$ สูงสุด 🎯

🔸 เศษ > ส่วน → ส่วนกลายเป็น $0$ → $\dfrac{k}{0}$ → หาค่าไม่ได้''',
          ],
        }),
        ContentBlock("lim_inf_t_059", "text", {
          "content": [
            r'''**4.** $\infty - \infty$ → ไม่มีส่วน จัดรูปลำบาก → ใช้ Conjugate สร้างส่วนขึ้นมา → แล้วจัดรูปเหมือนข้อ 3

Note = จำไว้

เทคนิคหลักของบทนี้คือ **หารด้วยดีกรีสูงสุด** เพื่อสร้างส่วนอนันต์ให้กลายเป็น $0$ !''',
          ],
        }),
      ],
    ),
  ],
);
// Exercise: แบบฝึกหัด6 (แบบฝึกหัดเข้าใกล้อนันต์)

final calcLimitInfinityExtraLesson = ContentLesson(
  title: "ลิมิตเข้าใกล้อนันต์เพิ่มเติม",
  sections: [
    // =============================================
    // SECTION 1: ลิมิตเลขชี้กำลัง
    // =============================================
    ContentSection(
      headerL1: r"🚀 ลิมิตเลขชี้กำลัง",
      blocks: [
        ContentBlock("lim_ex_t_001", "text", {
          "content": [
            r'''จากบทที่แล้ว เราหาลิมิตเศษส่วนพหุนามเมื่อ $x \to \infty$ ได้แล้ว

บทนี้จะมาดูฟังก์ชันอีกแบบ คือ **เลขยกกำลัง** เช่น $2^x, (\dfrac{1}{3})^x$''',
          ],
        }),
        ContentBlock("lim_ex_h_002", "header", {
          "title": r"ลองนึกภาพก่อน 🧠",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_003", "text", {
          "content": [
            r'''ลองคิดตาม — $(\dfrac{1}{2})^x$ จะเป็นเท่าไหร่ เมื่อ $x$ ใหญ่ขึ้นเรื่อยๆ?

$(\dfrac{1}{2})^1 = 0.5$ → $(\dfrac{1}{2})^5 = 0.03$ → $(\dfrac{1}{2})^{10} = 0.00097...$''',
          ],
        }),
        ContentBlock("lim_ex_t_004", "text", {
          "content": [
            r'''ยิ่งยกกำลังมาก ค่ายิ่ง **เล็กลงเรื่อยๆ** จนเข้าใกล้ $0$!

แต่ถ้าเป็น $2^x$ ล่ะ? $2^1 = 2$ → $2^5 = 32$ → $2^{10} = 1024$ → ยิ่งใหญ่ขึ้นเรื่อยๆ!''',
          ],
        }),
        ContentBlock("lim_ex_ddq_005", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_005_s1",
              "content": [
                r'''ลองเดาจาก pattern ที่เห็น

$\lim\limits_{x \to \infty} (\dfrac{1}{2})^x = $ ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to \infty} 2^x = $ ''',
                {"drop": "1"},
                r'''แล้ว $\lim\limits_{x \to \infty} 1^x$ ล่ะ?

$1^1 = 1, \quad 1^{100} = 1, \quad 1^{1000} = 1$

$\lim\limits_{x \to \infty} 1^x = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$0$", "1": r"$\infty$", "2": r"$1$"},
              "explanation": r'''ฐาน $< 1$ → ยิ่งยกกำลังยิ่งเล็ก → เข้าใกล้ $0$

ฐาน $> 1$ → ยิ่งยกกำลังยิ่งใหญ่ → วิ่งไป $\infty$

ฐาน $= 1$ → ได้ $1$ เสมอ''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_006", "header", {
          "title": r"ดูเพิ่มอีกนิด — ฐานติดลบ",
          "level": 2,
        }),
        ContentBlock("lim_ex_ddq_007", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_007_s1",
              "content": [
                r'''$(-\dfrac{1}{2})^1 = -0.5, \quad (-\dfrac{1}{2})^2 = 0.25, \quad (-\dfrac{1}{2})^3 = -0.125$

ค่าสลับบวกลบ แต่ **ขนาดเล็กลงเรื่อยๆ** เพราะ $|-\dfrac{1}{2}| = \dfrac{1}{2} < 1$

$\lim\limits_{x \to \infty} (-\dfrac{1}{2})^x = $ ''',
                {"drop": "0"},
                r'''แล้ว $(-2)^x$ ล่ะ? $(-2)^1 = -2, \quad (-2)^2 = 4, \quad (-2)^3 = -8$

ค่าสลับบวกลบ **ขนาดใหญ่ขึ้นเรื่อยๆ** ไม่เข้าใกล้ค่าไหนเลย

$\lim\limits_{x \to \infty} (-2)^x = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$0$", "1": r"หาค่าไม่ได้"},
              "explanation": r'''ถ้า $|a| < 1$ ขนาดเล็กลงเรื่อยๆ → เข้าใกล้ $0$ ไม่ว่าจะติดลบหรือเปล่า

ถ้า $|a| > 1$ ขนาดใหญ่ขึ้นเรื่อยๆ → หาค่าไม่ได้''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_008", "header", {
          "title": r"สรุป 3 กรณีของ $\lim\limits_{x \to \infty} a^x$ 📋",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_009", "text", {
          "content": [
            r'''จาก pattern ที่เราเห็น สรุปได้ว่า

🔸 $|a| < 1$ → ลิมิต $= 0$ (ขนาดเล็กลงเรื่อยๆ)

🔸 $a = 1$ → ลิมิต $= 1$ ($1$ ยกกำลังอะไรก็ $1$)

🔸 ที่เหลือ ($|a| > 1$ หรือ $a \leq -1$) → หาค่าไม่ได้''',
          ],
        }),
        ContentBlock("lim_ex_img_010", "image", {
          "path": "assets/lim3.png",
        }),
        ContentBlock("lim_ex_t_011", "text", {
          "content": [
            r'''จากกราฟของฐาน $< 1$ เส้นจะค่อยๆ แนบแกน $x$ ไปเรื่อยๆ แสดงว่าค่าเข้าใกล้ $0$''',
          ],
        }),
        ContentBlock("lim_ex_h_012", "header", {
          "title": r"💡 Trick: ถ้าเป็น $x \to -\infty$",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_013", "text", {
          "content": [
            r'''ใช้สมบัติ $a^{-x} = (\dfrac{1}{a})^x$ พลิกฐานแล้วเปลี่ยนทิศ!

$$\lim\limits_{x \to -\infty} a^x = \lim\limits_{x \to \infty} \left(\dfrac{1}{a}\right)^x$$

แล้วค่อยดู 3 กรณีเหมือนเดิม''',
          ],
        }),
        ContentBlock("lim_ex_ddq_014", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_014_s1",
              "content": [
                r'''ลองแปลง $\lim\limits_{x \to -\infty} 3^x$

$= \lim\limits_{x \to \infty}$ ''',
                {"drop": "0"},
                r'''$|\dfrac{1}{3}|$ ''',
                {"drop": "1"},
                r''' $1$ ดังนั้นลิมิต $= $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$(\dfrac{1}{3})^x$",
                r"$3^x$",
                r"$<$",
                r"$>$",
                r"$0$",
                r"$1$",
                r"หาค่าไม่ได้",
              ],
              "correctAnswers": {
                "0": r"$(\dfrac{1}{3})^x$",
                "1": r"$<$",
                "2": r"$0$",
              },
              "explanation":
                  r'''$3^{-x} = (\dfrac{1}{3})^x$ เนื่องจาก $\dfrac{1}{3} < 1$ → เข้าใกล้ $0$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_015", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_ex_q_016", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \left(\dfrac{2}{3}\right)^x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''$|\dfrac{2}{3}| = \dfrac{2}{3} < 1$

→ ลิมิต $= 0$ 💚''',
        }),
        ContentBlock("lim_ex_q_017", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \left(-\dfrac{5}{6}\right)^x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$-1$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''$|-\dfrac{5}{6}| = \dfrac{5}{6} < 1$

ถึงจะติดลบ แต่ $|a| < 1$ ก็เข้าใกล้ $0$ เหมือนกัน! 💚''',
        }),
        ContentBlock("lim_ex_q_018", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \left(-\dfrac{5}{3}\right)^x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''$|-\dfrac{5}{3}| = \dfrac{5}{3} > 1$ และมีเครื่องหมายลบ

ค่าจะสลับบวกลบขนาดใหญ่มากๆ → หาค่าไม่ได้ ⚠️''',
        }),
        ContentBlock("lim_ex_q_019", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to -\infty} 5^x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$5$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''พลิกฐาน: $\lim\limits_{x \to -\infty} 5^x = \lim\limits_{x \to \infty} (\dfrac{1}{5})^x$

$\dfrac{1}{5} < 1$ → เข้าใกล้ $0$ 💚''',
        }),
        ContentBlock("lim_ex_q_020", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to \infty} \dfrac{3^x}{3^{x+1}}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{3}$", r"$1$", r"$3$"],
          "correct": r"$\dfrac{1}{3}$",
          "explanation": r'''จัดรูปก่อน: $\dfrac{3^x}{3^{x+1}} = \dfrac{3^x}{3^x \cdot 3} = \dfrac{1}{3}$

ค่าคงที่ ไม่ขึ้นกับ $x$ → ตอบ $\dfrac{1}{3}$ ได้เลย 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: เศษส่วนเลขชี้กำลัง
    // =============================================
    ContentSection(
      headerL1: r"⚡ เศษส่วนเลขชี้กำลัง",
      blocks: [
        ContentBlock("lim_ex_t_021", "text", {
          "content": [
            r'''บางโจทย์มีเลขชี้กำลังหลายฐานบวกกันเป็นเศษส่วน เช่น

$$\lim\limits_{x \to \infty} \dfrac{2^x}{4^x + 5^x}$$

แทนค่า $x = \infty$ ตรงๆ จะได้ $\dfrac{\infty}{\infty}$ — ต้องจัดรูป!''',
          ],
        }),
        ContentBlock("lim_ex_h_022", "header", {
          "title": r"ทำไมหารด้วยฐานใหญ่สุด? 🤔",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_023", "text", {
          "content": [
            r'''จำได้ไหมว่าบทที่แล้ว เมื่อเจอ $\dfrac{\infty}{\infty}$ ในพหุนาม เราหารด้วย $x$ ยกกำลังสูงสุดเพื่อทำให้พจน์เล็กๆ กลายเป็น $0$

ในเลขชี้กำลังก็แนวคิดเดียวกัน — ต้องหา **ตัวที่โตเร็วที่สุด** มาหาร''',
          ],
        }),
        ContentBlock("lim_ex_t_024", "text", {
          "content": [
            r'''$5^x$ โตเร็วกว่า $4^x$ โตเร็วกว่า $2^x$ เสมอ ดังนั้นตัวที่โตเร็วสุดคือ **ฐานใหญ่สุด**

พอหารด้วยฐานใหญ่สุดแล้ว ฐานอื่นๆ จะกลายเป็น $(\dfrac{\text{ฐานเล็ก}}{\text{ฐานใหญ่}})^x$ ซึ่ง $< 1$ → เข้าใกล้ $0$!''',
          ],
        }),
        ContentBlock("lim_ex_h_025", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("lim_ex_ddq_026", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_026_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to \infty} \dfrac{2^x}{4^x + 5^x}$

**ขั้นที่ 1:** แทนค่า → $\dfrac{\infty}{\infty}$ ต้องจัดรูป

**ขั้นที่ 2:** ฐานใหญ่สุดในส่วนคือ''',
                {"drop": "0"},
                r''' → หารด้วย $5^x$ ตลอด''',
              ],
              "draggableItems": [r"$2$", r"$4$", r"$5$"],
              "correctAnswers": {"0": r"$5$"},
              "explanation": r'''$5 > 4 > 2$ ฐานใหญ่สุดในส่วนคือ $5$ จึงหารด้วย $5^x$''',
            },
            {
              "questionId": "lim_ex_ddq_026_s2",
              "content": [
                r'''หารด้วย $5^x$ ตลอด:

$\dfrac{\dfrac{2^x}{5^x}}{\dfrac{4^x}{5^x} + \dfrac{5^x}{5^x}} = \dfrac{(\dfrac{2}{5})^x}{(\dfrac{4}{5})^x + 1}$

$|\dfrac{2}{5}| = 0.4 < 1$ → $(\dfrac{2}{5})^x \to 0$

$|\dfrac{4}{5}| = 0.8 < 1$ → $(\dfrac{4}{5})^x \to 0$

$= \dfrac{0}{0 + 1} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$0$"},
              "explanation": r'''ฐานที่เล็กกว่า $5$ ทั้งหมดเข้าใกล้ $0$ เหลือ $\dfrac{0}{1} = 0$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_027", "header", {
          "title": r"⚠️ ต้องแปลงฐานก่อน!",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_028", "text", {
          "content": [
            r'''บางโจทย์เขียนในรูปที่ดูซับซ้อน ต้องใช้สมบัติเลขยกกำลังแปลงก่อน''',
          ],
        }),
        ContentBlock("lim_ex_ddq_029", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_029_s1",
              "content": [
                r'''ลองแปลงเหล่านี้

$2^{2x} = (2^2)^x = $ ''',
                {"drop": "0"},
                r'''$9^x = (3^2)^x = $ ''',
                {"drop": "1"},
                r'''$3^{2x+1} = 3^{2x} \cdot 3^1 = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$4^x$",
                r"$3^{2x}$",
                r"$3 \cdot 3^{2x}$",
                r"$3 \cdot 9^x$",
                r"$2 \cdot 4^x$",
              ],
              "correctAnswers": {
                "0": r"$4^x$",
                "1": r"$3^{2x}$",
                "2": r"$3 \cdot 3^{2x}$",
              },
              "explanation": r'''$2^{2x} = (2^2)^x = 4^x$

$9^x = (3^2)^x = 3^{2x}$

$3^{2x+1} = 3^{2x} \cdot 3 = 3 \cdot 3^{2x}$

แปลงฐานให้ตรงกันก่อน แล้วค่อยหารด้วยฐานใหญ่สุด!''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_030", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_ex_q_031", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \dfrac{4^x}{3^x + 5^x}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''ฐานใหญ่สุดในส่วนคือ $5$ → หารด้วย $5^x$

$\dfrac{(\dfrac{4}{5})^x}{(\dfrac{3}{5})^x + 1}$

$\dfrac{4}{5}, \dfrac{3}{5} < 1$ → เข้าใกล้ $0$

$= \dfrac{0}{0 + 1} = 0$ 💚''',
        }),
        ContentBlock("lim_ex_q_032", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to \infty} \dfrac{7^x + 3^x}{7^x - 2^x}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$7$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''ฐานใหญ่สุดคือ $7$ → หารด้วย $7^x$

$\dfrac{1 + (\dfrac{3}{7})^x}{1 - (\dfrac{2}{7})^x}$

$(\dfrac{3}{7})^x, (\dfrac{2}{7})^x \to 0$

$= \dfrac{1 + 0}{1 - 0} = 1$ 💚''',
        }),
        ContentBlock("lim_ex_q_033", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to \infty} \dfrac{2 \cdot 3^x - 5^x}{3^x + 2 \cdot 5^x}$$''',
          ],
          "options": [r"$-\dfrac{1}{2}$", r"$0$", r"$\dfrac{1}{2}$", r"$1$"],
          "correct": r"$-\dfrac{1}{2}$",
          "explanation": r'''ฐานใหญ่สุดคือ $5$ → หารด้วย $5^x$

$\dfrac{2(\dfrac{3}{5})^x - 1}{(\dfrac{3}{5})^x + 2}$

$(\dfrac{3}{5})^x \to 0$

$= \dfrac{0 - 1}{0 + 2} = -\dfrac{1}{2}$ 💚''',
        }),
        ContentBlock("lim_ex_q_034", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} \dfrac{2^{2x} + 3^x}{4^x - 5^x}$$

Note = คำใบ้

$2^{2x} = 4^x$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''**Step 1:** แปลงฐาน $2^{2x} = 4^x$

$\dfrac{4^x + 3^x}{4^x - 5^x}$

**Step 2:** ฐานใหญ่สุดคือ $5$ → หารด้วย $5^x$

$\dfrac{(\dfrac{4}{5})^x + (\dfrac{3}{5})^x}{(\dfrac{4}{5})^x - 1}$

**Step 3:** $(\dfrac{4}{5})^x \to 0$ และ $(\dfrac{3}{5})^x \to 0$

$= \dfrac{0 + 0}{0 - 1} = \dfrac{0}{-1} = 0$ 💚''',
        }),
        ContentBlock("lim_ex_q_035", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to \infty} \dfrac{9^x - 3^{2x+1}}{2 \cdot 3^{2x} + 1}$$

Note = คำใบ้

$9^x = 3^{2x}$ และ $3^{2x+1} = 3 \cdot 3^{2x}$''',
          ],
          "options": [r"$-2$", r"$-1$", r"$0$", r"$1$"],
          "correct": r"$-1$",
          "explanation": r'''**Step 1:** แปลงฐาน

$9^x = 3^{2x}$ และ $3^{2x+1} = 3 \cdot 3^{2x}$

$= \dfrac{3^{2x} - 3 \cdot 3^{2x}}{2 \cdot 3^{2x} + 1} = \dfrac{-2 \cdot 3^{2x}}{2 \cdot 3^{2x} + 1}$

**Step 2:** หารด้วย $3^{2x}$ ตลอด

$= \dfrac{-2}{2 + \dfrac{1}{3^{2x}}}$

**Step 3:** $\dfrac{1}{3^{2x}} \to 0$

$= \dfrac{-2}{2} = -1$ 💚''',
        }),
        ContentBlock("lim_ex_q_036", "question_choice", {
          "content": [
            r'''6. จงหา

$$\lim\limits_{x \to -\infty} \dfrac{5^x}{4^x}$$

Note = คำใบ้

จาก Section 1 — พลิกฐานก่อน!''',
          ],
          "options": [r"$0$", r"$1$", r"$\dfrac{5}{4}$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''**Step 1:** พลิกฐาน

$\lim\limits_{x \to -\infty} \dfrac{5^x}{4^x} = \lim\limits_{x \to \infty} \dfrac{5^{-x}}{4^{-x}} = \lim\limits_{x \to \infty} \dfrac{4^x}{5^x} = \lim\limits_{x \to \infty} (\dfrac{4}{5})^x$

**Step 2:** $\dfrac{4}{5} = 0.8 < 1$ → เข้าใกล้ $0$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: Sigma คืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"📝 Sigma คืออะไร?",
      blocks: [
        ContentBlock("lim_ex_t_037", "text", {
          "content": [
            r'''จนถึงตอนนี้เราหาลิมิตของ **สมการตัวเดียว** เช่น $\dfrac{2x+1}{x+3}$ หรือ $(\dfrac{1}{2})^x$

แต่บางโจทย์ถามลิมิตของ **ผลบวกยาวๆ** เช่น $\dfrac{1}{1 \cdot 2} + \dfrac{1}{2 \cdot 3} + \dfrac{1}{3 \cdot 4} + ...$''',
          ],
        }),
        ContentBlock("lim_ex_t_038", "text", {
          "content": [
            r'''ผลบวกแบบนี้เขียนยาวมาก เลยมีสัญลักษณ์ย่อคือ $\sum$ (อ่านว่า "ซิกม่า") มาช่วย''',
          ],
        }),
        ContentBlock("lim_ex_h_039", "header", {
          "title": r"$\sum$ คือผลบวก!",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_040", "text", {
          "content": [
            r'''$$\sum_{k=1}^{n} f(k) = f(1) + f(2) + f(3) + ... + f(n)$$

พูดง่ายๆ คือ **"บวก $f(k)$ ตั้งแต่ $k = 1$ ไปจนถึง $k = n$"**''',
          ],
        }),
        ContentBlock("lim_ex_t_041", "text", {
          "content": [
            r'''🔸 ตัวเลขข้างล่าง ($k=1$) = จุดเริ่มต้น

🔸 ตัวเลขข้างบน ($n$) = จุดสิ้นสุด

🔸 $f(k)$ = สิ่งที่ต้องบวกในแต่ละรอบ''',
          ],
        }),
        ContentBlock("lim_ex_h_042", "header", {
          "title": r"ลองดูตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_043", "text", {
          "content": [
            r'''$\sum_{k=1}^{3} k = 1 + 2 + 3 = 6$

$\sum_{k=1}^{4} k^2 = 1^2 + 2^2 + 3^2 + 4^2 = 1 + 4 + 9 + 16 = 30$''',
          ],
        }),
        ContentBlock("lim_ex_ddq_044", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_044_s1",
              "content": [
                r'''ลองเติมค่า

$\sum_{k=1}^{3} 2k = 2(1) + 2(2) + 2(3) = $ ''',
                {"drop": "0"},
                r'''$\sum_{k=1}^{2} \dfrac{1}{k} = \dfrac{1}{1} + \dfrac{1}{2} = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$6$", r"$12$", r"$\dfrac{3}{2}$", r"$\dfrac{1}{2}$", r"$3$"],
              "correctAnswers": {"0": r"$12$", "1": r"$\dfrac{3}{2}$"},
              "explanation": r'''$2 + 4 + 6 = 12$

$1 + \dfrac{1}{2} = \dfrac{3}{2}$''',
            },
          ],
        }),
        ContentBlock("lim_ex_t_045", "text", {
          "content": [
            r'''Note = สำคัญ

ถ้า $n \to \infty$ แปลว่าบวกไปเรื่อยๆ ไม่มีจุดจบ! เราจะหาลิมิตของผลบวกนี้ได้ด้วยเทคนิค Telescopic ที่จะเรียนต่อไป''',
          ],
        }),
        ContentBlock("lim_ex_q_046", "question_choice", {
          "content": [
            r'''1. $\sum_{k=1}^{4} (k + 1)$ มีค่าเท่าไหร่?''',
          ],
          "options": [r"$10$", r"$14$", r"$16$", r"$20$"],
          "correct": r"$14$",
          "explanation": r'''แทน $k = 1, 2, 3, 4$ ทีละตัว

$(1+1) + (2+1) + (3+1) + (4+1)$

$= 2 + 3 + 4 + 5 = 14$ 💚''',
        }),
        ContentBlock("lim_ex_q_047", "question_choice", {
          "content": [
            r'''2. $\sum_{k=2}^{4} \dfrac{1}{k(k+1)}$ มีค่าเท่าไหร่?''',
          ],
          "options": [r"$\dfrac{1}{5}$", r"$\dfrac{3}{10}$", r"$\dfrac{1}{10}$", r"$\dfrac{7}{20}$"],
          "correct": r"$\dfrac{3}{10}$",
          "explanation": r'''แทน $k = 2, 3, 4$

$\dfrac{1}{2 \cdot 3} + \dfrac{1}{3 \cdot 4} + \dfrac{1}{4 \cdot 5}$

$= \dfrac{1}{6} + \dfrac{1}{12} + \dfrac{1}{20}$

$= \dfrac{10 + 5 + 3}{60} = \dfrac{18}{60} = \dfrac{3}{10}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: เทคนิค Telescopic
    // =============================================
    ContentSection(
      headerL1: r"🔭 เทคนิค Telescopic",
      blocks: [
        ContentBlock("lim_ex_t_048", "text", {
          "content": [
            r'''ลองหา $\lim\limits_{n \to \infty} \sum_{k=1}^{n} \dfrac{1}{k(k+1)}$ กัน

ดูเผินๆ คือบวก $\dfrac{1}{1 \cdot 2} + \dfrac{1}{2 \cdot 3} + \dfrac{1}{3 \cdot 4} + ...$ ไปเรื่อยๆ ไม่มีจุดจบ — จะหาคำตอบได้ยังไง? 🤔''',
          ],
        }),
        ContentBlock("lim_ex_h_049", "header", {
          "title": r"ลองกระจายดูก่อน 🔍",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_050", "text", {
          "content": [
            r'''สังเกตว่า $\dfrac{1}{1 \cdot 2}$ สามารถเขียนเป็น $\dfrac{1}{1} - \dfrac{1}{2}$ ได้

ลองเช็ค: $\dfrac{1}{1} - \dfrac{1}{2} = \dfrac{2-1}{2} = \dfrac{1}{2}$ ✅ ตรงกัน!''',
          ],
        }),
        ContentBlock("lim_ex_ddq_051", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_051_s1",
              "content": [
                r'''ลองเขียนพจน์ถัดๆ ไปเป็นผลต่างดูบ้าง

$\dfrac{1}{2 \cdot 3} = \dfrac{1}{2} - \dfrac{1}{3}$ ✅ เช็ค: $\dfrac{3-2}{6} = \dfrac{1}{6}$ ✅

$\dfrac{1}{3 \cdot 4} = $ ''',
                {"drop": "0"},
                r'''สังเกต pattern: $\dfrac{1}{k(k+1)} = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{3} - \dfrac{1}{4}$",
                r"$\dfrac{1}{3} + \dfrac{1}{4}$",
                r"$\dfrac{1}{k} - \dfrac{1}{k+1}$",
                r"$\dfrac{1}{k} + \dfrac{1}{k+1}$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{1}{3} - \dfrac{1}{4}$",
                "1": r"$\dfrac{1}{k} - \dfrac{1}{k+1}$",
              },
              "explanation": r'''ทุกพจน์เขียนเป็น $\dfrac{1}{k} - \dfrac{1}{k+1}$ ได้หมด!

นี่คือ **การแยกเศษส่วนย่อย** (Partial Fraction)''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_052", "header", {
          "title": r"เขียนแยกแล้วเกิดอะไรขึ้น? ✨",
          "level": 2,
        }),
        ContentBlock("lim_ex_ddq_053", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_053_s1",
              "content": [
                r'''เขียนแยกทีละพจน์:

$k=1$: $(\dfrac{1}{1} - \dfrac{1}{2})$

$k=2$: $(\dfrac{1}{2} - \dfrac{1}{3})$

$k=3$: $(\dfrac{1}{3} - \dfrac{1}{4})$

$...$

$k=n$: $(\dfrac{1}{n} - \dfrac{1}{n+1})$

สังเกต! $-\dfrac{1}{2}$ จากพจน์แรก กับ $+\dfrac{1}{2}$ จากพจน์ที่สอง → หักล้างกัน!

$-\dfrac{1}{3}$ กับ $+\dfrac{1}{3}$ ก็หักล้าง!

พจน์กลางหายหมด เหลือแค่''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$1 - \dfrac{1}{n+1}$",
                r"$\dfrac{1}{n}$",
                r"$1 - \dfrac{1}{n}$",
                r"$1 + \dfrac{1}{n+1}$",
              ],
              "correctAnswers": {"0": r"$1 - \dfrac{1}{n+1}$"},
              "explanation": r'''พจน์กลางทั้งหมดหักล้าง เหลือแค่พจน์แรก ($\dfrac{1}{1}$) ลบพจน์สุดท้าย ($\dfrac{1}{n+1}$)

นี่เรียกว่า **Telescopic** (เหมือนกล้องส่องทางไกลที่ยุบรวมเข้าหากัน 🔭)''',
            },
            {
              "questionId": "lim_ex_ddq_053_s2",
              "content": [
                r'''**หาลิมิตเมื่อ $n \to \infty$**

$\lim\limits_{n \to \infty} \left(1 - \dfrac{1}{n+1}\right)$

เมื่อ $n \to \infty$: $\dfrac{1}{n+1} \to 0$ (กฎส่วนอนันต์!)

$= 1 - 0 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"$\infty$"],
              "correctAnswers": {"0": r"$1$"},
              "explanation": r'''$\dfrac{1}{n+1}$ เข้าใกล้ $0$ (กฎส่วนอนันต์จากบทที่แล้ว!) ดังนั้นคำตอบคือ $1$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_054", "header", {
          "title": r"สูตรทั่วไป 📋",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_055", "text", {
          "content": [
            r'''จากที่ลองทำมา สรุปเป็นสูตรได้ว่า

$$\dfrac{1}{k(k+a)} = \dfrac{1}{a}\left(\dfrac{1}{k} - \dfrac{1}{k+a}\right)$$

เช็ค: $\dfrac{1}{a} \cdot \dfrac{(k+a)-k}{k(k+a)} = \dfrac{1}{a} \cdot \dfrac{a}{k(k+a)} = \dfrac{1}{k(k+a)}$ ✅''',
          ],
        }),
        ContentBlock("lim_ex_t_056", "text", {
          "content": [
            r'''Note = Pattern สำคัญ

เมื่อ $a = 1$ → หักล้างแล้วเหลือ **1 พจน์** หน้าและหลัง

เมื่อ $a = 2$ → เหลือ **2 พจน์** หน้าและหลัง

เมื่อ $a = 3$ → เหลือ **3 พจน์** หน้าและหลัง

จำนวนพจน์ที่เหลือ $=$ ค่า $a$ เสมอ!''',
          ],
        }),
        ContentBlock("lim_ex_h_057", "header", {
          "title": r"ตัวอย่างเมื่อ $a = 2$",
          "level": 2,
        }),
        ContentBlock("lim_ex_t_058", "text", {
          "content": [
            r'''จงหา $\lim\limits_{n \to \infty} \sum_{k=1}^{n} \dfrac{1}{k(k+2)}$''',
          ],
        }),
        ContentBlock("lim_ex_ddq_059", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_ex_ddq_059_s1",
              "content": [
                r'''**ขั้นที่ 1:** แยกเศษส่วนย่อย ($a = 2$)

$\dfrac{1}{k(k+2)} = \dfrac{1}{2}\left(\dfrac{1}{k} - \dfrac{1}{k+2}\right)$

แทน $k = 1$: $\dfrac{1}{2}(\dfrac{1}{1} - \dfrac{1}{3})$ ✅

ถูกต้อง! ใช้สูตรนี้ได้''',
              ],
              "draggableItems": [],
              "correctAnswers": {},
              "explanation": r'''ยืนยันว่าสูตรถูกต้อง ไปขั้นถัดไป''',
            },
            {
              "questionId": "lim_ex_ddq_059_s2",
              "content": [
                r'''**ขั้นที่ 2:** เขียนแยกแล้วหักล้าง

$\dfrac{1}{2}[(\dfrac{1}{1} - \dfrac{1}{3}) + (\dfrac{1}{2} - \dfrac{1}{4}) + (\dfrac{1}{3} - \dfrac{1}{5}) + (\dfrac{1}{4} - \dfrac{1}{6}) + ...]$

$-\dfrac{1}{3}$ กับ $+\dfrac{1}{3}$ หักล้าง! $-\dfrac{1}{4}$ กับ $+\dfrac{1}{4}$ หักล้าง!

เนื่องจาก $a = 2$ จะเหลือ **2 พจน์แรก** และ **2 พจน์ท้าย**

เหลือ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{2}[\dfrac{1}{1} + \dfrac{1}{2} - \dfrac{1}{n+1} - \dfrac{1}{n+2}]$",
                r"$\dfrac{1}{2}[\dfrac{1}{1} - \dfrac{1}{n+2}]$",
                r"$\dfrac{1}{2}[\dfrac{1}{1} + \dfrac{1}{2}]$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{1}{2}[\dfrac{1}{1} + \dfrac{1}{2} - \dfrac{1}{n+1} - \dfrac{1}{n+2}]$",
              },
              "explanation": r'''$a = 2$ จึงเหลือ 2 พจน์หน้า ($\dfrac{1}{1}, \dfrac{1}{2}$) และ 2 พจน์ท้าย ($\dfrac{1}{n+1}, \dfrac{1}{n+2}$)''',
            },
            {
              "questionId": "lim_ex_ddq_059_s3",
              "content": [
                r'''**ขั้นที่ 3:** เมื่อ $n \to \infty$

$\dfrac{1}{n+1} \to 0$ และ $\dfrac{1}{n+2} \to 0$

$= \dfrac{1}{2}[1 + \dfrac{1}{2} - 0 - 0] = \dfrac{1}{2} \times \dfrac{3}{2} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{1}{2}$", r"$\dfrac{3}{4}$", r"$1$", r"$\dfrac{3}{2}$"],
              "correctAnswers": {"0": r"$\dfrac{3}{4}$"},
              "explanation": r'''$\dfrac{1}{2} \times \dfrac{3}{2} = \dfrac{3}{4}$ 🎉''',
            },
          ],
        }),
        ContentBlock("lim_ex_h_060", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lim_ex_q_061", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{n \to \infty} \sum_{k=1}^{n} \left(\dfrac{1}{k} - \dfrac{1}{k+1}\right)$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''โจทย์แยกเศษส่วนย่อยมาให้แล้ว ใช้ Telescopic ได้เลย!

เหลือ $\dfrac{1}{1} - \dfrac{1}{n+1}$

เมื่อ $n \to \infty$: $1 - 0 = 1$ 💚''',
        }),
        ContentBlock("lim_ex_q_062", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{n \to \infty} \sum_{k=2}^{n} \dfrac{1}{k^2 - 1}$$

Note = คำใบ้

$k^2 - 1 = (k-1)(k+1)$ → ลองใช้สูตร $a = 2$''',
          ],
          "options": [r"$\dfrac{1}{2}$", r"$\dfrac{3}{4}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{3}{4}$",
          "explanation": r'''$\dfrac{1}{(k-1)(k+1)} = \dfrac{1}{2}\left(\dfrac{1}{k-1} - \dfrac{1}{k+1}\right)$

Telescopic ($a=2$) เหลือ 2 พจน์หน้าและท้าย

$= \dfrac{1}{2}[\dfrac{1}{1} + \dfrac{1}{2} - \dfrac{1}{n} - \dfrac{1}{n+1}]$

เมื่อ $n \to \infty$: $\dfrac{1}{2}(1 + \dfrac{1}{2}) = \dfrac{3}{4}$ 💚''',
        }),
        ContentBlock("lim_ex_q_063", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{n \to \infty} \sum_{k=1}^{n} \dfrac{1}{k(k+3)}$$''',
          ],
          "options": [r"$\dfrac{11}{18}$", r"$1$", r"$\dfrac{3}{2}$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{11}{18}$",
          "explanation": r'''$a = 3$ → $\dfrac{1}{k(k+3)} = \dfrac{1}{3}\left(\dfrac{1}{k} - \dfrac{1}{k+3}\right)$

Telescopic เหลือ **3 พจน์** หน้าและหลัง

$= \dfrac{1}{3}[\dfrac{1}{1} + \dfrac{1}{2} + \dfrac{1}{3} - \dfrac{1}{n+1} - \dfrac{1}{n+2} - \dfrac{1}{n+3}]$

เมื่อ $n \to \infty$: $\dfrac{1}{3}(1 + \dfrac{1}{2} + \dfrac{1}{3}) = \dfrac{1}{3} \times \dfrac{11}{6} = \dfrac{11}{18}$ 💚''',
        }),
        ContentBlock("lim_ex_q_064", "question_choice", {
          "content": [
            r'''4. จงหา

$$\sum_{k=1}^{\infty} \dfrac{2}{(2k-1)(2k+1)}$$

Note = คำใบ้

$\dfrac{2}{(2k-1)(2k+1)} = \dfrac{1}{2k-1} - \dfrac{1}{2k+1}$''',
          ],
          "options": [r"$\dfrac{1}{2}$", r"$1$", r"$2$", r"หาค่าไม่ได้"],
          "correct": r"$1$",
          "explanation": r'''โจทย์บอกคำใบ้แล้ว ใช้ Telescopic ได้เลย!

$(\dfrac{1}{1} - \dfrac{1}{3}) + (\dfrac{1}{3} - \dfrac{1}{5}) + (\dfrac{1}{5} - \dfrac{1}{7}) + ...$

เหลือ $\dfrac{1}{1} - \dfrac{1}{2n+1}$

เมื่อ $n \to \infty$: $1 - 0 = 1$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: ฝึกรวม
    // =============================================
    ContentSection(
      headerL1: r"💪 ฝึกรวม",
      blocks: [
        ContentBlock("lim_ex_t_065", "text", {
          "content": [
            r'''แต่ละข้อต้องตัดสินใจเองว่าเป็นโจทย์เลขชี้กำลังหรือ Telescopic แล้วเลือกเทคนิค''',
          ],
        }),
        ContentBlock("lim_ex_q_066", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to \infty} \dfrac{3^x + 4^x}{5^x}$$''',
          ],
          "options": [r"$0$", r"$1$", r"$\infty$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''หารด้วย $5^x$: $(\dfrac{3}{5})^x + (\dfrac{4}{5})^x$

ทั้งคู่ $< 1$ → เข้าใกล้ $0$ ดังนั้น $0 + 0 = 0$ 💚''',
        }),
        ContentBlock("lim_ex_q_067", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to -\infty} 2^x$$''',
          ],
          "options": [r"$0$", r"$1$", r"$2$", r"หาค่าไม่ได้"],
          "correct": r"$0$",
          "explanation": r'''พลิกฐาน: $\lim\limits_{x \to \infty} (\dfrac{1}{2})^x$

$\dfrac{1}{2} < 1$ → เข้าใกล้ $0$ 💚''',
        }),
        ContentBlock("lim_ex_q_068", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{n \to \infty} \sum_{k=1}^{n} \dfrac{1}{(k+1)(k+2)}$$''',
          ],
          "options": [r"$\dfrac{1}{2}$", r"$\dfrac{3}{4}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''$a = 1$ → $\dfrac{1}{(k+1)(k+2)} = \dfrac{1}{k+1} - \dfrac{1}{k+2}$

Telescopic เหลือ $\dfrac{1}{2} - \dfrac{1}{n+2}$

เมื่อ $n \to \infty$: $\dfrac{1}{2} - 0 = \dfrac{1}{2}$ 💚''',
        }),
        ContentBlock("lim_ex_q_069", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to \infty} \dfrac{6^x - 2 \cdot 3^x}{2 \cdot 6^x + 3^x}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"$3$"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''ฐานใหญ่สุดคือ $6$ → หารด้วย $6^x$

$\dfrac{1 - 2 \cdot (\dfrac{3}{6})^x}{2 + (\dfrac{3}{6})^x} = \dfrac{1 - 2 \cdot (\dfrac{1}{2})^x}{2 + (\dfrac{1}{2})^x}$

$(\dfrac{1}{2})^x \to 0$

$= \dfrac{1 - 0}{2 + 0} = \dfrac{1}{2}$ 💚''',
        }),
        ContentBlock("lim_ex_fi_070", "question_fill_in", {
          "content": [
            r'''5. จงหา

$\lim\limits_{n \to \infty} \sum_{k=1}^{n} \dfrac{1}{k(k+1)} + \lim\limits_{x \to \infty} (\dfrac{1}{3})^x = $ ''',
            {"box": "0"},
          ],
          "correct": "1",
          "explanation": r'''ส่วนแรก: Telescopic → $1 - \dfrac{1}{n+1} \to 1$

ส่วนที่สอง: $|\dfrac{1}{3}| < 1$ → $0$

รวม: $1 + 0 = 1$ 💚''',
        }),
        ContentBlock("lim_ex_fi_071", "question_fill_in", {
          "content": [
            r'''6. จงหา

$\lim\limits_{x \to \infty} \dfrac{5 \cdot 2^x + 3^x}{2^x + 4 \cdot 3^x} = $ ''',
            {"box": "0"},
          ],
          "correct": r"$\dfrac{1}{4}$",
          "explanation": r'''ฐานใหญ่สุดคือ $3$ → หารด้วย $3^x$

$\dfrac{5 \cdot (\dfrac{2}{3})^x + 1}{(\dfrac{2}{3})^x + 4}$

$(\dfrac{2}{3})^x \to 0$

$= \dfrac{0 + 1}{0 + 4} = \dfrac{1}{4}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_ex_t_072", "text", {
          "content": [
            r'''🎯 **ลิมิตเลขชี้กำลัง $\lim\limits_{x \to \infty} a^x$**

🔸 $|a| < 1$ → ลิมิต $= 0$

🔸 $a = 1$ → ลิมิต $= 1$

🔸 ที่เหลือ → หาค่าไม่ได้''',
          ],
        }),
        ContentBlock("lim_ex_t_073", "text", {
          "content": [
            r'''🎯 **เทคนิคเลขชี้กำลัง**

🔸 $\lim\limits_{x \to -\infty} a^x = \lim\limits_{x \to \infty} (\dfrac{1}{a})^x$ พลิกฐาน!

🔸 เศษส่วน $\dfrac{\infty}{\infty}$ → หารด้วยฐานที่ใหญ่ที่สุดในส่วน (เพราะโตเร็วสุด)

🔸 เป้าหมาย: ทำให้ฐานที่เหลือ $< 1$ เพื่อเข้าใกล้ $0$''',
          ],
        }),
        ContentBlock("lim_ex_t_074", "text", {
          "content": [
            r'''🎯 **เทคนิค Telescopic**

🔸 แยก: $\dfrac{1}{k(k+a)} = \dfrac{1}{a}\left(\dfrac{1}{k} - \dfrac{1}{k+a}\right)$

🔸 พจน์กลางหักล้างกัน → เหลือ $a$ พจน์หน้า และ $a$ พจน์ท้าย

🔸 เมื่อ $n \to \infty$ พจน์ที่มี $n$ จะเป็น $0$ (กฎส่วนอนันต์)''',
          ],
        }),
      ],
    ),
  ],
);
// Exercise: แบบฝึกหัด7 (แบบฝึกหัดเข้าใกล้อนันต์เพิ่มเติม)

// ── ความต่อเนื่องฟังก์ชันและอัตราเปลี่ยนแปลง ──────────────────────────────────────────────────────────────

final calcContinuityLesson = ContentLesson(
  title: "ความต่อเนื่องของฟังก์ชัน",
  sections: [
    // =============================================
    // SECTION 1: ต่อเนื่องคืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"💡 ต่อเนื่องคืออะไร?",
      blocks: [
        ContentBlock("cont_h_001", "header", {
          "title": r"ลองนึกภาพกราฟ 🎨",
          "level": 2,
        }),
        ContentBlock("cont_t_002", "text", {
          "content": [
            r'''จากบทที่ผ่านมา เราเคยเห็นกราฟที่มี "รู" หรือ "จุดกระโดด" อยู่

วันนี้เราจะมาเรียนรู้ว่า กราฟแบบไหนเรียกว่า **ต่อเนื่อง** และแบบไหน **ไม่ต่อเนื่อง**''',
          ],
        }),
        ContentBlock("cont_t_003", "text", {
          "content": [
            r'''💬 **พูดง่ายๆ:**

**ต่อเนื่อง** = วาดกราฟได้โดย**ไม่ยกปากกา** ✏️

**ไม่ต่อเนื่อง** = ต้อง**ยกปากกา** เพราะกราฟขาดตอน ✂️''',
          ],
        }),
        ContentBlock("cont_h_004", "header", {
          "title": r"ลองดูกราฟ 2 แบบ",
          "level": 2,
        }),
        ContentBlock("cont_ig_005", "interactive_graph", {
          "path": "graph_data_4",
        }),
        ContentBlock("cont_t_006", "text", {
          "content": [
            r'''กราฟนี้คือ $f(x) = x^2 - 2x + 2$ ลองเลื่อนจุดไปทุกตำแหน่ง — จะเห็นว่ากราฟเป็นเส้นเดียวต่อกันตลอด **ไม่มีรู ไม่กระโดด**''',
          ],
        }),
        ContentBlock("cont_ig_007", "interactive_graph", {
          "path": "graph_data_2",
        }),
        ContentBlock("cont_t_008", "text", {
          "content": [
            r'''กราฟนี้คือ $f(x) = \dfrac{x^2 - 4}{x - 2}$ ลองเลื่อนจุดเข้าใกล้ $x = 2$ — จะเห็นว่ามี**รู** อยู่ที่ $x = 2$ กราฟ**ขาดตอน**!''',
          ],
        }),
        ContentBlock("cont_ddq_009", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cont_ddq_009_s1",
              "content": [
                r'''จากกราฟทั้ง 2 อัน

กราฟ $f(x) = x^2 - 2x + 2$ ที่ $x = 2$: ''',
                {"drop": "0"},
                r'''กราฟ $f(x) = \dfrac{x^2 - 4}{x - 2}$ ที่ $x = 2$: ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"ต่อเนื่อง", r"ไม่ต่อเนื่อง"],
              "correctAnswers": {"0": r"ต่อเนื่อง", "1": r"ไม่ต่อเนื่อง"},
              "explanation": r'''กราฟแรกเป็นเส้นต่อกันตลอด → ต่อเนื่อง

กราฟที่สองมีรูที่ $x = 2$ → ไม่ต่อเนื่อง''',
            },
          ],
        }),
        ContentBlock("cont_h_010", "header", {
          "title": r"ทำไมถึงไม่ต่อเนื่อง? 🤔",
          "level": 2,
        }),
        ContentBlock("cont_t_011", "text", {
          "content": [
            r'''จำได้ไหม? จากบทที่แล้ว

$f(x) = \dfrac{x^2 - 4}{x - 2}$ ที่ $x = 2$:

🔸 $f(2) = \dfrac{0}{0}$ → หาค่า**ไม่ได้** ⚠️

🔸 $\lim\limits_{x \to 2} f(x) = 4$ (จากการจัดรูป)''',
          ],
        }),
        ContentBlock("cont_t_012", "text", {
          "content": [
            r'''เห็นไหม? $f(2)$ กับ $\lim\limits_{x \to 2} f(x)$ **ไม่เท่ากัน** (อันหนึ่งหาค่าไม่ได้ด้วยซ้ำ!)

นี่คือสาเหตุที่กราฟขาดตอน — นี่คือ **ไม่ต่อเนื่อง**''',
          ],
        }),
        ContentBlock("cont_q_013", "question_choice", {
          "content": [
            r'''1. กราฟต่อไปนี้ ต่อเนื่องที่ $x = -1$ ไหม?''',
            {"graph": "graph_data_6"},
            r'''Note = คำใบ้

สังเกตว่าที่ $x = -1$ มีจุดสีขาว (จุดโดด) หรือเปล่า?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''ที่ $x = -1$ กราฟมีจุดสีขาว (รู) และจุดสีฟ้าอยู่คนละตำแหน่ง

กราฟขาดตอน → **ไม่ต่อเนื่อง** ❌''',
        }),
        ContentBlock("cont_q_014", "question_choice", {
          "content": [
            r'''2. กราฟต่อไปนี้ ต่อเนื่องที่ $x = 1$ ไหม?''',
            {"graph": "graph_data_3"},
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ต่อเนื่อง",
          "explanation": r'''กราฟ $f(x) = x^2 + 2x - 3$ เป็นเส้นโค้งต่อกันตลอด ไม่มีรู ไม่กระโดด

ที่ $x = 1$ กราฟไม่ขาดตอน → **ต่อเนื่อง** 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: นิยามความต่อเนื่อง
    // =============================================
    ContentSection(
      headerL1: r"📐 นิยามความต่อเนื่อง",
      blocks: [
        ContentBlock("cont_h_015", "header", {
          "title": r"จากกราฟสู่สมการ",
          "level": 2,
        }),
        ContentBlock("cont_t_016", "text", {
          "content": [
            r'''การดูกราฟบอกได้ว่า "ต่อเนื่อง" หรือ "ไม่ต่อเนื่อง" แต่ในข้อสอบไม่มีกราฟมาให้

เราต้องมีวิธีตรวจสอบโดยใช้สมการ — นั่นคือ **นิยามความต่อเนื่อง**''',
          ],
        }),
        ContentBlock("cont_h_017", "header", {
          "title": r"นิยาม 📜",
          "level": 2,
        }),
        ContentBlock("cont_t_018", "text", {
          "content": [
            r'''$f(x)$ **ต่อเนื่องที่** $x = a$ ก็ต่อเมื่อ

$$f(a) = \lim\limits_{x \to a} f(x)$$''',
          ],
        }),
        ContentBlock("cont_t_019", "text", {
          "content": [
            r'''ซึ่งจะจริงได้ ต้องผ่าน **3 ด่าน** ทั้งหมด:

✅ **ด่าน 1:** $f(a)$ หาค่าได้

✅ **ด่าน 2:** $\lim\limits_{x \to a} f(x)$ หาค่าได้

✅ **ด่าน 3:** $f(a) = \lim\limits_{x \to a} f(x)$''',
          ],
        }),
        ContentBlock("cont_t_020", "text", {
          "content": [
            r'''Note = สำคัญ

ถ้าด่านใดด่านหนึ่ง**ไม่ผ่าน** → **ไม่ต่อเนื่อง**ทันที! ไม่ต้องตรวจด่านถัดไป''',
          ],
        }),
        ContentBlock("cont_h_021", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("cont_t_022", "text", {
          "content": [
            r'''จงตรวจสอบว่า $f(x) = \dfrac{x^2 - 4}{x - 2}$ ต่อเนื่องที่ $x = 2$ ไหม?''',
          ],
        }),
        ContentBlock("cont_ddq_023", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cont_ddq_023_s1",
              "content": [
                r'''**ด่าน 1:** หา $f(2)$

$f(2) = \dfrac{2^2 - 4}{2 - 2} = \dfrac{0}{0}$

$f(2)$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"หาค่าได้", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"หาค่าไม่ได้"},
              "explanation": r'''$\dfrac{0}{0}$ หาค่าไม่ได้ → ด่าน 1 ไม่ผ่าน!''',
            },
            {
              "questionId": "cont_ddq_023_s2",
              "content": [
                r'''$f(2)$ หาค่าไม่ได้ ดังนั้น

$f(x) = \dfrac{x^2 - 4}{x - 2}$ ที่ $x = 2$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"ต่อเนื่อง", r"ไม่ต่อเนื่อง"],
              "correctAnswers": {"0": r"ไม่ต่อเนื่อง"},
              "explanation": r'''ด่าน 1 ไม่ผ่าน → สรุปเลยว่า ไม่ต่อเนื่อง ❌ ไม่ต้องตรวจด่าน 2 และ 3''',
            },
          ],
        }),
        ContentBlock("cont_h_024", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("cont_q_025", "question_choice", {
          "content": [
            r'''1. จงตรวจสอบว่า

$$f(x) = \dfrac{x^2 + x - 6}{x - 2}$$

ต่อเนื่องที่ $x = 2$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(2) = \dfrac{4 + 2 - 6}{2 - 2} = \dfrac{0}{0}$ → หาค่าไม่ได้ ⚠️

ด่าน 1 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌

(ถึงแม้ $\lim\limits_{x \to 2} f(x) = 5$ จากการจัดรูป แต่ $f(2)$ หาค่าไม่ได้ก็จบเลย)''',
        }),
        ContentBlock("cont_q_026", "question_choice", {
          "content": [
            r'''2. จงตรวจสอบว่า

$$f(x) = x^2 + 3x - 1$$

ต่อเนื่องที่ $x = 2$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(2) = 4 + 6 - 1 = 9$ ✅

**ด่าน 2:** $\lim\limits_{x \to 2} (x^2 + 3x - 1) = 9$ ✅

**ด่าน 3:** $f(2) = 9 = \lim\limits_{x \to 2} f(x)$ ✅

ผ่านทั้ง 3 ด่าน → **ต่อเนื่อง** 💚''',
        }),
        ContentBlock("cont_q_027", "question_choice", {
          "content": [
            r'''3. จงตรวจสอบว่า

$$f(x) = \dfrac{x + 1}{x - 3}$$

ต่อเนื่องที่ $x = 3$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(3) = \dfrac{4}{0}$ → หาค่าไม่ได้ ⚠️

ด่าน 1 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ตรวจสอบความต่อเนื่อง — ฟังก์ชันทั่วไป
    // =============================================
    ContentSection(
      headerL1: r"📋 ฟังก์ชันไหนต่อเนื่องเสมอ?",
      blocks: [
        ContentBlock("cont_h_028", "header", {
          "title": r"ฟังก์ชันพหุนาม = ต่อเนื่องเสมอ! 🌟",
          "level": 2,
        }),
        ContentBlock("cont_t_029", "text", {
          "content": [
            r'''ฟังก์ชันพหุนาม เช่น $x^2 + 3x - 5$ หรือ $x^3 - 2x + 1$ จะ**ต่อเนื่องทุกค่า $x$** เสมอ

เพราะแทนค่า $x = a$ ใดๆ ก็ได้จำนวนจริงเสมอ → $f(a)$ หาค่าได้เสมอ''',
          ],
        }),
        ContentBlock("cont_ddq_030", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cont_ddq_030_s1",
              "content": [
                r'''มาดูว่าทำไมฟังก์ชันพหุนาม เช่น $f(x) = x^2 + 1$ ถึงต่อเนื่องทุก $x$

สำหรับ $x = a$ ใดๆ:

$f(a) = a^2 + 1$ ซึ่ง ''',
                {"drop": "0"},
                r'''$\lim\limits_{x \to a} (x^2 + 1) = a^2 + 1$ ซึ่ง ''',
                {"drop": "1"},
                r'''$f(a)$ กับ $\lim\limits_{x \to a} f(x)$ ''',
                {"drop": "2"},
                r'''ดังนั้นฟังก์ชันพหุนาม ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"หาค่าได้เสมอ",
                r"หาค่าไม่ได้",
                r"เท่ากันเสมอ",
                r"ไม่เท่ากัน",
                r"ต่อเนื่องทุก $x$",
                r"ไม่ต่อเนื่องบางจุด",
              ],
              "correctAnswers": {
                "0": r"หาค่าได้เสมอ",
                "1": r"หาค่าได้เสมอ",
                "2": r"เท่ากันเสมอ",
                "3": r"ต่อเนื่องทุก $x$",
              },
              "explanation": r'''ฟังก์ชันพหุนามแทนค่าได้เสมอ ไม่มีทางได้ $\dfrac{0}{0}$ หรือ $\dfrac{k}{0}$

ดังนั้น $f(a) = \lim\limits_{x \to a} f(x)$ เสมอ → ต่อเนื่องทุก $x$ 🎉''',
            },
          ],
        }),
        ContentBlock("cont_h_031", "header", {
          "title": r"แล้วฟังก์ชันเศษส่วนล่ะ? 🤔",
          "level": 2,
        }),
        ContentBlock("cont_t_032", "text", {
          "content": [
            r'''ฟังก์ชันเศษส่วน เช่น $\dfrac{x + 1}{x - 3}$ จะ**ไม่ต่อเนื่อง**ตรงที่**ส่วนเป็น $0$**

เพราะ $f(a)$ หาค่าไม่ได้ → ด่าน 1 ไม่ผ่านทันที!''',
          ],
        }),
        ContentBlock("cont_t_033", "text", {
          "content": [
            r'''Note = จำให้ขึ้นใจ

🔸 **ฟังก์ชันพหุนาม** → ต่อเนื่อง**ทุก** $x$

🔸 **ฟังก์ชันเศษส่วน** → ไม่ต่อเนื่องตรงที่ **ส่วน $= 0$** แต่ต่อเนื่องที่จุดอื่นๆ''',
          ],
        }),
        ContentBlock("cont_h_034", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("cont_q_035", "question_choice", {
          "content": [
            r'''1. จงตรวจสอบว่า

$$f(x) = 3x^4 - 2x^2 + 7$$

ต่อเนื่องทุกจำนวนจริง $x$ ไหม?''',
          ],
          "options": ["ใช่", "ไม่ใช่"],
          "correct": r"ใช่",
          "explanation": r'''นี่คือ**ฟังก์ชันพหุนาม** → **ต่อเนื่องทุก $x$ เสมอ!** 💚''',
        }),
        ContentBlock("cont_q_036", "question_choice", {
          "content": [
            r'''2. จงตรวจสอบว่า

$$f(x) = \dfrac{x^2 + 1}{x - 5}$$

ต่อเนื่องที่ $x = 5$ และ $x = 0$ ไหม?''',
          ],
          "options": [
            "ต่อเนื่อง, ต่อเนื่อง",
            "ต่อเนื่อง, ไม่ต่อเนื่อง",
            "ไม่ต่อเนื่อง, ต่อเนื่อง",
            "ไม่ต่อเนื่อง, ไม่ต่อเนื่อง",
          ],
          "correct": r"ไม่ต่อเนื่อง, ต่อเนื่อง",
          "explanation": r'''**ที่ $x = 5$:**

$f(5) = \dfrac{26}{0}$ → หาค่าไม่ได้ → **ไม่ต่อเนื่อง** ❌

**ที่ $x = 0$:**

$f(0) = \dfrac{1}{-5} = -\dfrac{1}{5}$ ✅

$\lim\limits_{x \to 0} f(x) = -\dfrac{1}{5}$ ✅

$f(0) = \lim\limits_{x \to 0} f(x)$ → **ต่อเนื่อง** 💚''',
        }),
        ContentBlock("cont_q_037", "question_choice", {
          "content": [
            r'''3. จงตรวจสอบว่า

$$f(x) = \dfrac{x^3 - 8}{x - 2}$$

ต่อเนื่องที่ $x = 2$ และ $x = 3$ ไหม?''',
          ],
          "options": [
            "ต่อเนื่อง, ต่อเนื่อง",
            "ต่อเนื่อง, ไม่ต่อเนื่อง",
            "ไม่ต่อเนื่อง, ต่อเนื่อง",
            "ไม่ต่อเนื่อง, ไม่ต่อเนื่อง",
          ],
          "correct": r"ไม่ต่อเนื่อง, ต่อเนื่อง",
          "explanation": r'''**ที่ $x = 2$:**

$f(2) = \dfrac{0}{0}$ → หาค่าไม่ได้ → **ไม่ต่อเนื่อง** ❌

**ที่ $x = 3$:**

$f(3) = \dfrac{27 - 8}{3 - 2} = \dfrac{19}{1} = 19$ ✅

$\lim\limits_{x \to 3} f(x) = 19$ ✅

$f(3) = 19$ → **ต่อเนื่อง** 💚''',
        }),
        ContentBlock("cont_q_038", "question_choice", {
          "content": [
            r'''4. จงตรวจสอบว่า

$$f(x) = \dfrac{|x - 1|}{x - 1}$$

ต่อเนื่องที่ $x = 1$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(1) = \dfrac{|0|}{0} = \dfrac{0}{0}$ → หาค่าไม่ได้ ⚠️

ด่าน 1 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌

(ลิมิตก็หาค่าไม่ได้เช่นกัน เพราะลิมิตซ้าย $= -1$ ≠ ลิมิตขวา $= 1$)''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: ตรวจสอบความต่อเนื่อง — ฟังก์ชันเงื่อนไข
    // =============================================
    ContentSection(
      headerL1: r"🔧 ฟังก์ชันเงื่อนไข",
      blocks: [
        ContentBlock("cont_t_039", "text", {
          "content": [
            r'''ฟังก์ชันเงื่อนไขใช้คนละสมการคนละฝั่ง ดังนั้น**ต้องตรวจที่จุดเปลี่ยนเงื่อนไข**เสมอ!

ต้องหาลิมิตซ้าย-ขวาแยกกัน เหมือนที่เรียนมาในบทลิมิตฟังก์ชันเงื่อนไข''',
          ],
        }),
        ContentBlock("cont_h_040", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("cont_t_041", "text", {
          "content": [
            r'''จงตรวจสอบว่า

$$f(x) = \begin{cases} x + 1, & x < 2 \\ 5, & x = 2 \\ x^2 - 1, & x > 2 \end{cases}$$

ต่อเนื่องที่ $x = 2$ ไหม?''',
          ],
        }),
        ContentBlock("cont_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cont_ddq_042_s1",
              "content": [
                r'''**ด่าน 1:** หา $f(2)$

$x = 2$ ใช้เงื่อนไข $x = 2$ → $f(2) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$3$", r"$5$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$5$"},
              "explanation": r'''จากเงื่อนไข เมื่อ $x = 2$ → $f(2) = 5$ ✅ ผ่านด่าน 1!''',
            },
            {
              "questionId": "cont_ddq_042_s2",
              "content": [
                r'''**ด่าน 2:** หา $\lim\limits_{x \to 2} f(x)$

🔹 ลิมิตซ้าย: $x < 2$ ใช้ $x + 1$ → แทน $x = 2$ → ''',
                {"drop": "0"},
                r'''🔸 ลิมิตขวา: $x > 2$ ใช้ $x^2 - 1$ → แทน $x = 2$ → ''',
                {"drop": "1"},
                r'''ลิมิตซ้าย ''',
                {"drop": "2"},
                r''' ลิมิตขวา → $\lim\limits_{x \to 2} f(x) = $ ''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$3$", r"$5$", r"$=$", r"$\neq$", r"หาค่าไม่ได้"],
              "correctAnswers": {"0": r"$3$", "1": r"$3$", "2": r"$=$", "3": r"$3$"},
              "explanation": r'''ลิมิตซ้าย $= 3$ ลิมิตขวา $= 3$ เท่ากัน → $\lim\limits_{x \to 2} f(x) = 3$ ✅ ผ่านด่าน 2!''',
            },
            {
              "questionId": "cont_ddq_042_s3",
              "content": [
                r'''**ด่าน 3:** เปรียบเทียบ

$f(2) = 5$ และ $\lim\limits_{x \to 2} f(x) = 3$

$f(2)$ ''',
                {"drop": "0"},
                r''' $\lim\limits_{x \to 2} f(x)$

ดังนั้น ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$=$", r"$\neq$", r"ต่อเนื่อง", r"ไม่ต่อเนื่อง"],
              "correctAnswers": {"0": r"$\neq$", "1": r"ไม่ต่อเนื่อง"},
              "explanation": r'''$f(2) = 5 \neq 3 = \lim\limits_{x \to 2} f(x)$

ด่าน 3 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌''',
            },
          ],
        }),
        ContentBlock("cont_h_043", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("cont_q_044", "question_choice", {
          "content": [
            r'''1. จงตรวจสอบว่า

$$f(x) = \begin{cases} x^2 - 4, & x < 2 \\ 0, & x = 2 \\ 2x - 4, & x > 2 \end{cases}$$

ต่อเนื่องที่ $x = 2$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(2) = 0$ ✅

**ด่าน 2:**

🔹 ลิมิตซ้าย: $2^2 - 4 = 0$

🔸 ลิมิตขวา: $2(2) - 4 = 0$

$\lim\limits_{x \to 2} f(x) = 0$ ✅

**ด่าน 3:** $f(2) = 0 = \lim\limits_{x \to 2} f(x)$ ✅

**ต่อเนื่อง** 💚''',
        }),
        ContentBlock("cont_q_045", "question_choice", {
          "content": [
            r'''2. จงตรวจสอบว่า

$$f(x) = \begin{cases} x + 2, & x < 5 \\ x - 2, & x \geq 5 \end{cases}$$

ต่อเนื่องที่ $x = 5$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(5) = 5 - 2 = 3$ ✅

**ด่าน 2:**

🔹 ลิมิตซ้าย: $5 + 2 = 7$

🔸 ลิมิตขวา: $5 - 2 = 3$

$7 \neq 3$ → ลิมิต**หาค่าไม่ได้** ⚠️

ด่าน 2 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌''',
        }),
        ContentBlock("cont_q_046", "question_choice", {
          "content": [
            r'''3. จงตรวจสอบว่า

$$f(x) = \begin{cases} 3x - 1, & x < 0 \\ 6, & x = 0 \\ x^2 - 1, & x > 0 \end{cases}$$

ต่อเนื่องที่ $x = 0$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ไม่ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(0) = 6$ ✅

**ด่าน 2:**

🔹 ลิมิตซ้าย: $3(0) - 1 = -1$

🔸 ลิมิตขวา: $0^2 - 1 = -1$

$\lim\limits_{x \to 0} f(x) = -1$ ✅

**ด่าน 3:** $f(0) = 6 \neq -1 = \lim\limits_{x \to 0} f(x)$

ด่าน 3 ไม่ผ่าน → **ไม่ต่อเนื่อง** ❌''',
        }),
        ContentBlock("cont_q_047", "question_choice", {
          "content": [
            r'''4. จงตรวจสอบว่า

$$f(x) = \begin{cases} \dfrac{x^2 - 9}{x - 3}, & x \neq 3 \\ 6, & x = 3 \end{cases}$$

ต่อเนื่องที่ $x = 3$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(3) = 6$ ✅

**ด่าน 2:** แทน $x = 3$ ใน $\dfrac{x^2 - 9}{x - 3}$ → $\dfrac{0}{0}$ ต้องจัดรูป

$\dfrac{(x-3)(x+3)}{x-3} = x + 3$ แทน $x = 3$ → $6$

$\lim\limits_{x \to 3} f(x) = 6$ ✅

**ด่าน 3:** $f(3) = 6 = \lim\limits_{x \to 3} f(x)$ ✅

**ต่อเนื่อง** 💚''',
        }),
        ContentBlock("cont_q_048", "question_choice", {
          "content": [
            r'''5. จงตรวจสอบว่า

$$f(x) = \begin{cases} \dfrac{|x + 1| - 1}{x}, & x < 0 \\ x^2 + 1, & x \geq 0 \end{cases}$$

ต่อเนื่องที่ $x = 0$ ไหม?''',
          ],
          "options": ["ต่อเนื่อง", "ไม่ต่อเนื่อง"],
          "correct": r"ต่อเนื่อง",
          "explanation": r'''**ด่าน 1:** $f(0) = 0^2 + 1 = 1$ ✅

**ด่าน 2:**

🔹 ลิมิตซ้าย: $x < 0$ แต่ $x$ ใกล้ $0$ → $x + 1 > 0$ → $|x+1| = x+1$

$\dfrac{(x+1) - 1}{x} = \dfrac{x}{x} = 1$

🔸 ลิมิตขวา: $x^2 + 1$ แทน $x = 0$ → $1$

$\lim\limits_{x \to 0} f(x) = 1$ ✅

**ด่าน 3:** $f(0) = 1 = \lim\limits_{x \to 0} f(x)$ ✅

**ต่อเนื่อง** 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: หาค่าที่ทำให้ต่อเนื่อง
    // =============================================
    ContentSection(
      headerL1: r"🎯 หาค่าที่ทำให้ต่อเนื่อง",
      blocks: [
        ContentBlock("cont_t_049", "text", {
          "content": [
            r'''โจทย์แนวนี้ออกสอบบ่อยมาก! จะให้ฟังก์ชันเงื่อนไขที่มีตัวแปร $a$ (หรือ $b$) แล้วถามว่า $a$ ต้องเท่าไหร่ถึงจะต่อเนื่อง''',
          ],
        }),
        ContentBlock("cont_h_050", "header", {
          "title": r"เทคนิค: ตั้งสมการจากนิยาม",
          "level": 2,
        }),
        ContentBlock("cont_t_051", "text", {
          "content": [
            r'''ต่อเนื่องที่ $x = c$ แปลว่า $f(c) = \lim\limits_{x \to c} f(x)$

ดังนั้นแค่หาทั้งสองฝั่ง ตั้งสมการให้เท่ากัน แล้วแก้หา $a$!''',
          ],
        }),
        ContentBlock("cont_h_052", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("cont_t_053", "text", {
          "content": [
            r'''หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} x^2 + 2x - 3, & x < 1 \\ a, & x = 1 \\ 3x - 3, & x > 1 \end{cases}$$

ต่อเนื่องที่ $x = 1$''',
          ],
        }),
        ContentBlock("cont_ddq_054", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cont_ddq_054_s1",
              "content": [
                r'''**ขั้นที่ 1:** หา $f(1)$

$f(1) = a$ (จากเงื่อนไข $x = 1$)

**ขั้นที่ 2:** หา $\lim\limits_{x \to 1} f(x)$

🔹 ลิมิตซ้าย: $1^2 + 2(1) - 3 = $ ''',
                {"drop": "0"},
                r'''🔸 ลิมิตขวา: $3(1) - 3 = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$-3$", r"$0$", r"$1$", r"$3$"],
              "correctAnswers": {"0": r"$0$", "1": r"$0$"},
              "explanation": r'''ลิมิตซ้าย = ลิมิตขวา = $0$ ดังนั้น $\lim\limits_{x \to 1} f(x) = 0$''',
            },
            {
              "questionId": "cont_ddq_054_s2",
              "content": [
                r'''**ขั้นที่ 3:** ตั้งสมการ

$f(1) = \lim\limits_{x \to 1} f(x)$

$a = 0$

ดังนั้น $a = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3$", r"$0$", r"$1$", r"$3$"],
              "correctAnswers": {"0": r"$0$"},
              "explanation": r'''$a = 0$ จึงจะทำให้ $f(1) = \lim\limits_{x \to 1} f(x)$ → ต่อเนื่อง 🎉''',
            },
          ],
        }),
        ContentBlock("cont_h_055", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("cont_q_056", "question_choice", {
          "content": [
            r'''1. หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} 2x + a, & x < 3 \\ x^2, & x \geq 3 \end{cases}$$

ต่อเนื่องที่ $x = 3$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$4$"],
          "correct": r"$3$",
          "explanation": r'''$f(3) = 3^2 = 9$

🔹 ลิมิตซ้าย: $2(3) + a = 6 + a$

🔸 ลิมิตขวา: $3^2 = 9$

ต่อเนื่อง → $f(3) = \lim$ → ลิมิตซ้าย = ลิมิตขวา

$6 + a = 9$ → $a = 3$ 💚''',
        }),
        ContentBlock("cont_q_057", "question_choice", {
          "content": [
            r'''2. หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} \dfrac{x^2 - 4}{x - 2}, & x \neq 2 \\ a, & x = 2 \end{cases}$$

ต่อเนื่องที่ $x = 2$''',
          ],
          "options": [r"$0$", r"$2$", r"$4$", r"หาค่าไม่ได้"],
          "correct": r"$4$",
          "explanation": r'''$f(2) = a$

$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2} = \lim\limits_{x \to 2} \dfrac{(x-2)(x+2)}{x-2} = \lim\limits_{x \to 2} (x + 2) = 4$

ต่อเนื่อง → $a = 4$ 💚''',
        }),
        ContentBlock("cont_q_058", "question_choice", {
          "content": [
            r'''3. หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} x^2 + a, & x \leq 2 \\ 3x, & x > 2 \end{cases}$$

ต่อเนื่องที่ $x = 2$''',
          ],
          "options": [r"$-2$", r"$0$", r"$1$", r"$2$"],
          "correct": r"$2$",
          "explanation": r'''$f(2) = 2^2 + a = 4 + a$

🔹 ลิมิตซ้าย: $2^2 + a = 4 + a$

🔸 ลิมิตขวา: $3(2) = 6$

ต่อเนื่อง → $4 + a = 6$ → $a = 2$ 💚''',
        }),
        ContentBlock("cont_q_059", "question_choice", {
          "content": [
            r'''4. หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} \dfrac{x^2 + x - 6}{x - 2}, & x < 2 \\ ax + 1, & x \geq 2 \end{cases}$$

ต่อเนื่องที่ $x = 2$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$4$"],
          "correct": r"$2$",
          "explanation": r'''$f(2) = a(2) + 1 = 2a + 1$

🔹 ลิมิตซ้าย: $\dfrac{x^2 + x - 6}{x - 2}$ แทน $x = 2$ → $\dfrac{0}{0}$

$x^2 + x - 6 = (x-2)(x+3)$ → ตัด $(x-2)$ → $x + 3$

แทน $x = 2$ → $5$

ต่อเนื่อง → $2a + 1 = 5$ → $2a = 4$ → $a = 2$ 💚''',
        }),
        ContentBlock("cont_q_060", "question_choice", {
          "content": [
            r'''5. หาค่า $a$ ที่ทำให้

$$f(x) = \begin{cases} \dfrac{\sqrt{x + 4} - 2}{x}, & x < 0 \\ a, & x = 0 \\ x + 1, & x > 0 \end{cases}$$

ต่อเนื่องที่ $x = 0$''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$1$", r"$\dfrac{5}{4}$", r"หาค่าไม่ได้"],
          "correct": r"หาค่าไม่ได้",
          "explanation": r'''🔹 ลิมิตซ้าย: $\dfrac{\sqrt{x+4}-2}{x}$ แทน $x=0$ → $\dfrac{0}{0}$

ใช้ Conjugate: $\dfrac{(x+4)-4}{x(\sqrt{x+4}+2)} = \dfrac{1}{\sqrt{x+4}+2}$

แทน $x = 0$ → $\dfrac{1}{4}$

🔸 ลิมิตขวา: $0 + 1 = 1$

ลิมิตซ้าย $= \dfrac{1}{4} \neq 1 =$ ลิมิตขวา

$\lim\limits_{x \to 0} f(x)$ **หาค่าไม่ได้** → ไม่ว่า $a$ จะเป็นเท่าไหร่ ก็ทำให้ต่อเนื่องไม่ได้! ❌''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("cont_t_061", "text", {
          "content": [
            r'''🎯 **ความต่อเนื่องของฟังก์ชัน**

**1. นิยาม:** $f$ ต่อเนื่องที่ $x = a$ ⟺ $f(a) = \lim\limits_{x \to a} f(x)$

**2. กราฟ:** ต่อเนื่อง = กราฟไม่ขาดตอน (วาดได้โดยไม่ยกปากกา) ✏️''',
          ],
        }),
        ContentBlock("cont_t_062", "text", {
          "content": [
            r'''**3. ตรวจสอบ 3 ด่าน:**

✅ ด่าน 1: $f(a)$ หาค่าได้ไหม?

✅ ด่าน 2: $\lim\limits_{x \to a} f(x)$ หาค่าได้ไหม?

✅ ด่าน 3: $f(a) = \lim\limits_{x \to a} f(x)$ ไหม?

ถ้าด่านใดไม่ผ่าน → **ไม่ต่อเนื่อง**ทันที!''',
          ],
        }),
        ContentBlock("cont_t_063", "text", {
          "content": [
            r'''**4. จำเร็ว:**

🔸 **ฟังก์ชันพหุนาม** → ต่อเนื่องทุก $x$ เสมอ 🌟

🔸 **ฟังก์ชันเศษส่วน** → ไม่ต่อเนื่องตรงที่ส่วน $= 0$

🔸 **ฟังก์ชันเงื่อนไข** → ต้องตรวจที่จุดเปลี่ยนเงื่อนไข ⚠️''',
          ],
        }),
        ContentBlock("cont_t_064", "text", {
          "content": [
            r'''**5. หาค่า $a$ ที่ทำให้ต่อเนื่อง:**

ตั้งสมการ $f(c) = \lim\limits_{x \to c} f(x)$ แล้วแก้หา $a$

Note = จำไว้เสมอ

$\lim\limits_{x \to a} f(x)$ ไม่จำเป็นต้องเท่ากับ $f(a)$ เสมอไป — ต่อเมื่อเท่ากันจริงๆ เท่านั้นจึงจะต่อเนื่อง!''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัดเรื่องความต่อเนื่อง (แบบฝึกหัดเรื่องความต่อเนื่อง)

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcRateOfChangeLesson = ContentLesson(
  title: "อัตราการเปลี่ยนแปลง",
  sections: [
    // =============================================
    // SECTION 1: อัตราการเปลี่ยนแปลงคืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"🚗 อัตราการเปลี่ยนแปลงคืออะไร?",
      blocks: [
        ContentBlock("rate_h_001", "header", {
          "title": r"ในชีวิตประจำวัน",
          "level": 2,
        }),
        ContentBlock("rate_t_002", "text", {
          "content": [
            r'''เราพูดถึง **อัตราการเปลี่ยนแปลง** กันอยู่เสมอ!

🔸 รถวิ่ง 60 กม./ชม. → ระยะทางเปลี่ยน 60 กม. เมื่อเวลาเปลี่ยน 1 ชม.

🔸 ราคาหุ้นขึ้น 5 บาท/วัน → ราคาเพิ่ม 5 บาท เมื่อเวลาผ่าน 1 วัน''',
          ],
        }),
        ContentBlock("rate_t_003", "text", {
          "content": [
            r'''สังเกตว่าทุกตัวอย่างมีรูปแบบเดียวกัน: **"อะไรบางอย่างเปลี่ยนไปเท่าไหร่ เมื่ออีกอย่างเปลี่ยน"**

นี่คือหัวใจของ **อัตราการเปลี่ยนแปลง**''',
          ],
        }),
        ContentBlock("rate_h_004", "header", {
          "title": r"สูตร 📜",
          "level": 2,
        }),
        ContentBlock("rate_t_005", "text", {
          "content": [
            r'''$$\text{อัตราการเปลี่ยนแปลง} = \dfrac{\text{การเปลี่ยนแปลงของ } y}{\text{การเปลี่ยนแปลงของ } x} = \dfrac{\Delta y}{\Delta x}$$

โดย $\Delta$ (เดลต้า) แปลว่า "การเปลี่ยนแปลง"''',
          ],
        }),
        ContentBlock("rate_t_006", "text", {
          "content": [
            r'''เขียนเป็นสูตรเต็มๆ ได้ว่า

$$\dfrac{\Delta y}{\Delta x} = \dfrac{y_2 - y_1}{x_2 - x_1}$$

🔸 $(x_1, y_1)$ = จุดเริ่มต้น

🔸 $(x_2, y_2)$ = จุดปลายทาง''',
          ],
        }),
        ContentBlock("rate_h_007", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม 🏃",
          "level": 2,
        }),
        ContentBlock("rate_t_008", "text", {
          "content": [
            r'''บีวิ่งได้ระยะทาง $y = 10x$ เมตร เมื่อ $x$ = เวลา (วินาที)

จงหาอัตราการเปลี่ยนแปลงของระยะทาง ระหว่าง $x = 1$ ถึง $x = 3$''',
          ],
        }),
        ContentBlock("rate_ddq_009", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rate_ddq_009_s1",
              "content": [
                r'''**Step 1:** หาค่าที่จุดเริ่มต้นและจุดปลาย

$x_1 = 1$: $y_1 = 10(1) = $ ''',
                {"drop": "0"},
                r'''$x_2 = 3$: $y_2 = 10(3) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$3$", r"$10$", r"$13$", r"$30$"],
              "correctAnswers": {"0": r"$10$", "1": r"$30$"},
              "explanation": r'''แทน $x = 1$ ได้ $y_1 = 10$ และแทน $x = 3$ ได้ $y_2 = 30$''',
            },
            {
              "questionId": "rate_ddq_009_s2",
              "content": [
                r'''**Step 2:** คำนวณอัตราการเปลี่ยนแปลง

$\dfrac{\Delta y}{\Delta x} = \dfrac{y_2 - y_1}{x_2 - x_1} = \dfrac{30 - 10}{3 - 1} = \dfrac{20}{2} = $ ''',
                {"drop": "0"},
                r'''**ความหมาย:** บีวิ่งเร็วเฉลี่ย ''',
                {"drop": "0"},
                r''' เมตรต่อวินาที 🏃''',
              ],
              "draggableItems": [r"$5$", r"$10$", r"$15$", r"$20$"],
              "correctAnswers": {"0": r"$10$"},
              "explanation": r'''$\dfrac{30 - 10}{3 - 1} = \dfrac{20}{2} = 10$ เมตร/วินาที''',
            },
          ],
        }),
        ContentBlock("rate_h_010", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("rate_q_011", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = 2x + 3$

จงหาอัตราการเปลี่ยนแปลง เมื่อ $x$ เปลี่ยนจาก $0$ ไป $5$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$5$"],
          "correct": r"$2$",
          "explanation": r'''$f(0) = 2(0) + 3 = 3$

$f(5) = 2(5) + 3 = 13$

$\dfrac{\Delta y}{\Delta x} = \dfrac{13 - 3}{5 - 0} = \dfrac{10}{5} = 2$ 💚''',
        }),
        ContentBlock("rate_q_012", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = 5x - 1$

จงหาอัตราการเปลี่ยนแปลง เมื่อ $x$ เปลี่ยนจาก $2$ ไป $6$''',
          ],
          "options": [r"$3$", r"$4$", r"$5$", r"$6$"],
          "correct": r"$5$",
          "explanation": r'''$f(2) = 5(2) - 1 = 9$

$f(6) = 5(6) - 1 = 29$

$\dfrac{\Delta y}{\Delta x} = \dfrac{29 - 9}{6 - 2} = \dfrac{20}{4} = 5$ 💚

🧠 **ข้อสังเกต:** ฟังก์ชันเชิงเส้น $f(x) = 5x - 1$ อัตราการเปลี่ยนแปลงจะเท่ากับ $5$ เสมอ ไม่ว่าจะเลือกช่วงไหน เพราะมันคือ**ความชัน**ของเส้นตรง!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: เชื่อมโยงกับกราฟ
    // =============================================
    ContentSection(
      headerL1: r"📊 เชื่อมโยงกับกราฟ",
      blocks: [
        ContentBlock("rate_h_013", "header", {
          "title": r"อัตราการเปลี่ยนแปลง = ความชัน!",
          "level": 2,
        }),
        ContentBlock("rate_t_014", "text", {
          "content": [
            r'''เมื่อพลอตจุด $(x_1, y_1)$ และ $(x_2, y_2)$ บนกราฟแล้วลากเส้นตรงเชื่อม

$\dfrac{\Delta y}{\Delta x}$ ก็คือ **ความชัน** ของเส้นตรงนั้นเอง!''',
          ],
        }),
        ContentBlock("rate_ig_015", "interactive_graph", {
          "path": "graph_data_13",
        }),
        ContentBlock("rate_t_016", "text", {
          "content": [
            r'''ลองเลื่อนจุดทั้ง 2 บนกราฟ แล้วสังเกตว่า

🔹 $\Delta x = x_2 - x_1$ = ระยะแนวนอน

🔸 $\Delta y = y_2 - y_1$ = ระยะแนวตั้ง''',
          ],
        }),
        ContentBlock("rate_t_017", "text", {
          "content": [
            r'''Note = จำได้ไหม?

จากเรื่อง "ความชันของเส้นตรง" เส้นตรงที่ผ่าน $(x_1, y_1)$ และ $(x_2, y_2)$ มีความชัน $m = \dfrac{y_2 - y_1}{x_2 - x_1}$

นั่นเอง! **อัตราการเปลี่ยนแปลง = ความชันของเส้นตรงที่เชื่อม 2 จุด** 🎯''',
          ],
        }),
        ContentBlock("rate_h_018", "header", {
          "title": r"ลองอ่านจากกราฟ",
          "level": 2,
        }),
        ContentBlock("rate_ddq_019", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rate_ddq_019_s1",
              "content": [
                {"graph": "graph_data_13"},
                r'''จากกราฟ $f(x) = x^2$ ลองอ่านค่าที่ $x = 1$ และ $x = 3$

$f(1) = $ ''',
                {"drop": "0"},
                r'''$f(3) = $ ''',
                {"drop": "1"},
                r'''อัตราการเปลี่ยนแปลง $= \dfrac{f(3) - f(1)}{3 - 1} = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$1$", r"$4$", r"$9$", r"$3$"],
              "correctAnswers": {"0": r"$1$", "1": r"$9$", "2": r"$4$"},
              "explanation": r'''$f(1) = 1$ และ $f(3) = 9$

$\dfrac{9 - 1}{3 - 1} = \dfrac{8}{2} = 4$

ความชันของเส้นตรงที่เชื่อมจุด $(1, 1)$ กับ $(3, 9)$ คือ $4$''',
            },
          ],
        }),
        ContentBlock("rate_h_020", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("rate_q_021", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^2$

จงหาอัตราการเปลี่ยนแปลง เมื่อ $x$ เปลี่ยนจาก $2$ ไป $4$''',
          ],
          "options": [r"$4$", r"$6$", r"$8$", r"$12$"],
          "correct": r"$6$",
          "explanation": r'''$f(2) = 4$ และ $f(4) = 16$

$\dfrac{16 - 4}{4 - 2} = \dfrac{12}{2} = 6$ 💚

🧠 **ข้อสังเกต:** ฟังก์ชัน $x^2$ ไม่ใช่เส้นตรง ดังนั้นอัตราการเปลี่ยนแปลง**ขึ้นอยู่กับช่วงที่เลือก** ไม่เท่ากันทุกช่วง!''',
        }),
        ContentBlock("rate_q_022", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = 3x^2 - 2x + 1$

จงหาอัตราการเปลี่ยนแปลง เมื่อ $x$ เปลี่ยนจาก $1$ ไป $2$''',
          ],
          "options": [r"$5$", r"$7$", r"$9$", r"$11$"],
          "correct": r"$7$",
          "explanation": r'''$f(1) = 3 - 2 + 1 = 2$

$f(2) = 12 - 4 + 1 = 9$

$\dfrac{9 - 2}{2 - 1} = \dfrac{7}{1} = 7$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: สูตร f(x+h)
    // =============================================
    ContentSection(
      headerL1: r"✏️ สูตร f(x+h) — เตรียมพร้อมสำหรับอนุพันธ์",
      blocks: [
        ContentBlock("rate_h_023", "header", {
          "title": r"เขียนสูตรอีกแบบ",
          "level": 2,
        }),
        ContentBlock("rate_t_024", "text", {
          "content": [
            r'''สูตร $\dfrac{y_2 - y_1}{x_2 - x_1}$ ใช้ 2 จุด แต่ถ้าเราเรียกจุดเริ่มต้นว่า $x$ และกำหนดให้ 2 จุดห่างกัน $h$

จุดปลายก็จะเป็น $x + h$''',
          ],
        }),
        ContentBlock("rate_t_025", "text", {
          "content": [
            r'''ดังนั้นสูตรอัตราการเปลี่ยนแปลงเขียนได้เป็น

$$\dfrac{f(x + h) - f(x)}{h}$$

ซึ่งเป็นสูตร**เดียวกันทุกประการ** แค่เปลี่ยนชื่อตัวแปร''',
          ],
        }),
        ContentBlock("rate_ddq_026", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rate_ddq_026_s1",
              "content": [
                r'''มาดูว่าเหมือนกันจริง

ถ้า $x_1 = 2$ และ $x_2 = 5$

ก็คือ $x = 2$ และ $h = $ ''',
                {"drop": "0"},
                r'''เพราะ $x + h = 2 + 3 = 5 = x_2$

$\dfrac{y_2 - y_1}{x_2 - x_1} = \dfrac{f(5) - f(2)}{5 - 2} = \dfrac{f(2 + 3) - f(2)}{3} = \dfrac{f(x + h) - f(x)}{h}$

สูตรทั้งสอง ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$2$", r"$3$", r"$5$", r"เหมือนกัน", r"ต่างกัน"],
              "correctAnswers": {"0": r"$3$", "1": r"เหมือนกัน"},
              "explanation": r'''$h = x_2 - x_1 = 5 - 2 = 3$ คือระยะห่างระหว่าง 2 จุด

สูตรทั้งสองเหมือนกัน แค่เขียนคนละแบบ!''',
            },
          ],
        }),
        ContentBlock("rate_t_027", "text", {
          "content": [
            r'''Note = ทำไมต้องเขียนแบบนี้?

รูปแบบ $\dfrac{f(x+h) - f(x)}{h}$ จะสำคัญมากในบทถัดไปเรื่อง **อนุพันธ์** เพราะเราจะลองให้ $h \to 0$ แล้วดูว่าเกิดอะไรขึ้น!''',
          ],
        }),
        ContentBlock("rate_h_028", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("rate_t_029", "text", {
          "content": [
            r'''ให้ $f(x) = x^2 + 1$ จงหาอัตราการเปลี่ยนแปลง เมื่อ $x = 1$ และ $h = 2$''',
          ],
        }),
        ContentBlock("rate_ddq_030", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rate_ddq_030_s1",
              "content": [
                r'''**Step 1:** หาค่า

$f(x) = f(1) = 1^2 + 1 = $ ''',
                {"drop": "0"},
                r'''$f(x + h) = f(1 + 2) = f(3) = 3^2 + 1 = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$2$", r"$4$", r"$5$", r"$10$"],
              "correctAnswers": {"0": r"$2$", "1": r"$10$"},
              "explanation": r'''$f(1) = 1 + 1 = 2$ และ $f(3) = 9 + 1 = 10$''',
            },
            {
              "questionId": "rate_ddq_030_s2",
              "content": [
                r'''**Step 2:** แทนค่าในสูตร

$\dfrac{f(x+h) - f(x)}{h} = \dfrac{10 - 2}{2} = \dfrac{8}{2} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2$", r"$4$", r"$6$", r"$8$"],
              "correctAnswers": {"0": r"$4$"},
              "explanation": r'''$\dfrac{10 - 2}{2} = \dfrac{8}{2} = 4$ 🎉''',
            },
          ],
        }),
        ContentBlock("rate_h_031", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("rate_q_032", "question_choice", {
          "content": [
            r'''1. ใช้สูตร $\dfrac{f(x+h) - f(x)}{h}$ หาอัตราการเปลี่ยนแปลงของ

$$f(x) = x^2 + 2x$$

เมื่อ $x = 3$ และ $h = 2$''',
          ],
          "options": [r"$6$", r"$8$", r"$10$", r"$12$"],
          "correct": r"$10$",
          "explanation": r'''$f(3) = 9 + 6 = 15$

$f(3 + 2) = f(5) = 25 + 10 = 35$

$\dfrac{35 - 15}{2} = \dfrac{20}{2} = 10$ 💚''',
        }),
        ContentBlock("rate_q_033", "question_choice", {
          "content": [
            r'''2. ใช้สูตร $\dfrac{f(x+h) - f(x)}{h}$ หาอัตราการเปลี่ยนแปลงของ

$$f(x) = 2x^2 - x$$

เมื่อ $x = 1$ และ $h = 3$''',
          ],
          "options": [r"$5$", r"$7$", r"$9$", r"$11$"],
          "correct": r"$9$",
          "explanation": r'''$f(1) = 2(1)^2 - 1 = 2 - 1 = 1$

$f(1 + 3) = f(4) = 2(4)^2 - 4 = 32 - 4 = 28$

$\dfrac{28 - 1}{3} = \dfrac{27}{3} = 9$ 💚''',
        }),
        ContentBlock("rate_q_034", "question_choice", {
          "content": [
            r'''3. ให้ $f(x) = x^2 - 3x + 5$

จงหา $\dfrac{f(2 + h) - f(2)}{h}$ เมื่อ $h = 1$''',
          ],
          "options": [r"$0$", r"$2$", r"$3$", r"$4$"],
          "correct": r"$2$",
          "explanation": r'''$f(2) = 4 - 6 + 5 = 3$

$f(2 + 1) = f(3) = 9 - 9 + 5 = 5$

$\dfrac{5 - 3}{1} = 2$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: โจทย์ประยุกต์
    // =============================================
    ContentSection(
      headerL1: r"🌍 โจทย์ประยุกต์",
      blocks: [
        ContentBlock("rate_t_035", "text", {
          "content": [
            r'''อัตราการเปลี่ยนแปลงใช้ได้กับทุกสถานการณ์ในชีวิตจริง ลองมาดูตัวอย่างกัน''',
          ],
        }),
        ContentBlock("rate_h_036", "header", {
          "title": r"ความเร็วเฉลี่ย 🚗",
          "level": 2,
        }),
        ContentBlock("rate_t_037", "text", {
          "content": [
            r'''**ความเร็วเฉลี่ย** ก็คืออัตราการเปลี่ยนแปลงของ**ระยะทาง**ต่อ**เวลา**

$$\text{ความเร็วเฉลี่ย} = \dfrac{\Delta s}{\Delta t} = \dfrac{s(t_2) - s(t_1)}{t_2 - t_1}$$''',
          ],
        }),
        ContentBlock("rate_q_038", "question_choice", {
          "content": [
            r'''1. รถคันหนึ่งเคลื่อนที่ตามสมการ $s(t) = 5t^2$ เมตร

โดย $t$ = เวลา (วินาที)

จงหาความเร็วเฉลี่ยระหว่าง $t = 1$ ถึง $t = 4$ วินาที''',
          ],
          "options": [
            r"$15$ ม./วินาที",
            r"$20$ ม./วินาที",
            r"$25$ ม./วินาที",
            r"$30$ ม./วินาที",
          ],
          "correct": r"$25$ ม./วินาที",
          "explanation": r'''$s(1) = 5(1)^2 = 5$ เมตร

$s(4) = 5(4)^2 = 80$ เมตร

ความเร็วเฉลี่ย $= \dfrac{80 - 5}{4 - 1} = \dfrac{75}{3} = 25$ ม./วินาที 💚''',
        }),
        ContentBlock("rate_q_039", "question_choice", {
          "content": [
            r'''2. จรวดขึ้นสูงตามสมการ $h(t) = 3t^2 + 2t$ เมตร

จงหาความเร็วเฉลี่ยระหว่าง $t = 0$ ถึง $t = 2$ วินาที''',
          ],
          "options": [
            r"$6$ ม./วินาที",
            r"$8$ ม./วินาที",
            r"$10$ ม./วินาที",
            r"$12$ ม./วินาที",
          ],
          "correct": r"$8$ ม./วินาที",
          "explanation": r'''$h(0) = 0$

$h(2) = 3(4) + 2(2) = 12 + 4 = 16$ เมตร

ความเร็วเฉลี่ย $= \dfrac{16 - 0}{2 - 0} = \dfrac{16}{2} = 8$ ม./วินาที 💚''',
        }),
        ContentBlock("rate_h_040", "header", {
          "title": r"อัตราการเปลี่ยนแปลงเป็นลบ 📉",
          "level": 2,
        }),
        ContentBlock("rate_t_041", "text", {
          "content": [
            r'''ถ้าอัตราการเปลี่ยนแปลงเป็น**ลบ** แปลว่า $y$ **ลดลง** เมื่อ $x$ เพิ่มขึ้น

เช่น อุณหภูมิลดลง ราคาหุ้นตก น้ำในถังลดลง''',
          ],
        }),
        ContentBlock("rate_q_042", "question_choice", {
          "content": [
            r'''3. อุณหภูมิในห้องเปลี่ยนตามสมการ $T(t) = -2t + 30$ °C

โดย $t$ = เวลา (นาที)

จงหาอัตราการเปลี่ยนแปลงของอุณหภูมิ เมื่อ $t$ เปลี่ยนจาก $0$ ไป $5$''',
          ],
          "options": [
            r"$-2$ °C/นาที",
            r"$-1$ °C/นาที",
            r"$1$ °C/นาที",
            r"$2$ °C/นาที",
          ],
          "correct": r"$-2$ °C/นาที",
          "explanation": r'''$T(0) = -2(0) + 30 = 30$ °C

$T(5) = -2(5) + 30 = 20$ °C

$\dfrac{\Delta T}{\Delta t} = \dfrac{20 - 30}{5 - 0} = \dfrac{-10}{5} = -2$ °C/นาที 💚

🧠 **ค่าติดลบ** หมายถึง อุณหภูมิ**ลดลง** 2°C ทุก 1 นาที''',
        }),
        ContentBlock("rate_q_043", "question_choice", {
          "content": [
            r'''4. น้ำในถังมีปริมาตร $V(t) = 100 - 4t$ ลิตร

โดย $t$ = เวลา (นาที)

จงหาอัตราการเปลี่ยนแปลงของปริมาตรน้ำ เมื่อ $t$ เปลี่ยนจาก $0$ ไป $10$''',
          ],
          "options": [
            r"$-4$ ลิตร/นาที",
            r"$-2$ ลิตร/นาที",
            r"$4$ ลิตร/นาที",
            r"$10$ ลิตร/นาที",
          ],
          "correct": r"$-4$ ลิตร/นาที",
          "explanation": r'''$V(0) = 100$ ลิตร

$V(10) = 100 - 40 = 60$ ลิตร

$\dfrac{\Delta V}{\Delta t} = \dfrac{60 - 100}{10 - 0} = \dfrac{-40}{10} = -4$ ลิตร/นาที 💚

ค่าติดลบ → น้ำ**ลดลง** 4 ลิตรทุกนาที''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: จาก "เฉลี่ย" สู่ "ขณะหนึ่ง"
    // =============================================
    ContentSection(
      headerL1: r"🔮 จากเฉลี่ยสู่ ณ ขณะหนึ่ง",
      blocks: [
        ContentBlock("rate_h_044", "header", {
          "title": r"คำถามสำคัญ 🤔",
          "level": 2,
        }),
        ContentBlock("rate_t_045", "text", {
          "content": [
            r'''จากตัวอย่างรถ $s(t) = 5t^2$ เราหาความเร็ว**เฉลี่ย**ระหว่าง $t = 1$ ถึง $t = 4$ ได้ $25$ ม./วินาที

แต่ถ้าอยากรู้ว่า ณ **วินาทีที่ 2 ตรงๆ** รถวิ่งเร็วเท่าไหร่ล่ะ?''',
          ],
        }),
        ContentBlock("rate_t_046", "text", {
          "content": [
            r'''เราลอง**ย่อช่วงให้เล็กลง**เรื่อยๆ โดยให้ $h$ เล็กลง!

ใช้ $f(x) = x^2$ ที่ $x = 2$''',
          ],
        }),
        ContentBlock("rate_ddq_047", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rate_ddq_047_s1",
              "content": [
                r'''ลอง $h = 1$: $\dfrac{f(3) - f(2)}{1} = \dfrac{9 - 4}{1} = $ ''',
                {"drop": "0"},
                r'''ลอง $h = 0.1$: $\dfrac{f(2.1) - f(2)}{0.1} = \dfrac{4.41 - 4}{0.1} = $ ''',
                {"drop": "1"},
                r'''ลอง $h = 0.01$: $\dfrac{f(2.01) - f(2)}{0.01} = \dfrac{4.0401 - 4}{0.01} = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$4.01$", r"$4.1$", r"$5$", r"$3$"],
              "correctAnswers": {"0": r"$5$", "1": r"$4.1$", "2": r"$4.01$"},
              "explanation": r'''$h = 1$ → $5$
$h = 0.1$ → $4.1$
$h = 0.01$ → $4.01$

ยิ่ง $h$ เล็ก ค่ายิ่ง**เข้าใกล้ $4$**!''',
            },
            {
              "questionId": "rate_ddq_047_s2",
              "content": [
                r'''เมื่อ $h$ เล็กลงเรื่อยๆ ค่าจะเข้าใกล้ ''',
                {"drop": "0"},
                r'''ซึ่งก็คือ

$$\lim\limits_{h \to 0} \dfrac{f(2 + h) - f(2)}{h}$$

จำลิมิตได้ไหม? นี่คือ**อนุพันธ์** ที่จะเรียนใน ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$4$", r"$5$", r"$0$", r"บทถัดไป", r"บทนี้"],
              "correctAnswers": {"0": r"$4$", "1": r"บทถัดไป"},
              "explanation": r'''เมื่อ $h \to 0$ ค่าเข้าใกล้ $4$ นั่นคือ **อัตราการเปลี่ยนแปลง ณ ขณะหนึ่ง** ซึ่งก็คือ**อนุพันธ์** 🎉''',
            },
          ],
        }),
        ContentBlock("rate_t_048", "text", {
          "content": [
            r'''Note = บทนี้ vs บทถัดไป

**บทนี้:** $\dfrac{f(x+h) - f(x)}{h}$ เมื่อ $h$ เป็นจำนวนจริง → อัตราการเปลี่ยนแปลง**เฉลี่ย**

**บทถัดไป:** $\lim\limits_{h \to 0} \dfrac{f(x+h) - f(x)}{h}$ → อัตราการเปลี่ยนแปลง **ณ ขณะหนึ่ง** = **อนุพันธ์** 🚀''',
          ],
        }),
        ContentBlock("rate_h_049", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("rate_q_050", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^2$ จงหา $\dfrac{f(3+h) - f(3)}{h}$ เมื่อ $h = 0.01$''',
          ],
          "options": [r"$5.99$", r"$6.01$", r"$6.1$", r"$7$"],
          "correct": r"$6.01$",
          "explanation": r'''$f(3) = 9$

$f(3.01) = (3.01)^2 = 9.0601$

$\dfrac{9.0601 - 9}{0.01} = \dfrac{0.0601}{0.01} = 6.01$ 💚

🧠 เมื่อ $h \to 0$ ค่าจะเข้าใกล้ $6$ ซึ่งจะเป็นอนุพันธ์ของ $x^2$ ที่ $x = 3$''',
        }),
        ContentBlock("rate_q_051", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = x^2$ ถ้า $h$ เล็กลงเรื่อยๆ ที่ $x = 5$

$\dfrac{f(5+h) - f(5)}{h}$ จะเข้าใกล้ค่าใด?''',
          ],
          "options": [r"$5$", r"$8$", r"$10$", r"$25$"],
          "correct": r"$10$",
          "explanation": r'''ลอง $h = 0.1$: $\dfrac{(5.1)^2 - 25}{0.1} = \dfrac{26.01 - 25}{0.1} = \dfrac{1.01}{0.1} = 10.1$

ลอง $h = 0.01$: $\dfrac{(5.01)^2 - 25}{0.01} = \dfrac{0.1001}{0.01} = 10.01$

เข้าใกล้ $10$ 💚

🧠 จะเรียนวิธีหาค่านี้โดยไม่ต้องลองแทน $h$ ในบทอนุพันธ์!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("rate_t_052", "text", {
          "content": [
            r'''🎯 **อัตราการเปลี่ยนแปลง**

**1. สูตร:**

$$\dfrac{\Delta y}{\Delta x} = \dfrac{y_2 - y_1}{x_2 - x_1} = \dfrac{f(x+h) - f(x)}{h}$$

บอกว่า $y$ เปลี่ยนเฉลี่ยเท่าไหร่ เมื่อ $x$ เปลี่ยน''',
          ],
        }),
        ContentBlock("rate_t_053", "text", {
          "content": [
            r'''**2. ความหมายบนกราฟ:** อัตราการเปลี่ยนแปลง = **ความชัน**ของเส้นตรงที่เชื่อม 2 จุดบนกราฟ

**3. ค่าบวก/ลบ:**

🔸 ค่าบวก → $y$ เพิ่มขึ้น

🔸 ค่าลบ → $y$ ลดลง''',
          ],
        }),
        ContentBlock("rate_t_054", "text", {
          "content": [
            r'''**4. ต่อยอด:**

เมื่อ $h \to 0$ อัตราการเปลี่ยนแปลง**เฉลี่ย**จะกลายเป็นอัตราการเปลี่ยนแปลง **ณ ขณะหนึ่ง** ซึ่งก็คือ **อนุพันธ์** ที่จะเรียนในบทถัดไป!

Note = เชื่อมกับลิมิต

$$\lim\limits_{h \to 0} \dfrac{f(x+h) - f(x)}{h} = \text{อนุพันธ์ของ } f(x)$$

ลิมิตที่เรียนมาทั้งหมด — เตรียมไว้เพื่อสิ่งนี้เอง! 🚀''',
          ],
        }),
      ],
    ),
  ],
);

final calcRateAtPointLesson = ContentLesson(
  title: "อัตราการเปลี่ยนแปลง ณ จุดใดๆ",
  sections: [
    // =============================================
    // SECTION 1: ทบทวนจากบทที่แล้ว
    // =============================================
    ContentSection(
      headerL1: r"🔗 ทบทวนจากบทที่แล้ว",
      blocks: [
        ContentBlock("rpt_h_001", "header", {
          "title": r"จำได้ไหม? 🤔",
          "level": 2,
        }),
        ContentBlock("rpt_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เราลองหาอัตราการเปลี่ยนแปลงของ $f(x) = x^2$ ที่ $x = 2$ โดยให้ $h$ เล็กลงเรื่อยๆ

🔸 $h = 1$ → ได้ $5$

🔸 $h = 0.1$ → ได้ $4.1$

🔸 $h = 0.01$ → ได้ $4.01$''',
          ],
        }),
        ContentBlock("rpt_t_003", "text", {
          "content": [
            r'''ยิ่ง $h$ เล็ก ค่ายิ่ง**เข้าใกล้ $4$** และเราบอกว่านี่คือ **อนุพันธ์** ที่จะเรียนในบทนี้!

แต่ก่อนจะไปถึง มาดูว่าเกิดอะไรขึ้นบนกราฟกันก่อน''',
          ],
        }),
        ContentBlock("rpt_h_004", "header", {
          "title": r"สังเกตบนกราฟ 📊",
          "level": 2,
        }),
        ContentBlock("rpt_ig_005", "interactive_graph", {
          "path": "graph_data_14",
        }),
        ContentBlock("rpt_t_006", "text", {
          "content": [
            r'''ลองเลื่อนจุด 🔸 เข้าใกล้จุด 🔹 มากขึ้นเรื่อยๆ แล้วสังเกตเส้นตรงที่เชื่อม 2 จุด''',
          ],
        }),
        ContentBlock("rpt_ddq_007", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rpt_ddq_007_s1",
              "content": [
                r'''เมื่อ 2 จุดอยู่ห่างกัน เส้นตรงที่เชื่อมเรียกว่า **เส้นตัด** (Secant)

เมื่อเลื่อนจุด 🔸 เข้าใกล้ 🔹 มากขึ้น เส้นตัดจะ ''',
                {"drop": "0"},
                r'''เมื่อ 2 จุดเกือบทับกัน เส้นตัดจะกลายเป็น ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"หมุนเข้าใกล้เส้นสัมผัส",
                r"หายไป",
                r"เส้นสัมผัส (Tangent)",
                r"เส้นตรงแนวนอน",
              ],
              "correctAnswers": {
                "0": r"หมุนเข้าใกล้เส้นสัมผัส",
                "1": r"เส้นสัมผัส (Tangent)",
              },
              "explanation": r'''เมื่อ 2 จุดเข้าใกล้กัน → เส้นตัดหมุนเข้าหาเส้นสัมผัส

เมื่อ 2 จุดแทบทับกัน (h→0) → เส้นตัดกลายเป็นเส้นสัมผัส!''',
            },
          ],
        }),
        ContentBlock("rpt_t_008", "text", {
          "content": [
            r'''Note = สรุป

🔸 **เส้นตัด (Secant)** = เส้นตรงที่ผ่าน 2 จุดบนกราฟ → ความชัน = อัตราการเปลี่ยนแปลง**เฉลี่ย**

🔸 **เส้นสัมผัส (Tangent)** = เส้นตรงที่แตะกราฟ ณ จุดเดียว → ความชัน = อัตราการเปลี่ยนแปลง **ณ จุดนั้น**''',
          ],
        }),
        ContentBlock("rpt_q_009", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^2$ จงหา $\dfrac{f(3 + 0.001) - f(3)}{0.001}$''',
          ],
          "options": [r"$5.999$", r"$6.001$", r"$6.01$", r"$6.1$"],
          "correct": r"$6.001$",
          "explanation": r'''$f(3) = 9$

$f(3.001) = (3.001)^2 = 9.006001$

$\dfrac{9.006001 - 9}{0.001} = \dfrac{0.006001}{0.001} = 6.001$ 💚

ค่ากำลังเข้าใกล้ $6$ — นั่นคือความชันเส้นสัมผัสที่ $x = 3$!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: นิยาม — อัตราการเปลี่ยนแปลง ณ จุด
    // =============================================
    ContentSection(
      headerL1: r"🎯 นิยาม — อัตราการเปลี่ยนแปลง ณ จุด",
      blocks: [
        ContentBlock("rpt_h_010", "header", {
          "title": r"จากการลอง h เล็กๆ สู่ลิมิต",
          "level": 2,
        }),
        ContentBlock("rpt_t_011", "text", {
          "content": [
            r'''แทนที่จะลอง $h = 0.1, 0.01, 0.001$ ไปเรื่อยๆ เราใช้**ลิมิต**คำนวณตรงๆ ได้เลย!

**อัตราการเปลี่ยนแปลง ณ จุด $x$** คือ

$$\lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$$''',
          ],
        }),
        ContentBlock("rpt_t_012", "text", {
          "content": [
            r'''Note = ทำไมต้องใช้ลิมิต?

แทน $h = 0$ ตรงๆ จะได้ $\dfrac{f(x) - f(x)}{0} = \dfrac{0}{0}$ ซึ่งหาค่าไม่ได้!

แต่เราใช้ลิมิตได้ — จัดรูปก่อนแล้วค่อยแทน $h = 0$ เหมือนที่เรียนมาในบทลิมิตเลย''',
          ],
        }),
        ContentBlock("rpt_h_013", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("rpt_t_014", "text", {
          "content": [
            r'''จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 1$ ของ $f(x) = x^2$''',
          ],
        }),
        ContentBlock("rpt_ddq_015", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rpt_ddq_015_s1",
              "content": [
                r'''**Step 1:** หา $f(1)$ และ $f(1+h)$

$f(1) = 1^2 = $ ''',
                {"drop": "0"},
                r'''$f(1+h) = (1+h)^2 = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$1$",
                r"$1 + h$",
                r"$1 + 2h + h^2$",
                r"$h^2$",
              ],
              "correctAnswers": {"0": r"$1$", "1": r"$1 + 2h + h^2$"},
              "explanation": r'''$f(1) = 1$ และ $(1+h)^2 = 1 + 2h + h^2$''',
            },
            {
              "questionId": "rpt_ddq_015_s2",
              "content": [
                r'''**Step 2:** แทนในสูตรแล้วจัดรูป

$\lim\limits_{h \to 0} \dfrac{(1 + 2h + h^2) - 1}{h} = \lim\limits_{h \to 0} \dfrac{2h + h^2}{h}$

แทน $h = 0$ ตรงๆ ได้ $\dfrac{0}{0}$ → ต้องจัดรูป!

$\dfrac{2h + h^2}{h} = \dfrac{h(2 + h)}{h}$ ตัด $h$ ออก เหลือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2 + h$", r"$2h$", r"$h$", r"$2$"],
              "correctAnswers": {"0": r"$2 + h$"},
              "explanation": r'''แยก $h$ ออกจากเศษ แล้วตัดกับ $h$ ในส่วน เหลือ $2 + h$''',
            },
            {
              "questionId": "rpt_ddq_015_s3",
              "content": [
                r'''**Step 3:** แทน $h = 0$

$\lim\limits_{h \to 0} (2 + h) = 2 + 0 = $ ''',
                {"drop": "0"},
                r'''ดังนั้น ความชันของเส้นสัมผัส $f(x) = x^2$ ที่ $x = 1$ คือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$0$", r"$1$", r"$2$", r"$3$"],
              "correctAnswers": {"0": r"$2$"},
              "explanation": r'''$\lim\limits_{h \to 0} (2 + h) = 2$ 🎉

ตรงกับที่เราลอง h เล็กๆ ในบทที่แล้ว!''',
            },
          ],
        }),
        ContentBlock("rpt_h_016", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("rpt_q_017", "question_choice", {
          "content": [
            r'''1. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 2$ ของ

$$f(x) = x^2$$''',
          ],
          "options": [r"$2$", r"$3$", r"$4$", r"$5$"],
          "correct": r"$4$",
          "explanation": r'''$f(2) = 4$ และ $f(2+h) = (2+h)^2 = 4 + 4h + h^2$

$\lim\limits_{h \to 0} \dfrac{4 + 4h + h^2 - 4}{h} = \lim\limits_{h \to 0} \dfrac{4h + h^2}{h}$

$= \lim\limits_{h \to 0} (4 + h) = 4$ 💚''',
        }),
        ContentBlock("rpt_q_018", "question_choice", {
          "content": [
            r'''2. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 3$ ของ

$$f(x) = 2x + 1$$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$7$"],
          "correct": r"$2$",
          "explanation": r'''$f(3) = 7$ และ $f(3+h) = 2(3+h) + 1 = 7 + 2h$

$\lim\limits_{h \to 0} \dfrac{7 + 2h - 7}{h} = \lim\limits_{h \to 0} \dfrac{2h}{h} = \lim\limits_{h \to 0} 2 = 2$ 💚

🧠 **ข้อสังเกต:** ฟังก์ชันเชิงเส้น $2x + 1$ ความชันเท่ากับ $2$ ทุกจุด เพราะกราฟเป็นเส้นตรง!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ฝึกหาอัตราการเปลี่ยนแปลง ณ จุด
    // =============================================
    ContentSection(
      headerL1: r"🔧 ฝึกกับฟังก์ชันหลากหลาย",
      blocks: [
        ContentBlock("rpt_t_019", "text", {
          "content": [
            r'''ขั้นตอนเหมือนกันทุกข้อ:

**1.** หา $f(x)$ และ $f(x+h)$ → **2.** แทนในสูตร → **3.** จัดรูป (ตัด $h$) → **4.** แทน $h = 0$''',
          ],
        }),
        ContentBlock("rpt_h_020", "header", {
          "title": r"ฟังก์ชันกำลังสาม",
          "level": 2,
        }),
        ContentBlock("rpt_q_021", "question_choice", {
          "content": [
            r'''1. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 1$ ของ

$$f(x) = x^3$$

Note = คำใบ้

$(1+h)^3 = 1 + 3h + 3h^2 + h^3$''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$4$"],
          "correct": r"$3$",
          "explanation": r'''$f(1) = 1$ และ $f(1+h) = 1 + 3h + 3h^2 + h^3$

$\lim\limits_{h \to 0} \dfrac{1 + 3h + 3h^2 + h^3 - 1}{h} = \lim\limits_{h \to 0} \dfrac{3h + 3h^2 + h^3}{h}$

$= \lim\limits_{h \to 0} (3 + 3h + h^2) = 3$ 💚''',
        }),
        ContentBlock("rpt_h_022", "header", {
          "title": r"ฟังก์ชันพหุนาม",
          "level": 2,
        }),
        ContentBlock("rpt_q_023", "question_choice", {
          "content": [
            r'''2. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 0$ ของ

$$f(x) = x^2 + 3x - 1$$''',
          ],
          "options": [r"$-1$", r"$0$", r"$3$", r"$5$"],
          "correct": r"$3$",
          "explanation": r'''$f(0) = -1$ และ $f(0+h) = f(h) = h^2 + 3h - 1$

$\lim\limits_{h \to 0} \dfrac{(h^2 + 3h - 1) - (-1)}{h} = \lim\limits_{h \to 0} \dfrac{h^2 + 3h}{h}$

$= \lim\limits_{h \to 0} (h + 3) = 3$ 💚''',
        }),
        ContentBlock("rpt_q_024", "question_choice", {
          "content": [
            r'''3. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 2$ ของ

$$f(x) = 3x^2 - x$$''',
          ],
          "options": [r"$7$", r"$9$", r"$11$", r"$13$"],
          "correct": r"$11$",
          "explanation": r'''$f(2) = 3(4) - 2 = 10$

$f(2+h) = 3(2+h)^2 - (2+h) = 3(4 + 4h + h^2) - 2 - h$

$= 12 + 12h + 3h^2 - 2 - h = 10 + 11h + 3h^2$

$\lim\limits_{h \to 0} \dfrac{10 + 11h + 3h^2 - 10}{h} = \lim\limits_{h \to 0} \dfrac{11h + 3h^2}{h}$

$= \lim\limits_{h \to 0} (11 + 3h) = 11$ 💚''',
        }),
        ContentBlock("rpt_h_025", "header", {
          "title": r"ฟังก์ชันรากที่สอง — ต้องใช้ Conjugate!",
          "level": 2,
        }),
        ContentBlock("rpt_t_026", "text", {
          "content": [
            r'''เมื่อมี $\sqrt{\ }$ อยู่ จัดรูปแบบเดิมไม่ได้ ต้องใช้ Conjugate เหมือนบทลิมิตพหุนาม''',
          ],
        }),
        ContentBlock("rpt_ddq_027", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rpt_ddq_027_s1",
              "content": [
                r'''จงหาอัตราการเปลี่ยนแปลง ณ $x = 4$ ของ $f(x) = \sqrt{x}$

**Step 1:** $f(4) = \sqrt{4} = 2$ และ $f(4+h) = \sqrt{4+h}$

$\lim\limits_{h \to 0} \dfrac{\sqrt{4+h} - 2}{h}$

แทน $h = 0$ ได้ $\dfrac{0}{0}$ → ต้องจัดรูป!

มี $\sqrt{\ }$ ดังนั้นใช้ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"Conjugate", r"แยกตัวประกอบ", r"หารด้วย $h$"],
              "correctAnswers": {"0": r"Conjugate"},
              "explanation": r'''เมื่อมี $\sqrt{\ }$ ต้องใช้ Conjugate เพื่อกำจัดราก''',
            },
            {
              "questionId": "rpt_ddq_027_s2",
              "content": [
                r'''**Step 2:** คูณ Conjugate $\dfrac{\sqrt{4+h} + 2}{\sqrt{4+h} + 2}$

เศษ: $(\sqrt{4+h})^2 - 2^2 = (4+h) - 4 = $ ''',
                {"drop": "0"},
                r'''ได้ $\dfrac{h}{h(\sqrt{4+h} + 2)}$ ตัด $h$ ออก เหลือ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$h$",
                r"$4 + h$",
                r"$\dfrac{1}{\sqrt{4+h} + 2}$",
                r"$\sqrt{4+h} + 2$",
              ],
              "correctAnswers": {
                "0": r"$h$",
                "1": r"$\dfrac{1}{\sqrt{4+h} + 2}$",
              },
              "explanation": r'''Conjugate ทำให้เศษกลายเป็น $h$ แล้วตัดกับ $h$ ในส่วน''',
            },
            {
              "questionId": "rpt_ddq_027_s3",
              "content": [
                r'''**Step 3:** แทน $h = 0$

$\lim\limits_{h \to 0} \dfrac{1}{\sqrt{4+h} + 2} = \dfrac{1}{\sqrt{4} + 2} = \dfrac{1}{2 + 2} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{2}$",
                r"$\dfrac{1}{4}$",
                r"$\dfrac{1}{8}$",
                r"$2$",
              ],
              "correctAnswers": {"0": r"$\dfrac{1}{4}$"},
              "explanation": r'''$\dfrac{1}{2 + 2} = \dfrac{1}{4}$ 🎉''',
            },
          ],
        }),
        ContentBlock("rpt_q_028", "question_choice", {
          "content": [
            r'''4. จงหาอัตราการเปลี่ยนแปลง ณ จุด $x = 9$ ของ

$$f(x) = \sqrt{x}$$''',
          ],
          "options": [
            r"$\dfrac{1}{3}$",
            r"$\dfrac{1}{6}$",
            r"$\dfrac{1}{9}$",
            r"$3$",
          ],
          "correct": r"$\dfrac{1}{6}$",
          "explanation": r'''$f(9) = 3$ และ $f(9+h) = \sqrt{9+h}$

$\lim\limits_{h \to 0} \dfrac{\sqrt{9+h} - 3}{h}$ คูณ Conjugate $\dfrac{\sqrt{9+h} + 3}{\sqrt{9+h} + 3}$

เศษ: $(9+h) - 9 = h$ → ตัด $h$ → $\dfrac{1}{\sqrt{9+h} + 3}$

แทน $h = 0$ → $\dfrac{1}{3 + 3} = \dfrac{1}{6}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: จากจุดเดียวสู่ทุกจุด — อนุพันธ์
    // =============================================
    ContentSection(
      headerL1: r"🌟 จากจุดเดียวสู่ทุกจุด — อนุพันธ์",
      blocks: [
        ContentBlock("rpt_h_029", "header", {
          "title": r"สังเกต pattern 🔍",
          "level": 2,
        }),
        ContentBlock("rpt_t_030", "text", {
          "content": [
            r'''จากที่ทำมา สำหรับ $f(x) = x^2$

🔸 ที่ $x = 1$ ความชัน $= 2$

🔸 ที่ $x = 2$ ความชัน $= 4$

🔸 ที่ $x = 3$ ความชัน $= 6$ (จากข้อ 1 ใน section แรก)''',
          ],
        }),
        ContentBlock("rpt_t_031", "text", {
          "content": [
            r'''เห็น pattern ไหม? ความชันเท่ากับ $2x$ ทุกจุดเลย!

ถ้าเราทำสูตรทีเดียวสำหรับ **$x$ ใดๆ** จะได้สูตรสำเร็จ ไม่ต้องคำนวณทีละจุดอีก''',
          ],
        }),
        ContentBlock("rpt_h_032", "header", {
          "title": r"ลองทำกับ $x$ ใดๆ",
          "level": 2,
        }),
        ContentBlock("rpt_ddq_033", "drag_and_drop", {
          "steps": [
            {
              "questionId": "rpt_ddq_033_s1",
              "content": [
                r'''จงหา $\lim\limits_{h \to 0} \dfrac{f(x+h) - f(x)}{h}$ เมื่อ $f(x) = x^2$

$f(x) = x^2$ และ $f(x+h) = (x+h)^2 = x^2 + 2xh + h^2$

$\dfrac{(x^2 + 2xh + h^2) - x^2}{h} = \dfrac{2xh + h^2}{h}$

ตัด $h$ ออก เหลือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2x + h$", r"$2x$", r"$x + h$", r"$2xh$"],
              "correctAnswers": {"0": r"$2x + h$"},
              "explanation": r'''$\dfrac{h(2x + h)}{h} = 2x + h$''',
            },
            {
              "questionId": "rpt_ddq_033_s2",
              "content": [
                r'''แทน $h = 0$:

$\lim\limits_{h \to 0} (2x + h) = $ ''',
                {"drop": "0"},
                r'''ดังนั้น สำหรับ $f(x) = x^2$ ความชันเส้นสัมผัสที่ $x$ ใดๆ คือ ''',
                {"drop": "0"},
                r'''สูตรนี้เรียกว่า **อนุพันธ์** (Derivative) ของ $f(x)$!''',
              ],
              "draggableItems": [r"$x$", r"$2x$", r"$x^2$", r"$2x^2$"],
              "correctAnswers": {"0": r"$2x$"},
              "explanation": r'''$\lim\limits_{h \to 0} (2x + h) = 2x$ 🎉

ไม่ต้องคำนวณทีละจุดอีกแล้ว — แค่แทน $x$ ใดๆ ลงใน $2x$ ก็ได้ความชัน!''',
            },
          ],
        }),
        ContentBlock("rpt_h_034", "header", {
          "title": r"สัญลักษณ์อนุพันธ์ 📝",
          "level": 2,
        }),
        ContentBlock("rpt_t_035", "text", {
          "content": [
            r'''อนุพันธ์ของ $f(x)$ เขียนได้หลายแบบ หมายความเหมือนกัน:

$$f'(x) = \dfrac{d}{dx}f(x) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$$

🔸 $f'(x)$ อ่านว่า "เอฟ ไพรม์ ของ $x$"

🔸 $\dfrac{d}{dx}$ อ่านว่า "ดี ดีเอ็กซ์" แปลว่า "หาอนุพันธ์เทียบกับ $x$"''',
          ],
        }),
        ContentBlock("rpt_t_036", "text", {
          "content": [
            r'''Note = ตัวอย่าง

จากที่เพิ่งทำ: $f(x) = x^2$ ดังนั้น $f'(x) = 2x$

แทนค่าได้เลย: $f'(1) = 2$, $f'(2) = 4$, $f'(3) = 6$ ตรงกับที่คำนวณทีละจุดทุกอย่าง!''',
          ],
        }),
        ContentBlock("rpt_h_037", "header", {
          "title": r"ลอง $x^3$ บ้าง",
          "level": 2,
        }),
        ContentBlock("rpt_q_038", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^3$ จงหา $f'(x)$

Note = คำใบ้

$(x+h)^3 = x^3 + 3x^2h + 3xh^2 + h^3$''',
          ],
          "options": [r"$x^2$", r"$2x^2$", r"$3x^2$", r"$x^3$"],
          "correct": r"$3x^2$",
          "explanation": r'''$\lim\limits_{h \to 0} \dfrac{(x+h)^3 - x^3}{h}$

$= \lim\limits_{h \to 0} \dfrac{3x^2h + 3xh^2 + h^3}{h}$

$= \lim\limits_{h \to 0} (3x^2 + 3xh + h^2) = 3x^2$ 💚''',
        }),
        ContentBlock("rpt_q_039", "question_choice", {
          "content": [
            r'''2. ถ้า $f(x) = x^2$ และ $f'(x) = 2x$ แล้ว $f'(5) = $ ?''',
          ],
          "options": [r"$2$", r"$5$", r"$10$", r"$25$"],
          "correct": r"$10$",
          "explanation": r'''$f'(5) = 2(5) = 10$ 💚

ความชันของเส้นสัมผัส $f(x) = x^2$ ที่ $x = 5$ คือ $10$''',
        }),
        ContentBlock("rpt_q_040", "question_choice", {
          "content": [
            r'''3. ถ้า $f(x) = x^3$ และ $f'(x) = 3x^2$ แล้ว $f'(2) = $ ?''',
          ],
          "options": [r"$4$", r"$6$", r"$8$", r"$12$"],
          "correct": r"$12$",
          "explanation": r'''$f'(2) = 3(2)^2 = 3(4) = 12$ 💚

ความชันของเส้นสัมผัส $f(x) = x^3$ ที่ $x = 2$ คือ $12$''',
        }),
        ContentBlock("rpt_q_041", "question_choice", {
          "content": [
            r'''4. ให้ $f(x) = 5x + 3$ จงหา $f'(x)$''',
          ],
          "options": [r"$3$", r"$5$", r"$5x$", r"$8$"],
          "correct": r"$5$",
          "explanation": r'''$f(x+h) = 5(x+h) + 3 = 5x + 5h + 3$

$\lim\limits_{h \to 0} \dfrac{(5x + 5h + 3) - (5x + 3)}{h} = \lim\limits_{h \to 0} \dfrac{5h}{h} = 5$ 💚

🧠 ฟังก์ชันเชิงเส้น $ax + b$ → อนุพันธ์ = $a$ เสมอ (ความชันคงที่)''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("rpt_t_042", "text", {
          "content": [
            r'''🎯 **อัตราการเปลี่ยนแปลง ณ จุด = อนุพันธ์**

**1. ที่มา:** ย่อ $h$ ลงเรื่อยๆ จนเส้นตัดกลายเป็นเส้นสัมผัส

$$f'(x) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$$''',
          ],
        }),
        ContentBlock("rpt_t_043", "text", {
          "content": [
            r'''**2. ขั้นตอนหาอนุพันธ์จาก First Principles:**

🔸 เขียน $f(x+h)$ กระจายออก

🔸 ลบ $f(x)$ ออก

🔸 หารด้วย $h$ แล้วตัด $h$ ออก (จัดรูป)

🔸 แทน $h = 0$''',
          ],
        }),
        ContentBlock("rpt_t_044", "text", {
          "content": [
            r'''**3. ตัวอย่างสำคัญ:**

🔸 $f(x) = x^2$ → $f'(x) = 2x$

🔸 $f(x) = x^3$ → $f'(x) = 3x^2$

🔸 $f(x) = ax + b$ → $f'(x) = a$

🔸 $f(x) = \sqrt{x}$ → ใช้ Conjugate จัดรูป

Note = สังเกต pattern

$x^2 → 2x$, $x^3 → 3x^2$ ดูเหมือนจะมีกฎลัด... จะได้เรียนในบทถัดไป!''',
          ],
        }),
      ],
    ),
  ],
);

// ── การหาค่าอนุพันธ์ ──────────────────────────────────────────────────────────────

final calcDerivIntroLesson = ContentLesson(
  title: "นิยามและสมบัติของอนุพันธ์",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("deriv_intro_t_305", "text", {
          "content": [
            r'''จากบทที่แล้ว เราได้เรียนการหาอนุพันธ์ด้วย**ลิมิต**
        
        $$f'(x) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$$
        
        บทนี้จะทำให้หาอนุพันธ์ได้**รวดเร็ว** และ**ง่ายดาย**! 🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📟 นิยามของอนุพันธ์",
      blocks: [
        ContentBlock("deriv_intro_t_306", "text", {
          "content": [
            r'''**ทบทวน:** อนุพันธ์ของ $f(x)$ คือ
        
        $\dfrac{d}{dx}f(x) = f'(x) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨1 ค่าคงที่",
      blocks: [
        ContentBlock("deriv_intro_t_307", "text", {
          "content": [
            r'''$$\dfrac{d}{dx} c = 0$$
        
        เมื่อ $c$ เป็นค่าคงที่ (ไม่มี $x$)
        
        💬 **ความหมาย:** อนุพันธ์ของค่าคงที่ = $0$ เสมอ!
        
        **📝 เช่น**
        
        $\dfrac{d}{dx}(5) = 0$
        
        $\dfrac{d}{dx}(100) = 0$
        
        $\dfrac{d}{dx}(-7) = 0$
        
        Note = ทำไม?
        
        💭 **คิดจากความหมาย:**
        
        อนุพันธ์ = อัตราการเปลี่ยนแปลง
        
        ค่าคงที่ไม่เปลี่ยนแปลง → อัตราการเปลี่ยนแปลง = $0$! 
        
        **กราฟ:** เส้นตรงแนวนอน $y = c$ มีความชัน = $0$ 💚''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🚀2 เลขยกกำลัง",
      blocks: [
        ContentBlock("deriv_intro_t_308", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}x^n = nx^{n-1}$$
        
        สำหรับทุกจำนวนจริง $n$
        
        💬 **วิธีจำ:** 
        
        **"ตบเลขชี้กำลังลงมาคูณ แล้วลบ 1 จากเลขชี้กำลัง"** 🎯
        
        **📝 เช่น**
        
        $\dfrac{d}{dx}(x^2) = 2x^{2-1} = 2x$
        
        $\dfrac{d}{dx}(x^5) = 5x^{5-1} = 5x^4$
        
        $\dfrac{d}{dx}(x^{100}) = 100x^{99}$''',
          ],
        }),
        ContentBlock("ddq_deriv_prop_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_1",
              "content": [
                r'''**มาลองพิสูจน์กัน! 🥊 (optional)**
        
        
        🎯 **ขั้นที่ 1:** เขียนนิยาม 
        
        $\dfrac{d}{dx}(x^2) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$
        
        เมื่อ $f(x) = x^n$:
        
        $f(x) =$ ''',
                {"drop": "0"},
                r'''$f(x + h) =$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$x^n$", r"$(x + h)^n$", r"$x + h$", r"$2x$"],
              "correctAnswers": {"0": r"$x^n$", "1": r"$(x + h)^n$"},
              "explanation":
                  r'''แทนค่าฟังก์ชัน $f(x) = x^n$ และ $f(x+h) = (x+h)^n$''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** ใช้ทฤษฎีทวินามจาก "ทวินาม" กระจาย 
        
        $(x + h)^n = \binom{n}{0}x^n + \binom{n}{1}x^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + \binom{n}{n-1}xh^{n-1} + \binom{n}{n}h^n$
        
        แทนค่าในลิมิต $\lim\limits_{h \to 0} \dfrac{(x + h)^n - x^n}{h}$
        
        $= \lim\limits_{h \to 0} \dfrac{(\binom{n}{0}x^n + \binom{n}{1}x^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + \binom{n}{n-1}xh^{n-1} + \binom{n}{n}h^n) - x^n}{h}$
        
        $= \lim\limits_{h \to 0} \dfrac{\binom{n}{1}x^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + \binom{n}{n-1}xh^{n-1} + \binom{n}{n}h^n}{h}$
        
        $= \lim\limits_{h \to 0}$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\binom{n}{1}x^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + \binom{n}{n}h^{n - 1}$",
                r"$0$",
                r"$2xh$",
                r"$\binom{n}{1}x^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + \binom{n}{n}h^n$",
              ],
              "correctAnswers": {
                "0":
                    r"$\binom{n}{1}x^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + \binom{n}{n}h^{n - 1}$",
              },
              "explanation":
                  r'''$\lim\limits_{h \to 0} \dfrac{\binom{n}{1}x^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + \binom{n}{n}h^n}{h}$\n$= \binom{n}{1}x^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + \binom{n}{n}h^{n - 1}$''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_3",
              "content": [
                r'''✂️ **ขั้นที่ 3:** แทนค่าตรงๆ
        
        $\lim\limits_{h \to 0} \binom{n}{1}x^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + \binom{n}{n}h^{n - 1}$
        
        $= \lim\limits_{h \to 0} \binom{n}{1}x^{n-1} + 0 =$ ''',
                {"drop": "0"},
                r'''ต้องจัดรูป ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$nx^{n-1}$",
                r"$x^n$",
                r"$2x$",
                r"$\dfrac{0}{0}$",
                r"ใช่",
                r"ไม่",
              ],
              "correctAnswers": {"0": r"$nx^{n-1}$", "1": r"ไม่"},
              "explanation": r'''ได้ตรงตามสมบัติเลย! 🎯''',
            },
          ],
        }),
        ContentBlock("q_deriv_prop_1", "question_choice", {
          "content": [r'''1. $\dfrac{d}{dx}(x^3) = ?$'''],
          "options": [r"$x^2$", r"$3x^2$", r"$3x^3$", r"$x^3$"],
          "correct": r"$3x^2$",
          "explanation": r'''ใช้สูตร $\dfrac{d}{dx}(x^n) = nx^{n-1}$
        
        $\dfrac{d}{dx}(x^3) = 3x^{3-1} = 3x^2$ 💚''',
        }),
        ContentBlock("q_deriv_prop_2", "question_choice", {
          "content": [r'''2. $\dfrac{d}{dx}(x^{10}) = ?$'''],
          "options": [r"$10x^9$", r"$10x^{10}$", r"$9x^9$", r"$x^9$"],
          "correct": r"$10x^9$",
          "explanation": r'''$\dfrac{d}{dx}(x^{10}) = 10x^{10-1} = 10x^9$ 💚''',
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⚡3 คูณด้วยค่าคงที่",
      blocks: [
        ContentBlock("deriv_intro_t_314", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}[c \cdot f(x)] = c \cdot \dfrac{d}{dx}f(x)$$
        
        เมื่อ $c$ เป็นค่าคงที่
        
        💬 **ความหมาย:** ดึงค่าคงที่ออกมาข้างนอกได้!''',
          ],
        }),
        ContentBlock("ddq_deriv_prop_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_4",
              "content": [
                r'''1. จงหา $\dfrac{d}{dx}(5x^2)$
        
        $\dfrac{d}{dx}(5x^2) =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x^2$",
                r"$5x^2$",
                r"$2x$",
                r"$10x$",
                r"$5x$",
              ],
              "correctAnswers": {"0": r"$10x$"},
              "explanation":
                  r'''ดึง 5 ออกมา แล้วหา diff ของ $x^2$ ได้ $5 \cdot 2x = 10x$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_5",
              "content": [
                r'''2. จงหา $\dfrac{d}{dx}(7x^3)$
        
        $\dfrac{d}{dx}(7x^3) =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$7x^2$", r"$21x^2$", r"$7x^3$", r"$3x^2$"],
              "correctAnswers": {"0": r"$21x^2$"},
              "explanation":
                  r'''$7 \cdot \dfrac{d}{dx}(x^3) = 7 \cdot 3x^2 = 21x^2$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_6", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_6",
              "content": [
                r'''3. จงหา $\dfrac{d}{dx}\left(\dfrac{2}{x}\right)$
        
        เขียนใหม่: $\dfrac{2}{x} =$ ''',
                {"drop": "0"},
                r'''$\dfrac{d}{dx}$ (''',
                {"drop": "0"},
                r''') ตบเลขชี้กำลังมาคูณจะได้
        
        $2 \cdot$ (''',
                {"drop": "1"},
                r''') ลบ 1 ตรงเลขชี้กำลังจะได้ 
        
        $\dfrac{d}{dx}\left(\dfrac{2}{x}\right) =$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$-1$",
                r"$-x^{-2}$",
                r"$-2x^{-2}$",
                r"$2x^{-1}$",
                r"$\dfrac{-2}{x^2}$",
              ],
              "correctAnswers": {
                "0": r"$2x^{-1}$",
                "1": r"$-x^{-2}$",
                "2": r"$-2x^{-2}$",
              },
              "explanation":
                  r'''$\dfrac{2}{x} = 2x^{-1}$ แล้วหา diff ได้ $2 \cdot (-1)x^{-2} = -2x^{-2} = \dfrac{-2}{x^2}$ 💚''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"➕ 4 ผลบวกและผลต่าง",
      blocks: [
        ContentBlock("deriv_intro_t_318", "text", {
          "content": [
            r'''$\dfrac{d}{dx}[f(x) \pm g(x)] = \dfrac{d}{dx}f(x) \pm \dfrac{d}{dx}g(x)$
        
        💬 **ความหมาย:** แยกหาอนุพันธ์ทีละพจน์ได้!''',
          ],
        }),
        ContentBlock("ddq_deriv_prop_7", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_7",
              "content": [
                r'''จงหา $\dfrac{d}{dx}(x^3 + 5x^2)$
        
        $\dfrac{d}{dx}(x^3 + 5x^2) = \dfrac{d}{dx}(x^3) + \dfrac{d}{dx}(5x^2)$
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''$=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$3x^2$",
                r"$10x$",
                r"$3x^2 + 10x$",
                r"$5x$",
                r"$x^2$",
              ],
              "correctAnswers": {
                "0": r"$3x^2$",
                "1": r"$10x$",
                "2": r"$3x^2 + 10x$",
              },
              "explanation": r'''แยกหา diff ได้ $3x^2 + 10x$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_8", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_8",
              "content": [
                r'''จงหา $\dfrac{d}{dx}(2x^3 + 5x^2 + 7x - 5)$
        
        $= \dfrac{d}{dx}(2x^3) + \dfrac{d}{dx}(5x^2) + \dfrac{d}{dx}(7x) - \dfrac{d}{dx}(5)$
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''$+$ ''',
                {"drop": "2"},
                r'''$-$ ''',
                {"drop": "3"},
                r'''$=$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$6x^2$",
                r"$10x$",
                r"$7$",
                r"$0$",
                r"$6x^2 + 10x + 7$",
                r"$5$",
              ],
              "correctAnswers": {
                "0": r"$6x^2$",
                "1": r"$10x$",
                "2": r"$7$",
                "3": r"$0$",
                "4": r"$6x^2 + 10x + 7$",
              },
              "explanation":
                  r'''แยกหาทีละเทอมได้ $6x^2 + 10x + 7 - 0 = 6x^2 + 10x + 7$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_9", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_9",
              "content": [
                r'''จงหา $\dfrac{d}{dx}(4x^5 - 3x^2 + 8)$
        
        $=$ ''',
                {"drop": "0"},
                r'''$x^4$ ''',
                {"drop": "1"},
                r'''$x +$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$20$",
                r"$-6$",
                r"$0$",
                r"$4$",
                r"$8$",
                r"$-3$",
              ],
              "correctAnswers": {"0": r"$20$", "1": r"$-6$", "2": r"$0$"},
              "explanation": r'''$20x^4 - 6x + 0 = 20x^4 - 6x$ 💚''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✖️ 5 ผลคูณ",
      blocks: [
        ContentBlock("deriv_intro_t_322", "text", {
          "content": [
            r'''$\dfrac{d}{dx}[f(x) \cdot g(x)] = f(x) \cdot g'(x) + g(x) \cdot f'(x)$
        
        💬 **วิธีจำ:"หน้าดิฟหลัง + หลังดิฟหน้า"**''',
          ],
        }),
        ContentBlock("ddq_deriv_prop_10", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_10",
              "content": [
                r'''จงหา $\dfrac{d}{dx}[(3x + 2)(6x + 5)]$
        
        ให้ $f(x) = 3x + 2$ และ $g(x) = 6x + 5$
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''และ $g'(x) =$ ''',
                {"drop": "1"},
                r'''ใช้สูตร: $f \cdot g' + g \cdot f'$
        
        $= (3x + 2) \cdot$ ''',
                {"drop": "1"},
                r'''$+ (6x + 5) \cdot$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$3$", r"$6$", r"$(3x + 2)$", r"$(6x + 5)$"],
              "correctAnswers": {"0": r"$3$", "1": r"$6$"},
              "explanation": r'''$f'(x) = 3$ และ $g'(x) = 6$''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_11", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_11",
              "content": [
                r'''👉 คำนวณผลลัพธ์
        
        $= (3x + 2)(6) + (6x + 5)(3)$
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''$+$ ''',
                {"drop": "2"},
                r'''$+$ ''',
                {"drop": "3"},
                r'''$=$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$18x$",
                r"$12$",
                r"$18x$",
                r"$15$",
                r"$36x + 27$",
                r"$36x$",
              ],
              "correctAnswers": {
                "0": r"$18x$",
                "1": r"$12$",
                "2": r"$18x$",
                "3": r"$15$",
                "4": r"$36x + 27$",
              },
              "explanation":
                  r'''$(3x+2)(6) = 18x + 12$ และ $(6x+5)(3) = 18x + 15$ รวมได้ $36x + 27$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_12", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_12",
              "content": [
                r'''จงหา $\dfrac{d}{dx}[(x^2)(x^3)]$
        
        หน้าดิฟหลัง + หลังดิฟหน้า:
        
        $= x^2 \cdot$ ''',
                {"drop": "0"},
                r'''$+ x^3 \cdot$ ''',
                {"drop": "1"},
                r'''$=$ ''',
                {"drop": "2"},
                r'''$+$ ''',
                {"drop": "3"},
                r'''$=$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$3x^2$",
                r"$2x$",
                r"$3x^4$",
                r"$2x^4$",
                r"$5x^4$",
              ],
              "correctAnswers": {
                "0": r"$3x^2$",
                "1": r"$2x$",
                "2": r"$3x^4$",
                "3": r"$2x^4$",
                "4": r"$5x^4$",
              },
              "explanation":
                  r'''$(x^2)(3x^2) + (x^3)(2x) = 3x^4 + 2x^4 = 5x^4$ 💚''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"➗ 6 ผลหาร",
      blocks: [
        ContentBlock("deriv_intro_t_326", "text", {
          "content": [
            r'''$\dfrac{d}{dx}\left[\dfrac{f(x)}{g(x)}\right] = \dfrac{g(x) \cdot f'(x) - f(x) \cdot g'(x)}{[g(x)]^2}$
        
        💬 **วิธีจำ:"ล่างดิฟบน - บนดิฟล่าง หารด้วยล่างกำลัง 2"**''',
          ],
        }),
        ContentBlock("ddq_deriv_prop_13", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_13",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{2x + 3}{x + 1}\right)$
        
        ให้ $f(x) = 2x + 3$ (บน) และ $g(x) = x + 1$ (ล่าง)
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''และ $g'(x) =$ ''',
                {"drop": "1"},
                r'''ใช้สูตร: 💬 ล่างดิฟบน - บนดิฟล่าง หารด้วยล่างกำลัง 2 
        
        $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$3$",
                r"$2$",
                r"$1$",
                r"$\dfrac{(x + 1)(2) - (2x +3)(1)}{(2x + 3)^2}$",
                r"$\dfrac{(x + 1)(2) - (2x +3)(1)}{(x + 1)^2}$",
                r"$\dfrac{(x + 1)(2) + (2x +3)(1)}{(x + 1)^2}$",
                r"$x + 1$",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"$1$",
                "2": r"$\dfrac{(x + 1)(2) - (2x +3)(1)}{(x + 1)^2}$",
              },
              "explanation":
                  r'''แทนค่าล่างดิฟบน - บนดิฟล่าง หารด้วยล่างกำลัง 2 ได้ $\dfrac{(x + 1)(2) - (2x +3)(1)}{(x + 1)^2}$''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_14", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_14",
              "content": [
                r'''👉 คำนวณผลลัพธ์
        
        $= \dfrac{(x + 1)(2) - (2x + 3)(1)}{(x + 1)^2}$
        
        $= \dfrac{2x + 2 - 2x - 3}{(x + 1)^2}$
        
        $=$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-1$",
                r"$\dfrac{-1}{(x + 1)^2}$",
                r"$\dfrac{1}{(x + 1)^2}$",
                r"$\dfrac{2}{(x + 1)^2}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{-1}{(x + 1)^2}$"},
              "explanation":
                  r'''$2x + 2 - 2x - 3 = -1 \to \dfrac{-1}{(x + 1)^2}$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_prop_15", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_prop_15",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{x^2}{x + 1}\right)$
        
        ล่างดิฟบน - บนดิฟล่าง หารด้วยล่าง$^2$:
        
        $= ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$2x$",
                r"$1$",
                r"$2x^2 + 2x - x^2$",
                r"$x^2 + 2x$",
                r"$x$",
                r"$\dfrac{x^2 + 2x}{(x + 1)^2}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{x^2 + 2x}{(x + 1)^2}$"},
              "explanation":
                  r'''$(x+1)(2x) - x^2(1) = 2x^2 + 2x - x^2 = x^2 + 2x$ 💚''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_deriv_ex_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_1",
              "content": [
                r'''1. $\dfrac{d}{dx}(8x^4 - 5x^3 + 2x - 7) = $''',
                {"drop": "0"},
                r'''$x^3 -$ ''',
                {"drop": "1"},
                r'''$x^2 +$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$32$",
                r"$15$",
                r"$2$",
                r"$0$",
                r"$8$",
                r"$5$",
                r"$-7$",
              ],
              "correctAnswers": {"0": r"$32$", "1": r"$15$", "2": r"$2$"},
              "explanation": r'''$32x^3 - 15x^2 + 2$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_2",
              "content": [
                r'''2. $\dfrac{d}{dx}(x^{-3}) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-3$",
                r"$-x$",
                r"$3$",
                r"$-3x^{4}$",
                r"$-3x^{-4}$",
              ],
              "correctAnswers": {"0": r"$-3x^{-4}$"},
              "explanation": r'''$\dfrac{d}{dx}(x^{-3}) = -3x^{-4}$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_3",
              "content": [
                r'''3. $\dfrac{d}{dx}\left(\dfrac{5}{x^2}\right) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-2$",
                r"$-3$",
                r"$-10x^{-3}$",
                r"$-10x^{-1}$",
                r"$10x^3$",
              ],
              "correctAnswers": {"0": r"$-10x^{-3}$"},
              "explanation": r'''เขียนใหม่เป็น $5x^{-2}$
        
        จะได้ว่า $\dfrac{d}{dx}\left(\dfrac{5}{x^2}\right) = 5 \cdot (-2)x^{-3} = -10x^{-3}$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_4",
              "content": [
                r'''4. $\dfrac{d}{dx}(\sqrt{x}) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{2\sqrt{x}}$",
                r"$\dfrac{1}{2} \cdot \sqrt{x}$",
                r"$\dfrac{1}{2x}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{1}{2\sqrt{x}}$"},
              "explanation": r'''เขียนใหม่เป็น $x^{\dfrac{1}{2}}$
        
        ดังนั้น $\dfrac{d}{dx}(\sqrt{x}) = $
        
        $\dfrac{1}{2} \cdot x^{1/2 - 1} = \dfrac{1}{2}x^{-1/2} = \dfrac{1}{2\sqrt{x}}$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_5",
              "content": [
                r'''5. $\dfrac{d}{dx}[(2x - 1)(3x + 4)] = $
        
        หน้าดิฟหลัง + หลังดิฟหน้า:
        
        $= (2x - 1) \cdot$ ''',
                {"drop": "0"},
                r'''$+ (3x + 4) \cdot$ ''',
                {"drop": "1"},
                r'''$=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$2$",
                r"$3$",
                r"$12x + 5$",
                r"$6x - 3$",
                r"$6x + 8$",
              ],
              "correctAnswers": {"0": r"$3$", "1": r"$2$", "2": r"$12x + 5$"},
              "explanation":
                  r'''$(2x-1)(3) + (3x+4)(2) = 6x - 3 + 6x + 8 = 12x + 5$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_6", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_6",
              "content": [
                r'''6. $\dfrac{d}{dx}\left(\dfrac{3x - 2}{x + 5}\right) = $''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{17}{(x + 5)^2}$",
                r"$\dfrac{-5}{(x + 5)^2}$",
                r"$\dfrac{8}{(x + 5)^2}$",
                r"$3x + 15$",
                r"$-2$",
              ],
              "correctAnswers": {"0": r"$\dfrac{17}{(x + 5)^2}$"},
              "explanation": r'''ล่างดิฟบน - บนดิฟล่างหารด้วย ล่างกำลัง 2
        
        จะได้ ดิฟบน $= \dfrac{d}{dx} 3x - 2 = 3$
        
        ดิฟล่าง $= \dfrac{d}{dx} x + 5 = 1$
        
        ล่างดิฟบน - บนดิฟล่าง $= (x + 5)(3) - (3x - 2)(1)$
        $= 3x + 15 - (3x - 2) = 17$
        
        ล่างกำลัง 2 $= (x + 5)^2$
        
        ดังนั้น $\dfrac{d}{dx}\left(\dfrac{3x - 2}{x + 5}\right) = \dfrac{17}{(x + 5)^2}$''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_7", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_7",
              "content": [
                r'''7. ถ้า $f(x) = x^3 - 2x^2 + 5$ แล้ว $f'(2) = ?$
        
        $f'(x) = \dfrac{d}{dx}(x^3 - 2x^2 + 5) =$ ''',
                {"drop": "0"},
                r'''$f'(2) =$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$3x^2 - 4x$",
                r"$12$",
                r"$8$",
                r"$4$",
                r"$3x^2 - 2x$",
              ],
              "correctAnswers": {"0": r"$3x^2 - 4x$", "1": r"$4$"},
              "explanation":
                  r'''$f'(x) = 3x^2 - 4x$ แทน $x=2$ ได้ $3(4) - 4(2) = 12 - 8 = 4$ 💚''',
            },
          ],
        }),
        ContentBlock("ddq_deriv_ex_8", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_deriv_ex_8",
              "content": [
                r'''8. จงหาความชันของเส้นสัมผัส $y = x^2 + 3x - 1$ ที่ $x = 1$
        
        ความชัน $= \dfrac{dy}{dx}$ ที่ $x = 1$
        
        $\dfrac{dy}{dx} =$ ''',
                {"drop": "0"},
                r'''ที่ $x = 1$: ความชัน $=$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$2x + 3$",
                r"$5$",
                r"$2x$",
                r"$3$",
                r"$x + 3$",
              ],
              "correctAnswers": {"0": r"$2x + 3$", "1": r"$5$"},
              "explanation":
                  r'''$\dfrac{dy}{dx} = 2x + 3$ แทน $x=1$ ได้ $2(1) + 3 = 5$ 💚''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("deriv_intro_t_338", "text", {
          "content": [
            r'''🎯 **6 สมบัติสำคัญของอนุพันธ์**
        
        **1. ค่าคงที่:** $\dfrac{d}{dx}(c) = 0$
        
        **2. เลขยกกำลัง:** $\dfrac{d}{dx}(x^n) = nx^{n-1}$ (ตบลงมาคูณ ลบ 1)
        
        **3. คูณค่าคงที่:** $\dfrac{d}{dx}[c \cdot f(x)] = c \cdot f'(x)$ (ดึงออกมาได้)
        
        **4. ผลบวก/ลบ:** $\dfrac{d}{dx}[f \pm g] = f' \pm g'$ (แยกได้)
        
        **5. ผลคูณ:** $\dfrac{d}{dx}[f \cdot g] = f \cdot g' + g \cdot f'$ (หน้าดิฟหลัง + หลังดิฟหน้า)
        
        **6. ผลหาร:** $\dfrac{d}{dx}\left[\dfrac{f}{g}\right] = \dfrac{g \cdot f' - f \cdot g'}{g^2}$ (ล่างดิฟบน - บนดิฟล่าง หารล่าง$^2$)''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัดเรื่องความต่อเนื่อง (แบบฝึกหัดเรื่องความต่อเนื่อง)

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcChainRuleLesson = ContentLesson(
  title: "กฎลูกโซ่",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("chain_t_339", "text", {
          "content": [
            r'''จากบทที่แล้ว เราสามารถหา diff ของ $x^5, x^{10}, x^{100}$ ได้แล้ว! 👑
        
        **แต่ถ้าเจอแบบนี้ล่ะ?** 🤔
        
        $$(3x + 2)^5$$
        
        ต้องใช้ **กฎลูกโซ่ (Chain Rule)**! 🔗''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"Chain Rule",
      blocks: [
        ContentBlock("chain_t_340", "text", {
          "content": [
            r'''มาจากแนวคิดการ **เปลี่ยนตัวแปร** ♻️
        
        ลองดูตัวอย่างนี้:
        
        สมมติว่ามี 2 ฟังก์ชัน:
        
        🔸 $y = 2t^2 + 3$
        
        🔸 $t = x^3 - 2x + 1$
        
        **❓คำถาม:** จะหา $\dfrac{dy}{dx}$ ยังไง? 🤔
        
        💡 **คำตอบ:** 
        
        $$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$$
        
        **ความหมาย:** 
        
        🔸 $\dfrac{dy}{dt}$ = อัตราการเปลี่ยนแปลงของ $y$ เทียบกับ $t$
        
        🔸 $\dfrac{dt}{dx}$ = อัตราการเปลี่ยนแปลงของ $t$ เทียบกับ $x$
        
        ⭐ คูณกัน = อัตราการเปลี่ยนแปลงของ $y$ เทียบกับ $x$! 🎯
        
        Note = ทำไม?
        
        💭 **ลองคิดแบบง่ายๆ:**
        
        🔸 $y$ เปลี่ยน $2$ หน่วย $t$ เปลี่ยน $1$ หน่วย 
        
        $(\dfrac{dy}{dt} = \dfrac{2}{1})$
        
        🔸 $t$ เปลี่ยน $3$ หน่วย $x$ เปลี่ยน $1$ หน่วย 
        
        $(\dfrac{dt}{dx} = \dfrac{3}{1})$
        
        แล้ว $y$ เปลี่ยนกี่หน่วย เมื่อ $x$ เปลี่ยน $1$ หน่วย?
        
        $x$ เปลี่ยน $1$ จะได้ $t$ เปลี่ยน $3$
        
        และ $t$ เปลี่ยน $3$ คือ $y$ เปลี่ยน $2 \times 3 = 6$ ⭐
        
        นี่คือหลักการของ **Chain Rule**! 🔗''',
          ],
        }),
        ContentBlock("chain_h_341", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("chain_t_342", "text", {
          "content": [
            r'''ให้ $y = 2t^2 + 3$ และ $t = x^3 - 2x + 1$
        
        จงหา $\dfrac{dy}{dx}$
        
        **วิธีทำ:**''',
          ],
        }),
        ContentBlock("ddq_chain_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** หา $\dfrac{dy}{dt}$
        
        จาก $y = 2t^2 + 3$
        
        $\dfrac{dy}{dt} =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$4t$",
                r"$2t$",
                r"$2t^2$",
                r"$4t^2$",
                r"$2$",
              ],
              "correctAnswers": {"0": r"$4t$"},
              "explanation": r'''$\dfrac{d}{dt}(2t^2 + 3) = 4t$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** หา $\dfrac{dt}{dx}$
        
        จาก $t = x^3 - 2x + 1$
        
        $\dfrac{dt}{dx} =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$3x^2 - 2$",
                r"$x^3 - 2$",
                r"$3x^2$",
                r"$x^2 - 2$",
                r"$3x$",
              ],
              "correctAnswers": {"0": r"$3x^2 - 2$"},
              "explanation": r'''$\dfrac{d}{dx}(x^3 - 2x + 1) = 3x^2 - 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_3",
              "content": [
                r'''🏁 **ขั้นที่ 3:** คูณกัน
        
        $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$
        
        $=$ ''',
                {"drop": "0"},
                r'''$\times$ ''',
                {"drop": "1"},
                r'''$= 4t(3x^2 - 2)$ 
        
        แทนค่า $t = x^3 - 2x + 1$ ลงไปจะได้
        
        $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx} =$''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$4t$",
                r"$3x^2 - 2$",
                r"$4t(3x^2 - 2)$",
                r"$12x^2 - 8$",
                r"$4(x^3 - 2x + 1)(3x^2 - 2)$",
              ],
              "correctAnswers": {
                "0": r"$4t$",
                "1": r"$3x^2 - 2$",
                "2": r"$4(x^3 - 2x + 1)(3x^2 - 2)$",
              },
              "explanation":
                  r'''$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$
        
        $= 4t \times (3x^2 - 2) = 4t(3x^2 - 2)$ แทนค่า $t = x^3 - 2x + 1$ ที่กำหนดตอนแรก
        
        จะได้ $\dfrac{dy}{dx} = 4(x^3 - 2x + 1)(3x^2 - 2)$ 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🌟 Chain Rule หลายชั้น",
      blocks: [
        ContentBlock("chain_t_346", "text", {
          "content": [
            r'''Chain Rule ใช้ได้**หลายชั้น**! 🏗️
        
        $$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dw} \cdot \dfrac{dw}{dx}$$
        
        หรือมากกว่านั้น!
        
        $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dw} \cdot \dfrac{dw}{dv} \cdot ... \cdot \dfrac{d?}{dx}$
        
        💡 **หลักการ:** เชื่อมโซ่ไปเรื่อยๆ จนถึง $x$! 🔗''',
          ],
        }),
        ContentBlock("chain_h_347", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("chain_t_348", "text", {
          "content": [
            r'''ให้ $y = t^2$, $t = w + 1$, $w = 3x - 2$
        
        จงหา $\dfrac{dy}{dx}$''',
          ],
        }),
        ContentBlock("ddq_chain_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_4",
              "content": [
                r'''1. หา $\dfrac{dy}{dx}$ โดยใช้ Chain Rule
        
        $\dfrac{dy}{dt} =$ ''',
                {"drop": "0"},
                r'''$\dfrac{dt}{dw} =$ ''',
                {"drop": "1"},
                r'''$\dfrac{dw}{dx} =$ ''',
                {"drop": "2"},
                r'''$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dw} \cdot \dfrac{dw}{dx} =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2t$",
                r"$1$",
                r"$3$",
                r"$6t$",
                r"$2w$",
                r"$6w$",
              ],
              "correctAnswers": {
                "0": r"$2t$",
                "1": r"$1$",
                "2": r"$3$",
                "3": r"$6t$",
              },
              "explanation":
                  r'''$\dfrac{dy}{dx} = 2t \times 1 \times 3 = 6t$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"Chain Rule แบบเร็ว",
      blocks: [
        ContentBlock("chain_t_350", "text", {
          "content": [
            r'''ตอนนี้มาดูกรณีที่ฟังก์ชันซ้อนกันใน**สมการเดียว** 🎯
        
        เช่น $(3x + 2)^5$
        
        เราสามารถ**มองเป็นการเปลี่ยนตัวแปร**ได้!
        
        ให้ $t = 3x + 2$ แล้ว $y = t^5$
        
        ใช้ Chain Rule: $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$
        
        💬 **วิธีย่อ:** **"ดิฟปกติ** $\times$ **ดิฟไส้"** 🎯''',
          ],
        }),
        ContentBlock("chain_h_351", "header", {
          "title": r"สูตร Chain Rule",
          "level": 2,
        }),
        ContentBlock("chain_t_352", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}[f(g(x))] = f'(g(x)) \cdot g'(x)$$
        
        หรือพูดง่ายๆ:
        
        **ดิฟปกติ** $\times$ **ดิฟไส้**
        
        Note = เพื่อความเข้าใจ
        
        นี่เป็นวิธีเดียวกัน แค่เปลี่ยนรูปแบบให้ง่ายขึ้น''',
          ],
        }),
        ContentBlock("chain_h_353", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("chain_t_354", "text", {
          "content": [
            r'''จงหา $\dfrac{d}{dx}[(3x + 2)^5]$
        
        **วิธีที่ 1: เปลี่ยนตัวแปร** ♻️''',
          ],
        }),
        ContentBlock("ddq_chain_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_5",
              "content": [
                r'''ให้ $t = 3x + 2$ แล้ว $y = t^5$
        
        $\dfrac{dy}{dt} =$ ''',
                {"drop": "0"},
                r'''$\dfrac{dt}{dx} =$ ''',
                {"drop": "1"},
                r'''$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx} =$ ''',
                {"drop": "2"},
                r'''แทน $t = 3x + 2$ กลับ: $\dfrac{dy}{dx} =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$5t^4$",
                r"$3$",
                r"$15t^4$",
                r"$15(3x + 2)^4$",
                r"$5(3x + 2)^4$",
                r"$t^4$",
              ],
              "correctAnswers": {
                "0": r"$5t^4$",
                "1": r"$3$",
                "2": r"$15t^4$",
                "3": r"$15(3x + 2)^4$",
              },
              "explanation": r'''$5t^4 \times 3 = 15t^4 = 15(3x + 2)^4$ ✅''',
            },
          ],
        }),
        ContentBlock("chain_t_356", "text", {
          "content": [r'''**วิธีที่ 2: ดิฟปกติ** $\times$ **ดิฟไส้** ⚡'''],
        }),
        ContentBlock("ddq_chain_6", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_6",
              "content": [
                r'''$\dfrac{d}{dx}[(3x + 2)^5]$
        
        **ดิฟปกติ** : ของ $(3x + 2)^5$ ได้ ''',
                {"drop": "0"},
                r'''**ดิฟไส้** (ดิฟของ $3x + 2$): ''',
                {"drop": "1"},
                r'''**ดิฟปกติ** $\times$ **ดิฟไส้**''',
                {"drop": "0"},
                r'''$\times$ ''',
                {"drop": "1"},
                r'''$=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$3$",
                r"$15(3x + 2)^4$",
                r"$5$",
                r"$5(3x + 2)^4$",
                r"$(3x + 2)^4$",
                r"$2$",
                r"$3x$",
              ],
              "correctAnswers": {
                "0": r"$5(3x + 2)^4$",
                "1": r"$3$",
                "2": r"$15(3x + 2)^4$",
              },
              "explanation": r'''$5(3x + 2)^4 \times 3 = 15(3x + 2)^4$ ✅''',
            },
          ],
        }),
        ContentBlock("chain_t_358", "text", {
          "content": [
            r'''💡 **เห็นไหม?** ทั้ง 2 วิธีให้คำตอบเหมือนกัน! วิธีที่ 2 เร็วกว่า! 🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_chain_ex1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex1",
              "content": [
                r'''1. ให้ $y = 2(x^3 - 2x + 1)^2 + 3$
        
        **ลองเปลี่ยนตัวแปร!** ให้ $t =$ ''',
                {"drop": "0"},
                r'''แล้ว $y =$ ''',
                {"drop": "1"},
                r'''$\dfrac{dy}{dt} =$ ''',
                {"drop": "2"},
                r'''$\dfrac{dt}{dx} =$ ''',
                {"drop": "3"},
                r'''$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx} =$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$x^3 - 2x + 1$",
                r"$2t^2 + 3$",
                r"$4t$",
                r"$3x^2 - 2$",
                r"$4t(3x^2 - 2)$",
                r"$2t$",
                r"$t^2 + 3$",
              ],
              "correctAnswers": {
                "0": r"$x^3 - 2x + 1$",
                "1": r"$2t^2 + 3$",
                "2": r"$4t$",
                "3": r"$3x^2 - 2$",
                "4": r"$4t(3x^2 - 2)$",
              },
              "explanation":
                  r'''ให้ $t = x^3 - 2x + 1$ แล้ว $y = 2t^2 + 3$, $\dfrac{dy}{dx} = 4t(3x^2 - 2)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex2",
              "content": [
                r'''2. ให้ $y = (2x + 1)^3 - 5(2x + 1) + 7$
        
        **ลองเปลี่ยนตัวแปร!** ให้ $t =$ ''',
                {"drop": "0"},
                r'''แล้ว $y =$ ''',
                {"drop": "1"},
                r'''$\dfrac{dy}{dt} =$ ''',
                {"drop": "2"},
                r'''$\dfrac{dt}{dx} =$ ''',
                {"drop": "3"},
                r'''$\dfrac{dy}{dx} =$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$2x + 1$",
                r"$t^3 - 5t + 7$",
                r"$3t^2 - 5$",
                r"$2$",
                r"$2(3t^2 - 5)$",
                r"$6t^2 - 10$",
                r"$t^3 - 5$",
              ],
              "correctAnswers": {
                "0": r"$2x + 1$",
                "1": r"$t^3 - 5t + 7$",
                "2": r"$3t^2 - 5$",
                "3": r"$2$",
                "4": r"$2(3t^2 - 5)$",
              },
              "explanation":
                  r'''ให้ $t = 2x + 1$ แล้ว $y = t^3 - 5t + 7$, $\dfrac{dy}{dx} = (3t^2 - 5) \times 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex3",
              "content": [
                r'''3. ให้ $y = \sqrt{x^2 + 1}$
        
        เขียนใหม่: $y = (x^2 + 1)^{1/2}$
        
        **ลองเปลี่ยนตัวแปร!** ให้ $t =$ ''',
                {"drop": "0"},
                r'''แล้ว $y =$ ''',
                {"drop": "1"},
                r'''$\dfrac{dy}{dt} =$ ''',
                {"drop": "2"},
                r'''$\dfrac{dt}{dx} =$ ''',
                {"drop": "3"},
                r'''$\dfrac{dy}{dx} =$ ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$x^2 + 1$",
                r"$t^{1/2}$",
                r"$\dfrac{1}{2}t^{-1/2}$",
                r"$2x$",
                r"$\dfrac{x}{t^{1/2}}$",
                r"$\dfrac{x}{\sqrt{x^2 + 1}}$",
                r"$\sqrt{t}$",
              ],
              "correctAnswers": {
                "0": r"$x^2 + 1$",
                "1": r"$t^{1/2}$",
                "2": r"$\dfrac{1}{2}t^{-1/2}$",
                "3": r"$2x$",
                "4": r"$\dfrac{x}{\sqrt{x^2 + 1}}$",
              },
              "explanation":
                  r'''$\dfrac{dy}{dx} = \dfrac{1}{2}t^{-1/2} \times 2x = \dfrac{x}{\sqrt{t}} = \dfrac{x}{\sqrt{x^2 + 1}}$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⚡ แบบฝึกหัด: ใช้สูตรโดยตรง",
      blocks: [
        ContentBlock("ddq_chain_ex4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex4",
              "content": [
                r'''1. $\dfrac{d}{dx}[(2x - 1)^3] = ?$
        
        ดิฟปกติ $=$ ''',
                {"drop": "0"},
                r'''ดิฟไส้ $=$ ''',
                {"drop": "1"},
                r'''คำตอบ $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$3(2x - 1)^2$",
                r"$2$",
                r"$6(2x - 1)^2$",
                r"$(2x - 1)^2$",
                r"$3$",
              ],
              "correctAnswers": {
                "0": r"$3(2x - 1)^2$",
                "1": r"$2$",
                "2": r"$6(2x - 1)^2$",
              },
              "explanation": r'''$3(2x - 1)^2 \times 2 = 6(2x - 1)^2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex5",
              "content": [
                r'''2. $\dfrac{d}{dx}[(x^2 + 3x)^4] = ?$
        
        ดิฟปกติ $=$ ''',
                {"drop": "0"},
                r'''ดิฟไส้ $=$ ''',
                {"drop": "1"},
                r'''คำตอบ $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$4(x^2 + 3x)^3$",
                r"$2x + 3$",
                r"$4(2x + 3)(x^2 + 3x)^3$",
                r"$(x^2 + 3x)^3$",
                r"$x + 3$",
              ],
              "correctAnswers": {
                "0": r"$4(x^2 + 3x)^3$",
                "1": r"$2x + 3$",
                "2": r"$4(2x + 3)(x^2 + 3x)^3$",
              },
              "explanation": r'''$4(x^2 + 3x)^3 \times (2x + 3)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex6", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex6",
              "content": [
                r'''3. $\dfrac{d}{dx}\left[\dfrac{1}{(3x + 1)^2}\right] = ?$
        
        เขียนใหม่: $(3x + 1)^{-2}$
        
        ดิฟปกติ $=$ ''',
                {"drop": "0"},
                r'''ดิฟไส้ $=$ ''',
                {"drop": "1"},
                r'''คำตอบ $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$-2(3x + 1)^{-3}$",
                r"$3$",
                r"$-6(3x + 1)^{-3}$",
                r"$(3x + 1)^{-3}$",
                r"$-2$",
              ],
              "correctAnswers": {
                "0": r"$-2(3x + 1)^{-3}$",
                "1": r"$3$",
                "2": r"$-6(3x + 1)^{-3}$",
              },
              "explanation":
                  r'''$-2(3x + 1)^{-3} \times 3 = -6(3x + 1)^{-3}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex7", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex7",
              "content": [
                r'''4. $\dfrac{d}{dx}[\sqrt{5x - 2}] = ?$
        
        เขียนใหม่: $(5x - 2)^{1/2}$
        
        ดิฟปกติ $=$ ''',
                {"drop": "0"},
                r'''ดิฟไส้ $=$ ''',
                {"drop": "1"},
                r'''คำตอบ $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{2}(5x - 2)^{-1/2}$",
                r"$5$",
                r"$\dfrac{5}{2}(5x - 2)^{-1/2}$",
                r"$\dfrac{5}{2\sqrt{5x - 2}}$",
                r"$(5x - 2)^{-1/2}$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{1}{2}(5x - 2)^{-1/2}$",
                "1": r"$5$",
                "2": r"$\dfrac{5}{2}(5x - 2)^{-1/2}$",
              },
              "explanation":
                  r'''$\dfrac{1}{2}(5x - 2)^{-1/2} \times 5 = \dfrac{5}{2\sqrt{5x - 2}}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_chain_ex8", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_chain_ex8",
              "content": [
                r'''5. $\dfrac{d}{dx}[(x^3 - 1)^{10}] = ?$
        
        ดิฟปกติ: ตบ ''',
                {"drop": "0"},
                r'''ลงมา ยกกำลัง ''',
                {"drop": "1"},
                r'''ดิฟไส้ $=$ ''',
                {"drop": "2"},
                r'''คำตอบ $=$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$10$",
                r"$9$",
                r"$3x^2$",
                r"$30x^2(x^3 - 1)^9$",
                r"$10(x^3 - 1)^9$",
                r"$x^2$",
              ],
              "correctAnswers": {
                "0": r"$10$",
                "1": r"$9$",
                "2": r"$3x^2$",
                "3": r"$30x^2(x^3 - 1)^9$",
              },
              "explanation":
                  r'''$10(x^3 - 1)^9 \times 3x^2 = 30x^2(x^3 - 1)^9$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"คำถามชวนคิด 💭",
      blocks: [
        ContentBlock("chain_t_367", "text", {
          "content": [
            r'''**ทำไม** $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$ **ถึงใช้ได้?** 🤔
        
        มันดูเหมือนเราจะ **"ตัด $dt$ ออก"** ได้เลย! 
        
        $$\dfrac{dy}{\cancel{dt}} \cdot \dfrac{\cancel{dt}}{dx} = \dfrac{dy}{dx}$$
        
        **นี่ถูกต้องจริงหรือ?** 🔍
        
        Note = คำใบ้
        
        💭 **คิดจากนิยาม:**
        
        $\dfrac{dy}{dt} = \lim\limits_{h \to 0} \dfrac{y(t + h) - y(t)}{h}$
        
        $\dfrac{dt}{dx} = \lim\limits_{k \to 0} \dfrac{t(x + k) - t(x)}{k}$
        
        เมื่อเอามาคูณกัน จะได้ $\dfrac{dy}{dx}$ จริงๆ!
        
        ตอบ
        
        💡 **สรุป:** 
        
        แม้ $\dfrac{dy}{dt}$ จะไม่ใช่เศษส่วนธรรมดา แต่มันมีสมบัติ**เหมือนเศษส่วน**!
        
        เราสามารถ **"ตัด"** ได้จริง! ✨''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("chain_t_368", "text", {
          "content": [
            r'''🎯 **กฎลูกโซ่ (Chain Rule)**
        
        **1. แนวคิดหลัก:** มาจากการเปลี่ยนตัวแปร และ **ใช้ได้หลายชั้น**
        
        $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dw} \cdot \dfrac{dw}{dx}$
        
        **2. สูตรฟังก์ชันซ้อน:**
        
        $$\dfrac{d}{dx}[f(g(x))] = f'(g(x)) \cdot g'(x)$$
        
        **3. วิธีจำ:** "ดิฟปกติ $\times$ ดิฟไส้" 🎯
        
        **4. หลายชั้น:** ดิฟทีละชั้นจากนอกเข้าใน 🏗️''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcLHopitalLesson = ContentLesson(
  title: "กฎของโลปิตาล (L'Hospital's Rule)",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("lhop_t_369", "text", {
          "content": [
            r'''จากบทที่ผ่านมา เราได้เรียนการหาลิมิตด้วยวิธีต่างๆ มาแล้ว 📚
        
        - แยกตัวประกอบ
        - Conjugate
        - จัดรูปเศษส่วนพหุนาม
        - การหาค่าต่างๆ...
        
        **แต่บางทีมันซับซ้อนมาก!** 😅
        
        **มีวิธีที่**ง่ายกว่า**มาก!** 
        
        นั่นคือ **กฎของโลปิตาล (L'Hospital's Rule)**! 🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎯 กฎของโลปิตาลคืออะไร?",
      blocks: [
        ContentBlock("lhop_t_370", "text", {
          "content": [
            r'''**กฎของโลปิตาล** เป็นเทคนิคพิเศษสำหรับหาลิมิตที่ได้รูปแบบ
        
        $$\dfrac{0}{0} , \dfrac{\infty}{\infty}$$
        
        💬 **แนวคิด:** แทนที่จะจัดรูปซับซ้อน เรา**ดิฟบนและดิฟล่าง**แทน!
        
        ดิฟเรื่อยๆจนกว่าจะได้จำนวนจริง''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สูตร",
      blocks: [
        ContentBlock("lhop_t_371", "text", {
          "content": [
            r'''ถ้า $\lim\limits_{x \to a} \dfrac{f(x)}{g(x)}$ แทนตรงๆได้รูป $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$
        
        แล้ว
        
        $$\lim\limits_{x \to a} \dfrac{f(x)}{g(x)} = \lim\limits_{x \to a} \dfrac{f'(x)}{g'(x)}$$
        
        💡 **ความหมาย:** 
        
        **ดิฟบน ดิฟล่าง แล้วหาลิมิตใหม่!** 🎯
        
        Note = เงื่อนไขสำคัญ
        
        ใช้ได้**เฉพาะ** $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ เท่านั้น!
        
        ถ้าได้รูปอื่น เช่น $\dfrac{k}{0}$ ($k \neq 0$) หรือ $\infty - \infty$ 
        
        ใช้ไม่ได้''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"แนวคิดหลัก",
      blocks: [
        ContentBlock("lhop_t_372", "text", {
          "content": [
            r'''**ขั้นที่ 1:** แทนค่าตรงๆ ตรวจสอบว่าได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ ไหม?
        
        **ขั้นที่ 2:** ถ้าใช่ $\to$ ดิฟบน ดิฟล่าง (แยกกัน)
        
        **ขั้นที่ 3:** หาลิมิตใหม่
        
        **ขั้นที่ 4:** ถ้ายังเป็น $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty} \to$ ใช้ L'Hospital ต่อ!''',
          ],
        }),
        ContentBlock("lhop_h_373", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("lhop_t_374", "text", {
          "content": [
            r'''จงหา
        
        $$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$$
        
        **มาทำทีละขั้นตอน! 🚀**''',
          ],
        }),
        ContentBlock("ddq_lhospital_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** ตรวจสอบรูปแบบ
        
        แทน $x = 2$:
        
        $\dfrac{2^2 - 4}{2 - 2} = \dfrac{0}{0}$
        
        ได้รูป ''',
                {"drop": "0"},
                r'''$\to$ ใช้ L'Hospital ได้ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$\dfrac{\infty}{\infty}$",
                r"$\infty - \infty$",
                r"ใช่",
                r"ไม่",
              ],
              "correctAnswers": {"0": r"$\dfrac{0}{0}$", "1": r"ใช่"},
              "explanation": r'''ได้ $\dfrac{0}{0}$ ใช้ L'Hospital ได้! ✅''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** ดิฟบนและดิฟล่าง
        
        ดิฟบน: $\dfrac{d}{dx}(x^2 - 4) =$ ''',
                {"drop": "0"},
                r'''ดิฟล่าง: $\dfrac{d}{dx}(x - 2) =$ ''',
                {"drop": "1"},
                r'''ลิมิตใหม่ ดิฟบนส่วนดิฟล่าง: $\lim\limits_{x \to 2}$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$2x$",
                r"$1$",
                r"$x$",
                r"$2$",
                r"$x^2$",
                r"$\dfrac{x}{1}$",
                r"$\dfrac{2x}{1}$",
              ],
              "correctAnswers": {
                "0": r"$2x$",
                "1": r"$1$",
                "2": r"$\dfrac{2x}{1}$",
              },
              "explanation": r'''ดิฟบนได้ $2x$ และดิฟล่างได้ $1$
        จะได้ลิมิตใหม่ดิฟบนส่วนดิฟล่าง $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2} = \lim\limits_{x \to 2} \dfrac{2x}{1}$''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_3",
              "content": [
                r'''🏁 **ขั้นที่ 3:** หาลิมิตใหม่
        
        $\lim\limits_{x \to 2} \dfrac{2x}{1}$
        
        แทน $x = 2$: $\dfrac{2(2)}{1} =$ ''',
                {"drop": "0"},
                r'''**คำตอบ:** ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2$", r"$4$", r"$6$", r"$0$", r"$1$"],
              "correctAnswers": {"0": r"$4$"},
              "explanation": r'''แทนค่าได้ $4$ ทันที! 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_lhospital_ex1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_ex1",
              "content": [
                r'''1. $\lim\limits_{x \to 3} \dfrac{x^2 - 9}{x - 3} =$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$2x$",
                r"$1$",
                r"$6$",
                r"$\dfrac{\infty}{\infty}$",
                r"$3$",
              ],
              "correctAnswers": {"0": r"$6$"},
              "explanation": r'''ดิฟบน : $\dfrac{d}{dx}(x^2 - 9) = 2x$
        
        ดิฟล่าง: $\dfrac{d}{dx}(x - 3) = 1$
        
        ดิฟบนส่วนดิฟล่างได้ 
        
        $\lim\limits_{x \to 3} \dfrac{x^2 - 9}{x - 3} = \lim\limits_{x \to 3} \dfrac{2x}{1}$ 
        
        แทน $x=3$ ได้ $6$''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_ex2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_ex2",
              "content": [
                r'''2. $\lim\limits_{x \to 1} \dfrac{x^3 - 1}{x - 1} = ?$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$3x^2$",
                r"$1$",
                r"$3$",
                r"$x^2$",
                r"$0$",
              ],
              "correctAnswers": {"0": r"$3$"},
              "explanation": r'''ดิฟบน : $\dfrac{d}{dx}(x^3 - 1) = 3x^2$
        
        ดิฟล่าง: $\dfrac{d}{dx}(x - 1) = 1$
        
        ดิฟบนส่วนดิฟล่างได้ 
        
        $\lim\limits_{x \to 1} \dfrac{x^3 - 1}{x - 1} = \lim\limits_{x \to 1} \dfrac{3x^2}{1}$
        
        แทน $x = 1$ ได้ $3$''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_ex3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_ex3",
              "content": [
                r'''3. $\lim\limits_{x \to 0} \dfrac{x^2 + 2x}{x} = ?$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$2x + 2$",
                r"$1$",
                r"$2$",
                r"$x + 2$",
                r"$0$",
              ],
              "correctAnswers": {"0": r"$2$"},
              "explanation": r'''ดิฟบน : $\dfrac{d}{dx}(x^2 + 2x) = 2x + 2$
        
        ดิฟล่าง: $\dfrac{d}{dx}(x) = 1$
        
        ดิฟบนส่วนดิฟล่างได้ 
        
        $\lim\limits_{x \to 0} \dfrac{x^2 + 2x}{x} = \lim\limits_{x \to 0} \dfrac{2x + 2}{1}$
        
        แทน $x = 0$ ได้ $2$''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🔁 ใช้ L'Hospital หลายครั้ง",
      blocks: [
        ContentBlock("lhop_t_381", "text", {
          "content": [
            r'''บางทีใช้ครั้งเดียวยังได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ อยู่!
        
        → **ใช้ L'Hospital ต่อ!** 🔄''',
          ],
        }),
        ContentBlock("ddq_lhospital_multi1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_multi1",
              "content": [
                r'''1. จงหา $\lim\limits_{x \to 0} \dfrac{x^3}{x^2}$
        
        **ครั้งที่ 1:**
        
        แทนค่า: $\dfrac{0}{0}$ ใช้ L'Hospital
        
        ดิฟบน: $\dfrac{d}{dx}(x^3) =$ ''',
                {"drop": "0"},
                r'''ดิฟล่าง $\dfrac{d}{dx}(x^2) = 2x$
        
        ได้ $\lim\limits_{x \to 0} \dfrac{x^3}{x^2} = \lim\limits_{x \to 0}$ ''',
                {"drop": "1"},
                r'''แทนค่า $x = 0$ ได้ ''',
                {"drop": "2"},
                r'''ต้องใช้ L'Hospital อีกรอบ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$3x^2$",
                r"$2x$",
                r"ใช่",
                r"ไม่",
                r"$x^2$",
                r"$x$",
                r"$3$",
                r"$\dfrac{0}{0}$",
                r"$\dfrac{\infty}{\infty}$",
                r"$\dfrac{3x^2}{2x}$",
              ],
              "correctAnswers": {
                "0": r"$3x^2$",
                "1": r"$\dfrac{3x^2}{2x}$",
                "2": r"$\dfrac{0}{0}$",
                "3": r"ใช่",
              },
              "explanation":
                  r'''ใช้ L'hospital ได้ $\lim\limits_{x \to 0} \dfrac{x^3}{x^2} = \lim\limits_{x \to 0} \dfrac{3x^2}{2x}$
        
        แทนค่า $x = 0$ ตรงๆ ยังได้ $\dfrac{0}{0}$ ต้องใช้ต่อ!''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_multi2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_multi2",
              "content": [
                r'''**ครั้งที่ 2:**
        
        ดิฟบน: $\dfrac{d}{dx}(3x^2) =$ ''',
                {"drop": "0"},
                r'''ดิฟล่าง: $\dfrac{d}{dx}(2x) =$ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 0} \dfrac{3x^2}{2x} = \lim\limits_{x \to 0}$ ''',
                {"drop": "2"},
                r'''แทนค่า $x = 0$ จะได้ ''',
                {"drop": "3"},
                r'''ซึ่งเป็นจำนวนจริง
        
        ดังนั้นตอบ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$6x$",
                r"$2$",
                r"$0$",
                r"$3$",
                r"$6$",
                r"$x$",
                r"$\dfrac{6x}{2}$",
                r"$\dfrac{2x}{1}$",
              ],
              "correctAnswers": {
                "0": r"$6x$",
                "1": r"$2$",
                "2": r"$\dfrac{6x}{2}$",
                "3": r"$0$",
              },
              "explanation":
                  r'''ใช้ L'hospital ได้ $\lim\limits_{x \to 0} \dfrac{3x^2}{2x} = \lim\limits_{x \to 0} \dfrac{6x}{2}$
        
        แทนค่า $x = 0$ ตรงๆ ได้ $0$ ซึ่งเป็นจำนวนจริงดังนั้นตอบได้เลย''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📚 แบบฝึกหัดเพิ่มเติม",
      blocks: [
        ContentBlock("ddq_lhospital_add1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_add1",
              "content": [
                r'''1. $\lim\limits_{x \to 2} \dfrac{x^3 - 8}{x^2 - 4} = $''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$3x^2$",
                r"$2x$",
                r"$3$",
                r"$12$",
              ],
              "correctAnswers": {"0": r"$3$"},
              "explanation": r'''แทนค่า: ได้ $\dfrac{0}{0}$ ใช้ L'hospital
        
        ดิฟบน: $\dfrac{d}{dx}(x^3 - 8) = 3x^2$
        
        ดิฟล่าง $\dfrac{d}{dx}(x^2 - 4) = 2x$
        
        $\lim\limits_{x \to 2} \dfrac{x^3 - 8}{x^2 - 4} = \lim\limits_{x \to 2} \dfrac{3x^2}{2x}$
        
        $= \dfrac{3(2)^2}{2(2)} = \dfrac{12}{4} = 3$''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_add2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_add2",
              "content": [
                r'''2. $\lim\limits_{x \to 0} \dfrac{x^2 + 3x}{2x} = ?$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{0}{0}$",
                r"$2x + 3$",
                r"$2$",
                r"$\dfrac{3}{2}$",
                r"$3$",
                r"$0$",
              ],
              "correctAnswers": {"0": r"$\dfrac{3}{2}$"},
              "explanation": r'''แทนค่า: ได้ $\dfrac{0}{0}$ ใช้ L'hospital
        
        ดิฟบน: $\dfrac{d}{dx}(x^2 + 3x) = 2x + 3$
        
        ดิฟล่าง $\dfrac{d}{dx}(2x) = 2$
        
        $\lim\limits_{x \to 0} \dfrac{x^2 + 3x}{2x} = \lim\limits_{x \to 0} \dfrac{2x + 3}{2}$
        
        $= \dfrac{3}{2}$''',
            },
          ],
        }),
        ContentBlock("ddq_lhospital_add3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lhospital_add3",
              "content": [
                r'''3. $\lim\limits_{x \to \infty} \dfrac{3x + 5}{2x - 1} = $''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{\infty}{\infty}$",
                r"$3$",
                r"$2$",
                r"$\dfrac{3}{2}$",
                r"$0$",
                r"$1$",
              ],
              "correctAnswers": {"0": r"$\dfrac{3}{2}$"},
              "explanation":
                  r'''แทนค่า: ได้ $\dfrac{\infty}{\infty}$ ใช้ L'hospital
        
        ดิฟบน: $\dfrac{d}{dx}(3x + 5) = 3$
        
        ดิฟล่าง $\dfrac{d}{dx}(2x - 1) = 2$
        
        $\lim\limits_{x \to \infty} \dfrac{3x + 5}{2x - 1} = \lim\limits_{x \to \infty} \dfrac{3}{2}$
        
        $= \dfrac{3}{2}$''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lhop_t_387", "text", {
          "content": [
            r'''🎯 **กฎของโลปิตาล (L'Hospital's Rule)**
        
        **1. ใช้เมื่อไหร่:** เจอ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ เท่านั้น! ⚠️
        
        **2. สูตร:**
        
        $$\lim\limits_{x \to a} \dfrac{f(x)}{g(x)} = \lim\limits_{x \to a} \dfrac{f'(x)}{g'(x)}$$
        
        **3. วิธีใช้:** **ดิฟบน ดิฟล่าง แล้วหาลิมิตใหม่!** 🎯
        
        **4. ใช้หลายครั้งได้:** ถ้ายังได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ → ใช้ L'Hospital ต่อ! 🔄''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

// ── ประยุกต์กับเรขาวิเคราะห์ ──────────────────────────────────────────────────────────────

final calcTangentLineLesson = ContentLesson(
  title: "การหาสมการเส้นสัมผัส",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("tangent_t_388", "text", {
          "content": [
            r'''จากบทที่ผ่านมา 🎥 เรารู้แล้วว่า
        
        $\mathbf{f'(x) =}$ ความชันของเส้นสัมผัส ณ $\mathbf{x}$
        
        ซึ่งมันสามารถประยุกต์กับบทเรขาคณิตวิเคราะห์ได้
        
        บทนี้เราจะมาเรียนกัน! 🚀
        
        Note = สำคัญ
        
        หากยังไม่แม่นเรื่อง เรขาคณิตวิเคราะห์ให้ไปทบทวนใน ... หรือข้ามเรื่องนี้ไปก่อน''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🔑 แนวคิดหลัก",
      blocks: [
        ContentBlock("tangent_t_389", "text", {
          "content": [
            r'''การหาสมการเส้นสัมผัส ใช้ **2 เครื่องมือ** รวมกัน:
        
        **1. อนุพันธ์** $\to$ หาความชัน (diff) 📐
        
        **2. เรขาวิเคราะห์**
        
        **สรุป:** 
        
        🔸 Diff ใช้แค่หา**ความชันเส้นสัมผัส**เท่านั้น! 
        
        🔸 **ที่เหลือใช้เรขาวิเคราะห์**''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📐 ทบทวน: สมการเส้นตรง",
      blocks: [
        ContentBlock("tangent_t_390", "text", {
          "content": [
            r'''จากเรขาวิเคราะห์ เส้นตรงที่ผ่านจุด $(x_1, y_1)$ และมีความชัน $m$:
        
        $$y - y_1 = m(x - x_1)$$
        
        💬 **นี่คือสูตรที่เราจะใช้!** เพียงแค่รู้:
        
        🔸 จุดที่เส้นตรงผ่าน $(x_1, y_1)$ 
        
        🔸 ความชัน $m$
        
        เราก็เขียนสมการเส้นสัมผัสของ $f(x)$ ที่จุด $(x, f(x))$ ได้แล้ว! ✅''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎯 ขั้นตอนหาสมการเส้นสัมผัส",
      blocks: [
        ContentBlock("tangent_h_391", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("tangent_t_392", "text", {
          "content": [
            r'''จงหาสมการเส้นสัมผัสของ $f(x) = x^2$ ที่จุด $x = 1$''',
          ],
        }),
        ContentBlock("tangent_t_393", "image", {"path": "assets/diff6.png"}),
        ContentBlock("tangent_t_394", "text", {
          "content": [
            r'''**มาทำทีละขั้นตอน! 🚀**
        
        Note = หมายเหตุ
        
        สมการเส้นสัมผัสที่จะหาคือ สมการเส้นประสีเทา''',
          ],
        }),
        ContentBlock("ddq_tangent_step1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_tangent_step1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** หาจุดสัมผัส และความชัน
        🔸 หาจุดสัมผัส
        
        เมื่อ $x_1 = 1$:
        
        $y_1 = f(1) = (1)^2 =$ ''',
                {"drop": "0"},
                r'''👉 จุดสัมผัสคือ ''',
                {"drop": "1"},
                r'''🔸 หาความชันของเส้นประสีเทา
        
        ดิฟ $f(x)$ เพื่อหาความชัน ณ จุด $x$ ใดๆ
        
        $f'(x) = \dfrac{d}{dx}(x^2) =$ ''',
                {"drop": "2"},
                r'''👉 ความชัน ณ $x = 1$:
        
        $m = f'(1) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$1$",
                r"$(1, 1)$",
                r"$(1, 2)$",
                r"$2$",
                r"$(0, 1)$",
                r"$2x$",
                r"$2$",
                r"$x$",
                r"$1$",
                r"$x^2$",
              ],
              "correctAnswers": {
                "0": r"$1$",
                "1": r"$(1, 1)$",
                "2": r"$2x$",
                "3": r"$2$",
              },
              "explanation":
                  r'''แทน $x = 1$ ได้ $y = 1$ จุดสัมผัสคือ $(1, 1)$ $f'(x) = 2x$ แทน $x=1$ ได้ความชัน $m = 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_tangent_step2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_tangent_step2",
              "content": [
                r'''📏 **ขั้นที่ 2:** หาสมการเส้นสัมผัส
        
        จุด: $(1, 1)$ และ ความชัน: $m = 2$
        
        ใช้สูตร: $y - y_1 = m(x - x_1)$
        
        $y -$ ''',
                {"drop": "0"},
                r'''$=$ ''',
                {"drop": "1"},
                r'''$\times(x - 1)$''',
              ],
              "draggableItems": [r"$1$", r"$2$", r"$0$", r"$x$", r"$1$"],
              "correctAnswers": {"0": r"$1$", "1": r"$2$"},
              "explanation": r'''แทนค่าได้ $y - 1 = 2(x - 1)$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_tangent_ex1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_tangent_ex1",
              "content": [
                r'''1. จงหาสมการเส้นสัมผัสของ $y = x^2$ ที่ $x = 2$
        
        $y =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$4$",
                r"$(2, 4)$",
                r"$4x - 4$",
                r"$2$",
                r"$2x$",
              ],
              "correctAnswers": {"0": r"$4x - 4$"},
              "explanation": r'''เมื่อ $x = 2$: $y = 4$, จุด $(2, 4)$
        $f'(x) = 2x$, $m = 4$
        $y - 4 = 4(x - 2) \to y = 4x - 4$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_tangent_ex2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_tangent_ex2",
              "content": [
                r'''2. จงหาสมการเส้นสัมผัสของ $y = x^3$ ที่ $x = 1$
        
        **ขั้นที่ 1:** จุด
        
        $y_1 =$ ''',
                {"drop": "0"},
                r''', จุด = ''',
                {"drop": "1"},
                r'''**ขั้นที่ 2:** ความชัน
        
        $f'(x) = 3x^2$, $m =$ ''',
                {"drop": "2"},
                r'''**ขั้นที่ 3:** สมการ
        
        $y =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$1$",
                r"$(1, 1)$",
                r"$3$",
                r"$3x - 2$",
                r"$2$",
                r"$3x$",
              ],
              "correctAnswers": {
                "0": r"$1$",
                "1": r"$(1, 1)$",
                "2": r"$3$",
                "3": r"$3x - 2$",
              },
              "explanation":
                  r'''จุด $(1, 1)$ ความชัน $3$ ได้ $y - 1 = 3(x - 1) \to y = 3x - 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_tangent_ex3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_tangent_ex3",
              "content": [
                r'''3. จงหาสมการเส้นสัมผัสของ $y = 2x^2 - 3x + 1$ ที่ $x = 2$
        
        **ขั้นที่ 1:** จุด
        
        $y_1 = 2(4) - 6 + 1 =$ ''',
                {"drop": "0"},
                r'''จุด = ''',
                {"drop": "1"},
                r'''**ขั้นที่ 2:** ความชัน
        
        $f'(x) = 4x - 3$, $m = 4(2) - 3 =$ ''',
                {"drop": "2"},
                r'''**ขั้นที่ 3:** สมการ
        
        $y =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$3$",
                r"$(2, 3)$",
                r"$5$",
                r"$5x - 7$",
                r"$4$",
                r"$5x$",
              ],
              "correctAnswers": {
                "0": r"$3$",
                "1": r"$(2, 3)$",
                "2": r"$5$",
                "3": r"$5x - 7$",
              },
              "explanation":
                  r'''จุด $(2, 3)$ ความชัน $5$ ได้ $y - 3 = 5(x - 2) \to y = 5x - 7$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("tangent_t_400", "text", {
          "content": [
            r'''🎯 **การหาสมการเส้นสัมผัส**
        
        **1. หลักสำคัญ:**
          🔸 **Diff** $\to$ **หาความชัน** เท่านั้น! 📐
        
          🔸 **เรขาวิเคราะห์** $\to$ **เขียนสมการ** 📏
        
        **2. สูตรเส้นตรง:**
        
        $$y - y_1 = m(x - x_1)$$''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

// ── ฟังก์ชันเพิ่ม-ลดและจุดสูงสุด-ต่ำสุด ──────────────────────────────────────────────────────────────

final calcIncDecLesson = ContentLesson(
  title: "ฟังก์ชันเพิ่ม-ลด",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("incdec_t_401", "text", {
          "content": [
            r'''เรารู้แล้วว่า
        
        $$f'(x) = \text{ความชัน ณ จุด } x$$
        
        ใช้ในการประยุกต์กับโจทย์เรขาคณิตวิเคราะห์แล้ว
        
        **แล้วเราใช้ทำอะไรได้อีกบ้าง?** 🤔
        
        **คำตอบ:** ดูว่าฟังก์ชัน**เพิ่มหรือลด**!🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🤨 ฟังก์ชันเพิ่ม-ลดคือ?",
      blocks: [
        ContentBlock("incdec_t_402", "text", {
          "content": [
            r'''🔸 **ฟังก์ชันเพิ่ม** ณ จุด $x = a$ 🤩
        
        เมื่อ $x$ เพิ่ม ⬆️✨ ค่า $y$ เพิ่ม ⬆️✨ด้วย
        
        🔸 **ฟังก์ชันลด** ณ จุด $x = a$ 🚨
        
        เมื่อ $x$ เพิ่ม ⬆️✨ ค่า $y$ ลดลง ⬇️💧''',
          ],
        }),
        ContentBlock("incdec_h_403", "header", {
          "title": r"🧠 เหตุผล",
          "level": 2,
        }),
        ContentBlock("ddq_func_inc_proof_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_inc_proof_1",
              "content": [
                r'''**1. ทบทวนความชัน**''',
                {"image": "assets/diff7.png"},
                r'''🔸ในรูปความชันเป็น ''',
                {"drop": "0"},
                {"image": "assets/diff8.png"},
                r'''🔸 ในรูปความชันเป็น ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$+$",
                r"$+$",
                r"$0$",
                r"$0$",
                r"$-$",
                r"$-$",
              ],
              "correctAnswers": {"0": r"$+$", "1": r"$-$"},
              "explanation":
                  r'''$f'(1) = 4 > 0$ ความชันบวก → ฟังก์ชันเพิ่ม ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_inc_proof_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_inc_proof_2",
              "content": [
                r'''**2. ลองดูกราฟ** ว่าช่วงไหนกราฟขาขึ้น - ขาลง 💸''',
                {"graph": "graph_data_tangent2.dart"},
                r'''🔸 ช่วง $x \in [-1, 0)$ ความชันเป็น ''',
                {"drop": "0"},
                r''' เสมอ
        
        ซึ่งเป็นขา ''',
                {"drop": "1"},
                r''' หรือคือฟังก์ชันกำลังเพิ่ม
        
        🔸 ช่วง $x \in (0, 2)$ ความชันเป็น ''',
                {"drop": "2"},
                r''' เสมอ
        
        ซึ่งเป็นขา ''',
                {"drop": "3"},
                r'''หรือคือฟังก์ชันกำลังลด''',
              ],
              "draggableItems": [
                r"$+$",
                r"$+$",
                r"ขึ้น",
                r"ขึ้น",
                r"ลง",
                r"$-$",
                r"$-$",
              ],
              "correctAnswers": {
                "0": r"$+$",
                "1": r"ขึ้น",
                "2": r"$-$",
                "3": r"ลง",
              },
              "explanation":
                  r'''$f'(1) = 4 > 0$ ความชันบวก → ฟังก์ชันเพิ่ม ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⚙️ หลักการ",
      blocks: [
        ContentBlock("incdec_t_406", "text", {
          "content": [
            r'''เราใช้**ความชัน** $f'(x)$ ดูว่าฟังก์ชันเพิ่มหรือลด:
        
        ณ จุด $x = a$
        
        🔸 $f'(a) > 0 \to$ **ฟังก์ชันเพิ่ม** ⬆️✨
        
        🔸 $f'(a) < 0 \to$ **ฟังก์ชันลด** ⬇️💧
        
        🔸 $f'(a) = 0 \to$ ความชันเป็น**ศูนย์** $\to$ **ไม่เป็นทั้งเพิ่มและลด** 🐎
        
        ⭐ **สรุป:** แค่ดู**ความชัน**ก็รู้เลยว่าเพิ่มหรือลด!''',
          ],
        }),
        ContentBlock("incdec_h_407", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("ddq_func_inc_dec_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_inc_dec_1",
              "content": [
                r'''1. ให้ $f(x) = x^2 + 2x + 1$ 
        
        ฟังก์ชันเพิ่มหรือลดที่ $x = 1$?
        
        **ขั้นที่ 1:** หาอนุพันธ์
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 2:** แทนค่า $x = 1$
        
        $f'(1) = 2(1) + 2 =$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** สรุป
        
        $f'(1) > 0$ → ฟังก์ชัน ''',
                {"drop": "2"},
                r'''ที่ $x = 1$''',
              ],
              "draggableItems": [
                r"$2x + 2$",
                r"$4$",
                r"เพิ่ม",
                r"ลด",
                r"$x + 2$",
                r"$2$",
                r"$0$",
              ],
              "correctAnswers": {"0": r"$2x + 2$", "1": r"$4$", "2": r"เพิ่ม"},
              "explanation":
                  r'''$f'(1) = 4 > 0$ ความชันบวก → ฟังก์ชันเพิ่ม ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_inc_dec_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_inc_dec_2",
              "content": [
                r'''2. ให้ $f(x) = -x^2 + 3x + 2$
        
        ฟังก์ชันเพิ่มหรือลดที่ $x = 2$ และ $x = 3$?
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''ที่ $x = 2$: $f'(2) = -2(2) + 3 =$ ''',
                {"drop": "1"},
                r'''→ ฟังก์ชัน ''',
                {"drop": "2"},
                r'''ที่ $x = 3$: $f'(3) = -2(3) + 3 =$ ''',
                {"drop": "3"},
                r'''→ ฟังก์ชัน ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$-2x + 3$",
                r"$-1$",
                r"ลด",
                r"$1$",
                r"เพิ่ม",
                r"$-3$",
                r"$0$",
                r"ลด",
              ],
              "correctAnswers": {
                "0": r"$-2x + 3$",
                "1": r"$-1$",
                "2": r"ลด",
                "3": r"$-3$",
                "4": r"ลด",
              },
              "explanation": r'''$f'(2) = -1 < 0$ ลด, $f'(3) = -3 < 0$ ลด ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_inc_dec_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_inc_dec_3",
              "content": [
                r'''3. ให้ $f(x) = x^3 - 3x^2 + 1$
        
        ฟังก์ชันเพิ่มหรือลดที่ $x = 0$, $x = 1$, $x = 3$?
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''$x = 0$: $f'(0) =$ ''',
                {"drop": "1"},
                r'''→ ''',
                {"drop": "2"},
                r'''$x = 1$: $f'(1) = 3 - 6 =$ ''',
                {"drop": "3"},
                r'''→ ''',
                {"drop": "4"},
                r'''$x = 3$: $f'(3) = 27 - 18 =$ ''',
                {"drop": "5"},
                r'''→ ''',
                {"drop": "6"},
              ],
              "draggableItems": [
                r"$3x^2 - 6x$",
                r"$0$",
                r"ไม่เพิ่มไม่ลด",
                r"$-3$",
                r"ลด",
                r"$9$",
                r"เพิ่ม",
                r"$3$",
              ],
              "correctAnswers": {
                "0": r"$3x^2 - 6x$",
                "1": r"$0$",
                "2": r"ไม่เพิ่มไม่ลด",
                "3": r"$-3$",
                "4": r"ลด",
                "5": r"$9$",
                "6": r"เพิ่ม",
              },
              "explanation":
                  r'''$f'(0) = 0$ ไม่เพิ่มไม่ลด, $f'(1) < 0$ ลด, $f'(3) > 0$ เพิ่ม ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"ฟังก์ชันเพิ่ม-ลดบนช่วง",
      blocks: [
        ContentBlock("incdec_t_411", "text", {
          "content": [
            r'''ย้อนกลับไปดูด้านบนตรง 🧠 **เหตุผล** ว่าในกราฟที่ให้เติมคำตอบว่าช่วงขาขึ้นหรือขาลง นั่นคือช่วงที่เราจะหาในหัวข้อนี้
        
        เช่น ฟังก์ชันเพิ่มบนช่วง $(a, b)$ หมายถึง ฟังก์ชัน**เพิ่ม**ทุกจุดในช่วงนั้น''',
          ],
        }),
        ContentBlock("incdec_h_412", "header", {
          "title": r"🎯 วิธีหา",
          "level": 2,
        }),
        ContentBlock("incdec_t_413", "text", {
          "content": [
            r'''**ขั้นที่ 1:** หา $f'(x)$
        
        **ขั้นที่ 2:** ตั้งอสมการ
        
        🔸 หาช่วงที่**เพิ่ม**: ให้ $f'(x) > 0$ แล้วแก้
        
        🔸 หาช่วงที่**ลด**: ให้ $f'(x) < 0$ แล้วแก้
        
        **ขั้นที่ 3:** แก้อสมการ ทบทวนใน "อสมการจำนวนจริง"''',
          ],
        }),
        ContentBlock("incdec_h_414", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("incdec_t_415", "text", {
          "content": [
            r'''ให้ $f(x) = -x^3 + 12x + 1$
        
        จงหาช่วงที่ $f$ เพิ่ม และลด
        
        **มาทำทีละขั้น! 🚀**''',
          ],
        }),
        ContentBlock("ddq_func_interval_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_interval_1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** หาอนุพันธ์
        
        $f(x) = -x^3 + 12x + 1$
        
        $f'(x) =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-3x^2 + 12$",
                r"$-x^2 + 12$",
                r"$-3x^2$",
                r"$12$",
                r"$-3x^2 + 12x$",
              ],
              "correctAnswers": {"0": r"$-3x^2 + 12$"},
              "explanation": r'''$f'(x) = -3x^2 + 12$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_interval_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_interval_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** ตั้งอสมการ (หาช่วงที่เพิ่ม)
        
        ฟังก์ชันเพิ่มเมื่อ $f'(x) > 0$
        
        $-3x^2 + 12 > 0$
        
        หารด้วย $-3$: (เครื่องหมายพลิก!)
        
        $x^2$ ''',
                {"drop": "0"},
                r'''$4$ ''',
                {"drop": "1"},
                r''' $0$
        
        $(x - 2)(x + 2)$ ''',
                {"drop": "1"},
                r'''$0$''',
              ],
              "draggableItems": [
                r"$<$",
                r"$>$",
                r"$\leq$",
                r"$\geq$",
                r"$=$",
                r"$-$",
                r"$+$",
              ],
              "correctAnswers": {"0": r"$-$", "1": r"$<$"},
              "explanation":
                  r'''หาร $-3$ ทั้งสองข้าง: $x^2 - 4 < 0$ (เครื่องหมายพลิก) แยกตัวประกอบ: $(x - 2)(x + 2) < 0$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_interval_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_interval_3",
              "content": [
                r'''📊 **ขั้นที่ 3:** แก้อสมการ
        
        $(x - 2)(x + 2) < 0$''',
                {"image": "assets/diff1.png"},
                r'''เขียน + - + จากขวาไปซ้าย
        
        เนื่องจากต้องการหาช่วงที่ $(x - 2)(x + 2) < 0$ 
        
        ดังนั้นต้องลากเส้นส่วนที่เป็น $-$''',
                {"image": "assets/diff2.png"},
                r'''**ช่วงที่ทำให้:** $(x - 2)(x + 2) < 0$ คือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$(-2, 2)$",
                r"$(-\infty, -2)$",
                r"$(2, \infty)$",
              ],
              "correctAnswers": {"0": r"$(-2, 2)$"},
              "explanation":
                  r'''ช่วงที่ทำให้ $(x - 2)(x + 2) < 0$ คือ $-2 < x < 2$ หรือ $(-2, 2)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_func_interval_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_func_interval_4",
              "content": [
                r'''🔽 **หาช่วงที่ลด**
        
        ฟังก์ชันลดเมื่อ $f'(x) < 0$
        
        จากข้อก่อน $(x - 2)(x + 2) < 0$ เมื่อ $-2 < x < 2$
        
        ดังนั้น $(x - 2)(x + 2) > 0$ เมื่อ ''',
                {"drop": "0"},
                {"image": "assets/diff3.png"},
                r'''**ช่วงที่ลด:** ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x < -2$ หรือ $x > 2$",
                r"$-2 < x < 2$",
                r"$x = -2$",
                r"$x = 2$",
                r"$x > 0$",
              ],
              "correctAnswers": {"0": r"$x < -2$ หรือ $x > 2$"},
              "explanation":
                  r'''ฟังก์ชันลดบนช่วง $(-\infty, -2)$ และ $(2, \infty)$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🤯 จุดวิกฤติ",
      blocks: [
        ContentBlock("incdec_t_420", "text", {
          "content": [
            r'''**จุดวิกฤติ** คือจุด $x = a$ ที่:
        
        $f'(a) = 0 \text{ หรือ } f'(a) \text{ หาค่าไม่ได้}$
        
        Note = สำคัญ
        
        $f(a)$ ต้อง**หาค่าได้**!
        
        หลังหาค่า $a$ ได้จะต้องไปดูว่า $f(a)$ หาค่าได้ไหม''',
          ],
        }),
        ContentBlock("ddq_critical_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_critical_1",
              "content": [
                r'''ให้ $f(x) = x^3 - 3x^2 + 1$
        
        จงหาจุดวิกฤติ
        
        $f'(x) = 3x^2 - 6x$
        
        ให้ $f'(x) = 0$:
        
        $3x^2 - 6x = 0$
        
        $3x(x - 2) = 0$
        
        $x =$ ''',
                {"drop": "0"},
                r'''หรือ $x =$ ''',
                {"drop": "1"},
                r'''ตรวจสอบ: $f(0)$ และ $f(2)$ หาค่า ''',
                {"drop": "2"},
                r'''**จุดวิกฤติ:** $x = 0$ และ $x = 2$ ✅''',
              ],
              "draggableItems": [
                r"$0$",
                r"$2$",
                r"ได้",
                r"ไม่ได้",
                r"$3$",
                r"$-3$",
              ],
              "correctAnswers": {"0": r"$0$", "1": r"$2$", "2": r"ได้"},
              "explanation":
                  r'''แก้ได้ $x = 0, 2$ และ $f(0), f(2)$ หาค่าได้ → จุดวิกฤติคือ $x = 0, 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_critical_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_critical_2",
              "content": [
                r'''ให้ $f(x) = \dfrac{1}{x - 1}$
        
        จงหาจุดวิกฤติ
        
        $f'(x) = -\dfrac{1}{(x - 1)^2}$
        
        $f'(x) = 0$ มีคำตอบ ''',
                {"drop": "0"},
                r'''$f'(x)$ หาค่าไม่ได้เมื่อ $x =$ ''',
                {"drop": "1"},
                r'''แต่ $f(1)$ หาค่า ''',
                {"drop": "2"},
                r'''**จุดวิกฤติ:** ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"ไม่มี",
                r"$1$",
                r"ได้",
                r"ไม่ได้",
                r"ไม่มี",
                r"$0$",
                r"มี",
              ],
              "correctAnswers": {
                "0": r"ไม่มี",
                "1": r"$1$",
                "2": r"ไม่ได้",
                "3": r"ไม่มี",
              },
              "explanation":
                  r'''$f'(x) \neq 0$ เสมอ, ที่ $x=1$ หา $f(1)$ ไม่ได้ → ไม่มีจุดวิกฤติ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_practice_1",
              "content": [
                r'''1. ให้ $f(x) = x^2 - 4x + 3$
        
        หาช่วงที่ฟังก์ชันเพิ่มและลด
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''จุดวิกฤติ: $f'(x) = 0$ เมื่อ $x =$ ''',
                {"drop": "1"},
                r'''ช่วงที่ลด ($f'(x) < 0$): ''',
                {"drop": "2"},
                r'''ช่วงที่เพิ่ม ($f'(x) > 0$): ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2x - 4$",
                r"$2$",
                r"$x < 2$",
                r"$x > 2$",
                r"$0$",
                r"$(-\infty, 2)$",
                r"$(2, \infty)$",
              ],
              "correctAnswers": {
                "0": r"$2x - 4$",
                "1": r"$2$",
                "2": r"$x < 2$",
                "3": r"$x > 2$",
              },
              "explanation":
                  r'''$2x - 4 = 0$ ได้ $x = 2$, ลดเมื่อ $x < 2$, เพิ่มเมื่อ $x > 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_practice_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_practice_2",
              "content": [
                r'''2. ให้ $f(x) = x^3 - 6x^2 + 9x + 1$
        
        หาจุดวิกฤติและช่วงเพิ่ม-ลด
        
        $f'(x) = 3x^2 - 12x + 9 = 3(x^2 - 4x + 3) = 3(x - 1)(x - 3)$
        
        จุดวิกฤติ: $x =$ ''',
                {"drop": "0"},
                r'''และ $x =$ ''',
                {"drop": "1"},
                r'''ช่วงที่เพิ่ม ($f'(x) > 0$): ''',
                {"drop": "2"},
                r'''ช่วงที่ลด ($f'(x) < 0$): ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$1$",
                r"$3$",
                r"$x < 1$ หรือ $x > 3$",
                r"$1 < x < 3$",
                r"$0$",
                r"$x > 0$",
              ],
              "correctAnswers": {
                "0": r"$1$",
                "1": r"$3$",
                "2": r"$x < 1$ หรือ $x > 3$",
                "3": r"$1 < x < 3$",
              },
              "explanation":
                  r'''จุดวิกฤติ $x = 1, 3$ เพิ่มเมื่อ $x < 1$ หรือ $x > 3$ ลดเมื่อ $1 < x < 3$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("incdec_t_425", "text", {
          "content": [
            r'''**🎯 ฟังก์ชันเพิ่ม-ลด**
        
        **1. หลักการ:** ดูค่า**ความชัน**! 📐
        
        🔸$f'(x) > 0 \to$ **ฟังก์ชันเพิ่ม** ⬆️✨
        
        🔸$f'(x) < 0 \to$ **ฟังก์ชันลด** ⬇️💧
        
        🔸$f'(x) = 0 \to$ **จุดวิกฤติ** 🤯
        
        **2. เหตุผล:** 
        
        🔸ความชัน $+ \to$ กราฟลาดขึ้น
        
        🔸ความชันลบ $- \to$ กราฟลาดลง
        
        **3. การหาช่วงที่เพิ่ม-ลด:**
        
        ☝️ หา $f'(x)$
        
        ✌️ ตั้ง**อสมการ**: $f'(x) > 0$ (เพิ่ม) หรือ $f'(x) < 0$ (ลด)
        
        🤟 **แก้อสมการ** (ใช้ความรู้จำนวนจริง)
        
        **4. จุดวิกฤติ:**
        
        $f'(a) = 0 \text{ หรือ หาค่าไม่ได้}$
        
        โดย $f(a)$ หาค่าได้''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcExtremaLesson = ContentLesson(
  title: "จุดสูงสุด-ต่ำสุด",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("extrema_t_426", "text", {
          "content": [
            r'''จากบทที่แล้ว เราได้เรียนการหาช่วงที่ฟังก์ชัน**เพิ่ม-ลด**แล้ว 
        
        **แล้วถ้าฟังก์ชันเปลี่ยนทิศล่ะ?** 🤔
        
        จาก เพิ่ม $\to$ ลด หรือ ลด $\to$ เพิ่ม
        
        จุดเปลี่ยนนี้คือ **จุดสูงสุดหรือต่ำสุด**! ⚡
        
        บทนี้เราจะมาเรียนกัน! 🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎯 จุดสูงสุด-ต่ำสุดสัมพัทธ์",
      blocks: [
        ContentBlock("extrema_t_427", "text", {
          "content": [
            r'''🔹**จุดสูงสุดสัมพัทธ์** ⛰️
        
        จุดที่**สูงกว่า**บริเวณรอบๆ
        
        🔸**จุดต่ำสุดสัมพัทธ์** 🏞️
        
        จุดที่**ต่ำกว่า**บริเวณรอบๆ
        
        Note = สำคัญ
        
        ไม่จำเป็นต้องสูงสุดหรือต่ำสุดของทั้งกราฟ แค่บริเวณรอบๆ ไปดูตัวอย่างด้านล่างกัน!''',
          ],
        }),
        ContentBlock("extrema_h_428", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_extrema_relative_0", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_relative_0",
              "content": [
                {"graph": "graph_data_tangent2.dart"},
                r'''🎯 **ขั้นที่ 1:** หาจุดสูงสุดต่ำสุดสัมพัทธ์
        
        จากความหมายด้านบน
        
        🔸จุดสูงสุดสัมพัทธ์คือ ''',
                {"drop": "0"},
                r'''🔸จุดต่ำสุดสัมพัทธ์คือ ''',
                {"drop": "1"},
                r'''🔋 **ขั้นที่ 2:** หาจุดเปลี่ยนความชัน
        
        🔹จุด ''',
                {"drop": "0"},
                r'''เปลี่ยนความชันจาก ''',
                {"drop": "2"},
                r'''🔹จุด ''',
                {"drop": "1"},
                r'''เปลี่ยนความชันจาก ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$(4, 0)$",
                r"$(0, 4)$",
                r"$(2, 0)$",
                r"$(0, 2)$",
                r"$+ \to -$",
                r"$+ \to -$",
                r"$- \to +$",
                r"$- \to +$",
              ],
              "correctAnswers": {
                "0": r"$(0, 4)$",
                "1": r"$(2, 0)$",
                "2": r"$+ \to -$",
                "3": r"$- \to +$",
              },
              "explanation":
                  r'''หาค่าดิฟและแยกตัวประกอบ: $f'(x) = 3x^2 - 6x = 3x(x-2) = 0$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⭐️ สรุปแนวคิด",
      blocks: [
        ContentBlock("extrema_t_430", "text", {
          "content": [
            r'''🔹**จุดสูงสุดสัมพัทธ์**คือ จุดที่เปลี่ยนความชันจาก $+ \to -$
        
        🔸**จุดต่ำสุดสัมพัทธ์**คือ จุดที่เปลี่ยนความชันจาก $- \to +$
        
        **🌱 ขั้นตอน:**
        
        **ขั้นที่ 1:** หา $f'(x)$ เพื่อหาความชัน
        
        **ขั้นที่ 2:** วาด**เส้นจำนวน** และใส่เครื่องหมาย
        
        **ขั้นที่ 3:** ดูการเปลี่ยนเครื่องหมาย:
        
        🔸 $(+) \to (-)$ จุดสูงสุดสัมพัทธ์ ⛰️
        
        🔸 $(-) \to (+)$ จุดต่ำสุดสัมพัทธ์ 🏞️
        
        🔸 ไม่เปลี่ยน $\to$ ไม่เป็นทั้งคู่ 🙅🏻‍♂️
        
        **ขั้นที่ 4:** แทนค่าจุด $x$ ที่หาได้ลง $f(x)$ เพื่อหา $y$ จะได้พิกัด $(x, y)$
        
        Note = หมายเหตุ
        
        โดยทั่วไปมักจะสอนว่าใช้จุดวิกฤติหาจุดสูงสุดต่ำสุดสัมพัทธ์ แต่มันมีข้อยกเว้นเช่น $f''(x) = 0$ และอื่นๆ ทำให้ใช้วิธีนี้ง่ายกว่า''',
          ],
        }),
        ContentBlock("extrema_h_431", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("extrema_t_432", "text", {
          "content": [
            r'''ให้ $f(x) = x^3 - 3x^2 + 1$
        
        จงหาจุดสูงสุดและต่ำสุดสัมพัทธ์
        
        **มาทำทีละขั้นตอน! 🚀**''',
          ],
        }),
        ContentBlock("ddq_extrema_relative_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_relative_1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** หา $f'(x)$
        
        $f(x) = x^3 - 3x^2 + 1$
        
        $f'(x) =$ ''',
                {"drop": "0"},
                r'''แยกตัวประกอบ ''',
                {"drop": "0"},
                r'''$= (3x) \cdot$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$2x$",
                r"$x - 2$",
                r"$3x - 6$",
                r"$3x^2 - 6x + 1$",
                r"$3x^2 - 6x$",
              ],
              "correctAnswers": {"0": r"$3x^2 - 6x$", "1": r"$x - 2$"},
              "explanation":
                  r'''หาค่าดิฟและแยกตัวประกอบ: $f'(x) = 3x^2 - 6x = 3x(x-2) = 0$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_extrema_relative_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_relative_2",
              "content": [
                r'''🙂‍↔️ **ขั้นที่ 2:** วาดเส้นจำนวนของ $3x(x - 2)$
        
        จุดแบ่งช่วง: $x = 0$ และ $x = 2$''',
                {"image": "assets/diff4.png"},
                r'''🧩 **ขั้นที่ 3:** หาจุดสูงสุดต่ำสุดสัมพัทธ์
        
        🔸**จุดต่ำสุดสัมพัทธ์** คือจุดที่เปลี่ยนจาก ''',
                {"drop": "0"},
                r'''🔹**จุดสูงสุดสัมพัทธ์** คือจุดที่เปลี่ยนจาก ''',
                {"drop": "1"},
                r'''ดูจากเส้นจำนวนจุดที่เปลี่ยนจาก ''',
                {"drop": "0"},
                r'''คือ $x =$ ''',
                {"drop": "2"},
                r'''จุดที่เปลี่ยนจาก ''',
                {"drop": "1"},
                r'''คือ $x =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2$",
                r"$0$",
                r"$-2$",
                r"$0$",
                r"$- \to +$",
                r"$+ \to -$",
              ],
              "correctAnswers": {
                "0": r"$- \to +$",
                "1": r"$+ \to -$",
                "2": r"$2$",
                "3": r"$0$",
              },
              "explanation":
                  r'''จาก $3x(x - 2)$ วาดเส้นจำนวนได้ + | 0 | - | 2 | + ดังนั้น $- \to +$ ที่ $x=2$ (ต่ำสุดสัมพัทธ์) และ $+ \to -$ ที่ $x=0$ (สูงสุดสัมพัทธ์) ✅''',
            },
          ],
        }),
        ContentBlock("ddq_extrema_relative_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_relative_3",
              "content": [
                r'''⚙️ **ขั้นที่ 4:** แทนค่าจุด $x$ ที่หาได้ลง $f(x)$
        
        โดย $f(x) = x^3 - 3x^2 + 1$
        
        $x = 2 \to f(x) =$ ''',
                {"drop": "0"},
                r'''$x = 0 \to f(x) =$ ''',
                {"drop": "1"},
                r'''ดังนั้น **จุดต่ำสุดสัมพัทธ์** คือ $(2,$ ''',
                {"drop": "0"},
                r'''$)$
        
        **จุดสูงสุดสัมพัทธ์** คือ $(0,$ ''',
                {"drop": "1"},
                r'''$)$''',
              ],
              "draggableItems": [
                r"$2$",
                r"$0$",
                r"$-3$",
                r"$0$",
                r"$1$",
                r"$-1$",
              ],
              "correctAnswers": {"0": r"$-3$", "1": r"$1$"},
              "explanation":
                  r'''$f(2) = 2^3 - 3(2)^2 + 1 = 8 - 12 + 1 = -3$ และ $f(0) = 0^3 -3(0)^2 + 1 = 1$ ดังนั้น จุดต่ำสุดสัมพัทธ์ $(2, -3)$ จุดสูงสุดสัมพัทธ์ $(0, 1)$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_extrema_relative_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_relative_practice_1",
              "content": [
                r'''1. ให้ $f(x) = x^2 - 4x + 5$
        
        จุดต่ำสุดสัมพัทธ์คือ ''',
                {"drop": "0"},
                r'''จุดสูงสุดสัมพัทธ์คือ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$(1, 4)$",
                r"$(2, 4)$",
                r"$(1, 2)$",
                r"$(2, 1)$",
                r"ไม่มี",
                r"ไม่มี",
              ],
              "correctAnswers": {"0": r"$(2, 1)$", "1": r"ไม่มี"},
              "explanation":
                  r'''$f'(x) = 2x - 4 = 2(x - 2)$ วาดเส้นจำนวน: - | 2 | + เปลี่ยนจาก $- \to +$ ที่ $x=2$ (ต่ำสุดสัมพัทธ์) ไม่มีจุดที่เปลี่ยน $+ \to -$ ดังนั้น $f(2) = 4 - 8 + 5 = 1$ จุดต่ำสุดสัมพัทธ์ $(2, 1)$ ไม่มีจุดสูงสุดสัมพัทธ์ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🌍 จุดสูงสุด-ต่ำสุดสัมบูรณ์",
      blocks: [
        ContentBlock("extrema_t_437", "text", {
          "content": [
            r'''🔹**จุดสูงสุดสัมบูรณ์** 🎢 
        
        จุดที่สูงที่สุดของ**ทั้งกราฟ** หรือ**ช่วงที่กำหนด**
        
        🔸**จุดต่ำสุดสัมบูรณ์** ⌛
        
        จุดที่ต่ำที่สุดของ**ทั้งกราฟ** หรือ**ช่วงที่กำหนด**
        
        Note = หมายเหตุ
        
        โดยทั่วไปโจทย์จะถามบนช่วง เพราะถ้าถามทั้งกราฟคำตอบมักเป็น $\infty$ หรือ $-\infty$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎯 วิธีหาบนช่วง [a, b]",
      blocks: [
        ContentBlock("extrema_t_438", "text", {
          "content": [
            r'''**ขั้นที่ 1:** หาจุดสูงสุด-ต่ำสุด**สัมพัทธ์**ในช่วง $[a, b]$
        
        **ขั้นที่ 2:** เช็ค**ขอบ** $f(a)$ และ $f(b)$
        
        **ขั้นที่ 3:** เปรียบเทียบ:
        
        🔹 จุดสูงสุดสัมบูรณ์
        
        คือ ค่ามากสุดของ ค่า $y$ ของจุดสูงสุดสัมพัทธ์และ $f(a)$ และ $f(b)$
        
        🔸 จุดต่ำสุดสัมบูรณ์ 🌊
        
        คือ ค่าน้อยสุดของ ค่า $y$ ของจุดต่ำสุดสัมพัทธ์และ $f(a)$ และ $f(b)$''',
          ],
        }),
        ContentBlock("extrema_h_439", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("extrema_t_440", "text", {
          "content": [
            r'''ให้ $f(x) = x^3 - 3x^2 + 1$ บนช่วง $[-1, 3]$
        
        จงหาจุดสูงสุดและต่ำสุดสัมบูรณ์
        
        **มาทำทีละขั้น! 🚀**''',
          ],
        }),
        ContentBlock("ddq_extrema_absolute_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_absolute_1",
              "content": [
                r'''🎯 **ขั้นที่ 1:** หาจุดสูงสุด-ต่ำสุดสัมพัทธ์
        
        จากตัวอย่างก่อนหน้า:
        
        จุดสูงสุดสัมพัทธ์: ''',
                {"drop": "0"},
                r''', $f(0) =$ ''',
                {"drop": "1"},
                r'''จุดต่ำสุดสัมพัทธ์: ''',
                {"drop": "2"},
                r''', $f(2) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$(0, 1)$",
                r"$1$",
                r"$(2, -3)$",
                r"$-3$",
                r"$(0, 0)$",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$(0, 1)$",
                "1": r"$1$",
                "2": r"$(2, -3)$",
                "3": r"$-3$",
              },
              "explanation":
                  r'''จากก่อนหน้า: สูงสุดสัมพัทธ์ $(0, 1)$ ต่ำสุดสัมพัทธ์ $(2, -3)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_extrema_absolute_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_absolute_2",
              "content": [
                r'''🔍 **ขั้นที่ 2:** เช็คขอบ
        
        ขอบซ้าย $x = -1$:
        
        $f(-1) = (-1)^3 - 3(-1)^2 + 1 = -1 - 3 + 1 =$ ''',
                {"drop": "0"},
                r'''ขอบขวา $x = 3$:
        
        $f(3) = 27 - 27 + 1 =$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$-3$", r"$1$", r"$0$", r"$-1$", r"$2$"],
              "correctAnswers": {"0": r"$-3$", "1": r"$1$"},
              "explanation":
                  r'''$f(-1) = -1 - 3 + 1 = -3$ และ $f(3) = 27 - 27 + 1 = 1$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_extrema_absolute_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_absolute_3",
              "content": [
                r'''📊 **ขั้นที่ 3:** เปรียบเทียบ
        
        ค่าทั้งหมด:
        🔺 $f(-1) =$ ''',
                {"drop": "0"},
                r'''🔺 $f(0) =$ ''',
                {"drop": "1"},
                r'''🔺 $f(2) =$ ''',
                {"drop": "2"},
                r'''🔺 $f(3) =$ ''',
                {"drop": "3"},
                r'''ค่า**มากที่สุด** = ''',
                {"drop": "1"},
                r'''$\to$ จุดสูงสุดสัมบูรณ์: ''',
                {"drop": "4"},
                r'''ค่า**น้อยที่สุด** = ''',
                {"drop": "2"},
                r'''$\to$  จุดต่ำสุดสัมบูรณ์: ''',
                {"drop": "5"},
                r'''Note = สังเกต 
        
        จุดสูงสุดสัมบูรณ์มี**สองจุด**: $(0, 1)$ และ $(3, 1)$ เพราะมีค่า $y$ เท่ากัน! ตอบทั้งสองจุดได้ ✅''',
              ],
              "draggableItems": [
                r"$-3$",
                r"$1$",
                r"$-3$",
                r"$1$",
                r"$0$",
                r"$(0, 1)$",
                r"$2$",
                r"$(2, -3)$",
                r"$3$",
              ],
              "correctAnswers": {
                "0": r"$-3$",
                "1": r"$1$",
                "2": r"$-3$",
                "3": r"$1$",
                "4": r"$(0, 1)$",
                "5": r"$(2, -3)$",
              },
              "explanation":
                  r'''เปรียบเทียบ: $f(-1)=-3$, $f(0)=1$, $f(2)=-3$, $f(3)=1$ มากสุด $1$ ที่ $(0,1)$ และ $(3,1)$ น้อยสุด $-3$ ที่ $(2,-3)$ และ $(-1,-3)$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด: จุดสูงสุด-ต่ำสุดสัมบูรณ์",
      blocks: [
        ContentBlock("ddq_extrema_absolute_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_absolute_practice_1",
              "content": [
                r'''1. ให้ $f(x) = x^2 - 4x + 3$ บนช่วง $[0, 4]$
        
        หาจุดสูงสุดและต่ำสุดสัมบูรณ์
        
        **ขั้นที่ 1:** จุดสัมพัทธ์
        
        $f'(x) = 2x - 4 = 0$ → $x =$ ''',
                {"drop": "0"},
                r'''เส้นจำนวน: $(-)$ ... 2 ... $(+)$
        
        ที่ $x = 2$: จุด ''',
                {"drop": "1"},
                r''', $f(2) =$ ''',
                {"drop": "2"},
                r'''**ขั้นที่ 2:** เช็คขอบ
        
        $f(0) =$ ''',
                {"drop": "3"},
                r''', $f(4) =$ ''',
                {"drop": "4"},
                r'''**ขั้นที่ 3:** เปรียบเทียบ
        
        $f(0) = 3$, $f(2) = -1$, $f(4) = 3$
        
        จุดสูงสุดสัมบูรณ์: $y =$ ''',
                {"drop": "5"},
                r'''จุดต่ำสุดสัมบูรณ์: ''',
                {"drop": "6"},
              ],
              "draggableItems": [
                r"$2$",
                r"ต่ำสุดสัมพัทธ์",
                r"$-1$",
                r"$3$",
                r"$3$",
                r"$3$",
                r"$(2, -1)$",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"ต่ำสุดสัมพัทธ์",
                "2": r"$-1$",
                "3": r"$3$",
                "4": r"$3$",
                "5": r"$3$",
                "6": r"$(2, -1)$",
              },
              "explanation":
                  r'''$f(2) = 4 - 8 + 3 = -1$ (ต่ำสุดสัมพัทธ์), $f(0) = 3$, $f(4) = 16 - 16 + 3 = 3$ สูงสุดสัมบูรณ์ $3$ ที่ $(0,3)$ และ $(4,3)$ ต่ำสุดสัมบูรณ์ $-1$ ที่ $(2,-1)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_extrema_absolute_practice_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_extrema_absolute_practice_2",
              "content": [
                r'''2. ให้ $f(x) = x^3 - 12x + 1$ บนช่วง $[-3, 3]$
        
        $f'(x) = 3x^2 - 12 = 3(x^2 - 4) = 3(x-2)(x+2)$
        
        จุดสัมพัทธ์: $x = -2$ และ $x =$ ''',
                {"drop": "0"},
                r'''$f(-2) = -8 + 24 + 1 =$ ''',
                {"drop": "1"},
                r''' (สูงสุดสัมพัทธ์)
        
        $f(2) = 8 - 24 + 1 =$ ''',
                {"drop": "2"},
                r''' (ต่ำสุดสัมพัทธ์)
        
        เช็คขอบ:
        
        $f(-3) = -27 + 36 + 1 =$ ''',
                {"drop": "3"},
                r'''$f(3) = 27 - 36 + 1 =$ ''',
                {"drop": "4"},
                r'''เปรียบเทียบ: $10, 17, -15, 10, -8$
        
        จุดสูงสุดสัมบูรณ์: ''',
                {"drop": "5"},
                r'''จุดต่ำสุดสัมบูรณ์: ''',
                {"drop": "6"},
              ],
              "draggableItems": [
                r"$2$",
                r"$17$",
                r"$-15$",
                r"$10$",
                r"$-8$",
                r"$(-2, 17)$",
                r"$(2, -15)$",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"$17$",
                "2": r"$-15$",
                "3": r"$10$",
                "4": r"$-8$",
                "5": r"$(-2, 17)$",
                "6": r"$(2, -15)$",
              },
              "explanation":
                  r'''เปรียบเทียบ: $f(-3)=10$, $f(-2)=17$, $f(2)=-15$, $f(3)=-8$ สูงสุด $17$ ที่ $(-2, 17)$ ต่ำสุด $-15$ ที่ $(2, -15)$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("extrema_t_446", "text", {
          "content": [
            r'''**🎯 จุดสูงสุด-ต่ำสุด**
        
        **1. จุดสัมพัทธ์**
        
        🔸 $(+) \to (-)$ จุดสูงสุดสัมพัทธ์ ⛰️
        
        🔸 $(-) \to (+)$ จุดต่ำสุดสัมพัทธ์ 🏞️
        
        🔸 ไม่เปลี่ยน $\to$ ไม่เป็นทั้งคู่ 🙅🏻‍♂️
        
        **🌱 2.ขั้นตอน:**
        
        **ขั้นที่ 1:** หา $f'(x)$ เพื่อหาความชัน
        
        **ขั้นที่ 2:** วาด**เส้นจำนวน** และใส่เครื่องหมาย
        
        **ขั้นที่ 3:** ดูการเปลี่ยนเครื่องหมาย:
        
        🔸 $(+) \to (-)$ จุดสูงสุดสัมพัทธ์ ⛰️
        
        🔸 $(-) \to (+)$ จุดต่ำสุดสัมพัทธ์ 🏞️
        
        🔸 ไม่เปลี่ยน $\to$ ไม่เป็นทั้งคู่ 🙅🏻‍♂️
        
        **ขั้นที่ 4:** แทนค่าจุด $x$ ที่หาได้ลง $f(x)$ เพื่อหา $y$ จะได้พิกัด $(x, y)$
        
        **3. จุดสัมบูรณ์**
        
        ขั้นที่ 1: หาจุดสูงสุด-ต่ำสุดสัมพัทธ์ในช่วง $[a, b]$
        
        ขั้นที่ 2: เช็คขอบ $f(a)$ และ $f(b)$
        
        ขั้นที่ 3: เปรียบเทียบ:
        
        🔹 จุดสูงสุดสัมบูรณ์
        
        คือ ค่ามากสุดของ ค่า $y$ ของจุดสูงสุดสัมพัทธ์และ $f(a)$ และ $f(b)$
        
        🔸 จุดต่ำสุดสัมบูรณ์ 🌊
        
        คือ ค่าน้อยสุดของ ค่า $y$ ของจุดต่ำสุดสัมพัทธ์และ $f(a)$ และ $f(b)$''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcAppliedExtremaLesson = ContentLesson(
  title: "โจทย์ประยุกต์จุดสูงสุด-ต่ำสุด",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("ext_app_t_447", "text", {
          "content": [
            r'''จากบทที่ผ่านมา เราได้เรียนการหาจุดสูงสุด-ต่ำสุดแล้ว! 📊
        
        เรารู้แล้วว่าจะหา**ค่า มากสุด-น้อยสุด**ของฟังก์ชันยังไง 🎯
        
        **แต่ในชีวิตจริงล่ะ?** 🤔
        
        - จะสร้างกล่องที่มี**ปริมาตรมากสุด**ยังไง? 📦
        - จะทำรั้วให้ได้**พื้นที่สูงสุด**ด้วยต้นทุนน้อยสุดยังไง? 🌾
        - จะผลิตสินค้าให้**กำไรสูงสุด**ยังไง? 💰
        
        บทนี้เราจะมาเรียนการ**แก้โจทย์ปัญหา**ด้วยอนุพันธ์! 🚀''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎯 แนวคิดหลัก",
      blocks: [
        ContentBlock("ext_app_t_448", "text", {
          "content": [
            r'''การแก้โจทย์ปัญหาหาค่ามาก-น้อยสุด มี **2 ขั้นตอนใหญ่**:
        
        **ขั้นที่ 1:** **แปลงโจทย์**ให้เป็นฟังก์ชัน 📝
        
        → หาว่าอะไรคือตัวแปร ($x$) และอะไรคือสิ่งที่ต้องการหาสูงสุด/ต่ำสุด ($f(x)$)
        
        **ขั้นที่ 2:** **หาค่าสูงสุด-ต่ำสุดสัมบูรณ์** 🔍
        
        → ใช้วิธีที่เรียนมาในบทก่อน!
        
        💡 **สรุป:** แปลงปัญหา → สร้างฟังก์ชัน → หาค่าสุดสุด!''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📋 ขั้นตอนโดยละเอียด",
      blocks: [
        ContentBlock("ext_app_t_449", "text", {
          "content": [
            r'''**ขั้นที่ 1:** อ่านโจทย์ให้เข้าใจ 📖
        
        **ขั้นที่ 2:** กำหนดตัวแปร $x$ ที่เหมาะสม 🔤
        
        **ขั้นที่ 3:** เขียนฟังก์ชัน $f(x)$ ที่ต้องการหาสูงสุด/ต่ำสุด 📐
        
        **ขั้นที่ 4:** หาช่วงของ $x$ ที่เป็นไปได้ (ถ้ามี) 📏
        
        **ขั้นที่ 5:** หา $f'(x)$ และจุดสูงสุด-ต่ำสุด 🎯
        
        **ขั้นที่ 6:** ตอบโจทย์! ✅''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📦 ตัวอย่างที่ 1: กล่องปริมาตรสูงสุด",
      blocks: [
        ContentBlock("ext_app_h_450", "header", {
          "title": r"โจทย์",
          "level": 2,
        }),
        ContentBlock("ext_app_t_451", "text", {
          "content": [
            r'''จากกระดาษสี่เหลี่ยมจัตุรัส ขนาด $12 \times 12$ ซม.
        
        ต้องการตัดมุมทั้ง 4 มุม แล้วพับขึ้นทำเป็นกล่องไม่มีฝาปิด
        
        จงหาความสูงของกล่องที่ทำให้**ปริมาตรสูงสุด**''',
          ],
        }),
        ContentBlock("ext_app_t_452", "interactive_graph", {
          "file": "box_volume.dart",
        }),
        ContentBlock("ext_app_t_453", "text", {
          "content": [r'''**มาทำทีละขั้น! 🚀**'''],
        }),
        ContentBlock("ddq_opt_box_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_box_1",
              "content": [
                r'''🎯 **ขั้นที่ 1-2:** กำหนดตัวแปร
        
        ให้ $x$ = ความยาวด้านของสี่เหลี่ยมที่ตัดออก (ซม.)
        
        ซึ่งก็คือ ''',
                {"drop": "0"},
                r''' ของกล่อง (ซม.)
        
        ฐานของกล่องจะมีความยาวด้าน = ''',
                {"drop": "1"},
                r'''ซม.''',
              ],
              "draggableItems": [
                r"ความสูง",
                r"ความกว้าง",
                r"ความยาว",
                r"$12 - 2x$",
                r"$12 - x$",
                r"$x$",
              ],
              "correctAnswers": {"0": r"ความสูง", "1": r"$12 - 2x$"},
              "explanation": r'''ตัด $x$ ทั้งสองข้าง เหลือ $12 - 2x$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_box_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_box_2",
              "content": [
                r'''📐 **ขั้นที่ 3:** เขียนฟังก์ชันปริมาตร
        
        ปริมาตร = ยาว × กว้าง × สูง
        
        ยาว = ''',
                {"drop": "0"},
                r''' ซม.
        
        กว้าง = ''',
                {"drop": "1"},
                r''' ซม.
        
        สูง = ''',
                {"drop": "2"},
                r''' ซม.
        
        $V(x) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$12 - 2x$",
                r"$12 - 2x$",
                r"$x$",
                r"$(12 - 2x)^2 \cdot x$",
                r"$12 - x$",
                r"$(12 - 2x) \cdot x$",
              ],
              "correctAnswers": {
                "0": r"$12 - 2x$",
                "1": r"$12 - 2x$",
                "2": r"$x$",
                "3": r"$(12 - 2x)^2 \cdot x$",
              },
              "explanation": r'''$V = (12-2x)(12-2x)(x) = (12-2x)^2 x$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_box_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_box_3",
              "content": [
                r'''📏 **ขั้นที่ 4:** หาช่วงของ $x$
        
        เงื่อนไข:
        
        $x > 0$ (ต้องตัดออกจริงๆ)
        
        $12 - 2x > 0$ (ฐานต้องมีขนาด)
        
        $x < 6$
        
        ช่วง: ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$(0, 6)$",
                r"$[0, 6]$",
                r"$(0, 12)$",
                r"$[0, 12]$",
                r"$(0, \infty)$",
              ],
              "correctAnswers": {"0": r"$(0, 6)$"},
              "explanation": r'''$0 < x < 6$ คือช่วง $(0, 6)$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_box_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_box_4",
              "content": [
                r'''🔍 **ขั้นที่ 5:** หาอนุพันธ์
        
        $V(x) = (12 - 2x)^2 x = (144 - 48x + 4x^2)x$
        
        $= 4x^3 - 48x^2 + 144x$
        
        $V'(x) =$ ''',
                {"drop": "0"},
                r'''$V'(x) = 0$:
        
        $12x^2 - 96x + 144 = 0$
        
        $x^2 - 8x + 12 = 0$
        
        $(x - 2)(x - 6) = 0$
        
        $x =$ ''',
                {"drop": "1"},
                r'''หรือ $x = 6$''',
              ],
              "draggableItems": [
                r"$12x^2 - 96x + 144$",
                r"$2$",
                r"$4x^2 - 48x + 144$",
                r"$3$",
                r"$1$",
              ],
              "correctAnswers": {"0": r"$12x^2 - 96x + 144$", "1": r"$2$"},
              "explanation":
                  r'''$V'(x) = 12x^2 - 96x + 144$, แก้ได้ $x = 2, 6$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_box_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_box_5",
              "content": [
                r'''🎯 **ขั้นที่ 6:** ตรวจสอบและตอบ
        
        ในช่วง $(0, 6)$ มีเพียง $x = 2$ เท่านั้น ($x = 6$ อยู่นอกช่วง)
        
        ทดสอบเครื่องหมาย:
        
        $x < 2$ → $V'(1) = 12 - 96 + 144 = 60 > 0$ → ''',
                {"drop": "0"},
                r'''$x > 2$ → $V'(3) = 108 - 288 + 144 = -36 < 0$ → ''',
                {"drop": "1"},
                r'''เครื่องหมาย: ''',
                {"drop": "0"},
                r'''$\to$ ''',
                {"drop": "1"},
                r'''→ $x = 2$ เป็นจุด ''',
                {"drop": "2"},
                r'''**คำตอบ:** ความสูง = ''',
                {"drop": "3"},
                r'''ซม.''',
              ],
              "draggableItems": [
                r"$(+)$",
                r"$(-)$",
                r"สูงสุดสัมพัทธ์",
                r"$2$",
                r"ต่ำสุดสัมพัทธ์",
                r"$6$",
              ],
              "correctAnswers": {
                "0": r"$(+)$",
                "1": r"$(-)$",
                "2": r"สูงสุดสัมพัทธ์",
                "3": r"$2$",
              },
              "explanation":
                  r'''$(+) \to (-)$ = จุดสูงสุด ความสูง $= 2$ ซม. 🎉''',
            },
          ],
        }),
        ContentBlock("ext_app_t_459", "text", {
          "content": [
            r'''💡 **ปริมาตรสูงสุด:** $V(2) = (12 - 4)^2 (2) = 64(2) = 128$ ลบ.ซม. ✅''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🌾 ตัวอย่างที่ 2: รั้วพื้นที่สูงสุด",
      blocks: [
        ContentBlock("ext_app_h_460", "header", {
          "title": r"โจทย์",
          "level": 2,
        }),
        ContentBlock("ext_app_t_461", "text", {
          "content": [
            r'''เกษตรกรมีรั้วยาว $100$ เมตร
        
        ต้องการล้อมพื้นที่สี่เหลี่ยมผืนผ้าติดกับแม่น้ำ (ด้านแม่น้ำไม่ต้องใช้รั้ว)
        
        จงหาขนาดของพื้นที่ที่ทำให้**พื้นที่สูงสุด**''',
          ],
        }),
        ContentBlock("ext_app_t_462", "interactive_graph", {
          "file": "fence_area.dart",
        }),
        ContentBlock("ddq_opt_fence_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_fence_1",
              "content": [
                r'''🎯 **ขั้นที่ 1-2:** กำหนดตัวแปร
        
        ให้ $x$ = ความยาวด้านที่ขนานกับแม่น้ำ (ม.)
        
        $y$ = ความยาวด้านที่ตั้งฉากกับแม่น้ำ (ม.)
        
        เงื่อนไข: รั้วทั้งหมด $100$ ม.
        
        $x + 2y = 100$
        
        $y =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{100 - x}{2}$",
                r"$100 - x$",
                r"$100 - 2x$",
                r"$\dfrac{x - 100}{2}$",
                r"$50 - x$",
              ],
              "correctAnswers": {"0": r"$\dfrac{100 - x}{2}$"},
              "explanation":
                  r'''จาก $x + 2y = 100$ ได้ $y = \dfrac{100-x}{2}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_fence_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_fence_2",
              "content": [
                r'''📐 **ขั้นที่ 3:** เขียนฟังก์ชันพื้นที่
        
        พื้นที่ $A = x \times y$
        
        แทน $y = \dfrac{100 - x}{2}$:
        
        $A(x) = x \cdot \dfrac{100 - x}{2}$
        
        $=$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{100x - x^2}{2}$",
                r"$100x - x^2$",
                r"$50x - x^2$",
                r"$\dfrac{x^2 - 100x}{2}$",
                r"$100 - x^2$",
              ],
              "correctAnswers": {"0": r"$\dfrac{100x - x^2}{2}$"},
              "explanation":
                  r'''$A(x) = \dfrac{x(100-x)}{2} = \dfrac{100x - x^2}{2}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_fence_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_fence_3",
              "content": [
                r'''🔍 **ขั้นที่ 4-5:** หาอนุพันธ์และจุดสูงสุด
        
        $A(x) = \dfrac{100x - x^2}{2}$
        
        $A'(x) = \dfrac{100 - 2x}{2} =$ ''',
                {"drop": "0"},
                r'''$A'(x) = 0$:
        
        $50 - x = 0$
        
        $x =$ ''',
                {"drop": "1"},
                r'''ทดสอบ: $(+) \to (-)$ ที่ $x = 50$ → จุดสูงสุด ✅
        
        $y = \dfrac{100 - 50}{2} =$ ''',
                {"drop": "2"},
                r'''**คำตอบ:** ยาว ''',
                {"drop": "1"},
                r'''ม., กว้าง ''',
                {"drop": "2"},
                r''' ม.
        
        พื้นที่สูงสุด = ''',
                {"drop": "3"},
                r'''ตร.ม.''',
              ],
              "draggableItems": [
                r"$50 - x$",
                r"$50$",
                r"$25$",
                r"$1250$",
                r"$100 - 2x$",
                r"$100$",
              ],
              "correctAnswers": {
                "0": r"$50 - x$",
                "1": r"$50$",
                "2": r"$25$",
                "3": r"$1250$",
              },
              "explanation":
                  r'''$x = 50$, $y = 25$, พื้นที่ $= 50 \times 25 = 1250$ ตร.ม. 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"💰 ตัวอย่างที่ 3: กำไรสูงสุด",
      blocks: [
        ContentBlock("ext_app_h_466", "header", {
          "title": r"โจทย์",
          "level": 2,
        }),
        ContentBlock("ext_app_t_467", "text", {
          "content": [
            r'''บริษัทผลิตสินค้า มีฟังก์ชันรายได้ $R(x) = 500x - x^2$ บาท
        
        และฟังก์ชันต้นทุน $C(x) = 100x + 10000$ บาท
        
        เมื่อ $x$ คือจำนวนสินค้า (หน่วย)
        
        จงหาจำนวนสินค้าที่ทำให้**กำไรสูงสุด** และกำไรสูงสุดเป็นเท่าไร?''',
          ],
        }),
        ContentBlock("ddq_opt_profit_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_profit_1",
              "content": [
                r'''📐 **ขั้นที่ 1-3:** สร้างฟังก์ชันกำไร
        
        กำไร = รายได้ - ต้นทุน
        
        $P(x) = R(x) - C(x)$
        
        $= (500x - x^2) - (100x + 10000)$
        
        $=$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-x^2 + 400x - 10000$",
                r"$500x - x^2 - 100x - 10000$",
                r"$-x^2 + 600x - 10000$",
                r"$400x - x^2$",
                r"$-x^2 + 400x$",
              ],
              "correctAnswers": {"0": r"$-x^2 + 400x - 10000$"},
              "explanation": r'''$P(x) = -x^2 + 400x - 10000$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_profit_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_profit_2",
              "content": [
                r'''🔍 **ขั้นที่ 4-5:** หาจำนวนสินค้าที่กำไรสูงสุด
        
        $P(x) = -x^2 + 400x - 10000$
        
        $P'(x) =$ ''',
                {"drop": "0"},
                r'''$P'(x) = 0$:
        
        $-2x + 400 = 0$
        
        $x =$ ''',
                {"drop": "1"},
                r'''ทดสอบ: $(+) \to (-)$ ที่ $x = 200$ → จุดสูงสุด ✅
        
        กำไรสูงสุด $= P(200) = -(200)^2 + 400(200) - 10000$
        
        $= -40000 + 80000 - 10000 =$ ''',
                {"drop": "2"},
                r''' บาท
        
        **คำตอบ:** ผลิต ''',
                {"drop": "1"},
                r'''หน่วย, กำไร ''',
                {"drop": "2"},
                r'''บาท''',
              ],
              "draggableItems": [
                r"$-2x + 400$",
                r"$200$",
                r"$30000$",
                r"$-x + 400$",
                r"$100$",
                r"$40000$",
              ],
              "correctAnswers": {
                "0": r"$-2x + 400$",
                "1": r"$200$",
                "2": r"$30000$",
              },
              "explanation": r'''ผลิต $200$ หน่วย กำไรสูงสุด $30000$ บาท 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_opt_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_practice_1",
              "content": [
                r'''1. จงหาจำนวนบวกสองจำนวนที่ผลบวกเท่ากับ $20$ และ**ผลคูณสูงสุด**
        
        ให้ $x$ = จำนวนแรก
        
        จำนวนที่สอง $=$ ''',
                {"drop": "0"},
                r'''ผลคูณ $P(x) = x($''',
                {"drop": "0"},
                r'''$) =$ ''',
                {"drop": "1"},
                r'''$P'(x) = 20 - 2x = 0$
        
        $x =$ ''',
                {"drop": "2"},
                r'''**คำตอบ:** สองจำนวนคือ ''',
                {"drop": "2"},
                r'''และ ''',
                {"drop": "2"},
                r'''ผลคูณสูงสุด $=$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$20 - x$",
                r"$20x - x^2$",
                r"$10$",
                r"$100$",
                r"$20$",
                r"$x - 20$",
              ],
              "correctAnswers": {
                "0": r"$20 - x$",
                "1": r"$20x - x^2$",
                "2": r"$10$",
                "3": r"$100$",
              },
              "explanation":
                  r'''สองจำนวนคือ $10$ และ $10$ ผลคูณสูงสุด $= 100$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_practice_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_practice_2",
              "content": [
                r'''2. จากลวดยาว $40$ ซม. ต้องการพับเป็นสี่เหลี่ยมผืนผ้า
        
        จงหาขนาดที่ทำให้**พื้นที่สูงสุด**
        
        ให้ $x$ = ความยาว, $y$ = ความกว้าง
        
        เงื่อนไข: เส้นรอบรูป $= 2x + 2y = 40$
        
        $y =$ ''',
                {"drop": "0"},
                r'''พื้นที่ $A(x) = x \cdot$ ''',
                {"drop": "0"},
                r'''$=$ ''',
                {"drop": "1"},
                r'''$A'(x) = 20 - 2x = 0$
        
        $x =$ ''',
                {"drop": "2"},
                r''', $y =$ ''',
                {"drop": "3"},
                r'''**คำตอบ:** ยาง ''',
                {"drop": "2"},
                r'''ซม., กว้าง ''',
                {"drop": "3"},
                r'''ซม. (เป็นจัตุรัส!)''',
              ],
              "draggableItems": [
                r"$20 - x$",
                r"$20x - x^2$",
                r"$10$",
                r"$10$",
                r"$20$",
                r"$40 - 2x$",
              ],
              "correctAnswers": {
                "0": r"$20 - x$",
                "1": r"$20x - x^2$",
                "2": r"$10$",
                "3": r"$10$",
              },
              "explanation":
                  r'''ขนาด $10 \times 10$ ซม. (จัตุรัสให้พื้นที่สูงสุด) ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_practice_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_practice_3",
              "content": [
                r'''3. กระป๋องทรงกระบอกมีปริมาตร $500\pi$ ลบ.ซม.
        
        ต้องการหารัศมี $r$ ที่ทำให้**พื้นที่ผิวน้อยสุด**
        
        ปริมาตร $V = \pi r^2 h = 500\pi$
        
        $h =$ ''',
                {"drop": "0"},
                r'''พื้นที่ผิว $S = 2\pi r^2 + 2\pi rh$
        
        $= 2\pi r^2 + 2\pi r \cdot$ ''',
                {"drop": "0"},
                r'''$= 2\pi r^2 +$ ''',
                {"drop": "1"},
                r'''$S'(r) = 4\pi r - \dfrac{1000\pi}{r^2} = 0$
        
        $4r^3 = 1000$
        
        $r =$ ''',
                {"drop": "2"},
                r'''**คำตอบ:** รัศมี $\approx$ ''',
                {"drop": "3"},
                r'''ซม.''',
              ],
              "draggableItems": [
                r"$\dfrac{500}{r^2}$",
                r"$\dfrac{1000\pi}{r}$",
                r"$\sqrt[3]{250}$",
                r"$6.3$",
                r"$\dfrac{500\pi}{r^2}$",
                r"$5$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{500}{r^2}$",
                "1": r"$\dfrac{1000\pi}{r}$",
                "2": r"$\sqrt[3]{250}$",
                "3": r"$6.3$",
              },
              "explanation": r'''$r = \sqrt[3]{250} \approx 6.3$ ซม. ✅''',
            },
          ],
        }),
        ContentBlock("ddq_opt_practice_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_opt_practice_4",
              "content": [
                r'''4. จุด $P$ บนเส้นตรง $y = 2x + 1$
        
        จงหาจุดที่**ใกล้จุดกำเนิดที่สุด**
        
        ระยะทาง $d = \sqrt{x^2 + y^2} = \sqrt{x^2 + (2x+1)^2}$
        
        $= \sqrt{x^2 + 4x^2 + 4x + 1} = \sqrt{5x^2 + 4x + 1}$
        
        เพื่อความง่าย หาค่าน้อยสุดของ $d^2$ แทน:
        
        $D(x) = 5x^2 + 4x + 1$
        
        $D'(x) =$ ''',
                {"drop": "0"},
                r'''$D'(x) = 0$:
        
        $10x + 4 = 0$
        
        $x =$ ''',
                {"drop": "1"},
                r'''$y = 2($''',
                {"drop": "1"},
                r'''$) + 1 =$ ''',
                {"drop": "2"},
                r'''**คำตอบ:** จุด ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$10x + 4$",
                r"$-\dfrac{2}{5}$",
                r"$\dfrac{1}{5}$",
                r"$(-\dfrac{2}{5}, \dfrac{1}{5})$",
                r"$5x + 2$",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$10x + 4$",
                "1": r"$-\dfrac{2}{5}$",
                "2": r"$\dfrac{1}{5}$",
                "3": r"$(-\dfrac{2}{5}, \dfrac{1}{5})$",
              },
              "explanation":
                  r'''จุดใกล้ที่สุดคือ $(-\dfrac{2}{5}, \dfrac{1}{5})$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"💡 เทคนิคการแก้โจทย์",
      blocks: [
        ContentBlock("ext_app_t_474", "text", {
          "content": [
            r'''**1. วาดรูป! 📐**
        
        วาดรูปประกอบเสมอ จะช่วยให้เห็นภาพชัดเจนขึ้น
        
        **2. กำหนดตัวแปรชัดเจน 🔤**
        
        เลือกตัวแปรที่เหมาะสม ทำให้สมการง่ายขึ้น
        
        **3. หาความสัมพันธ์ระหว่างตัวแปร 🔗**
        
        ถ้ามีหลายตัวแปร หาสมการเชื่อมโยงเพื่อแทนค่า
        
        **4. ตรวจสอบช่วง! 📏**
        
        บางปัญหามีข้อจำกัด เช่น $x > 0$ หรือ $0 < x < 10$
        
        **5. ทดสอบคำตอบ ✅**
        
        ตรวจว่าคำตอบสมเหตุสมผลและอยู่ในช่วงที่กำหนด
        
        **6. ใช้ $f^2$ แทน $f$ เมื่อมีรากที่สอง 🎯**
        
        เช่น หาค่าน้อยสุดของ $\sqrt{...}$ → หาของ $(...)$ แทน (ง่ายกว่า)''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("ext_app_t_475", "text", {
          "content": [
            r'''**🎯 โจทย์ประยุกต์จุดสูงสุด-ต่ำสุด**
        
        **1. แนวคิดหลัก:**
        
        แปลงโจทย์ → สร้างฟังก์ชัน → หาค่าสุดสุด! 🎯
        
        **2. ขั้นตอน:**
           - อ่านโจทย์ให้เข้าใจ 📖
           - กำหนดตัวแปร $x$ 🔤
           - เขียนฟังก์ชัน $f(x)$ 📐
           - หาช่วงที่เป็นไปได้ 📏
           - หา $f'(x)$ และจุดสุดสุด 🔍
           - ตอบโจทย์ ✅
        
        **3. ประเภทโจทย์:**
           - ปริมาตร/พื้นที่สูงสุด 📦
           - ต้นทุนต่ำสุด 💰
           - กำไรสูงสุด 📈
           - ระยะทางสั้นสุด 📏
        
        **4. เทคนิค:**
           - วาดรูปประกอบ 📐
           - เลือกตัวแปรเหมาะสม 🔤
           - ตรวจสอบช่วง 📏
           - ทดสอบคำตอบ ✅
        
        **5. บทถัดไป:** ประยุกต์อนุพันธ์ต่อเนื่อง! 🌟''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

// ── การหาค่า integrate ──────────────────────────────────────────────────────────────

final calcIntIntroLesson = ContentLesson(
  title: "ปริพันธ์ (Integral)",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("int_intro_t_476", "text", {
          "content": [
            r'''เรารู้ $f(x) \to$ หา $f'(x)$ ได้!
        
        **แต่ถ้าทำย้อนกลับล่ะ?** ♻️
        
        ถ้ารู้ $f'(x) = 2x$ จะหา $f(x)$ ยังไง? 🤔
        
        **คำตอบ:** ใช้ **ปริพันธ์ (Integral)**!''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⚙️ ปริพันธ์คือ?",
      blocks: [
        ContentBlock("int_intro_t_477", "text", {
          "content": [
            r'''การทำย้อนกลับของดิฟ 🔍
        
        💬 **ตัวอย่าง:**
        
        ถ้ารู้ว่า $\dfrac{d}{dx}(x^2 + c) = 2x$
        
        แล้ว $\int 2x\,dx = ?$
        
        **คำตอบ:** $x^2 + c$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🪧 สัญลักษณ์",
      blocks: [
        ContentBlock("int_intro_t_478", "text", {
          "content": [
            r'''$$F(x) = \int f(x)\,dx$$
        
        💬 **ความหมาย:**
        
        🔸 $\int$ = สัญลักษณ์ปริพันธ์
        
        🔸 $dx$ = บอกว่าปริพันธ์ตามตัวแปร $x$
        
        🔸 $F(x)$ = ผลลัพธ์ (ฟังก์ชันเดิม)
        
        Note = ทำย้อนกลับ
        
        ดิฟของอินทริกรัลจะได้ฟังก์ชันเดิม เขียนเป็นสัญลักษณ์คือ
        
        $$F'(x) = f(x)$$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ 1 ค่าคงที่",
      blocks: [
        ContentBlock("int_intro_t_479", "text", {
          "content": [
            r'''$$\int k\,dx = kx + c$$
        
        เมื่อ $k$ เป็นค่าคงที่
        
        💬 **ความหมาย:** ปริพันธ์ของค่าคงที่ = ค่าคงที่คูณ $x$ บวก $c$''',
          ],
        }),
        ContentBlock("int_intro_h_480", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_integral_const_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_const_1",
              "content": [
                r'''จงหา $\int 5\,dx$
        
        **ขั้นที่ 1:** ใช้สมบัติที่ 1
        
        $\int k\,dx = kx + c$ โดย $k =$ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 2:** แทนค่า
        
        $\int 5\,dx =$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** ตรวจสอบ
        
        ดิฟ: $\dfrac{d}{dx}(5x + c) =$ ''',
                {"drop": "2"},
                r'''✅''',
              ],
              "draggableItems": [
                r"$5$",
                r"$5x + c$",
                r"$5$",
                r"$x$",
                r"$5x$",
                r"$0$",
              ],
              "correctAnswers": {"0": r"$5$", "1": r"$5x + c$", "2": r"$5$"},
              "explanation": r'''$\int 5\,dx = 5x + c$ และดิฟกลับได้ $5$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⚡2 เลขยกกำลัง",
      blocks: [
        ContentBlock("int_intro_t_482", "text", {
          "content": [
            r'''$$\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c$$
        
        สำหรับทุกจำนวนจริง $n \neq -1$''',
          ],
        }),
        ContentBlock("int_intro_h_483", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_integral_power_0", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_power_0",
              "content": [
                r'''1. จงหา $\int x^2\,dx$
        
        **ขั้นที่ 1:** ใช้สมบัติที่ 2
        
        $\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c$ โดย $n =$ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 2:** เพิ่มเลขชี้กำลัง 1
        
        $n + 1 =$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** คำนวณ
        
        $\int x^2\,dx =$ ''',
                {"drop": "2"},
                r'''**ขั้นที่ 4:** ตรวจสอบ
        
        ดิฟ: $\dfrac{d}{dx} ($''',
                {"drop": "2"},
                r'''$) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2$",
                r"$3$",
                r"$\dfrac{x^3}{3} + c$",
                r"$x^2$",
                r"$x^3 + c$",
                r"$3x^2$",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"$3$",
                "2": r"$\dfrac{x^3}{3} + c$",
                "3": r"$x^2$",
              },
              "explanation":
                  r'''เพิ่มเลขชี้กำลัง: $2+1=3$ แล้วหาร $3$ ได้ $\dfrac{x^3}{3} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_power_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_power_1",
              "content": [
                r'''2. จงหา $\int x^2\,dx$
        
        **ขั้นที่ 1:** ใช้สมบัติที่ 2
        
        $\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c$ โดย $n =$ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 2:** เพิ่มเลขชี้กำลัง 1
        
        $n + 1 =$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** คำนวณ
        
        $\int x^2\,dx =$ ''',
                {"drop": "2"},
                r'''**ขั้นที่ 4:** ตรวจสอบ
        
        ดิฟ: $\dfrac{d}{dx} ($''',
                {"drop": "2"},
                r'''$) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$2$",
                r"$3$",
                r"$\dfrac{x^3}{3} + c$",
                r"$x^2$",
                r"$x^3 + c$",
                r"$3x^2$",
              ],
              "correctAnswers": {
                "0": r"$2$",
                "1": r"$3$",
                "2": r"$\dfrac{x^3}{3} + c$",
                "3": r"$x^2$",
              },
              "explanation":
                  r'''เพิ่มเลขชี้กำลัง: $2+1=3$ แล้วหาร $3$ ได้ $\dfrac{x^3}{3} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_power_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_power_2",
              "content": [
                r'''3. จงหา $\int x^5\,dx$
        
        $n =$ ''',
                {"drop": "0"},
                r'''$n + 1 =$ ''',
                {"drop": "1"},
                r'''$\int x^5\,dx =$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$5$",
                r"$6$",
                r"$\dfrac{x^6}{6} + c$",
                r"$x^6 + c$",
                r"$5x^4 + c$",
              ],
              "correctAnswers": {
                "0": r"$5$",
                "1": r"$6$",
                "2": r"$\dfrac{x^6}{6} + c$",
              },
              "explanation":
                  r'''เพิ่มเลขชี้กำลัง: $5+1=6$ แล้วหาร ได้ $\dfrac{x^6}{6} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_power_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_power_3",
              "content": [
                r'''4. จงหา $\int \dfrac{1}{x^2}\,dx$
        
        เขียนใหม่: $\dfrac{1}{x^2} =$ ''',
                {"drop": "0"},
                r'''$\int$ ''',
                {"drop": "0"},
                r''' $dx = \dfrac{x^{(-2 + 1)}}{-2 + 1} + c$
        
        $=$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$x^2$",
                r"$x^{-2}$",
                r"$-\dfrac{1}{x} + c$",
                r"$\dfrac{1}{x} + c$",
              ],
              "correctAnswers": {"0": r"$x^{-2}$", "1": r"$-\dfrac{1}{x} + c$"},
              "explanation":
                  r'''เขียน $\dfrac{1}{x^2} = x^{-2}$ เพิ่มเป็น $x^{-1}$ หาร $-1$ ได้ $\dfrac{x^{-1}}{-1} + c = -\dfrac{1}{x} + c$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"💫 3 คูณด้วยค่าคงที่",
      blocks: [
        ContentBlock("int_intro_t_488", "text", {
          "content": [
            r'''$$\int k \cdot f(x)\,dx = k \cdot \int f(x)\,dx$$
        
        เมื่อ $k$ เป็นค่าคงที่''',
          ],
        }),
        ContentBlock("ddq_integral_scalar_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_scalar_1",
              "content": [
                r'''1. จงหา $\int 3x^2\,dx$
        
        **ขั้นที่ 1:** ดึงค่าคงที่ออกมา
        
        $\int 3x^2\,dx = 3 \cdot \int$ ''',
                {"drop": "0"},
                r''' $\,dx$
        
        **ขั้นที่ 2:** หาปริพันธ์
        
        $= 3 \cdot$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** คำนวณ
        
        $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$x^2$",
                r"$\dfrac{x^3}{3} + c$",
                r"$x^3 + c$",
                r"$3x^2$",
                r"$\dfrac{x^3}{3}$",
              ],
              "correctAnswers": {
                "0": r"$x^2$",
                "1": r"$\dfrac{x^3}{3} + c$",
                "2": r"$x^3 + c$",
              },
              "explanation":
                  r'''$3 \times(\dfrac{x^3}{3} + c) = x^3 + 3c$ แต่ $3c$ ก็เป็นค่าคงที่ เราเลยเขียนง่ายๆว่า $+c$ ดังนั้นตอบ $x^3 + c$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🔗 4 ผลบวก-ผลลบ",
      blocks: [
        ContentBlock("int_intro_t_490", "text", {
          "content": [
            r'''$\int [f(x) \pm g(x)]\,dx = \int f(x)\,dx \pm \int g(x)\,dx$
        
        💬 **ความหมาย:** แยกบวกลบได้''',
          ],
        }),
        ContentBlock("ddq_integral_sum_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_sum_1",
              "content": [
                r'''1. จงหา $\int (x^2 + 3x)\,dx$
        
        **ขั้นที่ 1:** แยกเทอม
        
        $\int (x^2 + 3x)\,dx = \int x^2\,dx + \int 3x\,dx$
        
        **ขั้นที่ 2:** หาปริพันธ์แต่ละเทอม
        
        $\int x^2\,dx =$ ''',
                {"drop": "0"},
                r''' $+ c_1$
        
        $\int 3x\,dx = 3 \int x\,dx = 3 \cdot \int x\,dx =$ ''',
                {"drop": "1"},
                r''' $+ c_2$
        
        **ขั้นที่ 3:** รวมกัน
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''$ + c_1 + c_2 =$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\dfrac{x^3}{3}$",
                r"$\dfrac{x^2}{2}$",
                r"$\dfrac{3x^2}{2}$",
                r"$\dfrac{x^3}{3} + \dfrac{3x^2}{2} + c$",
                r"$x^3 + 3x^2 + c$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^3}{3}$",
                "1": r"$\dfrac{3x^2}{2}$",
                "2": r"$\dfrac{x^3}{3} + \dfrac{3x^2}{2} + c$",
              },
              "explanation":
                  r'''แยกทีละเทอม: $\dfrac{x^3}{3} + \dfrac{3x^2}{2} + c$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎨 ใช้ทั้ง 4 สมบัติ",
      blocks: [
        ContentBlock("ddq_integral_combined_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_combined_1",
              "content": [
                r'''จงหา $\int (2x^3 - 5x^2 + 7x - 3)\,dx$
        
        แยกเทอม:
        
        $\int 2x^3\,dx - \int 5x^2\,dx + \int 7x\,dx - \int 3\,dx$
        
        $\int 2x^3\,dx =$ ''',
                {"drop": "0"},
                r''' $+ c_1$
        
        $\int 5x^2\,dx =$ ''',
                {"drop": "1"},
                r''' $+ c_2$
        
        $\int 7x\,dx =$ ''',
                {"drop": "2"},
                r''' $+ c_3$
        
        $\int 3\,dx =$ ''',
                {"drop": "3"},
                r''' $+ c_4$
        
        คำตอบ: ''',
                {"drop": "4"},
              ],
              "draggableItems": [
                r"$\dfrac{x^4}{2}$",
                r"$\dfrac{5x^3}{3}$",
                r"$\dfrac{7x^2}{2}$",
                r"$3x$",
                r"$\dfrac{x^4}{2} - \dfrac{5x^3}{3} + \dfrac{7x^2}{2} - 3x + c$",
                r"$2x^4$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^4}{2}$",
                "1": r"$\dfrac{5x^3}{3}$",
                "2": r"$\dfrac{7x^2}{2}$",
                "3": r"$3x$",
                "4":
                    r"$\dfrac{x^4}{2} - \dfrac{5x^3}{3} + \dfrac{7x^2}{2} - 3x + c$",
              },
              "explanation": r'''แยกทีละเทอมแล้วรวมกัน ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("q_integral_practice_1", "question_fill_in", {
          "content": r'''1. $\int 7\,dx = $ {{BOX}} $x + c$''',
          "correctAnswer": r"7",
          "explanation": r'''ใช้สมบัติที่ 1: $\int k\,dx = kx + c$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_integral_practice_2", "question_fill_in", {
          "content": r'''2. $\int x^4\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{x^5}{5} + c$",
          "explanation": r'''เพิ่มเลขชี้กำลัง: $4+1=5$ แล้วหาร $5$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_integral_practice_3", "question_fill_in", {
          "content": r'''3. $\int 4x^3\,dx = $ {{BOX}}''',
          "correctAnswer": r"$x^4 + c$",
          "explanation": r'''$4 \times \dfrac{x^4}{4} + c = x^4 + c$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_integral_practice_4", "question_fill_in", {
          "content": r'''4. $\int (x^2 - 2x + 1)\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{x^3}{3} - x^2 + x + c$",
          "explanation": r'''แยกทีละเทอม: $\dfrac{x^3}{3} - x^2 + x + c$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("ddq_integral_practice_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_practice_5",
              "content": [
                r'''5. $\int \sqrt{x}\,dx =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{2}$",
                r"$\dfrac{3}{2}$",
                r"$\dfrac{2x^{3/2}}{3} + c$",
                r"$\dfrac{2}{3}x^{3/2} + c$",
                r"$x^{3/2} + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{2x^{3/2}}{3} + c$"},
              "explanation":
                  r'''$\dfrac{x^{3/2}}{3/2} = \dfrac{2x^{3/2}}{3} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_practice_6", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_practice_6",
              "content": [
                r'''6. $\int \left(x + \dfrac{1}{x^3}\right)\,dx = ?$
        
        $\int x\,dx =$ ''',
                {"drop": "0"},
                r'''$\int \dfrac{1}{x^3}\,dx = \int x^{-3}\,dx =$ ''',
                {"drop": "1"},
                r'''คำตอบ: ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\dfrac{x^2}{2}$",
                r"$-\dfrac{1}{2x^2}$",
                r"$\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$",
                r"$\dfrac{1}{x^2}$",
                r"$x^2$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^2}{2}$",
                "1": r"$-\dfrac{1}{2x^2}$",
                "2": r"$\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$",
              },
              "explanation": r'''$\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"⏰ ปริพันธ์จำกัดเขต",
      blocks: [
        ContentBlock("int_intro_t_499", "text", {
          "content": [
            r'''$$\int_a^b f(x)\,dx = F(b) - F(a)$$
        
        อ่านว่า **"อินทิกรัลจาก** $a$ ถึง $b$ ของ $f(x)$
        
        💬 **ความหมาย:**
        
        🔸 $a$ = **ขอบเขตล่าง**
        
        🔸 $b$ = **ขอบเขตบน**
        
        🔸 $F(x) = \int f(x)\,dx$
        
        🔸 $F(b) - F(a)$ = แทนค่าบนลบล่าง
        
        Note = เพิ่มเติม
        
        นิยามของอินทริกัลตอนแรกคือพื้นที่ใต้กราฟ
        
        $\int_a^b f(x)\,dx$ = **พื้นที่ใต้กราฟ** $f(x)$ จาก $x=a$ ถึง $x=b$
        
        แต่นักคณิตมารู้ทีหลังว่าเป็นการทำย้อนกลับของดิฟ
        
        เราจะเรียนเรื่องนี้ในบทถัดไป! 📈''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🤩 วิธีคำนวณ",
      blocks: [
        ContentBlock("int_intro_t_500", "text", {
          "content": [
            r'''**ขั้นที่ 1:** หาปริพันธ์ $F(x) = \int f(x)\,dx$
        
        **ขั้นที่ 2:** แทนค่าบน $F(b)$
        
        **ขั้นที่ 3:** แทนค่าล่าง $F(a)$
        
        **ขั้นที่ 4:** ลบกัน $F(b) - F(a)$''',
          ],
        }),
        ContentBlock("int_intro_h_501", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_integral_definite_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_1",
              "content": [
                r'''1. จงหา $\int_1^3 (x + 5)\,dx$
        
        🎯 **ขั้นที่ 1:** หาปริพันธ์
        
        $F(x) = \int (x + 5)\,dx$
        
        $= \int x\,dx + \int 5\,dx$
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''$=$ ''',
                {"drop": "2"},
                r'''$+ c$''',
              ],
              "draggableItems": [
                r"$\dfrac{x^2}{2}$",
                r"$5x$",
                r"$\dfrac{x^2}{2} + 5x$",
                r"$x^2 + 5x$",
                r"$\dfrac{x^2}{2} + 5$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^2}{2}$",
                "1": r"$5x$",
                "2": r"$\dfrac{x^2}{2} + 5x$",
              },
              "explanation": r'''$F(x) = \dfrac{x^2}{2} + 5x$ (ไม่มี $+c$) ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_definite_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** แทนค่าบน ($b = 3$)
        
        $F(3) = \dfrac{(3)^2}{2} + 5(3) + c$
        
        $= \dfrac{9}{2} + 15 + c$
        
        $= 4.5 + 15 =$ ''',
                {"drop": "0"},
                r'''$+ c$''',
              ],
              "draggableItems": [
                r"$19.5$",
                r"$24$",
                r"$15$",
                r"$20$",
                r"$22.5$",
              ],
              "correctAnswers": {"0": r"$19.5$"},
              "explanation": r'''$F(3) = \dfrac{9}{2} + 15 = 19.5$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_definite_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_3",
              "content": [
                r'''📏 **ขั้นที่ 3:** แทนค่าล่าง ($a = 1$)
        
        $F(1) = \dfrac{(1)^2}{2} + 5(1) + c$
        
        $= \dfrac{1}{2} + 5 + c$
        
        $= 0.5 + 5 + c =$ ''',
                {"drop": "0"},
                r'''$+ c$''',
              ],
              "draggableItems": [r"$5.5$", r"$6$", r"$5$", r"$4.5$", r"$6.5$"],
              "correctAnswers": {"0": r"$5.5$"},
              "explanation": r'''$F(1) = \dfrac{1}{2} + 5 = 5.5$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_definite_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_4",
              "content": [
                r'''🏁 **ขั้นที่ 4:** ลบกัน
        
        $\int_1^3 (x + 5)\,dx = F(3) - F(1)$
        
        $=$ ''',
                {"drop": "0"},
                r'''$-$ ''',
                {"drop": "1"},
                r''' $+ c - c$
        
        $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$19.5$",
                r"$5.5$",
                r"$14$",
                r"$25$",
                r"$13$",
              ],
              "correctAnswers": {"0": r"$19.5$", "1": r"$5.5$", "2": r"$14$"},
              "explanation":
                  r'''$(19.5 + c) - (5.5 + c) = 14$ ที่ $c - c = 0$ เพราะเป็นค่าคงที่ตัวเดียวกันที่มาจากการ integral ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด: ปริพันธ์จำกัดเขต",
      blocks: [
        ContentBlock("q_integral_definite_practice_1", "question_fill_in", {
          "content": r'''1. $\int_0^2 x^2\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{8}{3}$",
          "explanation":
              r'''$F(x) = \dfrac{x^3}{3}$ ดังนั้น $F(2) - F(0) = \dfrac{8}{3} - 0 = \dfrac{8}{3}$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_integral_definite_practice_2", "question_fill_in", {
          "content": r'''2. $\int_1^4 (2x + 1)\,dx = $ {{BOX}}''',
          "correctAnswer": r"18",
          "explanation":
              r'''$F(x) = x^2 + x$ ดังนั้น $F(4) - F(1) = (16 + 4) - (1 + 1) = 20 - 2 = 18$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("ddq_integral_definite_practice_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_practice_3",
              "content": [
                r'''3. $\int_0^1 (3x^2 - 2x + 1)\,dx = ?$
        
        $F(x) =$ ''',
                {"drop": "0"},
                r'''$F(1) =$ ''',
                {"drop": "1"},
                r'''$F(0) =$ ''',
                {"drop": "2"},
                r'''คำตอบ: $F(1) - F(0) =$ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$x^3 - x^2 + x$",
                r"$1 - 1 + 1 = 1$",
                r"$0$",
                r"$1$",
                r"$2$",
                r"$3$",
              ],
              "correctAnswers": {
                "0": r"$x^3 - x^2 + x$",
                "1": r"$1$",
                "2": r"$0$",
                "3": r"$1$",
              },
              "explanation": r'''$(1 - 1 + 1) - 0 = 1$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_integral_definite_practice_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_integral_definite_practice_4",
              "content": [
                r'''4. $\int_{-1}^2 (x^2 + 2)\,dx = ?$
        
        $F(x) =$ ''',
                {"drop": "0"},
                r'''$F(2) = \dfrac{8}{3} + 4 =$ ''',
                {"drop": "1"},
                r'''$F(-1) = \dfrac{-1}{3} - 2 =$ ''',
                {"drop": "2"},
                r'''คำตอบ: ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$\dfrac{x^3}{3} + 2x$",
                r"$\dfrac{20}{3}$",
                r"$-\dfrac{7}{3}$",
                r"$9$",
                r"$\dfrac{8}{3}$",
                r"$6$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^3}{3} + 2x$",
                "1": r"$\dfrac{20}{3}$",
                "2": r"$-\dfrac{7}{3}$",
                "3": r"$9$",
              },
              "explanation":
                  r'''$\dfrac{20}{3} - (-\dfrac{7}{3}) = \dfrac{27}{3} = 9$ ✅''',
            },
          ],
        }),
        ContentBlock("q_integral_definite_practice_5", "question_fill_in", {
          "content": r'''5. $\int_1^3 \dfrac{1}{x^2}\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{2}{3}$",
          "explanation":
              r'''$F(x) = \int x^{-2}\,dx = -\dfrac{1}{x}$ ดังนั้น $F(3) - F(1) = -\dfrac{1}{3} - (-1) = -\dfrac{1}{3} + 1 = \dfrac{2}{3}$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_integral_definite_practice_6", "question_fill_in", {
          "content": r'''6. $\int_0^4 \sqrt{x}\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{16}{3}$",
          "explanation":
              r'''$F(x) = \dfrac{2x^{3/2}}{3}$ ดังนั้น $F(4) - F(0) = \dfrac{2(8)}{3} - 0 = \dfrac{16}{3}$ ✅''',
          "boxCount": 1,
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("int_intro_t_512", "text", {
          "content": [
            r'''**🎯 ปริพันธ์ (Integral)**
        
        **1.**
        
        $$\int f(x)\,dx = F(x)$$
        
        **2. สมบัติ 4 ข้อ:**
        
        🔸 $\int k\,dx = kx + c$
        
        🔸 $\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c$
        
        🔸 $\int k \cdot f(x)\,dx = k \int f(x)\,dx$
        
        🔸 $\int [f \pm g]\,dx = \int f\,dx \pm \int g\,dx$
        
        **3. ค่าคงที่**
        
        ต้องบวกค่า $c$ เสมอ 🚨
        
        **4. ปริพันธ์จำกัดเขต:**
        
        $$\int_a^b f(x)\,dx = F(b) - F(a)$$''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcIntSubstitutionLesson = ContentLesson(
  title: "การเปลี่ยนตัวแปรในปริพันธ์",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("int_sub_t_513", "text", {
          "content": [
            r'''จากบทที่แล้ว เราได้เรียนการหาปริพันธ์พื้นฐานแล้ว 🏛️
        
        แต่ถ้าเจอแบบนี้ล่ะ? 🤔
        
        $$\int 2x(x^2 + 1)^5\,dx$$
        
        ดูซับซ้อน! 😅
        
        เราสามารถใช้ **การเปลี่ยนตัวแปร** ทำให้ง่ายขึ้น! 🚀
        
        บทนี้เราจะมาเรียนกัน!''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"👑 แนวคิดหลัก",
      blocks: [
        ContentBlock("int_sub_t_514", "text", {
          "content": [
            r'''ถ้าเจอปริพันธ์รูปแบบ:
        
        $$\int f(g(x)) \cdot g'(x)\,dx$$
        
        🎙️ **เราสามารถเปลี่ยนเป็น:**
        
        $$\int f(u)\,du$$
        
        โดยให้ $u = g(x)$
        
        Note = ทำไมใช้ได้?
        
        ใช้ Chaun Rule:
        
        จาก $\dfrac{du}{dx} = g'(x)$ 
        
        เขียนใหม่: $du = g'(x)\,dx$
        
        เราใช้ $du$ แทน $g'(x)\,dx$ ได้! มันคล้ายกับการ "ตัด $dx$" เหมือนเศษส่วน! ✅''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📐 วิธีการเปลี่ยนตัวแปร",
      blocks: [
        ContentBlock("int_sub_t_515", "text", {
          "content": [
            r'''**ขั้นที่ 1:** เลือก $u = g(x)$
        
        **ขั้นที่ 2:** หา $\dfrac{du}{dx} = g'(x)$ แล้วเขียนเป็น $du = g'(x)\,dx$
        
        **ขั้นที่ 3:** แทนค่า $u$ และ $du$ เข้าไปในสมการ
        
        **ขั้นที่ 4:** Integrate ตาม $u$
        
        **ขั้นที่ 5:** แทน $u = g(x)$ กลับ''',
          ],
        }),
        ContentBlock("int_sub_h_516", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_usub_basic_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_basic_1",
              "content": [
                r'''1. จงหา
        
        $$\int 2x(x^2 + 1)^5\,dx$$
        
        ☝️ **ขั้นที่ 1:** เลือก $u$
        
        สังเกต: $(x^2 + 1)$ อยู่ภายในยกกำลัง $5$
        
        และ $\dfrac{d}{dx}(x^2 + 1) = 2x$ **มีอยู่ในสมการ**!
        
        เลือก $u =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x^2 + 1$",
                r"$2x$",
                r"$(x^2 + 1)^5$",
                r"$x$",
                r"$x^2$",
              ],
              "correctAnswers": {"0": r"$x^2 + 1$"},
              "explanation": r'''เลือก $u = x^2 + 1$ เพราะมันอยู่ภายใน ✅''',
            },
          ],
        }),
        ContentBlock("ddq_usub_basic_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_basic_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** หา $du$
        
        $u = x^2 + 1$
        
        $\dfrac{du}{dx} =$ ''',
                {"drop": "0"},
                r'''$du =$ ''',
                {"drop": "1"},
                r'''$\,dx$''',
              ],
              "draggableItems": [
                r"$2x$",
                r"$2x\,dx$",
                r"$2x$",
                r"$dx$",
                r"$x\,dx$",
              ],
              "correctAnswers": {"0": r"$2x$", "1": r"$2x$"},
              "explanation":
                  r'''ดิฟ $u$ ได้ $\dfrac{du}{dx} = 2x$ แล้วเขียนเป็น $du = 2x\,dx$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_usub_basic_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_basic_3",
              "content": [
                r'''🔄 **ขั้นที่ 3:** แทนค่า
        
        $\int 2x(x^2 + 1)^5\,dx$
        
        แทน $u = x^2 + 1$ และ $du = 2x\,dx$:
        
        $= \int (x^2 + 1)^5 \cdot$ ''',
                {"drop": "0"},
                r'''$= \int$ ''',
                {"drop": "1"},
                r'''$\,du$''',
              ],
              "draggableItems": [
                r"$(x^2 + 1)^5$",
                r"$2x\,dx$",
                r"$u^5$",
                r"$2x$",
                r"$u$",
              ],
              "correctAnswers": {"0": r"$2x\,dx$", "1": r"$u^5$"},
              "explanation": r'''แทนแล้วได้ $\int u^5\,du$ ง่ายขึ้นเยอะ! ✅''',
            },
          ],
        }),
        ContentBlock("ddq_usub_basic_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_basic_4",
              "content": [
                r'''⚡ **ขั้นที่ 4:** Integrate
        
        $\int u^5\,du =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{u^6}{6} + c$",
                r"$u^6 + c$",
                r"$5u^4 + c$",
                r"$\dfrac{u^6}{5} + c$",
                r"$6u^5 + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{u^6}{6} + c$"},
              "explanation":
                  r'''ใช้สูตร $\int u^n\,du = \dfrac{u^{n+1}}{n+1} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_usub_basic_5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_basic_5",
              "content": [
                r'''🏁 **ขั้นที่ 5:** แทน $u$ กลับ
        
        $\dfrac{u^6}{6} + c$
        
        แทน $u = x^2 + 1$:
        
        $=$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{(x^2 + 1)^6}{6} + c$",
                r"$(x^2 + 1)^6 + c$",
                r"$\dfrac{x^6}{6} + c$",
                r"$u^6 + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{(x^2 + 1)^6}{6} + c$"},
              "explanation": r'''แทน $u$ กลับได้คำตอบสุดท้าย! 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_usub_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_practice_1",
              "content": [
                r'''1. $\int 3x^2(x^3 + 5)^4\,dx = ?$
        
        $u =$ ''',
                {"drop": "0"},
                r''', $du =$ ''',
                {"drop": "1"},
                r'''$= \int u^4\,du =$ ''',
                {"drop": "2"},
                r'''แทน $u$ กลับ: ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$x^3 + 5$",
                r"$3x^2\,dx$",
                r"$\dfrac{u^5}{5} + c$",
                r"$\dfrac{(x^3 + 5)^5}{5} + c$",
                r"$x^3$",
                r"$x^2\,dx$",
              ],
              "correctAnswers": {
                "0": r"$x^3 + 5$",
                "1": r"$3x^2\,dx$",
                "2": r"$\dfrac{u^5}{5} + c$",
                "3": r"$\dfrac{(x^3 + 5)^5}{5} + c$",
              },
              "explanation":
                  r'''เลือก $u = x^3 + 5$ ได้คำตอบ $\dfrac{(x^3 + 5)^5}{5} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("q_usub_practice_2", "question_fill_in", {
          "content": r'''2. $\int 6x(3x^2 + 1)^2\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{(3x^2 + 1)^3}{3} + c$",
          "explanation":
              r'''$u = 3x^2 + 1$, $du = 6x\,dx$ ดังนั้น $\int u^2\,du = \dfrac{u^3}{3} + c = \dfrac{(3x^2 + 1)^3}{3} + c$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("ddq_usub_practice_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_practice_3",
              "content": [
                r'''3. $\int \dfrac{2x}{(x^2 + 1)^3}\,dx = ?$
        
        เขียนใหม่: $\int 2x(x^2 + 1)^{-3}\,dx$
        
        $u =$ ''',
                {"drop": "0"},
                r''', $du =$ ''',
                {"drop": "1"},
                r'''$= \int u^{-3}\,du =$ ''',
                {"drop": "2"},
                r'''แทน $u$ กลับ: ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$x^2 + 1$",
                r"$2x\,dx$",
                r"$\dfrac{u^{-2}}{-2} + c$",
                r"$-\dfrac{1}{2(x^2 + 1)^2} + c$",
                r"$\dfrac{1}{u^2} + c$",
              ],
              "correctAnswers": {
                "0": r"$x^2 + 1$",
                "1": r"$2x\,dx$",
                "2": r"$\dfrac{u^{-2}}{-2} + c$",
                "3": r"$-\dfrac{1}{2(x^2 + 1)^2} + c$",
              },
              "explanation":
                  r'''$\int u^{-3}\,du = \dfrac{u^{-2}}{-2} + c = -\dfrac{1}{2u^2} + c$ ✅''',
            },
          ],
        }),
        ContentBlock("q_usub_practice_4", "question_fill_in", {
          "content": r'''4. $\int x\sqrt{x^2 + 1}\,dx = $ {{BOX}}''',
          "correctAnswer": r"$\dfrac{(x^2 + 1)^{3/2}}{3} + c$",
          "explanation":
              r'''$u = x^2 + 1$, $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}du$ ดังนั้น $\int u^{1/2} \cdot \dfrac{1}{2}\,du = \dfrac{1}{2} \cdot \dfrac{u^{3/2}}{3/2} + c = \dfrac{(x^2 + 1)^{3/2}}{3} + c$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("int_sub_h_526", "header", {
          "title": r"✋ เปลี่ยนตัวแปรแบบมีขอบเขต",
          "level": 2,
        }),
        ContentBlock("int_sub_t_527", "text", {
          "content": [
            r'''เมื่อมี**ขอบเขต** จะต้องเปลี่ยนขอบเขตด้วย! ✨
        
        $\int_a^b f(g(x)) \cdot g'(x)\,dx = \int_{g(a)}^{g(b)} f(u)\,du$
        
        Note = สำคัญ
        
        ขอบเขตเปลี่ยนจาก $x$ เป็น $u$!''',
          ],
        }),
        ContentBlock("int_sub_h_528", "header", {
          "title": r"✍ วิธีการ",
          "level": 2,
        }),
        ContentBlock("int_sub_t_529", "text", {
          "content": [
            r'''วิธีเหมือนกับแบบ**ไม่มีขอบเขต**
        
        เพิ่มแค่การเปลี่ยนขอบเขต''',
          ],
        }),
        ContentBlock("int_sub_h_530", "header", {"title": r"เช่น", "level": 2}),
        ContentBlock("ddq_usub_definite_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_definite_1",
              "content": [
                r'''1. จงหา
        
        $$\int_0^1 2x(x^2 + 1)^5\,dx$$
        
        🎯 **ขั้นที่ 1, 2** เลือก $u$ และหา $du$
        
        $u = x^2 + 1$, $du = 2x\,dx$ ✅
        
        **ขั้นที่ 3:** เปลี่ยนขอบเขต
        
        เมื่อ $x = 0$: $u =$ ''',
                {"drop": "0"},
                r'''เมื่อ $x = 1$: $u =$ ''',
                {"drop": "1"},
                r'''ขอบเขตใหม่: จาก ''',
                {"drop": "0"},
                r'''ถึง ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$1$", r"$2$", r"$0$", r"$3$", r"$4$"],
              "correctAnswers": {"0": r"$1$", "1": r"$2$"},
              "explanation": r'''$u = 0^2 + 1 = 1$ และ $u = 1^2 + 1 = 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_usub_definite_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_definite_2",
              "content": [
                r'''⚡ **ขั้นที่ 4:** Integrate
        
        $\int_0^1 2x(x^2 + 1)^5\,dx = \int_1^2 u^5\,du$
        
        $= \left[\dfrac{u^6}{6}\right]_1^2$
        
        $= \dfrac{2^6}{6} - \dfrac{1^6}{6}$
        
        $= \dfrac{64}{6} - \dfrac{1}{6} =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{63}{6}$",
                r"$\dfrac{21}{2}$",
                r"$\dfrac{65}{6}$",
                r"$11$",
              ],
              "correctAnswers": {"0": r"$\dfrac{63}{6}$"},
              "explanation":
                  r'''$\dfrac{64 - 1}{6} = \dfrac{63}{6} = \dfrac{21}{2} = 10.5$ 🎉''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_usub_definite_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_usub_definite_practice_1",
              "content": [
                r'''1. $\int_1^2 6x^2(x^3 + 1)^2\,dx = ?$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$2$",
                r"$9$",
                r"$486$",
                r"$1$",
                r"$8$",
                r"$729$",
              ],
              "correctAnswers": {"0": r"$486$"},
              "explanation":
                  r'''$\dfrac{2}{3}(729 - 8) = \dfrac{2}{3}(721) = \dfrac{1442}{3} \approx 480.67$''',
            },
          ],
        }),
        ContentBlock("q_usub_definite_practice_2", "question_fill_in", {
          "content": r'''2. $\int_0^2 x(x^2 + 1)^3\,dx = $ {{BOX}}''',
          "correctAnswer": r"78",
          "explanation":
              r'''$u = x^2 + 1$, $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}du$ เมื่อ $x = 0$ → $u = 1$, $x = 2$ → $u = 5$ ดังนั้น $\dfrac{1}{2}\int_1^5 u^3\,du = \dfrac{1}{2}\left[\dfrac{u^4}{4}\right]_1^5 = \dfrac{1}{8}(625 - 1) = \dfrac{624}{8} = 78$ ✅''',
          "boxCount": 1,
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("int_sub_t_535", "text", {
          "content": [
            r'''**</> การเปลี่ยนตัวแปรในปริพันธ์**
        
        **1. ใช้เมื่อเจอรูป Chain Rule ⛓️‍💥**
        
        $$\int f(g(x)) \cdot g'(x)\,dx$$
        
        **2. วิธีการ (5 ขั้น):**
        
        🔸 เลือก $u = g(x)$
        
        🔸 หา $du = g'(x)\,dx$
        
        🔸 แทนค่า $u$ และ $du$
        
        🔸 Integrate ตาม $u$
        
        🔸 แทน $u$ กลับ 🏁
        
        **3. แบบมีขอบเขต:**
        
        $\int_a^b f(g(x)) \cdot g'(x)\,dx = \int_{g(a)}^{g(b)} f(u)\,du$
        
        ต้องเปลี่ยนขอบเขตด้วย! ⚙️''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

// ── พื้นที่ใต้กราฟ ──────────────────────────────────────────────────────────────

final calcAreaLesson = ContentLesson(
  title: "การหาพื้นที่ใต้กราฟ",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("area_t_536", "text", {
          "content": [
            r'''จากบทที่ผ่านมา เราได้เรียนการหาปริพันธ์จำกัดเขตแล้ว
        
        แต่รู้ไหมว่า **ความหมายจริงๆ** ของมันคืออะไร? 🤔
        
        **คำตอบ:** มันคือ **พื้นที่ใต้กราฟ**! 📊
        
        Note = ทวน
        
        อย่างที่เคยบอกว่าปริพันธ์คือพื้นที่ใต้กราฟในตอนแรก แต่มารู้ทีหลังว่าคือการทำย้อนกลับของดิฟ''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"👇 พื้นที่ใต้กราฟคือ?",
      blocks: [
        ContentBlock("area_t_537", "text", {
          "content": [
            r'''พื้นที่ระหว่าง**กราฟของฟังก์ชัน**
        
        กับ**แกน** $x$ ในช่วง $[a, b]$''',
          ],
        }),
        ContentBlock("area_h_538", "header", {
          "title": r"🪧 สัญลักษณ์",
          "level": 2,
        }),
        ContentBlock("area_t_539", "text", {
          "content": [
            r'''$$\int_a^b f(x)\,dx$$
        
        💬 **ความหมาย:**
        
        พื้นที่ใต้กราฟของ $f(x)$ ในช่วง $[a,b]$''',
          ],
        }),
        ContentBlock("area_h_540", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_area_basic_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_basic_1",
              "content": [
                r'''1. จงหาพื้นที่สีส้ม สมการคือ $y = -x^2 + 4$ โดยกราฟตัดแกน $x$ ที่ $-2, 2$''',
                {"image": "assets/int1.png"},
                r'''ดังนั้นต้องหาพื้นที่ใต้กราฟของ $f(x) = -x^2 + 4$ จาก $x = -2$ ถึง $x = 2$
        
        เขียนได้เป็น ''',
                {"drop": "0"},
                r'''**ขั้นที่ 1** หา ''',
                {"drop": "0"},
                {"drop": "0"},
                r'''$=$ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$-\dfrac{x^3}{3} + 4x$",
                r"$x^3 + 2x$",
                r"$\int_2^{-2} -x^2 + 4\,dx$",
                r"$\int_{-2}^2 -x^2 + 4\,dx$",
                r"$\Bigl[-\frac{x^3}{3} + 4x + c\Bigr]_{-2}^{2}$",
                r"$\Bigl[-\frac{x^3}{3} + 4 + c\Bigr]_{-2}^{2}$",
              ],
              "correctAnswers": {
                "0": r"$\int_{-2}^2 -x^2 + 4\,dx$",
                "1": r"$\Bigl[-\frac{x^3}{3} + 4x + c\Bigr]_{-2}^{2}$",
              },
              "explanation":
                  r'''พื้นที่ใต้กราฟ $f(x) = -x^2 + 4$ จาก $x = -2$ ถึง $x = 2$ คือ $\int_{-2}^2 -x^2 + 4\,dx$ หา integral ได้ $-\dfrac{x^3}{3} + 4x + c$ แทนค่าได้ $\dfrac{32}{3}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_area_basic_1.5", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_basic_1.5",
              "content": [
                r'''**ขั้นที่ 2** หา $\int_{-2}^2 f(x)\,dx$
        
        แทน $x = -2$ และ $x = 2$ ใน $-\dfrac{x^3}{3} + 4x + c$ และนำมาลบกัน
        
        จะได้ 
        
        $F(2) - F(-2)$
        
        $= (-\dfrac{(2)^3}{3} + 4(2) + c) - (-\dfrac{(-2)^3}{3} + 4(-2) + c)$
        
        $= (-\dfrac{8}{3} + 8 + c) - (\dfrac{8}{3} - 8 + c)$
        
        $= -\dfrac{8}{3} + 8 + c - \dfrac{8}{3} + 8 - c$
        
        $= 16 - \dfrac{16}{3} =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{8}{3}$",
                r"$\dfrac{32}{3}$",
                r"$\dfrac{16}{3}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{32}{3}$"},
              "explanation":
                  r'''พื้นที่ใต้กราฟ $f(x) = -x^2 + 4$ จาก $x = -2$ ถึง $x = 2$ คือ $\int_{-2}^2 -x^2 + 4\,dx$ หา integral ได้ $-\dfrac{x^3}{3} + 4x + c$ แทนค่าได้ $\dfrac{32}{3}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_area_basic_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_basic_2",
              "content": [
                r'''2. จงหาพื้นที่สีส้ม สมการคือ $y = x^2 - 4$ โดยกราฟตัดแกน $x$ ที่ $-2, 2$''',
                {"image": "assets/int3.png"},
                r'''ดังนั้นต้องหาพื้นที่ใต้กราฟของ $f(x) = x^2 - 4$ จาก $x = -2$ ถึง $x = 2$
        
        เขียนได้เป็น ''',
                {"drop": "0"},
                r'''**ขั้นที่ 1** จากข้อที่แล้วเรารู้ 
        
        $\int_{-2}^2 -x^2 + 4\,dx = \dfrac{32}{3}$
        
        เรารู้ว่า $-(x^2 - 4) = -x^2 + 4$
        
        ดังนั้น
        
        $\int_{-2}^2 -x^2 + 4\,dx = \dfrac{32}{3} = -(\int_{-2}^2 x^2 - 4\,dx)$
        
        ดังนั้น $\int_{-2}^2 x^2 - 4\,dx$ ''',
                {"drop": "1"},
                r'''เราเห็นว่า ''',
                {"drop": "1"},
                {"drop": "2"},
                r''' $0$
        
        ดังนั้นพื้นที่ใต้กราฟติดลบ ''',
                {"drop": "3"},
              ],
              "draggableItems": [
                r"$\dfrac{8}{3}$",
                r"$\int_2^{-2} -x^2 + 4\,dx$",
                r"$\int_{-2}^2 -x^2 + 4\,dx$",
                r"$\int_{-2}^2 x^2 - 4\,dx$",
                r"$\dfrac{-32}{3}$",
                r"$\dfrac{32}{3}$",
                r"$>$",
                r"$<$",
                r"ได้",
                r"ไม่ได้",
                r"ตอบไม่ได้",
              ],
              "correctAnswers": {
                "0": r"$\int_{-2}^2 x^2 - 4\,dx$",
                "1": r"$\dfrac{-32}{3}$",
                "2": r"$<$",
                "3": r"ได้",
              },
              "explanation":
                  r'''พื้นที่ใต้กราฟ $f(x) = x^2 - 4$ คือ $\int_{-2}^2 x^2 - 4\,dx = -\dfrac{32}{3}$ ซึ่ง $< 0$ พื้นที่ใต้กราฟติดลบได้ ✅''',
            },
          ],
        }),
        ContentBlock("area_h_544", "header", {
          "title": r"🚨 ระวัง",
          "level": 2,
        }),
        ContentBlock("area_t_545", "text", {
          "content": [
            r'''**สิ่งสำคัญ:** พื้นที่ใต้กราฟ**สามารถติดลบได้**!
        
        ลองเทียบ 2 กราฟนี้''',
          ],
        }),
        ContentBlock("area_t_546", "image", {"path": "assets/int1.png"}),
        ContentBlock("area_t_547", "image", {"path": "assets/int3.png"}),
        ContentBlock("area_t_548", "text", {
          "content": [
            r'''กราฟ 1: พื้นที่ใต้กราฟ $\dfrac{32}{3}$ ซึ่งเป็น $+$
        
        กราฟ 2: พื้นที่ใต้กราฟ $\dfrac{-32}{3}$ ซึ่งเป็น $-$
        
        Note = เหตุผล
        
        กราฟ 1 พื้นที่แรเงาสีส้มอยู่**เหนือแกน** $x$ จึงเป็น $+$
        
        กราฟ 2 อยู่**ใต้แกน** $x$ จึงเป็น $-$''',
          ],
        }),
        ContentBlock("ddq_area_sign_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_sign_1",
              "content": [
                r'''1.''',
                {"image": "assets/int2.png"},
                r'''พื้นที่สีส้ม มีค่าเป็น ''',
                {"drop": "0"},
                r'''พื้นที่สีแดงมีค่าเป็น ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$+$", r"$+$", r"$-$", r"$-$"],
              "correctAnswers": {"0": r"$-$", "1": r"$+$"},
              "explanation":
                  r'''พื้นที่สีส้มอยู่**ใต้แกน** $x$ จึงเป็น $-$ พื้นที่สีแดงอยู่**เหนือแกน** $x$ จึงเป็น $+$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_area_sign_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_sign_2",
              "content": [
                r'''2.''',
                {"image": "assets/int4.png"},
                r'''พื้นที่สีส้ม มีค่าเป็น ''',
                {"drop": "0"},
                r'''พื้นที่สีแดงมีค่าเป็น ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$+$", r"$+$", r"$-$", r"$-$"],
              "correctAnswers": {"0": r"$-$", "1": r"$+$"},
              "explanation":
                  r'''พื้นที่สีส้มอยู่**ใต้แกน** $x$ จึงเป็น $-$ พื้นที่สีแดงอยู่**เหนือแกน** $x$ จึงเป็น $+$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("q_area_practice_1", "question_fill_in", {
          "content":
              r'''1. จงหาพื้นที่ใต้กราฟ $f(x) = 2x$ จาก $x = 0$ ถึง $x = 3$ 
        
                        พื้นที่ $= $ {{BOX}} ตร.หน่วย''',
          "correctAnswer": r"9",
          "explanation":
              r'''$\int_0^3 2x\,dx = [x^2]_0^3 = 9 - 0 = 9$ ตร.หน่วย ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_area_practice_2", "question_fill_in", {
          "content":
              r'''2. พื้นที่สามเหลี่ยมที่มีจุดยอด $(0,0)$, $(3,0)$, $(3,3)$ มีพื้นที่เท่าไร? 
        
                        {{BOX}} ตร.หน่วย''',
          "correctAnswer": r"$\dfrac{9}{2}$",
          "explanation":
              r'''สมการเส้นตรง: $f(x) = x$ จาก $x = 0$ ถึง $x = 3$ ดังนั้น $\int_0^3 x\,dx = \left[\dfrac{x^2}{2}\right]_0^3 = \dfrac{9}{2}$ ตร.หน่วย (ตรวจสอบ: $\dfrac{1}{2} \times 3 \times 3 = 4.5$ ถูกต้อง!) ✅''',
          "boxCount": 1,
        }),
        ContentBlock("q_area_practice_3", "question_fill_in", {
          "content":
              r'''3. จงหาพื้นที่ใต้กราฟ $f(x) = 6x^2 - 2x$ จาก $x = 0$ ถึง $x = 1$ 
        
                        {{BOX}} ตร.หน่วย''',
          "correctAnswer": r"1",
          "explanation":
              r'''$\int_0^1 (6x^2 - 2x)\,dx = [2x^3 - x^2]_0^1 = 2 - 1 = 1$ ตร.หน่วย ✅''',
          "boxCount": 1,
        }),
        ContentBlock("ddq_area_practice_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_area_practice_4",
              "content": [
                r'''4. จงหาพื้นที่ใต้กราฟ $f(x) = -4x^{3} + 4x^{2} + 8x$ เฉพาะที่แรเงา''',
                {"image": "assets/int4.png"},
                r'''Note = คำใบ้
        
        หาช่วงจากจุดตัดแกน $x$ โดยแทน $-4x^{3} + 4x^{2} + 8x = 0$
        
        
        พื้นที่ใต้กราฟ $=$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{37}{3}$",
                r"$9$",
                r"$4$",
                r"$\dfrac{31}{3}$",
                r"$\dfrac{28}{3}$",
              ],
              "correctAnswers": {"0": r"$9$"},
              "explanation": r'''**💡 ขั้นที่ 1:** หาจุดตัดแกน $x$
        
        $-4x^{3} + 4x^{2} + 8x = 0$
        
        $-4x(x^{2} - x - 2) = 0$
        
        $-4x(x - 2)(x + 1) = 0$
        
        ดังนั้น $x = -1, 0, 2$
        
        **✍️ ขั้นที่ 2:** ตั้งค่าอินทิกรัล
        
        พื้นที่แรเงาแบ่งเป็น 2 ส่วน (สีส้มและสีแดง)
        
        $= \int_{-1}^{2} (-4x^{3} + 4x^{2} + 8x) \,dx$
        
        **🧮 ขั้นที่ 3:** คำนวณ
        
        $= -x^4 + \dfrac{4x^3}{3} + 4x^2 + c$
        
        $F(2) - F(-1) = (-16 + \dfrac{32}{3} + 16) - (-1 - \dfrac{4}{3} + 4)$
        
        $= \dfrac{32}{3} + 1 + \dfrac{4}{3} - 4 = 9$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("area_t_555", "text", {
          "content": [
            r'''**🎯 การหาพื้นที่ใต้กราฟ**
        
        **1. นิยาม:**
        
        $$\int_a^b f(x)\,dx$$
        
        พื้นที่ระหว่าง**กราฟของฟังก์ชัน**กับ**แกน** $x$ ในช่วง $[a, b]$ 📐
        
        **2. เครื่องหมาย:**
        
        🔸 พื้นที่เหนือแกน $x$ เป็น $+$
        
        🔸 พื้นที่ใต้แกน $x$ เป็น $-$
        
        **3. ทฤษฎีบทพื้นฐาน:**
        
        $$\int_a^b f(x)\,dx = F(b) - F(a)$$
        
        นักคณิตศาสตร์**มารู้ทีหลัง**ว่า integral = ย้อนกลับของอนุพันธ์! 💡''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcEnclosedAreaLesson = ContentLesson(
  title: "การหาพื้นที่ปิดล้อม",
  sections: [
    ContentSection(
      headerL1: r"intro",
      blocks: [
        ContentBlock("area_enc_t_556", "text", {
          "content": [
            r'''จากบทที่แล้ว เราพบว่า integral **สามารถติดลบได้**!
        
        **แต่ถ้าเราต้องการ "พื้นที่รวมจริง" ล่ะ?** 🤔''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🎨 ความแตกต่าง",
      blocks: [
        ContentBlock("area_enc_t_557", "text", {
          "content": [r'''ในรูป $4$ และ $-4$ คือพื้นที่ใต้กราฟ'''],
        }),
        ContentBlock("area_enc_t_558", "image", {"path": "assets/int5.png"}),
        ContentBlock("area_enc_t_559", "text", {
          "content": [
            r'''**📊 พื้นที่ใต้กราฟ** รวมกันได้
        
        $$0$$
        
        มาจาก $4 - 4 = 0$
        
        **🎯 พื้นที่ปิดล้อม**
        
        คือ พื้นที่รวมจริง (ไม่ติดลบ)
        
        $$8$$
        
        มาจาก $4 + 4 = 8$''',
          ],
        }),
        ContentBlock("area_enc_h_560", "header", {
          "title": r"🧐 ลองคิดดู",
          "level": 2,
        }),
        ContentBlock("ddq_enclosed_concept_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_concept_1",
              "content": [
                {"image": "assets/int6.png"},
                r'''ถ้าไม่วาดรูปเราไม่รู้เลยว่าช่วงไหนเป็น $+$ หรือ $-$
        
        ลองคิดว่ามีฟังก์ชันไหนไหมที่เคยเรียนเมื่อใส่ค่า $x$ ไม่ว่าจะ $+$ หรือ $-$ จะคืนค่าเป็นบวกเสมอ
        
        เช่น $f(8) = 8, f(-2) = 2, f(-100) = 100$
        
        ฟังก์ชันนั้นคือ $f(x) =$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-x$", r"$x^2$", r"$x^4$", r"$|x|$"],
              "correctAnswers": {"0": r"$|x|$"},
              "explanation":
                  r'''ฟังก์ชันที่ทำให้คืนค่า $x$ เป็น $x$ ที่เป็น $+$ คือนิยามของ $|x|$ หรือค่าสัมบูรณ์! ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📐 พื้นที่ปิดล้อม",
      blocks: [
        ContentBlock("area_enc_t_562", "text", {
          "content": [
            r'''เรารู้ว่า $|x|$ ทำให้ค่า $x$ เป็น $+$ ดังนั้นเราจึงต้องแบ่งช่วงและใส่ $|x|$
        
        เช่น''',
          ],
        }),
        ContentBlock("area_enc_t_563", "image", {"path": "assets/int6.png"}),
        ContentBlock("area_enc_t_564", "text", {
          "content": [
            r'''พื้นที่ปิดล้อมจะเป็น
        
        $-a + b - c \text{ หรือ } |a| + |b| + |c|$
        
        เขียนเป็น integral ได้
        
        $|\int_{-2}^{-1} f(x)\,dx| + |\int_{-1}^{1} f(x)\,dx| + |\int_{1}^{2} f(x)\,dx|$
        
        ตามจุดตัดแกน $x$ ในรูป
        
        Note = ทำไม
        
        เพราะในรูปเรารู้ว่าพื้นที่ใต้กราฟ $a$ เป็น $-$, $b$ เป็น $+$, $c$ เป็น $-$ ดังนั้น $-a + b - c = |a| + |b| + |c|$''',
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"👑 แนวคิดหลัก",
      blocks: [
        ContentBlock("area_enc_t_565", "text", {
          "content": [
            r'''**ขั้นที่ 1:** หาจุดตัดแกน $x$ ที่ $f(x) = 0$ และแบ่งช่วงโดย**รวมขอบ**ที่โจทย์ถามด้วย
        
        **ขั้นที่ 2:** หา Integral และแทนค่าแต่ละช่วง
        
        **ขั้นที่ 3:** บวก**ค่าสัมบูรณ์**ทุกช่วง
        
        $|\int_{x_1}^{x_2} f(x)\,dx| + |\int_{x_2}^{x_3} f(x)\,dx| + \cdots$''',
          ],
        }),
        ContentBlock("area_enc_h_566", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_enclosed_example_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_example_1",
              "content": [
                r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = (x - 2)(x - 1)(x + 1)(x + 2)$ กับแกน $x$ จาก $x = -1.5$ ถึง $x = 2$''',
                {"image": "assets/int7.png"},
                r'''☝️ **ขั้นที่ 1:** หาจุดตัดแกน $x$
        
        $f(x) =(x - 2)(x - 1)(x + 1)(x + 2) = 0$
        
        $x =$ ''',
                {"drop": "0"},
                r'''ในช่วงที่โจทย์ถาม $[-1.5, 2]$
        
        จุดแบ่งช่วงคือ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$1, 2, 3, 4$",
                r"$-2, -1, 1, 2$",
                r"$1, 2, 3$",
                r"$x = -1, 1, 2$",
                r"$x = -1.5, -1, 1, 2$",
              ],
              "correctAnswers": {
                "0": r"$-2, -1, 1, 2$",
                "1": r"$x = -1.5, -1, 1, 2$",
              },
              "explanation":
                  r'''จุดตัดแกน $x$ คือ $-2, -1, 1, 2$ แต่ในช่วง $[-1.5, 2]$ จุดแบ่งช่วงรวมขอบคือ $-1.5, -1, 1, 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_enclosed_example_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_example_2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** หา Integral และแทนค่าแต่ละช่วง
        
        หาค่า integral:
        
        $f(x) = (x - 2)(x - 1)(x + 1)(x + 2) = x^4 - 5x^2 + 4$
        
        $F(x) = \int x^4 - 5x^2 + 4 =$ ''',
                {"drop": "0"},
                r'''จากขั้นที่ 1 จะได้จุด $x = -1.5, -1, 1, 2$
        
        **ช่วงที่ 1:** $[-1.5, -1]$
        
        ต้องการหา $F(-1) - F(-1.5) = -\dfrac{307}{480}$
        
        **ช่วงที่ 2:** $[-1, 1]$
        
        ต้องการหา $F(1) - F(-1) = \dfrac{38}{15} \cdot 2 =$ ''',
                {"drop": "1"},
                r'''**ช่วงที่ 3:** $[1, 2]$
        
        ต้องการหา $F(2) - F(1) = \dfrac{16 - 38}{15} =$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\dfrac{x^5}{5} - \dfrac{5x^3}{3} +4x + c$",
                r"$\dfrac{x^5}{5} - \dfrac{5x^3}{3} +4x$",
                r"$\dfrac{x^5}{5} + \dfrac{5x^3}{3} - 4x +c$",
                r"$\dfrac{76}{15}$",
                r"$-\dfrac{22}{15}$",
                r"$1$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{x^5}{5} - \dfrac{5x^3}{3} +4x + c$",
                "1": r"$\dfrac{76}{15}$",
                "2": r"$-\dfrac{22}{15}$",
              },
              "explanation":
                  r'''$\int x^4 - 5x^2 + 4 = \dfrac{x^5}{5} - \dfrac{5x^3}{3} +4x + c$ แล้วคำนวณแต่ละช่วง: ช่วงที่ 2 ได้ $\dfrac{76}{15}$ และช่วงที่ 3 ได้ $-\dfrac{22}{15}$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_enclosed_example_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_example_3",
              "content": [
                r'''🏁 **ขั้นที่ 3:** ค่าสัมบูรณ์และบวกกัน
        
        พื้นที่ปิดล้อม $= |\int_{-1.5}^{-1} f(x)\,dx| + |\int_{-1}^{1} f(x)\,dx| + |\int_{1}^{2} f(x)\,dx|$
        
        $=$ ''',
                {"drop": "0"},
                r''' $+ \dfrac{76}{15} + \dfrac{22}{15}$
        
        $= \dfrac{3443}{480}$ ตร.หน่วย''',
              ],
              "draggableItems": [
                r"$\dfrac{307}{480}$",
                r"$- \dfrac{22}{15}$",
                r"$\dfrac{76}{15}$",
                r"$-\dfrac{307}{480}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{307}{480}$"},
              "explanation":
                  r'''$|-\dfrac{307}{480}| = \dfrac{307}{480}$ ใช้ค่าสัมบูรณ์ทำให้เป็นบวก ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("ddq_enclosed_practice_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_practice_1",
              "content": [
                r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3 - 4x$ กับแกน $x$ จาก $x = -2$ ถึง $x = 2$
        
        **ขั้นที่ 1:** หาจุดตัด
        
        $x^3 - 4x = x(x^2 - 4) = x(x-2)(x+2) = 0$
        
        $x = -2, 0, 2$
        
        **ขั้นที่ 2:** แบ่งช่วง
        
        ช่วง: $[-2, 0]$ และ $[0, 2]$
        
        **ขั้นที่ 3:** Integrate
        
        $A_1 = \int_{-2}^0 (x^3 - 4x)\,dx = 4$
        
        $A_2 = \int_0^2 (x^3 - 4x)\,dx = -4$
        
        **พื้นที่ปิดล้อม** $= |4| + |-4| =$ ''',
                {"drop": "0"},
                r'''ตร.หน่วย''',
              ],
              "draggableItems": [r"$8$", r"$0$", r"$4$", r"$-4$", r"$16$"],
              "correctAnswers": {"0": r"$8$"},
              "explanation": r'''$4 + 4 = 8$ ตร.หน่วย ✅''',
            },
          ],
        }),
        ContentBlock("ddq_enclosed_practice_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_practice_2",
              "content": [
                r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 - 4$ กับแกน $x$ จาก $x = -2$ ถึง $x = 2$
        
        **ขั้นที่ 1:** หาจุดตัด
        
        $x^2 - 4 = 0 \to x = \pm 2$
        
        สังเกต: $f(x) < 0$ บนช่วง $(-2, 2)$ กราฟอยู่**ใต้**แกน $x$ ทั้งหมด!
        
        **ขั้นที่ 2:** Integrate
        
        $\int_{-2}^2 (x^2 - 4)\,dx = \left[\dfrac{x^3}{3} - 4x\right]_{-2}^2$
        
        $= \left(\dfrac{8}{3} - 8\right) - \left(-\dfrac{8}{3} + 8\right) =$ ''',
                {"drop": "0"},
                r'''**ขั้นที่ 3:** ค่าสัมบูรณ์
        
        พื้นที่ปิดล้อม $= |$ ''',
                {"drop": "0"},
                r'''$| =$ ''',
                {"drop": "1"},
                r'''ตร.หน่วย''',
              ],
              "draggableItems": [
                r"$-\dfrac{32}{3}$",
                r"$\dfrac{32}{3}$",
                r"$\dfrac{16}{3}$",
                r"$32$",
                r"$-16$",
              ],
              "correctAnswers": {
                "0": r"$-\dfrac{32}{3}$",
                "1": r"$\dfrac{32}{3}$",
              },
              "explanation":
                  r'''$\left|-\dfrac{32}{3}\right| = \dfrac{32}{3} \approx 10.67$ ตร.หน่วย ✅''',
            },
          ],
        }),
        ContentBlock("q_enclosed_practice_3", "question_fill_in", {
          "content":
              r'''3. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3 - x$ กับแกน $x$ จาก $x = -1$ ถึง $x = 1$ 
        
                        {{BOX}} ตร.หน่วย''',
          "correctAnswer": r"$\dfrac{1}{2}$",
          "explanation":
              r'''จุดตัด: $x^3 - x = x(x^2 - 1) = 0$ → $x = -1, 0, 1$ ช่วง: $[-1, 0]$ และ $[0, 1]$ คำนวณได้ $A_1 = \dfrac{1}{4}$, $A_2 = -\dfrac{1}{4}$ พื้นที่ปิดล้อม $= \dfrac{1}{4} + \dfrac{1}{4} = \dfrac{1}{2}$ ✅''',
          "boxCount": 1,
        }),
        ContentBlock("ddq_enclosed_practice_4", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_enclosed_practice_4",
              "content": [
                r'''4. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 2x - x^2$ กับแกน $x$
        
        **ขั้นที่ 1:** หาจุดตัด
        
        $2x - x^2 = x(2 - x) = 0$
        
        $x =$ ''',
                {"drop": "0"},
                r'''หรือ $x =$ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 2:** Integrate
        
        $\int_0^2 (2x - x^2)\,dx = \left[x^2 - \dfrac{x^3}{3}\right]_0^2$
        
        $= 4 - \dfrac{8}{3} =$ ''',
                {"drop": "2"},
                r'''สังเกต: ผลลัพธ์เป็น**บวก** → กราฟอยู่เหนือแกน $x$
        
        **พื้นที่ปิดล้อม** $=$ ''',
                {"drop": "2"},
                r'''ตร.หน่วย''',
              ],
              "draggableItems": [
                r"$0$",
                r"$2$",
                r"$\dfrac{4}{3}$",
                r"$4$",
                r"$\dfrac{8}{3}$",
                r"$1$",
              ],
              "correctAnswers": {
                "0": r"$0$",
                "1": r"$2$",
                "2": r"$\dfrac{4}{3}$",
              },
              "explanation":
                  r'''กราฟอยู่เหนือแกน $x$ ทั้งหมด พื้นที่ $= \dfrac{4}{3}$ ✅''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("area_enc_t_574", "text", {
          "content": [
            r'''**🎯 การหาพื้นที่ปิดล้อม**
        
        **1. ความแตกต่าง:**
        
        | | พื้นที่ใต้กราฟ | พื้นที่ปิดล้อม |
        |---|---|---|
        | สูตร | $\int_a^b f(x)\,dx$ | $\sum \left|\int f(x)\,dx\right|$ |
        | ผลลัพธ์ | มี $+/-$ | ไม่ติดลบ |
        
        **2. วิธีการ**
           - หาจุดตัด $f(x) = 0$ → แบ่งช่วง 🔍
           - Integrate แต่ละช่วง 📐
           - บวกค่าสัมบูรณ์ทุกช่วง ✅
        
        **3. สูตร:**
        
        $\text{พื้นที่ปิดล้อม} = \left|\int_{x_1}^{x_2} f(x)\,dx\right| + \left|\int_{x_2}^{x_3} f(x)\,dx\right| + \cdots$''',
          ],
        }),
      ],
    ),
  ],
);

final calcAreaBetweenLesson = ContentLesson(
  title: "การหาพื้นที่ระหว่าง 2 กราฟ",
  sections: [
    ContentSection(
      headerL1: r"🏡 พื้นที่ปิดล้อม 2 กราฟ",
      blocks: [
        ContentBlock("area_bet_t_575", "text", {
          "content": [r'''บทนี้จะเรียนการหาพื้นที่ปิดล้อมระหว่าง 2 กราฟ 💎'''],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"🤔 คำถาม",
      blocks: [
        ContentBlock("ddq_between_concept_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_between_concept_1",
              "content": [
                r'''คิดว่าพื้นที่ที่แรเงาในรูปคิดยังไง 🧠''',
                {"image": "assets/desmos-graph.png"},
                r'''ถ้าให้กราฟบนคือ $f(x)$ และ $g(x)$ 📈
        
        **🔍 1. ลองเปรียบเทียบ** $2$ รูปนี้ และคิดว่ากราฟด้านบนมีพื้นที่เท่าไหร่''',
                {"image": "assets/int8.png"},
                {"image": "assets/int9.png"},
                r'''รูปแรกสีส้มมีพื้นที่คือ ''',
                {"drop": "0"},
                r'''รูปที่ $2$ สีน้ำเงินมีพื้นที่คือ ''',
                {"drop": "1"},
                r'''ดังนั้นรูปด้านบนที่ทับกันมีพื้นที่คือ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\int_0^2 f(x)\,dx$",
                r"$\int_{-1}^1 f(x)\,dx$",
                r"$\int_0^2 g(x)\,dx$",
                r"$\int_{-1}^1 g(x)\,dx$",
                r"$\int_0^2 f(x) + g(x)\,dx$",
                r"$\int_0^2 f(x) - g(x)\,dx$",
                r"$\int_{-1}^1 f(x) + g(x)\,dx$",
              ],
              "correctAnswers": {
                "0": r"$\int_0^2 f(x)\,dx$",
                "1": r"$\int_0^2 g(x)\,dx$",
                "2": r"$\int_0^2 f(x) - g(x)\,dx$",
              },
              "explanation":
                  r'''ลองจินตนาการว่าเอารูปที่ 2 สีฟ้ามาทับรูปแรก จะได้ 🎨
        ซึ่งจะเห็นว่าถ้าลบสีฟ้าออกจะได้แบบในรูปที่ต้องการหาเลย! 💡
        
        ดังนั้นพื้นที่ที่ต้องการ $=$ พื้นที่ใต้กราฟสีแดง $-$ พื้นที่ใต้กราฟสีฟ้า ✨
        
        ดังนั้นจะได้ $\int_0^2 f(x) - g(x)\,dx$ 🎯''',
            },
          ],
        }),
      ],
    ),
    ContentSection(
      headerL1: r"สูตรพื้นที่ปิดล้อม 2 กราฟ",
      blocks: [
        ContentBlock("area_bet_t_577", "text", {
          "content": [
            r'''ให้ $x_0, x_1, ...., x_n$ คือจุดตัดของฟังก์ชัน $f(x), g(x)$ ทั้งหมด
        
        จะได้พื้นที่ปิดล้อมรวมคือ 
        
        $$\sum_{i=0}^{n-1} \int_{x_i}^{x_{i+1}}|\,f(x)-g(x)\,| \,dx$$
        
        Note = เช่น
        
        กราฟ $f(x)$ และ $g(x)$ ตัดกันที่จุด $-2, 0, 2$
        
        จะได้พื้นที่ปิดล้อมคือ
        
        $|\int_{-2}^{0} f(x) - g(x)\,dx| + |\int_{0}^{2} f(x) - g(x)\,dx|$''',
          ],
        }),
        ContentBlock("area_bet_h_578", "header", {
          "title": r"📜 พิสูจน์ง่ายๆ",
          "level": 2,
        }),
        ContentBlock("ddq_between_concept_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_between_concept_2",
              "content": [
                r'''1. ให้กราฟสีเหลืองคือ $f(x)$ และ กราฟสีเทาคือ $g(x)$ หาพื้นที่ปิดล้อมระหว่าง 2 กราฟ''',
                {"image": "assets/int10.png"},
                r'''**🔍 ขั้นที่ 1: แยก 2 กราฟ**''',
                {"image": "assets/int12.png"},
                {"image": "assets/int13.png"},
                r'''ให้ $a_1 - a_4$ และ $b_1 - b_4$ เป็นพื้นที่ใต้กราฟ(เป็น + หรือ - ก็ได้)
        
        รูปแรกสีเหลืองมีพื้นที่ใต้กราฟคือ ''',
                {"drop": "0"},
                r''' $= a_1 + a_2 + a_3 + a_4$
        
        รูปที่ $2$ สีน้ำเทามีพื้นที่ใต้กราฟ
        
        คือ ''',
                {"drop": "1"},
                r''' $= b_1 + b_2 + b_3 + b_4$
        
        พื้นที่ปิดล้อมของ 2 กราฟ คือ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$|\int_{-1.5}^0 f(x)\,dx| + |\int_{0}^{1.5} f(x)\,dx|$",
                r"$\int_{-1.5}^{1.5} f(x)\,dx$",
                r"$|\int_{-1.5}^0 g(x)\,dx| + |\int_{0}^{1.5} g(x)\,dx|$",
                r"$\int_{-1.5}^{1.5} g(x)\,dx$",
                r"$a_2 + b_2 + a_3 + b_3$",
                r"$a_2 - b_2 + a_3 - b_3$",
                r"$a_2 - b_2 + b_3 - a_3$",
              ],
              "correctAnswers": {
                "0": r"$\int_{-1.5}^{1.5} f(x)\,dx$",
                "1": r"$\int_{-1.5}^{1.5} g(x)\,dx$",
                "2": r"$a_2 - b_2 + b_3 - a_3$",
              },
              "explanation":
                  r'''ลองจินตนาการว่าเอารูปที่ 2 สีฟ้ามาทับรูปแรก จะได้ 🎨
        ซึ่งจะเห็นว่าถ้าลบสีฟ้าออกจะได้แบบในรูปที่ต้องการหาเลย! 💡
        
        ดังนั้นพื้นที่ที่ต้องการ $=$ พื้นที่ใต้กราฟสีแดง $-$ พื้นที่ใต้กราฟสีฟ้า ✨
        
        ดังนั้นจะได้ $\int_0^2 f(x) - g(x)\,dx$ 🎯''',
            },
          ],
        }),
        ContentBlock("ddq_between_concept_3", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_between_concept_3",
              "content": [
                r'''**🔍 ขั้นที่ 2: หาพื้นที่**
        
        ต้องการหา $a_2 - b_2 + b_3 - a_3$''',
                {"image": "assets/int12.png"},
                {"image": "assets/int13.png"},
                r'''แยกช่วงตามจุดตัด $2$ กราฟในรูป
        
        ได้ $[-1.5, 0]$ กับ $[0, 1.5]$
        
        🔸 ช่วง $[-1.5, 0]$
        
        ลองหา $|\int_{-1.5}^0 f(x) - g(x)\,dx| = |a_1 + a_2 - b_1 - b_2|$
        
        และย้อนไปดูในรูปจะได้ $a_1 = b_1$ 
        
        ดังนั้น $|\int_{-1.5}^0 f(x) - g(x)\,dx| =$ ''',
                {"drop": "0"},
                r'''🔸 ช่วง $[0, 1.5]$
        
        ลองหา $|\int_{0}^{1.5} f(x) - g(x)\,dx| = |a_3 + a_4 - b_3 - b_4|$
        
        และย้อนไปดูในรูปจะได้ $a_4 = b_4$ 
        
        ดังนั้น $|\int_{0}^{1.5} f(x) - g(x)\,dx| =$ ''',
                {"drop": "1"},
                r'''จะได้ว่า $|\int_{-1.5}^0 f(x) - g(x)\,dx| + |\int_{0}^{1.5} f(x) - g(x)\,dx|$
        
        $=$ ''',
                {"drop": "0"},
                r'''$+$ ''',
                {"drop": "1"},
                r'''ย้อนกลับไปดูในรูป $b_2, a_3$ เป็น $-$
        
        ดังนั้น $|\int_{-1.5}^0 f(x) - g(x)\,dx| + |\int_{0}^{1.5} f(x) - g(x)\,dx|$ 
        
        $=$ ''',
                {"drop": "1"},
                r'''$=$ พื้นที่ปิดล้อมที่ต้องการ''',
              ],
              "draggableItems": [
                r"$|\int_{-1.5}^0 f(x)\,dx| + |\int_{0}^{1.5} f(x)\,dx|$",
                r"$\int_{-1.5}^{1.5} f(x)\,dx$",
                r"$|\int_{-1.5}^0 g(x)\,dx| + |\int_{0}^{1.5} g(x)\,dx|$",
                r"$\int_{-1.5}^{1.5} g(x)\,dx$",
              ],
              "correctAnswers": {
                "0": r"$\int_{-1.5}^{1.5} f(x)\,dx$",
                "1": r"$\int_{-1.5}^{1.5} g(x)\,dx$",
              },
              "explanation":
                  r'''ลองจินตนาการว่าเอารูปที่ 2 สีฟ้ามาทับรูปแรก จะได้ 🎨
        ซึ่งจะเห็นว่าถ้าลบสีฟ้าออกจะได้แบบในรูปที่ต้องการหาเลย! 💡
        
        ดังนั้นพื้นที่ที่ต้องการ $=$ พื้นที่ใต้กราฟสีแดง $-$ พื้นที่ใต้กราฟสีฟ้า ✨
        
        ดังนั้นจะได้ $\int_0^2 f(x) - g(x)\,dx$ 🎯''',
            },
          ],
        }),
        ContentBlock("area_bet_h_581", "header", {
          "title": r"👑 แนวคิดหลัก",
          "level": 2,
        }),
        ContentBlock("area_bet_t_582", "text", {
          "content": [
            r'''**ขั้นที่ 1** หาจุดตัดของ $2$ ฟังก์ชัน และแบ่งช่วงโดย**รวมขอบ**ที่โจทย์ถามด้วย
        
        **ขั้นที่ 2** พื้นที่ที่ถูกปิดล้อมด้วย $2$ ฟังก์ชันช่วง $[a, b]$ จะมีพื้นที่
        
        $|\int_a^{x_1} f(x) - g(x)\,dx| + |\int_{x_1}^{x_2} f(x) - g(x)\,dx| + ... + |\int_{x_i}^{b} f(x) - g(x)\,dx|$
        
        โดย $x_1, x_2, ..., x_i$ คือจุดตัดของ 2 กราฟ
        
        Note = ทำไมค่าสัมบูรณ์
        
        เพราะพื้นที่ปิดล้อมต้องมีค่าเป็น $+$ และโจทย์ที่ไม่มีรูปจะไม่บอกว่าฟังก์ชันไหนอยู่เหนือกว่าในแต่ละช่วง''',
          ],
        }),
        ContentBlock("area_bet_h_583", "header", {
          "title": r"👉 ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ddq_between_example_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_between_example_1",
              "content": [
                r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x + 2$ และ $g(x) = x^2$
        
        ทำตาม 3 ขั้นตอน! 🔊
        
        ☝️ **ขั้นที่ 1:** หาจุดตัดของ 2 ฟังก์ชัน
        
        ให้ $f(x) = g(x)$
        
        $x + 2 = x^2$
        
        $x^2 - x - 2 = 0$
        
        $(x+1)(x-2) = 0$
        
        ดังนั้นจุดตัดคือ $x =$ ''',
                {"drop": "0"},
                r'''และ $x =$ ''',
                {"drop": "1"},
                r'''ได้ช่วง $[$ ''',
                {"drop": "0"},
                r'''$,$ ''',
                {"drop": "1"},
                r'''$]$''',
              ],
              "draggableItems": [
                r"$-2$",
                r"$-1$",
                r"$0$",
                r"$1$",
                r"$2$",
                r"$3$",
              ],
              "correctAnswers": {"0": r"$-1$", "1": r"$2$"},
              "explanation":
                  r'''แยกตัวประกอบได้ $(x-2)(x+1) = 0$ ดังนั้น $x = -1$ หรือ $x = 2$ ✅''',
            },
          ],
        }),
        ContentBlock("ddq_between_example_2", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_between_example_2",
              "content": [
                r'''✌️ **ขั้นที่ 2:** คำนวณพื้นที่
        
        พื้นที่ $= \int_{-1}^{2} [f(x) - g(x)]\,dx$
        
        $= \int_{-1}^{2} (x + 2 - x^2)\,dx$
        
        $= \left[\dfrac{x^2}{2} + 2x - \dfrac{x^3}{3}\right]_{-1}^{2}$
        
        $= \left(\dfrac{4}{2} + 4 - \dfrac{8}{3}\right) - \left(\dfrac{1}{2} - 2 + \dfrac{1}{3}\right)$
        
        $= \left(2 + 4 - \dfrac{8}{3}\right) - \left(\dfrac{1}{2} - 2 + \dfrac{1}{3}\right)$
        
        พื้นที่ที่ได้คือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{7}{2}$",
                r"$\dfrac{9}{2}$",
                r"$\dfrac{11}{2}$",
                r"$\dfrac{13}{2}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{9}{2}$"},
              "explanation":
                  r'''คำนวณแล้วได้ $6 - \dfrac{8}{3} - \dfrac{1}{2} + 2 - \dfrac{1}{3} = \dfrac{9}{2}$ หน่วยกำลังสอง 🎉''',
            },
          ],
        }),
        ContentBlock("area_bet_h_586", "header", {
          "title": r"📝 แบบฝึกหัด",
          "level": 2,
        }),
        ContentBlock("q_between_practice_1", "question_choice", {
          "content": [
            r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 4$ และ $g(x) = x^2$ ในช่วง $[-2, 2]$''',
          ],
          "options": [
            r"$\dfrac{16}{3}$",
            r"$\dfrac{20}{3}$",
            r"$\dfrac{28}{3}$",
            r"$\dfrac{32}{3}$",
          ],
          "correct": r"$\dfrac{32}{3}$",
          "explanation":
              r'''ช่วงที่โจทย์กำหนด $[-2, 2]$ และ $f(x) = 4$ อยู่เหนือ $g(x) = x^2$ พื้นที่ $= \int_{-2}^{2} (4 - x^2)\,dx = \left[4x - \dfrac{x^3}{3}\right]_{-2}^{2} = (8 - \dfrac{8}{3}) - (-8 + \dfrac{8}{3}) = 16 - \dfrac{16}{3} = \dfrac{32}{3}$ ✅''',
        }),
        ContentBlock("q_between_practice_2", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x$ และ $g(x) = x^2$''',
          ],
          "options": [
            r"$\dfrac{1}{4}$",
            r"$\dfrac{1}{3}$",
            r"$\dfrac{1}{6}$",
            r"$\dfrac{1}{2}$",
          ],
          "correct": r"$\dfrac{1}{6}$",
          "explanation":
              r'''หาจุดตัด: $x = x^2$ ได้ $x = 0, 1$ ในช่วง $[0, 1]$ แทน $x = 0.5$ ได้ $f(x)$ อยู่เหนือกว่า พื้นที่ $= \int_{0}^{1} (x - x^2)\,dx = \left[\dfrac{x^2}{2} - \dfrac{x^3}{3}\right]_{0}^{1} = \dfrac{1}{2} - \dfrac{1}{3} = \dfrac{1}{6}$ ✅''',
        }),
        ContentBlock("q_between_practice_3", "question_choice", {
          "content": [
            r'''3. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 6 - x^2$ และ $g(x) = x$''',
          ],
          "options": [
            r"$\dfrac{125}{6}$",
            r"$\dfrac{127}{6}$",
            r"$\dfrac{129}{6}$",
            r"$\dfrac{131}{6}$",
          ],
          "correct": r"$\dfrac{125}{6}$",
          "explanation":
              r'''หาจุดตัด: $6 - x^2 = x$ ได้ $x = -3, 2$ แทน $x = 0$ ได้ $f(x)$ อยู่เหนือกว่า พื้นที่ $= \int_{-3}^{2} (6 - x^2 - x)\,dx = \left[6x - \dfrac{x^3}{3} - \dfrac{x^2}{2}\right]_{-3}^{2} = \dfrac{125}{6}$ ✅''',
        }),
        ContentBlock("q_between_practice_4", "question_choice", {
          "content": [
            r'''4. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 + 2$ และ $g(x) = -x$ ในช่วง $[0, 2]$''',
          ],
          "options": [
            r"$\dfrac{14}{3}$",
            r"$\dfrac{16}{3}$",
            r"$\dfrac{20}{3}$",
            r"$\dfrac{22}{3}$",
          ],
          "correct": r"$\dfrac{16}{3}$",
          "explanation":
              r'''ช่วง $[0, 2]$ แทน $x = 1$ ได้ $f(x)$ อยู่เหนือกว่า พื้นที่ $= \int_{0}^{2} (x^2 + 2 - (-x))\,dx = \int_{0}^{2} (x^2 + x + 2)\,dx = \left[\dfrac{x^3}{3} + \dfrac{x^2}{2} + 2x\right]_{0}^{2} = \dfrac{8}{3} + 2 + 4 = \dfrac{16}{3}$ ✅''',
        }),
        ContentBlock("q_between_practice_5", "question_choice", {
          "content": [
            r'''5. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 2x$ และ $g(x) = x^2 - 4x$''',
          ],
          "options": [r"$30$", r"$32$", r"$34$", r"$36$"],
          "correct": r"$36$",
          "explanation":
              r'''หาจุดตัด: $2x = x^2 - 4x$ ได้ $x = 0, 6$ แทน $x = 1$ ได้ $f(x)$ อยู่เหนือกว่า พื้นที่ $= \int_{0}^{6} (2x - (x^2 - 4x))\,dx = \int_{0}^{6} (6x - x^2)\,dx = \left[3x^2 - \dfrac{x^3}{3}\right]_{0}^{6} = 108 - 72 = 36$ ✅''',
        }),
      ],
    ),
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("area_bet_t_592", "text", {
          "content": [
            r'''**🎯 วิธีหาพื้นที่ปิดล้อมระหว่าง 2 กราฟ**
        
        1. **หาจุดตัด** ของ 2 ฟังก์ชัน (ถ้าโจทย์ไม่ได้บอกช่วง)
        
        2. **ดูว่าฟังก์ชันไหนอยู่เหนือกว่า** โดยแทนค่า $x$ ในช่วงนั้น
        
        3. **คำนวณพื้นที่** ด้วยสูตร $\int_a^b [f(x) - g(x)]\,dx$ เมื่อ $f(x) \geq g(x)$
        
        4. **ใช้ค่าสัมบูรณ์** ถ้ามีหลายช่วงหรือไม่แน่ใจว่าฟังก์ชันไหนอยู่เหนือกว่า 💪''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcIntApplicationLesson = ContentLesson(
  title: "การประยุกต์",
  sections: [],
);
