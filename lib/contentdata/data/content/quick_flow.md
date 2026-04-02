# 🔄 Quick Conversion Flow: Old → New Format

## 📊 ภาพรวมการเปลี่ยนแปลง

```
OLD FORMAT (vector_content.dart)
├── class VectorContent
│   ├── static Map subSubTopics
│   ├── static Map subSubSubTopics
│   └── static Map exerciseSets
└── Nested maps with string keys

              ↓ CONVERT ↓

NEW FORMAT (9_vector_data.dart, 1_set_data.dart)
├── import '../../../ui/content_models.dart'
├── final lesson1 = ContentLesson(...)
├── final lesson2 = ContentLesson(...)
└── Typed objects with ContentSection & ContentBlock
```

---

## 🎯 Main Differences Summary

| Aspect | OLD | NEW |
|--------|-----|-----|
| **Structure** | Nested Maps | Typed Objects |
| **Import** | None | `content_models.dart` |
| **Lessons** | Map entries | Separate variables |
| **Sections** | Level 1 headers in blocks | ContentSection with headerL1 |
| **Block IDs** | Questions only | **ALL blocks** |
| **Text Content** | Single string | **List of strings** |
| **Images** | Embedded in text | **Separate blocks** |
| **Questions** | `correctAnswer` | `correct` |
| **Drag & Drop** | `__BLANK_1__` | `{"drop": "0"}` |
| **Multi-Step** | ❌ Not supported | ✅ **NEW! `steps` array** |

---

## 🚀 5-Step Conversion Process

### Step 1: File Setup (5 min)
```dart
// Add at top of file
import '../../../ui/content_models.dart';

// Remove
class TopicContent { ... }

// Add
final lesson1Name = ContentLesson(...);
```

### Step 2: Convert Lessons (10-15 min per lesson)
```dart
// OLD: Map entry
"Lesson Title": [
  {
    "type": "content",
    "title": "Lesson Title",
    "blocks": [...]
  }
]

// NEW: Variable
final lessonVariable = ContentLesson(
  title: "Lesson Title",
  sections: [...]
)
```

### Step 3: Create Sections (5 min per section)
```dart
// OLD: Level 1 header in blocks
{
  "type": "header",
  "title": "Section Name",
  "level": 1
}

// NEW: ContentSection
ContentSection(
  headerL1: "Section Name",
  blocks: [...]
)
```

### Step 4: Convert Blocks (2-3 min per block)
```dart
// OLD
{
  "type": "text",
  "content": r"Some text"
}

// NEW
ContentBlock("id", "text", {
  "content": ["Some text"]
})
```

### Step 5: Fix Questions (5 min per question)
```dart
// Multiple Choice
// OLD: correctAnswer → NEW: correct
// OLD: content string → NEW: content list

// Drag & Drop
// OLD: __BLANK_1__ → NEW: {"drop": "0"}
// OLD: questionText → NEW: content array
// NEW: Can add "steps" array for multi-step!
```

---

## 🎮 Drag & Drop Conversion (Special Focus)

### Simple Single-Step

**OLD:**
```dart
{
  "type": "drag_and_drop",
  "questionId": "ddq_1",
  "questionText": r"Text __BLANK_1__ more",
  "draggableItems": ["A", "B"],
  "correctAnswers": {"__BLANK_1__": "A"}
}
```

**NEW:**
```dart
ContentBlock("ddq_1", "drag_and_drop", {
  "steps": [
    {
      "questionId": "ddq_1",
      "content": ["Text ", {"drop": "0"}, " more"],
      "draggableItems": ["A", "B"],
      "correctAnswers": {"0": "A"}
    }
  ]
})
```

### Multi-Step (NEW! 🎯)

**OLD:** ❌ ไม่สามารถทำได้ - ต้องแยกเป็นหลายข้อ

**NEW:** ✅ ใช้ `steps` array
```dart
ContentBlock("proof_id", "drag_and_drop", {
  "steps": [
    {
      "questionId": "proof_id_step1",
      "content": ["Step 1: ", {"drop": "0"}],
      "draggableItems": ["A", "B"],
      "correctAnswers": {"0": "A"},
      "explanation": "..."
    },
    {
      "questionId": "proof_id_step2",
      "content": ["Step 2: ", {"drop": "0"}],
      "draggableItems": ["C", "D"],
      "correctAnswers": {"0": "C"},
      "explanation": "..."
    },
    {
      "questionId": "proof_id_step3",
      "content": ["Step 3: ", {"drop": "0"}],
      "draggableItems": ["E", "F"],
      "correctAnswers": {"0": "E"},
      "explanation": "..."
    }
  ]
})
```

---

## ✅ Checklist Template

