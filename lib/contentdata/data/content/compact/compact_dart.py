#!/usr/bin/env python3
"""
compact_dart.py — bidirectional transpiler for ContentLesson

COMPACT FORMAT SPEC
═══════════════════
LESSON  title
VAR     dartVariableName
PFX     idPrefix

== Section Title (L1)
-- Subsection Title (L2)

T  text item (one array element per T line; consecutive T lines → one ContentBlock)
IMG  imageName          (transpiler adds assets/ prefix + .png suffix)
IG   graph_data_N

Q                       ← question_choice block starts here
question body
(multiline OK — all lines until O are the body)
GRAPH  graph_data_N     ← optional, inserts {"graph":...} into content array
IMAGE  imageName        ← optional, inserts {"image":...} into content array
O  opt1|opt2|opt3|opt4
A  correct answer (exact match to one option)
E  explanation line     ← multiple E lines are joined with \n

FI                      ← fill_in block
question body with [BOX] placeholder
A  answer
E  explanation

DD                      ← drag_and_drop block; steps separated by >
content text [0] more text [1]
I  item1|item2|item3
A  0=item1|1=item2
E  explanation
>
next step content [0]
I  x|y|z
A  0=x
E  explanation

NOTES
─────
• [BOX] in FI body → {"box": "0"} in Dart content array
• [N] in DD content → {"drop": "N"} in Dart content array
• IMG name → "assets/name.png"
• All Dart strings output as r''' '''
• IDs are auto-generated: {pfx}_{type}_{counter:03d}
• DD step questionIds: {pfx}_ddq_{counter:03d}_s{step_num}

USAGE
─────
  python compact_dart.py to_dart    input.compact  > output.dart
  python compact_dart.py to_compact input.dart     > output.compact
"""

import re
import sys
from typing import Optional

# ══════════════════════════════════════════════════════════════════════════════
# COMPACT → DART
# ══════════════════════════════════════════════════════════════════════════════

_MULTILINE_BLOCKS = {"Q", "FI", "DD"}
_LINE_TAG_PREFIXES = ("T ", "IMG ", "IG ", "== ", "-- ", "LESSON ", "VAR ", "PFX ")


def _is_block_start(line: str) -> bool:
    s = line.strip()
    return s in _MULTILINE_BLOCKS or any(s.startswith(p) for p in _LINE_TAG_PREFIXES)


def _is_section_start(line: str) -> bool:
    return line.strip().startswith("== ")


