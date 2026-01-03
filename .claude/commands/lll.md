# /ai-kit:lll

**List Project Status**
*แสดงสถานะ project ทั้งหมด - issues, PRs, commits, branches*

## ทำอะไร
แสดงภาพรวมของ project:
- Issues (open, in_progress, closed)
- Pull requests
- Recent commits
- Branches

## Template
```markdown
📊 Project Status: [project name]

## Issues
🔵 Open: [#] issues
🟡 In Progress: [#] issues
🟢 Closed (recent): [#] issues

### Open Issues
- #[number]: [title] ([labels])

### In Progress
- #[number]: [title] ([labels]) - [status]

## Pull Requests
🔵 Open: [#] PRs

### Open PRs
- #[number]: [title] ([status])

## Recent Commits
[commits จาก git log]

## Active Branches
[branches จาก git branch]
```

## Example
```
User: /lll

AI:
📊 Project Status: my-project

## Issues
🔵 Open: 3 issues
🟡 In Progress: 2 issues
🟢 Closed: 5 issues (this week)

### Open Issues
- #15: Add user profile (enhancement)
- #14: Fix login bug (bug)
- #13: Plan: Refresh token (plan)

### In Progress
- #12: Context: JWT Auth - Implementing refresh flow
- #10: Add rate limiting - Testing middleware

## Pull Requests
🔵 Open: 1 PR

### Open PRs
- #8: Feature/jwt-auth - Waiting for review

## Recent Commits
abc123 (2h ago): Add refresh token endpoint
def456 (4h ago): Implement token blacklist
789abc (Yesterday): Add JWT middleware

## Active Branches
* main
  feature/jwt-auth
  feature/rate-limiting
  bugfix/login-error
```

## When to Use
- อยากรู้สถานะ project
- กลับมาทำงานหลังจากห่างไปนาน
- เริ่ม session ใหม่
- ก่อนสร้าง issue ใหม่
