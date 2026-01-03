---
description: "Track Work Hours | สรุปชั่วโมงทำงานวันนี้ - start/end/week"
allowed-tools:
  - Read
  - Write
---

# /ai-kit:hours

**Track Work Hours**
*สรุปชั่วโมงทำงานวันนี้ - start/end/week*

## ทำอะไร
1. อ่าน work log จาก `ψ/memory/logs/work-YYYY-MM-DD.md`
2. สรุปชั่วโมงทำงาน
3. แยกเป็น session ต่างๆ

## Template
```markdown
🕐 ชั่วโมงทำงานวันนี้ (Work Hours Today)

**Date**: {{YYYY-MM-DD}}

## Sessions
### Session 1: {{HH:mm}} - {{HH:mm}} ({{hours}} hours)
{{tasks}}
Progress: {{summary}}

### Session 2: {{HH:mm}} - {{HH:mm}} ({{hours}} hours)
{{tasks}}
Progress: {{summary}}

## Total
📊 **{{total_hours}} hours**

## Breakdown
- Coding: {{hours}}h
- Debugging: {{hours}}h
- Meetings: {{hours}}h
- Documentation: {{hours}}h
```

## Usage
```
/hours           # แสดงชั่วโมงวันนี้
/hours start     # เริ่มจับเวลา session ใหม่
/hours end       # หยุดจับเวลา
/hours week      # สรุปทั้งสัปดาห์
```

## Example
```
User: /hours

AI:
🕐 ชั่วโมงทำงานวันนี้ (Work Hours Today)

**Date**: 2026-01-03

## Sessions
### Session 1: 09:00 - 12:00 (3 hours)
- Implement JWT middleware
- Create login endpoint
- Add password hashing
Progress: ✅ Auth endpoints complete

### Session 2: 13:00 - 15:30 (2.5 hours)
- Debug refresh token validation
- Fix token expiration bug
- Write unit tests
Progress: 🔄 Testing in progress

## Total
📊 **5.5 hours**

## Breakdown
- Coding: 3.5h
- Debugging: 1h
- Testing: 1h

---

Starting new session? /hours start
```

## Log Format (auto-created)
```markdown
# Work Log: 2026-01-03

## Session 1
**Start**: 09:00
**End**: 12:00
**Duration**: 3 hours

### Tasks
- Implement JWT middleware
- Create login endpoint
- Add password hashing

### Notes
- Used python-jose library
- Had to figure out cookie handling
```

## When to Use
- ตอนเริ่ม session (/hours start)
- ตอนจบ session (/hours end)
- อยากรู้ว่าทำงานกี่ชั่วโมงแล้ว
- ทำรายงาน/อ้างอิงชั่วโมง
