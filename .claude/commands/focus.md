# /ai-kit:focus

**ตั้งค่าโฟกัสงานปัจจุบัน**
*Set current task focus*

## ทำอะไร
- บันทึกงานที่กำลังทำลง `ψ/inbox/focus.md`
- อัปเดต state เป็น "working"
- แสดง todo list ปัจจุบัน

## Template
```markdown
STATE: working
TASK: {{user_input}}
SINCE: {{timestamp}}

## Context
{{ask: มี context อะไรเพิ่มเติมไหม?}}
```

## Example
```
User: /ai-kit:focus แก้ bug login ที่หน้า admin

AI:
✅ Focus saved!

STATE: working
TASK: แก้ bug login ที่หน้า admin
SINCE: 14:30

## Current Todos
- [ ] Investigate login flow
- [ ] Check auth tokens
- [ ] Fix the bug
- [ ] Test on admin page
```
