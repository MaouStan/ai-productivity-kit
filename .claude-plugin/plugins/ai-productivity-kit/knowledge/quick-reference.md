# Quick Reference - AI Productivity Kit

**คู่มืออ้างอิงด่วน - All Commands**

## Core Commands (Short Codes)

### The Development Loop
```
nnn → gogogo → rrr → ccc

nnn      →  New Plan (สร้างแผน)
gogogo   →  Execute Plan (ลงมือทำ)
rrr      →  Review Retro (ทบทวน)
ccc      →  Create Context (เก็บ context)
```

### All Commands

| Command | ทำอะไร | เมื่อไหร่ใช้ |
|---------|---------|---------------|
| **Setup** |||
| `/ai-kit:awaken` | Install all AI Kit components | เริ่มใช้งานครั้งแรก |
| `/ai-kit:init` | Create ψ/ directory structure | Setup โครงสร้าง |
| **Core** |||
| `/nnn` | สร้าง implementation plan | เริ่ม feature ใหม่ |
| `/gogogo` | Execute plan ล่าสุด | ลงมือทำตามแผน |
| `/rrr` | Session retrospective | จบ session/สรุป |
| `/ccc` | Save context + compact | ก่อน session ยาว |
| **Session** |||
| `/ai-kit:start` | เริ่ม session ใหม่ | เริ่มงานวันใหม่ |
| `/ai-kit:focus` | ตั้งโฟกัสงาน | เริ่ม task ใหม่ |
| `/ai-kit:pause` | พักงานชั่วคราว | จะพักก่อน |
| `/recap` | ดูสถานะปัจจุบัน | กลับมาทำต่อ |
| **Knowledge** |||
| `/ai-kit:note` | บันทึก note | เจออะไรน่าจด |
| `/ai-kit:trick` | บันทึก trick | เจอเทคนิคดีๆ |
| `/ai-kit:pattern` | บันทึก pattern | เจอ pattern ใช้ซ้ำได้ |
| `/ai-kit:learn` | Capture learning | สรุปสิ่งเรียนรู้ |
| **Code Quality** |||
| `/ai-kit:review` | Review code (diff/file) | ตรวจโค้ดก่อน commit |
| `/ai-kit:debug` | Debug error ด้วย AI | เจอ error ไม่หาย |
| **Project** |||
| `/lll` | Project status | ดูสถานะ project |
| `/hours` | Work hours | จับเวลา/ดูชั่วโมง |
| `/trace` | Search everything | หาไฟล์/ประวัติ |
| `/forward` | Save for next session | ก่อน /clear |
| **Tasks** |||
| `/ai-kit:breakdown` | แบ่ง task ใหญ่ | ได้งานใหญ่ๆ |
| `/ai-kit:delegate` | มอบหมายให้ agent | ใช้ agent ช่วย |

## Skills

| Skill | Action |
|-------|--------|
| `ai-kit:awaken` | Install all AI Kit components |
| `ai-kit:init` | Setup ψ/ structure |
| `ai-kit:learn` | Capture learning |
| `ai-kit:review` | Review code |
| `ai-kit:debug` | Debug errors |
| `ai-kit:delegate` | Assign to agent |
| `ai-kit:trick` | Save trick |
| `ai-kit:pattern` | Save pattern |

## Agent Selection

| ต้องการ | ใช้ agent |
|----------|-----------|
| เขียนโค้ด | `coder` |
| หาไฟล์/context | `context-finder` |
| Review code | `code-reviewer` |
| เขียน test | `test-writer` |
| Debug error | `debug-helper` |
| เขียน docs | `doc-writer` |
| Refactor code | `code-simplifier` |
| งานทั่วไป | `general-purpose` |

## ψ/ Directory

```
ψ/
├── active/       # งานที่กำลังทำ
├── inbox/        # focus.md, WIP.md
├── memory/
│   ├── tricks/       # เทคนิคโค้ด
│   ├── patterns/     # patterns ใช้ซ้ำได้
│   ├── retros/       # retrospective
│   └── logs/         # logs ประจำวัน
├── writing/      # งานเขียน
├── lab/          # ทดลองอะไรใหม่
├── incubate/     # งานที่กำลังพัฒนา
└── learn/        # วัสดุศึกษา
```

## Workflows

### First Time Setup
```
/ai-kit:awaken   →  Install all components
/ai-kit:start    →  Start new session
```

