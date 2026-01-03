# Short Codes Workflow

**วงจรการทำงานแบบ Oracle**
*Oracle Development Cycle*

## The Core Loop

```
nnn → gogogo → rrr → ccc

┌─────┐    ┌──────┐    ┌─────┐    ┌─────┐
│ nnn │ → │ gogogo│ → │ rrr │ → │ ccc │
└─────┘    └──────┘    └─────┘    └─────┘
  ↓          ↓           ↓          ↓
วางแผน   ลงมือทำ   สรุป    เก็บ context
Plan      Do        Review   Context
```

## Commands Explained

### `/nnn` - New Plan
**สร้างแผนงาน (Create Implementation Plan)**

ทำอะไร:
1. Auto-runs `/ccc` ถ้าไม่มี context issue ล่าสุด
2. สร้าง GitHub issue สำหรับ implementation plan
3. แบ่ง task เป็น step พร้อม acceptance criteria

Template:
```markdown
# Implementation Plan: [Feature Name]

## Overview
[สรุปสิ่งที่จะทำ]

## Tasks
- [ ] Task 1 - [description] (acceptance criteria)
- [ ] Task 2 - [description] (acceptance criteria)
- [ ] Task 3 - [description] (acceptance criteria)

## Dependencies
- [dependency 1]
- [dependency 2]

## Definition of Done
- [ ] All tasks complete
- [ ] Tests passing
- [ ] Documentation updated
```

### `/gogogo` - Execute Plan
**ลงมือทำตามแผน (Execute Most Recent Plan)**

ทำอะไร:
1. อ่าน plan issue ล่าสุด
2. Execute task ทีละอันตามลำดับ
3. อัปเดต progress ใน issue
4. ทำจนครบทุก task

Behavior:
- Focus ทำ task เดียวจนเสร็จ
- Ask ก่อน destructive action
- Report progress ทุก step

### `/rrr` - Retro Reflect Review
**ทบทวนงาน (Session Retrospective)**

ทำอะไร:
1. สรุปสิ่งที่ทำใน session
2. บันทึกสิ่งที่เรียนรู้
3. สกัด patterns และ tricks
4. ระบุสิ่งที่ควรปรับปรุง

Output:
```
ψ/memory/retros/YYYY-MM-DD_retro.md
ψ/memory/learnings/YYYY-MM-DD_learning.md (ถ้ามี)
```

### `/ccc` - Create Context Issue
**สร้าง context และย่อ conversation (Create Context + Compact)**

ทำอะไร:
1. สร้าง GitHub issue เก็บ session context
2. สรุป conversation ทั้งหมด
3. Attach ไฟล์ที่เกี่ยวข้อง
4. Compact conversation เพื่อประหยัด tokens

Template:
```markdown
# Context: [Session Title]

**Date**: YYYY-MM-DD
**Focus**: [สิ่งที่โฟกัสทำ]

## Summary
[สรุป session]

## Key Decisions
- [decision 1]
- [decision 2]

## Files Changed
- [file 1]
- [file 2]

## Next Session
[สิ่งที่ต้องทำต่อ]
```

## Supporting Commands

### `/lll` - List Project Status
```bash
/lll

Output:
📊 Project Status

Issues:
- #12: Implement auth (IN_PROGRESS)
- #11: Fix login bug (CLOSED)

PRs:
- #8: Feature/auth (OPEN)

Commits:
- abc123: Add JWT middleware
- def456: Fix token validation
```

### `/recap` - Fresh Start
```bash
/recap

Output:
📍 Current Focus

Task: [จาก ψ/inbox/focus.md]
Progress: [สิ่งที่ทำไปแล้ว]
Next: [สิ่งที่ต้องทำต่อ]

Recent Context:
- [context issue link]
- [related files]
```

### `/forward` - Forward Context
```bash
/forward

ทำอะไร:
1. สร้าง WIP.md
2. เก็บ context ปัจจุบัน
3. พร้อมใช้ /clear แล้วเริ่มใหม่

Output: ψ/inbox/WIP.md
```

### `/hours` - Work Hours
```bash
/hours

Output:
🕐 ชั่วโมงทำงานวันนี้

Session 1: 09:00 - 12:00 (3 hours)
  - Implement login
  - Write tests

Session 2: 13:00 - 15:30 (2.5 hours)
  - Debug auth issue
  - Fix bug

Total: 5.5 hours
```

### `/trace` - Search Everything
```bash
/trace [query]

ค้นหาใน:
- Git history
- Files
- Issues
- Retrospectives
- Context issues
```

## Complete Workflow Example

```
# Day 1 - Morning
User: /nnn ทำระบบ authentication
AI: Creates plan issue #10 with tasks

User: /gogogo
AI: Starts executing tasks...
    - Task 1: ✅ Done
    - Task 2: 🔄 In progress
    (pause work)

# Day 1 - Afternoon (resume)
User: /recap
AI: Shows current progress

User: /gogogo
AI: Continues from Task 2...
    - Task 2: ✅ Done
    - Task 3: ✅ Done

User: /rrr
AI: Creates retrospective
    → ψ/memory/retros/2026-01-03_retro.md

# Day 2 - New session
User: /ccc
AI: Creates context issue #11
    Compacts conversation

User: /nnn ทำ refresh token
AI: Creates new plan issue #12
    (References context #11)

... and so on
```

## Two-Issue Pattern

```
Context Issues (ccc)          Task Issues (nnn)
├── Keep session state        ├── Implementation plans
├── Decisions made            ├── Acceptance criteria
├── Files changed             ├── Task breakdown
├── Next steps                ├── Progress tracking
└── Conversation summary      └── Definition of done

Separation of Concerns:
- ccc = "Where are we?" (state)
- nnn = "What are we doing?" (plan)
```

## Best Practices

### 1. Always Start with Context
```
❌ /gogogo โดยไม่มี plan
✅ /nnn → /gogogo
```

### 2. Use /ccc Before Long Sessions
```
ถ้า session จะยาว:
/ccc ก่อน → save context
แล้วค่อย /gogogo
```

### 3. Always /rrr After Work
```
จบ session หรือ pause:
/rrr → capture learnings
```

### 4. Check Status with /lll
```
ไม่แน่ใจว่าทำอะไรอยู่:
/lll → see project status
```

### 5. Use /hours to Track Time
```
ตอนเริ่มงาน:
/hours start

ตอนจบงาน:
/hours end → สรุปชั่วโมง
```

## Quick Reference Card

```
┌─────────────────────────────────────────┐
│  Short Codes Workflow                   │
├─────────────────────────────────────────┤
│  nnn     →  Create plan                 │
│  gogogo  →  Execute plan                │
│  rrr     →  Review & learn              │
│  ccc     →  Save context                │
├─────────────────────────────────────────┤
│  lll     →  Project status              │
│  recap   →  Current focus               │
│  forward →  Save for next session       │
│  hours   →  Track work hours            │
│  trace   →  Search everything           │
└─────────────────────────────────────────┘
```

## Mental Model

```
        ┌───────────────────┐
        │   New Feature?    │
        └─────────┬─────────┘
                  │
          ┌───────▼───────┐
          │  /ccc (save)  │
          └───────┬───────┘
                  │
          ┌───────▼───────┐
          │  /nnn (plan)  │
          └───────┬───────┘
                  │
         ┌────────▼────────┐
         │  /gogogo (do)   │
         │  ─────────────  │
         │  execute tasks  │
         └────────┬────────┘
                  │
          ┌───────▼───────┐
          │  /rrr (learn) │
          └───────┬───────┘
                  │
            ┌─────▼─────┐
            │   Done!   │
            └───────────┘
```
