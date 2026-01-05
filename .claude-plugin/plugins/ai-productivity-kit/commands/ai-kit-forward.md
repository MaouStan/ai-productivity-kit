---
description: "Commit task status to GitHub and forward context to next session"
allowed-tools:
  - Bash
  - Read
  - Write
  - AskUserQuestion
---

# /forward

**Forward Context + Commit Status**
*ส่ง context ไป session ถัดไป + อัปเดตสถานะ GitHub*

## Description

Updates GitHub issue with task completion status, commits changes to git, and saves context to WIP.md for next session.

## Workflow Position
```
/nnn → /breakdown → /delegate → /gogogo → /forward → /rrr
```

## ทำอะไร

1. **Update GitHub issue** - Comment with completion status
2. **Commit changes** - Git commit with summary
3. **Create WIP.md** - Save context for next session
4. **Optionally push** - Ask if user wants to push now

## AI Instructions

เมื่อ user พิมพ์ `/forward`:

### Step 1: Update GitHub Issue

```bash
# Get issue number from plan
ISSUE_NUM=$(cat ψ/inbox/plan-*.md | grep "Issue #" | head -1 | sed 's/.*#//')

# Create status comment
gh issue comment $ISSUE_NUM --body "## ✅ Execution Complete

### Tasks Completed: 6/6

- [x] T1: Update User model
- [x] T2: Token generation
- [x] T3: /refresh endpoint
- [x] T4: Token blacklist
- [x] T5: API documentation
- [x] T6: Integration tests

### Test Results
\`\`\`
47 passed, 2 warnings
\`\`\`

### Files Changed
- migrations/001_add_refresh_token.sql
- src/auth/tokens.py
- src/api/refresh.py
- docs/auth.md
- tests/test_refresh_flow.py

---
Executed: $(date)
Duration: 2h 57m
"

# Close issue if all tasks done
gh issue close $ISSUE_NUM --comment "All tasks completed successfully!"
```

### Step 2: Commit Changes

```bash
# Stage changes
git add .

# Commit with summary
git commit -m "feat: refresh token system

- Add refresh_token column to User model
- Implement token generation and validation
- Add POST /auth/refresh endpoint
- Implement token blacklist for logout
- Update API documentation
- Add integration tests (47 passing)

Closes #42"
```

### Step 3: Create WIP.md

```bash
cat > ψ/inbox/WIP.md << EOF
# Work In Progress

**Saved**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
**Session**: Refresh Token System

## Status
✅ All tasks complete!

## What Was Done
- Implemented full refresh token flow
- All tests passing (47 tests)
- GitHub issue #42 closed
- Changes committed

## Files Changed
- migrations/001_add_refresh_token.sql
- src/auth/tokens.py
- src/api/refresh.py
- docs/auth.md
- tests/test_refresh_flow.py

## Next Steps
- [ ] Push to remote: git push
- [ ] Create PR if needed
- [ ] Deploy to staging

## Session Stats
- Duration: 2h 57m
- Tasks completed: 6/6
- Parallel savings: ~1h
EOF
```

### Step 4: Ask About Push

```
✅ Status committed to git
✅ GitHub issue updated
✅ WIP.md created

Push to remote now?
  [1] Yes - git push
  [2] No - push later
  [3] Create PR instead

Choice? [1-3]
```

## Template (GitHub Comment)
```markdown
## ✅ Execution Complete

### Tasks Completed: N/N

- [x] T1: Task name
- [x] T2: Task name
- [x] T3: Task name
...

### Test Results
```
<test output>
```

### Files Changed
| File | Type |
|------|------|
| path/to/file | new/modified |

### Execution Summary
- **Duration**: Xh Ym
- **Parallel tasks**: M
- **Time saved**: ~Zh
- **Test coverage**: N%

---
**Executed**: {{timestamp}}
**Workflow**: /nnn → /breakdown → /delegate → /gogogo → /forward
```

## Example

```
User: /forward

AI:
📤 Forwarding context and committing status...

---
[1/4] Reading execution results...

✓ Found todo list: 6/6 tasks completed
✓ Test results: 47 passed
✓ Files changed: 5 files

---
[2/4] Updating GitHub issue...

Issue #42: "Plan: Refresh Token System"

Posting completion comment...
✅ Comment added

Closing issue...
✅ Issue #42 closed

---
[3/4] Committing changes...

git status:
  modified:   src/models/user.py
  new file:   src/auth/tokens.py
  new file:   src/api/refresh.py
  modified:   docs/auth.md
  new file:   tests/test_refresh_flow.py

git commit -m "feat: refresh token system
- Add refresh_token column to User model
- Implement token generation and validation
- Add POST /auth/refresh endpoint
- Implement token blacklist for logout
- Update API documentation
- Add integration tests (47 passing)
Closes #42"

✅ Committed: abc123f

---
[4/4] Creating WIP.md...

✅ Saved to ψ/inbox/WIP.md

---
## ✅ Forward Complete!

### GitHub
- Issue #42: **Closed**
- Comment added with execution summary
- Linked to commit abc123f

### Git
- Branch: master
- Commit: abc123f
- Status: Clean (no uncommitted changes)

### WIP.md
- Saved: ψ/inbox/WIP.md
- Ready for next session

### Next Steps

1. **Push to remote**:
   ```bash
   git push
   ```

2. **Start fresh session**:
   ```bash
   /clear
   /recap  # continues from WIP.md
   ```

3. **Capture retrospective**:
   ```
   /rrr
   ```

---
Push changes now?

[1] Yes - git push origin master
[2] No - I'll push later
[3] Create PR instead

Choice? [1-3]
```

## When to Use
- After `/gogogo` completes all tasks
- Ready to commit and save progress
- Before `/clear` to start new session
- Want to update GitHub issue status

## Workflow Integration

```
/gogogo    → All tasks complete
  ↓
/forward   → Update GitHub + commit + WIP.md
  ↓
✅ Saved
  ↓
/rrr       → Retrospective (optional)
  ↓
/clear     → Start fresh
```

## Tips
- `/forward` closes the GitHub issue when done
- Creates detailed commit message with task summary
- WIP.md preserves context for `/recap`
- Ask before pushing - safe workflow
- Use `/rrr` after for retrospective

## Session Handoff

```
END OF SESSION                   START NEW SESSION
─────────────────────              ─────────────────────
/forward  → Save to WIP.md         /recap   → Read WIP.md
/clear    → Fresh start            ↓
                                  Continue where you left off
```
