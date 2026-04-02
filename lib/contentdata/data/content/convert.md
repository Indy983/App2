# Format Conversion Guide: Old Format → New Format

## Overview
This document details the structural differences between the old content format (used in `vector_content.dart`) and the new format (used in `9_vector_data.dart`, `1_set_data.dart`). This guide is generic and applies to converting any topic (limit, diff, matrix, combi, vector, set, etc.), not just specific subjects.

**NEW IN THIS VERSION:** Added comprehensive coverage of **Multi-Step Drag and Drop Questions**

---

## 1. FILE-LEVEL STRUCTURE

### OLD FORMAT
```dart
class TopicNameContent {
  static Map<String, List<String>> subSubTopics = { ... };
  static Map<String, List<Map<String, dynamic>>> subSubSubTopics = { ... };
  static Map<String, List<Map<String, dynamic>>> exerciseSets = { ... };
  static Map<String, String> quickContentforquestion = { ... };
}
```
- Single class containing all content
- Everything stored in static Map properties
- All content for entire topic in one deeply nested structure
- No imports needed

### NEW FORMAT
```dart
import '../../../ui/content_models.dart';

final lesson1Name = ContentLesson(...);
final lesson2Name = ContentLesson(...);
final lesson3Name = ContentLesson(...);
```
- Import statement for content model classes required at top
- Each lesson is a separate final variable
- Multiple independent lesson objects instead of nested maps
- Flat structure with clear separation

---

## 2. TOPIC HIERARCHY STRUCTURE

### OLD FORMAT
```
subSubTopics (Map<String, List<String>>)
  └── "Main Topic Name": ["Lesson 1", "Lesson 2", "Lesson 3"]

subSubSubTopics (Map<String, List<Map<String, dynamic>>>)
  └── "Lesson 1": [
        {type: "content", title: "...", blocks: [...]},
        {type: "exercise", title: "...", exerciseSets: "..."}
      ]
```
- Two-level map structure
- `subSubTopics` maps topic name to list of lesson titles
- `subSubSubTopics` maps lesson title to list of content/exercise objects
- String-based keys for navigation

### NEW FORMAT
```
final lessonVariable = ContentLesson(
  title: "Lesson Title",
  sections: [...]
)
```
- Direct object instantiation
- Each lesson is independent variable
- No hierarchical maps needed
- Title stored directly in object
- Navigation through variable names, not string keys

---

## 3. CONTENT BLOCK ORGANIZATION

### OLD FORMAT
```dart
{
  "type": "content",
  "title": "Content Title",
  "blocks": [
    {
      "type": "header",
      "title": "Section Header",
      "level": 1
    },
    {
      "type": "text",
      "content": r'''Text content here'''
    },
    {
      "type": "question_choice",
      "questionId": "q_id_1",
      "content": r'''Question text''',
      "options": [...],
      ...
    }
  ]
}
```
- Content wrapped in object with "type", "title", "blocks"
- All blocks in single flat array
- No explicit sectioning within content
- Headers serve as section markers
- Questions mixed with content blocks

### NEW FORMAT
```dart
ContentLesson(
  title: "Lesson Title",
  sections: [
    ContentSection(
      headerL1: "Section Header",
      blocks: [
        ContentBlock("unique_id", "text", {...}),
        ContentBlock("unique_id_2", "question_choice", {...}),
      ]
    ),
    ContentSection(
      headerL1: "Another Section",
      blocks: [...]
    )
  ]
)
```
- No "type: content" wrapper needed
- Explicit ContentSection objects for organization
- Each section has `headerL1` property (replaces level 1 headers)
- ContentBlock requires unique ID as first parameter
- Clear separation between sections

---

## 4. CONTENT BLOCK STRUCTURE

### OLD FORMAT
```dart
{
  "type": "block_type",
  "field1": value1,
  "field2": value2,
  ...
}
```
- Anonymous maps with type field
- All properties at same level
- Type determines which fields are present

### NEW FORMAT
```dart
ContentBlock("unique_block_id", "block_type", {
  "field1": value1,
  "field2": value2,
  ...
})
```
- Constructor with 3 parameters:
  1. Unique ID (string)
  2. Type (string)
  3. Data map (Map<String, dynamic>)
- ID must be unique across entire lesson
- Data map contains all block-specific properties

---

## 5. TEXT CONTENT FORMAT