### Feature Development (Full Cycle)
```
/ai-kit:awaken  (first time only)
/ccc       →  Save context
/nnn       →  Create plan
/gogogo    →  Execute
/rrr       →  Review & learn
```

### Quick Task
```
/ai-kit:focus [task]
/ai-kit:delegate [work]
/rrr
```

### Debug Session
```
/ai-kit:debug [error message]
Review fix
/ai-kit:trick (ถ้าเรียนรู้อะไรใหม่)
```

### Code Review
```
git diff
/ai-kit:review
Fix issues
/ai-kit:delegate (ซ้ำถ้าจำเป็น)
```

### Session Handoff
```
/forward    →  Save to WIP.md
/clear      →  Fresh session
/recap      →  Resume from WIP
```

## Git Safety

❌ **ไม่ควรให้ AI ทำ**:
- `git push --force`
- `git reset --hard`
- `git clean -fd`
- `rm -rf`
- Push ไป main โดยตรง

✅ **ควรทำ**:
- Feature branches
- PR ก่อน merge
- Review diff ก่อน commit
- Ask ก่อน destructive actions

## Circuit Breaker (Ralph Pattern)

```python
# States: CLOSED → HALF_OPEN → OPEN
CLOSED      = ทำงานปกติ
HALF_OPEN   = ตรวจสอบก่อน
OPEN        = หยุด ต้อง reset

# Thresholds
- No progress: 3 loops
- Same error: 5 loops
- Output decline: 70%
```

## Exit Detection

```
✅ Strong Exit Signals:
- "All tasks completed"
- "Feature is ready"
- Consecutive "done" (2+ times)

❌ Should Halt:
- Same error 3+ times
- No file changes 5+ loops
- Stack traces repeating
```

## Status Report Format

```markdown
---STATUS---
STATUS: IN_PROGRESS | COMPLETE | BLOCKED
TASKS_COMPLETED_THIS_LOOP: <number>
FILES_MODIFIED: <number>
TESTS_STATUS: PASSING | FAILING
WORK_TYPE: IMPLEMENTATION | TESTING
EXIT_SIGNAL: true | false
RECOMMENDATION: <summary>
---END_STATUS---
```

## Prompt Templates

### Debug
```
Error: [paste error]
At: [file]:[line]
Context: [กำลังทำอะไร]
```

### Feature
```
ต้องการ [feature]
Input: [format]
Output: [format]
Constraints: [constraints]
```

### Review
```
Review code:
[code]

Check:
- [ ] Security
- [ ] Performance
- [ ] Edge cases
```

## Best Practices Quick Tips

| Tip | Do |
|-----|-----|
| Context | ให้ context พอสมควร |
| Specific | เป็น specific เท่าที่เป็นไปได้ |
| Confirm | ยืนยันก่อน destructive actions |
| Iterate | ทำทีละน้อย ทดสอบบ่อยๆ |
| Document | บันทึกสิ่งที่เรียนรู้ |
| Test | เชื่อ AI แต่ต้อง test เอง |
| Retro | จบ session ด้วย /rrr |

## Emergency Commands

| Situation | Command |
|-----------|---------|
| หลงไฟล์ | `/trace [query]` |
| งานใหญ่เกินไป | `/ai-kit:breakdown [task]` |
| เจอ error | `/ai-kit:debug [error]` |
| ตรวจโค้ด | `/ai-kit:review` |
| ไม่รู้ทำต่อ | `/recap` |
| ต้องพัก | `/ai-kit:pause` |
| ดูสถานะ | `/lll` |
| หาประวัติ | `/trace [query] --history` |

## Ralph Integration

```bash
# Autonomous development loop
ralph --monitor    # Start with dashboard
ralph --status     # Check status
ralph --reset-circuit  # Reset breaker

# Spec-driven development
/constitution → /specify → /plan → /tasks → /implement
```

## All Commands Summary

**Setup**: awaken, init
**Planning**: nnn, breakdown, specify, plan
**Execution**: gogogo, implement, delegate
**Review**: rrr, review, debug, ll
**Context**: ccc, recap, forward, trace
**Session**: start, focus, pause, hours
**Knowledge**: note, trick, pattern, learn

---

**แค่จำพื้นฐานนิดหน่อย ก็เริ่มใช้ได้เลย! 🚀**
