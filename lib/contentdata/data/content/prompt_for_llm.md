# Prompt สำหรับ Generate เนื้อหา (Compact Format)

---

````
You are an educational content writer for a Thai high school math app. Your task is to generate structured lesson content in compact format based on the topic points provided.

---

## TOPIC POINTS
[ใส่ points ของแต่ละหัวข้อที่นี่]

---

## YOUR TASK

### Step 1 — Plan First
Before writing any content, output a brief plan:
- Lesson title
- VAR name (camelCase Dart variable, e.g. `dotProductLesson`)
- PFX (short 2-4 letter ID prefix, e.g. `dot`)
- List of up to 6 sections, the last one must be "สรุป"
- 1 sentence describing what each section covers

### Step 2 — Generate Compact Content
Generate the full lesson in compact format following all rules below.

---

## WRITING RULES

**Language & Tone**
- Write in Thai
- Use simple, everyday language — avoid math jargon unless necessary
- If a math term must be used, explain it in plain Thai immediately after
- Maximum 2–3 sentences per text block. If more is needed, split into multiple `T` lines
- Never write a wall of text. Prefer short explanations + visuals + interaction
- Do not contradict mathematical correctness

**Structure Rules**
- Total sections: ≤ 6 (including summary)
- Last section must always be "สรุป"
- Each section starts with `==`
- Use `--` to divide subsections within a section
- New concept → explain briefly → show example or graph → then question
- Do not put questions before explaining the concept

**Content Flow per Section**
- Start with the simplest idea, build up gradually
- Use `IG` or `IMG` when a visual would be clearer than text
- Use `DD` (drag and drop) with multiple steps for NEW concepts or multi-step reasoning
- Use `Q` for standard practice problems
- Use `FI` for single-answer numeric problems
- End each non-summary section with at least 1 practice problem

---

## COMPACT FORMAT REFERENCE

### File Header (required once at top)
```
LESSON ชื่อบทเรียน
VAR dartVariableName
PFX xx
```
- `VAR` = Dart variable name (camelCase)
- `PFX` = short prefix for auto-generated IDs (2-4 letters, no spaces)

---

### Text Block
```
T ข้อความบรรทัดที่ 1
T ข้อความบรรทัดที่ 2
```
- Consecutive `T` lines = one text block with multiple items
- LaTeX inline: `$formula$` — LaTeX block: `$$formula$$`
- Prefix with `Note = ` to trigger a callout box: `T Note = สิ่งสำคัญที่ต้องจำ`
- Each `T` = one item in the content array. Split naturally at sentence breaks.

---

### Section Headers
```
== ชื่อ Section    ← L1, required for every section
-- ชื่อ Subsection ← L2, optional, to divide within a section
```

---

### Image & Interactive Graph
```
IMG image_name
IG graph_data_N
```
- `IMG` — name only, no path prefix, no extension (e.g. `IMG matrix_example`)
- `IG` — interactive graphs with sliders; N = sequential number (e.g. `IG graph_data_1`)
- Always add a `T` line after `IG` telling the user what to observe

---

### Question Choice
```
Q
N. question body (multi-line until O line)
IMAGE image_name    ← optional: embed image in question
GRAPH graph_data_N  ← optional: embed graph in question
O option1|option2|option3|option4
A correct option (must exactly match one option)
E explanation line 1
E explanation line 2
IMAGE image_name    ← optional: embed image in explanation
E explanation line 3
```
- Always 4 options unless binary (ได้/ไม่ได้, ใช่/ไม่ใช่)
- `A` must exactly match one of the `O` options
- `E` lines show working steps — not just the answer
- `IMAGE`/`GRAPH` without an `E` prefix inside the explanation block embed a visual there

---

### Fill In (single numeric answer)
```
FI
N. question body [BOX] optional trailing text
IMAGE image_name    ← optional: anywhere in body
GRAPH graph_data_N  ← optional: anywhere in body
A answer
E explanation line 1
IMAGE image_name    ← optional: embed image in explanation
E explanation line 2
```
- `[BOX]` marks where the answer input appears
- `IMAGE`/`GRAPH` without `E` prefix in the explanation block embed a visual there

