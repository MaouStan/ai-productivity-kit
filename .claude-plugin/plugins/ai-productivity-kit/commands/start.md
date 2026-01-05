---
description: "คำสั่งเริ่ม session ทำงาน | Start a productive work session"
allowed-tools:
  - Read
  - Write
  - TodoWrite
  - Task
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
/ai-kit:init              # Initialize ψ/ structure + CLAUDE.md
```

## ทำอะไร
- ตรวจสอบ CLAUDE.md ถ้าไม่มีจะเสนอให้รัน team-configurator
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

## AI Instructions

เมื่อ user พิมพ์ `/ai-kit:start`:

1. **Check for CLAUDE.md**:
   - ใช้ `Read` tool อ่าน `CLAUDE.md` ที่ root ของ project
   - ถ้าไม่มี (file not found):
     - **AUTO-RUN team-configurator** without asking
     - Execute: `Task` tool with `subagent_type=team-configurator` and `prompt="Set up AI team configuration for this project"`
     - Wait for completion and verify CLAUDE.md was created
     - Then proceed with session

2. **Read current state**:
   - อ่าน `ψ/inbox/focus.md` ถ้ามี
   - อ่าน `ψ/inbox/WIP.md` ถ้ามี

3. **Show session summary**:
   - แสดง current focus จากไฟล์
   - แสดง pending tasks

4. **Ask for today's plan**:
   - ถาม user ว่าวันนี้จะทำอะไร
   - สร้าง todo list ด้วย `TodoWrite`

## CRITICAL: Auto-Run team-configurator

**When CLAUDE.md is missing, you MUST immediately execute**:

```
Task(
  subagent_type="team-configurator",
  prompt="Set up AI team configuration for this project. Detect tech stack, create CLAUDE.md with project-specific instructions.",
  model="sonnet"
)
```

**DO NOT ASK** - just run it automatically!

## Example

### Scenario 1: Normal session
```
User: /ai-kit:start

AI:
# Session Start
Time: 2026-01-03 10:30

## Current Status
From WIP.md: Working on JWT authentication system

## Focus
- [x] Design auth flow
- [ ] Implement JWT middleware
- [ ] Add login/logout endpoints

What's the plan for today?
```

### Scenario 2: No CLAUDE.md
```
User: /ai-kit:start

AI:
# Session Start
Checking project configuration...

⚠️ No CLAUDE.md found in project root.

CLAUDE.md helps Claude understand your project's tech stack, agents, and workflows.

Run team-configurator to auto-generate CLAUDE.md based on your codebase? [Y/n]

User: Y

AI: Running team-configurator agent...
[Analyzes codebase, detects tech stack, creates CLAUDE.md]
✅ CLAUDE.md created with project-specific configuration!
```

## Related Commands
- `/ai-kit:init` - Initialize ψ/ structure + CLAUDE.md (auto-runs team-configurator)
- `/ai-kit:focus` - Set focus for current task
- `/ai-kit:pause` - Pause work temporarily
- `/recap` - View current status