### OLD FORMAT
```dart
{
  "type": "text",
  "content": r'''
Multi-line text content here
Can include markdown **bold**
And LaTeX $x^2$
'''
}
```
- Single string with raw string literal `r'''...'''`
- All text in one "content" field
- Line breaks preserved within string

### NEW FORMAT
```dart
ContentBlock("block_id", "text", {
  "content": [
    "First line or paragraph",
    "Second line or paragraph",
    r'''Multi-line text
Can still use raw strings
Within array elements'''
  ]
})
```
- "content" is now a List<String>
- Each array element is a separate text segment
- Can mix regular strings and raw strings
- Maintains markdown and LaTeX support within strings

---

## 6. HEADER STRUCTURE

### OLD FORMAT
```dart
// Level 1 header
{
  "type": "header",
  "title": "Main Section Header",
  "level": 1
}

// Level 2 header
{
  "type": "header",
  "title": "Subsection Header",
  "level": 2
}
```
- Headers are blocks within the blocks array
- Level determines hierarchy (1, 2, 3, etc.)
- Level 1 headers often mark major sections

### NEW FORMAT
```dart
// Level 1 header becomes ContentSection
ContentSection(
  headerL1: "Main Section Header",
  blocks: [...]
)

// Level 2 header remains a block
ContentBlock("h_id", "header", {
  "title": "Subsection Header",
  "level": 2
})
```
- **Level 1 headers replaced by ContentSection.headerL1**
- Only level 2+ headers remain as ContentBlocks
- Section organization more explicit
- No "type: header" for level 1

---

## 7. IMAGE REFERENCES

### OLD FORMAT
```dart
{
  "type": "text",
  "content": r'''
Some text before

assets/image_name.png

Some text after
'''
}
```
- Image path as plain text within content
- Embedded in text blocks
- No explicit type designation

### NEW FORMAT
```dart
ContentBlock("img_id", "image", {
  "path": "assets/image_name.png"
})
```
- Separate ContentBlock with type "image"
- Path in dedicated "path" field
- Stands alone, not embedded in text
- Needs unique ID

---

## 8. INTERACTIVE GRAPH REFERENCES

### OLD FORMAT
```dart
{
  "type": "text",
  "content": r'''
Text before graph

lib/screens/shortnotes/math/interactivegraph/folder/file.dart

Text after graph
'''
}
```
- Graph path as text string within content
- No type designation
- Mixed with regular text

### NEW FORMAT
```dart
ContentBlock("graph_id", "interactive_graph", {
  "path": "lib/screens/shortnotes/math/interactivegraph/folder/file.dart"
})
```
- Separate ContentBlock with type "interactive_graph"
- Path in dedicated "path" field
- Explicit type for special handling
- Requires unique ID

---

## 9. MULTIPLE CHOICE QUESTIONS

### OLD FORMAT
```dart
{
  "type": "question_choice",
  "questionId": "q_topic_1",
  "content": r'''Question text here''',
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "correctAnswer": "Option 2",
  "explanation": r'''Explanation text''',
  "isMultipleChoice": true,
  "boxCount": 0
}
```
- Field: `questionId` (camelCase)
- Field: `content` (single string)
- Field: `correctAnswer` (camelCase)
- Field: `isMultipleChoice` (boolean, always true for choices)
- Field: `boxCount` (always 0 for choice questions)

### NEW FORMAT
```dart
ContentBlock("q_topic_1", "question_choice", {
  "content": [
    "Question text here"
  ],
  "options": [
    "Option 1",
    "Option 2",
    "Option 3"
  ],
  "correct": "Option 2",
  "explanation": r'''Explanation text'''
})
```
- ID becomes first parameter (no "questionId" field)
- Field: `content` is now List<String>
- Field: `correct` (renamed from "correctAnswer")
- Field: `explanation` remains same
- Removed: `isMultipleChoice` field (implicit from type)
- Removed: `boxCount` field (not needed)

---

## 10. FILL-IN-THE-BLANK QUESTIONS

### OLD FORMAT
```dart
{
  "type": "question_fill_in",
  "questionId": "q_fill_1",
  "content": r'''Question text with __BLANK__''',
  "answer": "correct answer",
  "explanation": r'''...'''
}
```
- Placeholder: `__BLANK__` in text
- Field: `answer`

### NEW FORMAT
```dart
ContentBlock("q_fill_1", "question_fill_in", {
  "content": [
    "Question text with ",
    {"box": "0"}
  ],
  "correct": "correct answer",
  "explanation": r'''...'''
})
```
- Content as List with mixed strings and box objects
- Box placeholder: `{"box": "index"}` where index is string number
- Field: `correct` (instead of "answer")
- More structured box placement in content array

