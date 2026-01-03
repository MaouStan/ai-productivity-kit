# /ai-kit:rrr

**Retro-Reflect-Review - ทบทวนงานที่ทำไป**
*Session retrospective*

## ทำอะไร
- สรุปสิ่งที่ทำใน session
- บันทึกสิ่งที่เรียนรู้
- ระบุสิ่งที่ทำได้ดี/ควรปรับปรุง
- สกัด patterns และ tricks

## Template
```markdown
# Retrospective: {{title}}

**Date**: {{YYYY-MM-DD}}
**Time**: {{start}} - {{end}}
**Duration**: {{hours}}

## What We Did
{{สรุปงานที่ทำ}}

## What We Learned
- {{learning 1}}
- {{learning 2}}

## What Went Well
✅ {{สิ่งที่ดี}}

## What Could Be Better
⚠️ {{สิ่งที่ควรปรับปรุง}}

## Next Steps
- [ ] {{next 1}}
- [ ] {{next 2}}

## Patterns Discovered
{{patterns ที่เจอ}}

## Tags
`{{tag1}}` `{{tag2}}`
```

## AI Instructions
เมื่อ user พิมพ์ `/ai-kit:rrr`:

1. **อ่าน context** จาก:
   - `ψ/inbox/focus.md` - งานที่ทำอยู่
   - git log -10 --oneline - commits ล่าสุด
   - Todo list ปัจจุบัน

2. **ถาม user** (ถ้า context ไม่ชัดเจน):
   - ทำอะไรมาบ้างใน session นี้?
   - มีอะไรเรียนรู้ใหม่?
   - มี trick หรือ pattern ดีๆ ไหม?

3. **สร้าง retrospective** และบันทึกลง:
   - `ψ/memory/retros/{{YYYY-MM-DD}}_retro.md`

4. **สกัด learnings** แยกไฟล์ถ้ามีประโยชน์:
   - → `ψ/memory/learnings/{{YYYY-MM-DD}}_learning.md`

## Example
```
User: /ai-kit:rrr

AI:
# Retrospective: Auth System Implementation

**Date**: 2026-01-03
**Time**: 10:00 - 15:30
**Duration**: 5.5 hours

## What We Did
- ✅ Designed JWT authentication flow
- ✅ Implemented login/logout endpoints
- ✅ Added middleware for protected routes
- ✅ Wrote unit tests (80% coverage)

## What We Learned
- Python `python-jose` library is easier than PyJWT for JWT
- Docker volume paths must be absolute (saved to tricks!)
- Multi-agent setup helps: one agent writes code, one writes tests

## What Went Well
✅ Using /ai-kit:delegate helped write tests in parallel
✅ Focus file kept us on track
✅ Session planning at start helped estimate time well

## What Could Be Better
⚠️ Should have checked docker-compose volume docs first (lost 30 min)
⚠️ Test writing took longer than expected
⚠️ Need better error messages for auth failures

## Next Steps
- [ ] Add refresh token flow
- [ ] Write integration tests
- [ ] Document API endpoints
- [ ] Add rate limiting

## Patterns Discovered
→ Saved to `ψ/memory/patterns/parallel_testing_agent.md`

## Tags
`authentication` `jwt` `python` `multi-agent`

---✅ Retro saved to ψ/memory/retros/2026-01-03_retro.md
```
