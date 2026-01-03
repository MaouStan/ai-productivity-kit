# /ai-kit:recap

**Fresh Start - Current Context Summary**
*เริ่ม session ใหม่ ดูสถานะปัจจุบันจาก WIP.md*

## ทำอะไร
1. อ่าน `ψ/inbox/focus.md`
2. แสดง progress ล่าสุด
3. แสดง context ที่เกี่ยวข้อง
4. แนะนำ step ถัดไป

## Template
```markdown
📍 Current Focus

## Task
[จาก ψ/inbox/focus.md]

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
📍 Current Focus

## Task
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

Ready to continue? Use /gogogo or specify task.
```

## When to Use
- เริ่ม session ใหม่
- หลังจากห่างไปนาน
- ลืมว่ากำลังทำอะไรอยู่
- ก่อนจะต่องาน
