---
description: "Awaken the Oracle - Install commands and agents in your project"
allowed-tools:
  - Read
  - Write
  - Bash
  - Task
  - Glob
  - TodoWrite
---

# /ai-kit:awaken

**Awaken the Oracle**
*Install commands and agents in your project*

## Description

Full setup for AI Productivity Kit - installs all commands, agents, skills, creates ψ/ structure, and runs team-configurator to generate CLAUDE.md.

## What It Does

### 1. Creates Directory Structure
```
.claude/
├── commands/     # All slash commands (symlinked/copied from plugin)
├── agents/       # Agent definitions (symlinked/copied from plugin)
├── skills/       # Skill definitions (symlinked/copied from plugin)
└── knowledge/    # Documentation base (symlinked/copied from plugin)

ψ/
├── active/       # Current research/work
├── inbox/        # focus.md, messages, WIP.md
├── memory/       # tricks, patterns, retros, logs
├── writing/      # Drafts, documentation
├── lab/          # Experiments, prototypes
└── learn/        # Learning materials
```

### 2. What Gets Installed

**Commands (17):**
- Core: `nnn`, `gogogo`, `rrr`, `ccc`
- Session: `start`, `focus`, `pause`, `recap`, `hours`
- Knowledge: `note`, `trick`, `pattern`, `learn`
- Project: `lll`, `trace`, `forward`
- Tasks: `breakdown`, `delegate`
- Setup: `init`, `awaken`

**Agents (4):**
- `coder` - Write code from specs
- `debug-helper` - Debug and fix errors
- `test-writer` - Write comprehensive tests
- `doc-writer` - Write documentation

**Skills (8):**
- `ai-kit-init` - Initialize structure
- `ai-kit-learn` - Learn from content
- `ai-kit-recap` - Show context summary
- `ai-kit-forward` - Forward to next session
- `ai-kit-breakdown` - Break down tasks
- `ai-kit-ccc` - Save context
- `ai-kit-delegate` - Delegate to agent
- `ai-kit-focus` - Set current focus

**Knowledge Base:**
- Comprehensive guides
- Quick reference
- Best practices
- AI prompts
- Short codes workflow
- Ralph concepts

### 3. Creates Initial Files
- `ψ/inbox/focus.md` - Current focus tracker
- `ψ/memory/.gitkeep` - Keep directory structure
- Updates `.gitignore` with ψ rules
- **Runs team-configurator** to generate CLAUDE.md

## Usage

```
User: /ai-kit:awaken
```

## AI Instructions

เมื่อ user พิมพ์ `/ai-kit:awaken`:

1. **Create .claude/ directory structure**:
   - ใช้ `Bash` tool: `mkdir -p .claude/commands .claude/agents .claude/skills .claude/knowledge`

2. **Copy commands from plugin**:
   - Find plugin location using `Glob` tool
   - Copy all .md files from plugin commands/ to .claude/commands/
   - Use `Bash` with `cp` command (Unix) or `copy` (Windows)

3. **Copy agents from plugin**:
   - Copy all agent .md files from plugin agents/ to .claude/agents/

4. **Copy skills from plugin**:
   - Copy all skill .md files from plugin skills/ to .claude/skills/

5. **Create ψ/ structure**:
   - `mkdir -p ψ/active ψ/inbox ψ/memory/tricks ψ/memory/patterns ψ/memory/retros ψ/memory/logs ψ/writing ψ/lab ψ/learn`
   - Create `.gitkeep` files in each directory

6. **Create initial files**:
   - Use `Write` tool to create `ψ/inbox/focus.md` with template
   - Update `.gitignore` with ψ rules if not present

7. **CRITICAL: Run team-configurator**:
   - **IMPORTANT**: Must actually call the Task tool to create CLAUDE.md
   - Execute: `Task` tool with `subagent_type=team-configurator` and `prompt="Set up AI team configuration for this project"`
   - Wait for agent to complete and generate CLAUDE.md

8. **Report summary**:
   - Show all directories created
   - Show all files copied
   - Confirm CLAUDE.md was created
   - Show next steps

## CRITICAL: Task Tool Call

**You MUST actually execute this Task call**:

```
Task(
  subagent_type="team-configurator",
  prompt="Set up AI team configuration for this project. Detect tech stack, create CLAUDE.md with project-specific instructions.",
  model="sonnet"
)
```

Do NOT just say "running team-configurator" - actually call the Task tool!

## Example

```
User: /ai-kit:awaken

AI:
# Awakening AI Productivity Kit...

Creating .claude/ directory structure...
  .claude/commands/
  .claude/agents/
  .claude/skills/
  .claude/knowledge/

Installing commands (17 files)...
  nnn.md, gogogo.md, rrr.md, ccc.md, start.md, focus.md...
  ✓ All commands installed

Installing agents (4 files)...
  coder.md, debug-helper.md, test-writer.md, doc-writer.md
  ✓ All agents installed

Installing skills (8 files)...
  ai-kit-init.md, ai-kit-learn.md, ai-kit-recap.md...
  ✓ All skills installed

Creating ψ/ structure (7 pillars)...
  ψ/active/, ψ/inbox/, ψ/memory/, ψ/writing/, ψ/lab/, ψ/learn/
  ✓ Structure created

Creating initial files...
  ψ/inbox/focus.md
  ✓ Created

Updating .gitignore...
  ✓ Added ψ/ rules

Running team-configurator to generate CLAUDE.md...
  [Analyzes codebase...]
  [Detects tech stack...]
  [Selects appropriate agents...]
  ✓ CLAUDE.md created!

Awakening complete!  [25 commands, skills, and agents installed]

Next steps:
  1. Review: cat CLAUDE.md
  2. Start session: /ai-kit:start
  3. Create plan: /nnn "your task"

🔮 The Oracle has awakened!
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
# AI Productivity Kit - ψ Structure
ψ/active/
ψ/inbox/
ψ/memory/
ψ/writing/
ψ/lab/
ψ/learn/
# But keep the directories
!ψ*/
!.gitkeep
```

## Related Commands
- `/ai-kit:init` - Quick setup (ψ/ structure only)
- `/ai-kit:start` - Start a work session
- `/nat-agents-core:awaken` - Oracle/Shadow philosophy setup

## When to Use
- First time setting up AI Productivity Kit
- Want complete setup with all components
- Moving from plugin to local installation

## Version
- **Version**: 1.0.0
- **Updated**: 2026-01-03
