---
description: "Split plan into small tasks and wait for confirmation"
allowed-tools:
  - TodoWrite
  - AskUserQuestion
  - Bash
  - Read
  - Write
---

# /breakdown

**แบ่งงานใหญ่เป็น task เล็กๆ**
*Break complex task into smaller pieces, then wait*

## Description

Reads the plan from `/nnn` and breaks it into smaller, executable tasks. Organizes tasks into sequential and parallel groups. **WAITs for user confirmation before proceeding.**

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Read plan** - Load from `ψ/inbox/plan-*.md` or GitHub issue
2. **Analyze tasks** - Identify dependencies and parallel opportunities
3. **Create todo list** - Organize with TodoWrite tool
4. **Display breakdown** - Show sequential vs parallel tasks
5. **WAIT for confirmation** - Ask user to approve before continuing

## AI Instructions

เมื่อ user พิมพ์ `/breakdown`:

### Step 1: Load Plan

```bash
# Find latest plan
ls -t ψ/inbox/plan-*.md | head -1

# Or from GitHub
gh issue view --json title,body --jq '.body' $(gh issue list --label plan --limit 1 --json number --jq '.[0].number')
```

### Step 2: Analyze Tasks

For each task in the plan:
- Identify dependencies (what must come first)
- Check if marked `Parallel: true`
- Group by execution order

### Step 3: Create Execution Plan

```
Sequential (must wait for previous):
  T1 → T2 → T3

Parallel (can run together):
  [T4, T5, T6] → all run after T3
```

### Step 4: Create Todo List

```bash
TodoWrite({
  todos: [
    { content: "T1: ...", status: "pending", activeForm: "Doing T1" },
    { content: "T2: ...", status: "pending", activeForm: "Doing T2" },
    ...
  ]
})
```

### Step 5: Display and WAIT

```
## Task Breakdown Complete

### Sequential Tasks (3)
1. T1: Update User model
   → T2: Implement token generation
   → T3: Create /refresh endpoint

### Parallel Tasks (3) - after T2 completes
4. T4: Token blacklist
5. T5: API documentation
6. T6: Unit tests

Total: 6 tasks | Est. time: 3-4 hours

Ready to proceed?
  [1] /delegate - Assign agents to tasks
  [2] /gogogo - Start execution immediately
  [3] Modify tasks first
  [4] Cancel

Choice? [1-4]
```

## Template (Breakdown Display)
```markdown
## Task Breakdown: [Plan Name]

**Source**: Issue #42 or ψ/inbox/plan-20260105.md

### Phase 1: Foundation (Sequential)
- [ ] **T1**: [Task name]
  - Agent: [type]
  - Depends: nothing
  - Est: [time]

### Phase 2: Core Implementation (Sequential)
- [ ] **T2**: [Task name]
  - Agent: [type]
  - Depends: T1
  - Est: [time]

### Phase 3: Parallel Execution
- [ ] **T3**: [Task name]
  - Agent: [type]
  - Parallel: yes
  - Depends: T2

- [ ] **T4**: [Task name]
  - Agent: [type]
  - Parallel: yes
  - Depends: T2

- [ ] **T5**: [Task name]
  - Agent: [type]
  - Parallel: yes
  - Depends: T2

### Phase 4: Integration (Sequential)
- [ ] **T6**: [Task name]
  - Agent: [type]
  - Depends: T3, T4, T5
  - Est: [time]

## Execution Graph
```
T1 → T2 → [T3, T4, T5] → T6
```

## Summary
| Phase | Tasks | Type | Est. Time |
|-------|-------|------|-----------|
| 1 Foundation | 1 | Sequential | 30 min |
| 2 Core | 1 | Sequential | 1 hr |
| 3 Parallel | 3 | Parallel | 2 hr |
| 4 Integration | 1 | Sequential | 30 min |
| **Total** | **6** | **-** | **4 hr** |

## Next Steps
1. Review the breakdown above
2. Use /delegate to assign agents
3. Use /gogogo to start execution

Or respond with changes to make.
```

## Example

```
User: /breakdown

AI:
# Task Breakdown: Refresh Token System

**Source**: Issue #42

Loading plan...
Analyzing dependencies...
Creating todo list...

---

## Phase 1: Foundation

- [ ] **T1**: Update User model with refresh_token column
  - Agent: backend-developer
  - Acceptance: Migration runs successfully
  - Est: 30 min

## Phase 2: Core Implementation

- [ ] **T2**: Implement refresh token generation
  - Agent: backend-developer
  - Depends: T1
  - Acceptance: Login returns refresh token
  - Est: 45 min

## Phase 3: Parallel Execution (after T2)

- [ ] **T3**: Create POST /auth/refresh endpoint
  - Agent: backend-developer
  - Parallel: ✓
  - Acceptance: Returns new access token
  - Est: 45 min

- [ ] **T4**: Implement token blacklist for logout
  - Agent: backend-developer
  - Parallel: ✓
  - Acceptance: Blacklisted tokens rejected
  - Est: 30 min

- [ ] **T5**: Update API documentation
  - Agent: doc-writer
  - Parallel: ✓
  - Acceptance: docs/auth.md updated
  - Est: 20 min

## Phase 4: Integration & Testing

- [ ] **T6**: Write integration tests
  - Agent: test-writer
  - Depends: T3, T4
  - Acceptance: Coverage > 80%
  - Est: 45 min

---

## Execution Graph
```
T1 → T2 → [T3 | T4 | T5] → T6
     ↑         ↑   ↑   ↑
    45m      45m 30m 20m  ↓
                        45m
```

## Summary
- Total tasks: 6
- Sequential: 3 (T1, T2, T6)
- Parallel: 3 (T3, T4, T5)
- Estimated: 3h 35m

✅ Todo list created with 6 items

---

## Ready to proceed?

1. **/delegate** - Review and assign agents to each task
2. **/gogogo** - Start execution with current assignments
3. **Modify** - Tell me what to change
4. **Cancel** - Abort

Choice? [1-4]
```

## When to Use
- After `/nnn` creates a plan
- Need to review task breakdown
- Want to see parallel vs sequential tasks
- Ready to assign agents

## Workflow Integration

```
/nnn       → Create plan with tasks
  ↓
/breakdown → Analyze and organize tasks
  ↓
[WAIT]     → User confirms or modifies
  ↓
/delegate  → Assign specific agents
  ↓
/gogogo    → Execute!
```

## Tips
- `/breakdown` creates the todo list
- Shows which tasks can run in parallel
- Waits for confirmation - doesn't auto-execute
- Can modify tasks before proceeding
- Todo list tracks progress during `/gogogo`
