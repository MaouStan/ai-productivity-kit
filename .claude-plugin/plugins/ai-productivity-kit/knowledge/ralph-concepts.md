# Ralph Concepts - Autonomous Development Loop

**Concepts from frankbria/ralph-claude-code**

## Core Philosophy

> **"Autonomous Development with Safety First"**

Ralph enables AI to work autonomously while maintaining safety through intelligent exit detection and circuit breakers.

## Key Components

### 1. Circuit Breaker Pattern

ป้องกัน runaway loops และ token waste:

```bash
# Three States
CLOSED      → ทำงานปกติ
HALF_OPEN   → ตรวจสอบก่อนดำเนินการต่อ
OPEN        → หยุดทำงาน ต้อง reset

# Thresholds
- No progress: 3 loops
- Same error: 5 loops
- Output decline: 70%
```

**Implementation**:
```python
class CircuitBreaker:
    def __init__(self):
        self.state = "CLOSED"
        self.failure_count = 0
        self.success_count = 0

    def can_execute(self) -> bool:
        if self.state == "OPEN":
            return False
        if self.state == "HALF_OPEN":
            return self.success_count > 0
        return True

    def record_success(self):
        self.success_count += 1
        if self.state == "HALF_OPEN" and self.success_count >= 2:
            self.state = "CLOSED"

    def record_failure(self):
        self.failure_count += 1
        if self.failure_count >= 3:
            self.state = "OPEN"
```

### 2. Intelligent Exit Detection

ตรวจจับว่างานเสร็จหรือยัง:

```markdown
Exit Signals:
1. Consecutive "done" responses (2+ times)
2. Test saturation (3+ test-only loops)
3. All @fix_plan.md items completed
4. Explicit completion language

Error Detection (Multi-line):
- Matches error patterns across 3+ lines
- Filters false positives (test failures OK)
- Detects stuck loops with same error
```

### 3. Status Reporting Protocol

รูปแบบรายงานสถานะมาตรฐาน:

```markdown
---STATUS---
STATUS: IN_PROGRESS | COMPLETE | BLOCKED
TASKS_COMPLETED_THIS_LOOP: <number>
FILES_MODIFIED: <number>
TESTS_STATUS: PASSING | FAILING | NOT_RUN
WORK_TYPE: IMPLEMENTATION | TESTING | DOCS
EXIT_SIGNAL: true | false
RECOMMENDATION: <summary>
---END_STATUS---
```

### 4. Spec-Driven Development

```bash
# Workflow
/constitution → /specify → /plan → /tasks → /implement

# 1. Constitution - หลักการ
# 2. Specify - requirements
# 3. Plan - implementation plan
# 4. Tasks - actionable tasks
# 5. Implement - execute all
```

## Autonomous Loop Pattern

```python
def autonomous_loop(max_calls=100, timeout_minutes=15):
    """
    ลูปพัฒนาแบบ autonomous
    """
    start_time = time.time()
    call_count = 0
    circuit_breaker = CircuitBreaker()

    while call_count < max_calls:
        # Check timeout
        if (time.time() - start_time) > timeout_minutes * 60:
            print("Timeout reached")
            break

        # Check circuit breaker
        if not circuit_breaker.can_execute():
            print("Circuit breaker is OPEN")
            break

        # Execute task
        result = execute_task()
        call_count += 1

        # Analyze result
        if result.success:
            circuit_breaker.record_success()
        else:
            circuit_breaker.record_failure()

        # Check exit signals
        if should_exit(result):
            print("Objective completed")
            break

    return summarize()
```

## Rate Limiting

```python
class RateLimiter:
    """จำกัดจำนวน API calls ต่อชั่วโมง"""

    def __init__(self, max_calls_per_hour=100):
        self.max_calls = max_calls_per_hour
        self.calls = []
        self.claude_limit = 100  # 5-hour limit

    def can_call(self) -> bool:
        now = time.time()
        hour_ago = now - 3600

        # Remove old calls
        self.calls = [c for c in self.calls if c > hour_ago]

        # Check hourly limit
        if len(self.calls) >= self.max_calls:
            return False

        # Check Claude limit
        if len(self.calls) >= self.claude_limit:
            print("Approaching Claude 5-hour limit!")
            return confirm_continue()

        self.calls.append(now)
        return True
```

## Project Structure (Ralph Style)

```
project/
├── @PROMPT.md           # Development instructions
├── @fix_plan.md         # Prioritized tasks
├── @AGENT.md            # Build/run instructions
├── specs/
│   ├── requirements.md
│   └── architecture.md
├── src/
├── tests/
├── examples/
└── logs/
```

## Control Files Prefix

ไฟล์ควบคุมใช้ prefix `@` เพื่อ:
- เด่นให้เห็นทันที
- Sort ขึ้นก่อนเสมอ
- รู้ว่าเป็น control file ไม่ใช่ source

## Best Practices

### 1. One Task Per Loop
```
❌ ทำหลายอย่างพร้อมกัน
✅ Focus ทำ task เดียวจนเสร็จ
```

### 2. Implementation Over Testing
```
80% implementation / 20% testing
ทำให้ work ก่อน แล้วค่อย test
```

### 3. Status Every Loop
```
ทุก loop ต้องรายงานสถานะ
เพื่อ track progress และ debug
```

### 4. Graceful Degradation
```
ถ้าขาด feature หนึ่ง
ควรทำงานได้แบบง่ายกว่า crash
```

## Exit Detection Examples

```
✅ Strong Exit Signals:
- "All tasks completed"
- "Feature is ready"
- "Nothing left to do"

⚠️ Weak Exit Signals (false positives):
- "Tests passing" (but tasks remain)
- "Code compiles" (but not done)

❌ Error Patterns (should halt):
- Same error 3+ times
- Stack traces repeating
- No file changes 5+ loops
```

## Monitor Dashboard

```bash
# Tmux-based monitoring
ralph --monitor

Layout:
┌─────────────────────────────────────┐
│  Main Loop Output                   │
│  (scrolling live)                   │
├──────────┬──────────┬───────────────┤
│ Status   │ Tasks    │ Calls         │
│ IN_PROG  │ 5/10     │ 45/100        │
├──────────┴──────────┴───────────────┤
│ Error Log (last 5)                  │
└─────────────────────────────────────┘
```

## When to Use Autonomous Loop

| Scenario | Use Autonomous? |
|----------|----------------|
| ทำ feature ใหม่ | ✅ Yes |
| Fix bug ที่รู้สาเหตุ | ✅ Yes |
| Write tests | ✅ Yes |
| Production deploy | ❌ No - manual |
| Code review | ❌ No - human |
| Complex architecture | ❌ No - plan first |
