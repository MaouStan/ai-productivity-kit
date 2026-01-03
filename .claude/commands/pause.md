# /ai-kit:pause

**พักงานชั่วคราว**
*Pause current work session*

## ทำอะไร
- บันทึกสถานะปัจจุบัน
- เปลี่ยน state เป็น "paused"
- บันทึกว่าทำอะไรถึงไหนแล้ว
- เตรียม context สำหรับกลับมาทำต่อ

## Template
```markdown
STATE: paused
PAUSED_AT: {{timestamp}}
WAS_DOING: {{current task}}

## Progress
- {{สิ่งที่ทำไปแล้ว}}
- {{สิ่งที่กำลังทำอยู่}}

## Resume With
{{สิ่งที่ต้องทำต่อเมื่อกลับมา}}

## Context Files
{{files ที่เกี่ยวข้อง}}
```

## Example
```
User: /ai-kit:pause

AI:
⏸️ Session paused!

STATE: paused
PAUSED_AT: 15:45
WAS_DOING: แก้ bug login ที่หน้า admin

## Progress
- ✅ Investigated login flow
- ✅ Found issue: token not sent in headers
- 🔄 Fixing: add token to request headers

## Resume With
1. Complete header fix in admin-dashboard.js
2. Test login flow
3. Check error handling

## Context Files
- src/admin-dashboard.js (line 156)
- src/api/auth.js
- ψ/inbox/focus.md

See you later! กลับมาต่อแล้วใช้ /ai-kit:resume 👋
```