---

## 11. DRAG-AND-DROP QUESTIONS (★ UPDATED WITH MULTI-STEP)

### OLD FORMAT (Single Question Only)
```dart
{
  "type": "drag_and_drop",
  "questionId": "ddq_topic_1",
  "questionText": r'''Question with __BLANK_1__ in it''',
  "draggableItems": [
    "Item 1",
    "Item 2",
    "Item 3"
  ],
  "correctAnswers": {
    "__BLANK_1__": "Item 2"
  },
  "explanation": r'''...'''
}
```
- Field: `questionText` (single string with `__BLANK_N__` placeholders)
- Blanks: `__BLANK_1__`, `__BLANK_2__`, etc. (with underscores)
- Field: `correctAnswers` (plural, map of blank to answer)
- **Only single-step questions supported**

---

### NEW FORMAT - THREE OPTIONS

#### **Option A: Single Step (Backward Compatible - No `steps` key)**
```dart
ContentBlock("ddq_topic_1", "drag_and_drop", {
  "content": [
    "Question text with ",
    {"drop": "0"},
    " and possibly ",
    {"image": "assets/img.png"},
    " inline"
  ],
  "draggableItems": [
    "Item 1",
    "Item 2",
    "Item 3"
  ],
  "correctAnswers": {
    "0": "Item 2"
  },
  "explanation": r'''...'''
})
```
- No `steps` array - backward compatible format
- Works exactly like old drag-and-drop but with new syntax

#### **Option B: Single Step (New Format with `steps` array - Recommended)**
```dart
ContentBlock("ddq_topic_1", "drag_and_drop", {
  "steps": [
    {
      "questionId": "ddq_topic_1", // Same as parent ID for single step
      "content": [
        "Question text with ",
        {"drop": "0"},
        " inline"
      ],
      "draggableItems": [
        "Item 1",
        "Item 2",
        "Item 3"
      ],
      "correctAnswers": {
        "0": "Item 2"
      },
      "explanation": r'''...'''
    }
  ]
})
```
- Uses `steps` array with single element
- Future-proof format
- Easier to expand to multi-step later

#### **Option C: Multi-Step (NEW! 🎯)**
```dart
ContentBlock("proof_derivative", "drag_and_drop", {
  "steps": [
    {
      "questionId": "proof_derivative_step1",
      "content": [
        "ขั้นที่ 1: เขียน definition ของอนุพันธ์ ",
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
    {
      "questionId": "proof_derivative_step3",
      "content": [
        "ขั้นที่ 3: ใช้ binomial theorem แล้ว simplify",
        r"\lim_{h \to 0} \frac{nx^{n-1}h + ... + h^n}{h} = ",
        {"drop": "0"}
      ],
      "draggableItems": [
        r"nx^{n-1}",
        r"x^n",
        r"(n-1)x^{n-2}"
      ],
      "correctAnswers": {
        "0": r"nx^{n-1}"
      },
      "explanation": "เมื่อ h → 0 เทอมที่มี h กำลังสูงกว่าจะหายไป เหลือแค่ nx^{n-1}"
    }
  ]
})
```

---

### MULTI-STEP DRAG-AND-DROP STRUCTURE

**Key Points:**
1. **`steps` array**: Contains multiple step objects
2. **Each step is independent**: Has its own questionId, content, items, answers
3. **Unique questionId per step**: Format: `{parentId}_step1`, `{parentId}_step2`, etc.
4. **Sequential workflow**: Users complete step 1 → check → step 2 → check → step 3
5. **Independent state**: Each step saves to database separately
6. **Inline content**: Can mix text, drop zones, and images in content array

**Step Object Structure:**
```dart
{
  "questionId": "unique_id_for_this_step",  // Required, must be unique
  "content": [...],                          // Required, List of strings/objects
  "draggableItems": [...],                   // Required, List of strings
  "correctAnswers": {...},                   // Required, Map<String, String>
  "explanation": r"..."                      // Optional, String
}
```

**Content Array Elements:**
- Strings: Regular text or LaTeX
- `{"drop": "index"}`: Drop zone placeholder
- `{"image": "path"}`: Inline image
- `{"graph": "path"}`: Inline interactive graph (if needed)

**Naming Convention for Multi-Step:**
```
Parent ID: "proof_pythagorean"
Step 1 ID: "proof_pythagorean_step1"
Step 2 ID: "proof_pythagorean_step2"
Step 3 ID: "proof_pythagorean_step3"
```

