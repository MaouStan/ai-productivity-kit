# AI Productivity Kit

**เครื่องมือเสริมประสิทธิภาพการเขียนโปรแกรมด้วย AI**

Complete productivity toolkit for Claude Code with 17 commands, 8 skills, 4 agents, and knowledge base. Thai/English bilingual support.

## Quick Start

### First Time Setup

```bash
# Option 1: Using nat-agents-core (recommended)
/nat-agents-core:awaken   # Full setup with agents/, CLAUDE.md, ψ/ structure

# Option 2: Built-in setup
/ai-kit:init              # Initialize ψ/ structure only
```

The `/awaken` command sets up your project with:
- **agents/** - Pre-configured agent templates for your project
- **CLAUDE.md** - Team configuration with AI agent setup
- **ψ/** - Memory structure (inbox/, memory/, incubate/, etc.)

### Daily Workflow

```bash
/ai-kit:start    # Start new session
/nnn plan        # Create implementation plan
/gogogo          # Execute plan
/rrr             # Review & learn
/ccc             # Save context before leaving
```

## Features

### Core Commands (4)
- `/nnn` - Create implementation plans with task breakdown
- `/gogogo` - Execute latest plan automatically
- `/rrr` - Session retrospective with learnings
- `/ccc` - Save context + compact conversation

### Session Commands (4)
- `/ai-kit:start` - Start new session
- `/ai-kit:focus` - Set task focus
- `/ai-kit:pause` - Pause work temporarily
- `/recap` - View current status

### Knowledge Commands (4)
- `/ai-kit:note` - Save notes
- `/ai-kit:trick` - Save code tricks
- `/ai-kit:pattern` - Save reusable patterns
- `/ai-kit:learn` - Capture learning

### Code Quality (2)
- `/ai-kit:review` - Code review
- `/ai-kit:debug` - Debug errors

### Project Commands (4)
- `/lll` - Project status
- `/hours` - Work hours tracking
- `/trace` - Search everything
- `/forward` - Save for next session

### Task Commands (2)
- `/ai-kit:breakdown` - Break down large tasks
- `/ai-kit:delegate` - Assign to agents

## Installation

```bash
# Add marketplace
/plugin marketplace add MaouStan/ai-productivity-kit

# Install plugin
/plugin install ai-productivity-kit@MaouStan/ai-productivity-kit
```

Restart Claude Code after installation.

## Project Structure After Awaken

```
your-project/
├── agents/           # Agent templates
│   ├── coder.md
│   ├── debug-helper.md
│   ├── test-writer.md
│   └── doc-writer.md
├── CLAUDE.md         # Team configuration
├── ψ/                # Memory structure
│   ├── inbox/        # focus.md, WIP.md
│   ├── memory/       # tricks/, patterns/, retros/
│   ├── incubate/     # Work in progress
│   └── learn/        # Learning materials
└── .claude/          # Claude settings
```

## Full Workflow Example

Here's a complete workflow showing how to use the kit for a real task:

```
# === Morning: Start Session ===
User: /ai-kit:start

AI:
# Session Start
Time: 2026-01-03 09:00

## Focus: Add JWT authentication to API

### Today's Tasks
1. Design auth flow
2. Implement JWT middleware
3. Add login/logout endpoints
4. Write tests

Ready to start?

# === Plan the Work ===
User: /nnn Implement JWT authentication

AI:
# Implementation Plan: JWT Authentication

## Tasks
- [ ] Task 1: Research JWT libraries
- [ ] Task 2: Design auth flow
- [ ] Task 3: Implement password hashing
- [ ] Task 4: Create JWT middleware
- [ ] Task 5: Add login endpoint
- [ ] Task 6: Add logout endpoint
- [ ] Task 7: Write tests

Created issue #13 (plan)

# === Execute ===
User: /gogogo

AI:
# Executing Plan: JWT Authentication

## Task 1: Research JWT libraries
Found: python-jose, passlib
✅ Complete!

## Task 2: Design auth flow
[Creates flow diagram]
✅ Complete!

## Task 3: Implement password hashing
[Implementing bcrypt hashing]
✅ Complete!

[... continues through all tasks ...]

# === Pause for Lunch ===
User: /ai-kit:pause

AI:
⏸️ Session paused!

STATE: paused
PAUSED_AT: 12:00
WAS_DOING: JWT Authentication - Testing in progress

## Progress
- ✅ Tasks 1-6 complete
- 🔄 Task 7: Writing tests

## Resume With
1. Complete auth tests
2. Test login/logout flow

See you after lunch! 👋

# === After Lunch: Resume ===
User: /recap

AI:
📍 Current Focus

## Task
JWT Authentication - Testing in progress

## Progress
✅ Completed: Tasks 1-6
🔄 In Progress: Task 7 - Writing tests

## Next Steps
1. Complete auth tests
2. Run pytest

Ready to continue?

User: /gogogo

[Resumes from Task 7...]

# === End of Day: Review ===
User: /rrr

AI:
# Session Retrospective
**Date**: 2026-01-03
**Hours**: 5.5

## Completed ✅
JWT Authentication fully implemented:
- Password hashing with bcrypt
- JWT middleware
- Login/logout endpoints
- 12 tests passing

## Learnings 🧠
1. Use python-jose for JWT (easier than PyJWT)
2. Store tokens in httpOnly cookies
3. Add refresh token rotation for security

## Issues Created
- #13: Plan JWT Auth ✅ (closed)
- #14: Context: JWT implementation ✅ (closed)

## Tomorrow 📅
- [ ] Add rate limiting
- [ ] Document API endpoints
- [ ] Add to production

Saved to: ψ/memory/retros/2026-01-03_jwt_auth.md

# === Save Context for Tomorrow ===
User: /forward

AI:
📝 Context saved to ψ/inbox/WIP.md

Next session: /recap to restore!
```

## Key Workflow Patterns

### Short Codes Flow
```
nnn → gogogo → rrr → ccc
Plan → Execute → Review → Save
```

### Daily Cycle
```
/ai-kit:start → [work] → /ai-kit:pause → /recap → [work] → /rrr → /forward
```

### Task Breakdown
```
/ai-kit:breakdown [big task] → /nnn [refined plan] → /gogogo
```

## Homepage

https://github.com/MaouStan/ai-productivity-kit
