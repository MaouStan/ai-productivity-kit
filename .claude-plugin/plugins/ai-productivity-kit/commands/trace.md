---
description: "Search Everything in Project | ค้นหาทุกที่ใน project - git, files, issues, memory"
allowed-tools:
  - Bash
  - Grep
  - Glob
---

# /ai-kit:trace

**Search Everything in Project**
*ค้นหาทุกที่ใน project - git, files, issues, memory*

## ทำอะไร
ค้นหา query ใน:
- Git history (commits, messages)
- Files (code, docs)
- Issues (titles, bodies, comments)
- Retrospectives
- Context issues
- Memory (tricks, patterns, logs)

## Usage
```
/trace [query]                    # ค้นหาทุกที่
/trace [query] --code             # ค้นเฉพาะ code
/trace [query] --history          # ค้นเฉพาะ git history
/trace [query] --issues           # ค้นเฉพาะ issues
/trace [query] --memory           # ค้นเฉพาะ ψ/memory
```

## Template Output
```markdown
🔍 Trace Results: "[query]"

## Git History (X found)
{{git log --grep=query}}

## Files (X found)
{{grep results}}

## Issues (X found)
{{gh issue search results}}

## Memory (X found)
{{ψ/memory results}}
```

## Example
```
User: /trace refresh token

AI:
🔍 Trace Results: "refresh token"

## Git History (3 found)
abc123 (2h ago): Implement refresh token endpoint
def456 (1d ago): Add refresh token model
789abc (2d ago): Plan refresh token system

## Files (4 found)
src/api/auth.py:45: async def refresh_token(request):
src/models/user.py:12: refresh_token: str | None
tests/test_auth.py:78: def test_refresh_token():
docs/api.md:34: ## Refresh Token

## Issues (2 found)
#13: Plan: Refresh Token System (open)
#12: Context: JWT Auth (mentions refresh)

## Memory (1 found)
ψ/memory/retros/2026-01-02_retro.md:
  - Learned: Refresh tokens should rotate on use

---
Most relevant: src/api/auth.py:45
```

## When to Use
- หาไฟล์ที่มี keyword นั้น
- หาประวัติการเปลี่ยนแปลง
- หา context ที่เคยพูดถึง
- หา pattern/trick ที่เคยบันทึก
- หาว่าใครทำอะไรไปบ้าง

## Tips
- ใช้ quote สำหรับ phrase: `/"refresh token"`
- ใช้ regex: `/trace "token.*expir"`
- Combine flags: `/trace auth --code --history`
```

## Aliases
```
/find → เหมือน /trace
/search → เหมือน /trace
```
