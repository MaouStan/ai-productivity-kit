# Ralph Integration

**Use AI Productivity Kit with Ralph autonomous development loop**

## Overview

Ralph provides autonomous execution, AI Productivity Kit provides planning and learning. Together they create a complete development workflow.

## Combined Workflow

```
┌─────────────────────────────────────────────────────────┐
│  Planning Phase (AI Productivity Kit)                   │
├─────────────────────────────────────────────────────────┤
│  /ccc          →  Create context issue                  │
│  /nnn [desc]   →  Create implementation plan            │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  Execution Phase (Ralph)                                │
├─────────────────────────────────────────────────────────┤
│  ralph --monitor  →  Execute autonomously               │
│                    (with live dashboard)                │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  Learning Phase (AI Productivity Kit)                   │
├─────────────────────────────────────────────────────────┤
│  /rrr          →  Session retrospective                 │
│  /ai-kit:learn →  Capture key learnings                 │
│  /ai-kit:pattern → Save discovered patterns            │
└─────────────────────────────────────────────────────────┘
```

## Setup

### 1. Install Both Tools

```bash
# Ralph
git clone https://github.com/frankbria/ralph-claude-code.git
cd ralph-claude-code
./install.sh

# AI Productivity Kit
cd your-project
/ai-kit:awaken
```

### 2. Configure Ralph to Use AI Kit Commands

Edit `ralph/PROMPT.md` to include:

```markdown
## Available Commands

When planning:
- Use /ccc to save context before starting
- Use /nnn to create detailed implementation plans

When stuck:
- Use /ai-kit:debug to analyze issues
- Use /ai-kit:delegate to get specialized help

When complete:
- Use /rrr to create retrospective
- Use /ai-kit:learn to capture findings
```

## Usage Examples

### Example 1: Feature Development

```bash
# 1. Plan with AI Productivity Kit
/ccc
/nnn Implement user authentication with JWT

# 2. Execute with Ralph
ralph --monitor

# Ralph will:
# - Read the plan from /nnn
# - Execute tasks autonomously
# - Report progress with status blocks
# - Detect completion intelligently

# 3. Learn from results
/rrr
/ai-kit:pattern JWT authentication flow
```

### Example 2: Bug Fix

```bash
# 1. Document the bug
/ai-kit:note "Bug: Login fails with special chars in password"

# 2. Let Ralph fix it
ralph --prompt "Fix the login bug with special characters"

# 3. Save the solution
/ai-kit:trick python password validation with special chars
```

### Example 3: Refactoring

```bash
# 1. Plan the refactor
/nnn Refactor user service to use repository pattern

# 2. Autonomous execution
ralph --calls 50  # Limit API calls

# 3. Review results
/ai-kit:review
```

## Status Protocol Alignment

Both tools use compatible status reporting:

```markdown
---STATUS---
STATUS: IN_PROGRESS | COMPLETE | BLOCKED
TASKS_COMPLETED_THIS_LOOP: <number>
FILES_MODIFIED: <number>
TESTS_STATUS: PASSING | FAILING
EXIT_SIGNAL: true | false
RECOMMENDATION: <summary>
---END_STATUS---
```

Ralph outputs this format; AI Productivity Kit reads it.

## Circuit Breaker Integration

```bash
# Ralph's circuit breaker prevents runaway loops
# AI Productivity Kit's /pause can manually stop

# If Ralph gets stuck:
/ai-kit:pause    # Pauses current work
ralph --reset-circuit  # Resets breaker
# Then continue with different approach
```

## Exit Detection

Ralph detects when work is complete:
- Consecutive "done" responses
- All plan items completed
- Test saturation

When complete, use `/rrr` to capture what was learned.

## Quick Commands

```bash
# Start new feature
/ccc && /nnn [feature] && ralph --monitor

# Continue previous work
/recap && ralph --monitor

# Debug stuck Ralph
/ai-kit:debug [ralph error]
ralph --reset-circuit

# Complete session
/rrr && /ai-kit:learn
```

## Tips

1. **Always plan first** - Use /nnn before ralph
2. **Monitor closely** - Use --monitor for first few runs
3. **Set limits** - Use --calls to control cost
4. **Save learnings** - Use /rrr after ralph completes
5. **Combine patterns** - Use /ai-kit:delegate for complex tasks

## File Structure

```
project/
├── ralph/              # Ralph files
│   ├── @PROMPT.md
│   ├── @fix_plan.md
│   └── ralph_loop.sh
├── .claude/            # AI Productivity Kit
│   ├── commands/
│   ├── agents/
│   └── knowledge/
└── ψ/                  # Shared knowledge
    ├── inbox/
    └── memory/
```

Both tools share the ψ/ directory for knowledge storage.
