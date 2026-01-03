# AI Prompting Guide

**เทคนิคการ prompt AI ให้ได้ผลลัพธ์ดี**

## สูตรการ prompt ที่ใช้ได้จริง

### Formula 1: ROLE + TASK + CONTEXT + CONSTRAINT

```
[ROLE] ทำตัวเป็น [บทบาท]
[TASK] ช่วย [งานที่ต้องการ]
[CONTEXT] ภาพรวมสถานการณ์
[CONSTRAINT] เงื่อนไข / ข้อจำกัด
[OUTPUT] รูปแบบผลลัพธ์ที่ต้องการ
```

ตัวอย่าง:
```
ทำตัวเป็น Python performance expert (ROLE)
ช่วย optimize ฟังก์ชัน process_data (TASK)
ตอนนี้ใช้เวลา 2 วินาทีสำหรับ 1M rows (CONTEXT)
ใช้แค่ standard library, ไม่ใช้ pandas/numpy (CONSTRAINT)
ต้องการ code พร้อม benchmark (OUTPUT)
```

### Formula 2: EXAMPLE-DRIVEN

```
แสดงตัวอย่าง Input/Output:
Input: [ตัวอย่าง input]
Output: [ตัวอย่าง output]

แล้วเขียนฟังก์ชันที่ทำแบบเดียวกัน
```

### Formula 3: STEP-BY-STEP

```
ทำ [task] โดยแบ่งเป็น step:
1. [step 1]
2. [step 2]
3. [step 3]

อธิบายทุก step ก่อนเขียน code
```

## Prompt Templates

### Template: Debug Request
```markdown
## Error
\`\`\`
[paste full error + stack trace]
\`\`\`

## Context
- กำลังทำอะไร: [action]
- ใช้ภาษา/เฟรมเวิร์ก: [tech]
- Code ที่เกี่ยวข้อง:
  - [file]:[line]
  - [file]:[line]

## คาถาม
ช่วยหาสาเหตุและแนะนำวิธีแก้
```

### Template: Code Review
```markdown
## Review Code
\`\`\`[language]
[paste code]
\`\`\`

## เน้นตรวจสอบ
- [ ] Security issues
- [ ] Performance
- [ ] Edge cases
- [ ] Code style

## Context
ฟังก์ชันนี้ทำ [purpose]
```

### Template: Feature Request
```markdown
## Feature
[feature name]

## Requirements
- [requirement 1]
- [requirement 2]

## Tech Stack
- Language: [language]
- Framework: [framework]

## Current Structure
- Main entry: [file]
- Related files: [files]

## Output
ต้องการ:
- [ ] Code changes
- [ ] Tests
- [ ] Documentation
```

## Prompt Tips by Language

### Python
```python
# ดี: ระบุ version และ style
"Python 3.12+, ใช้ type hints, ตาม PEP 8"

# Example
def process(items: list[Item]) -> dict[str, int]:
    """Process items and return counts."""
```

### JavaScript/TypeScript
```typescript
// ดี: ระบุ style และ patterns
"TypeScript, ใช้ ES6+, async/await, error handling ดีๆ"

// Example
interface User {
  id: string;
  name: string;
}

async function getUser(id: string): Promise<User> {
  // ...
}
```

### Rust
```rust
// ดี: ระบุ idiomatic patterns
"Idiomatic Rust, ใช้ ? operator, handle errors properly"

// Example
fn parse_input(input: &str) -> Result<Data, Error> {
    // ...
}
```

## Negative Prompts (อะไรที่ไม่ควร prompt)

❌ **Bad Prompts**:
- "แก้ให้หน่อย" (ไม่บอกว่าอะไร)
- "ทำให้ดีขึ้น" (ดีขึ้นอย่างไร?)
- "เขียนโค้ด" (โค้ดทำอะไร?)
- "Fix error" (error อะไร? อยู่ไหน?)

✅ **Fix with Context**:
- "แก้ bug ที่ src/auth.py:45 ที่ throw 404 เมื่อ user ไม่เจอ"
- "Optimize query ใน function get_user_data() ตอนนี้ใช้เวลา 500ms"
- "เขียน test สำหรับ login endpoint ต้อง cover ทั้ง success และ fail cases"

## Advanced Techniques

### 1. Chain of Thought
```
คิด step by step:
1. วิเคราะห์ปัญหา
2. หา solution ที่เป็นไปได้
3. เลือก solution ที่ดีที่สุด
4. implement
5. ทบทวน
```

### 2. Few-Shot Learning
```
ตัวอย่าง 1:
Input: "hello world"
Output: "HELLO WORLD"

ตัวอย่าง 2:
Input: "foo bar"
Output: "FOO BAR"

ตอนนี้:
Input: "test"
Output: ???
```

### 3. Self-Reflection
```
หลังจากตอบแล้ว:
- review คำตอบ
- ชี้ให้เห็นปัญหาที่อาจเกิด
- เสนอทางเลือก
```

### 4. Iterative Refinement
```
Round 1: [prompt 1]
→ [response]

Round 2: ปรับจาก response แรก ขอให้ [change]
→ [response]

Round 3: เพิ่ม [feature]
→ [final response]
```

## Quick Reference

| Goal | Prompt Starter |
|------|----------------|
| Debug | "Error ที่ [location]: [error]" |
| Explain | "อธิบาย code นี้: [code]" |
| Optimize | "Optimize [function] ตอนนี้ [problem]" |
| Test | "เขียน test สำหรับ [function] cover [cases]" |
| Refactor | "Refactor [code] ให้ [goal]" |
| Document | "เขียน docstring สำหรับ [function]" |
| Convert | "แปลง [language A] เป็น [language B]: [code]" |
| Compare | "เปรียบเทียบ [A] vs [B]" |

## Remember

> **"Garbage in, garbage out"**

Prompt ดี = Output ดี

- ให้ context พอสมควร
- ตัวอย่างช่วยได้เยอะ
- iterate จนได้ผล
- บันทึก prompt ดีๆ ไว้ใช้ซ้ำ
