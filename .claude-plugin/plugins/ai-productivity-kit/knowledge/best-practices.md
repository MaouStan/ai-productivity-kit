# Best Practices: การทำงานกับ AI อย่างมีประสิทธิภาพ

**Productivity Best Practices for AI-Assisted Programming**

## หลักการพื้นฐาน (Core Principles)

### 1. Context คือ king 👑

**Give AI enough context to understand:**
- ทำอะไรอยู่? (What are you doing?)
- ทำไมต้องทำ? (Why?)
- มี constraint อะไรไหม? (Any constraints?)
- code ที่เกี่ยวข้อง (Related code)

❌ **Bad**: "แก้ bug หน่อย"
✅ **Good**: "ช่วย debug หน่อย ตอน login แล้ว error 404 ที่ /api/auth/login ใน FastAPI"

### 2. เป็น specific เท่าที่จะเป็นไปได้ 🎯

❌ **Bad**: "ทำให้เร็วขึ้น"
✅ **Good**: "Optimize query ที่ src/db/queries.py:35 ตอนนี้ใช้เวลา 2 วินาที"

### 3. ยืนยันก่อน execute ✅

สำหรับ operations ที่:
- ลบไฟล์/โฟลเดอร์
- แก้ไขหลายไฟล์
- git push/force/merge
- รันคำสั่งพวก npm install, pip install

**ให้ AI อธิบายแผนก่อน แล้วค่อย approve**

### 4. Iterate เล็กๆ 🔄

แบ่ง task ใหญ่เป็น:
- Task ที่ทำใน 15-30 นาที
- Commit บ่อยๆ
- Test ทีละส่วน
- แก้ bug ตอนเจอ

## Workflows ที่แนะนำ

### Workflow 1: Feature Development
```
1. /ai-kit:breakdown → แบ่ง task
2. /ai-kit:focus → ตั้งโฟกัส
3. /ai-kit:delegate → มอบหมายงาน
4. Test และ verify
5. /ai-kit:rrr → สรุป
```

### Workflow 2: Debug Session
```
1. Copy error ทั้งหมด (stack trace ด้วย)
2. บอก context: กำลังทำอะไรอยู่
3. /ai-kit:delegate debug-helper
4. Review hypothesis
5. Test fix
6. /ai-kit:trick → บันทึกสิ่งที่เรียนรู้
```

### Workflow 3: Code Review
```
1. git diff → ดูการเปลี่ยนแปลง
2. /ai-kit:delegate review
3. อ่าน feedback
4. Fix issues
5. Ask AI to re-review if needed
```

### Workflow 4: Learning New Codebase
```
1. /ai-kit:delegate context-finder "หา X ที่ไหน"
2. Read ไฟล์ที่เกี่ยวข้อง
3. Ask AI อธิบายส่วนที่ไม่เข้าใจ
4. /ai-kit:note → บันทึกความเข้าใจ
```

## Prompting Patterns

### Pattern 1: Role + Task + Context
```
[Role] ทำตัวเป็น [expert type]
[Task] ช่วย [action]
[Context] กำลัง [situation]
[Output] ต้องการ [format]
```

ตัวอย่าง:
```
ทำตัวเป็น Python performance expert
ช่วย optimize ฟังก์ชันนี้
กำลังทำ data processing ขนาด 1M rows
ต้องการ code ที่เร็วขึ้น อย่าใช้ external library
```

### Pattern 2: Example-Driven
```
เขียน function ที่ทำงานแบบเดียวกับนี้:

Input: "example"
Output: "expected"

แต่ให้รองรับ [other cases]
```

### Pattern 3: Step-by-Step
```
ช่วย [task] โดย:
1. อธิบายแผนก่อน
2. เขียน code
3. อธิบายว่าทำไมทำแบบนี้
```

## Git Safety Rules

⚠️ **CRITICAL** - AI ไม่ควรทำเหล่านี้โดยอัตโนมัติ:

| Command | Why |
|---------|-----|
| `git push --force` | อาจ lose data |
| `git reset --hard` | อาศัยลบ commits |
| `git clean -fd` | ลบ files |
| `rm -rf` | อันตราย |
| Push to main | ควรใช้ PR |

✅ **Always**:
- Review diff ก่อน commit
- Use feature branches
- Create PRs ก่อน merge
- Ask user ก่อน destructive actions

## Common Pitfalls

### Pitfall 1: Trusting AI blindly
❌ AI บอกว่า code ผ่านแล้ว
✅ Run tests เอง

### Pitfall 2: Vague requirements
❌ "ทำหน้า login สวยๆ"
✅ "หน้า login แบบ minimalist, มี email/password, validation"

### Pitfall 3: Skipping testing
❌ AI เขียน code เสร็จ เอาไปใช้เลย
✅ Test ก่อน deploy

### Pitfall 4: Not documenting
❌ Code ทำงานได้ แต่ไม่รู้ทำไม
✅ AI ให้ comment เยอะๆ เลย

## Tips for Maximum Productivity

| Tip | Why |
|-----|-----|
| Start session with `/ai-kit:start` | Set clear goals |
| Use `/ai-kit:focus` บ่อยๆ | Track progress |
| Save tricks ด้วย `/ai-kit:trick` | Reusable knowledge |
| End with `/ai-kit:rrr` | Continuous learning |
| Use agents via `/ai-kit:delegate` | Parallel work |
| Keep ψ/ structure organized | Easy to find later |

## เมื่อ AI ตอบผิด/ไม่เข้าใจ

1. **ให้ context เพิ่ม**
   - "อธิบายเพิ่ม: [details]"

2. **ให้ตัวอย่าง**
   - "ตัวอย่างเช่น: [example]"

3. **ขอให้ rephrase**
   - "อธิบายแบบอื่นได้ไหม?"

4. **Break down**
   - "ทำเป็น step ๆ ได้ไหม?"

5. **Ask for reasoning**
   - "ทำไมต้องทำแบบนี้?"
