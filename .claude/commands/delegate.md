---
description: "Assign agents to parallel tasks and wait for confirmation"
allowed-tools:
  - Task
  - AskUserQuestion
  - Bash
  - Read
  - Write
  - TodoWrite
---

# /delegate

**มอบหมายงานให้ subagent**
*Assign agents to parallel tasks, then wait*

## ⚠️ NO CODE - PLAN ONLY
**This command does NOT write code.** It ONLY assigns agents to tasks.
- ✅ Creates: Agent assignments, execution plan display
- ❌ Does NOT: Write code, launch agents, execute changes
- Use `/gogogo` to launch agents and execute

## Description

Reviews the task breakdown from `/breakdown` and assigns specific agents to each task. Shows parallel execution groups. **WAITs for user confirmation before launching agents.**

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Read breakdown** - Load tasks from `/breakdown`
2. **Show agent assignments** - Display which agent does each task
3. **Group parallel tasks** - Show what can run together
4. **WAIT for confirmation** - Ask user to approve before launching
5. **Launch agents** - Only after user says `/gogogo`

## Agent Selection Guide

| Task Type | Agent | When to Use |
|-----------|-------|-------------|
| Write backend code | `backend-developer` | API, services, models |
| Write frontend code | `frontend-developer` | UI components, pages |
| Write tests | `test-writer` | Unit, integration tests |
| Write documentation | `doc-writer` | README, API docs |
| Debug errors | `debug-helper` | Fixing bugs |
| Review code | `code-reviewer` | PR review, quality check |
| Refactor | `code-simplifier` | Clean up code |
| General | `general-purpose` | Unclear tasks |

## AI Instructions

เมื่อ user พิมพ์ `/delegate`:

### Step 1: Load Tasks

```bash
# Read todo list
cat ψ/inbox/breakdown-*.md 2>/dev/null || echo "No breakdown file"

# Or read from plan
gh issue view --json body --jq '.body' $(gh issue list --label plan --limit 1 --json number --jq '.[0].number')
```

### Step 2: Analyze and Assign Agents

For each task:
- Read the description
- Match to appropriate agent (use table above)
- Note if marked `Parallel: true`

### Step 3: Display Assignment Plan

```
## Agent Assignment Plan

### Sequential Group 1 (must run first)
- T1: Task name → Agent: backend-developer

### Sequential Group 2
- T2: Task name → Agent: backend-developer

### Parallel Group (can run together after T2)
- T3: Task name → Agent: frontend-developer
- T4: Task name → Agent: doc-writer
- T5: Task name → Agent: test-writer

### Sequential Group 3 (after parallel)
- T6: Task name → Agent: code-reviewer
```

### Step 4: WAIT for User

```
Ready to launch agents?

This will:
1. Launch 5 agents (2 sequential, then 3 parallel)
2. Execute tasks in order
3. Report progress as agents complete

Proceed?
  [1] Yes - Launch agents (/gogogo)
  [2] Modify assignments
  [3] Cancel

Choice? [1-3]
```

**DO NOT launch agents yet!** Wait for user to say `/gogogo`.

## Template (Assignment Display)
```markdown
## Agent Assignment: [Plan Name]

### Execution Plan

#### Wave 1: Sequential (1 agent)
| Task | Agent | Est | Priority |
|------|-------|-----|----------|
| T1: [name] | backend-developer | 30m | high |

#### Wave 2: Parallel (3 agents)
| Task | Agent | Est | Priority |
|------|-------|-----|----------|
| T2: [name] | frontend-developer | 45m | high |
| T3: [name] | test-writer | 30m | medium |
| T4: [name] | doc-writer | 20m | low |

#### Wave 3: Sequential (1 agent)
| Task | Agent | Est | Priority |
|------|-------|-----|----------|
| T5: [name] | code-reviewer | 15m | high |

### Summary
- Total agents: 5 unique
- Max parallel: 3 agents at once
- Est. time: ~50 min (with parallelization)

### Next Step
Use /gogogo to launch agents and begin execution.
```

## Example

```
User: /delegate

AI:
# Agent Assignment: Refresh Token System

Loading tasks from breakdown...
Analyzing task types...
Matching agents to tasks...

---

## Execution Plan

### Wave 1: Foundation (Sequential)

| Task | Agent | Why? | Est |
|------|-------|------|-----|
| T1: Update User model | backend-developer | Database migration | 30m |

### Wave 2: Core Implementation (Sequential)

| Task | Agent | Why? | Est |
|------|-------|------|-----|
| T2: Token generation | backend-developer | Auth logic | 45m |

### Wave 3: Parallel Tasks (3 agents)

| Task | Agent | Why? | Est |
|------|-------|------|-----|
| T3: /refresh endpoint | backend-developer | API endpoint | 45m |
| T4: Token blacklist | backend-developer | Security feature | 30m |
| T5: API documentation | doc-writer | Documentation | 20m |

### Wave 4: Integration (Sequential)

| Task | Agent | Why? | Est |
|------|-------|------|-----|
| T6: Integration tests | test-writer | Test coverage | 45m |

---

## Summary
- Unique agents: 3 (backend-developer x3, doc-writer, test-writer)
- Parallel wave: 3 tasks simultaneously
- Estimated time: ~1h 20m (vs 3h+ sequentially)

---

## Agents Ready to Launch

When you run /gogogo:
1. T1 will start (backend-developer)
2. After T1 completes, T2 starts (backend-developer)
3. After T2 completes, T3+T4+T5 run IN PARALLEL
4. After all parallel tasks complete, T6 runs (test-writer)

Proceed?
  → Use /gogogo to launch agents
  → Or tell me to change assignments
```

## After /gogogo

```
User: /gogogo

AI:
🚀 Launching agents...

[WAVE 1] Starting T1: Update User model
  → Launched: backend-developer (agent-abc123)
  ⏳ Running...

✅ T1 Complete! (took 28 min)

[WAVE 2] Starting T2: Token generation
  → Launched: backend-developer (agent-def456)
  ⏳ Running...

✅ T2 Complete! (took 42 min)

[WAVE 3] Starting parallel tasks...
  → T3: /refresh endpoint (backend-developer, agent-ghi789)
  → T4: Token blacklist (backend-developer, agent-jkl012)
  → T5: API documentation (doc-writer, agent-mno345)
  ⏳ 3 agents running in parallel...

✅ T3 Complete! (took 48 min)
✅ T4 Complete! (took 32 min)
✅ T5 Complete! (took 18 min)

[WAVE 4] Starting T6: Integration tests
  → Launched: test-writer (agent-pqr678)
  ⏳ Running...

✅ T6 Complete! (took 47 min)

---

## All Tasks Complete! 🎉

Total time: 2h 55m (vs ~4h sequentially)
Tasks completed: 6/6

Next: /forward to commit status, /rrr for retrospective
```

## When to Use
- After `/breakdown` creates task list
- Want to review agent assignments
- Ready to launch parallel execution
- Need to verify which agent does what

## Workflow Integration

```
/breakdown → Create task list
  ↓
/delegate  → Review assignments
  ↓
[WAIT]     → User confirms
  ↓
/gogogo    → Launch agents!
```

## Tips
- `/delegate` shows the plan, doesn't execute
- Parallel tasks run at same time (faster!)
- Use `/gogogo` to actually start execution
- Can modify assignments before `/gogogo`
- Each agent gets its own context
