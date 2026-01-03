---
description: "Learn from web content or files and generate knowledge + skills"
allowed-tools:
  - Bash
  - Read
  - Write
  - WebFetch
  - WebSearch
---

# /ai-kit:learn

**Learn from web content or files and generate knowledge + skills**
*เรียนรู้จากเว็บหรือไฟล์ สร้างความรู้และทักษะ*

## ทำอะไร

AI จะ:
1. อ่านเนื้อหาจาก URL หรือไฟล์ที่ส่งมา
2. วิเคราะห์และสกัดแนวคิดสำคัญ
3. สร้าง knowledge files ใน `ψ/memory/`
4. สร้าง reusable skills ใน `.claude/skills/`

## วิธีใช้

```bash
# เรียนรู้จากหน้าเว็บ
/ai-kit:learn https://example.com/guide

# เรียนรู้จากไฟล์
/ai-kit:learn path/to/document.pdf

# เรียนรู้จากหลายแหล่ง
/ai-kit:learn https://docs.example.com/api ./api-notes.md

# เรียนรู้พร้อมระบุประเภท
/ai-kit:learn https://example.com --type=pattern
```

## Input Types

| Type | Supports | Tool Used |
|------|----------|-----------|
| **Web URLs** | Articles, docs, tutorials | web-reader MCP |
| **PDF** | Documents, manuals | File read + extract |
| **Images** | Screenshots, diagrams | OCR, image analysis |
| **Markdown** | Notes, docs | Direct read |
| **Code** | Source files | Syntax-aware read |

## Output Files

```
ψ/memory/
├── concepts/
│   └── [topic]-concepts.md      # แนวคิดหลัก
├── patterns/
│   └── [topic]-patterns.md      # patterns ที่ใช้ซ้ำได้
└── refs/
    └── [topic]-reference.md     # quick reference

.claude/skills/
└── [topic]-workflow.md          # workflow ที่ใช้ได้
```

## Options

| Option | Description |
|--------|-------------|
| `--type=concept` | Generate concepts only |
| `--type=pattern` | Generate patterns only |
| `--type=skill` | Generate skill only |
| `--name=X` | Custom name for outputs |
| `--no-skill` | Skip skill generation |

## Example

```
User: /ai-kit:learn https://react.dev/reference/react

AI:
# Learning from: https://react.dev/reference/react
Fetching content...
Analyzing structure...

✅ Created 4 files:

**ψ/memory/concepts/react-concepts.md**
- React components
- JSX syntax
- Virtual DOM

**ψ/memory/patterns/react-patterns.md**
- Component composition
- State management patterns
- Hook patterns

**ψ/memory/refs/react-reference.md**
- Component API quick reference
- Props reference
- Event handling

**.claude/skills/react-workflow.md**
- How to create a component
- How to add state
- How to handle events

You can now ask: "How do I create a React component with state?"
```

## Tips

- **Learn incrementally**: Break large docs into smaller topics
- **Use descriptive URLs**: AI uses URL/path for naming
- **Review outputs**: Edit generated files if needed
- **Combine sources**: Learn from multiple related sources

## Related Commands

- `/ai-kit:learn` - Manual learning capture (existing skill)
- `/ai-kit:pattern` - Save discovered pattern
- `/ai-kit:note` - Quick note
- `/trace` - Search learned knowledge