def parse_compact(text: str) -> list[dict]:
    """Parse compact format → list of lesson dicts (one per LESSON block)."""
    lines = text.splitlines()
    lessons = []
    meta = {"LESSON": "Untitled", "VAR": "lesson", "PFX": "x"}
    sections = []
    current_section = None
    pending_t: list[str] = []
    i = 0

    def flush_t():
        if pending_t and current_section is not None:
            current_section["blocks"].append({"type": "text", "items": list(pending_t)})
            pending_t.clear()

    def flush_lesson():
        flush_t()
        if sections:
            lessons.append({"meta": dict(meta), "sections": list(sections)})
            sections.clear()

    while i < len(lines):
        raw = lines[i]
        s = raw.strip()

        if not s or s.startswith("#"):
            i += 1
            continue

        # ── Metadata (new LESSON line = start of a new lesson) ────────────────
        if s.startswith("LESSON "):
            flush_lesson()
            current_section = None
            meta["LESSON"] = s[len("LESSON "):].strip()
            i += 1
            continue
        if s.startswith("VAR "):
            meta["VAR"] = s[len("VAR "):].strip()
            i += 1
            continue
        if s.startswith("PFX "):
            meta["PFX"] = s[len("PFX "):].strip()
            i += 1
            continue

        # ── L1 Section ────────────────────────────────────────────────────────
        if s.startswith("== "):
            flush_t()
            current_section = {"title": s[3:].strip(), "blocks": []}
            sections.append(current_section)
            i += 1
            continue

        # Skip lines with no section yet (should only be metadata)
        if current_section is None:
            i += 1
            continue

        # ── L2 Header ─────────────────────────────────────────────────────────
        if s.startswith("-- "):
            flush_t()
            current_section["blocks"].append({"type": "header", "title": s[3:].strip()})
            i += 1
            continue

        # ── Text (consecutive lines accumulate) ───────────────────────────────
        if s.startswith("T "):
            pending_t.append(s[2:])
            i += 1
            continue

        # ── Image ─────────────────────────────────────────────────────────────
        if s.startswith("IMG "):
            flush_t()
            current_section["blocks"].append({"type": "image", "name": s[4:].strip()})
            i += 1
            continue

        # ── Interactive Graph ─────────────────────────────────────────────────
        if s.startswith("IG "):
            flush_t()
            current_section["blocks"].append({"type": "ig", "path": s[3:].strip()})
            i += 1
            continue

        # ── Question Choice ───────────────────────────────────────────────────
        if s == "Q":
            flush_t()
            i += 1
            body_lines, opts, ans = [], [], ""

            while i < len(lines):
                ls = lines[i].strip()
                if ls.startswith("O "):
                    opts = [o.strip() for o in ls[2:].split("|")]
                    i += 1
                    break
                body_lines.append(lines[i])
                i += 1

            # Collect A and explanation parts (E + IMAGE/GRAPH lines)
            ans, exp_parts, i = _collect_a_and_exp(lines, i)

            content_parts = _parse_q_content_lines(body_lines)
            current_section["blocks"].append({
                "type": "question_choice",
                "content_parts": content_parts,
                "opts": opts,
                "ans": ans,
                "exp_parts": exp_parts,
            })
            continue

        # ── Fill In ───────────────────────────────────────────────────────────
        if s == "FI":
            flush_t()
            i += 1
            body_lines = []

            while i < len(lines):
                ls = lines[i].strip()
                if ls.startswith("A "):
                    break
                body_lines.append(lines[i])
                i += 1

            ans, exp_parts, i = _collect_a_and_exp(lines, i)
            body_raw = "\n".join(l.rstrip() for l in body_lines).strip()

            current_section["blocks"].append({
                "type": "fill_in",
                "body": body_raw,
                "ans": ans,
                "exp_parts": exp_parts,
            })
            continue

        # ── Drag and Drop ─────────────────────────────────────────────────────
        if s == "DD":
            flush_t()
            i += 1
            steps = []

            while i < len(lines):
                if _is_block_start(lines[i]) or not lines[i].strip():
                    if not lines[i].strip():
                        i += 1
                        continue
                    break

                content_lines, items, ans_map = [], [], {}

                # Content lines → until I
                while i < len(lines):
                    ls = lines[i].strip()
                    if ls.startswith("I "):
                        items = [x.strip() for x in ls[2:].split("|")]
                        i += 1
                        break
                    if ls == ">" or _is_block_start(lines[i]) or _is_section_start(lines[i]):
                        break
                    content_lines.append(lines[i])
                    i += 1

                # Collect A line (mapping) then explanation parts
                if i < len(lines) and lines[i].strip().startswith("A "):
                    a_line = lines[i].strip()
                    for pair in a_line[2:].split("|"):
                        if "=" in pair:
                            k, v = pair.split("=", 1)
                            ans_map[k.strip()] = v.strip()
                    i += 1

                exp_parts, i = _collect_explanation(lines, i)

                # Optional step terminator '>'
                if i < len(lines) and lines[i].strip() == ">":
                    i += 1

                raw_content = "\n".join(l.rstrip() for l in content_lines).strip()
                if raw_content or items:
                    steps.append({
                        "content": raw_content,
                        "items": items,
                        "ans": ans_map,
                        "exp_parts": exp_parts,
                    })

                if i < len(lines) and (_is_block_start(lines[i]) or _is_section_start(lines[i])):
                    break

            current_section["blocks"].append({"type": "dd", "steps": steps})
            continue

        i += 1

    flush_lesson()
    return lessons


def _parse_q_content_lines(lines: list[str]) -> list:
    """Return ordered list of ('text', str) | ('graph', str) | ('image', str)."""
    parts = []
    text_acc = []

    def flush():
        t = "\n".join(l.strip() for l in text_acc).strip()
        if t:
            parts.append(("text", t))
        text_acc.clear()

    for line in lines:
        ls = line.strip()
        if ls.startswith("GRAPH "):
            flush()
            parts.append(("graph", ls[6:].strip()))
        elif ls.startswith("IMAGE "):
            flush()
            parts.append(("image", ls[6:].strip()))
        else:
            text_acc.append(line)

    flush()
    return parts


def _collect_explanation(lines: list[str], i: int) -> tuple[list, int]:
    """From position i, collect explanation parts: E text + IMAGE/GRAPH markers.
    Returns (parts, new_i). Stops at any non-E/IMAGE/GRAPH line."""
    parts: list = []
    text_acc: list[str] = []

    def flush():
        if text_acc:
            joined = "\n".join(text_acc).strip("\n")
            if joined or any(l for l in text_acc):
                parts.append(("text", joined))
            text_acc.clear()

    while i < len(lines):
        ls = lines[i].strip()
        if ls.startswith("E ") or ls == "E":
            text_acc.append(ls[2:] if ls.startswith("E ") else "")
            i += 1
        elif ls.startswith("IMAGE "):
            flush()
            parts.append(("image", ls[6:].strip()))
            i += 1
        elif ls.startswith("GRAPH "):
            flush()
            parts.append(("graph", ls[6:].strip()))
            i += 1
        else:
            break

    flush()
    return parts, i


