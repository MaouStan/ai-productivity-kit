---
description: "บันทึก note ด่วน | Quick note capture"
allowed-tools:
  - Write
---

# /ai-kit:note

**บันทึก note ด่วน**
*Quick note capture*

## ทำอะไร
- สร้าง note ใหม่ใน `ψ/memory/logs/`
- ใส่ timestamp อัตโนมัติ
- แท็กตามหมวดหมู่ (ถ้าระบุ)

## Usage
```
/ai-kit:note [หมวดหมู่?] [ข้อความ]
```

## Template
```markdown
# Note: {{title}}

**Date**: {{YYYY-MM-DD}}
**Time**: {{HH:mm}}
**Tags**: {{tags}}

## Note
{{user_input}}

---
```

## Example
```
User: /ai-kit:note docker-compose volume path ต้องใช้ absolute path

AI:
✅ Note saved to `ψ/memory/logs/2026-01-03_note.md`

# Note: Docker Compose Volume Paths

**Date**: 2026-01-03
**Time**: 14:45
**Tags**: docker, troubleshooting

## Note
docker-compose volume path ต้องใช้ absolute path
ไม่สามารถใช้ relative path ได้ เพราะ mount จาก host

Example:
```yaml
volumes:
  - ./data:/app/data      # ❌ May not work
  - /full/path/to/data:/app/data  # ✅ Use absolute
```
```
