---
description: "Launch agents in waves and run tests"
allowed-tools:
  - Task
  - TaskOutput
  - Bash
  - Read
  - Write
  - TodoWrite
  - AskUserQuestion
---

# /gogogo

**Execute Plan - Launch Agents**
*ลงมือทำตามแผน - เริ่ม agents แบบ parallel*

## Description

Launches agents according to the plan from `/delegate`. Executes tasks in waves (sequential first, then parallel). Runs tests after completion. Updates progress in real-time.

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Load execution plan** - Read from `/delegate` output
2. **Execute in waves**:
   - Wave 1, 2, ... : Sequential tasks (one at a time)
   - Parallel Wave: Multiple agents at once
3. **Track progress** - Update todo list in real-time
4. **Run tests** - Auto-run after all tasks complete
5. **Report results** - Summary of completion

## AI Instructions

เมื่อ user พิมพ์ `/gogogo`:

### Step 1: Load Plan

```bash
# Read latest breakdown/assignment
cat ψ/inbox/assignment-*.md 2>/dev/null || echo "No assignment file"

# Or from todo list
```

### Step 2: Execute Waves

For each wave:
- **Sequential waves**: Launch one agent, wait for completion
- **Parallel waves**: Launch multiple agents with `run_in_background=true`

```python
# Sequential wave
Task(
  subagent_type="backend-developer",
  prompt="Do T1: Update User model...",
  model="sonnet"
)
# Wait for completion...

# Parallel wave - launch all at once
Task(
  subagent_type="backend-developer",
  prompt="Do T3: /refresh endpoint...",
  model="sonnet",
  run_in_background=True  # Returns immediately with task_id
)
Task(
  subagent_type="doc-writer",
  prompt="Do T5: API documentation...",
  model="haiku",
  run_in_background=True
)
# Then wait for all with TaskOutput(task_id, block=true)
```

### Step 3: Update Progress

After each task completes:
```bash
TodoWrite({
  todos: [
    { content: "T1: ...", status: "completed" },
    { content: "T2: ...", status: "in_progress" },
    ...
  ]
})
```

### Step 4: Run Tests

After all tasks complete:
```bash
# Detect test command
if [ -f "package.json" ]; then
    npm test
elif [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
    pytest
elif [ -f "Cargo.toml" ]; then
    cargo test
fi
```

### Step 5: Report Summary

```
## Execution Complete! 🎉

### Tasks Completed: 6/6

| Task | Agent | Status | Time |
|------|-------|--------|------|
| T1 | backend-developer | ✅ | 28m |
| T2 | backend-developer | ✅ | 42m |
| T3 | backend-developer | ✅ | 48m |
| T4 | backend-developer | ✅ | 32m |
| T5 | doc-writer | ✅ | 18m |
| T6 | test-writer | ✅ | 47m |

### Parallel Savings
- Sequential time: ~4h
- Actual time: ~2h 55m
- Saved: ~1h (25% faster)

### Tests
```
pytest tests/ -v
...
=== 47 passed, 2 warnings ===
```

✅ All tests passing

### Files Changed
- src/models/user.py (new)
- src/auth/tokens.py (new)
- src/api/refresh.py (new)
- docs/auth.md (updated)
- tests/test_refresh.py (new)

Next: /forward to commit status to GitHub
```

## Execution Flow

```
┌─────────────────────────────────────────────┐
│ WAVE 1: Sequential                           │
│   T1 ────────────────► ✅ (28m)              │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│ WAVE 2: Sequential                           │
│   T2 ────────────────► ✅ (42m)              │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│ WAVE 3: Parallel (3 agents)                  │
│   T3 ──► ✅ (48m)                            │
│   T4 ──► ✅ (32m)                            │
│   T5 ──► ✅ (18m)                            │
│   (wait for slowest)                         │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│ WAVE 4: Sequential                           │
│   T6 ────────────────► ✅ (47m)              │
└─────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────┐
│ TESTS                                        │
│   pytest ──────────► ✅ PASS (47 tests)      │
└─────────────────────────────────────────────┘
```

