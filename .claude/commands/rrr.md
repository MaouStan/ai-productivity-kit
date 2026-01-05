---
description: "Session retrospective - what we did, learned, and next steps"
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# /rrr

**Retro-Reflect-Review - ทบทวนงานที่ทำไป**
*Session retrospective after completing workflow*

## Description

Captures retrospective after completing the workflow. Documents what was done, what was learned, and next steps. Saves to `ψ/memory/retros/`.

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Review execution** - Read from `/forward` output
2. **Extract learnings** - Identify patterns, tricks, improvements
3. **Create retrospective** - Save to `ψ/memory/retros/`
4. **Update knowledge base** - Save patterns/tricks if found
5. **Ask for next steps** - Plan future work

## Template (Retrospective)
```markdown
# Retrospective: {{Plan Name}}

**Date**: {{YYYY-MM-DD}}
**Time**: {{start}} - {{end}}
**Duration**: {{hours}}
**Issue**: #{{number}}
**Workflow**: /nnn → /breakdown → /delegate → /gogogo → /forward → /rrr

## What We Did
✅ {{summary of completed tasks}}

- [x] Task 1: {{description}}
- [x] Task 2: {{description}}
- [x] Task 3: {{description}}

## What We Learned

### Technical Learnings
- {{learning 1}}
- {{learning 2}}

### Workflow Learnings
- {{workflow insight}}

## What Went Well
✅ {{สิ่งที่ดี}}

## What Could Be Better
⚠️ {{สิ่งที่ควรปรับปรุง}}

## Patterns Discovered
{{if any patterns found → link to ψ/memory/patterns/}}

## Tricks Saved
{{if any tricks found → link to ψ/memory/tricks/}}

## Next Steps
- [ ] {{next 1}}
- [ ] {{next 2}}
- [ ] {{next 3}}

## Metrics
- **Tasks completed**: N/N
- **Time taken**: Xh Ym
- **Parallel efficiency**: Z%
- **Test coverage**: N%
- **Files changed**: M

## Tags
`{{tag1}}` `{{tag2}}` `{{tag3}}`
```

## AI Instructions

เมื่อ user พิมพ์ `/rrr`:

### Step 1: Read Context

```bash
# Read WIP.md for execution summary
cat ψ/inbox/WIP.md 2>/dev/null || echo "No WIP.md"

# Read git log for commits
git log --since="today" --oneline

# Read todo list for completed tasks
```

### Step 2: Extract Learnings

Ask user for insights:
```
📝 Reflection Questions:

1. What went well in this session?
2. What could be improved?
3. Any new patterns or tricks discovered?
4. What should we do differently next time?

Or press Enter to auto-generate from context...
```

### Step 3: Create Retrospective

```bash
# Save to retros directory
cat > ψ/memory/retros/$(date +%Y%m%d)_retro.md << 'EOF'
<retrospective content>
EOF
```

### Step 4: Extract Patterns/Tricks

If patterns or tricks discovered:
```bash
# Save pattern
cat > ψ/memory/patterns/$(date +%Y%m%d)_pattern.md << 'EOF'
# Pattern: {{name}}

## Context
{{when to use}}

## Solution
{{the pattern}}

## Example
{{code example}}
EOF

# Save trick
cat > ψ/memory/tricks/$(date +%Y%m%d)_trick.md << 'EOF'
# Trick: {{name}}

{{description}}

{{example}}
EOF
```

### Step 5: Update Session Log

```bash
echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ]] Retro: {{plan_name}}" >> ψ/memory/logs/sessions.log
```

## Example

```
User: /rrr

AI:
# Retrospective: Refresh Token System

Reading execution context...
✓ Found WIP.md
✓ Found 6 completed tasks
✓ Found commit abc123f
✓ Found closed issue #42

---

## What We Did

✅ **Completed Refresh Token System** (2h 57m)

- [x] T1: Update User model with refresh_token column (28m)
- [x] T2: Implement refresh token generation (42m)
- [x] T3: Create POST /auth/refresh endpoint (48m)
- [x] T4: Implement token blacklist for logout (32m)
- [x] T5: Update API documentation (18m)
- [x] T6: Write integration tests (47m)

## Test Results
```
=== 47 passed, 2 warnings in 12.3s ===
```

## What We Learned

### Technical Learnings
- **python-jose** is easier than PyJWT for JWT handling
- **httpOnly cookies** are essential for refresh token security
- **Blacklist pattern** is simpler than token rotation for logout

### Workflow Learnings
- Parallel execution saved ~1 hour (3 tasks ran simultaneously)
- `/delegate` helped visualize the execution plan before starting
- Todo list kept us on track during execution

## What Went Well
✅ Parallel task execution worked perfectly
✅ All tests passing on first run
✅ GitHub issue workflow integrated smoothly
✅ Documentation updated alongside code

## What Could Be Better
⚠️ T3 (endpoint) took 48m vs estimated 45m - missed edge case
⚠️ Should run linter after code changes
⚠️ Could add more integration test scenarios

## Patterns Discovered

📁 Saved to `ψ/memory/patterns/20260105_refresh_token_flow.md`
- Refresh token generation pattern
- Token blacklist for logout
- Parallel task execution in workflow

## Tricks Saved

📁 Saved to `ψ/memory/tricks/20260105_python_jwt_tricks.md`
- python-jose `encode()` with `headers` parameter
- bcrypt `hashpw()` with `gensalt()` for secure hashing

## Next Steps
- [ ] Push to remote: `git push`
- [ ] Deploy to staging environment
- [ ] Monitor token refresh rate
- [ ] Consider adding refresh token rotation

## Metrics
| Metric | Value |
|--------|-------|
| Tasks completed | 6/6 (100%) |
| Time taken | 2h 57m |
| Parallel efficiency | 25% time saved |
| Test coverage | 47 passing tests |
| Files changed | 5 files |
| GitHub issues | 1 closed |

## Session Stats
- **Start**: 14:30
- **End**: 17:27
- **Duration**: 2h 57m
- **Workflow**: /nnn → /breakdown → /delegate → /gogogo → /forward → /rrr

## Tags
`authentication` `jwt` `refresh-token` `python` `parallel-execution`

---

✅ Retrospective saved: ψ/memory/retros/20260105_retro.md
✅ Pattern saved: ψ/memory/patterns/20260105_refresh_token_flow.md
✅ Tricks saved: ψ/memory/tricks/20260105_python_jwt_tricks.md

---

## Session Complete! 🎉

Ready for next action:

1. **Start new workflow**: /nnn "next feature"
2. **Review retrospectives**: cat ψ/memory/retros/*.md
3. **Take a break**: /pause
4. **End session**: /clear

What next?
```

## When to Use
- After `/forward` completes
- Finished a workflow cycle
- Want to capture learnings
- End of work session

## Workflow Integration

```
/forward   → Status committed
  ↓
/rrr       → Capture retrospective
  ↓
✅ Complete
  ↓
/nnn       → Start next feature
  or
/clear     → End session
```

## Tips
- `/rrr` captures patterns and tricks automatically
- Retrospectives are saved with timestamps
- Links to patterns/tricks for future reference
- Metrics help track productivity over time
- Tags make retros searchable

## Retrospective Structure

```
ψ/memory/
├── retros/
│   ├── 20260105_retro.md
│   ├── 20260104_retro.md
│   └── ...
├── patterns/
│   ├── 20260105_refresh_token_flow.md
│   └── ...
├── tricks/
│   ├── 20260105_python_jwt_tricks.md
│   └── ...
└── logs/
    └── sessions.log
```
