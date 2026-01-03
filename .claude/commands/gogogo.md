---
description: "🔮 Awaken the Oracle - Install commands and agents in your project"
allowed-tools:
  - Bash
  - Read
  - Write
---

# /ai-kit:gogogo

**Execute Most Recent Plan**
*ลงมือทำตามแผนล่าสุด - check context ก่อน execute*

## Description
Execute tasks from the most recent plan issue. Automatically checks if current context is sufficient, and handles context preservation if needed.

## ทำอะไร
1. **Check context** - run `/ai-kit:now` to verify current understanding
2. If context insufficient → suggest `/ai-kit:summary`, `/ai-kit:forward`, or `/ai-kit:rrr` then `/clear` + `/ai-kit:recap`
3. If context OK → find plan issue ล่าสุด
4. Execute ทีละ task ตามลำดับ
5. อัปเดต progress ใน issue
6. ทำจนครบทุก task หรือ user หยุด

## Context Check Flow

ก่อนเริ่ม execute ทุกครั้ง:

1. **Run `/ai-kit:now`** (internal check):
   - อ่าน `ψ/inbox/WIP.md` ถ้ามี
   - อ่าน `ψ/inbox/focus.md` ถ้ามี
   - เช็ค recent commits
   - เช็ค recent issues

2. **Evaluate context sufficiency**:
   ```
   Context sufficient if:
   - WIP.md exists OR focus.md exists
   - Last commit < 4 hours ago
   - Plan issue exists with `plan` label
   ```

3. **Handle insufficient context**:
   ```
   Context appears stale. Recommend:
   1. /ai-kit:summary - Quick session summary
   2. /ai-kit:forward - Save to WIP.md
   3. /ai-kit:rrr - Full retrospective
   4. /clear - Start fresh
   5. /ai-kit:recap - Reload from WIP.md

   Which to use? [1-5 or 'skip' to continue anyway]
   ```

## AI Instructions
เมื่อ user พิมพ์ `/ai-kit:gogogo`:

### Phase 1: Context Check (ALWAYS)

```bash
# Check context files
cat ψ/inbox/WIP.md 2>/dev/null || echo "No WIP.md"
cat ψ/inbox/focus.md 2>/dev/null || echo "No focus.md"

# Check git activity
git log -1 --format="%h %ar %s"
git log --since="4 hours ago" --oneline | wc -l

# Check plan issues
gh issue list --label plan --limit 1
```

### Phase 2: Decision Tree

```
IF WIP.md exists AND recent_commits > 0:
    → Context looks good, proceed
ELSE IF last_commit > 4 hours ago:
    → Ask user: "Context seems stale. Want to recap first?"
    → Options: /ai-kit:recap, /ai-kit:summary, /ai-kit:forward, continue
ELSE IF no plan issue found:
    → Error: "No plan issue found. Create one with /ai-kit:nnn"
ELSE:
    → Proceed with execution
```

### Phase 3: Execute Plan (if context OK)

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
User: /ai-kit:gogogo

AI:
# Context Check

Checking current state...
✓ Found WIP.md (updated 2 hours ago)
✓ Recent commits: 3 changes
✓ Plan issue #13 exists

Context looks good! Proceeding...

---
# Executing Plan: Refresh Token System

Found plan issue #13

## 📋 Tasks Overview
- [x] Task 1: Create refresh token model
- [ ] Task 2: Implement token refresh endpoint
- [ ] Task 3: Add token blacklist for logout
- [ ] Task 4: Write tests

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

Updating issue #13...

---
## Task 3: Add token blacklist for logout

[Continue...]

---
## All Tasks Complete! 🎉

Plan issue #13 updated.

Next: /ai-kit:rrr to capture learnings?
```

## Example: Context Insufficient
```
User: /ai-kit:gogogo

AI:
# Context Check

Checking current state...
✗ No WIP.md found
✗ Last commit was 2 days ago
⚠️ Context appears stale!

## Recommended Actions:

1. **/ai-kit:summary** - Quick summary of current state
2. **/ai-kit:forward** - Save context to WIP.md before clearing
3. **/ai-kit:rrr** - Full retrospective with learnings
4. **/clear** - Start fresh session
5. **/ai-kit:recap** - Reload from existing WIP.md

Which action? [1-5] or 'continue' to proceed anyway
```

## Controls During Execution

```
User: stop
AI: Pausing after current task...
     Progress saved to issue.
     Resume with /ai-kit:gogogo

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
- มี plan จาก `/ai-kit:nnn` แล้ว
- ต้องการลงมือทำ
- ต้องการ AI ทำต่อเนื่อง
- Task ชัดเจน ไม่ต้อง research

## Tips
- `/ai-kit:gogogo` always checks context first
- จะ stop/ตอบรับคำสั่งระหว่างทำ
- ถ้างง → ถามก่อนทำ
- เมื่อ complete → ใช้ `/ai-kit:rrr` สรุป
- Context check ป้องกันทำงานผิดจาก session เก่า

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