def _collect_a_and_exp(lines: list[str], i: int) -> tuple[str, list, int]:
    """Consume an A line then explanation parts. Returns (ans, exp_parts, new_i)."""
    ans = ""
    if i < len(lines) and lines[i].strip().startswith("A "):
        ans = lines[i].strip()[2:]
        i += 1
    exp_parts, i = _collect_explanation(lines, i)
    return ans, exp_parts, i


# ─── Dart emitter ─────────────────────────────────────────────────────────────

def emit_dart(parsed: dict) -> str:
    meta = parsed["meta"]
    pfx = meta["PFX"]
    counters: dict[str, int] = {}

    def nid(code: str) -> str:
        counters[code] = counters.get(code, 0) + 1
        return f"{pfx}_{code}_{counters[code]:03d}"

    def rs(text: str) -> str:
        """Wrap in r''' ''' — for content, LaTeX, multi-line strings."""
        return f"r'''{text}'''"

    def qs(text: str) -> str:
        """Wrap in standard double quotes — for keys, IDs, type names."""
        return f'"{text}"'

    def emit_content_array(parts: list, indent: str) -> list[str]:
        """Emit a Dart content array from a list of ('text'|'graph'|'image', val)."""
        out = []
        for kind, val in parts:
            if kind == "text":
                out.append(f"{indent}    {rs(val)},")
            elif kind == "graph":
                out.append(f'{indent}    {{"graph": "{val}"}},')
            elif kind == "image":
                out.append(f'{indent}    {{"image": "assets/{val}.png"}},')
        return out

    def emit_dd_content(raw: str, indent: str) -> list[str]:
        """Emit DD step content array. Splits on [N] (drops) and recognizes
        IMAGE/GRAPH lines anywhere in the raw text."""
        out = []
        text_acc: list[str] = []

        def flush_text():
            if not text_acc:
                return
            joined = "\n".join(text_acc).strip("\n")
            text_acc.clear()
            if not joined:
                return
            # Split on [N] drop markers
            for part in re.split(r"(\[\d+\])", joined):
                m = re.fullmatch(r"\[(\d+)\]", part)
                if m:
                    out.append(f'{indent}        {{"drop": "{m.group(1)}"}},')
                elif part:
                    out.append(f"{indent}        {rs(part)},")

        for line in raw.splitlines():
            ls = line.strip()
            if ls.startswith("IMAGE "):
                flush_text()
                out.append(f'{indent}        {{"image": "assets/{ls[6:].strip()}.png"}},')
            elif ls.startswith("GRAPH "):
                flush_text()
                out.append(f'{indent}        {{"graph": "{ls[6:].strip()}"}},')
            else:
                text_acc.append(line)
        flush_text()
        return out

    def emit_fi_content(raw: str, indent: str) -> list[str]:
        """Emit FI content array. Splits on [BOX] and recognizes IMAGE/GRAPH lines."""
        out = []
        text_acc: list[str] = []

        def flush_text():
            if not text_acc:
                return
            joined = "\n".join(text_acc).strip("\n")
            text_acc.clear()
            if not joined:
                return
            for part in re.split(r"(\[BOX\])", joined):
                if part == "[BOX]":
                    out.append(f'{indent}    {{"box": "0"}},')
                elif part:
                    out.append(f"{indent}    {rs(part)},")

        for line in raw.splitlines():
            ls = line.strip()
            if ls.startswith("IMAGE "):
                flush_text()
                out.append(f'{indent}    {{"image": "assets/{ls[6:].strip()}.png"}},')
            elif ls.startswith("GRAPH "):
                flush_text()
                out.append(f'{indent}    {{"graph": "{ls[6:].strip()}"}},')
            else:
                text_acc.append(line)
        flush_text()
        return out

    def emit_explanation(parts: list, indent: str) -> list[str]:
        """Emit explanation field. If only text → r'''…''' string. Else array form."""
        # Coerce empty/missing to []
        parts = parts or []
        # Merge adjacent text parts (defensive)
        merged: list[tuple[str, str]] = []
        for kind, val in parts:
            if kind == "text" and merged and merged[-1][0] == "text":
                merged[-1] = ("text", merged[-1][1] + "\n" + val)
            else:
                merged.append((kind, val))
        has_media = any(k != "text" for k, _ in merged)
        if not has_media:
            text = merged[0][1] if merged else ""
            return [f"{indent}{qs('explanation')}: {rs(text)},"]
        # Array form
        out = [f"{indent}{qs('explanation')}: ["]
        for kind, val in merged:
            if kind == "text":
                out.append(f"{indent}    {rs(val)},")
            elif kind == "image":
                out.append(f'{indent}    {{"image": "assets/{val}.png"}},')
            elif kind == "graph":
                out.append(f'{indent}    {{"graph": "{val}"}},')
        out.append(f"{indent}],")
        return out

    lines = []
    ind = "    "  # 4-space indent

    lines.append(f"final {meta['VAR']} = ContentLesson(")
    lines.append(f"  title: {rs(meta['LESSON'])},")
    lines.append(f"  sections: [")

    for section in parsed["sections"]:
        lines.append(f"    ContentSection(")
        lines.append(f"      headerL1: {rs(section['title'])},")
        lines.append(f"      blocks: [")

        for block in section["blocks"]:
            btype = block["type"]

            # ── text ──────────────────────────────────────────────────────────
            if btype == "text":
                bid = nid("t")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('text')}, {{")
                lines.append(f"          {qs('content')}: [")
                for item in block["items"]:
                    lines.append(f"            {rs(item)},")
                lines.append(f"          ],")
                lines.append(f"        }}),")

            # ── header L2 ─────────────────────────────────────────────────────
            elif btype == "header":
                bid = nid("h")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('header')}, {{")
                lines.append(f"          {qs('title')}: {rs(block['title'])},")
                lines.append(f"          {qs('level')}: 2,")
                lines.append(f"        }}),")

            # ── image ─────────────────────────────────────────────────────────
            elif btype == "image":
                bid = nid("img")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('image')}, {{")
                lines.append(f"          {qs('path')}: {qs('assets/' + block['name'] + '.png')},")
                lines.append(f"        }}),")

            # ── interactive_graph ─────────────────────────────────────────────
            elif btype == "ig":
                bid = nid("ig")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('interactive_graph')}, {{")
                lines.append(f"          {qs('path')}: {qs(block['path'])},")
                lines.append(f"        }}),")

            # ── question_choice ───────────────────────────────────────────────
            elif btype == "question_choice":
                bid = nid("q")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('question_choice')}, {{")
                lines.append(f"          {qs('content')}: [")
                lines += emit_content_array(block["content_parts"], ind * 2)
                lines.append(f"          ],")
                opts_dart = ", ".join(rs(o) for o in block["opts"])
                lines.append(f"          {qs('options')}: [{opts_dart}],")
                lines.append(f"          {qs('correct')}: {rs(block['ans'])},")
                lines += emit_explanation(block.get("exp_parts", []), "          ")
                lines.append(f"        }}),")

            # ── fill_in ───────────────────────────────────────────────────────
            elif btype == "fill_in":
                bid = nid("fi")
                lines.append(f"        ContentBlock({qs(bid)}, {qs('question_fill_in')}, {{")
                lines.append(f"          {qs('content')}: [")
                lines += emit_fi_content(block["body"], ind * 2)
                lines.append(f"          ],")
                lines.append(f"          {qs('correct')}: {rs(block['ans'])},")
                lines += emit_explanation(block.get("exp_parts", []), "          ")
                lines.append(f"        }}),")

            # ── drag_and_drop ─────────────────────────────────────────────────
            elif btype == "dd":
                bid = nid("ddq")
                ddnum = counters["ddq"]
                lines.append(f"        ContentBlock({qs(bid)}, {qs('drag_and_drop')}, {{")
                lines.append(f"          {qs('steps')}: [")
                for step_i, step in enumerate(block["steps"], 1):
                    sqid = f"{pfx}_ddq_{ddnum:03d}_s{step_i}"
                    lines.append(f"            {{")
                    lines.append(f"              {qs('questionId')}: {qs(sqid)},")
                    lines.append(f"              {qs('content')}: [")
                    lines += emit_dd_content(step["content"], ind * 2)
                    lines.append(f"              ],")
                    items_dart = ", ".join(rs(it) for it in step["items"])
                    lines.append(f"              {qs('draggableItems')}: [{items_dart}],")
                    ans_entries = ", ".join(f'{qs(k)}: {rs(v)}' for k, v in step["ans"].items())
                    lines.append(f"              {qs('correctAnswers')}: {{{ans_entries}}},")
                    lines += emit_explanation(step.get("exp_parts", []), "              ")
                    lines.append(f"            }},")
                lines.append(f"          ],")
                lines.append(f"        }}),")

        lines.append(f"      ],")
        lines.append(f"    ),")

    lines.append(f"  ],")
    lines.append(f");")
    return "\n".join(lines)


def compact_to_dart(text: str) -> str:
    lessons = parse_compact(text)
    parts = ["import '../../../ui/content_models.dart';"]
    for lesson in lessons:
        parts.append("")
        parts.append(emit_dart(lesson))
    return "\n".join(parts)


# ══════════════════════════════════════════════════════════════════════════════
# DART → COMPACT
# ══════════════════════════════════════════════════════════════════════════════

def _read_dart_string(s: str, pos: int) -> tuple[str, int]:
    """Read a Dart string at pos. Supports r'''…''', r"…", r'…', "…", '…'.
    Returns (value, end_pos)."""
    # r''' multiline
    if s[pos:pos+4] == "r'''":
        end = s.find("'''", pos + 4)
        if end == -1:
            raise ValueError("Unterminated r''' string")
        return s[pos+4:end], end + 3
    # r" raw double-quoted
    if s[pos:pos+2] == 'r"':
        end = s.find('"', pos + 2)
        if end == -1:
            raise ValueError("Unterminated r\" string")
        return s[pos+2:end], end + 1
    # r' raw single-quoted
    if s[pos:pos+2] == "r'":
        end = s.find("'", pos + 2)
        if end == -1:
            raise ValueError("Unterminated r' string")
        return s[pos+2:end], end + 1
    # " double-quoted with escapes
    if s[pos] == '"':
        j = pos + 1
        buf = []
        while j < len(s) and s[j] != '"':
            if s[j] == '\\' and j + 1 < len(s):
                j += 1
                buf.append(s[j])
            else:
                buf.append(s[j])
            j += 1
        return ''.join(buf), j + 1
    # ' single-quoted with escapes
    if s[pos] == "'":
        j = pos + 1
        buf = []
        while j < len(s) and s[j] != "'":
            if s[j] == '\\' and j + 1 < len(s):
                j += 1
                buf.append(s[j])
            else:
                buf.append(s[j])
            j += 1
        return ''.join(buf), j + 1
    raise ValueError(f"Expected string at pos {pos}: {s[pos:pos+20]!r}")


def _at_string_start(s: str, i: int) -> bool:
    """True if a Dart string literal begins at position i."""
    return (s[i:i+4] == "r'''"
            or s[i:i+2] == 'r"'
            or s[i:i+2] == "r'"
            or (i < len(s) and s[i] in '"\''))


def _find_matching(s: str, start: int, open_ch: str, close_ch: str) -> int:
    """Find position of close_ch matching open_ch at start, skipping strings and // comments."""
    depth = 0
    i = start
    n = len(s)
    while i < n:
        # Skip single-line comments  //...
        if s[i:i+2] == "//":
            newline = s.find("\n", i + 2)
            i = newline + 1 if newline != -1 else n
            continue
        # Skip any Dart string literal
        if _at_string_start(s, i):
            try:
                _, end = _read_dart_string(s, i)
                i = end
                continue
            except ValueError:
                break  # malformed input — stop rather than loop forever
        if s[i] == open_ch:
            depth += 1
        elif s[i] == close_ch:
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return -1


def _extract_string_value(field_text: str) -> str:
    """Extract the string value after 'fieldname': in a field fragment."""
    for m in re.finditer(r'r\'\'\'|r"|"', field_text):
        try:
            val, _ = _read_dart_string(field_text, m.start())
            return val
        except ValueError:
            continue
    return ""


def _find_field(ds: str, name: str):
    """Return a regex match for 'name': in a Dart map, regardless of quote style.
    Tolerates whitespace before the colon."""
    pat = re.compile(
        r'(?:r\'\'\'|r"|r\'|"|\')' + re.escape(name) + r'(?:\'\'\'|"|\')\s*:\s*'
    )
    return pat.search(ds)


def _extract_all_strings(s: str) -> list[str]:
    """Extract all Dart string values from s in order. Supports r'''/r\"/r'/\"/' styles."""
    results = []
    i = 0
    n = len(s)
    while i < n:
        if _at_string_start(s, i):
            try:
                val, end = _read_dart_string(s, i)
                results.append(val)
                i = end
                continue
            except ValueError:
                break
        i += 1
    return results


def _inline_map_kind(chunk: str) -> Optional[tuple[str, str]]:
    """If chunk is an inline map like {"image": "..."} return (kind, value),
    else None. Tolerates whitespace and any quote style on both key and value."""
    # Generic key:value extractor — pull all strings, look at first two
    strings = _extract_all_strings(chunk)
    if len(strings) >= 2:
        key, val = strings[0], strings[1]
        if key in ("drop", "graph", "image", "box"):
            return (key, val)
    return None


def _extract_content_array(content_str: str) -> list[tuple[str, str]]:
    """
    Parse a Dart content array body (the [...] part without outer brackets).
    Returns ordered list of ('text'|'graph'|'image'|'drop'|'box', value).
    """
    parts = []
    i = 0
    s = content_str
    n = len(s)
    while i < n:
        # Skip whitespace and separators
        if s[i].isspace() or s[i] == ',':
            i += 1
            continue
        # Dart string literal → text
        if _at_string_start(s, i):
            try:
                val, end = _read_dart_string(s, i)
                parts.append(("text", val))
                i = end
                continue
            except ValueError:
                i += 1
                continue
        # Inline map {"drop":"0"} / {"graph":...} / {"image":...} / {"box":...}
        if s[i] == '{':
            end = _find_matching(s, i, '{', '}')
            if end == -1:
                break
            chunk = s[i:end+1]
            kv = _inline_map_kind(chunk)
            if kv is not None:
                kind, val = kv
                if kind == "image":
                    val = val.replace("assets/", "").replace(".png", "")
                parts.append((kind, val))
            i = end + 1
            continue
        i += 1
    return parts


def _parse_dart_block(block_str: str) -> Optional[dict]:
    """Parse a single ContentBlock(...) string into a dict."""
    # Find opening paren of ContentBlock
    start = block_str.find("(")
    if start == -1:
        return None
    inner_end = _find_matching(block_str, start, "(", ")")
    inner = block_str[start+1:inner_end]

    # Extract id (1st string arg)
    strings_before_map = []
    i = 0
    while i < len(inner):
        if _at_string_start(inner, i):
            try:
                val, end = _read_dart_string(inner, i)
                strings_before_map.append(val)
                i = end
                continue
            except ValueError:
                i += 1
                continue
        if inner[i] == '{':
            break
        i += 1
    if len(strings_before_map) < 2:
        return None

    block_id = strings_before_map[0]
    block_type = strings_before_map[1]

    # Find the data map {
    map_start = inner.find('{', i if i < len(inner) else 0)
    if map_start == -1:
        return None
    map_end = _find_matching(inner, map_start, '{', '}')
    data_str = inner[map_start+1:map_end]

    return {"id": block_id, "type": block_type, "data_str": data_str}


def _dd_content_to_compact(parts: list[tuple[str, str]]) -> list[str]:
    """Reconstruct compact content lines for DD step content.
    Text and drop markers stay on one body block; IMAGE/GRAPH go on their own lines.
    Returns a list of compact lines."""
    out_lines: list[str] = []
    text_buf: list[str] = []

    def flush_text():
        joined = "".join(text_buf)
        text_buf.clear()
        if joined:
            out_lines.append(joined)

    for kind, val in parts:
        if kind == "text":
            text_buf.append(val)
        elif kind == "drop":
            text_buf.append(f"[{val}]")
        elif kind == "image":
            flush_text()
            out_lines.append(f"IMAGE {val}")
        elif kind == "graph":
            flush_text()
            out_lines.append(f"GRAPH {val}")
    flush_text()
    return out_lines


def _fi_content_to_compact(parts: list[tuple[str, str]]) -> list[str]:
    """Reconstruct compact body lines for FI content.
    Text and [BOX] inline; IMAGE/GRAPH on their own lines."""
    out_lines: list[str] = []
    text_buf: list[str] = []

    def flush_text():
        joined = "".join(text_buf)
        text_buf.clear()
        if joined:
            out_lines.append(joined)

    for kind, val in parts:
        if kind == "text":
            text_buf.append(val)
        elif kind == "box":
            text_buf.append("[BOX]")
        elif kind == "image":
            flush_text()
            out_lines.append(f"IMAGE {val}")
        elif kind == "graph":
            flush_text()
            out_lines.append(f"GRAPH {val}")
    flush_text()
    return out_lines


def _read_explanation_field(ds: str) -> list[str]:
    """Read explanation from a Dart block data map. Returns compact E/IMAGE/GRAPH lines.
    Handles both string form (r'''…''') and array form ([r'''…''', {"image":…}, …])."""
    m = _find_field(ds, "explanation")
    if not m:
        return []
    pos = m.end()
    # Skip whitespace
    while pos < len(ds) and ds[pos] in " \t\n":
        pos += 1
    if pos >= len(ds):
        return []

    # Array form?
    if ds[pos] == '[':
        arr_end = _find_matching(ds, pos, '[', ']')
        if arr_end == -1:
            return []
        parts = _extract_content_array(ds[pos+1:arr_end])
        return _explanation_parts_to_lines(parts)
    # String form
    try:
        val, _ = _read_dart_string(ds, pos)
    except ValueError:
        return []
    return [f"E {line}" if line else "E" for line in val.splitlines()]


def _explanation_parts_to_lines(parts: list[tuple[str, str]]) -> list[str]:
    """Convert a parts list (text/image/graph) into compact explanation lines."""
    out: list[str] = []
    for kind, val in parts:
        if kind == "text":
            for line in val.splitlines():
                out.append(f"E {line}" if line else "E")
            if not val.splitlines() and val == "":
                out.append("E")
        elif kind == "image":
            out.append(f"IMAGE {val}")
        elif kind == "graph":
            out.append(f"GRAPH {val}")
    return out


def _parse_dd_step(step_str: str) -> dict:
    """Parse one DD step body (within {…}) → {content_parts, items, ans_pairs, exp_lines}."""
    res: dict = {"content_parts": [], "items": [], "ans_pairs": [], "exp_lines": []}

    mc = _find_field(step_str, "content")
    if mc:
        arr_s = step_str.find('[', mc.end())
        arr_e = _find_matching(step_str, arr_s, '[', ']')
        if arr_e != -1:
            res["content_parts"] = _extract_content_array(step_str[arr_s+1:arr_e])

    mi = _find_field(step_str, "draggableItems")
    if mi:
        arr_s = step_str.find('[', mi.end())
        arr_e = _find_matching(step_str, arr_s, '[', ']')
        if arr_e != -1:
            res["items"] = _extract_all_strings(step_str[arr_s+1:arr_e])

    ma = _find_field(step_str, "correctAnswers")
    if ma:
        map_s = step_str.find('{', ma.end())
        map_e = _find_matching(step_str, map_s, '{', '}')
        if map_e != -1:
            ans_strings = _extract_all_strings(step_str[map_s+1:map_e])
            res["ans_pairs"] = [
                f"{ans_strings[k]}={ans_strings[k+1]}"
                for k in range(0, len(ans_strings) - 1, 2)
            ]

    res["exp_lines"] = _read_explanation_field(step_str)
    return res


def _dart_block_to_compact_lines(parsed: dict) -> list[str]:
    """Convert a parsed block dict → compact format lines."""
    btype = parsed["type"]
    ds = parsed["data_str"]
    out: list[str] = []

    # ── text ──────────────────────────────────────────────────────────────────
    if btype == "text":
        m = _find_field(ds, "content")
        if m:
            arr_start = ds.find('[', m.end())
            arr_end = _find_matching(ds, arr_start, '[', ']')
            items = _extract_all_strings(ds[arr_start+1:arr_end])
            for item in items:
                # Split multi-line items so each line is its own T
                for line in item.splitlines() or [""]:
                    out.append(f"T {line}")

    # ── header L2 ─────────────────────────────────────────────────────────────
    elif btype == "header":
        m = _find_field(ds, "title")
        if m:
            val, _ = _read_dart_string(ds, m.end())
            out.append(f"-- {val}")

    # ── image ─────────────────────────────────────────────────────────────────
    elif btype == "image":
        m = _find_field(ds, "path")
        if m:
            val, _ = _read_dart_string(ds, m.end())
            name = val.replace("assets/", "").replace(".png", "")
            out.append(f"IMG {name}")

    # ── interactive_graph ─────────────────────────────────────────────────────
    elif btype == "interactive_graph":
        m = _find_field(ds, "path")
        if m:
            val, _ = _read_dart_string(ds, m.end())
            out.append(f"IG {val}")

    # ── question_choice ───────────────────────────────────────────────────────
    elif btype == "question_choice":
        out.append("Q")
        m = _find_field(ds, "content")
        if m:
            arr_start = ds.find('[', m.end())
            arr_end = _find_matching(ds, arr_start, '[', ']')
            parts = _extract_content_array(ds[arr_start+1:arr_end])
            for kind, val in parts:
                if kind == "text":
                    out.append(val)
                elif kind == "graph":
                    out.append(f"GRAPH {val}")
                elif kind == "image":
                    out.append(f"IMAGE {val}")
        m = _find_field(ds, "options")
        if m:
            arr_start = ds.find('[', m.end())
            arr_end = _find_matching(ds, arr_start, '[', ']')
            opts = _extract_all_strings(ds[arr_start+1:arr_end])
            out.append(f"O {'|'.join(opts)}")
        m = _find_field(ds, "correct")
        if m:
            val, _ = _read_dart_string(ds, m.end())
            out.append(f"A {val}")
        out.extend(_read_explanation_field(ds))

    # ── fill_in ───────────────────────────────────────────────────────────────
    elif btype == "question_fill_in":
        out.append("FI")
        m = _find_field(ds, "content")
        if m:
            arr_start = ds.find('[', m.end())
            arr_end = _find_matching(ds, arr_start, '[', ']')
            parts = _extract_content_array(ds[arr_start+1:arr_end])
            out.extend(_fi_content_to_compact(parts))
        m = _find_field(ds, "correct")
        if m:
            val, _ = _read_dart_string(ds, m.end())
            out.append(f"A {val}")
        out.extend(_read_explanation_field(ds))

    # ── drag_and_drop ─────────────────────────────────────────────────────────
    elif btype == "drag_and_drop":
        out.append("DD")
        m = _find_field(ds, "steps")
        if m:
            # Multi-step form: "steps": [ {…}, {…} ]
            steps_start = ds.find('[', m.end())
            steps_end = _find_matching(ds, steps_start, '[', ']')
            steps_str = ds[steps_start+1:steps_end]
            step_strs: list[str] = []
            j = 0
            while j < len(steps_str):
                if steps_str[j] == '{':
                    end = _find_matching(steps_str, j, '{', '}')
                    if end == -1:
                        break
                    step_strs.append(steps_str[j:end+1])
                    j = end + 1
                else:
                    j += 1
            for step_i, step_str in enumerate(step_strs):
                if step_i > 0:
                    out.append(">")
                step = _parse_dd_step(step_str)
                out.extend(_dd_content_to_compact(step["content_parts"]))
                if step["items"]:
                    out.append(f"I {'|'.join(step['items'])}")
                if step["ans_pairs"]:
                    out.append(f"A {'|'.join(step['ans_pairs'])}")
                out.extend(step["exp_lines"])
        else:
            # Single-step fallback: content/draggableItems/correctAnswers at root
            step = _parse_dd_step(ds)
            out.extend(_dd_content_to_compact(step["content_parts"]))
            if step["items"]:
                out.append(f"I {'|'.join(step['items'])}")
            if step["ans_pairs"]:
                out.append(f"A {'|'.join(step['ans_pairs'])}")
            out.extend(step["exp_lines"])

    return out


def dart_to_compact(dart_code: str) -> str:
    """Convert a Dart file with ContentLesson(s) to compact format."""
    lines = []

    # Find all ContentLesson declarations
    for m in re.finditer(r'final\s+(\w+)\s*=\s*ContentLesson\(', dart_code):
        var_name = m.group(1)
        lesson_start = m.end() - len("ContentLesson(") + m.end() - m.end()
        # Find the ContentLesson( opening
        paren_start = dart_code.find("ContentLesson(", m.start())
        paren_start += len("ContentLesson")
        paren_end = _find_matching(dart_code, paren_start, '(', ')')
        lesson_body = dart_code[paren_start+1:paren_end]

        # Extract title
        title_m = re.search(r'title\s*:\s*', lesson_body)
        title = ""
        if title_m:
            try:
                title, _ = _read_dart_string(lesson_body, title_m.end())
            except ValueError:
                pass

        # Guess PFX from var name or first block id
        pfx_m = re.search(r'ContentBlock\([^,]+,', lesson_body)
        pfx = "x"
        if pfx_m:
            first_strings = _extract_all_strings(pfx_m.group(0))
            if first_strings:
                parts = first_strings[0].split("_")
                pfx = parts[0] if parts else "x"

        if lines:
            lines.append("")
            lines.append("# " + "─" * 60)
            lines.append("")

        lines.append(f"LESSON {title}")
        lines.append(f"VAR {var_name}")
        lines.append(f"PFX {pfx}")

        # Find all ContentSection blocks
        for sm in re.finditer(r'ContentSection\(', lesson_body):
            sec_paren = lesson_body.find('(', sm.start())
            sec_end = _find_matching(lesson_body, sec_paren, '(', ')')
            sec_body = lesson_body[sec_paren+1:sec_end]

            # Extract headerL1
            h1m = re.search(r'headerL1\s*:\s*', sec_body)
            h1 = ""
            if h1m:
                try:
                    h1, _ = _read_dart_string(sec_body, h1m.end())
                except ValueError:
                    pass

            lines.append("")
            lines.append(f"== {h1}")

            # Extract blocks array
            bm = re.search(r'blocks\s*:\s*\[', sec_body)
            if not bm:
                continue
            blocks_start = sec_body.find('[', bm.start())
            blocks_end = _find_matching(sec_body, blocks_start, '[', ']')
            blocks_str = sec_body[blocks_start+1:blocks_end]

            # Extract each ContentBlock(...)
            prev_type = None
            for cbm in re.finditer(r'ContentBlock\(', blocks_str):
                cb_paren = blocks_str.find('(', cbm.start())
                cb_end = _find_matching(blocks_str, cb_paren, '(', ')')
                cb_str = "ContentBlock" + blocks_str[cb_paren:cb_end+1]

                parsed = _parse_dart_block(cb_str)
                if not parsed:
                    continue

                compact_lines = _dart_block_to_compact_lines(parsed)
                if not compact_lines:
                    continue

                btype = parsed["type"]
                # Add blank line between different block types (but not between T lines)
                if prev_type is not None and not (prev_type == "text" and btype == "text"):
                    lines.append("")

                lines += compact_lines
                prev_type = btype

    return "\n".join(lines)


# ══════════════════════════════════════════════════════════════════════════════
# CLI
# ══════════════════════════════════════════════════════════════════════════════

def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)

    direction = sys.argv[1]
    input_file = sys.argv[2]

    with open(input_file, encoding="utf-8") as f:
        content = f.read()

    if direction == "to_dart":
        print(compact_to_dart(content))
    elif direction == "to_compact":
        print(dart_to_compact(content))
    else:
        print(f"Unknown direction: {direction}. Use 'to_dart' or 'to_compact'.")
        sys.exit(1)


if __name__ == "__main__":
    main()