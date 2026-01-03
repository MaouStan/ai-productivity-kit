# ai-kit:trick

**Save programming trick**

## Description
บันทึกเทคนิคโค้ดดีๆ ที่เจอ ไว้ใช้ซ้ำ

## Usage
```
/ai-kit:trick [ภาษา/เฟรมเวิร์ก] [เทคนิค]
```

## Examples
```
/ai-kit:trick python list comprehension
/ai-kit:trick javascript optional chaining
/ai-kit:trick docker volume mount
/ai-kit:trick git rebase interactive
```

## Output
บันทึกลง `ψ/memory/tricks/[lang]_[name].md`

Format:
```markdown
# Trick: [name]

**Language**: [lang]
**Date**: [date]

## Description
[อธิบายเทคนิค]

## Code Example
\`\`\`[lang]
[before] → [after]
\`\`\`

## When to Use
- [case 1]
- [case 2]

## Why It Works
[อธิบายว่าทำไมดีกว่า]
```