---

### CONVERSION EXAMPLES: Drag-and-Drop

#### Example 1: Simple Single-Step
**OLD:**
```dart
{
  "type": "drag_and_drop",
  "questionId": "ddq_vec_type_1",
  "questionText": r'''2 เวกเตอร์นี้ เป็น __BLANK_1__ กัน''',
  "draggableItems": ["เวกเตอร์ 0", "เวกเตอร์กลับทิศ", "เวกเตอร์ขนาน"],
  "correctAnswers": {
    "__BLANK_1__": "เวกเตอร์ขนาน"
  },
  "explanation": r'''เวกเตอร์ทั้งสองมีทิศทางเดียวกัน'''
}
```

**NEW (Recommended with steps):**
```dart
ContentBlock("ddq_vec_type_1", "drag_and_drop", {
  "steps": [
    {
      "questionId": "ddq_vec_type_1",
      "content": [
        "2 เวกเตอร์นี้ เป็น ",
        {"drop": "0"},
        " กัน"
      ],
      "draggableItems": ["เวกเตอร์ 0", "เวกเตอร์กลับทิศ", "เวกเตอร์ขนาน"],
      "correctAnswers": {
        "0": "เวกเตอร์ขนาน"
      },
      "explanation": r'''เวกเตอร์ทั้งสองมีทิศทางเดียวกัน'''
    }
  ]
})
```

#### Example 2: Multi-Step Proof
**OLD (Not Supported - Would need 3 separate questions):**
```dart
// Step 1
{
  "type": "drag_and_drop",
  "questionId": "pyth_1",
  "questionText": r'''ขั้นที่ 1: พื้นที่รวม = __BLANK_1__''',
  ...
}

// Step 2
{
  "type": "drag_and_drop",
  "questionId": "pyth_2",
  "questionText": r'''ขั้นที่ 2: พื้นที่ = __BLANK_1__''',
  ...
}

// Step 3 - separate question
...
```

**NEW (Multi-Step):**
```dart
ContentBlock("pythagorean_proof", "drag_and_drop", {
  "steps": [
    {
      "questionId": "pyth_step1",
      "content": [
        "วาดสี่เหลี่ยมจัตุรัสด้านละ a+b แล้วใส่สามเหลี่ยมมุมฉาก 4 อัน พื้นที่รวม = ",
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
})
```

---

## 12. EXERCISE SETS

### OLD FORMAT
```dart
static Map<String, List<Map<String, dynamic>>> exerciseSets = {
  "Exercise Set Name": [
    {
      "title": "Set 1",
      "questions": [
        {
          "question": "Question text",
          "type": "fillIn",  // or "choice"
          "answer": "answer",  // or "options" + "answer" for choice
          "explanation": "...",
          "relatedContent": ["Topic Name"]
        }
      ]
    }
  ]
};
```
- Stored in separate static Map
- String key for exercise set name
- Nested structure: Set → Questions array
- Field: `type` (lowercase: "fillIn", "choice")
- Field: `answer` (for both types)
- Field: `relatedContent` (array of strings)

### NEW FORMAT
```
// Exercise sets NOT shown in new format file
// Appears to be handled separately or differently
// May use different structure or file
```
- Exercise sets not included in ContentLesson structure
- Likely separated into different file/system
- **Important**: Need to check project for exercise handling

---

## 13. QUICK CONTENT FOR QUESTIONS

### OLD FORMAT
```dart
static Map<String, String> quickContentforquestion = {
  "Topic Name": r'''
# Header
Content in markdown format
## Subheader
More content
'''
};
```
- Stored in separate static Map
- String key maps to markdown content
- Used for reference/help content

### NEW FORMAT
```
// Not present in new format file
```
- Not included in ContentLesson structure
- May be handled by different system
- **Important**: Determine where this content goes in new system

---

## 14. CONTENT BLOCK ID NAMING CONVENTIONS

### OLD FORMAT
```
No explicit IDs required for most blocks
questionId for questions (e.g., "q_vec_scalar_1", "ddq_vec_type_1")
```

