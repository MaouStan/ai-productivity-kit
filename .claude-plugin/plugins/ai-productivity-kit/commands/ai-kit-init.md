---
description: "Initialize AI Productivity Kit - Create directory structure and initial files"
allowed-tools:
  - Read
  - Write
  - Bash
---

# /ai-kit:init

**Initialize AI Productivity Kit**
*ติดตั้ง AI Productivity Kit ในโปรเจกต์ปัจจุบัน*

## Description

Create the directory structure and initial files for the AI Productivity Kit.

## What It Creates

### Directory Structure
```
.claude/
├── commands/     # All slash commands (copied from plugin)
├── agents/       # Agent definitions (copied from plugin)
├── skills/       # Skill definitions (copied from plugin)
└── knowledge/    # Documentation base (copied from plugin)

psi/              # Memory structure (7 pillars)
├── active/       # Current research/work
├── inbox/        # focus.md, messages, WIP.md
├── memory/       # tricks, patterns, retros, logs
├── writing/      # Drafts, documentation
├── lab/          # Experiments, prototypes
└── learn/        # Learning materials
```

### Initial Files
- `psi/inbox/focus.md` - Current focus tracker
- `psi/memory/.gitkeep` - Keep directory structure
- Updates `.gitignore` with psi rules

## Usage

### Run the command
```
User: /ai-kit:init
```

### What happens
1. Creates `psi/` directory structure (7 pillars)
2. Creates initial `focus.md` with template
3. Updates `.gitignore` if needed
4. Reports what was created

## Example
```
User: /ai-kit:init

AI:
# Initializing AI Productivity Kit...

Creating directory structure:
  psi/
  psi/active/
  psi/inbox/
  psi/memory/
  psi/writing/
  psi/lab/
  psi/learn/

Creating initial files:
  psi/inbox/focus.md
  psi/memory/.gitkeep
  psi/writing/.gitkeep
  psi/lab/.gitkeep
  psi/learn/.gitkeep

Checking .gitignore...

AI Productivity Kit initialized!

Next steps:
  1. Review: cat psi/inbox/focus.md
  2. Start session: /ai-kit:start
  3. Create plan: /nnn "your task"
```

## focus.md Template
```markdown
# Current Focus

**Date**: {{timestamp}}
**Project**: {{project_name}}

## Tasks
- [ ] Task 1
- [ ] Task 2

## Notes

## Context
```

## gitignore Rules
If not already present, adds:
```gitignore
# AI Productivity Kit - Psi Structure
psi/active/
psi/inbox/
psi/memory/
psi/writing/
psi/lab/
psi/learn/
# But keep the directories
!psi*/
!.gitkeep
```

## Related Commands
- `/ai-kit:start` - Start a work session
- `/ai-kit:focus` - Set current focus
- `/nat-agents-core:awaken` - Full setup with agents

## When to Use
- First time using AI Productivity Kit
- After cloning to a new project
- When psi/ structure is missing

## Version
- **Version**: 1.0.0
- **Updated**: 2026-01-03