---

### Drag and Drop
```
DD
content text [0] more text [1]
IMAGE image_name    ← optional: anywhere in content
GRAPH graph_data_N  ← optional: anywhere in content
I draggable1|draggable2|draggable3
A 0=answer_for_0|1=answer_for_1
E explanation line
IMAGE image_name    ← optional: embed image in explanation
>
content for step 2 [0]
I draggable1|draggable2
A 0=correct
E explanation for step 2
```
- `[0]`, `[1]`, `[2]`… mark drop zones in the content
- `I` lists all draggable options (pipe-separated)
- `A` maps each drop index to its correct answer: `0=answer|1=answer`
- `>` separates steps — omit if only one step
- Use multi-step DD for new procedures, proofs, or guided calculations

---

## QUALITY CHECKLIST (apply before outputting)
- [ ] File starts with LESSON / VAR / PFX header
- [ ] ≤ 6 sections, last one is "สรุป"
- [ ] Every section (except "สรุป") has at least 1 practice problem
- [ ] No T block longer than 3 sentences — split into multiple T lines if needed
- [ ] New concepts use DD before Q
- [ ] Every IG has a T line after it describing what to observe
- [ ] "สรุป" recaps key points with T lines only — no new practice problems
- [ ] Content covers ALL points from TOPIC POINTS
- [ ] No mathematical errors

---

## OUTPUT FORMAT

Output in this order:
1. **PLAN** — VAR, PFX, section titles + 1-sentence description each
2. **COMPACT** — complete lesson in a single compact code block
````

---

## วิธีใช้

ใส่ topic points ก่อนส่ง:

```
## TOPIC POINTS
หัวข้อ: การคูณเวกเตอร์แบบ dot product
1. dot product คือ a·b = |a||b|cos θ
2. วิธีคำนวณจากพิกัด: (a₁,a₂)·(b₁,b₂) = a₁b₁ + a₂b₂
3. ถ้า dot product = 0 แปลว่าตั้งฉากกัน
4. ใช้หาค่ามุมระหว่างเวกเตอร์สองตัว
``

---

## ตัวอย่าง Output

**PLAN**
- VAR: `matrixBasicsLesson` / PFX: `mat`
- เมทริกซ์คืออะไร — แนะนำแนวคิดตาราง ตำแหน่ง $a_{ij}$
- การเท่ากันของเมทริกซ์ — เทียบตำแหน่ง ตั้งสมการ
- การบวกลบเมทริกซ์ — ข้อกำหนดขนาด บวกลบทีละตำแหน่ง
- สรุป — ทบทวน 3 แนวคิดหลัก

**COMPACT**
```
LESSON พื้นฐานเมทริกซ์
VAR matrixBasicsLesson
PFX mat

== เมทริกซ์คืออะไร?
T เมทริกซ์คือการเอาตัวเลขมาจัดเรียงเป็นตาราง เหมือนที่นั่งในห้องเรียน 🪑
T ลองนึกภาพห้องเรียน 3 แถว 4 หลัก — แต่ละช่องเก็บตัวเลขหนึ่งตัว

IMG matrix_classroom

T $a_{ij}$ คือตัวเลขในแถวที่ $i$ หลักที่ $j$
T Note = จำง่ายๆ: ตัวเลขแรกคือแถว ตัวหลังคือหลัก

Q
1. จงหา $A_{12}$ ของ $A = \begin{bmatrix} 5 & 6 \\ 3 & 4 \end{bmatrix}$
O 3|4|5|6
A 6
E $a_{12}$ = แถวที่ 1 หลักที่ 2 = **6**

== การเท่ากันของเมทริกซ์
T เมทริกซ์สองตัวเท่ากันก็ต่อเมื่อ **ทุกตำแหน่งมีค่าตรงกัน**
T วิธีคิด: มองตำแหน่งเดียวกัน ตั้งสมการ แล้วแก้หาตัวแปร

