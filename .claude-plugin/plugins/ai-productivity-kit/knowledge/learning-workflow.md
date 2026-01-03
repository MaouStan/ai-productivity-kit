# Learning Workflow

**How AI learns from web content and files to generate knowledge and skills**

## Overview

The learning system transforms external content (web pages, files) into:
1. **Knowledge files** in `ψ/memory/` - Persistent information storage
2. **Skills** in `.claude/skills/` - Reusable workflows

## Data Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                         INPUT                                   │
├─────────────────────────────────────────────────────────────────┤
│  Web URLs           │  Files           │  Both                 │
│  - Articles         │  - PDF           │  - Mixed content      │
│  - Documentation    │  - Images        │  - Multiple sources   │
│  - Tutorials       │  - Docs          │                       │
└─────────┬───────────┴─────────┬────────┴───────────┬───────────┘
          │                     │                    │
          │  ┌──────────────────┴────────────────────┐
          │  │         /learn command                │
          │  │   Accepts: URL, file path, or both   │
          │  └──────────────────┬────────────────────┘
          │                     │
          ▼                     ▼
    ┌─────────────────────────────────────┐
    │      Content Acquisition             │
    ├─────────────────────────────────────┤
    │  • web-reader MCP (for URLs)         │
    │  • File read (for local files)       │
    │  • Image analysis (for screenshots)  │
    └──────────────┬──────────────────────┘
                   │
                   ▼
    ┌─────────────────────────────────────┐
    │      Learning Agent                  │
    │  (analyze, extract, synthesize)      │
    ├─────────────────────────────────────┤
    │  1. Understand content               │
    │  2. Extract key concepts             │
    │  3. Identify patterns                │
    │  4. Find reusable workflows          │
    └──────────────┬──────────────────────┘
                   │
          ┌────────┴────────┐
          ▼                 ▼
    ┌───────────┐     ┌─────────────┐
    │ Knowledge │     │   Skills    │
    │  Files    │     │             │
    ├───────────┤     ├─────────────┤
    │ψ/memory/  │     │.claude/skills│
    │ concepts/ │     │              │
    │ patterns/ │     │ - workflows  │
    │ refs/     │     │ - how-to     │
    └───────────┘     └─────────────┘
```

## Knowledge File Types

### 1. Concepts (`ψ/memory/concepts/`)
- **Purpose**: Store key ideas, definitions, theories
- **Template**: `concept-template.md`
- **Example**: `react-hooks.md`

### 2. Patterns (`ψ/memory/patterns/`)
- **Purpose**: Reusable code/architecture patterns
- **Template**: `pattern-template.md`
- **Example**: `repository-pattern.md`

### 3. References (`ψ/memory/refs/`)
- **Purpose**: Quick reference guides, cheat sheets
- **Template**: `reference-template.md`
- **Example**: `git-commands.md`

## Skill Types

### 1. Workflows
- Multi-step processes
- Decision trees
- Best practices

### 2. How-To
- Specific task completion
- Step-by-step guides
- Common operations

### 3. Checklists
- Verification steps
- Quality assurance
- Release processes

## MCP Tools Used

| Tool | Purpose | Input | Output |
|------|---------|-------|--------|
| `web-reader` | Fetch web content | URL | Markdown |
| `analyze_image` | Extract from images | Image path | Text/data |
| `extract_text` | OCR from screenshots | Screenshot | Text |
| `ui_to_artifact` | Convert UI to code | UI screenshot | Code |

## Command Usage

```bash
# Learn from web
/learn https://example.com/guide

# Learn from file
/learn path/to/document.pdf

# Learn from multiple sources
/learn https://example.com/guide ./notes.md ./screenshot.png
```

## Output Structure

After `/learn` completes:

```
ψ/memory/
├── concepts/
│   └── [topic]-concepts.md
├── patterns/
│   └── [topic]-patterns.md
└── refs/
    └── [topic]-reference.md

.claude/skills/
└── [topic]-workflow.md
```

## Quality Criteria

Good learning output should:
- **Accurate**: Correctly captures source content
- **Actionable**: Can be applied to real tasks
- **Structured**: Easy to navigate and reference
- **Linked**: References to original sources
- **Tested**: Verified against examples

## Example Session

```bash
# User wants to learn about React hooks
/learn https://react.dev/reference/react

# AI creates:
# - ψ/memory/concepts/react-hooks-concepts.md
# - ψ/memory/patterns/hooks-patterns.md
# - ψ/memory/refs/hooks-api-reference.md
# - .claude/skills/react-hooks-workflow.md

# User can now use the knowledge:
"How do I use useEffect for data fetching?"
→ AI references learned knowledge
```

## Related

- `/ai-kit:learn` - Capture manual learnings
- `/ai-kit:pattern` - Save discovered patterns
- `/ai-kit:note` - Quick notes
- `/trace` - Search learned knowledge
