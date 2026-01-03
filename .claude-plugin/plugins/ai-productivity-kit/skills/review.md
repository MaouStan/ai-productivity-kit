# ai-kit:review

**Code review with AI**

## Description
ให้ AI review code ที่เปลี่ยนแปลง หรือไฟล์ที่ระบุ

## What It Does
1. อ่าน git diff หรือ file ที่ระบุ
2. Review ตามมาตรฐาน:
   - Security issues
   - Performance concerns
   - Edge cases
   - Code style
   - Best practices
3. แจ้ง issue พร้อม severity tag
4. เสนอวิธีแก้

## Usage
```
/ai-kit:review                    # Review unstaged changes
/ai-kit:review [file]             # Review specific file
/ai-kit:review --staged           # Review staged changes
/ai-kit:review --all              # Review all changes
```

## Output Format
```
# Code Review

## ✅ What Looks Good
- [good things]

## ⚠️ Issues Found

### High Priority
1. **[Issue]** at [file]:[line]
   - Problem: [description]
   - Fix: [suggestion]

### Medium Priority
...

### Low Priority
...
```
