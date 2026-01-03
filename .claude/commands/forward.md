# /ai-kit:forward

**Forward Context to Next Session**
*ส่ง context ไป session ถัดไป ก่อนใช้ /clear*

## ทำอะไร
1. อ่าน context ปัจจุบันทั้งหมด
2. สร้าง `ψ/inbox/WIP.md`
3. เก็บ:
   - Current task
   - Progress
   - Next steps
   - Important context
4. พร้อมใช้ `/clear` แล้วเริ่มใหม่

## Template (WIP.md)
```markdown
# Work In Progress

**Saved**: {{timestamp}}
**Session**: {{session summary}}

## Current Task
{{จาก ψ/inbox/focus.md}}

## Progress
✅ {{completed}}
🔄 {{in progress}}

## Next Steps
1. {{next 1}}
2. {{next 2}}

## Important Context
- {{context 1}}
- {{context 2}}

## Files to Remember
- {{file 1}} - {{note}}
- {{file 2}} - {{note}}
```

## Example
```
User: /forward

AI:
📤 Forwarding context to next session...

Reading current state...
✓ Found focus.md
✓ Recent commits: 3
✓ Recent issues: 2

✅ Saved to ψ/inbox/WIP.md

---
# Work In Progress

**Saved**: 2026-01-03 15:30
**Session**: JWT Auth Implementation

## Current Task
Implement JWT authentication with refresh tokens

## Progress
✅ Completed:
- User model updated
- JWT middleware created
- Login endpoint done

🔄 In Progress:
- Refresh token endpoint (50%)

## Next Steps
1. Complete refresh validation
2. Implement logout blacklist
3. Write tests

## Important Context
- Using python-jose library
- Access token: 15 min, Refresh: 7 days
- Store in httpOnly cookies

## Files to Remember
- src/api/auth.py - Main auth logic
- src/middleware/auth.py - JWT verification
- tests/test_auth.py - Need to add tests

---

You can now:
1. /clear → start fresh session
2. Next session reads WIP.md → continues work
```

## When to Use
- ก่อน `/clear` (preserve context)
- สลับ project
- จบ session แต่ยังไม่เสร็จ
- ก่อนออกจากงาน

## Tips
- WIP.md ถูกอ่านอัตโนมัติเมื่อใช้ `/recap`
- ใช้ร่วมกับ `/ccc` เพื่อเก็บ context ครบ
- ลบ WIP.md หลังจากทำเสร็จ
