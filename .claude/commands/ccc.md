---
description: "Create context issue and compact conversation to save tokens"
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# /ai-kit:ccc

**Create Context Issue + Compact Conversation**
*สร้าง context issue และย่อ conversation เพื่อ save tokens*

## ⚠️ NO CODE - CONTEXT SAVE ONLY
**This command does NOT write code.** It ONLY saves context to GitHub issues.
- ✅ Creates: GitHub context issues
- ❌ Does NOT: Write code, modify project files

## ทำอะไร
1. สร้าง GitHub issue เพื่อเก็บ session context
2. สรุป conversation ทั้งหมด
3. Compact conversation เพื่อประหยัด tokens
4. เก็บ decisions, files changed, next steps

## Template
```markdown
# Context: [Session Title]

**Date**: {{YYYY-MM-DD}}
**Time**: {{HH:mm}}
**Focus**: {{จาก ψ/inbox/focus.md}}

## Summary
{{สรุป session นี้}}

## Key Decisions
- {{decision 1}}
- {{decision 2}}

## Files Changed
{{git diff --name-only}}

## Next Steps
{{สิ่งที่ต้องทำต่อ}}

## Related Issues
- {{linked issues}}
```

## AI Instructions
เมื่อ user พิมพ์ `/ccc`:

1. **Read current context**:
   - `ψ/inbox/focus.md` - current task
   - Recent git commits
   - Recent conversation

2. **Create summary**:
   - What was discussed
   - Decisions made
   - Files modified
   - Next actions

3. **Create GitHub issue**:
   - Title: "Context: [session title]"
   - Labels: `context`
   - Body: template ข้างบน

4. **Suggest compact**:
   ```
   Created context issue #{{number}}
   Compact conversation? [y/n]
   ```

## Example
```
User: /ccc

AI:
# Creating Context Issue...

Reading context...
✓ Current focus: Implement JWT authentication
✓ Recent commits: 3 changes
✓ Session length: 45 minutes

✅ Created issue #12: "Context: JWT Auth Implementation"

---
# Context: JWT Auth Implementation

**Date**: 2026-01-03
**Focus**: Implement JWT authentication

## Summary
Implemented JWT-based authentication with refresh tokens.
Decided to use python-jose library for JWT handling.

## Key Decisions
- Use python-jose instead of PyJWT (easier API)
- Access tokens expire in 15 minutes
- Refresh tokens expire in 7 days
- Store tokens in httpOnly cookies

## Files Changed
- src/api/auth.py (new)
- src/middleware/auth.py (new)
- tests/test_auth.py (new)
- requirements.txt (+python-jose, passlib)

## Next Steps
- Add rate limiting to login endpoint
- Write integration tests
- Update API documentation

---

Compact conversation to save tokens? [y/n]
```

## When to Use
- ก่อน session ยาวๆ (save context ก่อน)
- ก่อน /clear (preserve for next session)
- Pause งานเพื่อกลับมาทำต่อ
- Tokens เหลือน้อย (compact)

## Tips
- `/ccc` ทำอัตโนมัติใน `/nnn` ถ้าไม่มี context issue
- Context issues มี label `context` เพื่อค้นหาง่าย
- ใช้ร่วมกับ `/ai-kit:forward` เพื่อ save to WIP.md
