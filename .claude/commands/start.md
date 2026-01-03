---
description: "คำสั่งเริ่ม session ทำงาน | Start a productive work session"
allowed-tools:
  - Read
  - Write
  - TodoWrite
---

# /ai-kit:start

**คำสั่งเริ่ม session ทำงาน**
*Start a productive work session*

## First Time?

If this is your first time using the kit, run setup first:

```bash
# Option 1: Full setup (recommended)
/nat-agents-core:awaken   # Sets up agents/, CLAUDE.md, ψ/ structure

# Option 2: Quick setup
/ai-kit:init              # Initialize ψ/ structure only
```

## ทำอะไร
- แสดงสถานะปัจจุบัน (จาก `ψ/inbox/focus.md`)
- ถามหัวใจงานวันนี้
- สร้าง todo list ถ้ายังไม่มี
- เตรียม context ให้พร้อมทำงาน

## Template
```markdown
# Session Start
**Time**: {{timestamp}}
**Focus**: {{user_input}}

## Current Status
{{read ψ/inbox/focus.md if exists}}

## Today's Plan
{{ask user for tasks}}
```

## Example
```
User: /ai-kit:start ทำ authentication system

AI:
# Session Start
Time: 2026-01-03 10:30

## Focus: Authentication System

### Current State
- No active focus file

### Today's Tasks
1. Design auth flow
2. Implement JWT middleware
3. Add login/logout endpoints
4. Write tests

Let me know if you want to adjust this plan!
```

## Related Commands
- `/ai-kit:focus` - Set focus for current task
- `/ai-kit:pause` - Pause work temporarily
- `/recap` - View current status
