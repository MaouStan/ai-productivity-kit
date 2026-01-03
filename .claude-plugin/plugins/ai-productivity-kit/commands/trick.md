---
description: "บันทึกเทคนิคโค้ดดีๆ | Save useful code tricks"
allowed-tools:
  - Write
---

# /ai-kit:trick

**บันทึกเทคนิคโค้ดดีๆ**
*Save useful code tricks*

## ทำอะไร
- บันทึก trick ลง `ψ/memory/tricks/`
- จัดหมวดหมู่ตามภาษา/เฟรมเวิร์ก
- ใส่ตัวอย่างโค้ด

## Usage
```
/ai-kit:trick [ภาษา/เฟรมเวิร์ก] [เทคนิค]
```

## Template
```markdown
# Trick: {{title}}

**Language**: {{language}}
**Date**: {{YYYY-MM-DD}}

## The Trick
{{description}}

## Code Example
\`\`\`{{language}}
{{code}}
\`\`\`

## When to Use
{{use_cases}}

## Why It Works
{{explanation}}
```

## Example
```
User: /ai-kit:trick python List comprehension แทน for loop ง่ายๆ

AI:
✅ Trick saved to `ψ/memory/tricks/python_list_comprehension.md`

# Trick: List Comprehension

**Language**: Python
**Date**: 2026-01-03

## The Trick
ใช้ list comprehension แทน for loop + append แบบเดิม

## Code Example
```python
# ❌ Old way
result = []
for x in range(10):
    if x % 2 == 0:
        result.append(x * 2)

# ✅ List comprehension
result = [x * 2 for x in range(10) if x % 2 == 0]
```

## When to Use
- Transform ข้อมูลจาก list เดิม
- Filter ข้อมูล
- Map + reduce แบบง่าย

## Why It Works
- Python built-in ที่ optimize มาแล้ว
- Code สั้น อ่านง่าย
- Performance ดีกว่า for loop แบบเดิม
```
