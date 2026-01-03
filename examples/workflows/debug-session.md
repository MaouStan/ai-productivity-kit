# Example: Debug Session Workflow

**How to use AI Productivity Kit for effective debugging**

## Scenario
Encountering a 404 error when trying to login.

## Step-by-Step

### Step 1: Capture the Error
```
Error in browser console:
POST http://localhost:8000/api/auth/login 404 Not Found

Stack trace from server:
INFO:     127.0.0.1:12345 - "POST /api/auth/login HTTP/1.1" 404
```

### Step 2: Use Debug Command
```
User: /ai-kit:debug

AI:
🔍 Debug Session Started

Please provide:
1. Error message (paste full error)
2. Where it happened (file:line if known)
3. What you were doing

[User provides details]
```

### Step 3: Provide Full Context
```
User:
Error: 404 Not Found at POST /api/auth/login
File: Unknown (route not found)
Context:
- Just implemented login endpoint in src/api/auth.py
- Using FastAPI
- Started server with uvicorn src.main:app

AI:
🔍 Analyzing...

Found the issue!

**Root Cause**: FastAPI app not including the auth router.

At src/main.py:
```python
app = FastAPI()

# Missing: app.include_router(auth_router, prefix="/api/auth")
```

The auth router exists but isn't registered with the main app.

**Fix**:
```python
from src.api.auth import router as auth_router

app.include_router(auth_router, prefix="/api/auth", tags=["auth"])
```

Apply fix? [y/n]
```

### Step 4: Test the Fix
```
User: y

AI: [Applies the fix]

✅ Fix applied!

Try testing now:
curl -X POST http://localhost:8000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"wrong"}'

Expected: 401 Unauthorized (not 404)
```

### Step 5: Verify and Save Learning
```
User: Works now!

AI: ✅ Great! Want to save this as a trick for future?

User: /ai-kit:trick fastapi router registration

AI:
✅ Trick saved!

# Trick: FastAPI Router Registration

**Language**: Python
**Date**: 2026-01-03

## The Trick
Routers must be explicitly included in the main FastAPI app.

## Code Example
```python
# ❌ Wrong - router defined but not included
# src/api/auth.py
router = APIRouter()

@router.post("/login")
async def login():
    return {"token": "..."}

# src/main.py
app = FastAPI()
# Router not included! Routes won't work!

# ✅ Correct - include the router
# src/main.py
from src.api.auth import router as auth_router

app = FastAPI()
app.include_router(auth_router, prefix="/api/auth")
```

## When to Use
- Getting 404 on endpoints you just created
- New routes not appearing in docs
- After refactoring route structure

## Why It Works
FastAPI doesn't auto-discover routers. Each router must be
explicitly included with include_router().
```

## Commands Used Summary

| Command | Purpose |
|---------|---------|
| `/ai-kit:debug` | Start debug session |
| `/ai-kit:trick` | Save learned pattern |

## Debug Best Practices

1. **Paste full error** - Include stack trace
2. **Share context** - What were you doing?
3. **Let AI investigate** - Don't jump to conclusions
4. **Test the fix** - Verify it actually works
5. **Save the learning** - Next time you'll know

## Common Debug Patterns

| Error | Common Cause | Quick Check |
|-------|--------------|-------------|
| 404 | Route not registered | Check `include_router()` |
| 500 | Exception in handler | Check server logs |
| 401/403 | Auth middleware | Check token/headers |
| CORS | Origins not allowed | Check CORS middleware |
| Timeout | Database/query slow | Check DB connection |
