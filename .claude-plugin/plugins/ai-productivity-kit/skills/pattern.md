# ai-kit:pattern

**Save reusable pattern**

## Description
บันทึก pattern ที่ใช้ซ้ำได้ ทั้งการเขียนโค้ดและ workflow

## Usage
```
/ai-kit:pattern [หมวดหมู่] [ชื่อ pattern]
```

## Categories
- **code** - patterns ในโค้ด
- **architecture** - รูปแบบสถาปัตยกรรม
- **workflow** - วิธีการทำงาน
- **ai-collaboration** - วิธีใช้ AI ร่วมงาน
- **problem-solving** - แนวทางแก้ปัญหา
- **debugging** - patterns การ debug

## Examples
```
/ai-kit:pattern code repository pattern
/ai-kit:pattern ai-collaboration debug workflow
/ai-kit:pattern architecture microservices setup
```

## Output
บันทึกลง `ψ/memory/patterns/[category]_[name].md`

Format:
```markdown
# Pattern: [name]

**Category**: [category]
**Date**: [date]

## Context
[เมื่อไหร่ต้องใช้]

## The Pattern
1. [step 1]
2. [step 2]
3. [step 3]

## Example
[ตัวอย่างจริง]

## Benefits
- [benefit 1]
- [benefit 2]

## Related Patterns
- [pattern 1]
- [pattern 2]
```
