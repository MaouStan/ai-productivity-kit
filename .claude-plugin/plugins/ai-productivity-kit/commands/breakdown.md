---
description: "แบ่งงานใหญ่เป็น task เล็กๆ | Break complex task into smaller pieces"
allowed-tools:
  - TodoWrite
  - AskUserQuestion
---

# /ai-kit:breakdown

**แบ่งงานใหญ่เป็น task เล็กๆ**
*Break complex task into smaller pieces*

## ทำอะไร
- รับ task ใหญ่
- วิเคราะห์และแบ่งเป็น sub-tasks
- สร้าง todo list
- ประเมิน effort แต่ละ task

## Usage
```
/ai-kit:breakdown [task description]
```

## AI Instructions
เมื่อ user พิมพ์ `/ai-kit:breakdown [task]`:

1. **Understand the task** - ถามคำถามถ้าไม่ชัดเจน:
   - มี requirement อะไรเพิ่มเติมไหม?
   - ใช้ technology อะไร?
   - มี constraint อะไรไหม?

2. **Break it down** เป็น:
   - Research/Planning tasks
   - Implementation tasks
   - Testing tasks
   - Documentation tasks

3. **Create todo list** ด้วย TodoWrite tool

4. **Show plan** ในรูปแบบ table

## Example
```
User: /ai-kit:breakdown ทำระบบ login ด้วย JWT

AI:
# Task Breakdown: JWT Login System

## Phase 1: Research & Design
- [ ] Research JWT libraries for Python
- [ ] Design auth flow diagram
- [ ] Define API endpoints
- [ ] Plan database schema

## Phase 2: Core Implementation
- [ ] Install dependencies (python-jose, passlib, bcrypt)
- [ ] Create User model (if not exists)
- [ ] Implement password hashing
- [ ] Create JWT token generation
- [ ] Implement login endpoint
- [ ] Implement logout endpoint

## Phase 3: Security
- [ ] Add input validation
- [ ] Implement token refresh flow
- [ ] Add rate limiting
- [ ] Secure cookie handling

## Phase 4: Testing
- [ ] Unit tests for auth functions
- [ ] Integration tests for endpoints
- [ ] Test security scenarios

## Phase 5: Documentation
- [ ] Document API endpoints
- [ ] Write setup guide
- [ ] Add usage examples

## Estimated Effort
| Phase | Tasks | Est. Time |
|-------|-------|-----------|
| Research | 4 | 1-2 hrs |
| Implementation | 6 | 3-4 hrs |
| Security | 4 | 2-3 hrs |
| Testing | 3 | 2-3 hrs |
| Documentation | 3 | 1-2 hrs |
| **Total** | **20** | **9-14 hrs** |

Created todo list with 20 items. Ready to start! 🚀
```