DD
ให้ $\begin{bmatrix} x+1 \\ 3 \end{bmatrix} = \begin{bmatrix} 4 \\ 3 \end{bmatrix}$

ตำแหน่ง $(1,1)$: $x + 1 = 4$ ได้ $x = $ [0]
I 1|2|3|4|5
A 0=3
E เทียบตำแหน่งเดียวกัน: $x+1=4 \to x=3$

FI
2. ถ้า $\begin{bmatrix} 2x \\ 1 \end{bmatrix} = \begin{bmatrix} 6 \\ 1 \end{bmatrix}$ แล้ว $x = $ [BOX]
A 3
E $2x = 6 \to x = 3$

== สรุป
T **เมทริกซ์** คือตารางตัวเลข ขนาด $m \times n$ (m แถว n หลัก)
T **การเท่ากัน:** ทุกตำแหน่งต้องมีค่าตรงกัน → ตั้งสมการแก้ตัวแปร
```
LESSON การหาค่าลิมิตจากกราฟ
VAR calcLimitGraphLesson
PFX lim

== 📙 นิยามของลิมิต
-- ลิมิตคืออะไร? 🤔

T ลิมิตคือการดู "แนวโน้ม" ว่าเมื่อเราเข้าใกล้จุดหนึ่งมากๆ ค่าของมัน "ควรจะเป็น" อะไร
T ลิมิตต่างจากการหาค่ากราฟปกติโดย การหาค่ากราฟคือการดูค่า y ณ จุด x นั้นๆ แต่ลิมิตสนใจค่า y เมื่อ x เข้าใกล้ค่านึงมากๆ

-- เล่นก่อนเรียน 🎮

IG limFound1

T เลื่อนจุด 🔹 และ 🔸 ให้เข้าใกล้ $2$ มากที่สุด แล้วดูค่า $y$

DD
เมื่อ $x$ เข้าใกล้ $2$ จากทางซ้าย 🔹
ค่า $y$ หรือเขียนได้อีกแบบคือ $f(x)$ จะเข้าใกล้[0]เมื่อ $x$ เข้าใกล้ $2$ จากทางขวา 🔸
ค่า $y$ หรือ $f(x)$ จะเข้าใกล้[1]ลองสรุปว่าค่า $y$ เมื่อ $x$ เข้าใกล้ $2$ มากๆ จะเข้าใกล้อะไร[2]ซึ่งคือลิมิตเข้าใกล้ $2$ ของกราฟนี้
I $4.99$|$5.01$|$5$|ไม่เป็นทั้ง 3 อย่าง
A 0=$4.99$|1=$5.01$|2=$5$
E ค่าลิมิตของกราฟนี้คือ $5$

-- ที่เล่นไปคือลิมิต! 🎉

T สัญลักษณ์ของลิมิตคือ
T $$\lim\limits_{x \to a} f(x) = L$$
T อ่านว่า "ลิมิตของ $f(x)$ เมื่อ $x$ เข้าใกล้ $a$ เท่ากับ $L$"
T ✅คือ ค่าที่ $f(x)$ กำลังจะไปถึง เมื่อ $x$ เข้าใกล้ $a$
T ❌ไม่ใช่ ค่าของ $f(x)$ ที่จุด $x = a$ ตรงๆ
T ทั้งสองไม่จำเป็นต้องเท่ากัน เดี๋ยวจะเห็นความต่างในข้อที่ $3$

Q
1. จงหา

$$\lim\limits_{x \to 2} x^2 - 2x + 2$$
GRAPH graph_data_4
O 1|2|3|4
A 2
E เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
E         🔹 $(1.99, 1.98)$
E         🔸 $(2.01, 2.02)$
E         เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $2$ เหมือนกัน
E
E         ดังนั้น $\lim\limits_{x \to 2} x^2 - 2x + 2 = 2$
E
E         🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 2$ ตรงๆ จะได้ $f(2) = 2^2 - 2(2) + 2 = 2$ เช่นกัน

Q
2. จงหา

$$\lim\limits_{x \to 1} x^2 + 2x - 3$$
GRAPH graph_data_3
O -1|0|1|2
A 0
E เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง
E 🔹 $(0.99, -0.04)$
E 🔸 $(1.01, 0.04)$
E เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $0$ เหมือนกัน
E
E ดังนั้น $\lim\limits_{x \to 1} x^2 + 2x - 3 = 0$
E
E 🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 1$ ตรงๆ จะได้ $f(1) = 1^2 + 2(1) - 3 = 0$ เช่นกัน

Q
3. จงหา

$$\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$$

จุดสีขาวคือ ที่ $x = 2$ ค่า $y$ ไม่มีคำตอบ เพราะ $f(2) = \dfrac{2^2 - 4}{2 - 2} = \dfrac{0}{0}$
GRAPH graph_data_2
O -1|0|1|4
A 4
E เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
E 🔹 $(1.99, 3.98)$
E 🔸 $(2.01, 4.02)$
E เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน
E
E ดังนั้น $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2} = 4$
E
E 🧠 **ข้อสังเกต:** ถ้าแทนค่า $x = 2$ ตรงๆ จะได้ $f(2) = \dfrac{4 - 4}{2 - 2} = \dfrac{0}{0}$ หาค่าไม่ได้
E
E ข้อนี้แสดงให้เห็นว่า ลิมิตสนแค่ **ค่าที่เข้าใกล้** ไม่ใช่ค่าที่ $x = 2$ หรือคือ $f(2)$ จริงๆ

-- ลิมิตสนใจแค่ค่าเข้าใกล้ ไม่สนใจค่าที่จุดนั้น

T ข้อ 3 คือตัวอย่างที่บอกว่า ลิมิตคือค่าที่เข้าใกล้ ไม่ใช่ค่าที่จุดนั้นตรงๆ
T เพราะ $f(x)$ ที่ $x = 2$ หาค่าไม่ได้
T แต่ลิมิต $\lim\limits_{x \to 2} \dfrac{x^2 - 4}{x - 2}$ กลับมีค่าเท่ากับ $4$ ได้
T สรุปว่า
T $$\lim\limits_{x \to a} f(x) \text{ ไม่จำเป็นต้องเท่ากับ } f(a)$$

== โจทย์เพิ่มเติม
Q
4. จงหา
$$\lim\limits_{x \to 2} \dfrac{x^2 + x - 6}{x - 2}$$
GRAPH graph_data_5
O 1|3|5|7
A 5
E เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
E         🔹 $(1.99, 4.99)$
E         🔸 $(2.01, 5.01)$
E         เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $5$ เหมือนกัน
E
E         ดังนั้น $\lim\limits_{x \to 2} \dfrac{x^2 + x - 6}{x - 2} = 5$
E
E         🧠 **ข้อสังเกต:** แทนค่าหา $f(2)$ จะได้ $f(2) = \dfrac{2^2 + 2 - 6}{2 - 2} = \dfrac{0}{0}$ ซึ่งหาค่าไม่ได้

Q
5. จงหา

$$\lim\limits_{x \to -1} f(x)$$
GRAPH graph_data_6
Note = กราฟนี้คือ?

ฟังก์ชันนี้เรียกว่า **ฟังก์ชันมีเงื่อนไข** (Piecewise Function)

กราฟคือ $y = 5 - x^2$ สำหรับทุก $x$ ยกเว้น $x = -1$ (จุดสีขาว)

แต่ที่ $x = -1$ จะได้ $y = 0$ (จุดสีฟ้า) เขียนเป็นฟังก์ชันได้ว่า

$$f(x) = \begin{cases} 5 - x^2,& x \neq -1 \\ 0, & x = -1 \end{cases}$$
O -2|0|2|4
A 4
E เมื่อ $x$ เข้าใกล้ $-1$ เราดูค่าทั้ง $2$ ฝั่ง
E         🔹 $(-1.01, 3.98)$
E         🔸 $(-0.99, 4.02)$
E         เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน
E
E         ดังนั้น $\lim\limits_{x \to -1} f(x) = 4$
E
E         🧠 **ข้อสังเกต:** ที่ $x = -1$ ดูจากกราฟจะได้ $f(-1) = 0$ จะเห็นว่า $\lim\limits_{x \to -1} f(x) \neq f(-1)$

Q
6. จงหา

$$\lim\limits_{x \to 1} f(x)$$
GRAPH graph_data_7
Note = กราฟนี้คือ?

ฟังก์ชันนี้เป็นฟังก์ชันมีเงื่อนไข แต่เราไม่รู้สมการ
O -2|0|2|5
A 2
E เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง
E         🔹 $(0.99, 2.01)$
E         🔸 $(1.01, 2.00)$
E         เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $2$ เหมือนกัน
E
E         ดังนั้น $\lim\limits_{x \to 1} f(x) = 2$
E
E         🧠 **ข้อสังเกต:** ที่ $x = 1$ ดูจากกราฟจะได้ $f(1) = 5$ จะเห็นว่า $\lim\limits_{x \to 1} f(x) \neq f(1)$

Q
7. จงหา

$$\lim\limits_{x \to -1} f(x)$$
GRAPH graph_data_8
O -2|0|2|4
A 4
E เมื่อ $x$ เข้าใกล้ $-1$ เราดูค่าทั้ง $2$ ฝั่ง
E         🔹 $(-1.01, 4.01)$
E         🔸 $(-0.99, 3.99)$
E         เลื่อนจุดบนกราฟทั้ง $2$ ฝั่งเข้าใกล้ $4$ เหมือนกัน
E
E         ดังนั้น $\lim\limits_{x \to -1} f(x) = 4$
E
E         🧠 **ข้อสังเกต:** ที่ $x = -1$ ดูจากกราฟจะได้ $f(-1) = 4$ จะเห็นว่า $\lim\limits_{x \to -1} f(x) = f(-1)$
E
E         เหตุผลเพราะมันเป็นฟังก์ชันเงื่อนไข แต่จุดที่ทำให้เกิดเงื่อนไขคือ $x = 1$ ไม่ใช่ $x = -1$

DD
8.
IMAGE limprob1
$\lim\limits_{x \to 1} f(x) =$[0]

$f(1) =$[1]

$\lim\limits_{x \to 2} f(x) =$[2]

$f(2) =$[3]
I $1$|$2$|$3$|ไม่มีคำตอบ
A 0=$2$|1=ไม่มีคำตอบ|2=$1$|3=$1$
E ค่าลิมิตของกราฟนี้คือ $5$

DD
9.
IMAGE limprob2
$\lim\limits_{x \to 1} f(x) =$[0]

$f(1) =$[1]

$\lim\limits_{x \to 0} f(x) =$[2]

$f(0) =$[3]
I $1$|$2$|$3$|ไม่มีคำตอบ
A 0=$2$|1=$2$|2=$1$|3=$2$
E ค่าลิมิตของกราฟนี้คือ $5$

== ลิมิตซ้ายและขวา
-- ความหมายง่ายๆ 🎮

T ลิมิตซ้าย คือค่าเข้าใกล้จากทางซ้าย
T             ลิมิตขวา คือค่าเข้าใกล้จากทางขวา

IG graph_data_12

T เลื่อนจุด 🔹 เพื่อเข้าใกล้จากทางซ้าย
T และ 🔸  เพื่อเข้าใกล้จากทางขวา แล้วดูค่า $y$

DD
ค่า $y$ เมื่อ $x$ เข้าใกล้ $1$ จากทางซ้าย 🔹 คือ[0]

ซึ่งคือลิมิตซ้ายค่า $y$ เมื่อ $x$ เข้าใกล้ $1$ จากทางขวา 🔸 คือ[1]

ซึ่งคือลิมิตขวา
I $2$|$1$|$5$|ไม่เป็นทั้ง 3 อย่าง
A 0=$2$|1=$1$
E นี่คือ definition ของอนุพันธ์จากหลักการ first principle
>
สรุปคือ ลิมิตซ้ายซึ่งเขียนเป็นสัญลักษณ์
$\lim\limits_{x \to 1^-} f(x) =$[0]และลิมิตขวาซึ่งเขียนเป็นสัญลักษณ์
$\lim\limits_{x \to 1^+} f(x) =$[1]จะเห็นว่าลิมิตซ้ายไม่เท่ากับขวา

ลองเดาว่าจะสรุปลิมิต $\lim\limits_{x \to 1} f(x)$ ได้ว่า[2]
I $2$|$1$|$5$|หาค่าไม่ได้
A 0=$2$|1=$1$|2=หาค่าไม่ได้
E แทนค่า f(x) = x^n และ f(x+h) = (x+h)^n

-- 💙 ลิมิตซ้าย

T $$\lim\limits_{x \to a^-} f(x)$$
T ในตัวอย่างคือจุด 🔹 ที่เลื่อนเข้าใกล้จากทางซ้าย

-- 🧡 ลิมิตขวา

T $$\lim\limits_{x \to a^+} f(x)$$
T ในตัวอย่างคือจุด 🔸 ที่เลื่อนเข้าใกล้จากทางขวา

-- ลิมิตซ้ายไม่เท่ากับลิมิตขวา

T สรุปได้เลยว่า **หาค่าไม่ได้** เพราะเราไม่รู้จะเลือกค่า $y$ ที่เข้าใกล้จากทางซ้ายหรือขวา

DD
1.
GRAPH graph_data_7
$\lim\limits_{x \to 1^-} f(x) =$[0]

$\lim\limits_{x \to 1^+} f(x) =$[1]

$\lim\limits_{x \to 1} f(x) =$[2]ซึ่งคือลิมิตเข้าใกล้ $2$ ของกราฟนี้
I $2$|$4$|$5$|ไม่มีคำตอบ
A 0=$2$|1=$2$|2=$2$
E ค่าลิมิตของกราฟนี้คือ $2$

DD
2.
GRAPH graph_data_13
$\lim\limits_{x \to 2^-} f(x) = $ [0]$\lim\limits_{x \to 2^+} f(x) = $ [1]$\lim\limits_{x \to 2} f(x) = $[2]$f(2) = $[3]
I $1$|หาค่าไม่ได้|$3$|$4$|$0$
A 0=$3$|1=$4$|2=หาค่าไม่ได้|3=$4$
E เมื่อ $x$ เข้าใกล้ $2$ เราดูค่าทั้ง $2$ ฝั่ง
E
E         🔹 $(1.99, 0.01)$ นั่นคือ $\lim\limits_{x \to 2^-} f(x) = 3$
E
E         🔸 $(2.01, 4.01)$ นั่นคือ $\lim\limits_{x \to 2^+} f(x) = 4$
E
E         เนื่องจากลิมิตซ้ายไม่เท่าลิมิตขวา $\lim\limits_{x \to 2^-} f(x) \neq \lim\limits_{x \to 2^+} f(x)$
E
E         ดังนั้น $\lim\limits_{x \to 2} f(x)$ **หาค่าไม่ได้**

DD
3.
GRAPH graph_data_14
$\lim\limits_{x \to 1^-} f(x) = $ [0]$\lim\limits_{x \to 1^+} f(x) = $ [1]$\lim\limits_{x \to 1} f(x) = $[2]$f(1) = $[3]
I $1$|หาค่าไม่ได้|$3$|$4$|$0$
A 0=$1$|1=$1$|2=$1$|3=$3$
E เมื่อ $x$ เข้าใกล้ $1$ เราดูค่าทั้ง $2$ ฝั่ง
E
E         🔹 $(0.99, 0.99)$ นั่นคือ $\lim\limits_{x \to 1^-} f(x) = 1$
E
E         🔸 $(1.01, 1.01)$ นั่นคือ $\lim\limits_{x \to 1^+} f(x) = 1$
E
E         เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 1^-} f(x) = \lim\limits_{x \to 1^+} f(x)$
E
E         ดังนั้น $\lim\limits_{x \to 1} f(x) = 1$

DD
4.
GRAPH graph_data_15
$\lim\limits_{x \to 0^-} f(x) = $ [0]$\lim\limits_{x \to 0^+} f(x) = $ [1]$\lim\limits_{x \to 0} f(x) = $[2]$f(0) = $[3]
I $1$|หาค่าไม่ได้|$3$|$-1$|$0$
A 0=$3$|1=$-1$|2=หาค่าไม่ได้|3=$3$
E เมื่อ $x$ เข้าใกล้ $0$ เราดูค่าทั้ง $2$ ฝั่ง
E
E         🔹 $(-0.01, 3.01)$ นั่นคือ $\lim\limits_{x \to 0^-} f(x) = 3$
E
E         🔸 $(0.01, -0.99)$ นั่นคือ $\lim\limits_{x \to 0^+} f(x) = - 1$
E
E         เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 0^-} f(x) = \lim\limits_{x \to 0^+} f(x)$
E
E         ดังนั้น $\lim\limits_{x \to 0} f(x) =$ หาค่าไม่ได้

DD
5.
IMAGE limprob3
$\lim\limits_{x \to 1^-} f(x) = $ [0]$\lim\limits_{x \to 1^+} f(x) = $ [1]$\lim\limits_{x \to 1} f(x) = $[2]$f(1) = $[3]
I $1$|หาค่าไม่ได้|$3$|$2$|$0$
A 0=$2$|1=$3$|2=หาค่าไม่ได้|3=หาค่าไม่ได้
E เมื่อ $x$ เข้าใกล้ $0$ เราดูค่าทั้ง $2$ ฝั่ง
E
E         🔹 $(-0.01, 3.01)$ นั่นคือ $\lim\limits_{x \to 0^-} f(x) = 3$
E
E         🔸 $(0.01, -0.99)$ นั่นคือ $\lim\limits_{x \to 0^+} f(x) = - 1$
E
E         เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 0^-} f(x) = \lim\limits_{x \to 0^+} f(x)$
E
E         ดังนั้น $\lim\limits_{x \to 0} f(x) =$ หาค่าไม่ได้

DD
6.
IMAGE limprob4
$\lim\limits_{x \to 0^-} f(x) = $ [0]$\lim\limits_{x \to 0^+} f(x) = $ [1]$\lim\limits_{x \to 0} f(x) = $[2]$f(0) = $[3]
I $1$|หาค่าไม่ได้|$3$|$2$|$0$
A 0=$2$|1=$3$|2=หาค่าไม่ได้|3=$3$
E เมื่อ $x$ เข้าใกล้ $0$ เราดูค่าทั้ง $2$ ฝั่ง
E
E         🔹 $(-0.01, 3.01)$ นั่นคือ $\lim\limits_{x \to 0^-} f(x) = 3$
E
E         🔸 $(0.01, -0.99)$ นั่นคือ $\lim\limits_{x \to 0^+} f(x) = - 1$
E
E         เนื่องจากลิมิตซ้ายเท่าลิมิตขวา $\lim\limits_{x \to 0^-} f(x) = \lim\limits_{x \to 0^+} f(x)$
E
E         ดังนั้น $\lim\limits_{x \to 0} f(x) =$ หาค่าไม่ได้

== แบบฝึกเพิ่มเติม

== สรุป
T เราได้เรียนรู้ทั้งหมด 4 จุดสำคัญ 💪
T         1. **ลิมิต** คือค่าที่ $f(x)$ เข้าใกล้เมื่อ $x$ เข้าใกล้ $a$
T         2. $\lim\limits_{x \to a} f(x)$ **ไม่จำเป็น**ต้องเท่ากับ $f(a)$
T         3. **ลิมิตซ้ายและขวา** ต้องเท่ากัน ลิมิตจึงจะมีค่า
T         4. **ใช้กราฟ** ช่วยมองภาพได้ชัดเจนขึ้น 📊