### NEW FORMAT
```
Every ContentBlock requires unique ID:
- Text blocks: "prefix_t1", "prefix_t2", ...
- Headers: "prefix_h1", "prefix_h2", ...
- Images: "prefix_i1", "prefix_i2", ...
- Graphs: "prefix_g1", "prefix_g2", ...
- Questions: Same as old questionId ("q_...", "ddq_...")

Where "prefix" is lesson-specific abbreviation (e.g., "vp" for vector properties)
```
- **All blocks need IDs** (not just questions)
- Use consistent prefixes per lesson
- Suffix with type indicator and number
- Maintains question IDs from old format

---

## 15. VARIABLE AND OBJECT NAMING

### OLD FORMAT
```dart
class VectorContent { ... }
```
- Single class named after topic
- UpperCamelCase class name

### NEW FORMAT
```dart
final vectorPropertiesLesson = ContentLesson(...);
final vectorAddSubtractLesson = ContentLesson(...);
final vectorCrossIntroLesson = ContentLesson(...);
```
- lowerCamelCase variable names
- Descriptive names ending in "Lesson"
- One variable per lesson/section
- Pattern: `{topicName}{LessonName}Lesson`

---

## CONVERSION CHECKLIST

When converting from old to new format:

### 1. File Setup
- [ ] Add import: `import '../../../ui/content_models.dart';`
- [ ] Remove class wrapper
- [ ] Create separate final variables for each lesson

### 2. Lesson Structure
- [ ] Convert each item in subSubSubTopics to separate ContentLesson
- [ ] Set title from old content object
- [ ] Group blocks into logical ContentSections

### 3. Sections
- [ ] Identify level 1 headers → make them ContentSection.headerL1
- [ ] Keep level 2+ headers as ContentBlocks
- [ ] Group related blocks under each section

### 4. Content Blocks
- [ ] Generate unique IDs for all blocks
- [ ] Convert text "content" strings to List<String>
- [ ] Extract image paths to separate image blocks
- [ ] Extract graph paths to separate interactive_graph blocks
- [ ] Update question field names (correctAnswer → correct)

### 5. Drag-and-Drop Questions (★ IMPORTANT)
- [ ] Decide: Single-step or Multi-step?
- [ ] **If Single-step:**
  - [ ] Convert `__BLANK_N__` → `{"drop": "index"}` where index is "0", "1", etc.
  - [ ] Remove `__BLANK_` prefix from correctAnswers keys
  - [ ] Wrap in `steps` array with single element (recommended)
  - [ ] Set `questionId` same as parent block ID
- [ ] **If Multi-step:**
  - [ ] Create `steps` array with multiple elements
  - [ ] Each step needs unique `questionId`: `{parentId}_step1`, `step2`, etc.
  - [ ] Each step has its own content, draggableItems, correctAnswers
  - [ ] Each step can check/retry independently
  - [ ] Add step numbers/titles in content (e.g., "ขั้นที่ 1:", "ขั้นที่ 2:")
- [ ] Convert questionText to content array (List)
- [ ] Support inline images: `{"image": "path"}` in content
- [ ] Ensure drop zone indices match correctAnswers keys

### 6. Other Questions
- [ ] Keep questionIds as block IDs
- [ ] Remove isMultipleChoice and boxCount fields
- [ ] Update correctAnswer → correct
- [ ] Convert content to List<String> format
- [ ] Update fill-in boxes to {"box": "index"} format

### 7. Special Handling
- [ ] Determine new location for exerciseSets
- [ ] Determine new location for quickContentforquestion
- [ ] Verify all asset paths are correct
- [ ] Check all unique IDs are truly unique

### 8. Testing
- [ ] Verify all content displays correctly
- [ ] Test all interactive elements
- [ ] Check question functionality
- [ ] Test multi-step drag-and-drop flow
- [ ] Validate image and graph loading
- [ ] Test check/retry for each step

---

## DECISION FLOW: When to Use Multi-Step Drag-and-Drop

```
Question involves multiple stages/steps?
├─ YES → Use Multi-Step
│   ├─ Proofs (พิสูจน์สูตร)
│   ├─ Step-by-step calculations
│   ├─ Sequential processes
│   └─ Progressive problem solving
│
└─ NO → Use Single-Step
    ├─ Simple classification
    ├─ Single blank fill-in
    └─ One-time matching
```

### Use Multi-Step When:
✅ Content has natural sequential stages  
✅ Each stage builds on previous  
✅ You want users to verify each step before proceeding  
✅ Educational value in showing progression  
✅ Proof or derivation with multiple stages  

### Use Single-Step When:
✅ Simple one-time question  
✅ No clear sequential stages  
✅ Quick classification or matching  
✅ Converting from old format with single question  

---

