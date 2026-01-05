---
description: "Create implementation plan with GitHub issue integration"
allowed-tools:
  - AskUserQuestion
  - Bash
  - Read
  - Write
  - Task
---

# /nnn

**New Plan - Create Implementation Plan**
*สร้างแผนงาน implementation พร้อม task breakdown*

## ⚠️ NO CODE - PLAN ONLY
**This command does NOT write code.** It ONLY creates plans and GitHub issues.
- ✅ Creates: GitHub issues, task breakdowns, todo lists
- ❌ Does NOT: Write code, modify files, execute changes
- Use `/gogogo` to execute the plan

## Description

Analyzes requirements and creates a GitHub issue with full implementation plan. First command in the workflow chain.

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Analyze requirements** - Read user input and ask clarifying questions
2. **Create GitHub issue** - Issue with full plan, tasks, acceptance criteria
3. **Save plan locally** - Store in `ψ/inbox/plan-*.md`
4. **Link to context** - Reference WIP.md if exists

## Template (GitHub Issue)
```markdown
# Implementation Plan: [Feature Name]

## Overview
{{สรุป feature ที่จะทำ}}

## Tasks
- [ ] **Task 1**: [Description]
  - **Agent**: [coder|test-writer|doc-writer|debug-helper]
  - **Parallel**: [true|false]
  - **Acceptance**: [criteria]
  - **Files**: [expected files]
  - **Priority**: [high|medium|low]

- [ ] **Task 2**: [Description]
  - **Agent**: [agent type]
  - **Parallel**: [true|false]
  - **Acceptance**: [criteria]
  - **Files**: [expected files]
  - **Priority**: [high|medium|low]

## Dependencies
- Task 2 → Task 1 (sequential)
- Task 3, Task 4 → can run in parallel

## Definition of Done
- [ ] All tasks complete
- [ ] Tests passing (coverage > 80%)
- [ ] Documentation updated
- [ ] Issue closed

## Context
- **Created**: {{timestamp}}
- **WIP**: {{link to WIP.md if exists}}
- **Parent Issue**: #{{parent if any}}
```

## AI Instructions

เมื่อ user พิมพ์ `/nnn [description]`:

### Step 1: Check Existing Context
```bash
# Check for existing plan
gh issue list --label plan --limit 1

# Check WIP
cat ψ/inbox/WIP.md 2>/dev/null || echo "No WIP.md"
cat ψ/inbox/focus.md 2>/dev/null || echo "No focus.md"
```

### Step 2: Ask Requirements (if needed)
```
📝 Clarifying Questions:
1. What is the main goal?
2. Any constraints/requirements?
3. Tech stack/framework?
4. Edge cases to handle?
```

### Step 3: Create Plan with Tasks

Break down into tasks with:
- **Agent type**: Who should do this task
- **Parallel**: Can this run alongside other tasks?
- **Acceptance**: Clear done criteria
- **Priority**: high/medium/low

### Step 4: Create GitHub Issue

```bash
# Create issue via gh CLI
gh issue create \
  --title "Plan: [feature name]" \
  --label "plan,implementation" \
  --body "$(cat plan-template.md)"
```

### Step 5: Save Local Copy

```bash
# Save to ψ/inbox/plan-TIMESTAMP.md
cp plan-template.md ψ/inbox/plan-$(date +%Y%m%d-%H%M%S).md
```

### Step 6: Report Summary

```
✅ Plan created!

GitHub Issue: #42
Local copy: ψ/inbox/plan-20260105-143022.md

## Tasks Summary
- Total: 8 tasks
- Parallel-ready: 5 tasks
- Sequential: 3 tasks
- Estimated: 4-6 hours

Next steps:
  1. /breakdown - Review task breakdown
  2. /delegate - Assign agents to tasks
  3. /gogogo - Start execution
```

## Example

```
User: /nnn ทำระบบ refresh token

AI:
# Creating Implementation Plan...

Checking context...
✓ No existing plan found
✓ Found focus.md: "JWT auth improvements"

📝 Clarifying Questions:
1. How long should refresh tokens last? [7/30/90 days]
2. Store in database or Redis? [db/redis]
3. Need token blacklist on logout? [yes/no]

User: 7, db, yes

---

Analyzing requirements...

Breaking down tasks...

Creating GitHub issue...

✅ Issue #42 created: "Plan: Refresh Token System"

---
# Implementation Plan: Refresh Token System

## Overview
Add refresh token mechanism for better security and UX.

## Tasks (6 total)

### Sequential (must do in order)
- [ ] **T1**: Update User model with refresh_token column
  - Agent: backend-developer
  - Acceptance: Migration runs, column added
  - Files: migrations/001_add_refresh_token.sql

- [ ] **T2**: Implement refresh token generation
  - Agent: backend-developer
  - Acceptance: Returns refresh token on login
  - Files: src/auth/tokens.py

- [ ] **T6**: Write integration tests
  - Agent: test-writer
  - Acceptance: Coverage > 80%
  - Files: tests/test_refresh_flow.py

### Parallel (can run together after T2)
- [ ] **T3**: Create POST /refresh endpoint
  - Agent: backend-developer
  - Parallel: true
  - Acceptance: Returns new access token

- [ ] **T4**: Implement token blacklist
  - Agent: backend-developer
  - Parallel: true
  - Acceptance: Logout tokens rejected

- [ ] **T5**: Update API documentation
  - Agent: doc-writer
  - Parallel: true
  - Acceptance: /docs/auth.md updated

## Execution Plan
```
T1 → T2 → [T3, T4, T5] parallel → T6
```

## Definition of Done
- [ ] All 6 tasks complete
- [ ] Tests passing
- [ ] Documentation updated
- [ ] Issue closed

---

Local copy saved: ψ/inbox/plan-20260105-143022.md

Ready for breakdown! Use /breakdown or /delegate
```

## When to Use
- เริ่ม feature ใหม่
- มี requirement ชัดเจน
- ต้องการ task breakdown พร้อม agent assignment
- ต้องการ track progress ใน GitHub

## Workflow Integration

```
/nnn       → Create plan issue
  ↓
/breakdown → Review/refine task breakdown
  ↓
/delegate  → Assign agents to parallel tasks
  ↓
/gogogo    → Execute all tasks
  ↓
/forward   → Commit status to GitHub
  ↓
/rrr       → Retrospective
```

## Tips
- Tasks marked `Parallel: true` can run simultaneously
- Each task specifies which agent to use
- Issue number is saved for tracking
- Local copy in ψ/inbox/ for backup
