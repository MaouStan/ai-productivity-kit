---
description: "🔮 Awaken the Oracle - Install commands and agents in your project"
allowed-tools:
  - Bash
  - Read
  - Write
---

# /ai-kit:recap

**Fresh Start - Restore Context from Previous Session**
*เริ่ม session ใหม่ ดูสถานะจาก WIP.md*

## ทำอะไร

**FIRST command after `/clear`** - Restores session context from WIP.md.

1. อ่าน `ψ/inbox/WIP.md` (จาก session ก่อนหน้า)
2. แสดง progress ล่าสุด
3. แสดง context ที่เกี่ยวข้อง
4. แนะนำ step ถัดไป

## Session Handoff Workflow

```
📤 END OF SESSION                   📥 START NEW SESSION
─────────────────────              ─────────────────────
/forward  → Save to WIP.md         /recap   → Read WIP.md
/clear    → Fresh start            ↓
                                  Continue where you left off
```

## Template
```markdown
📍 Current Focus (from WIP.md)

## Task
[จาก ψ/inbox/WIP.md]

## Progress
✅ [สิ่งที่ทำไปแล้ว]
🔄 [สิ่งที่กำลังทำ]
⏳ [สิ่งที่รอทำ]

## Next Steps
1. [step 1]
2. [step 2]

## Related Context
- [issues/PRs]
- [files]
```

## Example
```
User: /recap

AI:
📍 Restoring context from previous session...

Reading ψ/inbox/WIP.md...
✓ Found saved context

---

# Work In Progress

**Saved**: 2026-01-03 15:30
**Session**: JWT Auth Implementation

## Current Task
Implement JWT authentication with refresh tokens

## Progress
✅ Completed:
- User model updated with refresh_token column
- JWT middleware created
- Login endpoint implemented

🔄 In Progress:
- Refresh token endpoint (50% done)
- Need to add token validation

⏳ Pending:
- Token blacklist for logout
- Tests (0% coverage)
- API documentation

## Next Steps
1. Complete refresh endpoint validation
2. Implement /logout with blacklist
3. Write tests for auth flow

## Related Context
- Plan issue: #13
- Context issue: #12
- Files: src/api/auth.py, src/middleware/auth.py

---

Ready to continue? Use /gogogo or specify task.
```

## When to Use
- **FIRST after `/clear`** (restore context)
- เริ่ม session ใหม่
- หลังจากห่างไปนาน
- ลืมว่ากำลังทำอะไรอยู่
- ก่อนจะต่องาน

## Tips
- WIP.md สร้างโดย `/forward` ใน session ก่อนหน้า
- ถ้าไม่มี WIP.md จะอ่านจาก ψ/inbox/focus.md แทน
- ใช้ร่วมกับ `/ai-kit:start` เพื่อเริ่ม session เต็มรูปแบบ
