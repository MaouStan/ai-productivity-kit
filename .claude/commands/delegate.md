# /ai-kit:delegate

**มอบหมายงานให้ subagent**
*Delegate task to specialized agent*

## ทำอะไร
- เลือก agent ที่เหมาะกับงาน
- ส่ง task พร้อม context
- ติดตามผลลัพธ์

## Usage
```
/ai-kit:delegate [task description]
```

## AI Instructions
เมื่อ user พิมพ์ `/ai-kit:delegate [task]`:

1. **Analyze task type** และเลือก agent:
   | Task Type | Agent |
   |-----------|-------|
   | Write code | `coder` |
   | Find context/files | `context-finder` |
   | Review code | `code-reviewer` |
   | Write tests | `test-writer` |
   | Debug error | `debug-helper` |
   | Refactor code | `code-simplifier` |
   | Write docs | `doc-writer` |
   | General help | `general-purpose` |

2. **Gather context**:
   - Current git diff (unstaged changes)
   - Relevant files (ตาม task)
   - Project structure

3. **Launch agent** ด้วย Task tool

4. **Report result** กลับ user

## Example
```
User: /ai-kit:delegate เขียน test สำหรับ auth function

AI:
🔄 Delegating to test-writer agent...

[Test agent running...]
✅ Tests created!

Files:
- tests/test_auth.py (47 lines, 12 tests)
- tests/conftest.py (fixtures for auth tests)

Coverage: auth.py now at 89%

Run: pytest tests/test_auth.py -v
```
