# /gogogo

**Execute Most Recent Plan**
*ลงมือทำตามแผนล่าสุด*

## ทำอะไร
1. หา plan issue ล่าสุด
2. อ่าน tasks ทั้งหมด
3. Execute ทีละ task ตามลำดับ
4. อัปเดต progress ใน issue
5. ทำจนครบทุก task หรือ user หยุด

## AI Instructions
เมื่อ user พิมพ์ `/gogogo`:

1. **Find plan issue**:
   ```bash
   gh issue list --label plan --limit 1
   ```

2. **Read tasks**:
   - Parse tasks from plan
   - Check which are done
   - Identify next task

3. **Execute task**:
   - Read task description
   - Implement solution
   - Test if possible
   - Update issue

4. **Repeat**:
   - Move to next task
   - Ask before destructive actions
   - Report progress

5. **Complete**:
   - When all tasks done
   - Or user stops with "stop"

## Template (Progress Update)
```markdown
## Progress Update

### ✅ Completed
- Task 1: [name]

### 🔄 In Progress
- Task 2: [name]
  - Status: [what's happening]
  - Next: [next step]

### ⏳ Pending
- Task 3: [name]
- Task 4: [name]
```

## Example
```
User: /gogogo

AI:
# Executing Plan: Refresh Token System

Found plan issue #13

## 📋 Tasks Overview
- [ ] Task 1: Create refresh token model
- [ ] Task 2: Implement token refresh endpoint
- [ ] Task 3: Add token blacklist for logout
- [ ] Task 4: Write tests

---
## Task 1: Create refresh token model

Reading user model...
Found: src/models/user.py

Adding refresh_token column...
```sql
ALTER TABLE users ADD COLUMN refresh_token TEXT;
```

✅ Task 1 complete!

Updating issue #13...

---
## Task 2: Implement token refresh endpoint

Creating endpoint: POST /api/auth/refresh

[src/api/auth.py]
```python
@app.post("/refresh")
async def refresh_token(request: RefreshRequest):
    # Verify refresh token
    # Generate new access token
    # Return new token
    ...
```

✅ Task 2 complete!

[Continue...]

---
## All Tasks Complete! 🎉

Plan issue #13 updated.

Next: /rrr to capture learnings?
```

## Controls During Execution

```
User: stop
AI: Pausing after current task...
     Progress saved to issue.
     Resume with /gogogo

User: skip
AI: Skipping current task...
     Moving to next task.

User: status
AI: ## Current Status
     - Completed: 2/4 tasks
     - In progress: Task 3
     - Time elapsed: 45 min

User: focus [task number]
AI: Switching to Task [number]...
```

## When to Use
- มี plan จาก `/nnn` แล้ว
- ต้องการลงมือทำ
- ต้องการ AI ทำต่อเนื่อง
- Task ชัดเจน ไม่ต้อง research

## Tips
- `/gogogo` ทำงานทีละ task อย่างมีสมาธิ
- จะ stop/ตอบรับคำสั่งระหว่างทำ
- ถ้างง → ถามก่อนทำ
- เมื่อ complete → ใช้ `/rrr` สรุป

## Safety Checks

ก่อนทำ action เหล่านี้จะถามก่อน:
- ลบไฟล์
- git push
- แก้ไขหลายไฟล์พร้อมกัน
- Run commands อันตราย

```
AI: About to delete src/old_auth.py
     OK to proceed? [y/n/skip]
```
