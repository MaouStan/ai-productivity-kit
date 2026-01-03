# Example: Code Review Workflow

**How to use AI Productivity Kit for code reviews**

## Scenario
Just finished implementing a feature, want to review before committing.

## Step-by-Step

### Step 1: Check Changes
```
User: git diff

AI:
[Shows diff of changes]

Files changed:
- src/api/users.py (modified)
- src/middleware/auth.py (new)
- tests/test_users.py (modified)
```

### Step 2: Run Review
```
User: /ai-kit:review

AI:
# Code Review

## ✅ What Looks Good
- Clean separation of concerns
- Proper error handling
- Type hints used throughout
- Tests added for new code

## ⚠️ Issues Found

### High Priority
1. **SQL Injection Risk** at src/api/users.py:45
   - Problem: User input directly in SQL query
   - Fix: Use parameterized queries
   ```python
   # ❌ Current
   query = f"SELECT * FROM users WHERE id = {user_id}"

   # ✅ Fix
   query = "SELECT * FROM users WHERE id = ?"
   cursor.execute(query, (user_id,))
   ```

2. **Missing Rate Limiting** at src/api/users.py:23
   - Problem: No rate limit on user creation
   - Fix: Add rate limiter middleware
   - Security issue: Can be spammed

### Medium Priority
3. **Inconsistent Error Messages** at src/api/users.py:67
   - Problem: Returns generic error for specific failures
   - Fix: Return specific error messages
   ```python
   # Current
   return {"error": "Failed to create user"}

   # Better
   return {"error": "Email already exists"}
   ```

4. **Missing Input Validation** at src/api/users.py:12
   - Problem: Email format not validated
   - Fix: Add email validation
   ```python
   from email_validator import validate_email

   try:
       validate_email(user_data["email"])
   except ValueError:
       return {"error": "Invalid email format"}
   ```

### Low Priority
5. **Docstring Missing** at src/middleware/auth.py:10
   - Problem: Function lacks documentation
   - Fix: Add docstring

## Summary
- 2 High Priority issues (security)
- 2 Medium Priority issues
- 1 Low Priority issue

Recommendation: Fix high priority issues before committing.
```

### Step 3: Fix Issues
```
User: Fix the SQL injection first

AI: [Applies fix for parameterized query]

✅ Fixed! Changes made to src/api/users.py:45

Next: Fix rate limiting?
```

### Step 4: Re-review
```
User: /ai-kit:delegate review

AI:
🔄 Delegating to code-reviewer agent...

[Agent runs thorough review]

# Re-Review Results

✅ High priority issues resolved!
- SQL injection: Fixed with parameterized queries
- Rate limiting: Added @rate_limit decorator

⚠️ Still needs attention:
- Input validation: Partially done
- Consider adding: Email uniqueness check in DB

Recommendation: Safe to commit. Remaining issues are nice-to-have.
```

### Step 5: Commit
```
User: Looks good, commit

AI:
# Commit Summary

Changes to be committed:
- src/api/users.py: Added parameterized queries, rate limiting
- src/middleware/auth.py: New authentication middleware
- tests/test_users.py: Updated tests

Commit message:
```
feat: add user creation with auth middleware

- Implement parameterized queries to prevent SQL injection
- Add rate limiting to user creation endpoint
- Add JWT authentication middleware
- Update tests for new auth flow

Security: SQL injection risk fixed
Tests: All passing

🤖 Generated with AI Productivity Kit
```

Ready to commit? [y/n]
```

## Commands Used Summary

| Command | Purpose |
|---------|---------|
| `git diff` | See what changed |
| `/ai-kit:review` | Review code |
| `/ai-kit:delegate review` | Deep review with agent |

## Code Review Checklist

The review command checks:

### Security
- [ ] SQL injection
- [ ] XSS vulnerabilities
- [ ] Authentication/authorization
- [ ] Sensitive data exposure
- [ ] Input validation

### Performance
- [ ] N+1 queries
- [ ] Missing indexes
- [ ] Unnecessary loops
- [ ] Memory leaks
- [ ] Caching opportunities

### Code Quality
- [ ] Type hints
- [ ] Docstrings
- [ ] Naming conventions
- [ ] Code duplication
- [ ] Error handling

### Testing
- [ ] Tests added
- [ ] Edge cases covered
- [ ] Test quality

## Review Output Format

```
Severity Levels:
🔴 Critical  - Must fix before commit
🟠 High     - Should fix before commit
🟡 Medium   - Fix soon
🟢 Low      - Nice to have
```

## Tips for Code Reviews

1. **Review early and often** - Don't wait until "done"
2. **Self-review first** - Run `/ai-kit:review` before pushing
3. **Fix issues incrementally** - Don't try to fix everything at once
4. **Re-review after fixes** - Run review again to verify
5. **Learn from patterns** - Save common issues as tricks
