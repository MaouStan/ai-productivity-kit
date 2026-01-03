# Example: Feature Development Workflow

**Complete walkthrough of developing a new feature using AI Productivity Kit**

## Scenario
Building a JWT authentication system for a REST API.

## Step-by-Step

### Step 1: Start the Day
```
User: /ai-kit:start

AI:
# Session Start
**Time**: 09:00
**Focus**: JWT Authentication System

## Today's Plan
1. Create implementation plan
2. Set up user model
3. Implement login endpoint
4. Add JWT middleware
5. Write tests

Let me know if you want to adjust this plan!
```

### Step 2: Create Context
```
User: /ccc

AI:
✅ Created context issue #12

# Context: JWT Auth Implementation

**Date**: 2026-01-03
**Focus**: Implement JWT authentication

## Summary
Adding JWT-based authentication with access and refresh tokens.

## Tech Stack
- Python 3.12
- FastAPI
- python-jose (JWT)
- passlib (password hashing)
```

### Step 3: Create Implementation Plan
```
User: /nnn ทำระบบ JWT authentication พร้อม refresh token

AI:
✅ Created plan issue #13

# Implementation Plan: JWT Authentication

## Overview
Add JWT authentication with access tokens (15 min) and refresh tokens (7 days).

## Tasks
- [ ] **Task 1**: Update user model with password hash
  - **Acceptance**: User table has password_hash column
  - **Files**: models/user.py

- [ ] **Task 2**: Implement password hashing utilities
  - **Acceptance**: hash_password() and verify_password() work
  - **Files**: utils/auth.py

- [ ] **Task 3**: Create login endpoint
  - **Acceptance**: POST /login returns JWT tokens
  - **Files**: api/auth.py

- [ ] **Task 4**: Implement JWT middleware
  - **Acceptance**: Protected routes require valid token
  - **Files**: middleware/jwt.py

- [ ] **Task 5**: Add refresh token endpoint
  - **Acceptance**: POST /refresh returns new access token
  - **Files**: api/auth.py

- [ ] **Task 6**: Write tests
  - **Acceptance**: Coverage > 80%
  - **Files**: tests/test_auth.py
```

### Step 4: Execute Plan
```
User: /gogogo

AI:
# Executing Plan: JWT Authentication

## Task 1/6: Update user model
✅ Adding password_hash column to User model...

[Code generated and applied]

✅ Task 1 complete!

## Task 2/6: Password hashing utilities
✅ Creating auth utilities...

[Code generated and applied]

✅ Task 2 complete!

[Continues through all tasks...]
```

### Step 5: Pause for Lunch
```
User: /ai-kit:pause

AI:
⏸️ Session paused!

STATE: paused
PAUSED_AT: 12:00
WAS_DOING: JWT Authentication

## Progress
- ✅ Tasks 1-4 complete
- 🔄 Task 5 in progress

## Resume With
1. Complete refresh endpoint
2. Write tests
3. Run test suite

See you after lunch! Use /ai-kit:start to continue.
```

### Step 6: Resume and Complete
```
User: /recap

AI:
📍 Current Focus

## Task
Implement JWT authentication with refresh tokens

## Progress
✅ Completed: Tasks 1-4
🔄 In Progress: Task 5 - Refresh endpoint

User: /gogogo

AI: [Continues from Task 5...]

✅ All tasks complete!
```

### Step 7: Session Retrospective
```
User: /rrr

AI:
# Retrospective: JWT Auth Implementation

**Date**: 2026-01-03
**Time**: 09:00 - 16:30
**Duration**: 7.5 hours (including lunch)

## What We Did
- ✅ JWT authentication system complete
- ✅ Login/logout endpoints working
- ✅ Refresh token flow implemented
- ✅ JWT middleware protecting routes
- ✅ 87% test coverage

## What We Learned
- python-jose is easier than PyJWT for JWT handling
- httpOnly cookies are safer than localStorage for tokens
- FastAPI dependency injection makes auth middleware clean

## What Went Well
✅ /nnn breakdown made work predictable
✅ Each task was independent and testable
✅ Test-driven approach caught bugs early

## What Could Be Better
⚠️ Should have checked cookie handling earlier (lost 30 min)
⚠️ Token expiration testing needed more thought

## Next Steps
- [ ] Add rate limiting to login
- [ ] Implement logout with token blacklist
- [ ] Write API documentation

## Tricks Discovered
→ Saved to ψ/memory/tricks/python_jwt_tricks.md

---
✅ Retro saved to ψ/memory/retros/2026-01-03_jwt_auth.md
```

## Commands Used Summary

| Command | Purpose |
|---------|---------|
| `/ai-kit:start` | Start day with focus |
| `/ccc` | Save context before work |
| `/nnn` | Create detailed plan |
| `/gogogo` | Execute the plan |
| `/ai-kit:pause` | Pause for break |
| `/recap` | Resume after break |
| `/rrr` | End day with retro |

## Tips for This Workflow

1. **Always /ccc first** - Save context before big work
2. **Use /nnn for planning** - Break down into manageable tasks
3. **Pause strategically** - Use /pause instead of stopping mid-task
4. **End with /rrr** - Capture learnings while fresh
