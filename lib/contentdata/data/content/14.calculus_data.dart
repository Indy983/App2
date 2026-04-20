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
    // SECTION 3: เมื่อแทนค่าแล้วได้ ∞−∞
    // ==========================================
    ContentSection(
      headerL1: r"เมื่อแทนค่าแล้วได้ ∞−∞",
      blocks: [
        ContentBlock("lim_poly_t_030", "text", {
          "content": [
            r'''บางโจทย์ไม่ได้เป็นเศษส่วนเดียว แต่เป็น **ผลบวกหรือผลต่างของเศษส่วนหลายตัว**

แทนค่าแล้วอาจได้ $\dfrac{k}{0}$ หลายตัวมารวมกัน ซึ่งเป็นรูป $\infty - \infty$ — ก็ต้องจัดรูปเช่นกัน''',
          ],
        }),
        ContentBlock("lim_poly_h_031", "header", {
          "title": r"ตัวอย่าง — จัดส่วนให้เท่ากันก่อน",
          "level": 2,
        }),
        ContentBlock("lim_poly_t_032", "text", {
          "content": [
            r'''จงหา 

$$\lim\limits_{x \to 2} \left(\dfrac{2}{x-2} + \dfrac{1}{x+2} - \dfrac{8}{x^2-4}\right)$$

แทน $x=2$ ตรงๆ ก่อน

$\dfrac{2}{0} + \dfrac{1}{4} - \dfrac{8}{0}$ → ได้รูป $\infty + c - \infty = \infty - \infty$ ต้องจัดรูป

Note = วิธีแก้

เศษส่วนหลายตัวรวมกันเป็นตัวเดียวก่อน โดยหาตัวส่วนร่วม แล้วค่อยแยกตัวประกอบปกติ''',
          ],
        }),
        ContentBlock("lim_poly_ddq_033", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_033_s1",
              "content": [
                r'''ก่อนอื่น สังเกตว่า $x^2-4 = (x-2)(x+2)$

ตัวส่วนร่วม (LCD) ของทั้งสามเศษส่วนคือ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x^2-4$",
                r"$(x-2)$",
                r"$(x+2)$",
                r"$(x-2)(x+2)(x^2-4)$",
              ],
              "correctAnswers": {"0": r"$x^2-4$"},
              "explanation":
                  r'''$x^2-4 = (x-2)(x+2)$ ครอบคลุมทั้งสามตัวส่วนแล้ว ไม่ต้องคูณเพิ่ม''',
            },
            {
              "questionId": "lim_poly_ddq_033_s2",
              "content": [
                r'''แปลงแต่ละเศษส่วนให้มีตัวส่วน $x^2-4$

$\dfrac{2}{x-2} = \dfrac{2(x+2)}{x^2-4}$, $\quad \dfrac{1}{x+2} = \dfrac{x-2}{x^2-4}$, $\quad \dfrac{8}{x^2-4} = \dfrac{8}{x^2-4}$

รวมเศษทั้งหมด: $2(x+2) + (x-2) - 8 =$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$3x-6$",
                r"$3x+6$",
                r"$3x-2$",
                r"$x-6$",
              ],
              "correctAnswers": {"0": r"$3x-6$"},
              "explanation":
                  r'''$2x+4+x-2-8 = 3x-6$''',
            },
            {
              "questionId": "lim_poly_ddq_033_s3",
              "content": [
                r'''ได้ $\dfrac{3x-6}{x^2-4}$ ซึ่งอยู่ในรูปที่แยกตัวประกอบได้แล้ว

$3x-6 = 3(x-2)$ และ $x^2-4 = (x-2)(x+2)$

ตัด $(x-2)$ ออก เหลือ''',
                {"drop": "0"},
                r'''แทน $x=2$ ได้คำตอบ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{3}{x+2}$",
                r"$\dfrac{3}{x-2}$",
                r"$3(x+2)$",
                r"$\dfrac{3}{4}$",
                r"$\dfrac{3}{2}$",
                r"$3$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{3}{x+2}$",
                "1": r"$\dfrac{3}{4}$",
              },
              "explanation":
                  r'''$\dfrac{3(x-2)}{(x-2)(x+2)} = \dfrac{3}{x+2}$ แทน $x=2$ → $\dfrac{3}{4}$''',
            },
          ],
        }),
        ContentBlock("lim_poly_h_034", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_035", "question_choice", {
          "content": [
            r'''1. จงหา

$$\lim\limits_{x \to 1} \left(\dfrac{1}{x-1} - \dfrac{2}{x^2-1}\right)$$

Note = คำใบ้

$x^2-1 = (x-1)(x+1)$ ใช้เป็น LCD ได้''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation":
              r'''แทน $x=1$ → $\dfrac{1}{0} - \dfrac{2}{0}$ = $\infty - \infty$ ต้องจัดรูป

LCD = $x^2-1 = (x-1)(x+1)$

$\dfrac{x+1}{x^2-1} - \dfrac{2}{x^2-1} = \dfrac{x+1-2}{x^2-1} = \dfrac{x-1}{(x-1)(x+1)}$

ตัด $(x-1)$ → $\dfrac{1}{x+1}$

แทน $x=1$ → $\dfrac{1}{2}$''',
        }),
        ContentBlock("q_lim_poly_036", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to 2} \left(\dfrac{1}{x-2} + \dfrac{1}{x+2} - \dfrac{4}{x^2-4}\right)$$''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"$1$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation":
              r'''แทน $x=2$ → $\infty + c - \infty$ = $\infty - \infty$ ต้องจัดรูป

LCD = $x^2-4 = (x-2)(x+2)$

$\dfrac{x+2}{x^2-4} + \dfrac{x-2}{x^2-4} - \dfrac{4}{x^2-4} = \dfrac{x+2+x-2-4}{x^2-4} = \dfrac{2x-4}{x^2-4}$

$= \dfrac{2(x-2)}{(x-2)(x+2)}$ ตัด $(x-2)$ → $\dfrac{2}{x+2}$

แทน $x=2$ → $\dfrac{2}{4} = \dfrac{1}{2}$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 4: วิธีที่ 2 เมื่อมี √ หรือ ∛
    // ==========================================
    ContentSection(
      headerL1: r"วิธีที่ 2: เมื่อมี √ หรือ ∛",
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

Conjugate ของ $a-b$ คือ $a+b$ — แค่เปลี่ยนเครื่องหมายตรงกลาง''',
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
          "title": r"ฝึก √",
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
              r'''แทน $x=3$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ ที่ส่วน → Conjugate ส่วน

คูณด้วย $\dfrac{\sqrt{x+1}+2}{\sqrt{x+1}+2}$

ส่วน: $(\sqrt{x+1})^2-4 = x+1-4 = x-3$

ตัด $(x-3)$ → เหลือ $\sqrt{x+1}+2$

แทน $x=3$ → $\sqrt{4}+2 = 4$''',
        }),
        ContentBlock("lim_poly_h_040", "header", {
          "title": r"เมื่อมี ∛ — ใช้หลักเดิม แต่สูตรต่างกัน",
          "level": 2,
        }),
        ContentBlock("lim_poly_t_041", "text", {
          "content": [
            r'''$\sqrt{\ }$ ยกกำลัง 2 หาย → ใช้ $(a-b)(a+b) = a^2-b^2$

$\sqrt[3]{\ }$ ยกกำลัง 3 หาย → ใช้ $(a-b)(a^2+ab+b^2) = a^3-b^3$

สูตรนี้เคยเรียนในเรื่องจำนวนจริงแล้ว แค่นำมาใช้กับ $\sqrt[3]{\ }$''',
          ],
        }),
        ContentBlock("lim_poly_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lim_poly_ddq_042_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 8} \dfrac{\sqrt[3]{x}-2}{x-8}$

แทน $x=8$: เศษ $= 2-2 = 0$, ส่วน $= 0$ → $\dfrac{0}{0}$ ต้องจัดรูป

ต้องการให้ $\sqrt[3]{x}$ หายไป ต้องยกกำลัง''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$3$", r"$2$", r"$\dfrac{1}{3}$", r"$6$"],
              "correctAnswers": {"0": r"$3$"},
              "explanation": r'''$\left(\sqrt[3]{x}\right)^3 = x$ ยกกำลัง 3 ถึงจะหาย''',
            },
            {
              "questionId": "lim_poly_ddq_042_s2",
              "content": [
                r'''ให้ $a = \sqrt[3]{x}$, $b = 2$ แทนในสูตร $a^3-b^3 = (a-b)(a^2+ab+b^2)$

$x - 8 = (\sqrt[3]{x})^3 - 2^3 = (\sqrt[3]{x}-2) \times$''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$(\sqrt[3]{x^2}+2\sqrt[3]{x}+4)$",
                r"$(\sqrt[3]{x^2}-2\sqrt[3]{x}+4)$",
                r"$(\sqrt[3]{x}+2)$",
                r"$(x+2)$",
              ],
              "correctAnswers": {"0": r"$(\sqrt[3]{x^2}+2\sqrt[3]{x}+4)$"},
              "explanation":
                  r'''$a^2+ab+b^2$ ที่นี่คือ $(\sqrt[3]{x})^2 + 2\sqrt[3]{x} + 4 = \sqrt[3]{x^2}+2\sqrt[3]{x}+4$''',
            },
            {
              "questionId": "lim_poly_ddq_042_s3",
              "content": [
                r'''$\dfrac{\sqrt[3]{x}-2}{x-8} = \dfrac{\sqrt[3]{x}-2}{(\sqrt[3]{x}-2)(\sqrt[3]{x^2}+2\sqrt[3]{x}+4)}$

ตัด $(\sqrt[3]{x}-2)$ ออก เหลือ $\dfrac{1}{\sqrt[3]{x^2}+2\sqrt[3]{x}+4}$

แทน $x=8$: $\sqrt[3]{8}=2$ → ได้คำตอบ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{12}$",
                r"$\dfrac{1}{4}$",
                r"$\dfrac{1}{6}$",
                r"$\dfrac{1}{8}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{1}{12}$"},
              "explanation":
                  r'''$\dfrac{1}{\sqrt[3]{64}+2\sqrt[3]{8}+4} = \dfrac{1}{4+4+4} = \dfrac{1}{12}$''',
            },
          ],
        }),
        ContentBlock("lim_poly_h_043", "header", {
          "title": r"ฝึก ∛",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_044", "question_choice", {
          "content": [
            r'''3. จงหา

$$\lim\limits_{x \to 1} \dfrac{\sqrt[3]{x}-1}{x-1}$$

Note = คำใบ้

$x-1 = (\sqrt[3]{x})^3 - 1^3$ ใช้สูตร $a^3-b^3$ ได้''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$\dfrac{1}{3}$", r"$\dfrac{1}{2}$", r"$1$"],
          "correct": r"$\dfrac{1}{3}$",
          "explanation":
              r'''แทน $x=1$ → $\dfrac{0}{0}$ มี $\sqrt[3]{\ }$ → ใช้สูตร $a^3-b^3$

$x-1 = (\sqrt[3]{x}-1)(\sqrt[3]{x^2}+\sqrt[3]{x}+1)$

ตัด $(\sqrt[3]{x}-1)$ → $\dfrac{1}{\sqrt[3]{x^2}+\sqrt[3]{x}+1}$

แทน $x=1$ → $\dfrac{1}{1+1+1} = \dfrac{1}{3}$''',
        }),
        ContentBlock("q_lim_poly_045", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to -1} \dfrac{x+1}{\sqrt[3]{x}+1}$$

Note = คำใบ้

$x+1 = (\sqrt[3]{x})^3 + 1^3$ ใช้สูตร $a^3+b^3$ ได้''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$\dfrac{1}{3}$", r"$1$", r"$3$"],
          "correct": r"$3$",
          "explanation":
              r'''แทน $x=-1$ → $\dfrac{0}{0}$ มี $\sqrt[3]{\ }$

$x+1 = (\sqrt[3]{x}+1)(\sqrt[3]{x^2}-\sqrt[3]{x}+1)$ ← สูตร $a^3+b^3$

ตัด $(\sqrt[3]{x}+1)$ → $\sqrt[3]{x^2}-\sqrt[3]{x}+1$

แทน $x=-1$: $\sqrt[3]{1}-\sqrt[3]{-1}+1 = 1+1+1 = 3$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 5: ฝึกรวม (ค่อยๆ เพิ่มความยาก)
    // ==========================================
    ContentSection(
      headerL1: r"ฝึกรวม",
      blocks: [
        ContentBlock("lim_poly_t_050", "text", {
          "content": [
            r'''แทนค่าดูก่อนเสมอ แล้วค่อยตัดสินใจว่าต้องทำอะไรต่อ

โจทย์จะค่อยๆ ยากขึ้น ไม่มีสูตรตายตัว — ต้องวิเคราะห์เองว่าติดอะไร''',
          ],
        }),

        // --- ระดับ 1: แยกตัวประกอบ ---
        ContentBlock("lim_poly_h_051", "header", {
          "title": r"แยกตัวประกอบ",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_052", "question_choice", {
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

        // --- ระดับ 2: Conjugate √ ---
        ContentBlock("lim_poly_h_053", "header", {
          "title": r"Conjugate √",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_054", "question_choice", {
          "content": [
            r'''2. จงหา

$$\lim\limits_{x \to 0} \dfrac{\sqrt{x+4}-2}{x}$$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$", r"หาค่าไม่ได้"],
          "correct": r"$\dfrac{1}{4}$",
          "explanation":
              r'''แทน $x=0$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → Conjugate

คูณด้วย $\dfrac{\sqrt{x+4}+2}{\sqrt{x+4}+2}$

เศษ: $(x+4)-4 = x$ → ตัด $x$ → $\dfrac{1}{\sqrt{x+4}+2}$

แทน $x=0$ → $\dfrac{1}{4}$''',
        }),
        ContentBlock("q_lim_poly_055", "question_choice", {
          "content": [
            r'''3. จงหา

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
              r'''แทน $x=1$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ → Conjugate เศษ

คูณด้วย $\dfrac{2+\sqrt{x+3}}{2+\sqrt{x+3}}$

เศษ: $4-(x+3) = 1-x = -(x-1)$

ส่วน: $x^2-1 = (x-1)(x+1)$

ตัด $(x-1)$ → $\dfrac{-1}{(x+1)(2+\sqrt{x+3})}$

แทน $x=1$ → $\dfrac{-1}{2 \times 4} = \dfrac{-1}{8}$''',
        }),

        // --- ระดับ 3: Conjugate ∛ ---
        ContentBlock("lim_poly_h_056", "header", {
          "title": r"Conjugate ∛",
          "level": 2,
        }),
        ContentBlock("q_lim_poly_057", "question_choice", {
          "content": [
            r'''4. จงหา

$$\lim\limits_{x \to 0} \dfrac{\sqrt[3]{x+1}-1}{x}$$

Note = คำใบ้

$x = (\sqrt[3]{x+1})^3 - 1$ ลองใช้สูตร $a^3-b^3$''',
          ],
          "options": [r"$\dfrac{1}{4}$", r"$\dfrac{1}{3}$", r"$\dfrac{1}{2}$", r"$1$"],
          "correct": r"$\dfrac{1}{3}$",
          "explanation":
              r'''แทน $x=0$ → $\dfrac{0}{0}$ มี $\sqrt[3]{\ }$

ให้ $a = \sqrt[3]{x+1}$, $b=1$

$x = (x+1)-1 = a^3-1 = (a-1)(a^2+a+1)$

$\dfrac{a-1}{(a-1)(a^2+a+1)} = \dfrac{1}{a^2+a+1} = \dfrac{1}{\sqrt[3]{(x+1)^2}+\sqrt[3]{x+1}+1}$

แทน $x=0$ → $\dfrac{1}{1+1+1} = \dfrac{1}{3}$''',
        }),

        // --- ระดับ 4: ต้องวิเคราะห์ว่าทำแบบไหน ---
        ContentBlock("lim_poly_h_058", "header", {
          "title": r"วิเคราะห์ก่อนว่าติดอะไร",
          "level": 2,
        }),
        ContentBlock("lim_poly_t_059", "text", {
          "content": [
            r'''โจทย์สองข้อถัดไปดูซับซ้อน แต่แทนค่าก่อนแล้วค่อยดูว่าติดอะไร

ลองหาตัวร่วมที่ทำให้ตัด $\dfrac{0}{0}$ ออกได้''',
          ],
        }),
        ContentBlock("q_lim_poly_060", "question_choice", {
          "content": [
            r'''5. จงหา

$$\lim\limits_{x \to 1} \dfrac{(\sqrt{x}-1)(3x-2)}{3x^2-x-2}$$

Note = คำใบ้

ลองแยกตัวประกอบส่วน แล้วดูว่ามีตัวใดหายกับเศษได้''',
          ],
          "options": [r"$\dfrac{1}{5}$", r"$\dfrac{1}{10}$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{2}$"],
          "correct": r"$\dfrac{1}{10}$",
          "explanation":
              r'''แทน $x=1$ → เศษ $= 0$, ส่วน $= 0$ → $\dfrac{0}{0}$

ส่วน: $3x^2-x-2 = (3x+2)(x-1)$

เศษ: $(\sqrt{x}-1)(3x-2)$ และ $x-1 = (\sqrt{x}-1)(\sqrt{x}+1)$

แทน $(x-1)$ → $\dfrac{(\sqrt{x}-1)(3x-2)}{(3x+2)(\sqrt{x}-1)(\sqrt{x}+1)}$

ตัด $(\sqrt{x}-1)$ → $\dfrac{3x-2}{(3x+2)(\sqrt{x}+1)}$

แทน $x=1$ → $\dfrac{1}{5 \times 2} = \dfrac{1}{10}$''',
        }),
        ContentBlock("q_lim_poly_061", "question_choice", {
          "content": [
            r'''6. จงหา

$$\lim\limits_{x \to 1} \dfrac{\sqrt{x}-1}{x^2+x-2}$$

Note = คำใบ้

แยกตัวประกอบส่วนก่อน แล้วดูว่าตัดกับเศษได้อย่างไร''',
          ],
          "options": [r"$\dfrac{1}{3}$", r"$\dfrac{1}{4}$", r"$\dfrac{1}{6}$", r"$\dfrac{1}{8}$"],
          "correct": r"$\dfrac{1}{6}$",
          "explanation":
              r'''แทน $x=1$ → $\dfrac{0}{0}$

ส่วน: $x^2+x-2 = (x-1)(x+2) = (\sqrt{x}-1)(\sqrt{x}+1)(x+2)$

ตัด $(\sqrt{x}-1)$ → $\dfrac{1}{(\sqrt{x}+1)(x+2)}$

แทน $x=1$ → $\dfrac{1}{2 \times 3} = \dfrac{1}{6}$''',
        }),

        // --- ระดับ 5: Conjugate ทั้งเศษและส่วน ---
        ContentBlock("lim_poly_h_062", "header", {
          "title": r"Conjugate ทั้งเศษและส่วน",
          "level": 2,
        }),
        ContentBlock("lim_poly_t_063", "text", {
          "content": [
            r'''บางข้อทั้งเศษและส่วนมี $\sqrt{\ }$ ทำให้ตัดตรงๆ ไม่ได้

ต้อง Conjugate ทั้งสองฝั่ง — ทำทีละฝั่ง ไม่ต้องทำพร้อมกัน''',
          ],
        }),
        ContentBlock("q_lim_poly_064", "question_choice", {
          "content": [
            r'''7. จงหา

$$\lim\limits_{x \to 4} \dfrac{\sqrt{x}-2}{\sqrt{x+5}-3}$$

Note = คำใบ้

Conjugate เศษก่อน → ได้ $(x-4)$ ที่เศษ แล้ว Conjugate ส่วนเพื่อได้ $(x-4)$ ที่ส่วน จึงตัดกันได้''',
          ],
          "options": [r"$\dfrac{3}{2}$", r"$1$", r"$2$", r"$\dfrac{2}{3}$"],
          "correct": r"$\dfrac{3}{2}$",
          "explanation":
              r'''แทน $x=4$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ ทั้งเศษและส่วน

คูณด้วย $\dfrac{(\sqrt{x}+2)(\sqrt{x+5}+3)}{(\sqrt{x}+2)(\sqrt{x+5}+3)}$

เศษ: $(\sqrt{x}-2)(\sqrt{x}+2) = x-4$

ส่วน: $(\sqrt{x+5}-3)(\sqrt{x+5}+3) = x+5-9 = x-4$

ตัด $(x-4)$ → $\dfrac{\sqrt{x+5}+3}{\sqrt{x}+2}$

แทน $x=4$ → $\dfrac{\sqrt{9}+3}{\sqrt{4}+2} = \dfrac{6}{4} = \dfrac{3}{2}$''',
        }),
        ContentBlock("q_lim_poly_065", "question_choice", {
          "content": [
            r'''8. จงหา

$$\lim\limits_{x \to 0} \dfrac{\sqrt{x+1}-1}{\sqrt{x+4}-2}$$''',
          ],
          "options": [r"$1$", r"$2$", r"$\dfrac{1}{2}$", r"$4$"],
          "correct": r"$2$",
          "explanation":
              r'''แทน $x=0$ → $\dfrac{0}{0}$ มี $\sqrt{\ }$ ทั้งสองฝั่ง

คูณด้วย $\dfrac{(\sqrt{x+1}+1)(\sqrt{x+4}+2)}{(\sqrt{x+1}+1)(\sqrt{x+4}+2)}$

เศษ: $(\sqrt{x+1}-1)(\sqrt{x+1}+1) = x$

ส่วน: $(\sqrt{x+4}-2)(\sqrt{x+4}+2) = x$

ตัด $x$ → $\dfrac{\sqrt{x+4}+2}{\sqrt{x+1}+1}$

แทน $x=0$ → $\dfrac{2+2}{1+1} = \dfrac{4}{2} = 2$''',
        }),
      ],
    ),

    // ==========================================
    // SECTION 6: สรุป
    // ==========================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lim_poly_t_028", "text", {
          "content": [
            r'''เมื่อแทนค่าแล้วได้ $\dfrac{0}{0}$ หรือ $\infty-\infty$ — ลิมิตอาจยังมีค่าอยู่ ต้องจัดรูปก่อน''',
          ],
        }),
        ContentBlock("lim_poly_t_029", "text", {
          "content": [
            r'''**พหุนามล้วน** → หาตัวร่วมของเศษและส่วน แยกตัวประกอบแล้วตัดออก

**เศษส่วนหลายตัวรวมกัน** → หา LCD รวมให้เป็นเศษส่วนเดียว แล้วแยกตัวประกอบต่อ

**มี $\sqrt{\ }$** → ใช้ $(a-b)(a+b) = a^2-b^2$ เพื่อยกกำลัง 2 ให้ $\sqrt{\ }$ หาย

**มี $\sqrt[3]{\ }$** → ใช้ $(a-b)(a^2+ab+b^2) = a^3-b^3$ เพื่อยกกำลัง 3 ให้ $\sqrt[3]{\ }$ หาย

Note = หลักคิดหลัก

แทนค่าก่อนเสมอ → สังเกตว่าติดอะไร → เลือกวิธีที่จะ "กำจัด" ตัวที่ติด''',
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
          "path": "graph_data_slope",
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
    // =============================================
    // SECTION 1: นิยามของอนุพันธ์
    // =============================================
    ContentSection(
      headerL1: r"📟 นิยามของอนุพันธ์",
      blocks: [
        ContentBlock("di_h_001", "header", {
          "title": r"ทบทวนจากบทที่แล้ว",
          "level": 2,
        }),
        ContentBlock("di_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เราได้เรียนการหาอนุพันธ์ด้วย**ลิมิต**

$$f'(x) = \lim\limits_{h \to 0} \dfrac{f(x + h) - f(x)}{h}$$

บทนี้จะทำให้หาอนุพันธ์ได้**รวดเร็ว**และ**ง่ายดาย**! 🚀''',
          ],
        }),
        ContentBlock("di_h_003", "header", {
          "title": r"สัญลักษณ์ที่ใช้",
          "level": 2,
        }),
        ContentBlock("di_t_004", "text", {
          "content": [
            r'''อนุพันธ์ของ $f(x)$ เขียนได้หลายแบบ หมายความ**เหมือนกัน**ทุกประการ:

🔸 $f'(x)$ อ่านว่า **เอฟ ไพรม์ ของ** $x$

🔸 $\dfrac{d}{dx}f(x)$ อ่านว่า **ดี บาย ดีเอ็กซ์** 

แปลว่า "หาอนุพันธ์เทียบกับ $x$"''',
          ],
        }),
        ContentBlock("di_t_005", "text", {
          "content": [
            r'''ถ้าเขียนฟังก์ชันเป็น $y = f(x)$ ก็เขียนได้อีกแบบ

$$\dfrac{d [f(x)]}{dx} = \dfrac{dy}{dx} = f'(x)$$

$3$ แบบนี้**เหมือนกัน** แค่เขียนคนละแบบ''',
          ],
        }),
        ContentBlock("di_ddq_006", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_006_s1",
              "content": [
                r'''จากบทที่แล้ว เราพิสูจน์แล้วว่า

$f(x) = x^2$ → $f'(x) = 2x$

ดังนั้น $\dfrac{d}{dx}(x^2) = $ ''',
                {"drop": "0"},
                r'''และ ถ้า $y = x^2$ แล้ว $\dfrac{dy}{dx} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2x$", r"$x^2$", r"$2$", r"$2x^2$"],
              "correctAnswers": {"0": r"$2x$"},
              "explanation": r'''ทั้ง $f'(x)$, $\dfrac{d}{dx}$ และ $\dfrac{dy}{dx}$ หมายถึงอนุพันธ์เหมือนกัน!''',
            },
          ],
        }),
        ContentBlock("di_q_007", "question_choice", {
          "content": [
            r'''1. ข้อใดเขียนอนุพันธ์ของ $f(x) = x^3$ ได้**ถูกต้อง**?''',
          ],
          "options": [
            r"$f'(x) = 3x^2$ เท่านั้น",
            r"$\dfrac{d}{dx}(x^3) = 3x^2$ เท่านั้น",
            r"ทั้ง $f'(x) = 3x^2$ และ $\dfrac{d}{dx}(x^3) = 3x^2$",
            r"ไม่มีข้อใดถูก",
          ],
          "correct": r"ทั้ง $f'(x) = 3x^2$ และ $\dfrac{d}{dx}(x^3) = 3x^2$",
          "explanation": r'''ทั้งสองแบบเป็นสัญลักษณ์ที่หมายถึงอนุพันธ์เหมือนกัน เขียนแบบไหนก็ได้ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: ค่าคงที่ & เลขยกกำลัง
    // =============================================
    ContentSection(
      headerL1: r"✨ ค่าคงที่ & เลขยกกำลัง",
      blocks: [
        ContentBlock("di_h_008", "header", {
          "title": r"สมบัติที่ 1 — ค่าคงที่",
          "level": 2,
        }),
        ContentBlock("di_t_009", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}(c) = 0$$

เมื่อ $c$ เป็นค่าคงที่ (ตัวเลขที่ไม่มี $x$)''',
          ],
        }),
        ContentBlock("di_t_010", "text", {
          "content": [
            r'''**📝 เช่น** $\dfrac{d}{dx}(5) = 0$ , $\dfrac{d}{dx}(100) = 0$ , $\dfrac{d}{dx}(-7) = 0$

Note = ทำไม?

อนุพันธ์ = อัตราการเปลี่ยนแปลง แต่ค่าคงที่**ไม่เปลี่ยน** → อัตราการเปลี่ยนแปลง = $0$!''',
          ],
        }),
        ContentBlock("di_h_011", "header", {
          "title": r"สมบัติที่ 2 — เลขยกกำลัง (Power Rule)",
          "level": 2,
        }),
        ContentBlock("di_t_012", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}(x^n) = nx^{n-1}$$

สำหรับทุกจำนวนจริง $n$

💬 **วิธีจำ:** "ตบเลขชี้กำลังลงมาคูณ แล้วลบ 1 จากเลขชี้กำลัง" 🎯''',
          ],
        }),
        ContentBlock("di_t_013", "text", {
          "content": [
            r'''**📝 เช่น**

$\dfrac{d}{dx}(x^2) = 2x^{2-1} = 2x$

$\dfrac{d}{dx}(x^5) = 5x^{5-1} = 5x^4$

$\dfrac{d}{dx}(x^{100}) = 100x^{99}$''',
          ],
        }),
        ContentBlock("di_t_014", "text", {
          "content": [
            r'''Note = ตรงกับที่พิสูจน์ไว้!

บทที่แล้วเราพิสูจน์ด้วยลิมิตว่า $x^2 → 2x$ และ $x^3 → 3x^2$ ซึ่งตรงกับ Power Rule ทุกอย่าง!''',
          ],
        }),
        ContentBlock("di_h_015", "header", {
          "title": r"พิสูจน์ Power Rule (optional) 🥊",
          "level": 2,
        }),
        ContentBlock("di_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_016_s1",
              "content": [
                r'''**ขั้นที่ 1:** เขียนนิยาม เมื่อ $f(x) = x^n$

$f(x) = $ ''',
                {"drop": "0"},
                r''' , $f(x + h) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$x^n$", r"$(x + h)^n$", r"$x + h$", r"$2x$"],
              "correctAnswers": {"0": r"$x^n$", "1": r"$(x + h)^n$"},
              "explanation": r'''แทนค่า $f(x) = x^n$ และ $f(x+h) = (x+h)^n$''',
            },
            {
              "questionId": "di_ddq_016_s2",
              "content": [
                r'''**ขั้นที่ 2:** ใช้ทฤษฎีทวินามกระจาย $(x+h)^n$

$(x + h)^n = x^n + nx^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots$

แทนในลิมิต:

$\lim\limits_{h \to 0} \dfrac{(x^n + nx^{n-1}h + \cdots) - x^n}{h}$

$= \lim\limits_{h \to 0} \dfrac{nx^{n-1}h + (\text{เทอมที่มี } h^2, h^3, \ldots)}{h}$

ตัด $h$ ออก แล้วแทน $h = 0$ พจน์ที่มี $h$ จะหายไป เหลือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$nx^{n-1}$", r"$x^n$", r"$0$", r"$nx^n$"],
              "correctAnswers": {"0": r"$nx^{n-1}$"},
              "explanation": r'''ตัด $h$ ออก เหลือ $nx^{n-1} + (\text{เทอมที่มี } h)$ → แทน $h=0$ ได้ $nx^{n-1}$ ตรงตามสมบัติ! 🎯''',
            },
          ],
        }),
        ContentBlock("di_h_017", "header", {
          "title": r"เลขยกกำลังเพิ่ม",
          "level": 2,
        }),
        ContentBlock("di_t_018", "text", {
          "content": [
            r'''Power Rule ใช้ได้กับ**ทุกจำนวนจริง** $n$ รวมถึงเลขลบและเศษส่วน!

🔸 $\dfrac{1}{x} = x^{-1}$ → $\dfrac{d}{dx}(x^{-1}) = -1 \cdot x^{-2} = \dfrac{-1}{x^2}$

🔸 $\sqrt{x} = x^{1/2}$ → $\dfrac{d}{dx}(x^{1/2}) = \dfrac{1}{2}x^{-1/2} = \dfrac{1}{2\sqrt{x}}$''',
          ],
        }),
        ContentBlock("di_ddq_019", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_019_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{1}{x^3}\right)$

เขียนใหม่: $\dfrac{1}{x^3} = x^{-3}$

ใช้ Power Rule: $\dfrac{d}{dx}(x^{-3}) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$-3x^{-4}$", r"$3x^{-2}$", r"$-3x^{-2}$", r"$3x^{-4}$"],
              "correctAnswers": {"0": r"$-3x^{-4}$"},
              "explanation": r'''$-3 \cdot x^{-3-1} = -3x^{-4} = \dfrac{-3}{x^4}$ 💚''',
            },
          ],
        }),
        ContentBlock("di_h_020", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("di_q_021", "question_choice", {
          "content": [
            r'''1. $\dfrac{d}{dx}(x^{10}) = ?$''',
          ],
          "options": [r"$10x^9$", r"$10x^{10}$", r"$9x^9$", r"$x^9$"],
          "correct": r"$10x^9$",
          "explanation": r'''$\dfrac{d}{dx}(x^{10}) = 10x^{10-1} = 10x^9$ 💚''',
        }),
        ContentBlock("di_q_022", "question_choice", {
          "content": [
            r'''2. $\dfrac{d}{dx}(\sqrt{x}) = ?$''',
          ],
          "options": [
            r"$\dfrac{1}{2\sqrt{x}}$",
            r"$\dfrac{1}{2} \cdot \sqrt{x}$",
            r"$\dfrac{1}{2x}$",
            r"$2\sqrt{x}$",
          ],
          "correct": r"$\dfrac{1}{2\sqrt{x}}$",
          "explanation": r'''$\sqrt{x} = x^{1/2}$ → $\dfrac{1}{2}x^{-1/2} = \dfrac{1}{2\sqrt{x}}$ 💚''',
        }),
        ContentBlock("di_q_023", "question_choice", {
          "content": [
            r'''3. $\dfrac{d}{dx}\left(\dfrac{1}{x^2}\right) = ?$''',
          ],
          "options": [
            r"$\dfrac{-2}{x^3}$",
            r"$\dfrac{2}{x^3}$",
            r"$\dfrac{-1}{x^3}$",
            r"$\dfrac{-2}{x}$",
          ],
          "correct": r"$\dfrac{-2}{x^3}$",
          "explanation": r'''$\dfrac{1}{x^2} = x^{-2}$ → $-2x^{-3} = \dfrac{-2}{x^3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: คูณค่าคงที่ & ผลบวก/ลบ
    // =============================================
    ContentSection(
      headerL1: r"⚡ คูณค่าคงที่ & ผลบวก/ลบ",
      blocks: [
        ContentBlock("di_h_024", "header", {
          "title": r"สมบัติที่ 3 — คูณด้วยค่าคงที่",
          "level": 2,
        }),
        ContentBlock("di_t_025", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}[c \cdot f(x)] = c \cdot \dfrac{d}{dx}f(x)$$

💬 **ความหมาย:** ค่าคงที่ที่คูณอยู่ **ดึงออกมาข้างนอก** ได้เลย!''',
          ],
        }),
        ContentBlock("di_ddq_026", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_026_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}(5x^2)$

ดึง $5$ ออกมา → $5 \cdot \dfrac{d}{dx}(x^2) = 5 \cdot 2x = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$10x$", r"$5x$", r"$10x^2$", r"$7x$"],
              "correctAnswers": {"0": r"$10x$"},
              "explanation": r'''$5 \cdot 2x = 10x$ 💚''',
            },
          ],
        }),
        ContentBlock("di_h_027", "header", {
          "title": r"สมบัติที่ 4 — ผลบวกและผลต่าง",
          "level": 2,
        }),
        ContentBlock("di_t_028", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}[f(x) \pm g(x)] = \dfrac{d}{dx}f(x) \pm \dfrac{d}{dx}g(x)$$

💬 **ความหมาย:** แยกหาอนุพันธ์**ทีละพจน์**ได้เลย!''',
          ],
        }),
        ContentBlock("di_t_029", "text", {
          "content": [
            r'''Note = รวมสมบัติ 1–4 เข้าด้วยกัน

สมบัติ 1–4 ทำให้เราหาอนุพันธ์ของ**พหุนามทุกตัว**ได้ทันที — แยกทีละพจน์ ดึงค่าคงที่ออก แล้วใช้ Power Rule!''',
          ],
        }),
        ContentBlock("di_h_030", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("di_ddq_031", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_031_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}(2x^3 + 5x^2 + 7x - 5)$

แยกทีละพจน์:

$\dfrac{d}{dx}(2x^3) = $ ''',
                {"drop": "0"},
                r''' , $\dfrac{d}{dx}(5x^2) = $ ''',
                {"drop": "1"},
                r''' , $\dfrac{d}{dx}(7x) = $ ''',
                {"drop": "2"},
                r''' , $\dfrac{d}{dx}(5) = $ ''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$6x^2$", r"$10x$", r"$7$", r"$0$", r"$2x^2$", r"$5$"],
              "correctAnswers": {"0": r"$6x^2$", "1": r"$10x$", "2": r"$7$", "3": r"$0$"},
              "explanation": r'''แยกทีละพจน์แล้วรวม → $6x^2 + 10x + 7$ 💚''',
            },
          ],
        }),
        ContentBlock("di_ddq_032", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_032_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{5}{x^2}\right)$

เขียนใหม่: $\dfrac{5}{x^2} = $ ''',
                {"drop": "0"},
                r'''ใช้ Power Rule: $\dfrac{d}{dx}(5x^{-2}) = 5 \cdot (-2)x^{-3} = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$5x^{-2}$", r"$5x^2$", r"$-10x^{-3}$", r"$-10x^{-1}$"],
              "correctAnswers": {"0": r"$5x^{-2}$", "1": r"$-10x^{-3}$"},
              "explanation": r'''$\dfrac{5}{x^2} = 5x^{-2}$ → $-10x^{-3} = \dfrac{-10}{x^3}$ 💚''',
            },
          ],
        }),
        ContentBlock("di_h_033", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("di_q_034", "question_choice", {
          "content": [
            r'''1. $\dfrac{d}{dx}(7x^3) = ?$''',
          ],
          "options": [r"$7x^2$", r"$21x^2$", r"$21x^3$", r"$3x^2$"],
          "correct": r"$21x^2$",
          "explanation": r'''$7 \cdot 3x^2 = 21x^2$ 💚''',
        }),
        ContentBlock("di_q_035", "question_choice", {
          "content": [
            r'''2. $\dfrac{d}{dx}(4x^5 - 3x^2 + 8) = ?$''',
          ],
          "options": [
            r"$20x^4 - 6x$",
            r"$20x^4 - 6x + 8$",
            r"$4x^4 - 3x$",
            r"$20x^5 - 6x^2$",
          ],
          "correct": r"$20x^4 - 6x$",
          "explanation": r'''$\dfrac{d}{dx}(4x^5) = 20x^4$ , $\dfrac{d}{dx}(-3x^2) = -6x$ , $\dfrac{d}{dx}(8) = 0$

รวมได้ $20x^4 - 6x$ 💚''',
        }),
        ContentBlock("di_q_036", "question_choice", {
          "content": [
            r'''3. ถ้า $f(x) = x^3 - 2x^2 + 5$ แล้ว $f'(2) = ?$''',
          ],
          "options": [r"$2$", r"$4$", r"$8$", r"$12$"],
          "correct": r"$4$",
          "explanation": r'''$f'(x) = 3x^2 - 4x$

$f'(2) = 3(4) - 4(2) = 12 - 8 = 4$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: ผลคูณ & ผลหาร
    // =============================================
    ContentSection(
      headerL1: r"✖️➗ ผลคูณ & ผลหาร",
      blocks: [
        ContentBlock("di_h_037", "header", {
          "title": r"สมบัติที่ 5 — กฎผลคูณ (Product Rule)",
          "level": 2,
        }),
        ContentBlock("di_t_038", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}[f(x) \cdot g(x)] = f(x) \cdot g'(x) + g(x) \cdot f'(x)$$

💬 **วิธีจำ: "หน้าดิฟหลัง + หลังดิฟหน้า"**''',
          ],
        }),
        ContentBlock("di_t_039", "text", {
          "content": [
            r'''Note = ระวัง!

$\dfrac{d}{dx}[f \cdot g] \neq f' \cdot g'$ — จะแยกดิฟคนละตัวแล้วคูณกันไม่ได้!''',
          ],
        }),
        ContentBlock("di_h_040", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("di_ddq_041", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_041_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}[(3x + 2)(6x + 5)]$

ให้ $f = 3x + 2$ , $g = 6x + 5$

$f' = $ ''',
                {"drop": "0"},
                r''' , $g' = $ ''',
                {"drop": "1"},
                r'''หน้าดิฟหลัง + หลังดิฟหน้า:

$= (3x + 2)(6) + (6x + 5)(3)$''',
              ],
              "draggableItems": [r"$3$", r"$6$", r"$3x$", r"$6x$"],
              "correctAnswers": {"0": r"$3$", "1": r"$6$"},
              "explanation": r'''$f' = 3$ และ $g' = 6$''',
            },
            {
              "questionId": "di_ddq_041_s2",
              "content": [
                r'''คำนวณผลลัพธ์:

$(3x + 2)(6) + (6x + 5)(3)$

$= 18x + 12 + 18x + 15 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$36x + 27$", r"$36x + 17$", r"$18x + 27$", r"$36x^2 + 27$"],
              "correctAnswers": {"0": r"$36x + 27$"},
              "explanation": r'''$18x + 12 + 18x + 15 = 36x + 27$ 💚''',
            },
          ],
        }),
        ContentBlock("di_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_042_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}[(x^2)(x^3)]$

หน้าดิฟหลัง + หลังดิฟหน้า:

$= x^2 \cdot 3x^2 + x^3 \cdot 2x = 3x^4 + 2x^4 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$5x^4$", r"$6x^4$", r"$5x^3$", r"$x^4$"],
              "correctAnswers": {"0": r"$5x^4$"},
              "explanation": r'''$3x^4 + 2x^4 = 5x^4$ 💚

🧠 **ข้อสังเกต:** $x^2 \cdot x^3 = x^5$ ดิฟตรงๆ ก็ได้ $5x^4$ เหมือนกัน!''',
            },
          ],
        }),
        ContentBlock("di_h_043", "header", {
          "title": r"สมบัติที่ 6 — กฎผลหาร (Quotient Rule)",
          "level": 2,
        }),
        ContentBlock("di_t_044", "text", {
          "content": [
            r'''$$\dfrac{d}{dx}\left[\dfrac{f(x)}{g(x)}\right] = \dfrac{g(x) \cdot f'(x) - f(x) \cdot g'(x)}{[g(x)]^2}$$

💬 **วิธีจำ: "ล่างดิฟบน − บนดิฟล่าง หารด้วยล่างกำลัง 2"**''',
          ],
        }),
        ContentBlock("di_h_045", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("di_ddq_046", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_046_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{2x + 3}{x + 1}\right)$

บน: $f = 2x + 3$ → $f' = 2$

ล่าง: $g = x + 1$ → $g' = 1$

ล่างดิฟบน − บนดิฟล่าง:

$(x + 1)(2) - (2x + 3)(1) = 2x + 2 - 2x - 3 = $ ''',
                {"drop": "0"},
                r'''หารด้วยล่าง$^2$:

$\dfrac{d}{dx}\left(\dfrac{2x + 3}{x + 1}\right) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$-1$",
                r"$1$",
                r"$5$",
                r"$\dfrac{-1}{(x + 1)^2}$",
                r"$\dfrac{1}{(x + 1)^2}$",
              ],
              "correctAnswers": {"0": r"$-1$", "1": r"$\dfrac{-1}{(x + 1)^2}$"},
              "explanation": r'''ล่างดิฟบน − บนดิฟล่าง $= -1$ หารด้วย $(x+1)^2$ ได้ $\dfrac{-1}{(x+1)^2}$ 💚''',
            },
          ],
        }),
        ContentBlock("di_ddq_047", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_047_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left(\dfrac{x^2}{x + 1}\right)$

ล่างดิฟบน − บนดิฟล่าง:

$(x+1)(2x) - (x^2)(1) = 2x^2 + 2x - x^2 = $ ''',
                {"drop": "0"},
                r'''หารด้วย $(x+1)^2$:

$= $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$x^2 + 2x$",
                r"$2x^2 + 2x$",
                r"$\dfrac{x^2 + 2x}{(x + 1)^2}$",
                r"$\dfrac{2x^2 + 2x}{(x + 1)^2}$",
              ],
              "correctAnswers": {"0": r"$x^2 + 2x$", "1": r"$\dfrac{x^2 + 2x}{(x + 1)^2}$"},
              "explanation": r'''$2x^2 + 2x - x^2 = x^2 + 2x$ หารด้วย $(x+1)^2$ 💚''',
            },
          ],
        }),
        ContentBlock("di_h_048", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("di_q_049", "question_choice", {
          "content": [
            r'''1. $\dfrac{d}{dx}[(2x - 1)(3x + 4)] = ?$''',
          ],
          "options": [r"$6x + 5$", r"$12x + 5$", r"$12x - 3$", r"$6x + 8$"],
          "correct": r"$12x + 5$",
          "explanation": r'''หน้าดิฟหลัง + หลังดิฟหน้า:

$(2x-1)(3) + (3x+4)(2) = 6x - 3 + 6x + 8 = 12x + 5$ 💚''',
        }),
        ContentBlock("di_q_050", "question_choice", {
          "content": [
            r'''2. $\dfrac{d}{dx}\left(\dfrac{3x - 2}{x + 5}\right) = ?$''',
          ],
          "options": [
            r"$\dfrac{17}{(x + 5)^2}$",
            r"$\dfrac{-17}{(x + 5)^2}$",
            r"$\dfrac{13}{(x + 5)^2}$",
            r"$\dfrac{3}{(x + 5)^2}$",
          ],
          "correct": r"$\dfrac{17}{(x + 5)^2}$",
          "explanation": r'''ล่างดิฟบน − บนดิฟล่าง:

$(x+5)(3) - (3x-2)(1) = 3x + 15 - 3x + 2 = 17$

หารด้วย $(x+5)^2$ ได้ $\dfrac{17}{(x+5)^2}$ 💚''',
        }),
        ContentBlock("di_q_051", "question_choice", {
          "content": [
            r'''3. จงหาความชันของเส้นสัมผัส $y = x^2 + 3x - 1$ ที่ $x = 1$''',
          ],
          "options": [r"$3$", r"$4$", r"$5$", r"$6$"],
          "correct": r"$5$",
          "explanation": r'''$\dfrac{dy}{dx} = 2x + 3$

ที่ $x = 1$: $2(1) + 3 = 5$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดรวม (โจทย์ยาก)
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("di_t_052", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้จะ**ยากขึ้น** ต้องใช้หลายสมบัติร่วมกัน ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("di_ddq_053", "drag_and_drop", {
          "steps": [
            {
              "questionId": "di_ddq_053_s1",
              "content": [
                r'''1. จงหา $\dfrac{d}{dx}\left(\dfrac{x^3 - 4x}{2}\right)$

Note = คำใบ้: ดึง $\dfrac{1}{2}$ ออกมาก่อน!

$= \dfrac{1}{2} \cdot \dfrac{d}{dx}(x^3 - 4x) = \dfrac{1}{2}(3x^2 - 4) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{3x^2 - 4}{2}$",
                r"$3x^2 - 4$",
                r"$\dfrac{3x^2}{2}$",
                r"$\dfrac{x^2 - 4}{2}$",
              ],
              "correctAnswers": {"0": r"$\dfrac{3x^2 - 4}{2}$"},
              "explanation": r'''ดึง $\dfrac{1}{2}$ ออก แล้วดิฟทีละพจน์ ง่ายกว่าใช้ Quotient Rule! 💚''',
            },
          ],
        }),
        ContentBlock("di_q_054", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = x^4 - 8x^2 + 16$

จงหาค่า $x$ ที่ $f'(x) = 0$''',
          ],
          "options": [
            r"$x = 0, \pm 2$",
            r"$x = 0, \pm 4$",
            r"$x = \pm 2$ เท่านั้น",
            r"$x = 0$ เท่านั้น",
          ],
          "correct": r"$x = 0, \pm 2$",
          "explanation": r'''$f'(x) = 4x^3 - 16x = 4x(x^2 - 4) = 4x(x-2)(x+2)$

$f'(x) = 0$ เมื่อ $x = 0, 2, -2$ 💚

🧠 **ข้อสังเกต:** จุดที่ $f'(x) = 0$ คือจุดที่กราฟมีความชัน $= 0$ (จุดสูงสุด/ต่ำสุด) — จะได้เรียนเพิ่มเติมในบทถัดๆ ไป!''',
        }),
        ContentBlock("di_q_055", "question_choice", {
          "content": [
            r'''3. จงหา $\dfrac{d}{dx}\left[(x^2 + 1)(x^2 - 1)\right]$''',
          ],
          "options": [r"$4x^3$", r"$4x^3 - 2x$", r"$2x \cdot 2x$", r"$4x$"],
          "correct": r"$4x^3$",
          "explanation": r'''**วิธี 1:** Product Rule

$(x^2+1)(2x) + (x^2-1)(2x) = 2x^3 + 2x + 2x^3 - 2x = 4x^3$

**วิธี 2:** กระจายก่อน

$(x^2+1)(x^2-1) = x^4 - 1$ → $\dfrac{d}{dx}(x^4 - 1) = 4x^3$ 💚

🧠 บางทีกระจายก่อนแล้วดิฟง่ายกว่า!''',
        }),
        ContentBlock("di_q_056", "question_choice", {
          "content": [
            r'''4. จงหา $\dfrac{d}{dx}\left(\dfrac{x^2 + 3x - 10}{x - 2}\right)$

Note = คำใบ้: ลองแยกตัวประกอบเศษก่อน!''',
          ],
          "options": [r"$0$", r"$1$", r"$2x + 3$", r"$\dfrac{2x + 3}{(x-2)^2}$"],
          "correct": r"$1$",
          "explanation": r'''แยกตัวประกอบเศษ: $x^2 + 3x - 10 = (x+5)(x-2)$

$\dfrac{(x+5)(x-2)}{x-2} = x + 5$

$\dfrac{d}{dx}(x + 5) = 1$ 💚

🧠 **จัดรูปก่อนดิฟ** ช่วยให้ง่ายขึ้นมาก!''',
        }),
        ContentBlock("di_q_057", "question_choice", {
          "content": [
            r'''5. ให้ $f(x) = (2x + 1)(x^2 - 3)$

จงหา $f'(1)$''',
          ],
          "options": [r"$-2$", r"$0$", r"$2$", r"$8$"],
          "correct": r"$2$",
          "explanation": r'''Product Rule: $f'(x) = (2x+1)(2x) + (x^2-3)(2)$

$= 4x^2 + 2x + 2x^2 - 6 = 6x^2 + 2x - 6$

$f'(1) = 6(1) + 2(1) - 6 = 2$ 💚''',
        }),
        ContentBlock("di_q_058", "question_choice", {
          "content": [
            r'''6. จงหา $\dfrac{d}{dx}\left(\dfrac{x^3 + 1}{x + 1}\right)$

Note = คำใบ้: $x^3 + 1 = (x+1)(x^2 - x + 1)$''',
          ],
          "options": [r"$2x - 1$", r"$3x^2$", r"$x^2 - x + 1$", r"$\dfrac{3x^2}{(x+1)^2}$"],
          "correct": r"$2x - 1$",
          "explanation": r'''แยกตัวประกอบ: $\dfrac{(x+1)(x^2 - x + 1)}{x + 1} = x^2 - x + 1$

$\dfrac{d}{dx}(x^2 - x + 1) = 2x - 1$ 💚''',
        }),
        ContentBlock("di_q_059", "question_choice", {
          "content": [
            r'''7. ให้ $f(x) = 3\sqrt{x} + \dfrac{2}{x}$

จงหา $f'(4)$''',
          ],
          "options": [
            r"$\dfrac{5}{8}$",
            r"$\dfrac{3}{4}$",
            r"$\dfrac{7}{8}$",
            r"$\dfrac{1}{2}$",
          ],
          "correct": r"$\dfrac{5}{8}$",
          "explanation": r'''เขียนใหม่: $f(x) = 3x^{1/2} + 2x^{-1}$

$f'(x) = 3 \cdot \dfrac{1}{2}x^{-1/2} + 2 \cdot (-1)x^{-2} = \dfrac{3}{2\sqrt{x}} - \dfrac{2}{x^2}$

$f'(4) = \dfrac{3}{2\sqrt{4}} - \dfrac{2}{16} = \dfrac{3}{4} - \dfrac{1}{8} = \dfrac{6}{8} - \dfrac{1}{8} = \dfrac{5}{8}$ 💚''',
        }),
        ContentBlock("di_q_060", "question_choice", {
          "content": [
            r'''8. เส้นสัมผัสของ $y = \dfrac{x^2 + 2}{x}$ ที่ $x = 1$ มีความชันเท่าไร?
            
Note = คำใบ้
            
$f'(x)$ คือ ความชัน ณ จุด $x$''',
          ],
          "options": [r"$-1$", r"$0$", r"$1$", r"$3$"],
          "correct": r"$-1$",
          "explanation": r'''จัดรูปก่อน: $\dfrac{x^2 + 2}{x} = x + 2x^{-1}$

$\dfrac{dy}{dx} = 1 - 2x^{-2} = 1 - \dfrac{2}{x^2}$

ที่ $x = 1$: $1 - \dfrac{2}{1} = 1 - 2 = -1$ 💚

🧠 จัดรูปก่อนดิฟง่ายกว่าใช้ Quotient Rule!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("di_t_061", "text", {
          "content": [
            r'''🎯 **6 สมบัติสำคัญของอนุพันธ์**

**1. ค่าคงที่:** $\dfrac{d}{dx}(c) = 0$

**2. เลขยกกำลัง:** $\dfrac{d}{dx}(x^n) = nx^{n-1}$ — ตบลงมาคูณ ลบ 1

**3. คูณค่าคงที่:** $\dfrac{d}{dx}[c \cdot f(x)] = c \cdot f'(x)$ — ดึงออกมาได้''',
          ],
        }),
        ContentBlock("di_t_062", "text", {
          "content": [
            r'''**4. ผลบวก/ลบ:** $\dfrac{d}{dx}[f \pm g] = f' \pm g'$ — แยกทีละพจน์ได้

**5. ผลคูณ:** $\dfrac{d}{dx}[f \cdot g] = f \cdot g' + g \cdot f'$ — หน้าดิฟหลัง + หลังดิฟหน้า

**6. ผลหาร:** $\dfrac{d}{dx}\left[\dfrac{f}{g}\right] = \dfrac{g \cdot f' - f \cdot g'}{g^2}$ — ล่างดิฟบน − บนดิฟล่าง หารล่าง$^2$''',
          ],
        }),
        ContentBlock("di_t_063", "text", {
          "content": [
            r'''Note = เทคนิคสำคัญ

🔸 เจอเศษส่วนที่ส่วนเป็นค่าคงที่ เช่น $\dfrac{x^3}{2}$ → ดึงค่าคงที่ออก ไม่ต้องใช้ Quotient Rule

🔸 เจอ $\dfrac{1}{x^n}$ → เขียนเป็น $x^{-n}$ แล้วใช้ Power Rule

🔸 เจอเศษที่แยกตัวประกอบตัดกับส่วนได้ → **จัดรูปก่อนดิฟ** ง่ายกว่าเสมอ!''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: แบบฝึกหัดเรื่องความต่อเนื่อง (แบบฝึกหัดเรื่องความต่อเนื่อง)

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

final calcChainRuleLesson = ContentLesson(
  title: "กฎลูกโซ่ (Chain Rule)",
  sections: [

    // =============================================
    // SECTION 1: Chain Rule — แนวคิดแทนตัวแปร
    // =============================================
    ContentSection(
      headerL1: r"🔗 Chain Rule — แนวคิดแทนตัวแปร",
      blocks: [
        ContentBlock("cr_h_001", "header", {
          "title": r"Power Rule ยังไม่พอ",
          "level": 2,
        }),
        ContentBlock("cr_t_002", "text", {
          "content": [
            r'''เรารู้แล้วว่า $\dfrac{d}{dx}(x^5) = 5x^4$ จาก Power Rule

แต่ถ้าข้างในไม่ใช่ $x$ เปล่าๆ ล่ะ?

$$\dfrac{d}{dx}\left[(3x + 2)^5\right] = ?$$''',
          ],
        }),
        ContentBlock("cr_t_003", "text", {
          "content": [
            r'''ถ้าใช้ Power Rule ตรงๆ ได้ $5(3x+2)^4$ — แต่นี่**ยังไม่ครบ!**

เพราะ $3x+2$ ก็เปลี่ยนแปลงตาม $x$ ด้วย เราต้องคำนึงถึงส่วนนั้นด้วยเสมอ''',
          ],
        }),
        ContentBlock("cr_h_004", "header", {
          "title": r"แนวคิด: แทนส่วนที่ซับซ้อนด้วยตัวแปรใหม่",
          "level": 2,
        }),
        ContentBlock("cr_t_005", "text", {
          "content": [
            r'''ลองตั้ง $t = 3x+2$ — ทันทีที่แทน $(3x+2)^5$ กลายเป็น $t^5$

ตอนนี้เรามี $y = t^5$ ซึ่งดิฟเทียบ $t$ ได้ และ $t = 3x+2$ ซึ่งดิฟเทียบ $x$ ได้''',
          ],
        }),
        ContentBlock("cr_t_006", "text", {
          "content": [
            r'''แต่เราต้องการ $\dfrac{dy}{dx}$ ไม่ใช่ $\dfrac{dy}{dt}$

**กฎลูกโซ่ (Chain Rule)** แก้ปัญหานี้:

$$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$$''',
          ],
        }),
        ContentBlock("cr_t_007", "text", {
          "content": [
            r'''Note = Chain Rule คืออะไร?

Chain Rule คือวิธีหาอนุพันธ์ของ**ฟังก์ชันที่ซ้อนกัน** โดยแยกดิฟทีละส่วน แล้วคูณผลลัพธ์เข้าด้วยกัน

ใช้ทุกครั้งที่ส่วนข้างในไม่ใช่ $x$ เปล่าๆ''',
          ],
        }),
        ContentBlock("cr_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_008_s1",
              "content": [
                r'''มาหา $\dfrac{d}{dx}\left[(3x+2)^5\right]$ โดยตั้ง $t = 3x+2$ , $y = t^5$

$\dfrac{dy}{dt} = $ ''',
                {"drop": "0"},
                r'''  (ดิฟ $t^5$ เทียบ $t$)

$\dfrac{dt}{dx} = $ ''',
                {"drop": "1"},
                r'''  (ดิฟ $3x+2$ เทียบ $x$)''',
              ],
              "draggableItems": [r"$5t^4$", r"$3$", r"$5$", r"$2$"],
              "correctAnswers": {"0": r"$5t^4$", "1": r"$3$"},
              "explanation": r'''$\dfrac{d}{dt}(t^5) = 5t^4$ และ $\dfrac{d}{dx}(3x+2) = 3$''',
            },
            {
              "questionId": "cr_ddq_008_s2",
              "content": [
                r'''คูณตาม Chain Rule แล้วแทน $t = 3x+2$ กลับ

$\dfrac{dy}{dx} = 5t^4 \times 3 = 15t^4 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$15(3x+2)^4$",
                r"$5(3x+2)^4$",
                r"$15(3x+2)^5$",
                r"$15x^4$",
              ],
              "correctAnswers": {"0": r"$15(3x+2)^4$"},
              "explanation": r'''แทน $t = 3x+2$ กลับ: $15t^4 = 15(3x+2)^4$ 💚''',
            },
          ],
        }),
        ContentBlock("cr_h_009", "header", {
          "title": r"ลองกับตัวอย่างที่ซับซ้อนขึ้น",
          "level": 2,
        }),
        ContentBlock("cr_t_010", "text", {
          "content": [
            r'''แนวคิดเดิม: มองหาส่วนที่ทำให้ดิฟตรงๆ ไม่ได้ แล้วตั้งเป็น $t$

ส่วนนั้นมักอยู่**ในวงเล็บ** หรือ**ใต้ราก** — นั่นแหละที่ควรแทน''',
          ],
        }),
        ContentBlock("cr_ddq_011", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_011_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left[(x^2 + 1)^3\right]$

ส่วนที่ซับซ้อนคือ $x^2+1$ → ตั้ง $t = $ ''',
                {"drop": "0"},
                r'''  แล้ว $y = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$x^2 + 1$", r"$t^3$", r"$x^2$", r"$(x^2+1)^3$"],
              "correctAnswers": {"0": r"$x^2 + 1$", "1": r"$t^3$"},
              "explanation": r'''แทน $x^2+1 = t$ ทำให้ $y = t^3$ ซึ่งดิฟได้ทันที''',
            },
            {
              "questionId": "cr_ddq_011_s2",
              "content": [
                r'''$\dfrac{dy}{dt} = 3t^2$  ,  $\dfrac{dt}{dx} = $ ''',
                {"drop": "0"},
                r'''คูณกัน แล้วแทน $t = x^2+1$ กลับ:

$3t^2 \times \dfrac{dt}{dx} = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$2x$",
                r"$6x(x^2+1)^2$",
                r"$3x^2$",
                r"$3(x^2+1)^2$",
              ],
              "correctAnswers": {"0": r"$2x$", "1": r"$6x(x^2+1)^2$"},
              "explanation": r'''$\dfrac{dt}{dx} = 2x$ → $3t^2 \times 2x = 6x(x^2+1)^2$ 💚''',
            },
          ],
        }),
        ContentBlock("cr_h_012", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("cr_q_013", "question_choice", {
          "content": [
            r'''1. จงหา $\dfrac{d}{dx}\left[(4x+1)^3\right]$''',
          ],
          "options": [
            r"$3(4x+1)^2$",
            r"$12(4x+1)^2$",
            r"$12(4x+1)^3$",
            r"$4(4x+1)^2$",
          ],
          "correct": r"$12(4x+1)^2$",
          "explanation": r'''ตั้ง $t = 4x+1$ , $y = t^3$

$\dfrac{dy}{dt} = 3t^2$ , $\dfrac{dt}{dx} = 4$

$\dfrac{dy}{dx} = 3t^2 \times 4 = 12(4x+1)^2$ 💚''',
        }),
        ContentBlock("cr_q_014", "question_choice", {
          "content": [
            r'''2. จงหา $\dfrac{d}{dx}\left[\sqrt{2x + 3}\right]$

Note = คำใบ้: $\sqrt{2x+3} = (2x+3)^{1/2}$ ตั้ง $t = 2x+3$''',
          ],
          "options": [
            r"$\dfrac{1}{\sqrt{2x+3}}$",
            r"$\dfrac{1}{2\sqrt{2x+3}}$",
            r"$\dfrac{2}{\sqrt{2x+3}}$",
            r"$\sqrt{2x+3}$",
          ],
          "correct": r"$\dfrac{1}{\sqrt{2x+3}}$",
          "explanation": r'''ตั้ง $t = 2x+3$ , $y = t^{1/2}$

$\dfrac{dy}{dt} = \dfrac{1}{2}t^{-1/2}$ , $\dfrac{dt}{dx} = 2$

$\dfrac{dy}{dx} = \dfrac{1}{2}t^{-1/2} \times 2 = \dfrac{1}{\sqrt{2x+3}}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: ทำไม Chain Rule ถึงได้ผล?
    // =============================================
    ContentSection(
      headerL1: r"💡 ทำไม Chain Rule ถึงได้ผล?",
      blocks: [
        ContentBlock("cr_h_015", "header", {
          "title": r"นึกภาพ — อัตราการเปลี่ยนแปลงซ้อนกัน",
          "level": 2,
        }),
        ContentBlock("cr_t_016", "text", {
          "content": [
            r'''ลองนึกภาพแบบนี้:

🔸 $t$ เปลี่ยน **3 หน่วย** เมื่อ $x$ เปลี่ยน 1 หน่วย → $\dfrac{dt}{dx} = 3$

🔸 $y$ เปลี่ยน **4 หน่วย** เมื่อ $t$ เปลี่ยน 1 หน่วย → $\dfrac{dy}{dt} = 4$''',
          ],
        }),
        ContentBlock("cr_t_017", "text", {
          "content": [
            r'''ถ้า $x$ เปลี่ยน 1 หน่วย → $t$ เพิ่มขึ้น 3 หน่วย → $y$ เพิ่มขึ้น $4 \times 3 = 12$ หน่วย

ดังนั้น $\dfrac{dy}{dx} = 12 = 4 \times 3 = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$ 🎯''',
          ],
        }),
        ContentBlock("cr_t_018", "text", {
          "content": [
            r'''Note = ที่มาของสูตร

ดูสูตรเหมือนตัด $dt$ ออก: $\dfrac{dy}{\cancel{dt}} \cdot \dfrac{\cancel{dt}}{dx} = \dfrac{dy}{dx}$

แม้ $\dfrac{dy}{dt}$ จะไม่ใช่เศษส่วนธรรมดา แต่มีสมบัติ**เหมือนเศษส่วน** และพิสูจน์ได้ด้วยลิมิต ✨''',
          ],
        }),
        ContentBlock("cr_ig_019", "interactive_graph", {
          "path": "graph_data_15",
        }),
        ContentBlock("cr_t_020", "text", {
          "content": [
            r'''ลองเลื่อน slider เพื่อเปลี่ยน $x$ สังเกตว่า $t$ เปลี่ยน แล้ว $y$ ก็เปลี่ยนตาม

ค่า $\dfrac{dy}{dx}$ ที่แต่ละจุดเท่ากับผลคูณ $\dfrac{dy}{dt} \times \dfrac{dt}{dx}$ เสมอ''',
          ],
        }),
        ContentBlock("cr_h_021", "header", {
          "title": r"เชื่อมกลับกับตัวอย่างที่ทำไป",
          "level": 2,
        }),
        ContentBlock("cr_ddq_022", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_022_s1",
              "content": [
                r'''กลับมาดู $(3x+2)^5$ กับ $t = 3x+2$ , $y = t^5$

$\dfrac{dt}{dx} = 3$ หมายความว่า: $x$ เพิ่ม 1 หน่วย → $t$ เพิ่ม ''',
                {"drop": "0"},
                r''' หน่วย

$\dfrac{dy}{dt} = 5t^4$ หมายความว่า: $t$ เพิ่ม 1 หน่วย → $y$ เพิ่ม $5t^4$ หน่วย

ดังนั้น $x$ เพิ่ม 1 หน่วย → $y$ เพิ่ม $5t^4 \times 3 = $ ''',
                {"drop": "1"},
                r''' หน่วย — นี่คือ $\dfrac{dy}{dx}$ ที่เราคำนวณได้ตั้งแต่ต้น!''',
              ],
              "draggableItems": [r"$3$", r"$15t^4$", r"$5t^4$", r"$5$"],
              "correctAnswers": {"0": r"$3$", "1": r"$15t^4$"},
              "explanation": r'''"$x$ เพิ่ม 1 → $t$ เพิ่ม 3 → $y$ เพิ่ม $5t^4 \times 3 = 15t^4$"

นี่คือสาระสำคัญของ Chain Rule 💚''',
            },
          ],
        }),
        ContentBlock("cr_q_023", "question_choice", {
          "content": [
            r'''1. ถ้า $\dfrac{dy}{dt} = 6t^2$ และ $\dfrac{dt}{dx} = 4x$

แล้ว $\dfrac{dy}{dx} = ?$''',
          ],
          "options": [
            r"$24t^2x$",
            r"$6t^2 + 4x$",
            r"$24t^2$",
            r"$24x$",
          ],
          "correct": r"$24t^2x$",
          "explanation": r'''$\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx} = 6t^2 \times 4x = 24t^2x$ 💚

🧠 **ข้อสังเกต:** ผลลัพธ์ยังมีทั้ง $t$ และ $x$ อยู่ — ในทางปฏิบัติเราจะแทน $t = g(x)$ กลับเพื่อให้เป็น $x$ ล้วนๆ''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: Chain Rule แบบเร็ว
    // =============================================
    ContentSection(
      headerL1: r"⚡ Chain Rule แบบเร็ว — สูตรเดียวกัน เขียนต่างกัน",
      blocks: [
        ContentBlock("cr_h_024", "header", {
          "title": r"จากสูตรแทนตัวแปร สู่สูตรย่อ",
          "level": 2,
        }),
        ContentBlock("cr_t_025", "text", {
          "content": [
            r'''สูตรแทนตัวแปร: $\dfrac{dy}{dx} = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$

เมื่อ $y = f(t)$ และ $t = g(x)$:

🔸 $\dfrac{dy}{dt} = f'(t)$ — แต่เมื่อแทน $t = g(x)$ กลับ จะได้ $f'(g(x))$

🔸 $\dfrac{dt}{dx} = g'(x)$''',
          ],
        }),
        ContentBlock("cr_t_026", "text", {
          "content": [
            r'''ดังนั้นสูตรเขียนสั้นได้เป็น

$$\dfrac{d}{dx}\left[f(g(x))\right] = f'(g(x)) \cdot g'(x)$$

**สูตรนี้เหมือนเดิมทุกอย่าง** แค่รวมขั้นตอนแทน $t$ กลับเข้าไปในสูตรเลย ไม่ต้องเขียนตั้ง $t$ แยก''',
          ],
        }),
        ContentBlock("cr_t_027", "text", {
          "content": [
            r'''Note = จำง่ายๆ ว่า "ดิฟนอก × ดิฟใน"

🔸 **ดิฟนอก** = $f'(g(x))$ หาอนุพันธ์ของฟังก์ชันชั้นนอก **แต่เก็บส่วนข้างในไว้เหมือนเดิม**

🔸 **ดิฟใน** = $g'(x)$ หาอนุพันธ์ของส่วนข้างใน''',
          ],
        }),
        ContentBlock("cr_ddq_028", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_028_s1",
              "content": [
                r'''มาเปรียบเทียบสองวิธีสำหรับ $(3x+2)^5$:

**วิธีแทนตัวแปร:** $t=3x+2$, $y=t^5$ → $5t^4 \times 3$ → แทน $t$ กลับ $= 15(3x+2)^4$

**วิธีสูตรย่อ** — ดิฟนอก × ดิฟใน:

ดิฟนอก (ดิฟ $(\square)^5$ เก็บข้างในไว้) $= $ ''',
                {"drop": "0"},
                r'''ดิฟใน (ดิฟ $3x+2$) $= $ ''',
                {"drop": "1"},
                r'''ผลคูณ $= $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$5(3x+2)^4$",
                r"$3$",
                r"$15(3x+2)^4$",
                r"$5$",
              ],
              "correctAnswers": {
                "0": r"$5(3x+2)^4$",
                "1": r"$3$",
                "2": r"$15(3x+2)^4$",
              },
              "explanation": r'''ทั้งสองวิธีได้ $15(3x+2)^4$ เหมือนกัน!

วิธีสูตรย่อเร็วกว่าเพราะไม่ต้องตั้ง $t$ แยก — เลือกใช้แบบที่ถนัด 💚''',
            },
          ],
        }),
        ContentBlock("cr_h_029", "header", {
          "title": r"ฝึกด้วยสูตรเร็ว",
          "level": 2,
        }),
        ContentBlock("cr_ddq_030", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_030_s1",
              "content": [
                r'''จงหา $\dfrac{d}{dx}\left[(x^2+1)^{-2}\right]$ ด้วยสูตรเร็ว

ดิฟนอก (ดิฟ $(\square)^{-2}$ เก็บข้างในไว้): ''',
                {"drop": "0"},
                r'''ดิฟใน (ดิฟ $x^2+1$): ''',
                {"drop": "1"},
                r'''ผลลัพธ์: ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$-2(x^2+1)^{-3}$",
                r"$2x$",
                r"$-4x(x^2+1)^{-3}$",
                r"$2(x^2+1)^{-3}$",
              ],
              "correctAnswers": {
                "0": r"$-2(x^2+1)^{-3}$",
                "1": r"$2x$",
                "2": r"$-4x(x^2+1)^{-3}$",
              },
              "explanation":
                  r'''$-2(x^2+1)^{-3} \times 2x = -4x(x^2+1)^{-3} = \dfrac{-4x}{(x^2+1)^3}$ 💚''',
            },
          ],
        }),
        ContentBlock("cr_q_031", "question_choice", {
          "content": [
            r'''1. $\dfrac{d}{dx}\left[(2x^2 - 1)^5\right] = ?$''',
          ],
          "options": [
            r"$5(2x^2-1)^4$",
            r"$10x(2x^2-1)^4$",
            r"$20x(2x^2-1)^4$",
            r"$20(2x^2-1)^4$",
          ],
          "correct": r"$20x(2x^2-1)^4$",
          "explanation": r'''ดิฟนอก: $5(2x^2-1)^4$  ,  ดิฟใน: $4x$

$5(2x^2-1)^4 \times 4x = 20x(2x^2-1)^4$ 💚''',
        }),
        ContentBlock("cr_q_032", "question_choice", {
          "content": [
            r'''2. $\dfrac{d}{dx}\left[\sqrt{x^2 + 4x}\right] = ?$''',
          ],
          "options": [
            r"$\dfrac{1}{2\sqrt{x^2+4x}}$",
            r"$\dfrac{2x+4}{\sqrt{x^2+4x}}$",
            r"$\dfrac{x+2}{2\sqrt{x^2+4x}}$",
            r"$\dfrac{x+2}{\sqrt{x^2+4x}}$",
          ],
          "correct": r"$\dfrac{x+2}{\sqrt{x^2+4x}}$",
          "explanation": r'''เขียนใหม่: $(x^2+4x)^{1/2}$

ดิฟนอก: $\dfrac{1}{2}(x^2+4x)^{-1/2}$  ,  ดิฟใน: $2x+4$

$\dfrac{1}{2}(x^2+4x)^{-1/2} \times (2x+4) = \dfrac{2x+4}{2\sqrt{x^2+4x}} = \dfrac{x+2}{\sqrt{x^2+4x}}$ 💚''',
        }),
        ContentBlock("cr_q_033", "question_choice", {
          "content": [
            r'''3. $\dfrac{d}{dx}\left[\dfrac{1}{\sqrt{5x-2}}\right] = ?$''',
          ],
          "options": [
            r"$\dfrac{5}{2}(5x-2)^{-3/2}$",
            r"$-\dfrac{1}{2}(5x-2)^{-3/2}$",
            r"$-\dfrac{5}{2}(5x-2)^{-3/2}$",
            r"$-5(5x-2)^{-3/2}$",
          ],
          "correct": r"$-\dfrac{5}{2}(5x-2)^{-3/2}$",
          "explanation": r'''เขียนใหม่: $(5x-2)^{-1/2}$

ดิฟนอก: $-\dfrac{1}{2}(5x-2)^{-3/2}$  ,  ดิฟใน: $5$

$-\dfrac{1}{2}(5x-2)^{-3/2} \times 5 = -\dfrac{5}{2}(5x-2)^{-3/2}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("cr_t_034", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้มี 2 ประเภท:

🔸 **คำนวณ** — หาอนุพันธ์หรือหาค่าที่จุดใดจุดหนึ่ง

🔸 **วิเคราะห์** — หา $x$ ที่ทำให้ $f'(x) = $ ค่าที่กำหนด ต้องหา $f'(x)$ ด้วย Chain Rule ก่อน แล้วตั้งสมการแก้''',
          ],
        }),
        ContentBlock("cr_h_035", "header", {
          "title": r"โจทย์คำนวณ",
          "level": 2,
        }),
        ContentBlock("cr_q_036", "question_choice", {
          "content": [
            r'''1. จงหาความชันของกราฟ $y = (x^2 + 1)^4$ ที่ $x = 1$''',
          ],
          "options": [r"$16$", r"$32$", r"$48$", r"$64$"],
          "correct": r"$64$",
          "explanation": r'''$\dfrac{dy}{dx} = 4(x^2+1)^3 \times 2x = 8x(x^2+1)^3$

ที่ $x = 1$: $8(1)(1+1)^3 = 8 \times 8 = 64$ 💚''',
        }),
        ContentBlock("cr_q_037", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = \sqrt{5 - x^2}$ จงหา $f'(1)$''',
          ],
          "options": [
            r"$\dfrac{-1}{2}$",
            r"$\dfrac{-1}{\sqrt{2}}$",
            r"$\dfrac{1}{2}$",
            r"$\dfrac{1}{\sqrt{2}}$",
          ],
          "correct": r"$\dfrac{-1}{2}$",
          "explanation": r'''$f'(x) = \dfrac{1}{2}(5-x^2)^{-1/2} \times (-2x) = \dfrac{-x}{\sqrt{5-x^2}}$

$f'(1) = \dfrac{-1}{\sqrt{5-1}} = \dfrac{-1}{\sqrt{4}} = \dfrac{-1}{2}$ 💚''',
        }),
        ContentBlock("cr_q_038", "question_choice", {
          "content": [
            r'''3. $\dfrac{d}{dx}\left[(x^2 - 4x + 4)^3\right]$ ที่ $x = 2$ มีค่าเท่าใด?

Note = คำใบ้: $x^2 - 4x + 4 = (x-2)^2$''',
          ],
          "options": [r"$0$", r"$12$", r"$24$", r"$48$"],
          "correct": r"$0$",
          "explanation": r'''$\dfrac{dy}{dx} = 3(x^2-4x+4)^2 \times (2x-4)$

ที่ $x = 2$: ข้างในวงเล็บ $= 4-8+4 = 0$

$(0)^2 \times (4-4) = 0$ 💚

🧠 **ข้อสังเกต:** เมื่อ inner $= 0$ ที่จุดนั้น และกำลัง $> 1$ ผลลัพธ์จะเป็น $0$ เสมอ!''',
        }),
        ContentBlock("cr_h_039", "header", {
          "title": r"โจทย์วิเคราะห์ — หา $x$ ที่ $f'(x) = $ ค่าที่กำหนด",
          "level": 2,
        }),
        ContentBlock("cr_t_040", "text", {
          "content": [
            r'''ทำ 2 ขั้นเสมอ: **① หา $f'(x)$** ด้วย Chain Rule → **② ตั้งสมการ $f'(x) = $ ค่าที่โจทย์ให้ แล้วแก้หา $x$**''',
          ],
        }),
        ContentBlock("cr_ddq_041", "drag_and_drop", {
          "steps": [
            {
              "questionId": "cr_ddq_041_s1",
              "content": [
                r'''จงหาค่า $x$ ที่ทำให้ $f'(x) = 0$ เมื่อ $f(x) = (x^2 - 4)^3$

**① หา $f'(x)$** — ดิฟนอก: $3(x^2-4)^2$  ,  ดิฟใน: $2x$

$f'(x) = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$6x(x^2-4)^2$",
                r"$6x(x^2-4)^3$",
                r"$3x(x^2-4)^2$",
                r"$6(x^2-4)^2$",
              ],
              "correctAnswers": {"0": r"$6x(x^2-4)^2$"},
              "explanation": r'''$f'(x) = 3(x^2-4)^2 \times 2x = 6x(x^2-4)^2$ ✅''',
            },
            {
              "questionId": "cr_ddq_041_s2",
              "content": [
                r'''**② ตั้งสมการ** $6x(x^2-4)^2 = 0$

ผลคูณเป็น 0 เมื่อตัวใดตัวหนึ่งเป็น 0:

🔸 $6x = 0$ → $x = $ ''',
                {"drop": "0"},
                r'''🔸 $(x^2-4)^2 = 0$ → $x^2 = 4$ → $x = $ ''',
                {"drop": "1"},
                r'''ดังนั้น $f'(x) = 0$ เมื่อ $x = 0, 2, -2$ (3 คำตอบ)''',
              ],
              "draggableItems": [r"$0$", r"$\pm 2$", r"$\pm 4$", r"$\pm 1$"],
              "correctAnswers": {"0": r"$0$", "1": r"$\pm 2$"},
              "explanation":
                  r'''ต้องหาค่า $x$ ที่ทำให้**แต่ละปัจจัย**เป็นศูนย์ → $x = 0, 2, -2$ 💚''',
            },
          ],
        }),
        ContentBlock("cr_q_042", "question_choice", {
          "content": [
            r'''4. ให้ $f(x) = (2x - 3)^3$

จงหาค่า $x$ **ทั้งหมด** ที่ทำให้ $f'(x) = 24$''',
          ],
          "options": [
            r"$x = \dfrac{3}{2}$",
            r"$x = 1$ หรือ $x = 2$",
            r"$x = \dfrac{1}{2}$ หรือ $x = \dfrac{5}{2}$",
            r"$x = \dfrac{7}{2}$",
          ],
          "correct": r"$x = \dfrac{1}{2}$ หรือ $x = \dfrac{5}{2}$",
          "explanation": r'''$f'(x) = 3(2x-3)^2 \times 2 = 6(2x-3)^2$

ตั้งสมการ: $6(2x-3)^2 = 24$ → $(2x-3)^2 = 4$

$2x-3 = \pm 2$ → $x = \dfrac{5}{2}$ หรือ $x = \dfrac{1}{2}$ 💚

🧠 กำลังสองมี **2 ราก** ($+$ และ $-$) ดังนั้นได้ 2 คำตอบ!''',
        }),
        ContentBlock("cr_q_043", "question_choice", {
          "content": [
            r'''5. ให้ $f(x) = (x - 2)^3$

จงหาค่า $x$ **ทั้งหมด** ที่ทำให้ $f'(x) = 27$''',
          ],
          "options": [
            r"$x = 5$",
            r"$x = -1$",
            r"$x = 5$ หรือ $x = -1$",
            r"$x = 2$",
          ],
          "correct": r"$x = 5$ หรือ $x = -1$",
          "explanation": r'''$f'(x) = 3(x-2)^2 \times 1 = 3(x-2)^2$

ตั้งสมการ: $3(x-2)^2 = 27$ → $(x-2)^2 = 9$

$x-2 = \pm 3$ → $x = 5$ หรือ $x = -1$ 💚''',
        }),
        ContentBlock("cr_q_044", "question_choice", {
          "content": [
            r'''6. ให้ $f(x) = \dfrac{1}{(x-1)^2}$

จงหาค่า $x$ ที่ทำให้ $f'(x) = -2$ (กำหนด $x > 1$)''',
          ],
          "options": [
            r"$x = \dfrac{3}{2}$",
            r"$x = 2$",
            r"$x = 3$",
            r"$x = 4$",
          ],
          "correct": r"$x = 2$",
          "explanation": r'''เขียนใหม่: $(x-1)^{-2}$

$f'(x) = -2(x-1)^{-3} \times 1 = \dfrac{-2}{(x-1)^3}$

ตั้งสมการ: $\dfrac{-2}{(x-1)^3} = -2$ → $(x-1)^3 = 1$ → $x - 1 = 1$ → $x = 2$ 💚

🧠 กำลังสาม**มีรากเดียว** จึงได้คำตอบเดียว (ต่างจากกำลังสองที่ได้ 2 คำตอบ)''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("cr_t_045", "text", {
          "content": [
            r'''🎯 **กฎลูกโซ่ (Chain Rule)**

**เมื่อไหร่ต้องใช้:** เมื่อส่วนข้างในไม่ใช่ $x$ เปล่าๆ เช่น $(3x+2)^5$, $\sqrt{x^2+1}$, $\dfrac{1}{(x+1)^3}$

**สูตร (สองแบบ เหมือนกันทุกอย่าง):**

$$\dfrac{d}{dx}\left[f(g(x))\right] = f'(g(x)) \cdot g'(x) = \dfrac{dy}{dt} \cdot \dfrac{dt}{dx}$$''',
          ],
        }),
        ContentBlock("cr_t_046", "text", {
          "content": [
            r'''**วิธีคิด:**

🔸 **แบบแทนตัวแปร:** ตั้ง $t$ = ส่วนที่ซับซ้อน → หา $\dfrac{dy}{dt}$ และ $\dfrac{dt}{dx}$ → คูณ → แทน $t$ กลับ

🔸 **แบบสูตรย่อ:** ดิฟนอก (เก็บข้างในไว้) × ดิฟใน''',
          ],
        }),
        ContentBlock("cr_t_047", "text", {
          "content": [
            r'''**ทำไมได้ผล:** อัตราการเปลี่ยนแปลงซ้อนกัน**คูณ**กันเสมอ

$x$ เปลี่ยน 1 → $t$ เปลี่ยน $\dfrac{dt}{dx}$ → $y$ เปลี่ยน $\dfrac{dy}{dt} \times \dfrac{dt}{dx}$

Note = โจทย์วิเคราะห์

หา $f'(x)$ ด้วย Chain Rule → ตั้งสมการ $f'(x) = $ ค่าที่โจทย์ให้ → แก้หา $x$

💡 กำลังสอง → **2 ราก** ($\pm$)  /  กำลังสาม → **1 ราก** — สังเกตให้ดีก่อนตอบ!''',
          ],
        }),
      ],
    ),
  ],
);

final calcLHopitalLesson = ContentLesson(
  title: "กฎของโลปิตาล (L'Hôpital's Rule)",
  sections: [

    // =============================================
    // SECTION 1: ปัญหาที่เจอบ่อย — รูปไม่กำหนด
    // =============================================
    ContentSection(
      headerL1: r"😩 ปัญหาที่เจอบ่อย — รูปไม่กำหนด",
      blocks: [
        ContentBlock("lhop_h_001", "header", {
          "title": r"ลองแทนค่าดู",
          "level": 2,
        }),
        ContentBlock("lhop_t_002", "text", {
          "content": [
            r'''จากบทที่ผ่านมา เรารู้แล้วว่าวิธีแรกที่ควรลองคือ**แทนค่าตรงๆ**

แต่บางครั้งผลที่ได้ไม่ใช่จำนวนจริง แต่เป็น $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$

เราเรียกรูปแบบเหล่านี้ว่า**รูปไม่กำหนด (indeterminate form)** — ต้องจัดการเพิ่มเติม''',
          ],
        }),
        ContentBlock("lhop_t_003", "text", {
          "content": [
            r'''ตัวอย่างเช่น $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$ แทน $x = 2$ ได้ $\dfrac{0}{0}$

วิธีเดิมคือแยกตัวประกอบ: $\dfrac{(x-2)(x+2)}{x-2} = x + 2 \to 4$ — ได้ผล แต่ต้องคิดมาก

ถ้าฟังก์ชันซับซ้อนกว่านี้ จะมีวิธีที่**ง่ายกว่า**ไหม?''',
          ],
        }),
        ContentBlock("lhop_t_004", "text", {
          "content": [
            r'''Note = มีวิธีที่ง่ายกว่า!

**กฎของโลปิตาล (L'Hôpital's Rule)** ช่วยแก้ปัญหานี้ได้โดย**ดิฟบน ดิฟล่าง** แล้วหาลิมิตใหม่

ไม่ต้องแยกตัวประกอบหรือจัดรูปเลย 🚀''',
          ],
        }),
        ContentBlock("lhop_ddq_005", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_005_s1",
              "content": [
                r'''ลองตรวจสอบรูปก่อนเรียนสูตร

แทน $x = 0$ ใน $\dfrac{x^2 + 3x}{x}$: เศษ $= 0$, ส่วน $= 0$

รูปที่ได้คือ ''',
                {"drop": "0"},
                r''' → ต้องจัดการเพิ่มเติม ใช้โลปิตาล''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$\dfrac{0}{0}$", r"ได้", r"ไม่ได้", r"$\dfrac{1}{0}$"],
              "correctAnswers": {"0": r"$\dfrac{0}{0}$", "1": r"ได้"},
              "explanation": r'''เศษ $= 0$, ส่วน $= 0$ → รูป $\dfrac{0}{0}$ ซึ่งเป็นรูปไม่กำหนด → ใช้โลปิตาลได้ ✅''',
            },
          ],
        }),
        ContentBlock("lhop_q_006", "question_choice", {
          "content": [
            r'''1. แทน $x = 3$ ใน $\dfrac{x^2 - 9}{x - 3}$ ได้รูปใด?''',
          ],
          "options": [
            r"$\dfrac{0}{0}$ — รูปไม่กำหนด ต้องจัดการเพิ่ม",
            r"$6$ — ตอบได้เลย",
            r"$0$ — ตอบได้เลย",
            r"$\dfrac{9}{0}$ — ลิมิตไม่มีค่า",
          ],
          "correct": r"$\dfrac{0}{0}$ — รูปไม่กำหนด ต้องจัดการเพิ่ม",
          "explanation": r'''$\dfrac{3^2 - 9}{3 - 3} = \dfrac{0}{0}$ — เป็นรูปไม่กำหนด ยังหาค่าไม่ได้!

🧠 $\dfrac{0}{0}$ ไม่เท่ากับ $0$ หรือ $1$ — มันแค่หมายความว่า "ยังต้องวิเคราะห์ต่อ"''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: กฎของโลปิตาลคืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"🎯 กฎของโลปิตาลคืออะไร?",
      blocks: [
        ContentBlock("lhop_h_007", "header", {
          "title": r"สูตรและเงื่อนไข",
          "level": 2,
        }),
        ContentBlock("lhop_t_008", "text", {
          "content": [
            r'''ถ้าแทนค่าแล้วได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ จะใช้กฎนี้ได้:

$$\lim_{x \to a} \frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)}$$

💬 **แนวคิด:** ดิฟบน ดิฟล่าง**แยกกัน** (ไม่ใช่ Quotient Rule!) แล้วหาลิมิตใหม่''',
          ],
        }),
        ContentBlock("lhop_t_009", "text", {
          "content": [
            r'''Note = เงื่อนไขที่ต้องตรวจก่อน**เสมอ**

ใช้ได้เฉพาะเมื่อแทนค่าแล้วได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ เท่านั้น

ถ้าได้รูปอื่น เช่น $\dfrac{5}{2}$ หรือ $\dfrac{7}{0}$ — **ห้ามใช้กฎนี้!**''',
          ],
        }),
        ContentBlock("lhop_h_010", "header", {
          "title": r"ตัวอย่างแรก — ทำทีละขั้น",
          "level": 2,
        }),
        ContentBlock("lhop_ddq_011", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_011_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$

**① ตรวจสอบ:** แทน $x = 2$ ได้ $\dfrac{0}{0}$ → ใช้โลปิตาลได้ ✅

**② ดิฟบนและล่างแยกกัน:**

ดิฟบน: $\dfrac{d}{dx}(x^2 - 4) = $ ''',
                {"drop": "0"},
                r'''  ,  ดิฟล่าง: $\dfrac{d}{dx}(x - 2) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$2x$", r"$1$", r"$x^2$", r"$2$"],
              "correctAnswers": {"0": r"$2x$", "1": r"$1$"},
              "explanation": r'''ดิฟแยกกัน: บนได้ $2x$, ล่างได้ $1$ — ไม่ใช่ Quotient Rule''',
            },
            {
              "questionId": "lhop_ddq_011_s2",
              "content": [
                r'''**③ หาลิมิตใหม่:**

$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2} = \lim\limits_{x \to 2} \dfrac{2x}{1}$

แทน $x = 2$ ตรงๆ: $\dfrac{2 \times 2}{1} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$2$", r"$0$", r"$1$"],
              "correctAnswers": {"0": r"$4$"},
              "explanation": r'''หลังดิฟแล้วแทนค่าได้ $4$ ทันที! 💚

🧠 เทียบกับวิธีแยกตัวประกอบ: ค่าเหมือนกัน แต่ไม่ต้องคิดมากเลย!''',
            },
          ],
        }),
        ContentBlock("lhop_q_012", "question_choice", {
          "content": [
            r'''1. ข้อใดคือ**ขั้นตอนที่ถูกต้อง**ของกฎโลปิตาล?''',
          ],
          "options": [
            r"ตรวจสอบรูป → ดิฟบน/ล่างแยกกัน → หาลิมิตใหม่",
            r"ดิฟทั้งเศษส่วนด้วย Quotient Rule ก่อนเลย",
            r"ใช้ได้กับลิมิตทุกรูปแบบ ไม่ต้องตรวจสอบ",
            r"ดิฟบนและล่างแล้วคูณกัน",
          ],
          "correct": r"ตรวจสอบรูป → ดิฟบน/ล่างแยกกัน → หาลิมิตใหม่",
          "explanation": r'''ขั้นตอนที่ถูก: ① ตรวจว่าเป็น $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ ② ดิฟแยกกัน ③ หาลิมิตใหม่

🧠 ถ้าข้ามขั้น ① จะใช้กฎผิดเงื่อนไขและอาจได้คำตอบผิด!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ฝึกใช้ครั้งแรก — รูป 0/0
    // =============================================
    ContentSection(
      headerL1: r"🔢 ฝึกใช้ครั้งแรก — รูป $\frac{0}{0}$",
      blocks: [
        ContentBlock("lhop_h_013", "header", {
          "title": r"ฝึก 3 ขั้นให้ชำนาญ",
          "level": 2,
        }),
        ContentBlock("lhop_t_014", "text", {
          "content": [
            r'''จำ 3 ขั้นนี้ให้ขึ้นใจ:

🔸 **① ตรวจสอบ** — แทนค่าดูว่าได้ $\dfrac{0}{0}$ ไหม

🔸 **② ดิฟ** — ดิฟบน ดิฟล่างแยกกัน (ทีละตัว)

🔸 **③ หาลิมิต** — แทนค่าในลิมิตใหม่ ถ้าได้จำนวนจริง หยุดได้เลย''',
          ],
        }),
        ContentBlock("lhop_ddq_015", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_015_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 3} \dfrac{x^2 - 9}{x - 3}$

**① ตรวจสอบ:** แทน $x = 3$: $\dfrac{9 - 9}{3 - 3} = \dfrac{0}{0}$ ✅

**② ดิฟ:**

ดิฟบน: $\dfrac{d}{dx}(x^2 - 9) = $ ''',
                {"drop": "0"},
                r'''  ,  ดิฟล่าง: $\dfrac{d}{dx}(x - 3) = $ ''',
                {"drop": "1"},
                r'''**③ หาลิมิต:** แทน $x = 3$ ใน $\dfrac{2x}{1}$ ได้ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$2x$", r"$1$", r"$6$", r"$3$"],
              "correctAnswers": {"0": r"$2x$", "1": r"$1$", "2": r"$6$"},
              "explanation": r'''ดิฟบน $2x$, ล่าง $1$ → แทน $x = 3$: $2(3) = 6$ 💚''',
            },
          ],
        }),
        ContentBlock("lhop_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_016_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 1} \dfrac{x^3 - 1}{x - 1}$

**① ตรวจสอบ:** แทน $x = 1$: $\dfrac{1 - 1}{1 - 1} = \dfrac{0}{0}$ ✅

**② ดิฟ:**

ดิฟบน: $\dfrac{d}{dx}(x^3 - 1) = $ ''',
                {"drop": "0"},
                r'''  ,  ดิฟล่าง: $\dfrac{d}{dx}(x - 1) = $ ''',
                {"drop": "1"},
                r'''**③ หาลิมิต:** แทน $x = 1$ ใน $\dfrac{3x^2}{1}$ ได้ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$3x^2$", r"$1$", r"$3$", r"$2x$"],
              "correctAnswers": {"0": r"$3x^2$", "1": r"$1$", "2": r"$3$"},
              "explanation": r'''ดิฟบน $3x^2$, ล่าง $1$ → แทน $x = 1$: $3(1)^2 = 3$ 💚''',
            },
          ],
        }),
        ContentBlock("lhop_h_017", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("lhop_q_018", "question_choice", {
          "content": [
            r'''1. $\lim\limits_{x \to 0} \dfrac{x^2 + 5x}{x} = ?$''',
          ],
          "options": [r"$5$", r"$0$", r"$1$", r"$2$"],
          "correct": r"$5$",
          "explanation": r'''แทน $x = 0$: $\dfrac{0}{0}$ ✅

ดิฟบน: $2x + 5$  ,  ดิฟล่าง: $1$

$\lim\limits_{x \to 0} \dfrac{2x + 5}{1}$ แทน $x = 0$: $2(0) + 5 = 5$ 💚''',
        }),
        ContentBlock("lhop_q_019", "question_choice", {
          "content": [
            r'''2. $\lim\limits_{x \to 2} \dfrac{x^3 - 8}{x - 2} = ?$''',
          ],
          "options": [r"$12$", r"$6$", r"$8$", r"$3$"],
          "correct": r"$12$",
          "explanation": r'''แทน $x = 2$: $\dfrac{0}{0}$ ✅

ดิฟบน: $3x^2$  ,  ดิฟล่าง: $1$

$\lim\limits_{x \to 2} \dfrac{3x^2}{1}$ แทน $x = 2$: $3(2)^2 = 12$ 💚''',
        }),
        ContentBlock("lhop_q_020", "question_choice", {
          "content": [
            r'''3. $\lim\limits_{x \to 1} \dfrac{x^2 - 2x + 1}{x^2 - 1} = ?$''',
          ],
          "options": [r"$0$", r"$\dfrac{1}{2}$", r"$1$", r"$-\dfrac{1}{2}$"],
          "correct": r"$0$",
          "explanation": r'''แทน $x = 1$: $\dfrac{0}{0}$ ✅

ดิฟบน: $2x - 2$  ,  ดิฟล่าง: $2x$

$\lim\limits_{x \to 1} \dfrac{2x - 2}{2x}$ แทน $x = 1$: $\dfrac{0}{2} = 0$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: รูป ∞/∞ และการใช้หลายรอบ
    // =============================================
    ContentSection(
      headerL1: r"♾️ รูป $\frac{\infty}{\infty}$ และการใช้หลายรอบ",
      blocks: [
        ContentBlock("lhop_h_021", "header", {
          "title": r"รูป $\frac{\infty}{\infty}$ — กฎเดิม ใช้ได้เหมือนกัน",
          "level": 2,
        }),
        ContentBlock("lhop_t_022", "text", {
          "content": [
            r'''เมื่อ $x \to \infty$ บางฟังก์ชันทั้งบนและล่างต่างพุ่งสู่ $\infty$ พร้อมกัน

รูป $\dfrac{\infty}{\infty}$ ก็เป็นรูปไม่กำหนดเช่นกัน — ใช้กฎโลปิตาลได้เลย

ขั้นตอนเหมือนเดิมทุกอย่าง แค่เปลี่ยนจากตรวจ $\dfrac{0}{0}$ เป็นตรวจ $\dfrac{\infty}{\infty}$''',
          ],
        }),
        ContentBlock("lhop_ddq_023", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_023_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to \infty} \dfrac{3x + 5}{2x - 1}$

**① ตรวจสอบ:** เมื่อ $x \to \infty$: บน $\to \infty$, ล่าง $\to \infty$ → รูป ''',
                {"drop": "0"},
                r''' ✅

**② ดิฟ:**

ดิฟบน: $\dfrac{d}{dx}(3x + 5) = $ ''',
                {"drop": "1"},
                r'''  ,  ดิฟล่าง: $\dfrac{d}{dx}(2x - 1) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$\dfrac{\infty}{\infty}$", r"$3$", r"$2$", r"$\dfrac{0}{0}$"],
              "correctAnswers": {"0": r"$\dfrac{\infty}{\infty}$", "1": r"$3$", "2": r"$2$"},
              "explanation": r'''รูป $\dfrac{\infty}{\infty}$ → ดิฟบนได้ $3$, ล่างได้ $2$''',
            },
            {
              "questionId": "lhop_ddq_023_s2",
              "content": [
                r'''**③ หาลิมิต:**

$\lim\limits_{x \to \infty} \dfrac{3}{2} = $ ''',
                {"drop": "0"},
                r'''เพราะ $\dfrac{3}{2}$ เป็นค่าคงที่ ''',
                {"drop": "1"},
                r'''ขึ้นกับ $x$''',
              ],
              "draggableItems": [r"$\dfrac{3}{2}$", r"ไม่", r"$\infty$", r"ยัง"],
              "correctAnswers": {"0": r"$\dfrac{3}{2}$", "1": r"ไม่"},
              "explanation": r'''หลังดิฟแล้วไม่มี $x$ เหลือ → $\dfrac{3}{2}$ เป็นค่าคงที่ → ลิมิต $= \dfrac{3}{2}$ 💚''',
            },
          ],
        }),
        ContentBlock("lhop_h_024", "header", {
          "title": r"ใช้หลายรอบ — เมื่อดิฟแล้วยังได้รูปไม่กำหนด",
          "level": 2,
        }),
        ContentBlock("lhop_t_025", "text", {
          "content": [
            r'''บางครั้งหลังดิฟครั้งแรกแล้ว แทนค่ายังได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ อีก

**ดิฟต่อได้เลย!** ใช้โลปิตาลซ้ำจนกว่าจะแทนค่าแล้วได้จำนวนจริง

Note = ตรวจสอบก่อนทุกรอบ

ก่อนใช้รอบถัดไปต้องมั่นใจว่าลิมิตใหม่ยังเป็น $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ อยู่จริงๆ''',
          ],
        }),
        ContentBlock("lhop_ddq_026", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_026_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 0} \dfrac{x^3}{x^2}$

**รอบที่ 1:** แทน $x = 0$: $\dfrac{0}{0}$ ✅ → ดิฟ

ดิฟบน: $3x^2$  ,  ดิฟล่าง: $2x$ → ได้ $\lim\limits_{x \to 0} \dfrac{3x^2}{2x}$

แทน $x = 0$: $\dfrac{0}{0}$ อีกรั้ง → ต้องดิฟ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"อีกรอบ", r"หยุด แล้วตอบ $0$", r"หยุด แล้วตอบ $3$"],
              "correctAnswers": {"0": r"อีกรอบ"},
              "explanation": r'''ยังได้ $\dfrac{0}{0}$ อีก → ดิฟต่อ!''',
            },
            {
              "questionId": "lhop_ddq_026_s2",
              "content": [
                r'''**รอบที่ 2:** ดิฟ $\dfrac{3x^2}{2x}$

ดิฟบน: $\dfrac{d}{dx}(3x^2) = $ ''',
                {"drop": "0"},
                r'''  ,  ดิฟล่าง: $\dfrac{d}{dx}(2x) = $ ''',
                {"drop": "1"},
                r'''$\lim\limits_{x \to 0} \dfrac{6x}{2}$ แทน $x = 0$: $\dfrac{6(0)}{2} = $ ''',
                {"drop": "2"},
                r'''ได้จำนวนจริง — **หยุดได้!** ✅''',
              ],
              "draggableItems": [r"$6x$", r"$2$", r"$0$", r"$6$"],
              "correctAnswers": {"0": r"$6x$", "1": r"$2$", "2": r"$0$"},
              "explanation": r'''รอบที่ 2: ได้ $\dfrac{6x}{2}$ แทน $x = 0$ ได้ $0$ — เป็นจำนวนจริง ตอบ $0$ ได้เลย! 💚''',
            },
          ],
        }),
        ContentBlock("lhop_q_027", "question_choice", {
          "content": [
            r'''1. $\lim\limits_{x \to \infty} \dfrac{5x^2 + 1}{3x^2 - 2} = ?$''',
          ],
          "options": [r"$\dfrac{5}{3}$", r"$\infty$", r"$0$", r"$\dfrac{5}{6}$"],
          "correct": r"$\dfrac{5}{3}$",
          "explanation": r'''รูป $\dfrac{\infty}{\infty}$ ✅

รอบที่ 1: ดิฟบน $10x$, ล่าง $6x$ → $\lim\limits_{x \to \infty} \dfrac{10x}{6x}$ ยังเป็น $\dfrac{\infty}{\infty}$

รอบที่ 2: ดิฟบน $10$, ล่าง $6$ → $\dfrac{10}{6} = \dfrac{5}{3}$ 💚''',
        }),
        ContentBlock("lhop_q_028", "question_choice", {
          "content": [
            r'''2. $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x^2 - 3x + 2} = ?$''',
          ],
          "options": [r"$4$", r"$1$", r"$2$", r"$0$"],
          "correct": r"$4$",
          "explanation": r'''แทน $x = 2$: $\dfrac{0}{0}$ ✅

ดิฟบน: $2x$  ,  ดิฟล่าง: $2x - 3$

แทน $x = 2$: $\dfrac{2(2)}{2(2) - 3} = \dfrac{4}{1} = 4$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("lhop_t_029", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้มีทั้ง $\dfrac{0}{0}$, $\dfrac{\infty}{\infty}$, และ**กับดัก** — รูปที่ใช้โลปิตาล**ไม่ได้!**

🔸 ต้องตรวจสอบรูปก่อน**ทุกครั้ง** อย่าเผลอใช้โดยไม่ตรวจ''',
          ],
        }),
        ContentBlock("lhop_h_030", "header", {
          "title": r"ระวัง — รูปที่ใช้โลปิตาลไม่ได้!",
          "level": 2,
        }),
        ContentBlock("lhop_t_031", "text", {
          "content": [
            r'''ถ้าแทนค่าแล้วได้ตัวเลขปกติ เช่น $\dfrac{5}{3}$ หรือ $7$ — **แค่ตอบค่านั้นได้เลย!**

ไม่ต้องดิฟอะไรทั้งนั้น เพราะไม่ใช่รูปไม่กำหนด

Note = ใช้กฎโลปิตาลผิดเงื่อนไข → คำตอบผิดทันที!''',
          ],
        }),
        ContentBlock("lhop_ddq_032", "drag_and_drop", {
          "steps": [
            {
              "questionId": "lhop_ddq_032_s1",
              "content": [
                r'''จงหา $\lim\limits_{x \to 3} \dfrac{x^2 + 1}{x - 1}$

**① ตรวจสอบ:** แทน $x = 3$: $\dfrac{3^2 + 1}{3 - 1} = \dfrac{10}{2} = 5$

รูปนี้ ''',
                {"drop": "0"},
                r''' รูปไม่กำหนด → ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"ไม่ใช่", r"ตอบ $5$ ได้เลย", r"ต้องใช้โลปิตาล", r"ใช่"],
              "correctAnswers": {"0": r"ไม่ใช่", "1": r"ตอบ $5$ ได้เลย"},
              "explanation": r'''$\dfrac{10}{2} = 5$ — ได้จำนวนจริงเลย ตอบ $5$ ได้ทันที ไม่ต้องดิฟ! 💚''',
            },
          ],
        }),
        ContentBlock("lhop_q_033", "question_choice", {
          "content": [
            r'''1. $\lim\limits_{x \to 0} \dfrac{3x^2 + x}{x} = ?$''',
          ],
          "options": [r"$1$", r"$0$", r"$3$", r"$4$"],
          "correct": r"$1$",
          "explanation": r'''แทน $x = 0$: $\dfrac{0}{0}$ ✅

ดิฟบน: $6x + 1$  ,  ดิฟล่าง: $1$

แทน $x = 0$: $6(0) + 1 = 1$ 💚''',
        }),
        ContentBlock("lhop_q_034", "question_choice", {
          "content": [
            r'''2. $\lim\limits_{x \to 1} \dfrac{x^4 - 1}{x^2 - 1} = ?$''',
          ],
          "options": [r"$2$", r"$4$", r"$1$", r"$0$"],
          "correct": r"$2$",
          "explanation": r'''แทน $x = 1$: $\dfrac{0}{0}$ ✅

ดิฟบน: $4x^3$  ,  ดิฟล่าง: $2x$

$\lim\limits_{x \to 1} \dfrac{4x^3}{2x}$ แทน $x = 1$: $\dfrac{4}{2} = 2$ 💚''',
        }),
        ContentBlock("lhop_q_035", "question_choice", {
          "content": [
            r'''3. $\lim\limits_{x \to \infty} \dfrac{2x^2 + 3x}{x^2 + 1} = ?$''',
          ],
          "options": [r"$2$", r"$3$", r"$\infty$", r"$0$"],
          "correct": r"$2$",
          "explanation": r'''รูป $\dfrac{\infty}{\infty}$ ✅

รอบที่ 1: ดิฟบน $4x + 3$, ล่าง $2x$ → ยัง $\dfrac{\infty}{\infty}$

รอบที่ 2: ดิฟบน $4$, ล่าง $2$ → $\dfrac{4}{2} = 2$ 💚''',
        }),
        ContentBlock("lhop_q_036", "question_choice", {
          "content": [
            r'''4. ข้อใดต่อไปนี้**ควรใช้**กฎโลปิตาล?

Note = ตรวจสอบรูปที่ได้จากการแทนค่าก่อน''',
          ],
          "options": [
            r"$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$ (แทนค่าได้ $\dfrac{0}{0}$)",
            r"$\lim\limits_{x \to 1} \dfrac{x^2 + 3}{x + 2}$ (แทนค่าได้ $\dfrac{4}{3}$)",
            r"$\lim\limits_{x \to 0} \dfrac{x + 5}{x - 3}$ (แทนค่าได้ $\dfrac{5}{-3}$)",
            r"$\lim\limits_{x \to 2} \dfrac{x^2}{x + 1}$ (แทนค่าได้ $\dfrac{4}{3}$)",
          ],
          "correct": r"$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$ (แทนค่าได้ $\dfrac{0}{0}$)",
          "explanation": r'''ใช้โลปิตาลได้เฉพาะรูป $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ เท่านั้น

ตัวเลือกอื่นแทนค่าแล้วได้จำนวนจริงเลย — ตอบได้ทันทีโดยไม่ต้องดิฟ! 💚''',
        }),
        ContentBlock("lhop_q_037", "question_choice", {
          "content": [
            r'''5. $\lim\limits_{x \to 0} \dfrac{x^3 + 2x}{x} = ?$''',
          ],
          "options": [r"$2$", r"$0$", r"$1$", r"$3$"],
          "correct": r"$2$",
          "explanation": r'''แทน $x = 0$: $\dfrac{0}{0}$ ✅

ดิฟบน: $3x^2 + 2$  ,  ดิฟล่าง: $1$

แทน $x = 0$: $3(0)^2 + 2 = 2$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("lhop_t_038", "text", {
          "content": [
            r'''🎯 **กฎของโลปิตาล (L'Hôpital's Rule)**

**ใช้เมื่อไหร่:** แทนค่าแล้วได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ เท่านั้น!

$$\lim_{x \to a} \frac{f(x)}{g(x)} \;\overset{0/0 \;\text{หรือ}\; \infty/\infty}{=}\; \lim_{x \to a} \frac{f'(x)}{g'(x)}$$''',
          ],
        }),
        ContentBlock("lhop_t_039", "text", {
          "content": [
            r'''**3 ขั้นตอน:**

**①** ตรวจสอบรูป — แทนค่าก่อน**เสมอ**

**②** ดิฟบน ดิฟล่าง**แยกกัน** (ไม่ใช่ Quotient Rule!)

**③** หาลิมิตใหม่ — ถ้าได้จำนวนจริง หยุด / ถ้าได้ $\dfrac{0}{0}$ หรือ $\dfrac{\infty}{\infty}$ อีก → ดิฟต่อได้''',
          ],
        }),
        ContentBlock("lhop_t_040", "text", {
          "content": [
            r'''Note = ข้อควรระวัง 3 ข้อ

🔸 ถ้าแทนค่าได้จำนวนปกติ — **ตอบเลย** ไม่ต้องดิฟ

🔸 ดิฟบน/ล่าง**แยกกัน** — ไม่ใช่ดิฟเศษส่วนทั้งก้อนด้วย Quotient Rule

🔸 ใช้ซ้ำได้ แต่ต้องตรวจสอบรูปก่อน**ทุกรอบ**''',
          ],
        }),
      ],
    ),
  ],
);

// Exercise: โจทย์ปัญหาความต่อเนื่อง (โจทย์ปัญหาความต่อเนื่อง)

// ── ประยุกต์กับเรขาวิเคราะห์ ──────────────────────────────────────────────────────────────

final calcTangentLineLesson = ContentLesson(
  title: "เส้นสัมผัสและการประยุกต์",
  sections: [
    // =============================================
    // SECTION 1: แนวคิด — diff คือความชัน
    // =============================================
    ContentSection(
      headerL1: r"💡 diff คือความชัน",
      blocks: [
        ContentBlock("tl_t_001", "text", {
          "content": [
            r'''Note = ก่อนเรียนบทนี้

บทนี้ใช้เรขาคณิตวิเคราะห์เป็นฐาน ถ้ายังไม่แม่นเรื่อง **สมการเส้นตรง ความชัน เส้นขนาน/ตั้งฉาก** ให้ไปทบทวนก่อน หรือข้ามบทนี้ไปก่อน''',
          ],
        }),
        ContentBlock("tl_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เรารู้แล้วว่า $f'(x)$ คือ **ความชันของเส้นสัมผัสกราฟ ณ จุด $x$**

diff ทำหน้าที่ **เดียว** — ให้ความชัน 📐 ที่เหลือทั้งหมดคือ **เรขาคณิตวิเคราะห์**''',
          ],
        }),
        ContentBlock("tl_ig_003", "interactive_graph", {
          "path": "graph_data_tangent",
        }),
        ContentBlock("tl_t_004", "text", {
          "content": [
            r'''กราฟนี้แสดง $f(x) = -x^3 + 3x^2 - 2x$ พร้อมเส้นสัมผัส ณ จุดที่เลือก

ลองเลื่อน $x$ ดู — สังเกตว่าความชันของเส้นสัมผัสเปลี่ยนไปตาม $x$ และค่านั้นตรงกับ $f'(x)$ เสมอ''',
          ],
        }),
        ContentBlock("tl_t_005", "text", {
          "content": [
            r'''**ตัวอย่าง** ที่ $x = 1$:

$f'(x) = -3x^2 + 6x - 2$ ดังนั้น $f'(1) = -3 + 6 - 2 = 1$ และ $f(1) = 0$

เส้นสัมผัส: $y - 0 = 1(x - 1)$ ดังนั้น $y = x - 1$ — ลองเลื่อนกราฟไปที่ $x = 1$ เพื่อยืนยัน!''',
          ],
        }),
        ContentBlock("tl_ddq_006", "drag_and_drop", {
          "steps": [
            {
              "questionId": "tl_ddq_006_s1",
              "content": [
                r'''ทดสอบที่ $x = 2$ บนกราฟเดียวกัน

$f'(2) = -3(4) + 6(2) - 2 = $ ''',
                {"drop": "0"},
                r''' และ $f(2) = -(8) + 3(4) - 2(2) = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$-2$", r"$0$", r"$2$", r"$4$"],
              "correctAnswers": {"0": r"$-2$", "1": r"$0$"},
              "explanation": r'''$f'(2) = -2$ และ $f(2) = 0$ → จุดสัมผัส $(2, 0)$ ความชัน $-2$''',
            },
            {
              "questionId": "tl_ddq_006_s2",
              "content": [
                r'''จุด $(2, 0)$ และความชัน $-2$ → เส้นสัมผัส $y - 0 = -2(x - 2)$ จัดรูปได้

$y = $ ''',
                {"drop": "0"},
                r'''🎯 ลองเลื่อนกราฟไปที่ $x = 2$ เพื่อยืนยัน!''',
              ],
              "draggableItems": [r"$-2x + 4$", r"$-2x - 4$", r"$2x - 4$", r"$2x + 4$"],
              "correctAnswers": {"0": r"$-2x + 4$"},
              "explanation": r'''$y = -2x + 4$ ✅ ตรงกับที่กราฟแสดงพอดี!''',
            },
          ],
        }),
        ContentBlock("tl_q_007", "question_choice", {
          "content": [
            r'''1. ที่ $x = 3$ บนกราฟ $f(x) = -x^3 + 3x^2 - 2x$ ความชันของเส้นสัมผัสคือ?''',
          ],
          "options": [r"$-11$", r"$-3$", r"$7$", r"$3$"],
          "correct": r"$-11$",
          "explanation": r'''$f'(3) = -3(9) + 6(3) - 2 = -27 + 18 - 2 = -11$ 💚

ลองเลื่อนกราฟไปที่ $x = 3$ ดูได้!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: แบบฝึกหัด
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("tl_q_008", "question_choice", {
          "content": [
            r'''1. สมการเส้นสัมผัสของ $y = x^3 - x$ ที่ $x = 2$ คือ?''',
          ],
          "options": [r"$y = 11x - 16$", r"$y = 11x + 16$", r"$y = 11x - 22$", r"$y = 3x - 6$"],
          "correct": r"$y = 11x - 16$",
          "explanation": r'''$f'(x) = 3x^2 - 1$, $f'(2) = 11$, $f(2) = 6$

$y - 6 = 11(x - 2) \to y = 11x - 16$ 💚''',
        }),
        ContentBlock("tl_q_009", "question_choice", {
          "content": [
            r'''2. สมการเส้นตั้งฉากกับเส้นสัมผัสของ $f(x) = x^2$ ที่ $x = 3$ คือ?''',
          ],
          "options": [
            r"$x + 6y = 57$",
            r"$x - 6y = 57$",
            r"$6x + y = 57$",
            r"$x + 6y = 3$",
          ],
          "correct": r"$x + 6y = 57$",
          "explanation": r'''$f'(3) = 6$, จุด $(3, 9)$, ความชันตั้งฉาก $= -\dfrac{1}{6}$

$y - 9 = -\dfrac{1}{6}(x - 3) \to x + 6y = 57$ 💚''',
        }),
        ContentBlock("tl_q_010", "question_choice", {
          "content": [
            r'''3. จุดบน $y = x^2$ ที่เส้นสัมผัสขนานกับเส้นตรง $y = 6x - 1$ คือ?''',
          ],
          "options": [r"$(3, 9)$", r"$(6, 36)$", r"$(3, 6)$", r"$(-3, 9)$"],
          "correct": r"$(3, 9)$",
          "explanation": r'''เส้นสัมผัสขนาน $y = 6x - 1$ → ความชันต้องเท่ากัน

$f'(a) = 2a = 6 \to a = 3$ → จุดคือ $(3, 9)$ 💚''',
        }),
        ContentBlock("tl_q_011", "question_choice", {
          "content": [
            r'''4. เส้นตั้งฉากกับเส้นสัมผัส $f(x) = x^2$ ที่ $x = 1$ ตัดกราฟ $y = x^2$ อีกครั้งที่จุดใด?''',
          ],
          "options": [
            r"$\left(-\dfrac{3}{2},\ \dfrac{9}{4}\right)$",
            r"$\left(\dfrac{3}{2},\ \dfrac{9}{4}\right)$",
            r"$\left(-\dfrac{1}{2},\ \dfrac{1}{4}\right)$",
            r"$(-2,\ 4)$",
          ],
          "correct": r"$\left(-\dfrac{3}{2},\ \dfrac{9}{4}\right)$",
          "explanation": r'''$f'(1) = 2$, จุด $(1, 1)$, เส้นตั้งฉากความชัน $-\dfrac{1}{2}$: $y = -\dfrac{x}{2} + \dfrac{3}{2}$

แทนใน $y = x^2$: $2x^2 + x - 3 = 0 \to (2x + 3)(x - 1) = 0$

$x = -\dfrac{3}{2}$, $y = \dfrac{9}{4}$ 💚''',
        }),
        ContentBlock("tl_ddq_012", "drag_and_drop", {
          "steps": [
            {
              "questionId": "tl_ddq_012_s1",
              "content": [
                r'''5. จงหาสมการเส้นสัมผัส $y = x^2$ **ทุกเส้น**ที่ผ่านจุด $(0, -4)$

ให้จุดสัมผัสอยู่ที่ $(a, a^2)$ → ความชัน $2a$ → เส้นสัมผัส: $y - a^2 = 2a(x - a)$

แทน $(0, -4)$: $-4 - a^2 = -2a^2 \implies a^2 = $ ''',
                {"drop": "0"},
                r'''$\therefore\ a = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$4$", r"$16$", r"$2$", r"$\pm 2$", r"$\pm 4$"],
              "correctAnswers": {"0": r"$4$", "1": r"$\pm 2$"},
              "explanation": r'''$a = \pm 2$ → มีสองจุดสัมผัส จึงมีสองเส้นสัมผัส''',
            },
            {
              "questionId": "tl_ddq_012_s2",
              "content": [
                r'''$a = 2$ → จุด $(2, 4)$ → เส้นสัมผัส $y = $ ''',
                {"drop": "0"},
                r'''$a = -2$ → จุด $(-2, 4)$ → เส้นสัมผัส $y = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$4x - 4$", r"$-4x - 4$", r"$4x + 4$", r"$-4x + 4$"],
              "correctAnswers": {"0": r"$4x - 4$", "1": r"$-4x - 4$"},
              "explanation": r'''$a = 2$: $y - 4 = 4(x - 2) \to y = 4x - 4$

$a = -2$: $y - 4 = -4(x + 2) \to y = -4x - 4$ 💚

🧠 จากจุดภายนอกกราฟ ลากเส้นสัมผัสได้ **2 เส้น**!''',
            },
          ],
        }),
      ],
    ),

    // =============================================
    // SECTION 3: โจทย์ประยุกต์ขั้นสูง
    // =============================================
    ContentSection(
      headerL1: r"🔥 โจทย์ประยุกต์ขั้นสูง",
      blocks: [
        ContentBlock("tl_h_013", "header", {
          "title": r"ดิฟกราฟโค้ง — Implicit Differentiation",
          "level": 2,
        }),
        ContentBlock("tl_t_014", "text", {
          "content": [
            r'''กราฟเช่น $x^2 + y^2 = r^2$ ไม่ใช่ฟังก์ชัน $y = f(x)$ ตรงๆ แต่ดิฟทั้งสองข้างเทียบ $x$ ได้เลย

$$2x + 2y \cdot \dfrac{dy}{dx} = 0 \implies \dfrac{dy}{dx} = -\dfrac{x}{y}$$

นี่คือความชันเส้นสัมผัส ณ จุด $(x, y)$ บนวงกลม''',
          ],
        }),
        ContentBlock("tl_t_015", "text", {
          "content": [
            r'''Note = กฎสำคัญ

เมื่อดิฟ $y^n$ เทียบ $x$ ต้องคูณ $\dfrac{dy}{dx}$ เสมอ — เช่น $\dfrac{d}{dx}(y^2) = 2y\dfrac{dy}{dx}$ และ $\dfrac{d}{dx}(y^3) = 3y^2\dfrac{dy}{dx}$''',
          ],
        }),
        ContentBlock("tl_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "tl_ddq_016_s1",
              "content": [
                r'''จงหาเส้นสัมผัสของวงกลม $x^2 + y^2 = 25$ ที่จุด $(3, 4)$

ดิฟทั้งสองข้าง: $2x + 2y\dfrac{dy}{dx} = 0$ → ณ $(3, 4)$: $\dfrac{dy}{dx} = -\dfrac{3}{4}$

$4(y - 4) = -3(x - 3)$ → จัดรูปได้ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$3x + 4y = 25$",
                r"$3x - 4y = 25$",
                r"$4x + 3y = 25$",
                r"$3x + 4y = -25$",
              ],
              "correctAnswers": {"0": r"$3x + 4y = 25$"},
              "explanation": r'''$4y - 16 = -3x + 9 \to 3x + 4y = 25$ 💚

🧠 สังเกต: เส้นสัมผัสวงกลม ณ $(x_1, y_1)$ ได้รูป $x \cdot x_1 + y \cdot y_1 = r^2$ เสมอ!''',
            },
          ],
        }),
        ContentBlock("tl_q_017", "question_choice", {
          "content": [
            r'''1. เส้นสัมผัสของวงรี $x^2 + 4y^2 = 8$ ที่จุด $(2, 1)$ คือ?''',
          ],
          "options": [r"$x + 2y = 4$", r"$x + 2y = 8$", r"$2x + y = 4$", r"$x - 2y = 4$"],
          "correct": r"$x + 2y = 4$",
          "explanation": r'''ดิฟ: $2x + 8y\dfrac{dy}{dx} = 0 \to \dfrac{dy}{dx} = -\dfrac{x}{4y} = -\dfrac{1}{2}$ ณ $(2, 1)$

$y - 1 = -\dfrac{1}{2}(x - 2) \to x + 2y = 4$ 💚''',
        }),
        ContentBlock("tl_q_018", "question_choice", {
          "content": [
            r'''2. เส้นสัมผัสของไฮเพอร์โบลา $x^2 - y^2 = 7$ ที่จุด $(4, 3)$ คือ?''',
          ],
          "options": [r"$4x - 3y = 7$", r"$4x + 3y = 7$", r"$3x - 4y = 7$", r"$4x - 3y = -7$"],
          "correct": r"$4x - 3y = 7$",
          "explanation": r'''ดิฟ: $2x - 2y\dfrac{dy}{dx} = 0 \to \dfrac{dy}{dx} = \dfrac{x}{y} = \dfrac{4}{3}$ ณ $(4, 3)$

$3(y - 3) = 4(x - 4) \to 4x - 3y = 7$ 💚''',
        }),
        ContentBlock("tl_q_019", "question_choice", {
          "content": [
            r'''3. เส้นสัมผัสของวงรี $9x^2 + 4y^2 = 72$ ที่จุด $(2, 3)$ ตัดแกน $x$ ที่จุดใด?''',
          ],
          "options": [r"$(4, 0)$", r"$(6, 0)$", r"$(3, 0)$", r"$(8, 0)$"],
          "correct": r"$(4, 0)$",
          "explanation": r'''ดิฟ: $18x + 8y\dfrac{dy}{dx} = 0 \to \dfrac{dy}{dx} = -\dfrac{9x}{4y} = -\dfrac{3}{2}$ ณ $(2, 3)$

เส้นสัมผัส: $y - 3 = -\dfrac{3}{2}(x - 2) \to 3x + 2y = 12$

ที่ $y = 0$: $x = 4$ → จุด $(4, 0)$ 💚''',
        }),
        ContentBlock("tl_q_020", "question_choice", {
          "content": [
            r'''4. จงหาจุดบนวงกลม $x^2 + y^2 = 5$ ที่เส้นสัมผัสผ่านจุด $(0, 5)$ (มีคำตอบ 2 จุด)''',
          ],
          "options": [
            r"$(2, 1)$ และ $(-2, 1)$",
            r"$(1, 2)$ และ $(-1, 2)$",
            r"$(2, -1)$ และ $(-2, -1)$",
            r"$(\sqrt{5}, 0)$ และ $(-\sqrt{5}, 0)$",
          ],
          "correct": r"$(2, 1)$ และ $(-2, 1)$",
          "explanation": r'''ให้จุดสัมผัส $(a, b)$ บนวงกลม: $a^2 + b^2 = 5$ และความชัน $= -\dfrac{a}{b}$

เส้นสัมผัสผ่าน $(0, 5)$: $5 - b = \dfrac{a^2}{b}$

$5b - b^2 = a^2 = 5 - b^2 \to b = 1,\ a = \pm 2$ 💚''',
        }),
        ContentBlock("tl_q_021", "question_choice", {
          "content": [
            r'''5. เส้นสัมผัสร่วมของ $y = x^2$ และ $y = -x^2 + 4x - 2$ มีสมการคือ?

Note = เส้นสัมผัสร่วม คือเส้นตรงเส้นเดียวที่สัมผัสกราฟทั้งสองพร้อมกัน''',
          ],
          "options": [r"$y = 2x - 1$", r"$y = 2x + 1$", r"$y = x - 1$", r"$y = 4x - 4$"],
          "correct": r"$y = 2x - 1$",
          "explanation": r'''บน $y = x^2$ ณ $(a, a^2)$: เส้นสัมผัส $y = 2ax - a^2$

บน $y = -x^2+4x-2$ ณ $(b, ...)$: เส้นสัมผัส $y = (-2b+4)x + b^2 - 2$

ความชันเท่ากัน: $2a = -2b + 4 \to a = 2 - b$ ... (i)

y-intercept เท่ากัน: $-a^2 = b^2 - 2$ แทน (i):

$-(2-b)^2 = b^2 - 2 \to (b - 1)^2 = 0 \to b = 1,\ a = 1$

เส้นสัมผัสร่วม: $y = 2x - 1$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("tl_t_022", "text", {
          "content": [
            r'''🎯 **แนวคิดหลัก**

$f'(x)$ ทำหน้าที่เดียว — ให้ **ความชันของเส้นสัมผัส** ณ จุด $x$

ที่เหลือทั้งหมดคือ **เรขาคณิตวิเคราะห์** — สมการเส้นตรง เส้นขนาน/ตั้งฉาก จุดตัด ฯลฯ''',
          ],
        }),
        ContentBlock("tl_t_023", "text", {
          "content": [
            r'''**ประยุกต์ได้หลากหลาย:**

🔸 สมการ**เส้นสัมผัส** และ**เส้นตั้งฉาก** ณ จุดบนกราฟ

🔸 หาจุดที่เส้นสัมผัส**ขนาน**กับเส้นที่กำหนด

🔸 ลากเส้นสัมผัส**จากจุดนอกกราฟ** — ได้หลายเส้น!

🔸 เส้นสัมผัสของ**วงกลม วงรี ไฮเพอร์โบลา** ด้วย Implicit Differentiation

🔸 **เส้นสัมผัสร่วม**ระหว่างสองกราฟ''',
          ],
        }),
        ContentBlock("tl_t_024", "text", {
          "content": [
            r'''Note = Implicit Differentiation สรุป

ดิฟทั้งสองข้างของ $F(x, y) = c$ เทียบ $x$ โดยจำว่า $\dfrac{d}{dx}(y^n) = ny^{n-1}\dfrac{dy}{dx}$ แล้วแก้หา $\dfrac{dy}{dx}$''',
          ],
        }),
      ],
    ),
  ],
);

final calcIncDecLesson = ContentLesson(
  title: "ฟังก์ชันเพิ่ม-ลด",
  sections: [

    // =============================================
    // SECTION 1: ความชันของเส้นสัมผัส
    // =============================================
    ContentSection(
      headerL1: r"🔍 ความชันของเส้นสัมผัส",
      blocks: [
        ContentBlock("incdec_t_001", "text", {
          "content": [
            r'''เราเรียนเรื่องเส้นสัมผัสมาแล้ว บทนี้จะเอาความชันของมันมาใช้ต่อ

ลองเลื่อนจุดไปตามกราฟ แล้วความชัน''',
          ],
        }),
        ContentBlock("incdec_ig_002", "interactive_graph", {
          "path": "graph_data_tangent",
        }),
        ContentBlock("incdec_t_003", "text", {
          "content": [
            r'''กราฟนี้คือ $f(x) = -x^3 + 6x^2 - 8x + 4$
            
จินตนาการว่าเราคือจุดสีส้ม และกราฟคือเนินเขา และกำลังเดินขึ้นลงเขา''',
          ],
        }),
        ContentBlock("incdec_ddq_004", "drag_and_drop", {
          "steps": [
            {
              "questionId": "incdec_ddq_004_s1",
              "content": [
                r'''ตอนที่กำลังเดินขึ้นเขา ความชันจะเป็น''',
                {"drop": "0"},
                r'''เสมอ''',
                r'''

นั่นคือ $f'(x)$ เป็น ''',
                {"drop": "0"},
                r'''

ตอนเดินขึ้นเราจะเรียกว่า **ฟังก์ชันเพิ่ม**'''

              ],
              "draggableItems": [r"บวก", r"ลบ", r"ศูนย์"],
              "correctAnswers": {"0": r"บวก"},
              "explanation": r'''กราฟขาขึ้น → เส้นสัมผัสเอียงขึ้น → ความชันเป็นบวก 📈''',
            },
            {
              "questionId": "incdec_ddq_004_s2",
              "content": [
                r'''ตอนที่กำลังเดินขึ้นลง ความชันจะเป็น''',
                {"drop": "0"},
                r'''เสมอ''',
                r'''

นั่นคือ $f'(x)$ เป็น ''',
                {"drop": "0"},
                r'''

ตอนเดินลงเราจะเรียกว่า **ฟังก์ชันลด**'''
              ],
              "draggableItems": [r"บวก", r"ลบ", r"ศูนย์"],
              "correctAnswers": {"0": r"ลบ"},
              "explanation": r'''กราฟขาลง → เส้นสัมผัสเอียงลง → ความชันเป็นลบ 📉''',
            },
            {
              "questionId": "incdec_ddq_004_s3",
              "content": [
                r'''เลื่อนไปที่ **จุดยอด** (สูงสุดหรือต่ำสุดของเนิน) — เส้นสัมผัสจะอยู่แนวนอนพอดี ความชันตรงนั้นเป็น ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"บวก", r"ลบ", r"ศูนย์"],
              "correctAnswers": {"0": r"ศูนย์"},
              "explanation": r'''จุดยอด → เส้นแนวนอน → ความชันเป็นศูนย์ ➡️''',
            },
          ],
        }),
        ContentBlock("incdec_q_005", "question_choice", {
          "content": [
            r'''1. ณ จุดหนึ่งบนกราฟ เส้นสัมผัสมีความชันเท่ากับ $-5$ ข้อใดอธิบายกราฟ ณ จุดนั้นได้ถูกต้อง?''',
          ],
          "options": [
            r"กราฟกำลังพุ่งขึ้น",
            r"กราฟกำลังปักหัวลง",
            r"กราฟอยู่ที่จุดยอด",
            r"ไม่สามารถบอกได้",
          ],
          "correct": r"กราฟกำลังปักหัวลง",
          "explanation": r'''ความชันติดลบ ($-5 < 0$) แปลว่าเส้นสัมผัสเอียงลง ซึ่งหมายความว่ากราฟกำลังปักหัวลง ณ จุดนั้น 💚''',
        }),
        ContentBlock("incdec_q_006", "question_choice", {
          "content": [
            r'''2. หาช่วงทั้งหมดในกราฟที่เป็นฟังก์ชันลด''',
            {"graph": "graph_data_tangent2"},
          ],
          "options": [
            r"$x \in (0, 2)$",
            r"$x$ ตั้งแต่ $0$ ถึง $2$",
            r"$x \in (0, 4)$",
            r"ไม่มีคำตอบ",
          ],
          "correct": r"$x \in (0, 2)$",
          "explanation": r'''ความชันติดลบ ($-5 < 0$) แปลว่าเส้นสัมผัสเอียงลง ซึ่งหมายความว่ากราฟกำลังปักหัวลง ณ จุดนั้น 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: f'(x) กับความชัน — เชื่อมกัน
    // =============================================
    ContentSection(
      headerL1: r"⚡ f'(x) กับความชัน",
      blocks: [
        ContentBlock("incdec_t_006", "text", {
          "content": [
            r'''จำ rate at a point ได้ไหม? $f'(a)$ คืออัตราการเปลี่ยนแปลงของฟังก์ชัน ณ จุด $a$ — และนั่นก็คือ **ความชันของเส้นสัมผัส** ณ จุดนั้นนั่นเอง''',
          ],
        }),
        ContentBlock("incdec_t_007", "text", {
          "content": [
            r'''เชื่อมกับที่สังเกตมาใน Section แรกได้เลย:

$f'(x) > 0$ → ความชันเป็นบวก → กราฟกำลังพุ่งขึ้น (ฟังก์ชัน**เพิ่ม**) ⬆️
$f'(x) < 0$ → ความชันติดลบ → กราฟกำลังปักหัวลง (ฟังก์ชัน**ลด**) ⬇️''',
            r'''Note = ไม่ต้องท่อง
แค่จำว่า $f'(x)$ บอกความชัน ความชันบอกทิศทางกราฟ เท่านั้นเอง''',
          ],
        }),
        ContentBlock("incdec_ig_008", "interactive_graph", {
          "path": "graph_data_tangent2",
        }),
        ContentBlock("incdec_t_009", "text", {
          "content": [
            r'''กราฟนี้คือ $f(x) = x^3 - 3x^2 + 4$ — ลองเลื่อนจุดแล้วดูว่าค่า $f'(x)$ ที่แสดงขึ้นมา สอดคล้องกับทิศทางกราฟไหม''',
          ],
        }),
        ContentBlock("incdec_ddq_010", "drag_and_drop", {
          "steps": [
            {
              "questionId": "incdec_ddq_010_s1",
              "content": [
                r'''จาก $f(x) = x^3 - 3x^2 + 4$ จะได้ $f'(x) = 3x^2 - 6x$

แทนค่า $x = -1$: $\quad f'(-1) = 3(-1)^2 - 6(-1) = $ ''',
                {"drop": "0"},
                r''' แสดงว่าที่จุดนี้กราฟกำลัง ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$9$", r"$-9$", r"พุ่งขึ้น", r"ปักหัวลง"],
              "correctAnswers": {"0": r"$9$", "1": r"พุ่งขึ้น"},
              "explanation": r'''$f'(-1) = 3 + 6 = 9 > 0$ → ความชันเป็นบวก → กราฟกำลังพุ่งขึ้น 💚''',
            },
            {
              "questionId": "incdec_ddq_010_s2",
              "content": [
                r'''แทนค่า $x = 1$: $\quad f'(1) = 3(1)^2 - 6(1) = $ ''',
                {"drop": "0"},
                r''' แสดงว่าที่จุดนี้กราฟกำลัง ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$3$", r"$-3$", r"พุ่งขึ้น", r"ปักหัวลง"],
              "correctAnswers": {"0": r"$-3$", "1": r"ปักหัวลง"},
              "explanation": r'''$f'(1) = 3 - 6 = -3 < 0$ → ความชันติดลบ → กราฟกำลังปักหัวลง ลองเลื่อนกราฟไปที่ $x = 1$ เพื่อยืนยันได้เลย! 💚''',
            },
          ],
        }),
        ContentBlock("incdec_q_011", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = 2x^2 - 8x + 5$ ที่จุด $x = 3$ ฟังก์ชันนี้กำลังเพิ่มหรือลด?''',
          ],
          "options": [r"เพิ่ม เพราะ $f'(3) > 0$", r"ลด เพราะ $f'(3) < 0$", r"ไม่เพิ่มไม่ลด เพราะ $f'(3) = 0$", r"บอกไม่ได้"],
          "correct": r"เพิ่ม เพราะ $f'(3) > 0$",
          "explanation": r'''$f'(x) = 4x - 8$
แทน $x = 3$: $f'(3) = 12 - 8 = 4 > 0$
ความชันเป็นบวก → กราฟกำลังพุ่งขึ้น → ฟังก์ชันเพิ่ม 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ช่วงที่ฟังก์ชันเพิ่ม-ลด
    // =============================================
    ContentSection(
      headerL1: r"📐 ช่วงที่ฟังก์ชันเพิ่ม-ลด",
      blocks: [
        ContentBlock("incdec_t_012", "text", {
          "content": [
            r'''ที่ผ่านมาเราดูแค่จุดเดียว แต่ถ้าอยากรู้ตลอดทั้งช่วงเลยว่ากราฟขึ้นหรือลงตอนไหนบ้าง ก็แค่ถามว่า "ช่วง $x$ ไหนที่ทำให้ $f'(x) > 0$" หรือ "$f'(x) < 0$"''',
          ],
        }),
        ContentBlock("incdec_ddq_013", "drag_and_drop", {
          "steps": [
            {
              "questionId": "incdec_ddq_013_s1",
              "content": [
                r'''อยากหาช่วงที่ $f(x) = x^3 - 12x$ เป็น **ฟังก์ชันลด**

ขั้นแรก ดิฟได้ $f'(x) = 3x^2 - 12$ และเป้าหมายคือต้องแก้ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$3x^2 - 12 = 0$", r"$3x^2 - 12 > 0$", r"$3x^2 - 12 < 0$"],
              "correctAnswers": {"0": r"$3x^2 - 12 < 0$"},
              "explanation": r'''ฟังก์ชันลด = ความชันติดลบ = $f'(x) < 0$ 💚''',
            },
            {
              "questionId": "incdec_ddq_013_s2",
              "content": [
                r'''จัดรูปได้ $3(x-2)(x+2) < 0$

วาดเส้นจำนวน รากคือ $x = -2$ และ $x = 2$ — ช่วงที่ทำให้อสมการเป็นจริงคือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$(-\infty, -2) \cup (2, \infty)$", r"$(-2, 2)$", r"$x > 2$"],
              "correctAnswers": {"0": r"$(-2, 2)$"},
              "explanation": r'''ระหว่างราก $-2$ และ $2$ พหุนามมีค่าติดลบ ดังนั้นช่วงที่ฟังก์ชันลดคือ $(-2, 2)$ 💚''',
            },
          ],
        }),
        ContentBlock("incdec_q_014", "question_choice", {
          "content": [
            r'''1. ช่วงที่ $f(x) = -2x^3 + 6x^2 - 3$ เป็น **ฟังก์ชันเพิ่ม** คือช่วงใด?''',
          ],
          "options": [r"$(0, 2)$", r"$(-\infty, 0) \cup (2, \infty)$", r"$(-2, 0)$", r"$(-\infty, -2) \cup (0, \infty)$"],
          "correct": r"$(0, 2)$",
          "explanation": r'''$f'(x) = -6x^2 + 12x$
ต้องการ $f'(x) > 0$:
$-6x^2 + 12x > 0 \implies x^2 - 2x < 0$ (หารด้วย $-6$ พลิกเครื่องหมาย!)
$x(x-2) < 0 \implies x \in (0, 2)$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: จุดวิกฤติ
    // =============================================
    ContentSection(
      headerL1: r"🤯 จุดวิกฤติ (Critical Points)",
      blocks: [
        ContentBlock("incdec_t_015", "text", {
          "content": [
            r'''จาก Section แรก เราเห็นว่าที่จุดยอดความชันเป็นศูนย์ — นั่นคือรอยต่อของการเปลี่ยนทิศทาง

จุดที่ $f'(x) = 0$ หรือ $f'(x)$ หาค่าไม่ได้ เราเรียกว่า **จุดวิกฤติ**''',
            r'''Note = เงื่อนไขสำคัญ
$f(c)$ ต้องมีค่าด้วย ถ้าตัวฟังก์ชันเองหาค่าที่จุดนั้นไม่ได้ ก็ไม่นับเป็นจุดวิกฤติ''',
          ],
        }),
        ContentBlock("incdec_q_016", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^4 - 4x^3$ จุดวิกฤติของฟังก์ชันนี้มีกี่จุด?''',
          ],
          "options": [r"$1$ จุด", r"$2$ จุด", r"$3$ จุด", r"ไม่มีจุดวิกฤติ"],
          "correct": r"$2$ จุด",
          "explanation": r'''$f'(x) = 4x^3 - 12x^2 = 4x^2(x-3) = 0$
ได้ $x = 0$ และ $x = 3$ — ทั้งสองจุด $f(x)$ หาค่าได้ปกติ
สรุปมี 2 จุดวิกฤติ 💚''',
        }),
        ContentBlock("incdec_q_017", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = \dfrac{1}{x^2}$ จุดวิกฤติของฟังก์ชันนี้คือ?''',
          ],
          "options": [r"$x = 0$", r"$x = 1$", r"$x = -1$", r"ไม่มีจุดวิกฤติ"],
          "correct": r"ไม่มีจุดวิกฤติ",
          "explanation": r'''$f'(x) = -\dfrac{2}{x^3}$ — สมการ $f'(x) = 0$ ไม่มีคำตอบ

ที่ $x = 0$ นั้น $f'(x)$ หาค่าไม่ได้ก็จริง แต่ $f(0)$ ก็หาค่าไม่ได้ด้วย (หารด้วยศูนย์) จึงไม่นับเป็นจุดวิกฤติ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดวิเคราะห์
    // =============================================
    ContentSection(
      headerL1: r"🔥 แบบฝึกหัดวิเคราะห์",
      blocks: [
        ContentBlock("incdec_t_018", "text", {
          "content": [
            r'''โจทย์ชุดนี้ไม่ได้แค่ "หาช่วง" — ต้องวิเคราะห์ให้ดีก่อนตอบ''',
          ],
        }),

        // Q1: Multi-statement ก ข ค
        ContentBlock("incdec_q_019", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^3 - 6x^2 + 9x + 2$ พิจารณาข้อความต่อไปนี้

ก. ที่ $x = 2$ ฟังก์ชันนี้เป็นฟังก์ชันลด
ข. ช่วง $(0, 3)$ ทำให้ $f(x)$ เป็นฟังก์ชันเพิ่ม
ค. เส้นสัมผัส ณ จุดวิกฤติ $x = 1$ มีสมการ $y = 6$

ข้อใดถูกต้อง?''',
          ],
          "options": [
            r"ก และ ข",
            r"ก และ ค",
            r"ข และ ค",
            r"ถูกทุกข้อ",
          ],
          "correct": r"ก และ ค",
          "explanation": r'''$f'(x) = 3x^2 - 12x + 9 = 3(x-1)(x-3)$
ช่วงลดจริงคือ $(1, 3)$ ช่วงเพิ่มจริงคือ $(-\infty,1) \cup (3, \infty)$

**ก:** $f'(2) = 3(1)(-1) = -3 < 0$ → ลด ✓
**ข:** $(0, 3)$ ไม่ใช่ subset ของช่วงลดหรือช่วงเพิ่มทั้งหมด — ผ่านจุดวิกฤติ $x=1$ ด้วย ✗
**ค:** $x = 1$ เป็นจุดวิกฤติ → $f'(1) = 0$ → เส้นสัมผัสแนวนอน, $f(1) = 1 - 6 + 9 + 2 = 6$ → $y = 6$ ✓ 💚''',
        }),

        // Q2: Chain rule + หาพารามิเตอร์
        ContentBlock("incdec_q_020", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = (2x^2 - a)^2$ โดยที่ $a > 0$

ถ้าฟังก์ชันนี้มีจุดที่ไม่เพิ่มไม่ลดที่ $x = 2$ (นอกเหนือจาก $x = 0$) ค่า $a$ เท่ากับเท่าใด?''',
          ],
          "options": [r"$a = 4$", r"$a = 6$", r"$a = 8$", r"$a = 16$"],
          "correct": r"$a = 8$",
          "explanation": r'''ใช้ Chain Rule: $f'(x) = 2(2x^2 - a) \cdot 4x = 8x(2x^2 - a)$

จุดที่ไม่เพิ่มไม่ลด คือจุดที่ $f'(x) = 0$
แทน $x = 2$: $8(2)(2 \cdot 4 - a) = 0$
$16(8 - a) = 0 \implies a = 8$ 💚''',
        }),

        // Q3: เงื่อนไข always-increasing
        ContentBlock("incdec_q_021", "question_choice", {
          "content": [
            r'''3. $f(x) = x^3 - kx$ จะเป็นฟังก์ชันเพิ่มตลอดเส้นจริงได้ก็ต่อเมื่อ $k$ อยู่ในช่วงใด?''',
          ],
          "options": [r"$k < 0$", r"$k \leq 0$", r"$k > 0$", r"$k \geq 0$"],
          "correct": r"$k \leq 0$",
          "explanation": r'''$f'(x) = 3x^2 - k$

ต้องการ $f'(x) \geq 0$ ทุกค่า $x$
ค่าต่ำสุดของ $3x^2$ คือ $0$ (ตอน $x = 0$)
ดังนั้นต้องการ $-k \geq 0 \implies k \leq 0$

Note = ที่ $k = 0$ จะได้ $f'(x) = 3x^2 \geq 0$ เสมอ ยังนับว่าไม่ลด 💚''',
        }),

        // Q4: Chain rule + multi-statement
        ContentBlock("incdec_q_022", "question_choice", {
          "content": [
            r'''4. ให้ $f(x) = (3x^2 - 3)^2$ พิจารณาข้อความต่อไปนี้

ก. $f$ มีจุดวิกฤติทั้งหมด $3$ จุด
ข. $f$ เป็นฟังก์ชันเพิ่มในช่วง $(-1, 0)$
ค. $f$ เป็นฟังก์ชันลดในช่วง $(1, \infty)$

ข้อใดถูกต้อง?''',
          ],
          "options": [
            r"ก เท่านั้น",
            r"ก และ ข",
            r"ข และ ค",
            r"ถูกทุกข้อ",
          ],
          "correct": r"ก และ ข",
          "explanation": r'''ใช้ Chain Rule: $f'(x) = 2(3x^2-3) \cdot 6x = 12x(3x^2-3) = 36x(x-1)(x+1)$

จุดวิกฤติ: $x = -1, 0, 1$ (ทั้งสามจุด $f(x)$ หาค่าได้) → **ก ✓** (3 จุด)

วิเคราะห์เครื่องหมาย $f'(x) = 36x(x-1)(x+1)$:
- ช่วง $(-1, 0)$: แทน $x = -0.5$ → $36(-)(-)(-) < 0$... 

🧠 ระวัง! ลองแทน $x = -0.5$:
$36(-0.5)(-1.5)(-0.5) = 36 \times (-0.5) \times (-1.5) \times (-0.5) = 36 \times (-0.375) < 0$

รอก่อน — นั่นหมายความว่า $f' < 0$ ในช่วง $(-1,0)$ แปลว่าลด ไม่ใช่เพิ่ม?

ลองใหม่อย่างระมัดระวัง: $x = -0.5$
$x < 0$ → factor $x$ เป็นลบ
$x - 1 = -1.5 < 0$ → factor $(x-1)$ เป็นลบ
$x + 1 = 0.5 > 0$ → factor $(x+1)$ เป็นบวก
ผลคูณ: $(-)(-)(+) = (+)$ → $f' > 0$ → **ข ✓** (เพิ่ม)

- ช่วง $(1, \infty)$: แทน $x = 2$: $(+)(+)(+) = (+) > 0$ → เพิ่ม ไม่ใช่ลด → **ค ✗**

สรุป: ก และ ข ถูก 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"✨ สรุป",
      blocks: [
        ContentBlock("incdec_t_023", "text", {
          "content": [
            r'''**$f'(x)$ = ความชัน = ทิศทางกราฟ**
$f'(x) > 0$ → กราฟพุ่งขึ้น (ฟังก์ชันเพิ่ม)
$f'(x) < 0$ → กราฟปักหัวลง (ฟังก์ชันลด)''',
          ],
        }),
        ContentBlock("incdec_t_024", "text", {
          "content": [
            r'''**อยากหาทั้งช่วง?**
นำ $f'(x)$ มาตั้งอสมการ $> 0$ หรือ $< 0$ แล้วแก้หา $x$ ด้วยเส้นจำนวน''',
          ],
        }),
        ContentBlock("incdec_t_025", "text", {
          "content": [
            r'''**จุดวิกฤติ** คือจุดที่ $f'(x) = 0$ หรือหาค่าไม่ได้ (และ $f(x)$ ต้องมีค่าด้วย)

Note = บทต่อไป
จุดวิกฤตินี่แหละคือกุญแจที่จะพาไปหา **จุดสูงสุดและต่ำสุด** ของฟังก์ชัน 🚀''',
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
    // =============================================
    // SECTION 1: จุดเปลี่ยนทิศ
    // =============================================
    ContentSection(
      headerL1: r"💡 จุดเปลี่ยนทิศ",
      blocks: [
        ContentBlock("extrema_t_001", "text", {
          "content": [
            r'''จากบทที่แล้ว เรารู้แล้วว่า $f'(x) > 0$ กราฟพุ่งขึ้น และ $f'(x) < 0$ กราฟปักหัวลง

**แล้วถ้ากราฟเปลี่ยนทิศล่ะ?** 🤔 ลองเล่นกราฟด้านล่างก่อนเลย''',
          ],
        }),
        ContentBlock("extrema_ig_002", "interactive_graph", {
          "path": "graph_data_extrema",
        }),
        ContentBlock("extrema_t_003", "text", {
          "content": [
            r'''กราฟนี้คือ $f(x) = x^3 - 3x^2 + 1$ — ลองเลื่อนจุดไปตามกราฟ แล้วสังเกตว่าตรง**ยอดเขา**และ**ก้นหุบ** เส้นสัมผัสเป็นยังไง และ $f'(x)$ มีค่าเท่าไร''',
          ],
        }),
        ContentBlock("extrema_ddq_004", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_004_s1",
              "content": [
                r'''เลื่อนจุดไปที่ **ยอดเขา** (จุดสูงสุดของเนิน) — ค่า $f'(x)$ ตรงนั้นเป็น ''',
                {"drop": "0"},
                r''' และก่อนถึงยอดเขากราฟกำลัง ''',
                {"drop": "1"},
                r''' หลังยอดเขากราฟกำลัง ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$0$", r"บวก", r"ลบ", r"พุ่งขึ้น", r"ปักหัวลง"],
              "correctAnswers": {"0": r"$0$", "1": r"พุ่งขึ้น", "2": r"ปักหัวลง"},
              "explanation": r'''ยอดเขา → เส้นสัมผัสแนวนอน → $f'(x) = 0$ พอดี ก่อนถึงกราฟพุ่งขึ้น หลังจากนั้นปักหัวลง 💚''',
            },
            {
              "questionId": "extrema_ddq_004_s2",
              "content": [
                r'''เลื่อนจุดไปที่ **ก้นหุบ** (จุดต่ำสุดของหลุม) — ก่อนถึงก้นหุบกราฟกำลัง ''',
                {"drop": "0"},
                r''' หลังก้นหุบกราฟกำลัง ''',
                {"drop": "1"},
                r''' ดังนั้นความชันเปลี่ยนจาก ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"พุ่งขึ้น", r"ปักหัวลง", r"$+ \to -$", r"$- \to +$"],
              "correctAnswers": {"0": r"ปักหัวลง", "1": r"พุ่งขึ้น", "2": r"$- \to +$"},
              "explanation": r'''ก้นหุบ → กราฟเปลี่ยนจากลงเป็นขึ้น → ความชันเปลี่ยนจากลบเป็นบวก 💚''',
            },
          ],
        }),
        ContentBlock("extrema_q_005", "question_choice", {
          "content": [
            r'''1. ถ้า $f'(x)$ เปลี่ยนเครื่องหมายจาก $+$ เป็น $-$ ที่ $x = a$ แสดงว่า $x = a$ เป็นจุดอะไร?''',
          ],
          "options": [
            r"จุดสูงสุด (ยอดเขา)",
            r"จุดต่ำสุด (ก้นหุบ)",
            r"จุดเปลี่ยนโค้ง",
            r"บอกไม่ได้",
          ],
          "correct": r"จุดสูงสุด (ยอดเขา)",
          "explanation": r'''$f'$ เปลี่ยนจาก $+$ (ขึ้น) เป็น $-$ (ลง) → กราฟขึ้นแล้วลง → จุดนั้นคือยอดเขา = จุดสูงสุด 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: จุดสูงสุด-ต่ำสุดสัมพัทธ์
    // =============================================
    ContentSection(
      headerL1: r"🎯 จุดสูงสุด-ต่ำสุดสัมพัทธ์",
      blocks: [
        ContentBlock("extrema_t_006", "text", {
          "content": [
            r'''🔹 **จุดสูงสุดสัมพัทธ์** — จุดที่สูงกว่าบริเวณรอบๆ (ยอดเขา ⛰️)

🔸 **จุดต่ำสุดสัมพัทธ์** — จุดที่ต่ำกว่าบริเวณรอบๆ (ก้นหุบ 🏞️)''',
            r'''Note = สำคัญ
ไม่จำเป็นต้องสูงสุด/ต่ำสุดของทั้งกราฟ แค่เทียบกับบริเวณรอบๆ เท่านั้น''',
          ],
        }),
        ContentBlock("extrema_t_007", "text", {
          "content": [
            r'''**ขั้นตอนหาจุดสูงสุด-ต่ำสุดสัมพัทธ์:**

**ขั้นที่ 1:** หา $f'(x)$ แล้วแก้ $f'(x) = 0$
**ขั้นที่ 2:** วาด **เส้นจำนวน** ใส่เครื่องหมาย $+/-$ ในแต่ละช่วง
**ขั้นที่ 3:** ดูการเปลี่ยนเครื่องหมาย — $(+) \to (-)$ = สูงสุด, $(-) \to (+)$ = ต่ำสุด
**ขั้นที่ 4:** แทนค่า $x$ ลง $f(x)$ เพื่อหาพิกัด $(x, y)$''',
          ],
        }),
        ContentBlock("extrema_h_008", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("extrema_t_009", "text", {
          "content": [
            r'''ให้ $f(x) = x^3 - 3x^2 + 1$ จงหาจุดสูงสุดและต่ำสุดสัมพัทธ์

มาทำทีละขั้น! 🚀''',
          ],
        }),
        ContentBlock("extrema_ddq_010", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_010_s1",
              "content": [
                r'''**ขั้นที่ 1:** หา $f'(x)$

$f(x) = x^3 - 3x^2 + 1$

$f'(x) = $ ''',
                {"drop": "0"},
                r''' $ = 3x \cdot$ ''',
                {"drop": "1"},
                r''' ดังนั้น $f'(x) = 0$ ที่ $x = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$3x^2 - 6x$", r"$3x^2 - 6x + 1$", r"$(x - 2)$", r"$(x + 2)$", r"$0$ และ $2$", r"$0$ และ $-2$"],
              "correctAnswers": {"0": r"$3x^2 - 6x$", "1": r"$(x - 2)$", "2": r"$0$ และ $2$"},
              "explanation": r'''$f'(x) = 3x^2 - 6x = 3x(x - 2) = 0$ ได้ $x = 0$ และ $x = 2$ 💚''',
            },
          ],
        }),
        ContentBlock("extrema_ddq_011", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_011_s1",
              "content": [
                r'''**ขั้นที่ 2–3:** วาดเส้นจำนวนของ $3x(x - 2)$ แล้วใส่เครื่องหมาย

จุดแบ่งช่วง: $x = 0$ และ $x = 2$''',
                {"image": "assets/extrema_numberline_1.png"},
                r'''ที่ $x = 0$: เครื่องหมายเปลี่ยนจาก ''',
                {"drop": "0"},
                r''' → เป็นจุด ''',
                {"drop": "1"},
                r'''ที่ $x = 2$: เครื่องหมายเปลี่ยนจาก ''',
                {"drop": "2"},
                r''' → เป็นจุด ''',
                {"drop": "3"},
              ],
              "draggableItems": [r"$+ \to -$", r"$- \to +$", r"สูงสุดสัมพัทธ์", r"ต่ำสุดสัมพัทธ์"],
              "correctAnswers": {"0": r"$+ \to -$", "1": r"สูงสุดสัมพัทธ์", "2": r"$- \to +$", "3": r"ต่ำสุดสัมพัทธ์"},
              "explanation": r'''เส้นจำนวน: $(+)$ | 0 | $(-)$ | 2 | $(+)$ — ที่ $x=0$ เปลี่ยน $+ \to -$ (สูงสุด) ที่ $x=2$ เปลี่ยน $- \to +$ (ต่ำสุด) 💚''',
            },
          ],
        }),
        ContentBlock("extrema_ddq_012", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_012_s1",
              "content": [
                r'''**ขั้นที่ 4:** แทนค่าลง $f(x) = x^3 - 3x^2 + 1$

$f(0) = 0 - 0 + 1 = $ ''',
                {"drop": "0"},
                r''' → จุดสูงสุดสัมพัทธ์ $(0,$ ''',
                {"drop": "0"},
                r'''$)$

$f(2) = 8 - 12 + 1 = $ ''',
                {"drop": "1"},
                r''' → จุดต่ำสุดสัมพัทธ์ $(2,$ ''',
                {"drop": "1"},
                r'''$)$''',
              ],
              "draggableItems": [r"$1$", r"$-3$", r"$0$", r"$-1$"],
              "correctAnswers": {"0": r"$1$", "1": r"$-3$"},
              "explanation": r'''จุดสูงสุดสัมพัทธ์ $(0, 1)$ และจุดต่ำสุดสัมพัทธ์ $(2, -3)$ 💚''',
            },
          ],
        }),
        ContentBlock("extrema_h_013", "header", {
          "title": r"แบบฝึก",
          "level": 2,
        }),
        ContentBlock("extrema_ddq_014", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_014_s1",
              "content": [
                r'''1. ให้ $f(x) = x^2 - 4x + 5$

จุดต่ำสุดสัมพัทธ์คือ ''',
                {"drop": "0"},
                r''' จุดสูงสุดสัมพัทธ์คือ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$(2, 1)$", r"$(1, 2)$", r"$(4, 5)$", r"ไม่มี"],
              "correctAnswers": {"0": r"$(2, 1)$", "1": r"ไม่มี"},
              "explanation": r'''$f'(x) = 2x - 4 = 2(x - 2)$ เส้นจำนวน: $(-)$ | 2 | $(+)$ เปลี่ยน $- \to +$ ที่ $x=2$ → ต่ำสุดสัมพัทธ์ ไม่มี $+ \to -$ จึงไม่มีสูงสุดสัมพัทธ์ $f(2) = 4 - 8 + 5 = 1$ → $(2, 1)$ 💚''',
            },
          ],
        }),
        ContentBlock("extrema_q_015", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = x^3$ จุดวิกฤติ $x = 0$ เป็นจุดสูงสุดหรือต่ำสุดสัมพัทธ์?''',
          ],
          "options": [
            r"จุดสูงสุดสัมพัทธ์",
            r"จุดต่ำสุดสัมพัทธ์",
            r"ไม่เป็นทั้งคู่",
            r"เป็นทั้งสูงสุดและต่ำสุด",
          ],
          "correct": r"ไม่เป็นทั้งคู่",
          "explanation": r'''$f'(x) = 3x^2$ → $f'(x) = 0$ ที่ $x = 0$

เส้นจำนวน: $(+)$ | 0 | $(+)$ — เครื่องหมาย**ไม่เปลี่ยน** จึงไม่เป็นทั้งสูงสุดและต่ำสุดสัมพัทธ์ 💚

🧠 ไม่ใช่ทุกจุดวิกฤติจะเป็นจุดสูงสุด-ต่ำสุดเสมอไป!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: แบบฝึกหัด: สัมพัทธ์
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด: สัมพัทธ์",
      blocks: [
        ContentBlock("extrema_q_016", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = 2x^3 + 3x^2 - 12x + 1$ จุดต่ำสุดสัมพัทธ์อยู่ที่ $x$ เท่าใด?''',
          ],
          "options": [r"$x = 1$", r"$x = -2$", r"$x = -1$", r"$x = 2$"],
          "correct": r"$x = 1$",
          "explanation": r'''$f'(x) = 6x^2 + 6x - 12 = 6(x^2 + x - 2) = 6(x+2)(x-1)$

เส้นจำนวน: $(+)$ | $-2$ | $(-)$ | $1$ | $(+)$

ที่ $x = 1$: $- \to +$ → ต่ำสุดสัมพัทธ์ 💚
ที่ $x = -2$: $+ \to -$ → สูงสุดสัมพัทธ์''',
        }),
        ContentBlock("extrema_q_017", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = x^4 - 4x^3$ จำนวนจุดสูงสุดและต่ำสุดสัมพัทธ์รวมกันเท่ากับ?''',
          ],
          "options": [r"$0$ จุด", r"$1$ จุด", r"$2$ จุด", r"$3$ จุด"],
          "correct": r"$1$ จุด",
          "explanation": r'''$f'(x) = 4x^3 - 12x^2 = 4x^2(x - 3)$

เส้นจำนวน: $(-)$ | $0$ | $(-)$ | $3$ | $(+)$

ที่ $x = 0$: $- \to -$ เครื่องหมายไม่เปลี่ยน → **ไม่เป็น**ทั้งสูงสุดและต่ำสุด
ที่ $x = 3$: $- \to +$ → ต่ำสุดสัมพัทธ์

สรุปมีแค่ **1 จุด** คือต่ำสุดสัมพัทธ์ที่ $x = 3$ 💚''',
        }),
        ContentBlock("extrema_q_018", "question_choice", {
          "content": [
            r'''3. ให้ $f(x) = -x^3 + 3x^2 + 9x - 5$ ค่า $y$ ของจุดสูงสุดสัมพัทธ์เท่ากับ?''',
          ],
          "options": [r"$22$", r"$-5$", r"$-10$", r"$27$"],
          "correct": r"$22$",
          "explanation": r'''$f'(x) = -3x^2 + 6x + 9 = -3(x^2 - 2x - 3) = -3(x-3)(x+1)$

เส้นจำนวน: $(-)$ | $-1$ | $(+)$ | $3$ | $(-)$

ที่ $x = 3$: $+ \to -$ → สูงสุดสัมพัทธ์

$f(3) = -27 + 27 + 27 - 5 = 22$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: จุดสูงสุด-ต่ำสุดสัมบูรณ์
    // =============================================
    ContentSection(
      headerL1: r"🌍 จุดสูงสุด-ต่ำสุดสัมบูรณ์",
      blocks: [
        ContentBlock("extrema_t_019", "text", {
          "content": [
            r'''🔹 **จุดสูงสุดสัมบูรณ์** — จุดที่สูงที่สุดของ**ทั้งช่วงที่กำหนด** 🎢

🔸 **จุดต่ำสุดสัมบูรณ์** — จุดที่ต่ำที่สุดของ**ทั้งช่วงที่กำหนด** ⌛''',
            r'''Note = ทำไมต้องกำหนดช่วง?
ถ้าไม่กำหนดช่วง พหุนามดีกรี 3 ขึ้นไปจะวิ่งไป $\pm\infty$ ได้ ไม่มีสูงสุด-ต่ำสุดสัมบูรณ์''',
          ],
        }),
        ContentBlock("extrema_t_020", "text", {
          "content": [
            r'''**วิธีหาบนช่วงปิด $[a, b]$:**

**ขั้นที่ 1:** หาจุดสูงสุด-ต่ำสุด**สัมพัทธ์**ที่อยู่ในช่วง
**ขั้นที่ 2:** คำนวณค่าที่**ขอบ** $f(a)$ และ $f(b)$
**ขั้นที่ 3:** เปรียบเทียบค่าทั้งหมด — ค่ามากสุด = สูงสุดสัมบูรณ์ ค่าน้อยสุด = ต่ำสุดสัมบูรณ์''',
          ],
        }),
        ContentBlock("extrema_h_021", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("extrema_t_022", "text", {
          "content": [
            r'''ให้ $f(x) = x^3 - 3x^2 + 1$ บนช่วง $[-1, 3]$ จงหาจุดสูงสุดและต่ำสุดสัมบูรณ์''',
          ],
        }),
        ContentBlock("extrema_ddq_023", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_023_s1",
              "content": [
                r'''**ขั้นที่ 1:** จากตัวอย่างก่อนหน้า เรารู้แล้วว่า:

สูงสุดสัมพัทธ์ที่ $(0, 1)$ และต่ำสุดสัมพัทธ์ที่ $(2, -3)$

**ขั้นที่ 2:** เช็คขอบ

$f(-1) = -1 - 3 + 1 = $ ''',
                {"drop": "0"},
                r'''$f(3) = 27 - 27 + 1 = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$-3$", r"$1$", r"$0$", r"$-1$"],
              "correctAnswers": {"0": r"$-3$", "1": r"$1$"},
              "explanation": r'''$f(-1) = -3$ และ $f(3) = 1$ 💚''',
            },
            {
              "questionId": "extrema_ddq_023_s2",
              "content": [
                r'''**ขั้นที่ 3:** เปรียบเทียบค่าทั้งหมด

$f(-1) = -3$, $f(0) = 1$, $f(2) = -3$, $f(3) = 1$

ค่า**มากที่สุด** $= 1$ → จุดสูงสุดสัมบูรณ์ ''',
                {"drop": "0"},
                r'''ค่า**น้อยที่สุด** $= -3$ → จุดต่ำสุดสัมบูรณ์ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$(0, 1)$ และ $(3, 1)$", r"$(2, -3)$ และ $(-1, -3)$", r"$(0, 1)$", r"$(2, -3)$"],
              "correctAnswers": {"0": r"$(0, 1)$ และ $(3, 1)$", "1": r"$(2, -3)$ และ $(-1, -3)$"},
              "explanation": r'''ค่ามากสุด $1$ เกิดที่ 2 จุด และค่าน้อยสุด $-3$ เกิดที่ 2 จุด — ตอบได้ทุกจุด! 💚''',
            },
          ],
        }),
        ContentBlock("extrema_h_024", "header", {
          "title": r"แบบฝึก",
          "level": 2,
        }),
        ContentBlock("extrema_ddq_025", "drag_and_drop", {
          "steps": [
            {
              "questionId": "extrema_ddq_025_s1",
              "content": [
                r'''1. ให้ $f(x) = x^3 - 12x + 1$ บนช่วง $[-3, 3]$

$f'(x) = 3x^2 - 12 = 3(x-2)(x+2)$ → จุดสัมพัทธ์ที่ $x = -2$ และ $x = 2$

$f(-2) = -8 + 24 + 1 = $ ''',
                {"drop": "0"},
                r''' $f(2) = 8 - 24 + 1 = $ ''',
                {"drop": "1"},
                r'''เช็คขอบ: $f(-3) = -27 + 36 + 1 = $ ''',
                {"drop": "2"},
                r''' $f(3) = 27 - 36 + 1 = $ ''',
                {"drop": "3"},
                r'''จุดสูงสุดสัมบูรณ์: ''',
                {"drop": "4"},
                r''' จุดต่ำสุดสัมบูรณ์: ''',
                {"drop": "5"},
              ],
              "draggableItems": [r"$17$", r"$-15$", r"$10$", r"$-8$", r"$(-2, 17)$", r"$(2, -15)$"],
              "correctAnswers": {"0": r"$17$", "1": r"$-15$", "2": r"$10$", "3": r"$-8$", "4": r"$(-2, 17)$", "5": r"$(2, -15)$"},
              "explanation": r'''เปรียบเทียบ: $10, 17, -15, -8$ → สูงสุด $17$ ที่ $(-2, 17)$ ต่ำสุด $-15$ ที่ $(2, -15)$ 💚''',
            },
          ],
        }),
        ContentBlock("extrema_q_026", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = x^2 - 6x + 5$ บนช่วง $[0, 5]$ จุดต่ำสุดสัมบูรณ์คือ?''',
          ],
          "options": [r"$(3, -4)$", r"$(0, 5)$", r"$(5, 0)$", r"$(3, -2)$"],
          "correct": r"$(3, -4)$",
          "explanation": r'''$f'(x) = 2x - 6 = 0 \to x = 3$ → ต่ำสุดสัมพัทธ์

$f(3) = 9 - 18 + 5 = -4$, $f(0) = 5$, $f(5) = 0$

ค่าน้อยสุดคือ $-4$ → จุดต่ำสุดสัมบูรณ์ $(3, -4)$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: โจทย์วิเคราะห์
    // =============================================
    ContentSection(
      headerL1: r"🔥 โจทย์วิเคราะห์",
      blocks: [
        ContentBlock("extrema_t_027", "text", {
          "content": [
            r'''โจทย์ชุดนี้ต้องใช้หลายแนวคิดรวมกัน — คิดให้ดีก่อนตอบ!''',
          ],
        }),
        ContentBlock("extrema_q_028", "question_choice", {
          "content": [
            r'''1. ให้ $f(x) = x^3 - 6x^2 + 9x + 2$ พิจารณาข้อความต่อไปนี้

ก. $f$ มีจุดสูงสุดสัมพัทธ์ที่ $(1, 6)$
ข. $f$ มีจุดต่ำสุดสัมพัทธ์ที่ $(3, 2)$
ค. บนช่วง $[0, 4]$ จุดสูงสุดสัมบูรณ์มี 2 จุด

ข้อใดถูกต้อง?''',
          ],
          "options": [
            r"ก เท่านั้น",
            r"ก และ ข",
            r"ถูกทุกข้อ",
            r"ก และ ค",
          ],
          "correct": r"ถูกทุกข้อ",
          "explanation": r'''$f'(x) = 3x^2 - 12x + 9 = 3(x-1)(x-3)$
เส้นจำนวน: $(+)$ | $1$ | $(-)$ | $3$ | $(+)$

**ก:** $x=1$: $+ \to -$ สูงสุดสัมพัทธ์ $f(1) = 1-6+9+2 = 6$ → $(1, 6)$ ✓
**ข:** $x=3$: $- \to +$ ต่ำสุดสัมพัทธ์ $f(3) = 27-54+27+2 = 2$ → $(3, 2)$ ✓
**ค:** $f(0) = 2$, $f(4) = 64-96+36+2 = 6$ → ค่ามากสุด $= 6$ ที่ $(1,6)$ และ $(4,6)$ ✓ 💚''',
        }),
        ContentBlock("extrema_q_029", "question_choice", {
          "content": [
            r'''2. ให้ $f(x) = (x^2 - a)^2$ โดย $a > 0$ ถ้า $f$ มีจุดต่ำสุดสัมพัทธ์ที่ $x = 3$ (นอกเหนือจาก $x = 0$) ค่า $a$ เท่ากับ?''',
          ],
          "options": [r"$a = 3$", r"$a = 6$", r"$a = 9$", r"$a = 12$"],
          "correct": r"$a = 9$",
          "explanation": r'''ใช้ Chain Rule: $f'(x) = 2(x^2 - a) \cdot 2x = 4x(x^2 - a)$

$f'(x) = 0$ ที่ $x = 0$ หรือ $x^2 = a$ → $x = \pm\sqrt{a}$

ต้องการให้ $x = 3$ เป็นจุดวิกฤติ → $\sqrt{a} = 3 \implies a = 9$

ตรวจ: $f'(x) = 4x(x-3)(x+3)$ ที่ $x=3$: เครื่องหมายเปลี่ยน $- \to +$ → ต่ำสุดสัมพัทธ์จริง ✓ 💚''',
        }),
        ContentBlock("extrema_q_030", "question_choice", {
          "content": [
            r'''3. ให้ $f(x) = x^3 + ax^2 + bx + 1$ มีจุดสูงสุดสัมพัทธ์ที่ $x = -1$ และจุดต่ำสุดสัมพัทธ์ที่ $x = 3$ ค่า $a + b$ เท่ากับ?''',
          ],
          "options": [r"$-12$", r"$-6$", r"$0$", r"$6$"],
          "correct": r"$-12$",
          "explanation": r'''$f'(x) = 3x^2 + 2ax + b$

จุดวิกฤติที่ $x = -1$ และ $x = 3$ → $f'(x) = 3(x+1)(x-3) = 3x^2 - 6x - 9$

เปรียบเทียบ: $2a = -6 \to a = -3$ และ $b = -9$

$a + b = -3 + (-9) = -12$ 💚''',
        }),
        ContentBlock("extrema_q_031", "question_choice", {
          "content": [
            r'''4. ให้ $f(x) = (3x^2 - 3)^2$ พิจารณาข้อความต่อไปนี้

ก. $f$ มีจุดวิกฤติ 3 จุด
ข. $f$ มีจุดต่ำสุดสัมพัทธ์ 2 จุด
ค. $f(0)$ เป็นค่าสูงสุดสัมบูรณ์ของฟังก์ชัน

ข้อใดถูกต้อง?''',
          ],
          "options": [
            r"ก เท่านั้น",
            r"ก และ ข",
            r"ก และ ค",
            r"ถูกทุกข้อ",
          ],
          "correct": r"ก และ ข",
          "explanation": r'''$f'(x) = 2(3x^2-3) \cdot 6x = 36x(x-1)(x+1)$

จุดวิกฤติ: $x = -1, 0, 1$ → **ก ✓** (3 จุด)

เส้นจำนวน: $(-)$ | $-1$ | $(+)$ | $0$ | $(-)$ | $1$ | $(+)$

$x = -1$: $- \to +$ ต่ำสุดสัมพัทธ์ ✓
$x = 0$: $+ \to -$ สูงสุดสัมพัทธ์ ✓
$x = 1$: $- \to +$ ต่ำสุดสัมพัทธ์ ✓
→ **ข ✓** (ต่ำสุดสัมพัทธ์ 2 จุด)

**ค:** $f(0) = (0-3)^2 = 9$ เป็นสูงสุด**สัมพัทธ์**ก็จริง แต่ $f(x) \to \infty$ เมื่อ $x \to \pm\infty$ ดังนั้น $9$ ไม่ใช่ค่าสูงสุด**สัมบูรณ์** ✗ 💚''',
        }),
        ContentBlock("extrema_q_032", "question_choice", {
          "content": [
            r'''5. ค่าต่ำสุดสัมบูรณ์ของ $f(x) = x^4 - 8x^2 + 16$ คือ?

Note = ฟังก์ชันนี้ไม่ได้กำหนดช่วง — แต่ลองสังเกตว่า $f(x)$ เขียนอีกแบบได้ไหม''',
          ],
          "options": [r"$0$", r"$4$", r"$16$", r"ไม่มีค่าต่ำสุดสัมบูรณ์"],
          "correct": r"$0$",
          "explanation": r'''สังเกตว่า $f(x) = (x^2 - 4)^2 \geq 0$ เสมอ

ค่าน้อยสุดเป็นไปได้คือ $0$ ซึ่งเกิดเมื่อ $x^2 = 4 \to x = \pm 2$

ตรวจ: $f'(x) = 4x^3 - 16x = 4x(x-2)(x+2) = 0$ ที่ $x = 0, \pm 2$

ที่ $x = \pm 2$: $f(\pm 2) = 0$ (ต่ำสุด) ที่ $x = 0$: $f(0) = 16$ (สูงสุดสัมพัทธ์) 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("extrema_t_033", "text", {
          "content": [
            r'''🎯 **จุดสูงสุด-ต่ำสุดสัมพัทธ์**

ดูการเปลี่ยนเครื่องหมายของ $f'(x)$ บนเส้นจำนวน:
$(+) \to (-)$ → สูงสุดสัมพัทธ์ ⛰️
$(-) \to (+)$ → ต่ำสุดสัมพัทธ์ 🏞️
ไม่เปลี่ยน → ไม่เป็นทั้งคู่ 🙅''',
          ],
        }),
        ContentBlock("extrema_t_034", "text", {
          "content": [
            r'''🌍 **จุดสูงสุด-ต่ำสุดสัมบูรณ์** บนช่วง $[a, b]$

หาจุดสัมพัทธ์ → เช็คขอบ $f(a), f(b)$ → เปรียบเทียบค่าทั้งหมด''',
          ],
        }),
        ContentBlock("extrema_t_035", "text", {
          "content": [
            r'''Note = บทต่อไป
เราจะเอาจุดสูงสุด-ต่ำสุดไปใช้แก้**โจทย์ปัญหาเชิงปฏิบัติ** — เช่น หาพื้นที่สี่เหลี่ยมมากสุดที่ทำได้ หรือต้นทุนน้อยสุด 🚀''',
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
    // =============================================
    // SECTION 1: ปริพันธ์คืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"⚙️ ปริพันธ์คืออะไร?",
      blocks: [
        ContentBlock("int_h_001", "header", {
          "title": r"ทำย้อนกลับของอนุพันธ์",
          "level": 2,
        }),
        ContentBlock("int_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เรารู้วิธีหาอนุพันธ์:

$$f(x) = x^2 \implies f'(x) = 2x$$

**แต่ถ้าโจทย์ถามกลับ?** ♻️ รู้ว่า $f'(x) = 2x$ แล้วหา $f(x)$ ได้ไหม?''',
          ],
        }),
        ContentBlock("int_t_003", "text", {
          "content": [
            r'''การหา $f(x)$ จาก $f'(x)$ เรียกว่า **ปริพันธ์ (Integral)**

เขียนแทนด้วยสัญลักษณ์ $\int$ :

$$\int 2x\,dx = x^2 + c$$''',
          ],
        }),
        ContentBlock("int_h_004", "header", {
          "title": r"ทำไมต้องมี $+c$ ?",
          "level": 2,
        }),
        ContentBlock("int_t_005", "text", {
          "content": [
            r'''ลองดิฟฟังก์ชันเหล่านี้:

🔸 $\dfrac{d}{dx}(x^2 + 2) = 2x$

🔸 $\dfrac{d}{dx}(x^2 - 10000) = 2x$

🔸 $\dfrac{d}{dx}(x^2 + 999) = 2x$''',
          ],
        }),
        ContentBlock("int_t_006", "text", {
          "content": [
            r'''ทุกตัวดิฟแล้วได้ $2x$ เหมือนกันหมด! เพราะค่าคงที่ดิฟแล้วหายไป

ดังนั้นถ้ารู้แค่ $f'(x) = 2x$ เราบอกไม่ได้ว่า $f(x)$ คือ $x^2 + 2$ หรือ $x^2 - 10000$''',
          ],
        }),
        ContentBlock("int_t_007", "text", {
          "content": [
            r'''Note = ค่าคงที่ $c$

เราจึงเขียน $\int 2x\,dx = x^2 + c$ โดย $c$ แทนค่าคงที่**อะไรก็ได้**

$c$ เรียกว่า **ค่าคงที่ของการอินทิเกรต** — ต้องเขียน $+c$ **ทุกครั้ง**! 🚨''',
          ],
        }),
        ContentBlock("int_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_008_s1",
              "content": [
                r'''ฟังก์ชันใดบ้างที่ดิฟแล้วได้ $3x^2$?

🔸 $\dfrac{d}{dx}(x^3) = 3x^2$ ✅

🔸 $\dfrac{d}{dx}(x^3 + 5) = 3x^2$ ✅

🔸 $\dfrac{d}{dx}(x^3 - 42) = 3x^2$ ✅

ดังนั้น $\int 3x^2\,dx = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$x^3$", r"$x^3 + 5$", r"$x^3 + c$", r"$3x^3 + c$"],
              "correctAnswers": {"0": r"$x^3 + c$"},
              "explanation": r'''เพราะ $c$ แทนค่าคงที่อะไรก็ได้ จึงครอบคลุมทุกกรณี ($+5$, $-42$, ฯลฯ) 💚''',
            },
          ],
        }),
        ContentBlock("int_h_009", "header", {
          "title": r"สัญลักษณ์ที่ใช้",
          "level": 2,
        }),
        ContentBlock("int_t_010", "text", {
          "content": [
            r'''$$F(x) = \int f(x)\,dx$$

🔸 $\int$ = สัญลักษณ์ปริพันธ์

🔸 $f(x)$ = ฟังก์ชันที่ต้องการหาปริพันธ์

🔸 $dx$ = บอกว่าอินทิเกรตเทียบกับตัวแปร $x$''',
          ],
        }),
        ContentBlock("int_t_011", "text", {
          "content": [
            r'''🔸 $F(x)$ = ผลลัพธ์ที่ได้ (ฟังก์ชันเดิมก่อนดิฟ)

ความสัมพันธ์สำคัญ:

$$F'(x) = f(x)$$

แปลว่า **ดิฟของปริพันธ์ จะได้ฟังก์ชันเดิมกลับมา** 🔄''',
          ],
        }),
        ContentBlock("int_ddq_012", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_012_s1",
              "content": [
                r'''เรารู้ว่า $\dfrac{d}{dx}(x^4) = 4x^3$

ดังนั้น $\int 4x^3\,dx = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$x^4 + c$", r"$4x^4 + c$", r"$x^3 + c$", r"$12x^2 + c$"],
              "correctAnswers": {"0": r"$x^4 + c$"},
              "explanation": r'''ดิฟของ $x^4$ ได้ $4x^3$ ดังนั้นปริพันธ์ของ $4x^3$ คือ $x^4 + c$ 💚''',
            },
          ],
        }),
        ContentBlock("int_q_013", "question_choice", {
          "content": [
            r'''1. $\int 5x^4\,dx = ?$

Note = คำใบ้: นึกว่าฟังก์ชันอะไรดิฟแล้วได้ $5x^4$''',
          ],
          "options": [
            r"$x^5 + c$",
            r"$5x^5 + c$",
            r"$20x^3 + c$",
            r"$\dfrac{5x^5}{4} + c$",
          ],
          "correct": r"$x^5 + c$",
          "explanation": r'''$\dfrac{d}{dx}(x^5) = 5x^4$ ดังนั้น $\int 5x^4\,dx = x^5 + c$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: สมบัติและการใช้งาน
    // =============================================
    ContentSection(
      headerL1: r"✨ สมบัติและการใช้งาน",
      blocks: [
        ContentBlock("int_h_014", "header", {
          "title": r"สมบัติที่ 1 — ค่าคงที่",
          "level": 2,
        }),
        ContentBlock("int_t_015", "text", {
          "content": [
            r'''$$\int k\,dx = kx + c$$

เมื่อ $k$ เป็นค่าคงที่ (ตัวเลขที่ไม่มี $x$)

**📝 เช่น** $\int 5\,dx = 5x + c$ , $\int (-3)\,dx = -3x + c$''',
          ],
        }),
        ContentBlock("int_h_016", "header", {
          "title": r"สมบัติที่ 2 — เลขยกกำลัง (Power Rule)",
          "level": 2,
        }),
        ContentBlock("int_t_017", "text", {
          "content": [
            r'''$$\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c \qquad (n \neq -1)$$

💬 **วิธีจำ:** "เพิ่มเลขชี้กำลังขึ้น 1 แล้วหารด้วยเลขชี้กำลังใหม่" 🎯''',
          ],
        }),
        ContentBlock("int_t_018", "text", {
          "content": [
            r'''Note = เปรียบเทียบกับอนุพันธ์

อนุพันธ์: ตบลงมาคูณ แล้ว**ลบ** 1

ปริพันธ์: **เพิ่ม** 1 แล้วหาร — ทำ**ย้อนกลับ**กันพอดี!''',
          ],
        }),
        ContentBlock("int_ddq_019", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_019_s1",
              "content": [
                r'''จงหา $\int x^3\,dx$

เพิ่มเลขชี้กำลัง: $3 + 1 = 4$

หารด้วยเลขชี้กำลังใหม่:

$\int x^3\,dx = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{x^4}{4} + c$", r"$3x^2 + c$", r"$x^4 + c$", r"$\dfrac{x^4}{3} + c$"],
              "correctAnswers": {"0": r"$\dfrac{x^4}{4} + c$"},
              "explanation": r'''$\dfrac{x^{3+1}}{3+1} + c = \dfrac{x^4}{4} + c$ 💚''',
            },
          ],
        }),
        ContentBlock("int_h_020", "header", {
          "title": r"สมบัติที่ 3 — คูณด้วยค่าคงที่",
          "level": 2,
        }),
        ContentBlock("int_t_021", "text", {
          "content": [
            r'''$$\int k \cdot f(x)\,dx = k \cdot \int f(x)\,dx$$

💬 **ความหมาย:** ค่าคงที่ที่คูณอยู่ ดึงออกมาข้างนอก $\int$ ได้เลย — เหมือนกับตอนหาอนุพันธ์!''',
          ],
        }),
        ContentBlock("int_ddq_022", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_022_s1",
              "content": [
                r'''จงหา $\int 6x^2\,dx$

ดึง $6$ ออกมา → $6 \cdot \int x^2\,dx = 6 \cdot \dfrac{x^3}{3} + c = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$2x^3 + c$", r"$6x^3 + c$", r"$\dfrac{6x^3}{3} + c$", r"$18x + c$"],
              "correctAnswers": {"0": r"$2x^3 + c$"},
              "explanation": r'''$6 \times \dfrac{x^3}{3} = 2x^3$ ดังนั้นคำตอบคือ $2x^3 + c$ 💚''',
            },
          ],
        }),
        ContentBlock("int_h_023", "header", {
          "title": r"สมบัติที่ 4 — ผลบวกและผลต่าง",
          "level": 2,
        }),
        ContentBlock("int_t_024", "text", {
          "content": [
            r'''$$\int [f(x) \pm g(x)]\,dx = \int f(x)\,dx \pm \int g(x)\,dx$$

💬 **ความหมาย:** แยกอินทิเกรต**ทีละพจน์**ได้เลย — เหมือนตอนดิฟ!''',
          ],
        }),
        ContentBlock("int_t_025", "text", {
          "content": [
            r'''Note = รวม 4 สมบัติเข้าด้วยกัน

สมบัติ 1–4 ทำให้เราหาปริพันธ์ของ**พหุนามทุกตัว**ได้ทันที — แยกทีละพจน์ ดึงค่าคงที่ออก แล้วใช้ Power Rule!

(เหมือนตอนหาอนุพันธ์เลย แค่ทำย้อนกลับ)''',
          ],
        }),
        ContentBlock("int_h_026", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("int_ddq_027", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_027_s1",
              "content": [
                r'''จงหา $\int (3x^2 + 4x - 5)\,dx$

แยกทีละพจน์:

$\int 3x^2\,dx = $ ''',
                {"drop": "0"},
                r''' , $\int 4x\,dx = $ ''',
                {"drop": "1"},
                r''' , $\int 5\,dx = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$x^3$", r"$2x^2$", r"$5x$", r"$3x$", r"$\dfrac{4x^2}{2}$"],
              "correctAnswers": {"0": r"$x^3$", "1": r"$2x^2$", "2": r"$5x$"},
              "explanation": r'''รวมกัน: $x^3 + 2x^2 - 5x + c$ 💚''',
            },
          ],
        }),
        ContentBlock("int_ddq_028", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_028_s1",
              "content": [
                r'''จงหา $\int \left(\dfrac{1}{x^3} + \sqrt{x}\right)\,dx$

เขียนใหม่ (จากที่เรียนในบทอนุพันธ์):

$\dfrac{1}{x^3} = x^{-3}$ , $\sqrt{x} = x^{1/2}$

$\int x^{-3}\,dx = \dfrac{x^{-2}}{-2} = $ ''',
                {"drop": "0"},
                r'''$\int x^{1/2}\,dx = \dfrac{x^{3/2}}{3/2} = $ ''',
                {"drop": "1"},
                r'''รวมกัน: ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$-\dfrac{1}{2x^2}$",
                r"$\dfrac{2x^{3/2}}{3}$",
                r"$-\dfrac{1}{2x^2} + \dfrac{2x^{3/2}}{3} + c$",
                r"$\dfrac{1}{2x^2}$",
              ],
              "correctAnswers": {
                "0": r"$-\dfrac{1}{2x^2}$",
                "1": r"$\dfrac{2x^{3/2}}{3}$",
                "2": r"$-\dfrac{1}{2x^2} + \dfrac{2x^{3/2}}{3} + c$",
              },
              "explanation": r'''เขียนเป็นเลขยกกำลังก่อน แล้วใช้ Power Rule ตามปกติ 💚''',
            },
          ],
        }),
        ContentBlock("int_h_029", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("int_q_030", "question_choice", {
          "content": [
            r'''1. $\int 7\,dx = ?$''',
          ],
          "options": [r"$7x + c$", r"$7 + c$", r"$0$", r"$\dfrac{7x^2}{2} + c$"],
          "correct": r"$7x + c$",
          "explanation": r'''ใช้สมบัติที่ 1: $\int k\,dx = kx + c$ → $7x + c$ 💚''',
        }),
        ContentBlock("int_q_031", "question_choice", {
          "content": [
            r'''2. $\int x^5\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{x^6}{6} + c$",
            r"$5x^4 + c$",
            r"$x^6 + c$",
            r"$\dfrac{x^5}{5} + c$",
          ],
          "correct": r"$\dfrac{x^6}{6} + c$",
          "explanation": r'''เพิ่มเลขชี้กำลัง: $5+1=6$ แล้วหาร $6$ ได้ $\dfrac{x^6}{6} + c$ 💚''',
        }),
        ContentBlock("int_q_032", "question_choice", {
          "content": [
            r'''3. $\int 4x^3\,dx = ?$''',
          ],
          "options": [
            r"$x^4 + c$",
            r"$4x^4 + c$",
            r"$12x^2 + c$",
            r"$\dfrac{4x^4}{4} + c$",
          ],
          "correct": r"$x^4 + c$",
          "explanation": r'''$4 \times \dfrac{x^4}{4} + c = x^4 + c$ 💚''',
        }),
        ContentBlock("int_q_033", "question_choice", {
          "content": [
            r'''4. $\int (x^2 - 2x + 1)\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{x^3}{3} - x^2 + x + c$",
            r"$2x - 2 + c$",
            r"$\dfrac{x^3}{3} - 2x^2 + x + c$",
            r"$x^3 - x^2 + x + c$",
          ],
          "correct": r"$\dfrac{x^3}{3} - x^2 + x + c$",
          "explanation": r'''แยกทีละพจน์: $\dfrac{x^3}{3} - \dfrac{2x^2}{2} + x + c = \dfrac{x^3}{3} - x^2 + x + c$ 💚''',
        }),
        ContentBlock("int_q_034", "question_choice", {
          "content": [
            r'''5. $\int \sqrt{x}\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{2x^{3/2}}{3} + c$",
            r"$\dfrac{1}{2\sqrt{x}} + c$",
            r"$\dfrac{x^{3/2}}{3} + c$",
            r"$2\sqrt{x} + c$",
          ],
          "correct": r"$\dfrac{2x^{3/2}}{3} + c$",
          "explanation": r'''$\sqrt{x} = x^{1/2}$ → $\dfrac{x^{3/2}}{3/2} = \dfrac{2x^{3/2}}{3} + c$ 💚''',
        }),
        ContentBlock("int_q_035", "question_choice", {
          "content": [
            r'''6. $\int \dfrac{1}{x^2}\,dx = ?$''',
          ],
          "options": [
            r"$-\dfrac{1}{x} + c$",
            r"$\dfrac{1}{x} + c$",
            r"$-\dfrac{2}{x^3} + c$",
            r"$\dfrac{x^{-1}}{2} + c$",
          ],
          "correct": r"$-\dfrac{1}{x} + c$",
          "explanation": r'''$\dfrac{1}{x^2} = x^{-2}$ → $\dfrac{x^{-1}}{-1} + c = -\dfrac{1}{x} + c$ 💚''',
        }),
        ContentBlock("int_q_036", "question_choice", {
          "content": [
            r'''7. $\int (6x^2 - 4x + 3)\,dx = ?$''',
          ],
          "options": [
            r"$2x^3 - 2x^2 + 3x + c$",
            r"$12x - 4 + c$",
            r"$6x^3 - 4x^2 + 3x + c$",
            r"$2x^3 - 2x^2 + c$",
          ],
          "correct": r"$2x^3 - 2x^2 + 3x + c$",
          "explanation": r'''$\dfrac{6x^3}{3} - \dfrac{4x^2}{2} + 3x + c = 2x^3 - 2x^2 + 3x + c$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ปริพันธ์จำกัดเขต
    // =============================================
    ContentSection(
      headerL1: r"⏰ ปริพันธ์จำกัดเขต",
      blocks: [
        ContentBlock("int_h_037", "header", {
          "title": r"จากไม่จำกัดเขต สู่จำกัดเขต",
          "level": 2,
        }),
        ContentBlock("int_t_038", "text", {
          "content": [
            r'''ที่ผ่านมาเราหา $\int f(x)\,dx$ ซึ่งได้คำตอบเป็น**ฟังก์ชัน** (มี $+c$)

แต่ถ้าเราต้องการ**ตัวเลข**ล่ะ? ก็ใส่ขอบเขตเข้าไป!

$$\int_a^b f(x)\,dx = F(b) - F(a)$$''',
          ],
        }),
        ContentBlock("int_t_039", "text", {
          "content": [
            r'''🔸 $a$ = ขอบเขตล่าง , $b$ = ขอบเขตบน

🔸 $F(x) = \int f(x)\,dx$ (หาปริพันธ์ตามปกติ)

🔸 แทนค่า $b$ ลงใน $F$ แล้วลบด้วยแทนค่า $a$''',
          ],
        }),
        ContentBlock("int_t_040", "text", {
          "content": [
            r'''Note = $+c$ หายไป!

$F(b) - F(a) = (\ldots + c) - (\ldots + c)$ → $c$ ตัดกันหายไปเอง

ดังนั้นปริพันธ์จำกัดเขต**ไม่ต้องเขียน** $+c$ 🎉''',
          ],
        }),
        ContentBlock("int_h_041", "header", {
          "title": r"ตัวอย่าง — ลองทำตาม",
          "level": 2,
        }),
        ContentBlock("int_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_042_s1",
              "content": [
                r'''จงหา $\int_1^3 (x + 5)\,dx$

**ขั้นที่ 1:** หาปริพันธ์

$F(x) = \int (x + 5)\,dx = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{x^2}{2} + 5x$",
                r"$x^2 + 5x$",
                r"$\dfrac{x^2}{2} + 5$",
              ],
              "correctAnswers": {"0": r"$\dfrac{x^2}{2} + 5x$"},
              "explanation": r'''$\int x\,dx + \int 5\,dx = \dfrac{x^2}{2} + 5x$ ✅''',
            },
            {
              "questionId": "int_ddq_042_s2",
              "content": [
                r'''**ขั้นที่ 2:** แทนค่าบน $F(3)$ และค่าล่าง $F(1)$

$F(3) = \dfrac{9}{2} + 15 = $ ''',
                {"drop": "0"},
                r'''$F(1) = \dfrac{1}{2} + 5 = $ ''',
                {"drop": "1"},
                r'''**ขั้นที่ 3:** ลบกัน $F(3) - F(1) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$\dfrac{39}{2}$", r"$\dfrac{11}{2}$", r"$14$", r"$19$"],
              "correctAnswers": {"0": r"$\dfrac{39}{2}$", "1": r"$\dfrac{11}{2}$", "2": r"$14$"},
              "explanation": r'''$\dfrac{39}{2} - \dfrac{11}{2} = \dfrac{28}{2} = 14$ 💚''',
            },
          ],
        }),
        ContentBlock("int_ddq_043", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_043_s1",
              "content": [
                r'''จงหา $\int_0^2 (3x^2 - 2x)\,dx$

$F(x) = x^3 - x^2$

$F(2) = 8 - 4 = $ ''',
                {"drop": "0"},
                r''' , $F(0) = $ ''',
                {"drop": "1"},
                r'''คำตอบ: $F(2) - F(0) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$4$", r"$0$", r"$4$", r"$8$", r"$2$"],
              "correctAnswers": {"0": r"$4$", "1": r"$0$", "2": r"$4$"},
              "explanation": r'''$4 - 0 = 4$ 💚''',
            },
          ],
        }),
        ContentBlock("int_h_044", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("int_q_045", "question_choice", {
          "content": [
            r'''1. $\int_0^2 x^2\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{8}{3}$",
            r"$4$",
            r"$\dfrac{4}{3}$",
            r"$8$",
          ],
          "correct": r"$\dfrac{8}{3}$",
          "explanation": r'''$F(x) = \dfrac{x^3}{3}$

$F(2) - F(0) = \dfrac{8}{3} - 0 = \dfrac{8}{3}$ 💚''',
        }),
        ContentBlock("int_q_046", "question_choice", {
          "content": [
            r'''2. $\int_1^4 (2x + 1)\,dx = ?$''',
          ],
          "options": [r"$18$", r"$15$", r"$21$", r"$12$"],
          "correct": r"$18$",
          "explanation": r'''$F(x) = x^2 + x$

$F(4) - F(1) = (16 + 4) - (1 + 1) = 20 - 2 = 18$ 💚''',
        }),
        ContentBlock("int_q_047", "question_choice", {
          "content": [
            r'''3. $\int_{-1}^{2} (x^2 + 2)\,dx = ?$''',
          ],
          "options": [r"$9$", r"$6$", r"$12$", r"$\dfrac{27}{3}$"],
          "correct": r"$9$",
          "explanation": r'''$F(x) = \dfrac{x^3}{3} + 2x$

$F(2) = \dfrac{8}{3} + 4 = \dfrac{20}{3}$

$F(-1) = \dfrac{-1}{3} - 2 = -\dfrac{7}{3}$

$\dfrac{20}{3} - \left(-\dfrac{7}{3}\right) = \dfrac{27}{3} = 9$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("int_t_048", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้**ยากขึ้น** ผสมทั้งปริพันธ์ไม่จำกัดเขตและจำกัดเขต ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("int_ddq_049", "drag_and_drop", {
          "steps": [
            {
              "questionId": "int_ddq_049_s1",
              "content": [
                r'''1. จงหา $\int \left(\dfrac{x^3 - 6x}{3}\right)\,dx$

Note = คำใบ้: ดึง $\dfrac{1}{3}$ ออกมาก่อน!

$= \dfrac{1}{3} \int (x^3 - 6x)\,dx = \dfrac{1}{3}\left(\dfrac{x^4}{4} - 3x^2\right) + c = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{x^4}{12} - x^2 + c$",
                r"$\dfrac{x^4}{4} - 3x^2 + c$",
                r"$\dfrac{x^4}{12} - 3x^2 + c$",
                r"$x^4 - x^2 + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{x^4}{12} - x^2 + c$"},
              "explanation": r'''$\dfrac{1}{3} \cdot \dfrac{x^4}{4} = \dfrac{x^4}{12}$ และ $\dfrac{1}{3} \cdot 3x^2 = x^2$ 💚''',
            },
          ],
        }),
        ContentBlock("int_q_050", "question_choice", {
          "content": [
            r'''2. $\int \left(x + \dfrac{1}{x^3}\right)\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$",
            r"$\dfrac{x^2}{2} + \dfrac{1}{x^2} + c$",
            r"$x^2 - \dfrac{1}{2x^2} + c$",
            r"$\dfrac{x^2}{2} - \dfrac{1}{x^2} + c$",
          ],
          "correct": r"$\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$",
          "explanation": r'''$\int x\,dx = \dfrac{x^2}{2}$

$\int x^{-3}\,dx = \dfrac{x^{-2}}{-2} = -\dfrac{1}{2x^2}$

รวมได้ $\dfrac{x^2}{2} - \dfrac{1}{2x^2} + c$ 💚''',
        }),
        ContentBlock("int_q_051", "question_choice", {
          "content": [
            r'''3. $\int_0^1 (3x^2 - 2x + 1)\,dx = ?$''',
          ],
          "options": [r"$1$", r"$2$", r"$0$", r"$3$"],
          "correct": r"$1$",
          "explanation": r'''$F(x) = x^3 - x^2 + x$

$F(1) - F(0) = (1 - 1 + 1) - 0 = 1$ 💚''',
        }),
        ContentBlock("int_q_052", "question_choice", {
          "content": [
            r'''4. $\int_1^3 \dfrac{1}{x^2}\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{2}{3}$",
            r"$\dfrac{1}{3}$",
            r"$1$",
            r"$-\dfrac{2}{3}$",
          ],
          "correct": r"$\dfrac{2}{3}$",
          "explanation": r'''$F(x) = -\dfrac{1}{x}$

$F(3) - F(1) = -\dfrac{1}{3} - (-1) = -\dfrac{1}{3} + 1 = \dfrac{2}{3}$ 💚''',
        }),
        ContentBlock("int_q_053", "question_choice", {
          "content": [
            r'''5. $\int_0^4 \sqrt{x}\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{16}{3}$",
            r"$4$",
            r"$\dfrac{8}{3}$",
            r"$8$",
          ],
          "correct": r"$\dfrac{16}{3}$",
          "explanation": r'''$F(x) = \dfrac{2x^{3/2}}{3}$

$F(4) = \dfrac{2 \cdot 8}{3} = \dfrac{16}{3}$ , $F(0) = 0$

$\dfrac{16}{3} - 0 = \dfrac{16}{3}$ 💚''',
        }),
        ContentBlock("int_q_054", "question_choice", {
          "content": [
            r'''6. ถ้า $F'(x) = 6x^2 + 2$ และ $F(0) = 5$ แล้ว $F(1) = ?$

Note = คำใบ้: หา $F(x)$ จากปริพันธ์ แล้วใช้เงื่อนไข $F(0) = 5$ หาค่า $c$''',
          ],
          "options": [r"$9$", r"$8$", r"$7$", r"$13$"],
          "correct": r"$9$",
          "explanation": r'''$F(x) = \int (6x^2 + 2)\,dx = 2x^3 + 2x + c$

$F(0) = 0 + 0 + c = 5$ → $c = 5$

$F(x) = 2x^3 + 2x + 5$

$F(1) = 2 + 2 + 5 = 9$ 💚

🧠 **ข้อสังเกต:** ถ้ารู้ค่าฟังก์ชันที่จุดใดจุดหนึ่ง จะหาค่า $c$ ที่แน่นอนได้!''',
        }),
        ContentBlock("int_q_055", "question_choice", {
          "content": [
            r'''7. $\int_{-2}^{2} (x^3 + x)\,dx = ?$

Note = คำใบ้: ลองคิดดูว่าจำเป็นต้องคำนวณเต็มๆ ไหม?''',
          ],
          "options": [r"$0$", r"$4$", r"$8$", r"$16$"],
          "correct": r"$0$",
          "explanation": r'''$F(x) = \dfrac{x^4}{4} + \dfrac{x^2}{2}$

$F(2) = 4 + 2 = 6$ , $F(-2) = 4 + 2 = 6$

$6 - 6 = 0$ 💚

🧠 **ข้อสังเกต:** $x^3 + x$ เป็นฟังก์ชันคี่ (odd function) ซึ่งอินทิเกรตจาก $-a$ ถึง $a$ จะได้ $0$ เสมอ!''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("int_t_056", "text", {
          "content": [
            r'''🎯 **ปริพันธ์ (Integral) = ทำย้อนกลับของอนุพันธ์**

**4 สมบัติสำคัญ:**

**1. ค่าคงที่:** $\int k\,dx = kx + c$

**2. เลขยกกำลัง:** $\int x^n\,dx = \dfrac{x^{n+1}}{n+1} + c$ — เพิ่ม 1 แล้วหาร $(n \neq -1)$''',
          ],
        }),
        ContentBlock("int_t_057", "text", {
          "content": [
            r'''**3. คูณค่าคงที่:** $\int k \cdot f(x)\,dx = k \int f(x)\,dx$ — ดึงออกมาได้

**4. ผลบวก/ลบ:** $\int [f \pm g]\,dx = \int f\,dx \pm \int g\,dx$ — แยกทีละพจน์ได้''',
          ],
        }),
        ContentBlock("int_t_058", "text", {
          "content": [
            r'''**ปริพันธ์จำกัดเขต:**

$$\int_a^b f(x)\,dx = F(b) - F(a)$$

แทนค่าบนลบล่าง — $c$ ตัดกันหายไปเอง!''',
          ],
        }),
        ContentBlock("int_t_059", "text", {
          "content": [
            r'''Note = ข้อควรระวัง

🔸 ปริพันธ์ไม่จำกัดเขต → **ต้องเขียน $+c$ ทุกครั้ง!**

🔸 $\dfrac{1}{x^n}$ → เขียนเป็น $x^{-n}$ แล้วใช้ Power Rule

🔸 $\sqrt{x}$ → เขียนเป็น $x^{1/2}$ แล้วใช้ Power Rule

🔸 สูตร Power Rule ใช้ไม่ได้เมื่อ $n = -1$ (จะเรียนเพิ่มในบทถัดไป!)''',
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
    // =============================================
    // SECTION 1: ทำไมต้องเปลี่ยนตัวแปร?
    // =============================================
    ContentSection(
      headerL1: r"🤔 ทำไมต้องเปลี่ยนตัวแปร?",
      blocks: [
        ContentBlock("usub_h_001", "header", {
          "title": r"ปริพันธ์ที่ Power Rule ช่วยไม่ได้",
          "level": 2,
        }),
        ContentBlock("usub_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เรารู้วิธีหาปริพันธ์พื้นฐาน เช่น $\int x^3\,dx = \dfrac{x^4}{4} + c$

แต่ถ้าเจอแบบนี้ล่ะ? 🤔

$$\int 2x(x^2 + 1)^5\,dx$$''',
          ],
        }),
        ContentBlock("usub_t_003", "text", {
          "content": [
            r'''กางวงเล็บ $(x^2+1)^5$ แล้วคูณทีละพจน์? ได้... แต่ยาวมาก! 😵

ต้องมีวิธีที่ดีกว่านี้ — นั่นคือ **การเปลี่ยนตัวแปร** (U-Substitution) 🚀''',
          ],
        }),
        ContentBlock("usub_h_004", "header", {
          "title": r"จำ Chain Rule ได้ไหม?",
          "level": 2,
        }),
        ContentBlock("usub_t_005", "text", {
          "content": [
            r'''ตอนหาอนุพันธ์ เราเคยใช้ Chain Rule:

$$\dfrac{d}{dx}\left[(x^2 + 1)^6\right] = 6(x^2 + 1)^5 \cdot 2x = 12x(x^2+1)^5$$

ลองดิฟ $\dfrac{(x^2+1)^6}{6}$ ดูสิ — จะได้ $2x(x^2+1)^5$ พอดี!''',
          ],
        }),
        ContentBlock("usub_t_006", "text", {
          "content": [
            r'''Note = หลักการสำคัญ

การเปลี่ยนตัวแปร = **ทำ Chain Rule ย้อนกลับ**

เหมือนกับที่ Power Rule ของปริพันธ์ คือ Power Rule ของอนุพันธ์ย้อนกลับ!''',
          ],
        }),
        ContentBlock("usub_ddq_007", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_007_s1",
              "content": [
                r'''เรารู้ว่า $\dfrac{d}{dx}\left[(x^2 + 1)^6\right] = 12x(x^2+1)^5$

ดังนั้น $\dfrac{d}{dx}\left[\dfrac{(x^2 + 1)^6}{6}\right] = 2x(x^2+1)^5$

แปลว่า $\int 2x(x^2+1)^5\,dx = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{(x^2+1)^6}{6} + c$",
                r"$(x^2+1)^6 + c$",
                r"$12x(x^2+1)^5 + c$",
                r"$\dfrac{(x^2+1)^5}{5} + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{(x^2+1)^6}{6} + c$"},
              "explanation": r'''ดิฟของ $\dfrac{(x^2+1)^6}{6}$ ได้ $2x(x^2+1)^5$ ดังนั้นปริพันธ์ก็คือ $\dfrac{(x^2+1)^6}{6} + c$ 💚''',
            },
          ],
        }),
        ContentBlock("usub_t_008", "text", {
          "content": [
            r'''เราเดาคำตอบได้เพราะจำ Chain Rule ได้ แต่ถ้าโจทย์ซับซ้อนขึ้น การเดาจะยาก

เราต้องการ**วิธีที่เป็นระบบ** — นั่นคือการเปลี่ยนตัวแปร!''',
          ],
        }),
        ContentBlock("usub_q_009", "question_choice", {
          "content": [
            r'''1. $\dfrac{d}{dx}\left[(x^3 + 2)^4\right] = ?$

Note = คำใบ้: ใช้ Chain Rule — ดิฟข้างนอกก่อน แล้วคูณดิฟข้างใน''',
          ],
          "options": [
            r"$12x^2(x^3+2)^3$",
            r"$4(x^3+2)^3$",
            r"$3x^2(x^3+2)^3$",
            r"$12x(x^3+2)^3$",
          ],
          "correct": r"$12x^2(x^3+2)^3$",
          "explanation": r'''$4(x^3+2)^3 \cdot 3x^2 = 12x^2(x^3+2)^3$

ดังนั้น $\int 12x^2(x^3+2)^3\,dx = (x^3+2)^4 + c$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: วิธีการเปลี่ยนตัวแปร (5 ขั้นตอน)
    // =============================================
    ContentSection(
      headerL1: r"📐 วิธีการเปลี่ยนตัวแปร",
      blocks: [
        ContentBlock("usub_h_010", "header", {
          "title": r"5 ขั้นตอน",
          "level": 2,
        }),
        ContentBlock("usub_t_011", "text", {
          "content": [
            r'''**ขั้นที่ 1:** เลือก $u = g(x)$ — มักเป็นส่วนที่อยู่ภายในวงเล็บ หรือภายใต้รากที่

**ขั้นที่ 2:** หา $du = g'(x)\,dx$

**ขั้นที่ 3:** แทนค่า $u$ และ $du$ เข้าไปในปริพันธ์''',
          ],
        }),
        ContentBlock("usub_t_012", "text", {
          "content": [
            r'''**ขั้นที่ 4:** หาปริพันธ์ตาม $u$ (ใช้ Power Rule ได้เลย!)

**ขั้นที่ 5:** แทน $u = g(x)$ กลับเป็น $x$''',
          ],
        }),
        ContentBlock("usub_t_013", "text", {
          "content": [
            r'''Note = ทำไมวิธีนี้ใช้ได้?

จาก $u = g(x)$ → $\dfrac{du}{dx} = g'(x)$ → $du = g'(x)\,dx$

เราใช้ $du$ แทน $g'(x)\,dx$ ได้เลย! ทำให้ปริพันธ์เปลี่ยนเป็นรูปง่ายๆ ตาม $u$''',
          ],
        }),
        ContentBlock("usub_h_014", "header", {
          "title": r"ตัวอย่าง — ทำทีละขั้น",
          "level": 2,
        }),
        ContentBlock("usub_t_015", "text", {
          "content": [
            r'''จงหา $\int 2x(x^2 + 1)^5\,dx$

ลองทำตามทีละขั้น! 👇''',
          ],
        }),
        ContentBlock("usub_ddq_016", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_016_s1",
              "content": [
                r'''☝️ **ขั้นที่ 1:** เลือก $u$

สังเกต: $(x^2 + 1)$ อยู่ภายในยกกำลัง 5 และ $\dfrac{d}{dx}(x^2+1) = 2x$ มีอยู่ในโจทย์!

เลือก $u = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$x^2 + 1$",
                r"$2x$",
                r"$(x^2 + 1)^5$",
                r"$x^2$",
              ],
              "correctAnswers": {"0": r"$x^2 + 1$"},
              "explanation": r'''เลือกส่วนที่อยู่ภายในยกกำลัง — $u = x^2 + 1$ ✅''',
            },
            {
              "questionId": "usub_ddq_016_s2",
              "content": [
                r'''🔧 **ขั้นที่ 2:** หา $du$

$u = x^2 + 1$ → $\dfrac{du}{dx} = 2x$

ดังนั้น $du = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$2x\,dx$",
                r"$x\,dx$",
                r"$2\,dx$",
                r"$dx$",
              ],
              "correctAnswers": {"0": r"$2x\,dx$"},
              "explanation": r'''ดิฟ $u$ แล้วเขียนเป็น $du = 2x\,dx$ ✅''',
            },
            {
              "questionId": "usub_ddq_016_s3",
              "content": [
                r'''🔄 **ขั้นที่ 3:** แทนค่า

$\int \underbrace{(x^2 + 1)^5}_{u^5} \cdot \underbrace{2x\,dx}_{du}$

$= \int$ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$u^5\,du$",
                r"$u^5\,dx$",
                r"$2xu^5\,du$",
                r"$5u^4\,du$",
              ],
              "correctAnswers": {"0": r"$u^5\,du$"},
              "explanation": r'''แทนแล้วได้ $\int u^5\,du$ — ง่ายขึ้นเยอะ! ✅''',
            },
            {
              "questionId": "usub_ddq_016_s4",
              "content": [
                r'''⚡ **ขั้นที่ 4:** หาปริพันธ์ตาม $u$

$\int u^5\,du = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{u^6}{6} + c$",
                r"$u^6 + c$",
                r"$5u^4 + c$",
                r"$\dfrac{u^5}{5} + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{u^6}{6} + c$"},
              "explanation": r'''Power Rule: $\dfrac{u^{5+1}}{5+1} + c = \dfrac{u^6}{6} + c$ ✅''',
            },
            {
              "questionId": "usub_ddq_016_s5",
              "content": [
                r'''🏁 **ขั้นที่ 5:** แทน $u$ กลับ

$\dfrac{u^6}{6} + c$ → แทน $u = x^2 + 1$:

$= $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{(x^2+1)^6}{6} + c$",
                r"$(x^2+1)^6 + c$",
                r"$\dfrac{x^{12}}{6} + c$",
              ],
              "correctAnswers": {"0": r"$\dfrac{(x^2+1)^6}{6} + c$"},
              "explanation": r'''แทน $u$ กลับเป็น $x$ ได้คำตอบสุดท้าย! 🎉''',
            },
          ],
        }),
        ContentBlock("usub_h_017", "header", {
          "title": r"เคล็ดลับการเลือก $u$",
          "level": 2,
        }),
        ContentBlock("usub_t_018", "text", {
          "content": [
            r'''🔸 เลือกส่วนที่อยู่**ภายใน**ยกกำลังหรือรากที่

🔸 ตรวจว่า**อนุพันธ์ของ $u$** ปรากฏอยู่ในโจทย์ (หรือต่างกันแค่ค่าคงที่)

🔸 ถ้าแทนแล้วยังมี $x$ เหลือ → อาจเลือก $u$ ผิด ลองใหม่!''',
          ],
        }),
        ContentBlock("usub_q_019", "question_choice", {
          "content": [
            r'''1. ถ้าต้องหา $\int 3x^2(x^3+5)^4\,dx$ ควรเลือก $u$ เป็นอะไร?''',
          ],
          "options": [
            r"$u = x^3 + 5$",
            r"$u = 3x^2$",
            r"$u = (x^3+5)^4$",
            r"$u = x^3$",
          ],
          "correct": r"$u = x^3 + 5$",
          "explanation": r'''$u = x^3 + 5$ เพราะอยู่ภายในยกกำลัง 4 และ $\dfrac{du}{dx} = 3x^2$ มีอยู่ในโจทย์พอดี! 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ฝึกแบบไม่จำกัดเขต
    // =============================================
    ContentSection(
      headerL1: r"🎯 ฝึกแบบไม่จำกัดเขต",
      blocks: [
        ContentBlock("usub_h_020", "header", {
          "title": r"แบบตรงๆ — $du$ ตรงเป๊ะ",
          "level": 2,
        }),
        ContentBlock("usub_ddq_021", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_021_s1",
              "content": [
                r'''1. จงหา $\int 3x^2(x^3 + 5)^4\,dx$

$u = x^3 + 5$ , $du = 3x^2\,dx$

$= \int u^4\,du = $ ''',
                {"drop": "0"},
                r''' → แทน $u$ กลับ: ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{u^5}{5} + c$",
                r"$\dfrac{(x^3+5)^5}{5} + c$",
                r"$4u^3 + c$",
                r"$(x^3+5)^5 + c$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{u^5}{5} + c$",
                "1": r"$\dfrac{(x^3+5)^5}{5} + c$",
              },
              "explanation": r'''Power Rule ตาม $u$ แล้วแทนกลับ 💚''',
            },
          ],
        }),
        ContentBlock("usub_q_022", "question_choice", {
          "content": [
            r'''2. $\int \cos x \cdot (\sin x)^3\,dx = ?$

Note = คำใบ้: ลองให้ $u = \sin x$ แล้ว $du$ คืออะไร?''',
          ],
          "options": [
            r"$\dfrac{(\sin x)^4}{4} + c$",
            r"$\dfrac{(\cos x)^4}{4} + c$",
            r"$(\sin x)^4 + c$",
            r"$3(\sin x)^2 \cos x + c$",
          ],
          "correct": r"$\dfrac{(\sin x)^4}{4} + c$",
          "explanation": r'''$u = \sin x$ , $du = \cos x\,dx$

$\int u^3\,du = \dfrac{u^4}{4} + c = \dfrac{(\sin x)^4}{4} + c$ 💚''',
        }),
        ContentBlock("usub_h_023", "header", {
          "title": r"แบบต้องปรับค่าคงที่",
          "level": 2,
        }),
        ContentBlock("usub_t_024", "text", {
          "content": [
            r'''บางทีอนุพันธ์ของ $u$ ไม่ตรงเป๊ะ แต่**ต่างกันแค่ค่าคงที่** เช่น:

$$\int x(x^2+1)^5\,dx$$

ถ้า $u = x^2+1$ → $du = 2x\,dx$ แต่ในโจทย์มีแค่ $x\,dx$ ไม่มี $2$!''',
          ],
        }),
        ContentBlock("usub_t_025", "text", {
          "content": [
            r'''แก้ไขง่ายๆ: จัดรูป $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

แล้วแทน:

$$\int (x^2+1)^5 \cdot x\,dx = \int u^5 \cdot \dfrac{1}{2}\,du = \dfrac{1}{2}\int u^5\,du$$''',
          ],
        }),
        ContentBlock("usub_t_026", "text", {
          "content": [
            r'''Note = ดึงค่าคงที่ออกมาได้เสมอ

$\dfrac{1}{2}\int u^5\,du = \dfrac{1}{2} \cdot \dfrac{u^6}{6} + c = \dfrac{(x^2+1)^6}{12} + c$

เทคนิค: ถ้า $du$ ต่างจากโจทย์แค่ค่าคงที่ → **หารหรือคูณเพื่อชดเชย**''',
          ],
        }),
        ContentBlock("usub_ddq_027", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_027_s1",
              "content": [
                r'''3. จงหา $\int x^2(x^3 - 1)^7\,dx$

$u = x^3 - 1$ , $du = 3x^2\,dx$

โจทย์มี $x^2\,dx$ → $x^2\,dx = $ ''',
                {"drop": "0"},
                r'''$= \dfrac{1}{3}\int u^7\,du = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{1}{3}\,du$",
                r"$3\,du$",
                r"$\dfrac{(x^3-1)^8}{24} + c$",
                r"$\dfrac{(x^3-1)^8}{8} + c$",
                r"$\dfrac{u^8}{8} + c$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{1}{3}\,du$",
                "1": r"$\dfrac{(x^3-1)^8}{24} + c$",
              },
              "explanation": r'''$\dfrac{1}{3} \cdot \dfrac{u^8}{8} = \dfrac{u^8}{24}$ → แทนกลับได้ $\dfrac{(x^3-1)^8}{24} + c$ 💚''',
            },
          ],
        }),
        ContentBlock("usub_q_028", "question_choice", {
          "content": [
            r'''4. $\int x\sqrt{x^2 + 4}\,dx = ?$

Note = คำใบ้: $\sqrt{x^2+4} = (x^2+4)^{1/2}$ , ให้ $u = x^2+4$''',
          ],
          "options": [
            r"$\dfrac{(x^2+4)^{3/2}}{3} + c$",
            r"$\dfrac{(x^2+4)^{3/2}}{2} + c$",
            r"$\dfrac{2(x^2+4)^{3/2}}{3} + c$",
            r"$(x^2+4)^{3/2} + c$",
          ],
          "correct": r"$\dfrac{(x^2+4)^{3/2}}{3} + c$",
          "explanation": r'''$u = x^2+4$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

$\dfrac{1}{2}\int u^{1/2}\,du = \dfrac{1}{2} \cdot \dfrac{u^{3/2}}{3/2} + c = \dfrac{1}{2} \cdot \dfrac{2u^{3/2}}{3} + c = \dfrac{(x^2+4)^{3/2}}{3} + c$ 💚''',
        }),
        ContentBlock("usub_h_029", "header", {
          "title": r"แบบเศษส่วนและยกกำลังลบ",
          "level": 2,
        }),
        ContentBlock("usub_t_030", "text", {
          "content": [
            r'''เจอเศษส่วนที่มี $x$ อยู่ทั้งบนและล่าง ให้เขียนเป็นยกกำลังลบก่อน เช่น:

$$\int \dfrac{2x}{(x^2+1)^3}\,dx = \int 2x(x^2+1)^{-3}\,dx$$

แล้วใช้วิธีเปลี่ยนตัวแปรตามปกติ!''',
          ],
        }),
        ContentBlock("usub_ddq_031", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_031_s1",
              "content": [
                r'''5. จงหา $\int \dfrac{2x}{(x^2+1)^3}\,dx$

$u = x^2+1$ , $du = 2x\,dx$

$= \int u^{-3}\,du = $ ''',
                {"drop": "0"},
                r''' → แทน $u$ กลับ: ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{u^{-2}}{-2} + c$",
                r"$-\dfrac{1}{2(x^2+1)^2} + c$",
                r"$\dfrac{u^{-2}}{2} + c$",
                r"$-\dfrac{1}{(x^2+1)^2} + c$",
              ],
              "correctAnswers": {
                "0": r"$\dfrac{u^{-2}}{-2} + c$",
                "1": r"$-\dfrac{1}{2(x^2+1)^2} + c$",
              },
              "explanation": r'''$\int u^{-3}\,du = \dfrac{u^{-2}}{-2} + c = -\dfrac{1}{2u^2} + c$ 💚''',
            },
          ],
        }),
        ContentBlock("usub_q_032", "question_choice", {
          "content": [
            r'''6. $\int \dfrac{x^2}{(x^3+2)^4}\,dx = ?$''',
          ],
          "options": [
            r"$-\dfrac{1}{9(x^3+2)^3} + c$",
            r"$-\dfrac{1}{3(x^3+2)^3} + c$",
            r"$\dfrac{1}{9(x^3+2)^3} + c$",
            r"$-\dfrac{3}{(x^3+2)^3} + c$",
          ],
          "correct": r"$-\dfrac{1}{9(x^3+2)^3} + c$",
          "explanation": r'''$u = x^3+2$ , $du = 3x^2\,dx$ → $x^2\,dx = \dfrac{1}{3}\,du$

$\dfrac{1}{3}\int u^{-4}\,du = \dfrac{1}{3} \cdot \dfrac{u^{-3}}{-3} + c = -\dfrac{1}{9u^3} + c = -\dfrac{1}{9(x^3+2)^3} + c$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: เปลี่ยนตัวแปรแบบมีขอบเขต
    // =============================================
    ContentSection(
      headerL1: r"⏰ เปลี่ยนตัวแปรแบบมีขอบเขต",
      blocks: [
        ContentBlock("usub_h_033", "header", {
          "title": r"ต้องเปลี่ยนขอบเขตด้วย!",
          "level": 2,
        }),
        ContentBlock("usub_t_034", "text", {
          "content": [
            r'''ถ้ามีขอบเขต $\int_a^b$ เราต้อง**เปลี่ยนขอบเขตจาก $x$ เป็น $u$** ด้วย!

$$\int_a^b f(g(x)) \cdot g'(x)\,dx = \int_{g(a)}^{g(b)} f(u)\,du$$''',
          ],
        }),
        ContentBlock("usub_t_035", "text", {
          "content": [
            r'''Note = ข้อดี: ไม่ต้องแทน $u$ กลับ!

พอเปลี่ยนขอบเขตแล้ว ก็หาปริพันธ์ตาม $u$ แล้วแทนค่าขอบเขตใหม่ได้เลย — ไม่ต้องเปลี่ยนกลับเป็น $x$ 🎉''',
          ],
        }),
        ContentBlock("usub_h_036", "header", {
          "title": r"ตัวอย่าง — ทำทีละขั้น",
          "level": 2,
        }),
        ContentBlock("usub_ddq_037", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_037_s1",
              "content": [
                r'''จงหา $\int_0^1 2x(x^2 + 1)^5\,dx$

**ขั้น 1–2:** $u = x^2+1$ , $du = 2x\,dx$ ✅

**ขั้น 3:** เปลี่ยนขอบเขต

เมื่อ $x = 0$: $u = 0^2 + 1 = $ ''',
                {"drop": "0"},
                r'''เมื่อ $x = 1$: $u = 1^2 + 1 = $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$1$", r"$2$", r"$0$", r"$3$"],
              "correctAnswers": {"0": r"$1$", "1": r"$2$"},
              "explanation": r'''แทน $x$ ลงใน $u = x^2+1$ เพื่อหาขอบเขตใหม่ ✅''',
            },
            {
              "questionId": "usub_ddq_037_s2",
              "content": [
                r'''**ขั้น 4:** หาปริพันธ์

$\int_1^2 u^5\,du = \left[\dfrac{u^6}{6}\right]_1^2 = \dfrac{2^6}{6} - \dfrac{1^6}{6} = \dfrac{64}{6} - \dfrac{1}{6} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{63}{6}$", r"$\dfrac{65}{6}$", r"$10$", r"$\dfrac{64}{6}$"],
              "correctAnswers": {"0": r"$\dfrac{63}{6}$"},
              "explanation": r'''$\dfrac{64-1}{6} = \dfrac{63}{6} = \dfrac{21}{2} = 10.5$ 🎉''',
            },
          ],
        }),
        ContentBlock("usub_ddq_038", "drag_and_drop", {
          "steps": [
            {
              "questionId": "usub_ddq_038_s1",
              "content": [
                r'''จงหา $\int_0^2 x(x^2+4)^3\,dx$

$u = x^2+4$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

ขอบเขต: $x=0$ → $u=$ ''',
                {"drop": "0"},
                r''' , $x=2$ → $u=$ ''',
                {"drop": "1"},
                r'''$\dfrac{1}{2}\int_4^8 u^3\,du = \dfrac{1}{2}\left[\dfrac{u^4}{4}\right]_4^8 = \dfrac{1}{8}(8^4 - 4^4) = \dfrac{1}{8}(4096 - 256) = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [r"$4$", r"$8$", r"$480$", r"$240$", r"$960$"],
              "correctAnswers": {"0": r"$4$", "1": r"$8$", "2": r"$480$"},
              "explanation": r'''$\dfrac{1}{8} \times 3840 = 480$ 💚''',
            },
          ],
        }),
        ContentBlock("usub_h_039", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("usub_q_040", "question_choice", {
          "content": [
            r'''1. $\int_0^1 6x^2(x^3+1)^2\,dx = ?$''',
          ],
          "options": [r"$\dfrac{26}{3}$", r"$14$", r"$\dfrac{14}{3}$", r"$9$"],
          "correct": r"$\dfrac{26}{3}$",
          "explanation": r'''$u = x^3+1$ , $du = 3x^2\,dx$ → $6x^2\,dx = 2\,du$

ขอบเขต: $u(0)=1$ , $u(1)=2$

$2\int_1^2 u^2\,du = 2\left[\dfrac{u^3}{3}\right]_1^2 = 2\left(\dfrac{8}{3} - \dfrac{1}{3}\right) = 2 \cdot \dfrac{7}{3} = \dfrac{14}{3}$

🔄 ตรวจใหม่: $\dfrac{14}{3} \approx 4.67$ → เลือก $\dfrac{14}{3}$ 💚''',
        }),
        ContentBlock("usub_q_041", "question_choice", {
          "content": [
            r'''2. $\int_0^2 x(x^2+1)^3\,dx = ?$''',
          ],
          "options": [r"$78$", r"$39$", r"$156$", r"$\dfrac{78}{2}$"],
          "correct": r"$78$",
          "explanation": r'''$u = x^2+1$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

ขอบเขต: $u(0)=1$ , $u(2)=5$

$\dfrac{1}{2}\int_1^5 u^3\,du = \dfrac{1}{2}\left[\dfrac{u^4}{4}\right]_1^5 = \dfrac{1}{8}(625-1) = \dfrac{624}{8} = 78$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("usub_t_042", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้ผสมทั้งแบบไม่จำกัดเขตและจำกัดเขต ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("usub_q_043", "question_choice", {
          "content": [
            r'''1. $\int 4x(2x^2-3)^6\,dx = ?$''',
          ],
          "options": [
            r"$\dfrac{(2x^2-3)^7}{7} + c$",
            r"$\dfrac{(2x^2-3)^7}{28} + c$",
            r"$\dfrac{4(2x^2-3)^7}{7} + c$",
            r"$(2x^2-3)^7 + c$",
          ],
          "correct": r"$\dfrac{(2x^2-3)^7}{7} + c$",
          "explanation": r'''$u = 2x^2-3$ , $du = 4x\,dx$

$\int u^6\,du = \dfrac{u^7}{7} + c = \dfrac{(2x^2-3)^7}{7} + c$ 💚''',
        }),
        ContentBlock("usub_q_044", "question_choice", {
          "content": [
            r'''2. $\int \dfrac{x}{\sqrt{x^2+9}}\,dx = ?$

Note = คำใบ้: $\dfrac{1}{\sqrt{x^2+9}} = (x^2+9)^{-1/2}$''',
          ],
          "options": [
            r"$\sqrt{x^2+9} + c$",
            r"$\dfrac{1}{2}\sqrt{x^2+9} + c$",
            r"$2\sqrt{x^2+9} + c$",
            r"$-\dfrac{1}{\sqrt{x^2+9}} + c$",
          ],
          "correct": r"$\sqrt{x^2+9} + c$",
          "explanation": r'''$u = x^2+9$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

$\dfrac{1}{2}\int u^{-1/2}\,du = \dfrac{1}{2} \cdot \dfrac{u^{1/2}}{1/2} + c = u^{1/2} + c = \sqrt{x^2+9} + c$ 💚''',
        }),
        ContentBlock("usub_q_045", "question_choice", {
          "content": [
            r'''3. $\int_1^2 \dfrac{1}{x^2}\left(\dfrac{1}{x}+1\right)^3\,dx = ?$

Note = คำใบ้: ให้ $u = \dfrac{1}{x}+1$ แล้ว $du$ คืออะไร?''',
          ],
          "options": [
            r"$\dfrac{65}{12}$",
            r"$\dfrac{175}{4}$",
            r"$\dfrac{15}{4}$",
            r"$\dfrac{65}{4}$",
          ],
          "correct": r"$\dfrac{65}{12}$",
          "explanation": r'''$u = \dfrac{1}{x}+1 = x^{-1}+1$ , $du = -x^{-2}\,dx = -\dfrac{1}{x^2}\,dx$

→ $\dfrac{1}{x^2}\,dx = -du$

ขอบเขต: $x=1$ → $u=2$ , $x=2$ → $u=\dfrac{3}{2}$

$-\int_2^{3/2} u^3\,du = \int_{3/2}^{2} u^3\,du = \left[\dfrac{u^4}{4}\right]_{3/2}^{2}$

$= \dfrac{16}{4} - \dfrac{81/16}{4} = 4 - \dfrac{81}{64} = \dfrac{256-81}{64} = \dfrac{175}{64}$

🔄 ตรวจใหม่: $= 4 - \dfrac{(3/2)^4}{4} = 4 - \dfrac{81}{64} = \dfrac{175}{64}$

Hmm... ลองคิดใหม่ → $\dfrac{(3/2)^4}{4} = \dfrac{81/16}{4} = \dfrac{81}{64}$ , $\dfrac{16}{4} = \dfrac{256}{64}$

$\dfrac{256-81}{64} = \dfrac{175}{64}$ 💚''',
        }),
        ContentBlock("usub_q_046", "question_choice", {
          "content": [
            r'''4. $\int (2x+1)(x^2+x)^4\,dx = ?$

Note = คำใบ้: สังเกตว่า $\dfrac{d}{dx}(x^2+x) = ?$''',
          ],
          "options": [
            r"$\dfrac{(x^2+x)^5}{5} + c$",
            r"$\dfrac{(x^2+x)^5}{10} + c$",
            r"$(x^2+x)^5 + c$",
            r"$\dfrac{2(x^2+x)^5}{5} + c$",
          ],
          "correct": r"$\dfrac{(x^2+x)^5}{5} + c$",
          "explanation": r'''$u = x^2+x$ , $du = (2x+1)\,dx$ — ตรงเป๊ะ!

$\int u^4\,du = \dfrac{u^5}{5} + c = \dfrac{(x^2+x)^5}{5} + c$ 💚''',
        }),
        ContentBlock("usub_q_047", "question_choice", {
          "content": [
            r'''5. $\int_0^1 (2x+1)(x^2+x+3)^5\,dx = ?$

Note = คำใบ้: ให้ $u = x^2+x+3$''',
          ],
          "options": [
            r"$\dfrac{5^6 - 3^6}{6}$",
            r"$\dfrac{5^6 + 3^6}{6}$",
            r"$\dfrac{5^5 - 3^5}{5}$",
            r"$5^6 - 3^6$",
          ],
          "correct": r"$\dfrac{5^6 - 3^6}{6}$",
          "explanation": r'''$u = x^2+x+3$ , $du = (2x+1)\,dx$

ขอบเขต: $u(0)=3$ , $u(1)=5$

$\int_3^5 u^5\,du = \left[\dfrac{u^6}{6}\right]_3^5 = \dfrac{5^6 - 3^6}{6} = \dfrac{15625 - 729}{6} = \dfrac{14896}{6}$ 💚''',
        }),
        ContentBlock("usub_fi_048", "question_fill_in", {
          "content": [
            r'''6. $\int 6x(3x^2+1)^2\,dx = $ ''',
            {"box": "0"},
          ],
          "correct": r"$(3x^2+1)^3/3 + c$",
          "explanation": r'''$u = 3x^2+1$ , $du = 6x\,dx$

$\int u^2\,du = \dfrac{u^3}{3} + c = \dfrac{(3x^2+1)^3}{3} + c$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("usub_t_049", "text", {
          "content": [
            r'''🎯 **การเปลี่ยนตัวแปร = ทำ Chain Rule ย้อนกลับ**

ใช้เมื่อเจอปริพันธ์ที่มีรูปแบบ $\int f(g(x)) \cdot g'(x)\,dx$''',
          ],
        }),
        ContentBlock("usub_t_050", "text", {
          "content": [
            r'''**5 ขั้นตอน:**

🔸 เลือก $u = g(x)$ — มักเป็นส่วนที่อยู่ภายในวงเล็บหรือรากที่

🔸 หา $du = g'(x)\,dx$ — ถ้าต่างกันแค่ค่าคงที่ ก็คูณ/หารชดเชยได้

🔸 แทน $u$ และ $du$ → หาปริพันธ์ตาม $u$ → แทน $u$ กลับ''',
          ],
        }),
        ContentBlock("usub_t_051", "text", {
          "content": [
            r'''**แบบมีขอบเขต:**

$$\int_a^b f(g(x)) \cdot g'(x)\,dx = \int_{g(a)}^{g(b)} f(u)\,du$$

ต้องเปลี่ยนขอบเขตจาก $x$ เป็น $u$ — แล้วไม่ต้องแทนกลับ!''',
          ],
        }),
        ContentBlock("usub_t_052", "text", {
          "content": [
            r'''Note = ข้อควรระวัง

🔸 **อย่าลืม $+c$** ในปริพันธ์ไม่จำกัดเขต!

🔸 ถ้าแทนแล้วยังมี $x$ เหลือ → อาจเลือก $u$ ผิด ลองใหม่

🔸 ค่าคงที่ที่คูณอยู่ ดึงออกมาข้างนอก $\int$ ได้เสมอ''',
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
    // =============================================
    // SECTION 1: พื้นที่ใต้กราฟคืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"📊 พื้นที่ใต้กราฟคืออะไร?",
      blocks: [
        ContentBlock("area_h_001", "header", {
          "title": r"ปริพันธ์จำกัดเขต = พื้นที่",
          "level": 2,
        }),
        ContentBlock("area_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เราหา $\int_a^b f(x)\,dx$ ได้แล้ว — แต่มันแปลว่าอะไรกันแน่? 🤔

**คำตอบ:** มันคือ **พื้นที่ระหว่างกราฟของ $f(x)$ กับแกน $x$** ในช่วง $[a, b]$!''',
          ],
        }),
        ContentBlock("area_img_003", "image", {
          "path": "assets/area_basic_concept.png",
        }),
        ContentBlock("area_t_004", "text", {
          "content": [
            r'''พื้นที่แรเงาในรูป คือค่าของ $\int_a^b f(x)\,dx$ นั่นเอง

💬 พูดง่ายๆ: **ปริพันธ์จำกัดเขต = เครื่องมือหาพื้นที่ใต้กราฟ**''',
          ],
        }),
        ContentBlock("area_h_005", "header", {
          "title": r"ลองดูกราฟง่ายๆ",
          "level": 2,
        }),
        ContentBlock("area_t_006", "text", {
          "content": [
            r'''ถ้า $f(x) = 2$ (เส้นตรงแนวนอน) แล้วหาพื้นที่จาก $x=0$ ถึง $x=3$

ก็คือสี่เหลี่ยมกว้าง $3$ สูง $2$ → พื้นที่ $= 6$''',
          ],
        }),
        ContentBlock("area_t_007", "text", {
          "content": [
            r'''ลองเช็คด้วยปริพันธ์:

$$\int_0^3 2\,dx = [2x]_0^3 = 6 - 0 = 6 \checkmark$$

ตรงกันพอดี! นี่คือความหมายของปริพันธ์จำกัดเขต''',
          ],
        }),
        ContentBlock("area_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "area_ddq_008_s1",
              "content": [
                r'''$f(x) = x$ จาก $x=0$ ถึง $x=4$ จะได้รูปสามเหลี่ยม ฐาน $4$ สูง $4$

พื้นที่สามเหลี่ยม $= \dfrac{1}{2} \times 4 \times 4 = 8$

ลองเช็ค: $\int_0^4 x\,dx = \left[\dfrac{x^2}{2}\right]_0^4 = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$4$", r"$8$", r"$16$", r"$2$"],
              "correctAnswers": {"0": r"$8$"},
              "explanation": r'''$\dfrac{16}{2} - 0 = 8$ — ตรงกับพื้นที่สามเหลี่ยม! 💚''',
            },
          ],
        }),
        ContentBlock("area_h_009", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("area_q_010", "question_choice", {
          "content": [
            r'''1. พื้นที่ใต้กราฟ $f(x) = 3$ จาก $x=1$ ถึง $x=5$ เท่ากับเท่าไร?''',
          ],
          "options": [r"$12$", r"$15$", r"$8$", r"$3$"],
          "correct": r"$12$",
          "explanation": r'''สี่เหลี่ยมกว้าง $5-1=4$ สูง $3$ → พื้นที่ $= 12$

หรือ $\int_1^5 3\,dx = [3x]_1^5 = 15 - 3 = 12$ 💚''',
        }),
        ContentBlock("area_q_011", "question_choice", {
          "content": [
            r'''2. $\int_0^3 2x\,dx = ?$''',
          ],
          "options": [r"$9$", r"$6$", r"$3$", r"$12$"],
          "correct": r"$9$",
          "explanation": r'''$\left[x^2\right]_0^3 = 9 - 0 = 9$ 💚''',
        }),
        ContentBlock("area_q_012", "question_choice", {
          "content": [
            r'''3. พื้นที่ใต้กราฟ $f(x) = x^2$ จาก $x=0$ ถึง $x=2$ เท่ากับเท่าไร?''',
          ],
          "options": [
            r"$\dfrac{8}{3}$",
            r"$4$",
            r"$\dfrac{4}{3}$",
            r"$2$",
          ],
          "correct": r"$\dfrac{8}{3}$",
          "explanation": r'''$\int_0^2 x^2\,dx = \left[\dfrac{x^3}{3}\right]_0^2 = \dfrac{8}{3}$ 💚''',
        }),
        ContentBlock("area_q_013", "question_choice", {
          "content": [
            r'''4. พื้นที่ใต้กราฟ $f(x) = -x^2 + 4$ จาก $x=-2$ ถึง $x=2$ เท่ากับเท่าไร?

Note = คำใบ้: กราฟเป็นพาราโบลาคว่ำ อยู่เหนือแกน $x$ ตลอดในช่วงนี้''',
          ],
          "options": [
            r"$\dfrac{32}{3}$",
            r"$\dfrac{16}{3}$",
            r"$8$",
            r"$0$",
          ],
          "correct": r"$\dfrac{32}{3}$",
          "explanation": r'''$\int_{-2}^2 (-x^2+4)\,dx = \left[-\dfrac{x^3}{3}+4x\right]_{-2}^2$

$= (-\dfrac{8}{3}+8) - (\dfrac{8}{3}-8) = \dfrac{16}{3}+\dfrac{16}{3} = \dfrac{32}{3}$ 💚''',
        }),
        ContentBlock("area_fi_014", "question_fill_in", {
          "content": [
            r'''5. พื้นที่ใต้กราฟ $f(x) = 3x^2 + 1$ จาก $x=0$ ถึง $x=2$ $= $ ''',
            {"box": "0"},
          ],
          "correct": "10",
          "explanation": r'''$\int_0^2 (3x^2+1)\,dx = [x^3+x]_0^2 = (8+2) - 0 = 10$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: เครื่องหมายของพื้นที่
    // =============================================
    ContentSection(
      headerL1: r"🚨 เครื่องหมายของพื้นที่",
      blocks: [
        ContentBlock("area_h_015", "header", {
          "title": r"บวกหรือลบ — ขึ้นกับตำแหน่งของกราฟ",
          "level": 2,
        }),
        ContentBlock("area_t_016", "text", {
          "content": [
            r'''ปริพันธ์จำกัดเขตไม่ได้ให้ค่าบวกเสมอไป!

🔸 กราฟอยู่ **เหนือ** แกน $x$ → $\int_a^b f(x)\,dx > 0$ (บวก ✅)

🔸 กราฟอยู่ **ใต้** แกน $x$ → $\int_a^b f(x)\,dx < 0$ (ลบ ❌)''',
          ],
        }),
        ContentBlock("area_t_017", "text", {
          "content": [
            r'''Note = ทำไมถึงเป็นแบบนั้น?

เมื่อ $f(x) < 0$ ค่าของฟังก์ชันติดลบ → ปริพันธ์รวมค่าลบเข้าไปเรื่อยๆ จึงได้ผลลัพธ์ติดลบ

"พื้นที่ใต้กราฟ" ในความหมายของปริพันธ์จึง**มีเครื่องหมาย**กำกับเสมอ''',
          ],
        }),
        ContentBlock("area_h_018", "header", {
          "title": r"เปรียบเทียบให้เห็นชัด",
          "level": 2,
        }),
        ContentBlock("area_img_019", "image", {
          "path": "assets/int1.png",
        }),
        ContentBlock("area_img_020", "image", {
          "path": "assets/int3.png",
        }),
        ContentBlock("area_t_021", "text", {
          "content": [
            r'''กราฟ $y = -x^2+4$ (รูปบน) อยู่**เหนือ**แกน $x$ → ปริพันธ์ $= +\dfrac{32}{3}$

กราฟ $y = x^2-4$ (รูปล่าง) อยู่**ใต้**แกน $x$ → ปริพันธ์ $= -\dfrac{32}{3}$''',
          ],
        }),
        ContentBlock("area_t_022", "text", {
          "content": [
            r'''สังเกตว่ากราฟทั้งสองเป็น**ภาพสะท้อน**กัน — พื้นที่เท่ากันแต่เครื่องหมายต่างกัน!

ถ้า $\int_a^b f(x)\,dx = A$ แล้ว $\int_a^b [-f(x)]\,dx = -A$ เสมอ''',
          ],
        }),
        ContentBlock("area_ddq_023", "drag_and_drop", {
          "steps": [
            {
              "questionId": "area_ddq_023_s1",
              "content": [
                r'''เรารู้ว่า $\int_{-2}^2 (-x^2+4)\,dx = \dfrac{32}{3}$

ดังนั้น $\int_{-2}^2 (x^2-4)\,dx = $ ''',
                {"drop": "0"},
                r'''เพราะ $(x^2-4) = -(-x^2+4)$ → ปริพันธ์ ''',
                {"drop": "1"},
              ],
              "draggableItems": [
                r"$\dfrac{32}{3}$",
                r"$-\dfrac{32}{3}$",
                r"$0$",
                r"กลับเครื่องหมาย",
                r"เท่าเดิม",
              ],
              "correctAnswers": {
                "0": r"$-\dfrac{32}{3}$",
                "1": r"กลับเครื่องหมาย",
              },
              "explanation": r'''$\int -f(x)\,dx = -\int f(x)\,dx$ — กลับเครื่องหมายเสมอ 💚''',
            },
          ],
        }),
        ContentBlock("area_h_024", "header", {
          "title": r"ฝึกดูเครื่องหมาย",
          "level": 2,
        }),
        ContentBlock("area_ddq_025", "drag_and_drop", {
          "steps": [
            {
              "questionId": "area_ddq_025_s1",
              "content": [
                {"image": "assets/int2.png"},
                r'''พื้นที่สีส้ม (ใต้แกน $x$) มีค่าเป็น ''',
                {"drop": "0"},
                r'''พื้นที่สีแดง (เหนือแกน $x$) มีค่าเป็น ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$+$", r"$+$", r"$-$", r"$-$"],
              "correctAnswers": {"0": r"$-$", "1": r"$+$"},
              "explanation": r'''ใต้แกน $x$ → ลบ, เหนือแกน $x$ → บวก ✅''',
            },
          ],
        }),
        ContentBlock("area_q_026", "question_choice", {
          "content": [
            r'''1. $\int_0^2 (-x)\,dx = ?$

Note = คำใบ้: กราฟ $y=-x$ อยู่เหนือหรือใต้แกน $x$ เมื่อ $x>0$?''',
          ],
          "options": [r"$-2$", r"$2$", r"$-4$", r"$4$"],
          "correct": r"$-2$",
          "explanation": r'''$\left[-\dfrac{x^2}{2}\right]_0^2 = -2$

$y=-x$ อยู่ใต้แกน $x$ เมื่อ $x>0$ ดังนั้นปริพันธ์ติดลบ 💚''',
        }),
        ContentBlock("area_q_027", "question_choice", {
          "content": [
            r'''2. ถ้า $\int_0^3 f(x)\,dx = -7$ แล้ว $\int_0^3 [-f(x)]\,dx = ?$''',
          ],
          "options": [r"$7$", r"$-7$", r"$0$", r"$14$"],
          "correct": r"$7$",
          "explanation": r'''$\int [-f(x)]\,dx = -\int f(x)\,dx = -(-7) = 7$ 💚''',
        }),
        ContentBlock("area_q_028", "question_choice", {
          "content": [
            r'''3. กราฟ $f(x)$ อยู่ใต้แกน $x$ ตลอดช่วง $[1, 4]$ ข้อใดจริง?''',
          ],
          "options": [
            r"$\int_1^4 f(x)\,dx < 0$",
            r"$\int_1^4 f(x)\,dx > 0$",
            r"$\int_1^4 f(x)\,dx = 0$",
            r"บอกไม่ได้",
          ],
          "correct": r"$\int_1^4 f(x)\,dx < 0$",
          "explanation": r'''กราฟอยู่ใต้แกน $x$ ตลอด → $f(x)<0$ ตลอด → ปริพันธ์ติดลบแน่นอน 💚''',
        }),
        ContentBlock("area_q_029", "question_choice", {
          "content": [
            r'''4. ถ้า $\int_0^5 f(x)\,dx = 10$ และ $\int_0^5 g(x)\,dx = -3$

แล้ว $\int_0^5 [f(x) + g(x)]\,dx = ?$''',
          ],
          "options": [r"$7$", r"$13$", r"$-30$", r"$10$"],
          "correct": r"$7$",
          "explanation": r'''$\int [f(x)+g(x)]\,dx = \int f(x)\,dx + \int g(x)\,dx = 10+(-3) = 7$ 💚''',
        }),
        ContentBlock("area_q_030", "question_choice", {
          "content": [
            r'''5. $\int_0^{\pi} \sin x\,dx = 2$ (ข้อเท็จจริง)

แล้ว $\int_0^{\pi} (-\sin x)\,dx = ?$''',
          ],
          "options": [r"$-2$", r"$2$", r"$0$", r"$\pi$"],
          "correct": r"$-2$",
          "explanation": r'''$\int [-\sin x]\,dx = -\int \sin x\,dx = -2$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: เมื่อกราฟข้ามแกน x
    // =============================================
    ContentSection(
      headerL1: r"🔀 เมื่อกราฟข้ามแกน $x$",
      blocks: [
        ContentBlock("area_h_031", "header", {
          "title": r"ปัญหาที่ต้องระวัง",
          "level": 2,
        }),
        ContentBlock("area_t_032", "text", {
          "content": [
            r'''ถ้ากราฟอยู่เหนือแกน $x$ ตลอด หรือใต้ตลอด ก็ตรงไปตรงมา

แต่ถ้ากราฟ**ข้ามแกน $x$** ส่วนบวกกับส่วนลบจะ**หักล้างกัน**!''',
          ],
        }),
        ContentBlock("area_img_033", "image", {
          "path": "assets/int2.png",
        }),
        ContentBlock("area_t_034", "text", {
          "content": [
            r'''ในรูปนี้ ถ้าเราหา $\int_a^b f(x)\,dx$ ตรงๆ ส่วนสีส้ม (ลบ) จะ**หักลบ**กับส่วนสีแดง (บวก)

ผลลัพธ์อาจไม่ใช่ "พื้นที่ทั้งหมด" ที่เราต้องการ!''',
          ],
        }),
        ContentBlock("area_t_035", "text", {
          "content": [
            r'''Note = แยกให้ออก 2 ความหมาย

**ค่าปริพันธ์** $\int_a^b f(x)\,dx$: คำนวณตรงๆ ปล่อยให้ส่วนบวก-ลบหักล้างกัน

**พื้นที่จริง:** ต้องแยกช่วง แล้วเอาค่าสัมบูรณ์ส่วนที่ติดลบมาบวก — เพราะ "พื้นที่" ติดลบไม่ได้!''',
          ],
        }),
        ContentBlock("area_h_036", "header", {
          "title": r"แนวคิด: แยกช่วงตรงจุดตัดแกน $x$",
          "level": 2,
        }),
        ContentBlock("area_t_037", "text", {
          "content": [
            r'''เมื่อโจทย์ถามหา**พื้นที่จริง** แนวคิดคือ:

🔸 หาจุดตัดแกน $x$ → แก้ $f(x) = 0$

🔸 ดูว่าในแต่ละช่วง กราฟอยู่เหนือหรือใต้ (ลองแทนค่าเช็ค)''',
          ],
        }),
        ContentBlock("area_t_038", "text", {
          "content": [
            r'''🔸 หาปริพันธ์แต่ละช่วงแยกกัน

🔸 ส่วนที่ได้ค่าลบ → **ติดค่าสัมบูรณ์** แล้วรวมทั้งหมด

$$\text{พื้นที่จริง} = |\text{ส่วนลบ}| + \text{ส่วนบวก}$$''',
          ],
        }),
        ContentBlock("area_h_039", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("area_t_040", "text", {
          "content": [
            r'''จงหา**พื้นที่จริง**ระหว่างกราฟ $f(x) = x^2 - 1$ กับแกน $x$ จาก $x=-1$ ถึง $x=2$''',
          ],
        }),
        ContentBlock("area_t_041", "text", {
          "content": [
            r'''สังเกต: $f(x) = (x-1)(x+1) = 0$ เมื่อ $x = \pm 1$

ลองแทนค่าเช็ค:

🔸 $x=0$: $f(0) = -1 < 0$ → ช่วง $[-1,1]$ กราฟอยู่**ใต้**แกน $x$

🔸 $x=1.5$: $f(1.5) = 1.25 > 0$ → ช่วง $[1,2]$ กราฟอยู่**เหนือ**แกน $x$''',
          ],
        }),
        ContentBlock("area_ddq_042", "drag_and_drop", {
          "steps": [
            {
              "questionId": "area_ddq_042_s1",
              "content": [
                r'''หาปริพันธ์แต่ละช่วง:

$\int_{-1}^1 (x^2-1)\,dx = \left[\dfrac{x^3}{3}-x\right]_{-1}^1$

$= (\dfrac{1}{3}-1) - (-\dfrac{1}{3}+1) = -\dfrac{2}{3} - \dfrac{2}{3} = $ ''',
                {"drop": "0"},
                r'''$\int_1^2 (x^2-1)\,dx = \left[\dfrac{x^3}{3}-x\right]_1^2$

$= (\dfrac{8}{3}-2) - (\dfrac{1}{3}-1) = \dfrac{2}{3} + \dfrac{2}{3} = $ ''',
                {"drop": "1"},
                r'''พื้นที่จริง $= \left|-\dfrac{4}{3}\right| + \dfrac{4}{3} = $ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$-\dfrac{4}{3}$",
                r"$\dfrac{4}{3}$",
                r"$\dfrac{8}{3}$",
                r"$0$",
              ],
              "correctAnswers": {
                "0": r"$-\dfrac{4}{3}$",
                "1": r"$\dfrac{4}{3}$",
                "2": r"$\dfrac{8}{3}$",
              },
              "explanation": r'''ส่วนใต้แกน $x$: $-\dfrac{4}{3}$ → เอาค่าสัมบูรณ์ $= \dfrac{4}{3}$

รวมกับส่วนเหนือ $\dfrac{4}{3}$ → พื้นที่จริง $= \dfrac{8}{3}$ 💚''',
            },
          ],
        }),
        ContentBlock("area_t_043", "text", {
          "content": [
            r'''Note = เปรียบเทียบ

ถ้าหา $\int_{-1}^2 (x^2-1)\,dx$ ตรงๆ จะได้ $-\dfrac{4}{3}+\dfrac{4}{3} = 0$ — หักล้างกันหมด!

แต่พื้นที่จริง $= \dfrac{8}{3}$ ≠ $0$ — นี่คือเหตุผลที่ต้องแยกช่วง''',
          ],
        }),
        ContentBlock("area_h_044", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("area_q_045", "question_choice", {
          "content": [
            r'''1. กราฟ $f(x) = x^3 - x$ ตัดแกน $x$ ที่จุดใดบ้าง?

Note = คำใบ้: แยกตัวประกอบ $x(x^2-1)$''',
          ],
          "options": [
            r"$x = -1, 0, 1$",
            r"$x = 0, 1$",
            r"$x = -1, 1$",
            r"$x = 0$",
          ],
          "correct": r"$x = -1, 0, 1$",
          "explanation": r'''$x(x-1)(x+1) = 0$ → $x = -1, 0, 1$ 💚''',
        }),
        ContentBlock("area_q_046", "question_choice", {
          "content": [
            r'''2. $\int_{-1}^1 (x^2-1)\,dx = ?$ (คำนวณค่าปริพันธ์ตรงๆ)''',
          ],
          "options": [
            r"$-\dfrac{4}{3}$",
            r"$\dfrac{4}{3}$",
            r"$0$",
            r"$-2$",
          ],
          "correct": r"$-\dfrac{4}{3}$",
          "explanation": r'''$\left[\dfrac{x^3}{3}-x\right]_{-1}^1 = (\dfrac{1}{3}-1)-(-\dfrac{1}{3}+1) = -\dfrac{2}{3}-\dfrac{2}{3} = -\dfrac{4}{3}$

ค่าติดลบเพราะกราฟอยู่ใต้แกน $x$ ตลอดช่วงนี้ 💚''',
        }),
        ContentBlock("area_q_047", "question_choice", {
          "content": [
            r'''3. **พื้นที่จริง** ระหว่างกราฟ $f(x) = x^2-1$ กับแกน $x$ จาก $x=-1$ ถึง $x=1$ เท่ากับเท่าไร?''',
          ],
          "options": [
            r"$\dfrac{4}{3}$",
            r"$-\dfrac{4}{3}$",
            r"$0$",
            r"$2$",
          ],
          "correct": r"$\dfrac{4}{3}$",
          "explanation": r'''ปริพันธ์ให้ค่า $-\dfrac{4}{3}$ แต่พื้นที่จริงเอาค่าสัมบูรณ์ → $\dfrac{4}{3}$ 💚''',
        }),
        ContentBlock("area_q_048", "question_choice", {
          "content": [
            r'''4. จงหา**พื้นที่จริง**ระหว่างกราฟ $f(x) = x$ กับแกน $x$ จาก $x=-2$ ถึง $x=3$

Note = คำใบ้: กราฟตัดแกน $x$ ที่ $x=0$ → แยกเป็นช่วง $[-2,0]$ กับ $[0,3]$''',
          ],
          "options": [
            r"$\dfrac{13}{2}$",
            r"$\dfrac{5}{2}$",
            r"$\dfrac{9}{2}$",
            r"$5$",
          ],
          "correct": r"$\dfrac{13}{2}$",
          "explanation": r'''$\int_{-2}^0 x\,dx = \left[\dfrac{x^2}{2}\right]_{-2}^0 = 0-2 = -2$

$\int_0^3 x\,dx = \left[\dfrac{x^2}{2}\right]_0^3 = \dfrac{9}{2}$

พื้นที่จริง $= |-2| + \dfrac{9}{2} = 2 + \dfrac{9}{2} = \dfrac{13}{2}$ 💚''',
        }),
        ContentBlock("area_q_049", "question_choice", {
          "content": [
            r'''5. $\int_{-1}^2 (x^2-1)\,dx = ?$ (คำนวณตรงๆ ไม่แยกช่วง)''',
          ],
          "options": [
            r"$0$",
            r"$\dfrac{8}{3}$",
            r"$-\dfrac{4}{3}$",
            r"$\dfrac{4}{3}$",
          ],
          "correct": r"$0$",
          "explanation": r'''$\left[\dfrac{x^3}{3}-x\right]_{-1}^2 = (\dfrac{8}{3}-2)-(-\dfrac{1}{3}+1) = \dfrac{2}{3}-\dfrac{2}{3} = 0$

ส่วนลบกับส่วนบวกหักล้างกันพอดี — แต่พื้นที่จริง $\neq 0$ นะ! 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: แบบฝึกหัด
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("area_t_050", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้ผสมทุกแนวคิด รวมถึงเทคนิคเปลี่ยนตัวแปรจากบทก่อน ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("area_q_051", "question_choice", {
          "content": [
            r'''1. พื้นที่ใต้กราฟ $f(x) = 6x^2 - 2x$ จาก $x=0$ ถึง $x=1$ เท่ากับเท่าไร?''',
          ],
          "options": [r"$1$", r"$2$", r"$3$", r"$0$"],
          "correct": r"$1$",
          "explanation": r'''$\int_0^1 (6x^2-2x)\,dx = [2x^3-x^2]_0^1 = (2-1)-0 = 1$ 💚''',
        }),
        ContentBlock("area_q_052", "question_choice", {
          "content": [
            r'''2. $\int_0^1 2x(x^2+1)^3\,dx = ?$

Note = คำใบ้: ใช้การเปลี่ยนตัวแปร $u = x^2+1$''',
          ],
          "options": [
            r"$\dfrac{15}{4}$",
            r"$\dfrac{1}{4}$",
            r"$4$",
            r"$\dfrac{17}{4}$",
          ],
          "correct": r"$\dfrac{15}{4}$",
          "explanation": r'''$u = x^2+1$ , $du = 2x\,dx$

ขอบเขต: $x=0 \to u=1$ , $x=1 \to u=2$

$\int_1^2 u^3\,du = \left[\dfrac{u^4}{4}\right]_1^2 = \dfrac{16-1}{4} = \dfrac{15}{4}$ 💚''',
        }),
        ContentBlock("area_q_053", "question_choice", {
          "content": [
            r'''3. พื้นที่ใต้กราฟ $f(x) = x\sqrt{x^2+9}$ จาก $x=0$ ถึง $x=4$ เท่ากับเท่าไร?

Note = คำใบ้: $u = x^2+9$''',
          ],
          "options": [
            r"$\dfrac{98}{3}$",
            r"$\dfrac{49}{3}$",
            r"$\dfrac{125}{3}-9$",
            r"$\dfrac{196}{3}$",
          ],
          "correct": r"$\dfrac{98}{3}$",
          "explanation": r'''$u = x^2+9$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

ขอบเขต: $x=0 \to u=9$ , $x=4 \to u=25$

$\dfrac{1}{2}\int_9^{25} u^{1/2}\,du = \dfrac{1}{2}\left[\dfrac{2u^{3/2}}{3}\right]_9^{25} = \dfrac{1}{3}(125-27) = \dfrac{98}{3}$ 💚''',
        }),
        ContentBlock("area_ddq_054", "drag_and_drop", {
          "steps": [
            {
              "questionId": "area_ddq_054_s1",
              "content": [
                r'''4. จงหา**พื้นที่จริง**ระหว่างกราฟ $f(x) = x^3-4x$ กับแกน $x$ จาก $x=0$ ถึง $x=3$

จุดตัดแกน $x$: $x(x^2-4) = x(x-2)(x+2) = 0$

ในช่วง $[0,3]$ ตัดที่ $x=0$ และ $x=2$

ลองแทน $x=1$: $1-4 = -3 < 0$ → ช่วง $[0,2]$ กราฟอยู่ ''',
                {"drop": "0"},
                r''' แกน $x$

ลองแทน $x=2.5$: $15.625-10 = 5.625 > 0$ → ช่วง $[2,3]$ กราฟอยู่ ''',
                {"drop": "1"},
                r''' แกน $x$''',
              ],
              "draggableItems": [r"ใต้", r"เหนือ"],
              "correctAnswers": {"0": r"ใต้", "1": r"เหนือ"},
              "explanation": r'''แทนค่ากลางช่วงเพื่อเช็คว่ากราฟอยู่ฝั่งไหน ✅''',
            },
            {
              "questionId": "area_ddq_054_s2",
              "content": [
                r'''$\int_0^2 (x^3-4x)\,dx = \left[\dfrac{x^4}{4}-2x^2\right]_0^2 = (4-8)-0 = -4$

$\int_2^3 (x^3-4x)\,dx = \left[\dfrac{x^4}{4}-2x^2\right]_2^3 = (\dfrac{81}{4}-18)-(4-8) = \dfrac{81}{4}-18+4 = \dfrac{25}{4}$

พื้นที่จริง $= |-4| + \dfrac{25}{4} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{41}{4}$",
                r"$\dfrac{9}{4}$",
                r"$\dfrac{25}{4}$",
                r"$8$",
              ],
              "correctAnswers": {"0": r"$\dfrac{41}{4}$"},
              "explanation": r'''$4 + \dfrac{25}{4} = \dfrac{16+25}{4} = \dfrac{41}{4}$ 💚''',
            },
          ],
        }),
        ContentBlock("area_q_055", "question_choice", {
          "content": [
            r'''5. $\int_0^2 3x^2(x^3+1)^2\,dx = ?$

Note = คำใบ้: $u = x^3+1$''',
          ],
          "options": [
            r"$\dfrac{728}{3}$",
            r"$78$",
            r"$\dfrac{342}{3}$",
            r"$243$",
          ],
          "correct": r"$\dfrac{728}{3}$",
          "explanation": r'''$u = x^3+1$ , $du = 3x^2\,dx$

ขอบเขต: $u(0) = 1$ , $u(2) = 9$

$\int_1^9 u^2\,du = \left[\dfrac{u^3}{3}\right]_1^9 = \dfrac{729-1}{3} = \dfrac{728}{3}$ 💚''',
        }),
        ContentBlock("area_q_056", "question_choice", {
          "content": [
            r'''6. ถ้า $\int_0^4 f(x)\,dx = 5$ และ $\int_4^6 f(x)\,dx = -2$

แล้ว $\int_0^6 f(x)\,dx = ?$''',
          ],
          "options": [r"$3$", r"$7$", r"$-7$", r"$10$"],
          "correct": r"$3$",
          "explanation": r'''$\int_0^6 f(x)\,dx = \int_0^4 f(x)\,dx + \int_4^6 f(x)\,dx = 5 + (-2) = 3$ 💚''',
        }),
        ContentBlock("area_fi_057", "question_fill_in", {
          "content": [
            r'''7. จงหา**พื้นที่จริง**ระหว่างกราฟ $f(x) = x^2-4$ กับแกน $x$ จาก $x=0$ ถึง $x=3$

Note = คำใบ้: จุดตัดแกน $x$ ในช่วง $[0,3]$ อยู่ที่ $x=2$

พื้นที่จริง $= $ ''',
            {"box": "0"},
          ],
          "correct": r"19/3",
          "explanation": r'''ช่วง $[0,2]$: $f(x) \leq 0$ → $\int_0^2 (x^2-4)\,dx = [\dfrac{x^3}{3}-4x]_0^2 = \dfrac{8}{3}-8 = -\dfrac{16}{3}$

ช่วง $[2,3]$: $f(x) \geq 0$ → $\int_2^3 (x^2-4)\,dx = (9-12)-(\dfrac{8}{3}-8) = -3+\dfrac{16}{3} = \dfrac{7}{3}$

ไม่ใช่ — ลองใหม่:

$F(3) = \dfrac{27}{3}-12 = 9-12 = -3$ , $F(2) = \dfrac{8}{3}-8 = -\dfrac{16}{3}$

$\int_2^3 = -3-(-\dfrac{16}{3}) = -3+\dfrac{16}{3} = \dfrac{-9+16}{3} = \dfrac{7}{3}$

$\int_0^2 = -\dfrac{16}{3}-0 = -\dfrac{16}{3}$

พื้นที่จริง $= \dfrac{16}{3} + \dfrac{7}{3} = \dfrac{23}{3}$

🔄 ตรวจอีกที: $F(2)-F(0) = (\dfrac{8}{3}-8)-(0) = -\dfrac{16}{3}$ ✅

$F(3)-F(2) = -3-(-\dfrac{16}{3}) = \dfrac{7}{3}$ ✅

พื้นที่จริง $= \dfrac{16}{3}+\dfrac{7}{3} = \dfrac{23}{3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("area_t_058", "text", {
          "content": [
            r'''🎯 **ปริพันธ์จำกัดเขต = พื้นที่ระหว่างกราฟกับแกน $x$**

$$\int_a^b f(x)\,dx = F(b) - F(a) = \text{พื้นที่ใต้กราฟ (มีเครื่องหมาย)}$$''',
          ],
        }),
        ContentBlock("area_t_059", "text", {
          "content": [
            r'''**เครื่องหมายของพื้นที่:**

🔸 กราฟเหนือแกน $x$ → ปริพันธ์เป็น **บวก**

🔸 กราฟใต้แกน $x$ → ปริพันธ์เป็น **ลบ**

🔸 ถ้ากราฟข้ามแกน → ส่วนบวกกับลบ**หักล้างกัน**''',
          ],
        }),
        ContentBlock("area_t_060", "text", {
          "content": [
            r'''**เมื่อต้องการพื้นที่จริง (ไม่ติดลบ):**

🔸 หาจุดตัดแกน $x$ → แก้ $f(x) = 0$

🔸 แยกช่วง แล้วหาปริพันธ์แต่ละช่วง

🔸 เอาค่าสัมบูรณ์ส่วนที่ติดลบ แล้วรวมทั้งหมด''',
          ],
        }),
        ContentBlock("area_t_061", "text", {
          "content": [
            r'''Note = ข้อควรระวัง

🔸 "ค่าปริพันธ์" กับ "พื้นที่จริง" **ไม่เหมือนกัน**เมื่อกราฟข้ามแกน $x$

🔸 ดูโจทย์ให้ดี — ถามค่าปริพันธ์ หรือถามพื้นที่จริง?

🔸 เทคนิคเปลี่ยนตัวแปร (U-Sub) ใช้ร่วมกับการหาพื้นที่ได้เสมอ!''',
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
    // =============================================
    // SECTION 1: พื้นที่ปิดล้อมคืออะไร?
    // =============================================
    ContentSection(
      headerL1: r"🤔 พื้นที่ปิดล้อมคืออะไร?",
      blocks: [
        ContentBlock("enc_h_001", "header", {
          "title": r"ปริพันธ์ กับ พื้นที่จริง ไม่เหมือนกัน!",
          "level": 2,
        }),
        ContentBlock("enc_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เรารู้ว่าปริพันธ์จำกัดเขต**สามารถติดลบได้** — ส่วนที่อยู่ใต้แกน $x$ จะให้ค่าลบ

แต่ถ้าโจทย์ถามว่า **"พื้นที่ปิดล้อมระหว่างกราฟกับแกน $x$ เท่ากับเท่าไร?"** ล่ะ? 🤔''',
          ],
        }),
        ContentBlock("enc_t_003", "text", {
          "content": [
            r'''"พื้นที่" ในโลกจริงจะ**ติดลบไม่ได้** — ห้องกว้าง $20$ ตร.ม. ไม่ใช่ $-20$ ตร.ม.!

ดังนั้น **พื้นที่ปิดล้อม** = พื้นที่รวมจริงทั้งหมด โดยไม่ปล่อยให้ส่วนบวก-ลบหักล้างกัน''',
          ],
        }),
        ContentBlock("enc_h_004", "header", {
          "title": r"ดูรูปเปรียบเทียบ",
          "level": 2,
        }),
        ContentBlock("enc_img_005", "image", {
          "path": "assets/int5.png",
        }),
        ContentBlock("enc_t_006", "text", {
          "content": [
            r'''ในรูปนี้ กราฟมีพื้นที่ $4$ อยู่เหนือแกน $x$ และพื้นที่ $4$ อยู่ใต้แกน $x$

📊 **ค่าปริพันธ์:** $4 + (-4) = 0$ — หักล้างกันหมด!

🎯 **พื้นที่ปิดล้อม:** $4 + 4 = 8$ — เอาทุกส่วนมารวมกัน ไม่สนเครื่องหมาย''',
          ],
        }),
        ContentBlock("enc_t_007", "text", {
          "content": [
            r'''Note = จำให้ขึ้นใจ

ค่าปริพันธ์ $\int_a^b f(x)\,dx$ → ปล่อยให้ $+/-$ หักล้างกัน

พื้นที่ปิดล้อม → เอา**ค่าสัมบูรณ์**ของแต่ละส่วนมาบวกกัน''',
          ],
        }),
        ContentBlock("enc_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "enc_ddq_008_s1",
              "content": [
                r'''สมมติกราฟ $f(x)$ มีพื้นที่เหนือแกน $x$ เท่ากับ $5$ และพื้นที่ใต้แกน $x$ เท่ากับ $3$

ค่าปริพันธ์ $= $ ''',
                {"drop": "0"},
                r'''พื้นที่ปิดล้อม $= $ ''',
                {"drop": "1"},
              ],
              "draggableItems": [r"$2$", r"$8$", r"$-2$", r"$-8$"],
              "correctAnswers": {"0": r"$2$", "1": r"$8$"},
              "explanation": r'''ปริพันธ์: $5 + (-3) = 2$ (หักล้าง) แต่พื้นที่ปิดล้อม: $5 + 3 = 8$ (รวมจริง) 💚''',
            },
          ],
        }),
        ContentBlock("enc_h_009", "header", {
          "title": r"ลองคิดกลับกัน",
          "level": 2,
        }),
        ContentBlock("enc_q_010", "question_choice", {
          "content": [
            r'''1. ถ้าค่าปริพันธ์ $\int_0^5 f(x)\,dx = 0$ แปลว่าพื้นที่ปิดล้อมเป็น $0$ ด้วยหรือไม่?''',
          ],
          "options": [
            r"ไม่จำเป็น — อาจหักล้างกันพอดี",
            r"ใช่ — ปริพันธ์เป็น 0 แปลว่าไม่มีพื้นที่",
            r"ใช่ — เพราะพื้นที่ปิดล้อมเท่ากับปริพันธ์เสมอ",
            r"บอกไม่ได้เลย",
          ],
          "correct": r"ไม่จำเป็น — อาจหักล้างกันพอดี",
          "explanation": r'''เหมือนตัวอย่างที่เพิ่งเห็น — ปริพันธ์ $= 0$ แต่พื้นที่ปิดล้อม $= 8$

ค่าปริพันธ์เป็น $0$ บอกแค่ว่าส่วนบวกกับลบ**หักล้างกันพอดี** ไม่ได้แปลว่าไม่มีพื้นที่ 💚''',
        }),
        ContentBlock("enc_q_011", "question_choice", {
          "content": [
            r'''2. ถ้ากราฟ $f(x) \geq 0$ ตลอดช่วง $[a,b]$ (อยู่เหนือแกน $x$ ตลอด) แล้วพื้นที่ปิดล้อมเท่ากับอะไร?''',
          ],
          "options": [
            r"$\int_a^b f(x)\,dx$ ได้เลย",
            r"$-\int_a^b f(x)\,dx$",
            r"$0$",
            r"บอกไม่ได้",
          ],
          "correct": r"$\int_a^b f(x)\,dx$ ได้เลย",
          "explanation": r'''ถ้ากราฟอยู่เหนือแกน $x$ ตลอด → ปริพันธ์ไม่ติดลบอยู่แล้ว → ค่าปริพันธ์ = พื้นที่ปิดล้อม โดยไม่ต้องทำอะไรเพิ่ม 💚''',
        }),
        ContentBlock("enc_q_012", "question_choice", {
          "content": [
            r'''3. ถ้า $\int_0^3 f(x)\,dx = -7$ และกราฟอยู่ใต้แกน $x$ ตลอดช่วง $[0,3]$ พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$7$", r"$-7$", r"$0$", r"$14$"],
          "correct": r"$7$",
          "explanation": r'''กราฟอยู่ใต้แกน $x$ ตลอด → มีแค่ส่วนเดียว → ค่าสัมบูรณ์ $|-7| = 7$ 💚''',
        }),
        ContentBlock("enc_q_013", "question_choice", {
          "content": [
            r'''4. กราฟ $f(x)$ ในช่วง $[0,6]$ แบ่งเป็น 3 ส่วน:

$\int_0^2 f(x)\,dx = 3$ , $\int_2^4 f(x)\,dx = -5$ , $\int_4^6 f(x)\,dx = 2$

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$10$", r"$0$", r"$6$", r"$-5$"],
          "correct": r"$10$",
          "explanation": r'''พื้นที่ปิดล้อม $= |3| + |-5| + |2| = 3 + 5 + 2 = 10$ 💚

ส่วนค่าปริพันธ์ตรงๆ จะได้ $3 + (-5) + 2 = 0$ — เห็นความต่างไหม?''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: แนวคิดหลัก
    // =============================================
    ContentSection(
      headerL1: r"💡 แนวคิดหลัก: รู้ว่าช่วงไหนบวก ช่วงไหนลบ",
      blocks: [
        ContentBlock("enc_h_014", "header", {
          "title": r"ปัญหาคือ — เราไม่รู้ว่าส่วนไหนติดลบ!",
          "level": 2,
        }),
        ContentBlock("enc_t_015", "text", {
          "content": [
            r'''ถ้าเราหา $\int_a^b f(x)\,dx$ ตรงๆ ส่วนบวก-ลบจะหักล้างกันอัตโนมัติ

เราจะ**แยกส่วน**ได้ ต้องรู้ก่อนว่า กราฟ**ข้ามแกน $x$ ตรงไหน** — นั่นคือจุดที่ $f(x) = 0$''',
          ],
        }),
        ContentBlock("enc_img_016", "image", {
          "path": "assets/int6.png",
        }),
        ContentBlock("enc_t_017", "text", {
          "content": [
            r'''ในรูป กราฟตัดแกน $x$ ที่ $x = -1$ และ $x = 1$

ทำให้เราแบ่งได้เป็น 3 ช่วง — แต่ละช่วงกราฟอยู่ฝั่งเดียวกันตลอด (เหนือหรือใต้แกน $x$)

พอแบ่งได้แล้ว ก็หาปริพันธ์**แต่ละช่วงแยกกัน** แล้วเอาค่าสัมบูรณ์มารวม''',
          ],
        }),
        ContentBlock("enc_h_018", "header", {
          "title": r"แนวคิดทั้งหมดคือแค่นี้",
          "level": 2,
        }),
        ContentBlock("enc_t_019", "text", {
          "content": [
            r'''🔸 หา**จุดที่กราฟตัดแกน $x$** → แก้ $f(x) = 0$

🔸 ใช้จุดตัดเหล่านั้น**แบ่งช่วง**ออกเป็นส่วนๆ (รวมขอบเขตที่โจทย์กำหนดด้วย)

🔸 หาปริพันธ์แต่ละช่วง แล้วเอา**ค่าสัมบูรณ์**มาบวกกัน''',
          ],
        }),
        ContentBlock("enc_t_020", "text", {
          "content": [
            r'''$$\text{พื้นที่ปิดล้อม} = \left|\int_{x_1}^{x_2} f(x)\,dx\right| + \left|\int_{x_2}^{x_3} f(x)\,dx\right| + \cdots$$

โดยที่ $x_1, x_2, x_3, \ldots$ คือจุดตัดแกน $x$ และขอบเขตที่โจทย์ให้''',
          ],
        }),
        ContentBlock("enc_t_021", "text", {
          "content": [
            r'''Note = ทำไมต้องรวมขอบเขตที่โจทย์ให้?

เพราะโจทย์อาจถามแค่บางช่วง ไม่ใช่ตั้งแต่จุดตัดถึงจุดตัด

เช่น กราฟตัดแกน $x$ ที่ $x = -2, 0, 2$ แต่โจทย์ถามจาก $x = -1$ ถึง $x = 3$ → ขอบเขตที่ใช้แบ่งคือ $-1, 0, 2, 3$''',
          ],
        }),
        ContentBlock("enc_h_022", "header", {
          "title": r"ตัวอย่าง — ลองทำด้วยกัน",
          "level": 2,
        }),
        ContentBlock("enc_t_023", "text", {
          "content": [
            r'''จงหาพื้นที่ปิดล้อมระหว่างกราฟ $f(x) = x^2 - 4$ กับแกน $x$ จาก $x = -2$ ถึง $x = 2$''',
          ],
        }),
        ContentBlock("enc_ddq_024", "drag_and_drop", {
          "steps": [
            {
              "questionId": "enc_ddq_024_s1",
              "content": [
                r'''หาจุดตัดแกน $x$: $x^2 - 4 = 0$ → $x = \pm 2$

สังเกต: จุดตัดตรงกับขอบเขตพอดี! แปลว่าในช่วง $[-2, 2]$ กราฟ**ไม่ได้ข้ามแกน** $x$ → มีแค่ส่วนเดียว

ลองแทน $x = 0$: $f(0) = -4 < 0$ → กราฟอยู่ ''',
                {"drop": "0"},
                r''' แกน $x$ ตลอดช่วงนี้''',
              ],
              "draggableItems": [r"เหนือ", r"ใต้"],
              "correctAnswers": {"0": r"ใต้"},
              "explanation": r'''$f(0) = -4 < 0$ → กราฟอยู่ใต้แกน $x$ ✅''',
            },
            {
              "questionId": "enc_ddq_024_s2",
              "content": [
                r'''$\int_{-2}^2 (x^2-4)\,dx = \left[\dfrac{x^3}{3}-4x\right]_{-2}^2$

$= \left(\dfrac{8}{3}-8\right) - \left(-\dfrac{8}{3}+8\right) = -\dfrac{16}{3} - \dfrac{16}{3} = -\dfrac{32}{3}$

ค่าติดลบ เพราะกราฟอยู่ใต้แกน $x$

พื้นที่ปิดล้อม $= \left|-\dfrac{32}{3}\right| = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{32}{3}$", r"$-\dfrac{32}{3}$", r"$\dfrac{16}{3}$", r"$0$"],
              "correctAnswers": {"0": r"$\dfrac{32}{3}$"},
              "explanation": r'''เอาค่าสัมบูรณ์ → $\dfrac{32}{3}$ ตร.หน่วย 💚''',
            },
          ],
        }),
        ContentBlock("enc_h_025", "header", {
          "title": r"ตัวอย่าง — กราฟข้ามแกน $x$",
          "level": 2,
        }),
        ContentBlock("enc_t_026", "text", {
          "content": [
            r'''จงหาพื้นที่ปิดล้อมระหว่างกราฟ $f(x) = x^3 - 4x$ กับแกน $x$ จาก $x = -2$ ถึง $x = 2$''',
          ],
        }),
        ContentBlock("enc_ddq_027", "drag_and_drop", {
          "steps": [
            {
              "questionId": "enc_ddq_027_s1",
              "content": [
                r'''จุดตัดแกน $x$: $x^3 - 4x = x(x^2-4) = x(x-2)(x+2) = 0$

$x = -2, 0, 2$ — ตรงกับขอบเขตพอดี!

แบ่งเป็น 2 ช่วง: $[-2, 0]$ และ $[0, 2]$

ลองแทน $x = -1$: $f(-1) = -1+4 = 3 > 0$ → ช่วง $[-2,0]$ กราฟอยู่ ''',
                {"drop": "0"},
                r''' แกน $x$

ลองแทน $x = 1$: $f(1) = 1-4 = -3 < 0$ → ช่วง $[0,2]$ กราฟอยู่ ''',
                {"drop": "1"},
                r''' แกน $x$''',
              ],
              "draggableItems": [r"เหนือ", r"ใต้"],
              "correctAnswers": {"0": r"เหนือ", "1": r"ใต้"},
              "explanation": r'''แทนค่ากลางช่วงเพื่อเช็คว่ากราฟอยู่ฝั่งไหน ✅''',
            },
            {
              "questionId": "enc_ddq_027_s2",
              "content": [
                r'''$\int_{-2}^0 (x^3-4x)\,dx = \left[\dfrac{x^4}{4}-2x^2\right]_{-2}^0 = 0 - (4-8) = 4$

$\int_0^2 (x^3-4x)\,dx = \left[\dfrac{x^4}{4}-2x^2\right]_0^2 = (4-8) - 0 = -4$

พื้นที่ปิดล้อม $= |4| + |-4| = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$8$", r"$0$", r"$4$", r"$-4$"],
              "correctAnswers": {"0": r"$8$"},
              "explanation": r'''$4 + 4 = 8$ ตร.หน่วย — ถ้าหาปริพันธ์ตรงๆ จะได้ $0$ แต่พื้นที่จริงคือ $8$ 💚''',
            },
          ],
        }),
        ContentBlock("enc_h_028", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("enc_q_029", "question_choice", {
          "content": [
            r'''1. $f(x) = x^2 - 1$ จาก $x = -1$ ถึง $x = 1$

จุดตัดแกน $x$: $x = \pm 1$ (ตรงขอบเขตพอดี) กราฟอยู่ใต้แกน $x$ ตลอด

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$\dfrac{4}{3}$", r"$-\dfrac{4}{3}$", r"$\dfrac{2}{3}$", r"$0$"],
          "correct": r"$\dfrac{4}{3}$",
          "explanation": r'''$\int_{-1}^1 (x^2-1)\,dx = -\dfrac{4}{3}$

กราฟอยู่ใต้แกน $x$ ตลอด → ค่าสัมบูรณ์ $= \dfrac{4}{3}$ 💚''',
        }),
        ContentBlock("enc_q_030", "question_choice", {
          "content": [
            r'''2. $f(x) = x$ จาก $x = -3$ ถึง $x = 2$

จุดตัดแกน $x$ ที่ $x = 0$

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$\dfrac{13}{2}$", r"$-\dfrac{5}{2}$", r"$\dfrac{5}{2}$", r"$\dfrac{9}{2}$"],
          "correct": r"$\dfrac{13}{2}$",
          "explanation": r'''$\int_{-3}^0 x\,dx = -\dfrac{9}{2}$ , $\int_0^2 x\,dx = 2$

พื้นที่ปิดล้อม $= \dfrac{9}{2} + 2 = \dfrac{13}{2}$ 💚''',
        }),
        ContentBlock("enc_q_031", "question_choice", {
          "content": [
            r'''3. $f(x) = x^3 - x$ ตัดแกน $x$ ที่ $x = -1, 0, 1$

ถ้าต้องการพื้นที่ปิดล้อมจาก $x = -1$ ถึง $x = 1$ ต้องแบ่งเป็นกี่ช่วง?''',
          ],
          "options": [r"$2$ ช่วง", r"$1$ ช่วง", r"$3$ ช่วง", r"$4$ ช่วง"],
          "correct": r"$2$ ช่วง",
          "explanation": r'''จุดตัดในช่วง $[-1,1]$ คือ $x = -1, 0, 1$ → แบ่งเป็น $[-1,0]$ กับ $[0,1]$ = $2$ ช่วง 💚''',
        }),
        ContentBlock("enc_q_032", "question_choice", {
          "content": [
            r'''4. $f(x) = 2x - x^2$ จาก $x = 0$ ถึง $x = 2$

$f(x) = x(2-x) = 0$ ที่ $x = 0, 2$ → กราฟไม่ข้ามแกน $x$ ในช่วงนี้

ลองแทน $x = 1$: $f(1) = 1 > 0$

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$\dfrac{4}{3}$", r"$-\dfrac{4}{3}$", r"$4$", r"$2$"],
          "correct": r"$\dfrac{4}{3}$",
          "explanation": r'''กราฟอยู่เหนือแกน $x$ ตลอด → ใช้ปริพันธ์ตรงๆ ได้เลย

$\int_0^2 (2x-x^2)\,dx = [x^2-\dfrac{x^3}{3}]_0^2 = 4 - \dfrac{8}{3} = \dfrac{4}{3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ลองทำจริง
    // =============================================
    ContentSection(
      headerL1: r"🎯 ลองทำจริง",
      blocks: [
        ContentBlock("enc_h_033", "header", {
          "title": r"ขอบเขตไม่ตรงจุดตัดพอดี",
          "level": 2,
        }),
        ContentBlock("enc_t_034", "text", {
          "content": [
            r'''บ่อยครั้งที่ขอบเขตที่โจทย์ให้**ไม่ตรงกับจุดตัดแกน $x$** เช่น:

กราฟตัดแกน $x$ ที่ $x = 1$ แต่โจทย์ถามจาก $x = 0$ ถึง $x = 3$

ต้องรวมขอบ $0$ กับ $3$ เข้าไปด้วย → จุดแบ่งคือ $0, 1, 3$''',
          ],
        }),
        ContentBlock("enc_ddq_035", "drag_and_drop", {
          "steps": [
            {
              "questionId": "enc_ddq_035_s1",
              "content": [
                r'''จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = (x-2)(x-1)(x+1)(x+2)$ กับแกน $x$ จาก $x = -1.5$ ถึง $x = 2$''',
                {"image": "assets/int7.png"},
                r'''จุดตัดแกน $x$: $x = -2, -1, 1, 2$

ในช่วง $[-1.5, 2]$ จุดที่ใช้แบ่งช่วง (รวมขอบ) คือ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$-1.5, -1, 1, 2$",
                r"$-2, -1, 1, 2$",
                r"$-1, 1, 2$",
                r"$-1.5, 2$",
              ],
              "correctAnswers": {"0": r"$-1.5, -1, 1, 2$"},
              "explanation": r'''รวมขอบ $-1.5$ และ $2$ เข้ากับจุดตัดที่อยู่ในช่วง ($-1$ และ $1$) ✅''',
            },
            {
              "questionId": "enc_ddq_035_s2",
              "content": [
                r'''$f(x) = x^4 - 5x^2 + 4$ , $F(x) = \dfrac{x^5}{5} - \dfrac{5x^3}{3} + 4x$

ช่วง $[-1.5, -1]$: $F(-1) - F(-1.5) = -\dfrac{307}{480}$

ช่วง $[-1, 1]$: $F(1) - F(-1) = \dfrac{76}{15}$

ช่วง $[1, 2]$: $F(2) - F(1) = -\dfrac{22}{15}$

พื้นที่ปิดล้อม $= \dfrac{307}{480} + \dfrac{76}{15} + \dfrac{22}{15} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{3443}{480}$", r"$\dfrac{307}{480}$", r"$\dfrac{76}{15}$", r"$6$"],
              "correctAnswers": {"0": r"$\dfrac{3443}{480}$"},
              "explanation": r'''แปลงเป็นตัวส่วนเดียวกัน: $\dfrac{307}{480} + \dfrac{2432}{480} + \dfrac{704}{480} = \dfrac{3443}{480}$ 💚''',
            },
          ],
        }),
        ContentBlock("enc_h_036", "header", {
          "title": r"ฝึกเลย",
          "level": 2,
        }),
        ContentBlock("enc_q_037", "question_choice", {
          "content": [
            r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 - 4$ กับแกน $x$ จาก $x = 0$ ถึง $x = 3$

Note = คำใบ้: จุดตัดแกน $x$ ที่ $x = \pm 2$ → ในช่วง $[0,3]$ ตัดที่ $x = 2$''',
          ],
          "options": [r"$\dfrac{23}{3}$", r"$\dfrac{7}{3}$", r"$\dfrac{16}{3}$", r"$3$"],
          "correct": r"$\dfrac{23}{3}$",
          "explanation": r'''ช่วง $[0,2]$: $f(x) \leq 0$ → $\int_0^2 (x^2-4)\,dx = \dfrac{8}{3}-8 = -\dfrac{16}{3}$

ช่วง $[2,3]$: $f(x) \geq 0$ → $\int_2^3 (x^2-4)\,dx = (9-12)-(\dfrac{8}{3}-8) = \dfrac{7}{3}$

พื้นที่ปิดล้อม $= \dfrac{16}{3} + \dfrac{7}{3} = \dfrac{23}{3}$ 💚''',
        }),
        ContentBlock("enc_q_038", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3 - 4x$ กับแกน $x$ จาก $x = 0$ ถึง $x = 3$

Note = คำใบ้: $x(x-2)(x+2)=0$ → ในช่วง $[0,3]$ ตัดที่ $x = 0$ และ $x = 2$''',
          ],
          "options": [r"$\dfrac{41}{4}$", r"$\dfrac{25}{4}$", r"$4$", r"$\dfrac{9}{4}$"],
          "correct": r"$\dfrac{41}{4}$",
          "explanation": r'''ช่วง $[0,2]$: $\int_0^2 (x^3-4x)\,dx = (4-8)-0 = -4$

ช่วง $[2,3]$: $\int_2^3 (x^3-4x)\,dx = (\dfrac{81}{4}-18)-(4-8) = \dfrac{25}{4}$

พื้นที่ปิดล้อม $= 4 + \dfrac{25}{4} = \dfrac{41}{4}$ 💚''',
        }),
        ContentBlock("enc_q_039", "question_choice", {
          "content": [
            r'''3. $f(x) = \sin x$ จาก $x = 0$ ถึง $x = 2\pi$

$\sin x = 0$ ที่ $x = 0, \pi, 2\pi$

เรารู้ว่า $\int_0^{\pi} \sin x\,dx = 2$ และ $\int_{\pi}^{2\pi} \sin x\,dx = -2$

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$4$", r"$0$", r"$2$", r"$2\pi$"],
          "correct": r"$4$",
          "explanation": r'''$|2| + |-2| = 4$ ตร.หน่วย

ถ้าหาปริพันธ์ตรงๆ จะได้ $2 + (-2) = 0$ — แต่พื้นที่จริงคือ $4$ 💚''',
        }),
        ContentBlock("enc_q_040", "question_choice", {
          "content": [
            r'''4. $f(x) = x^3 - x$ จาก $x = -1$ ถึง $x = 1$

จุดตัดแกน $x$: $x(x-1)(x+1) = 0$ → $x = -1, 0, 1$

พื้นที่ปิดล้อมเท่ากับเท่าไร?''',
          ],
          "options": [r"$\dfrac{1}{2}$", r"$0$", r"$\dfrac{1}{4}$", r"$1$"],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''$\int_{-1}^0 (x^3-x)\,dx = \left[\dfrac{x^4}{4}-\dfrac{x^2}{2}\right]_{-1}^0 = 0 - (\dfrac{1}{4}-\dfrac{1}{2}) = \dfrac{1}{4}$

$\int_0^1 (x^3-x)\,dx = (\dfrac{1}{4}-\dfrac{1}{2}) - 0 = -\dfrac{1}{4}$

พื้นที่ปิดล้อม $= \dfrac{1}{4} + \dfrac{1}{4} = \dfrac{1}{2}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: แบบฝึกหัด
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัด",
      blocks: [
        ContentBlock("enc_t_041", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้ยากขึ้น — บางข้อต้องใช้การเปลี่ยนตัวแปรร่วมด้วย ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("enc_q_043", "question_choice", {
          "content": [
            r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 - 9$ กับแกน $x$ จาก $x = 0$ ถึง $x = 3$''',
          ],
          "options": [r"$18$", r"$9$", r"$36$", r"$27$"],
          "correct": r"$18$",
          "explanation": r'''กราฟอยู่ใต้แกน $x$ ตลอดช่วง $[0,3]$

$\int_0^3 (x^2-9)\,dx = [x^3/3-9x]_0^3 = (9-27)-0 = -18$

พื้นที่ปิดล้อม $= |-18| = 18$ 💚''',
        }),
        ContentBlock("enc_q_044", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3$ กับแกน $x$ จาก $x = -1$ ถึง $x = 2$

Note = คำใบ้: $x^3 = 0$ ที่ $x = 0$''',
          ],
          "options": [r"$\dfrac{17}{4}$", r"$\dfrac{15}{4}$", r"$4$", r"$\dfrac{1}{4}$"],
          "correct": r"$\dfrac{17}{4}$",
          "explanation": r'''ช่วง $[-1,0]$: $\int_{-1}^0 x^3\,dx = 0 - \dfrac{1}{4} = -\dfrac{1}{4}$

ช่วง $[0,2]$: $\int_0^2 x^3\,dx = 4$

พื้นที่ปิดล้อม $= \dfrac{1}{4} + 4 = \dfrac{17}{4}$ 💚''',
        }),
        ContentBlock("enc_q_045", "question_choice", {
          "content": [
            r'''3. จงหาพื้นที่ใต้กราฟ $f(x) = 2x(x^2+1)^3$ จาก $x = 0$ ถึง $x = 1$

Note = คำใบ้: ใช้การเปลี่ยนตัวแปร $u = x^2+1$ — กราฟอยู่เหนือแกน $x$ ตลอดในช่วงนี้''',
          ],
          "options": [r"$\dfrac{15}{4}$", r"$\dfrac{1}{4}$", r"$4$", r"$\dfrac{17}{4}$"],
          "correct": r"$\dfrac{15}{4}$",
          "explanation": r'''$u = x^2+1$ , $du = 2x\,dx$ , ขอบเขต: $u(0)=1, u(1)=2$

$\int_1^2 u^3\,du = [\dfrac{u^4}{4}]_1^2 = \dfrac{16-1}{4} = \dfrac{15}{4}$

กราฟเหนือแกน $x$ ตลอด → พื้นที่ปิดล้อม $= \dfrac{15}{4}$ 💚''',
        }),
        ContentBlock("enc_q_046", "question_choice", {
          "content": [
            r'''4. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x(x^2-1)^2$ กับแกน $x$ จาก $x = -1$ ถึง $x = 1$

Note = คำใบ้: $f(x) = 0$ เมื่อ $x = 0, \pm 1$ ลองแทนค่าเช็คแต่ละช่วง แล้วใช้ $u = x^2-1$''',
          ],
          "options": [r"$\dfrac{1}{3}$", r"$\dfrac{2}{3}$", r"$0$", r"$\dfrac{1}{6}$"],
          "correct": r"$\dfrac{1}{3}$",
          "explanation": r'''ช่วง $[-1,0]$: $u = x^2-1$ , $du = 2x\,dx$ → $x\,dx = \dfrac{1}{2}\,du$

$x=-1 \to u=0$ , $x=0 \to u=-1$

$\dfrac{1}{2}\int_0^{-1} u^2\,du = \dfrac{1}{2}[\dfrac{u^3}{3}]_0^{-1} = \dfrac{1}{2}(-\dfrac{1}{3}) = -\dfrac{1}{6}$

ช่วง $[0,1]$: $x=0 \to u=-1$ , $x=1 \to u=0$

$\dfrac{1}{2}\int_{-1}^0 u^2\,du = \dfrac{1}{2}[\dfrac{u^3}{3}]_{-1}^0 = \dfrac{1}{2}(0-(-\dfrac{1}{3})) = \dfrac{1}{6}$

พื้นที่ปิดล้อม $= \dfrac{1}{6} + \dfrac{1}{6} = \dfrac{1}{3}$ 💚''',
        }),
        ContentBlock("enc_q_047", "question_choice", {
          "content": [
            r'''5. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3 - 4x$ กับแกน $x$ จาก $x = -2$ ถึง $x = 3$

Note = คำใบ้: จุดตัดในช่วง $[-2,3]$ คือ $x = -2, 0, 2$''',
          ],
          "options": [r"$\dfrac{57}{4}$", r"$\dfrac{41}{4}$", r"$8$", r"$\dfrac{25}{4}$"],
          "correct": r"$\dfrac{57}{4}$",
          "explanation": r'''แบ่ง 3 ช่วง: $[-2,0], [0,2], [2,3]$

$\int_{-2}^0 = 4$ , $\int_0^2 = -4$ , $\int_2^3 = \dfrac{25}{4}$

พื้นที่ปิดล้อม $= 4 + 4 + \dfrac{25}{4} = \dfrac{57}{4}$ 💚''',
        }),
        ContentBlock("enc_fi_048", "question_fill_in", {
          "content": [
            r'''6. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 3x^2 - 3$ กับแกน $x$ จาก $x = -2$ ถึง $x = 2$

Note = คำใบ้: $3(x^2-1) = 3(x-1)(x+1) = 0$ → จุดตัดที่ $x = \pm 1$

พื้นที่ปิดล้อม $= $ ''',
            {"box": "0"},
          ],
          "correct": "12",
          "explanation": r'''แบ่ง 3 ช่วง: $[-2,-1], [-1,1], [1,2]$

$\int_{-2}^{-1} (3x^2-3)\,dx = [x^3-3x]_{-2}^{-1} = (-1+3)-(-8+6) = 2+2 = 4$

$\int_{-1}^1 (3x^2-3)\,dx = (1-3)-(-1+3) = -2-2 = -4$

$\int_1^2 (3x^2-3)\,dx = (8-6)-(1-3) = 2+2 = 4$

พื้นที่ปิดล้อม $= 4 + 4 + 4 = 12$ 💚''',
        }),
        ContentBlock("enc_fi_049", "question_fill_in", {
          "content": [
            r'''7. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 4x(x^2-4)^2$ กับแกน $x$ จาก $x = 0$ ถึง $x = 2$

Note = คำใบ้: $f(x) \geq 0$ ตลอดช่วงนี้ (ทำไม?) ใช้ $u = x^2-4$

พื้นที่ปิดล้อม $= $ ''',
            {"box": "0"},
          ],
          "correct": "128/3",
          "explanation": r'''$f(x) = 4x(x^2-4)^2$ → $(x^2-4)^2 \geq 0$ เสมอ และ $x \geq 0$ ในช่วง $[0,2]$ → $f(x) \geq 0$ ตลอด

$u = x^2-4$ , $du = 2x\,dx$ → $4x\,dx = 2\,du$

ขอบเขต: $x=0 \to u=-4$ , $x=2 \to u=0$

$2\int_{-4}^0 u^2\,du = 2\left[\dfrac{u^3}{3}\right]_{-4}^0 = 2\left(0+\dfrac{64}{3}\right) = \dfrac{128}{3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("enc_t_050", "text", {
          "content": [
            r'''🎯 **พื้นที่ปิดล้อม = พื้นที่รวมจริง โดยไม่ปล่อยให้ส่วนบวก-ลบหักล้างกัน**

ต่างจากค่าปริพันธ์ที่ส่วนใต้แกน $x$ จะหักลบจากส่วนเหนือ''',
          ],
        }),
        ContentBlock("enc_t_051", "text", {
          "content": [
            r'''**แนวคิดหลัก:**

🔸 หาจุดที่กราฟตัดแกน $x$ → แก้ $f(x) = 0$

🔸 ใช้จุดตัดเหล่านั้น (รวมขอบเขตที่โจทย์ให้) **แบ่งช่วง** — แต่ละช่วงกราฟอยู่ฝั่งเดียวตลอด

🔸 หาปริพันธ์แต่ละช่วง แล้วเอา**ค่าสัมบูรณ์**มาบวกกัน''',
          ],
        }),
        ContentBlock("enc_t_052", "text", {
          "content": [
            r'''$$\text{พื้นที่ปิดล้อม} = \left|\int_{x_1}^{x_2} f(x)\,dx\right| + \left|\int_{x_2}^{x_3} f(x)\,dx\right| + \cdots$$''',
          ],
        }),
        ContentBlock("enc_t_053", "text", {
          "content": [
            r'''Note = ข้อสังเกตสำคัญ

🔸 ถ้ากราฟอยู่เหนือแกน $x$ ตลอด → ปริพันธ์ = พื้นที่ปิดล้อมเลย ไม่ต้องแบ่งช่วง

🔸 ถ้ากราฟอยู่ใต้แกน $x$ ตลอด → ค่าปริพันธ์ติดลบ แค่ติดค่าสัมบูรณ์ก็จบ

🔸 ต้องแบ่งช่วง**เฉพาะเมื่อกราฟข้ามแกน $x$** เท่านั้น!''',
          ],
        }),
      ],
    ),
  ],
);

final calcAreaBetweenLesson = ContentLesson(
  title: "การหาพื้นที่ระหว่าง 2 กราฟ",
  sections: [
    // =============================================
    // SECTION 1: จากพื้นที่ใต้กราฟ 1 เส้น → 2 เส้น
    // =============================================
    ContentSection(
      headerL1: r"🤔 จากกราฟ 1 เส้น → 2 เส้น",
      blocks: [
        ContentBlock("ab_h_001", "header", {
          "title": r"ถ้ามีกราฟ 2 เส้นซ้อนกัน?",
          "level": 2,
        }),
        ContentBlock("ab_t_002", "text", {
          "content": [
            r'''จากบทที่แล้ว เราหา**พื้นที่ระหว่างกราฟกับแกน $x$** ได้แล้ว

แต่ถ้ามีกราฟ 2 เส้น แล้วเราอยากรู้**พื้นที่ที่ถูกขังอยู่ระหว่างมัน**ล่ะ? 🤔''',
          ],
        }),
        ContentBlock("ab_img_003", "image", {
          "path": "assets/area_between_intro.png",
        }),
        ContentBlock("ab_t_004", "text", {
          "content": [
            r'''ลองนึกภาพแบบนี้ — ถ้ามีกราฟ $f(x)$ อยู่ข้างบน และ $g(x)$ อยู่ข้างล่าง

พื้นที่แรเงาระหว่างมัน = **พื้นที่ใต้กราฟบน ลบ พื้นที่ใต้กราฟล่าง**''',
          ],
        }),
        ContentBlock("ab_h_005", "header", {
          "title": r"ลองดูตัวอย่างง่ายๆ",
          "level": 2,
        }),
        ContentBlock("ab_t_006", "text", {
          "content": [
            r'''$f(x) = 4$ (เส้นตรง) และ $g(x) = x^2$ (พาราโบลา) จาก $x = 0$ ถึง $x = 2$

ในช่วงนี้ $f(x)$ อยู่เหนือ $g(x)$ ตลอด''',
          ],
        }),
        ContentBlock("ab_img_007", "image", {
          "path": "assets/area_between_simple.png",
        }),
        ContentBlock("ab_ddq_008", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ab_ddq_008_s1",
              "content": [
                r'''พื้นที่ใต้กราฟ $f(x) = 4$ จาก $x=0$ ถึง $x=2$ คือ ''',
                {"drop": "0"},
                r'''พื้นที่ใต้กราฟ $g(x) = x^2$ จาก $x=0$ ถึง $x=2$ คือ ''',
                {"drop": "1"},
                r'''ดังนั้น พื้นที่ระหว่าง 2 กราฟ $=$ ''',
                {"drop": "2"},
              ],
              "draggableItems": [
                r"$\int_0^2 4\,dx = 8$",
                r"$\int_0^2 x^2\,dx = \dfrac{8}{3}$",
                r"$8 - \dfrac{8}{3} = \dfrac{16}{3}$",
                r"$8 + \dfrac{8}{3}$",
              ],
              "correctAnswers": {
                "0": r"$\int_0^2 4\,dx = 8$",
                "1": r"$\int_0^2 x^2\,dx = \dfrac{8}{3}$",
                "2": r"$8 - \dfrac{8}{3} = \dfrac{16}{3}$",
              },
              "explanation": r'''เอาพื้นที่ใต้กราฟบน $-$ พื้นที่ใต้กราฟล่าง → $\dfrac{16}{3}$ 💚''',
            },
          ],
        }),
        ContentBlock("ab_h_009", "header", {
          "title": r"รวมเป็นปริพันธ์เดียว",
          "level": 2,
        }),
        ContentBlock("ab_t_010", "text", {
          "content": [
            r'''แทนที่จะหาแยกแล้วลบ เราเขียนรวมได้เลย:

$$\int_0^2 4\,dx - \int_0^2 x^2\,dx = \int_0^2 (4 - x^2)\,dx$$

**กราฟบน ลบ กราฟล่าง** แล้วอินทิเกรตทีเดียว — สะดวกกว่า!''',
          ],
        }),
        ContentBlock("ab_t_011", "text", {
          "content": [
            r'''Note = หลักคิดง่ายๆ

พื้นที่ระหว่าง 2 กราฟ $= \int_a^b [\text{กราฟบน} - \text{กราฟล่าง}]\,dx$

คิดเหมือน "ความสูง" ของแถบบางๆ ในแต่ละจุด $x$ คือระยะห่างของ 2 กราฟ''',
          ],
        }),
        ContentBlock("ab_q_012", "question_choice", {
          "content": [
            r'''1. พื้นที่ระหว่าง $f(x) = 6$ กับ $g(x) = 2x$ จาก $x = 0$ ถึง $x = 2$ เท่ากับเท่าไร?

Note = คำใบ้: ลองแทน $x = 1$ ดูว่าฟังก์ชันไหนอยู่เหนือกว่า''',
          ],
          "options": [
            r"$8$",
            r"$4$",
            r"$10$",
            r"$12$",
          ],
          "correct": r"$8$",
          "explanation": r'''$f(1)=6 > g(1)=2$ → $f(x)$ อยู่เหนือ

$\int_0^2 (6 - 2x)\,dx = [6x - x^2]_0^2 = 12 - 4 = 8$ 💚''',
        }),
        ContentBlock("ab_q_013", "question_choice", {
          "content": [
            r'''2. พื้นที่ระหว่าง $f(x) = x^2 + 1$ กับ $g(x) = 1$ จาก $x = -1$ ถึง $x = 1$ เท่ากับเท่าไร?''',
          ],
          "options": [
            r"$\dfrac{2}{3}$",
            r"$\dfrac{4}{3}$",
            r"$2$",
            r"$0$",
          ],
          "correct": r"$\dfrac{2}{3}$",
          "explanation": r'''$f(x) - g(x) = x^2 + 1 - 1 = x^2$

$\int_{-1}^1 x^2\,dx = \left[\dfrac{x^3}{3}\right]_{-1}^1 = \dfrac{1}{3} + \dfrac{1}{3} = \dfrac{2}{3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 2: แนวคิดหลัก — ฟังก์ชันไหนอยู่บน?
    // =============================================
    ContentSection(
      headerL1: r"💡 แนวคิดหลัก — ใครอยู่บน?",
      blocks: [
        ContentBlock("ab_h_014", "header", {
          "title": r"ปัญหาคือ — เราไม่รู้ว่าใครอยู่บน!",
          "level": 2,
        }),
        ContentBlock("ab_t_015", "text", {
          "content": [
            r'''ถ้าโจทย์มีรูปให้ เราเห็นเลยว่ากราฟไหนอยู่เหนือ

แต่ส่วนใหญ่โจทย์จะให้แค่สมการ ไม่มีรูป — เราต้อง**หาเอง**ว่าใครอยู่บน!''',
          ],
        }),
        ContentBlock("ab_t_016", "text", {
          "content": [
            r'''แนวคิดเหมือนบทพื้นที่ปิดล้อมเลย — เราต้องรู้ว่า**สถานการณ์เปลี่ยนตรงไหน**

ตอนนั้น: สถานการณ์เปลี่ยน = กราฟข้ามแกน $x$ → แก้ $f(x) = 0$

ตอนนี้: สถานการณ์เปลี่ยน = **2 กราฟสลับกัน** → แก้ $f(x) = g(x)$''',
          ],
        }),
        ContentBlock("ab_t_017", "text", {
          "content": [
            r'''Note = แนวคิดเดียวกัน ใช้ซ้ำได้!

บทก่อน: หาจุดตัดแกน $x$ → แบ่งช่วง → ค่าสัมบูรณ์แต่ละช่วง

บทนี้: หาจุดตัด 2 กราฟ → แบ่งช่วง → ค่าสัมบูรณ์แต่ละช่วง''',
          ],
        }),
        ContentBlock("ab_h_018", "header", {
          "title": r"วิธีเช็คว่าใครอยู่บน",
          "level": 2,
        }),
        ContentBlock("ab_t_019", "text", {
          "content": [
            r'''พอแบ่งช่วงได้แล้ว ในแต่ละช่วง**กราฟไม่สลับกัน** (เพราะถ้าสลับจะต้องตัดกัน ซึ่งเราแบ่งไว้แล้ว)

ดังนั้นแค่**แทนค่า $x$ กลางช่วง**สักจุด แล้วดูว่า $f(x) > g(x)$ หรือ $f(x) < g(x)$ ก็รู้แล้ว!''',
          ],
        }),
        ContentBlock("ab_t_020", "text", {
          "content": [
            r'''หรือจะข้ามขั้นตอนเช็คไปเลยก็ได้ — ใช้**ค่าสัมบูรณ์**ครอบ:

$$\text{พื้นที่} = \left|\int_a^b [f(x) - g(x)]\,dx\right|$$

ถ้าลบผิดฝั่ง ก็แค่ติดลบ → ค่าสัมบูรณ์ช่วยให้ได้บวกเสมอ''',
          ],
        }),
        ContentBlock("ab_h_021", "header", {
          "title": r"สูตรรวม",
          "level": 2,
        }),
        ContentBlock("ab_t_022", "text", {
          "content": [
            r'''ถ้า 2 กราฟตัดกันที่ $x_1, x_2, \ldots, x_n$ พื้นที่ปิดล้อมทั้งหมดคือ:

$$\left|\int_{x_1}^{x_2} [f(x)-g(x)]\,dx\right| + \left|\int_{x_2}^{x_3} [f(x)-g(x)]\,dx\right| + \cdots$$

แยกช่วงตรงจุดตัด แล้วค่าสัมบูรณ์แต่ละช่วง — แค่นั้นเลย!''',
          ],
        }),
        ContentBlock("ab_t_023", "text", {
          "content": [
            r'''Note = ถ้าโจทย์กำหนดช่วง $[a, b]$ ด้วย

ต้องรวมขอบเขต $a$ และ $b$ เข้าไปในจุดแบ่งด้วย

เช่น จุดตัดคือ $x = 1, 3$ แต่โจทย์ถามจาก $x = 0$ ถึง $x = 4$ → จุดแบ่งคือ $0, 1, 3, 4$''',
          ],
        }),
        ContentBlock("ab_ddq_024", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ab_ddq_024_s1",
              "content": [
                r'''กราฟ $f(x)$ และ $g(x)$ ตัดกันที่ $x = -1$ และ $x = 2$

ในช่วง $[-1, 2]$ ถ้าแทน $x = 0$ ได้ $f(0) = 3$ และ $g(0) = 1$

แปลว่าในช่วงนี้ ''',
                {"drop": "0"},
                r''' อยู่เหนือกว่า

ดังนั้นพื้นที่ $= \int_{-1}^2$ ''',
                {"drop": "1"},
                r''' $dx$''',
              ],
              "draggableItems": [
                r"$f(x)$",
                r"$g(x)$",
                r"$[f(x) - g(x)]$",
                r"$[g(x) - f(x)]$",
              ],
              "correctAnswers": {
                "0": r"$f(x)$",
                "1": r"$[f(x) - g(x)]$",
              },
              "explanation": r'''$f(0) > g(0)$ → $f(x)$ อยู่เหนือ → ใช้ $f(x) - g(x)$ (บน $-$ ล่าง) 💚''',
            },
          ],
        }),
        ContentBlock("ab_q_025", "question_choice", {
          "content": [
            r'''1. $f(x) = x^2$ และ $g(x) = 2x$ ตัดกันที่ $x = 0$ และ $x = 2$

ในช่วง $(0, 2)$ ฟังก์ชันไหนอยู่เหนือกว่า?''',
          ],
          "options": [
            r"$g(x) = 2x$ อยู่เหนือกว่า",
            r"$f(x) = x^2$ อยู่เหนือกว่า",
            r"เท่ากันตลอด",
            r"สลับกัน",
          ],
          "correct": r"$g(x) = 2x$ อยู่เหนือกว่า",
          "explanation": r'''แทน $x = 1$: $f(1) = 1$ , $g(1) = 2$ → $g(x) > f(x)$ ในช่วง $(0, 2)$ 💚''',
        }),
        ContentBlock("ab_q_026", "question_choice", {
          "content": [
            r'''2. $f(x) = x + 2$ และ $g(x) = x^2$ ตัดกันที่ $x = -1$ และ $x = 2$

พื้นที่ปิดล้อมระหว่าง 2 กราฟเท่ากับเท่าไร?

Note = คำใบ้: แทน $x = 0$ เช็คว่าใครอยู่บน แล้วหาปริพันธ์ (บน $-$ ล่าง)''',
          ],
          "options": [
            r"$\dfrac{9}{2}$",
            r"$\dfrac{7}{2}$",
            r"$3$",
            r"$\dfrac{11}{2}$",
          ],
          "correct": r"$\dfrac{9}{2}$",
          "explanation": r'''$f(0) = 2 > g(0) = 0$ → $f(x)$ อยู่เหนือ

$\int_{-1}^2 (x+2-x^2)\,dx = \left[\dfrac{x^2}{2}+2x-\dfrac{x^3}{3}\right]_{-1}^2$

$= (2+4-\dfrac{8}{3}) - (\dfrac{1}{2}-2+\dfrac{1}{3}) = \dfrac{10}{3} - (-\dfrac{7}{6}) = \dfrac{9}{2}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 3: ฝึกแบบกราฟไม่สลับกัน
    // =============================================
    ContentSection(
      headerL1: r"🎯 ฝึก — กราฟไม่สลับกัน",
      blocks: [
        ContentBlock("ab_t_027", "text", {
          "content": [
            r'''ในส่วนนี้ 2 กราฟจะไม่สลับกัน — ฟังก์ชันตัวเดียวอยู่เหนือตลอดช่วง

ดังนั้น หาจุดตัด → เช็คว่าใครบน → หาปริพันธ์ทีเดียวจบ!''',
          ],
        }),
        ContentBlock("ab_ddq_028", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ab_ddq_028_s1",
              "content": [
                r'''จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 6 - x^2$ กับ $g(x) = x$

หาจุดตัด: $6 - x^2 = x$ → $x^2 + x - 6 = 0$ → $(x+3)(x-2) = 0$

จุดตัด: $x = $ ''',
                {"drop": "0"},
                r''' และ $x = $ ''',
                {"drop": "1"},
                r'''แทน $x = 0$: $f(0) = 6$ , $g(0) = 0$ → ''',
                {"drop": "2"},
                r''' อยู่เหนือ''',
              ],
              "draggableItems": [
                r"$-3$",
                r"$-2$",
                r"$2$",
                r"$3$",
                r"$f(x)$",
                r"$g(x)$",
              ],
              "correctAnswers": {
                "0": r"$-3$",
                "1": r"$2$",
                "2": r"$f(x)$",
              },
              "explanation": r'''$(x+3)(x-2) = 0$ → $x = -3, 2$ และ $f(0) > g(0)$ → $f(x)$ อยู่เหนือ ✅''',
            },
            {
              "questionId": "ab_ddq_028_s2",
              "content": [
                r'''พื้นที่ $= \int_{-3}^2 [(6-x^2) - x]\,dx = \int_{-3}^2 (6 - x - x^2)\,dx$

$= \left[6x - \dfrac{x^2}{2} - \dfrac{x^3}{3}\right]_{-3}^2$

$= (12 - 2 - \dfrac{8}{3}) - (-18 - \dfrac{9}{2} + 9)$

$= \dfrac{22}{3} - (-\dfrac{27}{2} + 9)$

พื้นที่ $= $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [
                r"$\dfrac{125}{6}$",
                r"$\dfrac{127}{6}$",
                r"$\dfrac{100}{6}$",
                r"$20$",
              ],
              "correctAnswers": {"0": r"$\dfrac{125}{6}$"},
              "explanation": r'''$\dfrac{22}{3} + \dfrac{9}{2} = \dfrac{44}{6} + \dfrac{27}{6} + \dfrac{54}{6} = \dfrac{125}{6}$ 💚''',
            },
          ],
        }),
        ContentBlock("ab_q_029", "question_choice", {
          "content": [
            r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x$ กับ $g(x) = x^2$''',
          ],
          "options": [
            r"$\dfrac{1}{6}$",
            r"$\dfrac{1}{3}$",
            r"$\dfrac{1}{2}$",
            r"$\dfrac{1}{4}$",
          ],
          "correct": r"$\dfrac{1}{6}$",
          "explanation": r'''จุดตัด: $x = x^2$ → $x(x-1)=0$ → $x = 0, 1$

แทน $x = 0.5$: $f = 0.5 > g = 0.25$ → $f$ อยู่เหนือ

$\int_0^1 (x-x^2)\,dx = [\dfrac{x^2}{2}-\dfrac{x^3}{3}]_0^1 = \dfrac{1}{2}-\dfrac{1}{3} = \dfrac{1}{6}$ 💚''',
        }),
        ContentBlock("ab_q_030", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 4$ กับ $g(x) = x^2$ ในช่วง $[-2, 2]$''',
          ],
          "options": [
            r"$\dfrac{32}{3}$",
            r"$\dfrac{16}{3}$",
            r"$8$",
            r"$\dfrac{20}{3}$",
          ],
          "correct": r"$\dfrac{32}{3}$",
          "explanation": r'''แทน $x = 0$: $4 > 0$ → $f$ อยู่เหนือ

$\int_{-2}^2 (4-x^2)\,dx = [4x-\dfrac{x^3}{3}]_{-2}^2 = (8-\dfrac{8}{3})-(-8+\dfrac{8}{3}) = 16 - \dfrac{16}{3} = \dfrac{32}{3}$ 💚''',
        }),
        ContentBlock("ab_q_031", "question_choice", {
          "content": [
            r'''3. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 + 1$ กับ $g(x) = -x + 1$ ในช่วง $[0, 2]$

Note = คำใบ้: 2 กราฟไม่ตัดกันในช่วงนี้ (ลองเช็คดู) เช็คว่าใครอยู่บนก็พอ''',
          ],
          "options": [
            r"$\dfrac{16}{3}$",
            r"$\dfrac{14}{3}$",
            r"$6$",
            r"$\dfrac{20}{3}$",
          ],
          "correct": r"$\dfrac{14}{3}$",
          "explanation": r'''$f(x)-g(x) = x^2+1-(-x+1) = x^2+x$

แทน $x = 1$: $f = 2 > g = 0$ → $f$ อยู่เหนือ

$\int_0^2 (x^2+x)\,dx = [\dfrac{x^3}{3}+\dfrac{x^2}{2}]_0^2 = \dfrac{8}{3}+2 = \dfrac{14}{3}$ 💚''',
        }),
        ContentBlock("ab_q_032", "question_choice", {
          "content": [
            r'''4. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = 2x$ กับ $g(x) = x^2 - 4x$''',
          ],
          "options": [
            r"$36$",
            r"$18$",
            r"$24$",
            r"$30$",
          ],
          "correct": r"$36$",
          "explanation": r'''จุดตัด: $2x = x^2-4x$ → $x^2-6x = 0$ → $x(x-6) = 0$ → $x = 0, 6$

แทน $x = 1$: $f = 2 > g = -3$ → $f$ อยู่เหนือ

$\int_0^6 (2x-x^2+4x)\,dx = \int_0^6 (6x-x^2)\,dx = [3x^2-\dfrac{x^3}{3}]_0^6 = 108-72 = 36$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 4: เมื่อกราฟสลับบน-ล่าง
    // =============================================
    ContentSection(
      headerL1: r"🔀 เมื่อกราฟสลับบน-ล่าง",
      blocks: [
        ContentBlock("ab_h_033", "header", {
          "title": r"กราฟสลับกัน — ต้องแบ่งช่วง",
          "level": 2,
        }),
        ContentBlock("ab_t_034", "text", {
          "content": [
            r'''ถ้า 2 กราฟตัดกันหลายจุด บางช่วง $f(x)$ อยู่บน บางช่วง $g(x)$ อยู่บน

ถ้าหาปริพันธ์ $\int_a^b [f(x)-g(x)]\,dx$ ทีเดียว ส่วนที่ $g$ อยู่บนจะให้ค่าลบ → **หักล้าง**กัน!''',
          ],
        }),
        ContentBlock("ab_t_035", "text", {
          "content": [
            r'''แนวคิดเดิมเลย — เหมือนตอนกราฟข้ามแกน $x$ ในบทก่อน:

🔸 หาจุดตัดของ 2 กราฟ → $f(x) = g(x)$

🔸 แบ่งช่วง แล้วหาปริพันธ์แต่ละช่วงแยกกัน

🔸 เอา**ค่าสัมบูรณ์**แต่ละช่วนมาบวกกัน''',
          ],
        }),
        ContentBlock("ab_h_036", "header", {
          "title": r"ตัวอย่าง",
          "level": 2,
        }),
        ContentBlock("ab_t_037", "text", {
          "content": [
            r'''จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3$ กับ $g(x) = x$ จาก $x = -1$ ถึง $x = 1$''',
          ],
        }),
        ContentBlock("ab_ddq_038", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ab_ddq_038_s1",
              "content": [
                r'''จุดตัด: $x^3 = x$ → $x^3 - x = 0$ → $x(x^2-1) = 0$ → $x(x-1)(x+1) = 0$

$x = -1, 0, 1$ → แบ่งเป็น 2 ช่วง: $[-1, 0]$ และ $[0, 1]$

แทน $x = -0.5$: $f = -0.125$ , $g = -0.5$ → $f > g$ → ช่วง $[-1, 0]$: ''',
                {"drop": "0"},
                r''' อยู่เหนือ

แทน $x = 0.5$: $f = 0.125$ , $g = 0.5$ → $g > f$ → ช่วง $[0, 1]$: ''',
                {"drop": "1"},
                r''' อยู่เหนือ''',
              ],
              "draggableItems": [r"$f(x) = x^3$", r"$g(x) = x$"],
              "correctAnswers": {
                "0": r"$f(x) = x^3$",
                "1": r"$g(x) = x$",
              },
              "explanation": r'''แทนค่ากลางช่วงเพื่อเช็ค — กราฟสลับกันตรงจุด $x = 0$ ✅''',
            },
            {
              "questionId": "ab_ddq_038_s2",
              "content": [
                r'''ช่วง $[-1, 0]$: $f$ อยู่เหนือ → $\int_{-1}^0 (x^3-x)\,dx = [\dfrac{x^4}{4}-\dfrac{x^2}{2}]_{-1}^0 = 0 - (\dfrac{1}{4}-\dfrac{1}{2}) = \dfrac{1}{4}$

ช่วง $[0, 1]$: $g$ อยู่เหนือ → $\int_0^1 (x-x^3)\,dx = [\dfrac{x^2}{2}-\dfrac{x^4}{4}]_0^1 = \dfrac{1}{2}-\dfrac{1}{4} = \dfrac{1}{4}$

พื้นที่ปิดล้อม $= \dfrac{1}{4} + \dfrac{1}{4} = $ ''',
                {"drop": "0"},
              ],
              "draggableItems": [r"$\dfrac{1}{2}$", r"$\dfrac{1}{4}$", r"$1$", r"$0$"],
              "correctAnswers": {"0": r"$\dfrac{1}{2}$"},
              "explanation": r'''แยกช่วง แล้วรวม → $\dfrac{1}{2}$ ตร.หน่วย 💚''',
            },
          ],
        }),
        ContentBlock("ab_t_039", "text", {
          "content": [
            r'''Note = ลองเช็ค — ถ้าไม่แบ่งช่วง

$\int_{-1}^1 (x^3-x)\,dx = [\dfrac{x^4}{4}-\dfrac{x^2}{2}]_{-1}^1 = 0 - 0 = 0$

หักล้างกันหมด! แต่พื้นที่จริง $= \dfrac{1}{2}$ ≠ $0$ — ต้องแบ่งช่วงเสมอเมื่อกราฟสลับกัน''',
          ],
        }),
        ContentBlock("ab_q_040", "question_choice", {
          "content": [
            r'''1. $f(x) = x^2$ กับ $g(x) = x$ ตัดกันที่ $x = 0, 1$

ถ้าโจทย์ถามพื้นที่จาก $x = -1$ ถึง $x = 1$ ต้องแบ่งเป็นกี่ช่วง?

Note = คำใบ้: จุดที่ 2 กราฟตัดกัน + ขอบเขตที่โจทย์ให้ → จุดแบ่งคือ $-1, 0, 1$''',
          ],
          "options": [r"$2$ ช่วง", r"$1$ ช่วง", r"$3$ ช่วง", r"$4$ ช่วง"],
          "correct": r"$2$ ช่วง",
          "explanation": r'''จุดแบ่ง: $-1, 0, 1$ → ช่วง $[-1, 0]$ กับ $[0, 1]$ = 2 ช่วง 💚''',
        }),
        ContentBlock("ab_q_041", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2$ กับ $g(x) = x$ จาก $x = -1$ ถึง $x = 1$

Note = คำใบ้: ช่วง $[-1,0]$: แทน $x=-0.5$ → $f = 0.25 > g = -0.5$

ช่วง $[0,1]$: แทน $x=0.5$ → $g = 0.5 > f = 0.25$''',
          ],
          "options": [
            r"$1$",
            r"$\dfrac{5}{6}$",
            r"$\dfrac{2}{3}$",
            r"$\dfrac{1}{2}$",
          ],
          "correct": r"$1$",
          "explanation": r'''ช่วง $[-1,0]$: $\int_{-1}^0 (x^2-x)\,dx = [\dfrac{x^3}{3}-\dfrac{x^2}{2}]_{-1}^0 = 0-(-\dfrac{1}{3}-\dfrac{1}{2}) = \dfrac{5}{6}$

ช่วง $[0,1]$: $\int_0^1 (x-x^2)\,dx = \dfrac{1}{2}-\dfrac{1}{3} = \dfrac{1}{6}$

พื้นที่ปิดล้อม $= \dfrac{5}{6} + \dfrac{1}{6} = 1$ 💚''',
        }),
        ContentBlock("ab_q_042", "question_choice", {
          "content": [
            r'''3. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3 - x$ กับ $g(x) = 0$ (แกน $x$) จาก $x = -1$ ถึง $x = 1$

Note = คำใบ้: นี่คือพื้นที่ปิดล้อมกราฟ $f(x)$ กับแกน $x$ → $g(x) = 0$ ก็เป็น "กราฟ" เส้นหนึ่ง!''',
          ],
          "options": [
            r"$\dfrac{1}{2}$",
            r"$0$",
            r"$\dfrac{1}{4}$",
            r"$1$",
          ],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''จุดตัด: $x^3 - x = 0$ → $x = -1, 0, 1$

ช่วง $[-1,0]$: $\int_{-1}^0 (x^3-x)\,dx = \dfrac{1}{4}$

ช่วง $[0,1]$: $\int_0^1 (x^3-x)\,dx = -\dfrac{1}{4}$

พื้นที่ $= \dfrac{1}{4} + \dfrac{1}{4} = \dfrac{1}{2}$ — เหมือนกันเลย! เพราะ "พื้นที่กับแกน $x$" ก็คือพื้นที่ระหว่าง 2 กราฟ โดย $g(x)=0$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 5: แบบฝึกหัดรวม
    // =============================================
    ContentSection(
      headerL1: r"📝 แบบฝึกหัดรวม",
      blocks: [
        ContentBlock("ab_t_043", "text", {
          "content": [
            r'''โจทย์ในส่วนนี้ผสมทุกรูปแบบ — ทั้งแบบไม่สลับ แบบสลับ และแบบมีช่วงกำหนด ลองทำดู! 💪''',
          ],
        }),
        ContentBlock("ab_q_044", "question_choice", {
          "content": [
            r'''1. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2$ กับ $g(x) = 4$''',
          ],
          "options": [
            r"$\dfrac{32}{3}$",
            r"$\dfrac{16}{3}$",
            r"$8$",
            r"$\dfrac{64}{3}$",
          ],
          "correct": r"$\dfrac{32}{3}$",
          "explanation": r'''จุดตัด: $x^2 = 4$ → $x = \pm 2$

แทน $x = 0$: $g = 4 > f = 0$ → $g$ อยู่เหนือ

$\int_{-2}^2 (4-x^2)\,dx = [4x-\dfrac{x^3}{3}]_{-2}^2 = \dfrac{16}{3}+\dfrac{16}{3} = \dfrac{32}{3}$ 💚''',
        }),
        ContentBlock("ab_q_045", "question_choice", {
          "content": [
            r'''2. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 + 1$ กับ $g(x) = 2x + 1$''',
          ],
          "options": [
            r"$\dfrac{4}{3}$",
            r"$\dfrac{8}{3}$",
            r"$\dfrac{2}{3}$",
            r"$4$",
          ],
          "correct": r"$\dfrac{4}{3}$",
          "explanation": r'''จุดตัด: $x^2+1 = 2x+1$ → $x^2-2x = 0$ → $x(x-2) = 0$ → $x = 0, 2$

แทน $x = 1$: $g = 3 > f = 2$ → $g$ อยู่เหนือ

$\int_0^2 (2x+1-x^2-1)\,dx = \int_0^2 (2x-x^2)\,dx = [x^2-\dfrac{x^3}{3}]_0^2 = 4-\dfrac{8}{3} = \dfrac{4}{3}$ 💚''',
        }),
        ContentBlock("ab_q_046", "question_choice", {
          "content": [
            r'''3. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^3$ กับ $g(x) = x$

Note = คำใบ้: $x^3 = x$ → $x^3 - x = 0$ → $x(x-1)(x+1) = 0$ → ตัดกัน 3 จุด กราฟสลับกัน''',
          ],
          "options": [
            r"$\dfrac{1}{2}$",
            r"$\dfrac{1}{4}$",
            r"$1$",
            r"$0$",
          ],
          "correct": r"$\dfrac{1}{2}$",
          "explanation": r'''จุดตัด: $x = -1, 0, 1$

ช่วง $[-1,0]$: $|\int_{-1}^0 (x^3-x)\,dx| = |\dfrac{1}{4}| = \dfrac{1}{4}$

ช่วง $[0,1]$: $|\int_0^1 (x^3-x)\,dx| = |-\dfrac{1}{4}| = \dfrac{1}{4}$

พื้นที่ $= \dfrac{1}{4}+\dfrac{1}{4} = \dfrac{1}{2}$ 💚''',
        }),
        ContentBlock("ab_q_047", "question_choice", {
          "content": [
            r'''4. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = -x^2 + 4x$ กับ $g(x) = x^2$''',
          ],
          "options": [
            r"$\dfrac{8}{3}$",
            r"$\dfrac{16}{3}$",
            r"$4$",
            r"$\dfrac{4}{3}$",
          ],
          "correct": r"$\dfrac{8}{3}$",
          "explanation": r'''จุดตัด: $-x^2+4x = x^2$ → $2x^2-4x = 0$ → $2x(x-2) = 0$ → $x = 0, 2$

แทน $x = 1$: $f = 3 > g = 1$ → $f$ อยู่เหนือ

$\int_0^2 (-x^2+4x-x^2)\,dx = \int_0^2 (-2x^2+4x)\,dx = [-\dfrac{2x^3}{3}+2x^2]_0^2 = -\dfrac{16}{3}+8 = \dfrac{8}{3}$ 💚''',
        }),
        ContentBlock("ab_q_048", "question_choice", {
          "content": [
            r'''5. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 - 2x$ กับ $g(x) = -x^2 + 4$''',
          ],
          "options": [
            r"$9$",
            r"$\dfrac{27}{2}$",
            r"$\dfrac{27}{4}$",
            r"$12$",
          ],
          "correct": r"$9$",
          "explanation": r'''จุดตัด: $x^2-2x = -x^2+4$ → $2x^2-2x-4 = 0$ → $x^2-x-2 = 0$ → $(x-2)(x+1) = 0$

$x = -1, 2$

แทน $x = 0$: $f = 0$ , $g = 4$ → $g$ อยู่เหนือ

$\int_{-1}^2 (-x^2+4-x^2+2x)\,dx = \int_{-1}^2 (-2x^2+2x+4)\,dx$

$= [-\dfrac{2x^3}{3}+x^2+4x]_{-1}^2 = (-\dfrac{16}{3}+4+8)-(\dfrac{2}{3}+1-4) = \dfrac{20}{3}+\dfrac{7}{3} = 9$ 💚''',
        }),
        ContentBlock("ab_fi_049", "question_fill_in", {
          "content": [
            r'''6. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2$ กับ $g(x) = \sqrt{x}$ จาก $x = 0$ ถึง $x = 1$

Note = คำใบ้: แทน $x = 0.5$ เช็คว่าใครบน — $\sqrt{0.5} \approx 0.707$ กับ $0.25$

พื้นที่ $= $ ''',
            {"box": "0"},
          ],
          "correct": "1/3",
          "explanation": r'''แทน $x = 0.5$: $g = 0.707 > f = 0.25$ → $g$ อยู่เหนือ

$\int_0^1 (x^{1/2}-x^2)\,dx = [\dfrac{2x^{3/2}}{3}-\dfrac{x^3}{3}]_0^1 = \dfrac{2}{3}-\dfrac{1}{3} = \dfrac{1}{3}$ 💚''',
        }),
        ContentBlock("ab_fi_050", "question_fill_in", {
          "content": [
            r'''7. จงหาพื้นที่ปิดล้อมระหว่าง $f(x) = x^2 - 4$ กับ $g(x) = -x^2 + 4$

Note = คำใบ้: จุดตัดคือ $x^2-4 = -x^2+4$ → $2x^2 = 8$ → $x = \pm 2$

พื้นที่ $= $ ''',
            {"box": "0"},
          ],
          "correct": "64/3",
          "explanation": r'''แทน $x = 0$: $f = -4$ , $g = 4$ → $g$ อยู่เหนือ

$\int_{-2}^2 (-x^2+4-x^2+4)\,dx = \int_{-2}^2 (-2x^2+8)\,dx$

$= [-\dfrac{2x^3}{3}+8x]_{-2}^2 = (-\dfrac{16}{3}+16)-(\dfrac{16}{3}-16)$

$= -\dfrac{32}{3}+32 = \dfrac{64}{3}$ 💚''',
        }),
      ],
    ),

    // =============================================
    // SECTION 6: สรุป
    // =============================================
    ContentSection(
      headerL1: r"สรุป",
      blocks: [
        ContentBlock("ab_t_051", "text", {
          "content": [
            r'''🎯 **พื้นที่ระหว่าง 2 กราฟ = ปริพันธ์ของ "กราฟบน $-$ กราฟล่าง"**

$$\text{พื้นที่} = \int_a^b [\text{กราฟบน} - \text{กราฟล่าง}]\,dx$$

แนวคิดเดียวกับพื้นที่ปิดล้อมกราฟเดียว — แค่เปลี่ยนจาก "กราฟ $-$ แกน $x$" เป็น "กราฟ $-$ กราฟ"''',
          ],
        }),
        ContentBlock("ab_t_052", "text", {
          "content": [
            r'''**แนวคิดหลัก:**

🔸 หาจุดตัดของ 2 กราฟ → แก้ $f(x) = g(x)$

🔸 ในแต่ละช่วง **แทนค่าเช็ค**ว่าใครอยู่เหนือ หรือใช้ค่าสัมบูรณ์ครอบ

🔸 ถ้ากราฟสลับกัน → แยกช่วง แล้วรวมค่าสัมบูรณ์แต่ละช่วง''',
          ],
        }),
        ContentBlock("ab_t_053", "text", {
          "content": [
            r'''$$\text{พื้นที่ปิดล้อม} = \left|\int_{x_1}^{x_2} [f(x)-g(x)]\,dx\right| + \left|\int_{x_2}^{x_3} [f(x)-g(x)]\,dx\right| + \cdots$$

โดยที่ $x_1, x_2, \ldots$ คือจุดตัดของ 2 กราฟ (รวมขอบเขตที่โจทย์ให้ด้วย)''',
          ],
        }),
        ContentBlock("ab_t_054", "text", {
          "content": [
            r'''Note = ข้อสังเกต

🔸 ถ้ากราฟไม่สลับกัน → หาปริพันธ์ทีเดียวจบ ไม่ต้องแบ่งช่วง

🔸 ถ้ากราฟสลับกัน → ต้องแบ่งช่วงตรงจุดตัด ไม่งั้นหักล้างกัน

🔸 พื้นที่ปิดล้อมกราฟเดียวกับแกน $x$ ก็คือกรณีพิเศษ โดย $g(x) = 0$''',
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