## Controls During Execution

```
User: status
AI:
## Current Status
Wave: 3/4 (Parallel)
Running: T3, T4, T5
Completed: T1, T2
Elapsed: 1h 15m
ETA: 15 min (waiting for T3)

User: stop
AI:
⚠️ Stopping after current wave...
Wave 3 will complete, then stopping.
Progress saved.
Resume with /gogogo

User: skip [task]
AI:
Skipping T5: API documentation
Marking as complete...
Continuing with remaining tasks
```

## Example Full Execution

```
User: /gogogo

AI:
🚀 Starting execution...

Loading plan from ψ/inbox/assignment-20260105.md...
Found 6 tasks in 4 waves

---
[WAVE 1/4] Sequential Task
T1: Update User model with refresh_token column
→ Agent: backend-developer
→ Started: 14:30

⏳ Running... (backend-developer working...)

✅ T1 Complete! (14:58 - 28 min)
   Files: migrations/001_add_refresh_token.sql

---
[WAVE 2/4] Sequential Task
T2: Implement refresh token generation
→ Agent: backend-developer
→ Started: 14:58

⏳ Running...

✅ T2 Complete! (15:40 - 42 min)
   Files: src/auth/tokens.py

---
[WAVE 3/4] Parallel Tasks (3 agents)
T3: POST /auth/refresh endpoint
→ Agent: backend-developer
→ Started: 15:40

T4: Token blacklist for logout
→ Agent: backend-developer
→ Started: 15:40

T5: API documentation
→ Agent: doc-writer
→ Started: 15:40

⏳ 3 agents running in parallel...

✅ T5 Complete! (15:58 - 18 min) - doc-writer finished first
✅ T4 Complete! (16:12 - 32 min) - blacklist done
✅ T3 Complete! (16:28 - 48 min) - endpoint done

(Wave 3 complete - waited for slowest: T3)

---
[WAVE 4/4] Sequential Task
T6: Integration tests
→ Agent: test-writer
→ Started: 16:28

⏳ Running...

✅ T6 Complete! (17:15 - 47 min)
   Files: tests/test_refresh_flow.py

---
[TESTS] Running test suite...

pytest tests/ -v

=== test session starts ===
collected 47 items

tests/test_refresh_flow.py .................... [50%]
tests/test_auth.py ...............           [100%]

=== 47 passed, 2 warnings in 12.3s ===

✅ All tests passing!

---
## Execution Complete! 🎉

### Summary
| Wave | Tasks | Type | Duration |
|------|-------|------|----------|
| 1 | T1 | Sequential | 28m |
| 2 | T2 | Sequential | 42m |
| 3 | T3, T4, T5 | Parallel | 48m* |
| 4 | T6 | Sequential | 47m |
| Tests | All | - | 12m |
| **Total** | **6** | **-** | **2h 57m** |

*Parallel wave time = longest task (T3)

### Files Created/Modified
- ✅ migrations/001_add_refresh_token.sql (new)
- ✅ src/auth/tokens.py (new)
- ✅ src/api/refresh.py (new)
- ✅ src/middleware/blacklist.py (new)
- ✅ docs/auth.md (updated)
- ✅ tests/test_refresh_flow.py (new)

### Next Steps
1. /forward - Commit status to GitHub issue
2. /rrr - Capture retrospective
3. git commit - Save changes

Issue #42 updated with completion status!
```

## When to Use
- After `/delegate` shows agent assignments
- Ready to execute the plan
- Want to run tasks with parallelization
- Need automated testing after completion

## Workflow Integration

```
/delegate  → Show agent assignments
  ↓
/gogogo    → Launch agents in waves
  ↓          (sequential → parallel → tests)
  ✅ Complete
  ↓
/forward   → Commit status to GitHub
```

## Tips
- Parallel tasks run at same time (faster!)
- Tests run automatically after completion
- Progress updates in real-time
- Can stop/resume with `/gogogo`
- Todo list tracks completion