## EXAMPLE CONVERSION: Complete Lesson

### OLD FORMAT (Simplified)
```dart
class LimitContent {
  static Map<String, List<String>> subSubTopics = {
    "Basic Limits": ["Introduction", "Properties"]
  };
  
  static Map<String, List<Map<String, dynamic>>> subSubSubTopics = {
    "Introduction": [
      {
        "type": "content",
        "title": "What is a Limit?",
        "blocks": [
          {
            "type": "header",
            "title": "Definition",
            "level": 1
          },
          {
            "type": "text",
            "content": r'''A limit describes behavior...'''
          },
          {
            "type": "header",
            "title": "Example",
            "level": 2
          },
          {
            "type": "question_choice",
            "questionId": "q_lim_1",
            "content": r'''What is the limit?''',
            "options": ["0", "1", "∞"],
            "correctAnswer": "1",
            "explanation": r'''...''',
            "isMultipleChoice": true,
            "boxCount": 0
          },
          {
            "type": "drag_and_drop",
            "questionId": "ddq_lim_def",
            "questionText": r'''lim as x→a of f(x) means __BLANK_1__''',
            "draggableItems": ["f(a)", "f approaches L", "x = a"],
            "correctAnswers": {
              "__BLANK_1__": "f approaches L"
            },
            "explanation": r'''...'''
          }
        ]
      }
    ]
  };
}
```

### NEW FORMAT (Converted)
```dart
import '../../../ui/content_models.dart';

final limitIntroductionLesson = ContentLesson(
  title: "What is a Limit?",
  sections: [
    ContentSection(
      headerL1: "Definition",
      blocks: [
        ContentBlock("lim_t1", "text", {
          "content": [
            "A limit describes behavior..."
          ]
        }),
        ContentBlock("lim_h1", "header", {
          "title": "Example",
          "level": 2
        }),
        ContentBlock("q_lim_1", "question_choice", {
          "content": [
            "What is the limit?"
          ],
          "options": ["0", "1", "∞"],
          "correct": "1",
          "explanation": r'''...'''
        }),
        ContentBlock("ddq_lim_def", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lim_def",
              "content": [
                "lim as x→a of f(x) means ",
                {"drop": "0"}
              ],
              "draggableItems": ["f(a)", "f approaches L", "x = a"],
              "correctAnswers": {
                "0": "f approaches L"
              },
              "explanation": r'''...'''
            }
          ]
        }),
      ]
    )
  ]
);
```

---

## KEY TAKEAWAYS

1. **From Maps to Objects**: Old format uses nested maps; new format uses typed objects
2. **From Single to Multiple**: Old has one class/file; new has multiple lesson variables
3. **Explicit IDs**: Every block needs unique ID in new format
4. **Section Organization**: Level 1 headers become ContentSection boundaries
5. **List-based Content**: Text content changes from single string to string array
6. **Simplified Fields**: Removed redundant fields (isMultipleChoice, boxCount)
7. **Renamed Fields**: correctAnswer → correct, questionId → block ID
8. **Structured Placeholders**: `__BLANK_N__` → `{"drop": "N"}`, text → `{"box": "N"}`
9. **Separate Asset Blocks**: Images and graphs extracted from text to own blocks
10. **Import Required**: Must import content_models.dart
11. **★ Multi-Step Support**: New format supports multi-step drag-and-drop with `steps` array
12. **★ Sequential Learning**: Multi-step enables progressive problem solving with check-per-step
13. **★ Backward Compatible**: Single-step drag-and-drop works with or without `steps` array
14. **★ Flexible Content**: Can mix text, drop zones, and images in content array

---

## TROUBLESHOOTING

### Common Issues When Converting Drag-and-Drop:

**Issue:** Drop zones not showing  
**Fix:** Ensure `{"drop": "index"}` uses string index ("0", "1"), not number

**Issue:** Multi-step not displaying  
**Fix:** Verify each step has unique questionId and all required fields

**Issue:** Answers not saving  
**Fix:** Check questionId format matches database expectations

**Issue:** Steps showing out of order  
**Fix:** Ensure steps array order is correct (step1, step2, step3)

**Issue:** Draggable items not appearing  
**Fix:** Verify draggableItems is array of strings, not objects

**Issue:** Inline images broken  
**Fix:** Use `{"image": "path"}` in content array, verify path is correct

---

This structure is designed to be more maintainable, type-safe, and easier to navigate than the deeply nested map approach, while now supporting advanced features like multi-step interactive questions.