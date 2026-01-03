# Comprehensive Guide - AI Productivity Kit

**คู่มือการใช้งานครบวงจร**

## Table of Contents
1. [Quick Start](#quick-start)
2. [Core Workflows](#core-workflows)
3. [All Commands Reference](#all-commands-reference)
4. [Agents Guide](#agents-guide)
5. [Best Practices](#best-practices)
6. [Patterns & Templates](#patterns--templates)
7. [Integration Guide](#integration-guide)

---

## Quick Start

### Installation
```bash
# 1. Copy to your project
cp -r ai-productivity-kit/* your-project/

# 2. Go to your project
cd your-project

# 3. Initialize structure
/ai-kit:init

# 4. Start working
/ai-kit:start
```

### First Day Workflow
```
1. /ai-kit:start         → เริ่ม session
2. /nnn [feature]        → สร้างแผน
3. /gogogo               → ลงมือทำ
4. /ai-kit:pause         → พักเที่ยง
5. /gogogo               → ทำต่อ
6. /rrr                  → สรุปวันนี้
```

---

## Core Workflows

### 1. Feature Development (Complete)

```
┌─────────────────────────────────────────────────┐
│  Day 1: Planning & Start                        │
├─────────────────────────────────────────────────┤
│  /ccc          →  Create context issue          │
│  /nnn [desc]   →  Create implementation plan     │
│  /gogogo       →  Execute tasks                 │
│  /ai-kit:pause →  End session                   │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│  Day 2+: Continue                               │
├─────────────────────────────────────────────────┤
│  /recap        →  See where we left off         │
│  /gogogo       →  Continue execution            │
│  /rrr          →  Session retrospective          │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│  Complete: Learn & Document                     │
├─────────────────────────────────────────────────┤
│  /ai-kit:learn  →  Capture key learnings        │
│  /ai-kit:trick →  Save any tricks discovered    │
│  /lll          →  Check project status          │
└─────────────────────────────────────────────────┘
```

### 2. Debug Workflow

```
┌─────────────────────────────────────────────────┐
│  Debug Session                                  │
├─────────────────────────────────────────────────┤
│  1. Copy full error + stack trace               │
│  2. /ai-kit:debug [error]                       │
│  3. AI analyzes & suggests fixes                │
│  4. Review & apply fix                          │
│  5. Test thoroughly                             │
│  6. /ai-kit:trick (if learned something)        │
└─────────────────────────────────────────────────┘
```

### 3. Code Review Workflow

```
┌─────────────────────────────────────────────────┐
│  Code Review                                    │
├─────────────────────────────────────────────────┤
│  1. git diff → see changes                      │
│  2. /ai-kit:review                              │
│  3. AI reports issues with severity             │
│  4. Fix issues                                  │
│  5. /ai-kit:delegate review (if needed)         │
│  6. Commit when satisfied                       │
└─────────────────────────────────────────────────┘
```

### 4. Learning New Codebase

```
┌─────────────────────────────────────────────────┐
│  Explore & Learn                                │
├─────────────────────────────────────────────────┤
│  1. /trace [keyword] → Find relevant files      │
│  2. Read files to understand structure          │
│  3. /ai-kit:note "Understanding X module"       │
│  4. Ask AI to explain unclear parts             │
│  5. /ai-kit:pattern "How X is structured"       │
└─────────────────────────────────────────────────┘
```

---

## All Commands Reference

### Planning Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/nnn` | Create implementation plan | `/nnn ทำระบบ login` |
| `/ai-kit:breakdown` | Break large task into parts | `/breakdown create REST API` |
| `/constitution` | Define project principles | `/constitution` |
| `/specify` | Define requirements | `/specify auth system` |
| `/plan` | Create technical plan | `/plan` |

### Execution Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/gogogo` | Execute most recent plan | `/gogogo` |
| `/implement` | Execute all tasks | `/implement` |
| `/ai-kit:delegate` | Delegate to agent | `/delegate write tests` |

### Review Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/rrr` | Session retrospective | `/rrr` |
| `/ai-kit:review` | Review code changes | `/review` |
| `/lll` | Project status | `/lll` |

### Context Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/ccc` | Create context issue | `/ccc` |
| `/recap` | Current context summary | `/recap` |
| `/forward` | Save for next session | `/forward` |
| `/trace` | Search everything | `/trace auth` |

### Session Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/ai-kit:start` | Start new session | `/start` |
| `/ai-kit:focus` | Set current task | `/focus fix login bug` |
| `/ai-kit:pause` | Pause work | `/pause` |
| `/hours` | Track work hours | `/hours` |

### Knowledge Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/ai-kit:note` | Quick note | `/note docker volume trick` |
| `/ai-kit:trick` | Save code trick | `/trick python list comprehension` |
| `/ai-kit:pattern` | Save pattern | `/pattern ai-collaboration debug` |
| `/ai-kit:learn` | Capture learning | `/learn` |

---

## Agents Guide

### When to Use Each Agent

```
┌──────────────────────────────────────────────────────┐
│  coder                                              │
│  ├─ Write code from specs                           │
│  ├─ Implement features                              │
│  └─ Add new functions/classes                       │
├──────────────────────────────────────────────────────┤
│  debug-helper                                       │
│  ├─ Analyze errors                                  │
│  ├─ Find root causes                                │
│  └─ Suggest fixes                                   │
├──────────────────────────────────────────────────────┤
│  test-writer                                        │
│  ├─ Write unit tests                                │
│  ├─ Write integration tests                         │
│  └─ Create test fixtures                            │
├──────────────────────────────────────────────────────┤
│  doc-writer                                         │
│  ├─ Write README                                    │
│  ├─ Document APIs                                   │
│  └─ Add docstrings                                  │
├──────────────────────────────────────────────────────┤
│  context-finder                                     │
│  ├─ Find files by pattern                           │
│  ├─ Search git history                              │
│  └─ Locate where X is defined                       │
├──────────────────────────────────────────────────────┤
│  code-reviewer                                      │
│  ├─ Review code changes                             │
│  ├─ Find security issues                            │
│  └─ Suggest improvements                           │
├──────────────────────────────────────────────────────┤
│  code-simplifier                                    │
│  ├─ Refactor complex code                           │
│  ├─ Improve readability                            │
│  └─ Reduce duplication                             │
├──────────────────────────────────────────────────────┤
│  general-purpose                                    │
│  ├─ General tasks                                   │
│  ├─ Research & exploration                          │
│  └─ Multi-step work                                │
└──────────────────────────────────────────────────────┘
```

### Agent Delegation Examples

```python
# Write code
/ai-kit:delegate เขียน function validate_email

# Debug
/ai-kit:delegate debug TypeError at auth.py:45

# Tests
/ai-kit:delegate write tests for auth.py

# Docs
/ai-kit:delegate write README for this project

# Find files
/ai-kit:delegate หาไฟล์ที่มี JWT

# Review
/ai-kit:delegate review my changes
```

---

## Best Practices

### 1. Give Good Context

❌ Bad: "แก้ให้หน่อย"
✅ Good: "แก้ bug ที่ src/auth.py:45 เวลา login แล้ว error 404"

### 2. Use the Right Workflow

```
Small task: /ai-kit:focus → /ai-kit:delegate
Feature: /ccc → /nnn → /gogogo → /rrr
Debug: /ai-kit:debug → test → /ai-kit:trick
Review: git diff → /ai-kit:review → fix
```

### 3. Always Capture Learning

```
End of session → /rrr
Found trick → /ai-kit:trick
Found pattern → /ai-kit:pattern
General learning → /ai-kit:learn
```

### 4. Git Safety

```
✅ DO:
- Feature branches
- PR before merge
- Review diff before commit
- Ask before destructive actions

❌ DON'T:
- git push --force
- git reset --hard
- rm -rf without confirmation
- Push to main directly
```

### 5. Session Management

```
Start day: /ai-kit:start or /recap
End session: /rrr or /ai-kit:pause
Before /clear: /forward
New project: /ai-kit:init
```

---

## Patterns & Templates

### Prompt Template: Bug Report
```markdown
## Bug Report

### Error
\`\`\`
[paste full error + stack trace]
\`\`\`

### Location
File: [file path]
Line: [line number]

### Context
- What I was doing: [action]
- Expected: [what should happen]
- Actual: [what happened]

### Reproduction
1. [step 1]
2. [step 2]
3. [step 3]
```

### Prompt Template: Feature Request
```markdown
## Feature Request

### What
[feature name]

### Requirements
- [requirement 1]
- [requirement 2]

### Input Format
\`\`\`
[input example]
\`\`\`

### Output Format
\`\`\`
[output example]
\`\`\`

### Constraints
- [constraint 1]
- [constraint 2]

### Tech Stack
- Language: [language]
- Framework: [framework]
```

### Retro Template
```markdown
# Retrospective: [Title]

**Date**: YYYY-MM-DD
**Duration**: X hours

## What We Did
- [task 1]
- [task 2]

## What Went Well
✅ [good thing 1]
✅ [good thing 2]

## What Could Be Better
⚠️ [improvement 1]
⚠️ [improvement 2]

## What We Learned
- [learning 1]
- [learning 2]

## Next Steps
- [ ] [next 1]
- [ ] [next 2]
```

---

## Integration Guide

### With Ralph (Autonomous Loop)

```bash
# Ralph handles autonomous execution
# AI Productivity Kit handles planning & learning

# Combined workflow:
1. /nnn → Create plan
2. ralph --monitor → Execute autonomously
3. /rrr → Capture learnings
4. /ai-kit:pattern → Save discovered patterns
```

### With Oracle MCP

```bash
# Use Oracle MCP for knowledge retrieval
# Use AI Productivity Kit for workflows

# Search oracle principles:
oracle_search "authentication patterns"

# Use in workflow:
/ai-kit:delegate implement auth with oracle patterns
```

### With Multi-Agent Workflow Kit

```bash
# MAW handles parallel agents
# AI Productivity Kit provides skills

# Combined:
maw start profile0           # Start agent grid
/ai-kit:delegate task 1     # Assign via AI kit
maw hey 2 "do task 2"        # Or direct
maw sync                     # Sync all work
```

---

## Quick Reference Card

```
┌────────────────────────────────────────────────┐
│  AI Productivity Kit - Quick Reference         │
├────────────────────────────────────────────────┤
│  PLANNING                                      │
│  /nnn         →  Create plan                   │
│  /breakdown   →  Break down tasks              │
├────────────────────────────────────────────────┤
│  EXECUTION                                     │
│  /gogogo      →  Execute plan                  │
│  /delegate    →  Delegate to agent             │
├────────────────────────────────────────────────┤
│  REVIEW                                        │
│  /rrr         →  Session retro                 │
│  /review      →  Review code                   │
│  /lll         →  Project status                │
├────────────────────────────────────────────────┤
│  CONTEXT                                       │
│  /ccc         →  Save context                  │
│  /recap       →  Current status                │
│  /forward     →  Save for next session         │
│  /trace       →  Search everything             │
├────────────────────────────────────────────────┤
│  SESSION                                       │
│  /start       →  Start session                 │
│  /focus       →  Set focus                     │
│  /pause       →  Pause work                    │
│  /hours       →  Track time                    │
├────────────────────────────────────────────────┤
│  KNOWLEDGE                                     │
│  /note        →  Quick note                    │
│  /trick       →  Save trick                    │
│  /pattern     →  Save pattern                  │
│  /learn       →  Capture learning              │
└────────────────────────────────────────────────┘
```

---

**Happy Productive Coding! 🚀**
