# /nnn

**New Plan - Create Implementation Plan**
*สร้างแผนงาน implementation*

## ทำอะไร
1. Auto-runs `/ccc` ถ้าไม่มี context issue ล่าสุด
2. อ่าน requirements/specs
3. สร้าง GitHub issue สำหรับ implementation plan
4. แบ่ง task เป็น step พร้อม acceptance criteria

## Template
```markdown
# Implementation Plan: [Feature Name]

## Overview
{{สรุป feature ที่จะทำ}}

## Tasks
- [ ] **Task 1**: [Description]
  - **Acceptance**: [criteria]
  - **Files**: [expected files]
  - **Estimate**: [time]

- [ ] **Task 2**: [Description]
  - **Acceptance**: [criteria]
  - **Files**: [expected files]
  - **Estimate**: [time]

- [ ] **Task 3**: [Description]
  - **Acceptance**: [criteria]
  - **Files**: [expected files]
  - **Estimate**: [time]

## Dependencies
- {{external dependencies}}
- {{related features}}

## Definition of Done
- [ ] All tasks complete
- [ ] Tests passing (coverage > 80%)
- [ ] Documentation updated
- [ ] Code reviewed

## Context Issue
- #{{context_issue_number}}
```

## AI Instructions
เมื่อ user พิมพ์ `/nnn [description]`:

1. **Check context**:
   - มี context issue ล่าสุดไหม?
   - ถ้าไม่มี → run `/ccc` ก่อน

2. **Ask for requirements** (ถ้าจำเป็น):
   ```
   What are the requirements?
   - Input format?
   - Output format?
   - Constraints?
   - Edge cases to handle?
   ```

3. **Create plan**:
   - Break down into tasks
   - Each task มี acceptance criteria
   - Order tasks ตาม dependencies

4. **Create GitHub issue**:
   - Title: "Plan: [feature name]"
   - Labels: `plan`, `implementation`
   - Link to context issue

## Example
```
User: /nnn ทำระบบ refresh token

AI:
# Creating Implementation Plan...

Checking context...
✓ Found context issue #12

Gathering requirements...
📝 Questions:
1. Refresh token ใช้ได้กี่วัน?
2. เก็บ token ที่ไหน (database/redis)?
3. มี blacklist token ไหม (logout)?

[User answers]

✅ Created issue #13: "Plan: Refresh Token System"

---
# Implementation Plan: Refresh Token System

## Overview
Add refresh token mechanism to existing JWT auth for better security.

## Tasks
- [ ] **Task 1**: Create refresh token model
  - **Acceptance**: User table has refresh_token column
  - **Files**: src/models/user.py
  - **Estimate**: 30 min

- [ ] **Task 2**: Implement token refresh endpoint
  - **Acceptance**: POST /refresh returns new access token
  - **Files**: src/api/auth.py
  - **Estimate**: 1 hour

- [ ] **Task 3**: Add token blacklist for logout
  - **Acceptance**: Logged out tokens cannot refresh
  - **Files**: src/api/auth.py, src/middleware/auth.py
  - **Estimate**: 45 min

- [ ] **Task 4**: Write tests
  - **Acceptance**: Coverage > 80% for new code
  - **Files**: tests/test_auth.py
  - **Estimate**: 45 min

## Definition of Done
- [ ] All tasks complete
- [ ] Tests passing
- [ ] API documentation updated

## Context Issue
- #12

---

Ready to execute? Use /gogogo
```

## When to Use
- เริ่ม feature ใหม่
- มี requirement ชัดเจน
- ต้องการ task breakdown
- ต้องการ track progress

## Tips
- `/nnn` จะ auto-run `/ccc` ถ้าไม่มี context
- Tasks ควรขนาด 1-2 ชั่วโมงต่อ task
- ใช้ acceptance criteria ชัดเจน
- Link ไป context issue เสมอ