```
Lesson: _______________

File Setup:
□ Added import statement
□ Removed class wrapper
□ Created lesson variables

Structure:
□ Identified all lessons
□ Created ContentLesson for each
□ Grouped into ContentSections

Content Blocks:
□ Generated unique IDs (prefix_t1, prefix_t2, ...)
□ Converted text to List<String>
□ Extracted images to separate blocks
□ Extracted graphs to separate blocks

Questions:
□ Updated correctAnswer → correct
□ Converted content to lists
□ Updated drag-and-drop format
□ Decided single vs multi-step
□ Removed isMultipleChoice, boxCount

Drag & Drop:
□ Converted __BLANK_N__ → {"drop": "index"}
□ Added "steps" array (recommended)
□ Created unique questionId per step (multi-step)
□ Tested inline content (text + drop + image)

Testing:
□ All content displays
□ Images load
□ Graphs work
□ Questions function
□ Multi-step flow works
```

---

## 🎯 Decision Tree: Single vs Multi-Step

```
Is this a Drag & Drop question?
│
├─ YES → Does it have multiple sequential stages?
│   │
│   ├─ YES → Use Multi-Step
│   │   Examples:
│   │   • Mathematical proofs
│   │   • Step-by-step derivations
│   │   • Sequential processes
│   │   • Progressive problem solving
│   │
│   └─ NO → Use Single-Step
│       Examples:
│       • Simple classification
│       • One-time fill-in
│       • Basic matching
│
└─ NO → Use appropriate question type
    • question_choice
    • question_fill_in
```

---

## 📝 Quick Reference: Field Name Changes

| OLD Field | NEW Field | Notes |
|-----------|-----------|-------|
| `questionId` | Block ID (param 1) | Becomes first parameter |
| `questionText` | `content` | Now a List, not string |
| `correctAnswer` | `correct` | Renamed |
| `isMultipleChoice` | ❌ Removed | Implicit from type |
| `boxCount` | ❌ Removed | Not needed |
| `__BLANK_1__` | `{"drop": "0"}` | New placeholder format |
| `content` (string) | `content` (List) | Now array of strings |
| Level 1 header | `headerL1` | In ContentSection |

---

## 🔥 Common Pitfalls

❌ **Mistake:** Forgetting to wrap single drag-and-drop in `steps` array  
✅ **Fix:** Always use `"steps": [...]` (future-proof)

❌ **Mistake:** Using number indices in drop zones: `{"drop": 0}`  
✅ **Fix:** Use string indices: `{"drop": "0"}`

❌ **Mistake:** Keeping `__BLANK_1__` in correctAnswers  
✅ **Fix:** Change to `"0": "answer"`

❌ **Mistake:** Same questionId for all steps  
✅ **Fix:** Use unique IDs: `step1`, `step2`, `step3`

❌ **Mistake:** Text content as single string  
✅ **Fix:** Wrap in array: `["text"]`

❌ **Mistake:** Leaving images embedded in text  
✅ **Fix:** Extract to separate image blocks

---

## ⏱️ Estimated Time

| Task | Time |
|------|------|
| Small lesson (1-2 sections) | 20-30 min |
| Medium lesson (3-5 sections) | 45-60 min |
| Large lesson (6+ sections) | 1.5-2 hours |
| Complex with multi-step | +15 min per multi-step |

---

## 🎓 Example: Complete Conversion

**Before:**
```dart
class LimitContent {
  static Map<String, List<Map<String, dynamic>>> subSubSubTopics = {
    "Introduction": [
      {
        "type": "content",
        "title": "Limits",
        "blocks": [
          {"type": "header", "title": "Basics", "level": 1},
          {"type": "text", "content": r"Limits describe..."},
          {
            "type": "drag_and_drop",
            "questionId": "ddq_lim_1",
            "questionText": r"lim means __BLANK_1__",
            "draggableItems": ["approaching", "equal"],
            "correctAnswers": {"__BLANK_1__": "approaching"}
          }
        ]
      }
    ]
  };
}
```

**After:**
```dart
import '../../../ui/content_models.dart';

final limitIntroLesson = ContentLesson(
  title: "Limits",
  sections: [
    ContentSection(
      headerL1: "Basics",
      blocks: [
        ContentBlock("lim_t1", "text", {
          "content": ["Limits describe..."]
        }),
        ContentBlock("ddq_lim_1", "drag_and_drop", {
          "steps": [
            {
              "questionId": "ddq_lim_1",
              "content": ["lim means ", {"drop": "0"}],
              "draggableItems": ["approaching", "equal"],
              "correctAnswers": {"0": "approaching"}
            }
          ]
        }),
      ]
    )
  ]
);
```

---

**See `FORMAT_CONVERSION_GUIDE.md` for complete details and more examples!**