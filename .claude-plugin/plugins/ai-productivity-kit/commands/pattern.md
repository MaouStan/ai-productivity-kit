# /ai-kit:pattern

**บันทึก pattern ที่ใช้ซ้ำได้**
*Record reusable patterns*

## ทำอะไร
- สกัด pattern จากประสบการณ์
- บันทึกลง `ψ/memory/patterns/`
- จัดหมวดหมู่ตามประเภท

## Usage
```
/ai-kit:pattern [หมวดหมู่] [ชื่อ pattern]
```

## Categories
- **architecture** - รูปแบบสถาปัตยกรรม
- **workflow** - วิธีการทำงาน
- **ai-collaboration** - วิธีใช้ AI ร่วมงาน
- **problem-solving** - แนวทางแก้ปัญหา
- **code** - patterns ในโค้ด

## Template
```markdown
# Pattern: {{name}}

**Category**: {{category}}
**Date**: {{YYYY-MM-DD}}

## Context
{{เมื่อไหร่ต้องใช้}}

## The Pattern
1. Step 1
2. Step 2
3. Step 3

## Example
{{ตัวอย่างจริง}}

## Benefits
- {{benefit 1}}
- {{benefit 2}}

## Related
- {{related patterns}}
```

## Example
```
User: /ai-kit:pattern ai-collaboration ใช้ AI debug error

AI:
✅ Pattern saved to `ψ/memory/patterns/ai_debug_workflow.md`

# Pattern: AI Debug Workflow

**Category**: ai-collaboration
**Date**: 2026-01-03

## Context
เจอ error แล้วอยากให้ AI ช่วยหาสาเหตุ

## The Pattern
1. **Copy error message** ให้ครบถ้วน (stack trace ด้วย)
2. **Add context** - กำลังทำอะไรอยู่, code ที่เกี่ยวข้อง
3. **Share file structure** ให้ AI เห็นภาพรวม
4. **Ask for hypothesis** ไม่ใช่แค่ขอ solution
5. **Test fix** แล้วค่อย confirm

## Example
```
User: ช่วย debug หน่อย error: TypeError: Cannot read property 'x' of undefined

AI: เห็น error แล้ว แต่ขอ context หน่อย:
- บรรทัดไหนเกิด error?
- code ก่อนหน้าทำอะไรอยู่?
- object ที่เข้าถึง .x มาจากไหน?

User: [ให้ context ครบถ้วน]

AI: เจอสาเหตุแล้ว! ที่ line 42 คุณ access data.user.x
แต่ data.user อาจเป็น undefined...
```

## Benefits
- AI เข้าใจปัญหาเร็วขึ้น
- ได้ solution ที่ตรงประเด็น
- เรียนรู้วิธีแก้ไปด้วย

## Related
- /ai-kit:debug
- Error handling patterns
```
