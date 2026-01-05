---
description: "Awaken the Oracle - Setup git, remote, and workflows (no file copying)"
allowed-tools:
  - Read
  - Write
  - Bash
  - Task
  - Glob
  - TodoWrite
  - AskUserQuestion
---

# /ai-kit:awaken

**Awaken the Oracle**
*Setup git, remote, and command workflows*

## Description

Lightweight setup - initializes git repo, configures GitHub remote for issues, creates command workflow templates, and runs team-configurator. **Does NOT copy commands/agents** - uses plugin references.

## What It Does

### 1. Git Initialization
- Checks if `.git/` exists
- If not: runs `git init`
- Commits initial project structure

### 2. GitHub Remote Setup
- Prompts for your GitHub repository URL
- Sets `origin` remote: `git remote add origin <url>`
- Enables issue tracking workflows

### 3. Creates Plugin Reference (No Copying)
```
.claude/
├── commands-ref.md    # Reference to plugin commands
├── agents-ref.md      # Reference to plugin agents
└── skills-ref.md      # Reference to plugin skills
```

**NOT copied** - commands/agents remain in plugin, referenced via these files.

### 4. GitHub Workflows for Commands
Creates `.github/workflows/` with:
- `command-issue.yml` - Auto-create issues from commands
- `session-tracker.yml` - Track work sessions
- `retro-collector.yml` - Collect retrospectives

### 5. Creates ψ/ Structure
```
ψ/
├── active/       # Current research/work
├── inbox/        # focus.md, WIP.md
├── memory/       # tricks, patterns, retros, logs
├── writing/      # Drafts
├── lab/          # Experiments
└── learn/        # Learning materials
```

### 6. Runs team-configurator
- Generates project-specific `CLAUDE.md`

## Usage

```
User: /ai-kit:awaken
```

## AI Instructions

When user types `/ai-kit:awaken`:

### Step 1: Check Git Status
```bash
# Check if already a git repo
git rev-parse --git-dir 2>/dev/null

# If not (exit code != 0):
git init
git add .
git commit -m "Initial commit - AI Productivity Kit awaken"
```

### Step 2: Configure GitHub Remote
Use `AskUserQuestion` tool:
```json
{
  "questions": [{
    "question": "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git):",
    "header": "GitHub Repo",
    "multiSelect": false,
    "options": []
  }]
}
```

Then set remote:
```bash
# Remove existing origin if any
git remote remove origin 2>/dev/null || true

# Add new origin from user input
git remote add origin "<user_input_url>"

# Verify
git remote -v
```

### Step 3: Create Plugin References (NOT copies)

Create `.claude/commands-ref.md`:
```markdown
# Commands Reference

Commands are provided by **ai-productivity-kit** plugin.

## Installed Commands

| Command | Description |
|---------|-------------|
| /nnn | Create implementation plan |
| /gogogo | Execute latest plan |
| /rrr | Session retrospective |
| /ccc | Save context and compact |
| /ai-kit:start | Start work session |
| /ai-kit:focus | Set current focus |
| /ai-kit:pause | Pause session |
| /ai-kit:recap | Show context summary |
| /ai-kit:hours | Track work hours |
| /note | Quick note capture |
| /trick | Save code trick |
| /pattern | Save reusable pattern |
| /ai-kit:learn | Learn from content |
| /lll | Project status |
| /trace | Search everything |
| /ai-kit:forward | Handoff to next session |
| /ai-kit:breakdown | Break down tasks |
| /ai-kit:delegate | Delegate to agent |

## Workflow

```
/ai-kit:start → /nnn → /gogogo → /rrr → /ccc
```

## Plugin Location
~/.claude/plugins/marketplaces/ai-productivity-kit/.claude/commands/
```

Create `.claude/agents-ref.md`:
```markdown
# Agents Reference

Agents are provided by **ai-productivity-kit** plugin.

## Available Agents

| Agent | Purpose | Usage |
|-------|---------|-------|
| coder | Write code from specs | /ai-kit:delegate coder |
| debug-helper | Debug and fix errors | /ai-kit:delegate debug-helper |
| test-writer | Write tests | /ai-kit:delegate test-writer |
| doc-writer | Write documentation | /ai-kit:delegate doc-writer |

## Plugin Location
~/.claude/plugins/marketplaces/ai-productivity-kit/.claude/agents/
```

Create `.claude/skills-ref.md`:
```markdown
# Skills Reference

Skills are provided by **ai-productivity-kit** plugin.

## Available Skills

| Skill | Description |
|-------|-------------|
| ai-kit-init | Initialize structure |
| ai-kit-learn | Learn from content |
| ai-kit-recap | Show context summary |
| ai-kit-forward | Forward to next session |
| ai-kit-breakdown | Break down tasks |
| ai-kit-ccc | Save context |
| ai-kit-delegate | Delegate to agent |
| ai-kit-focus | Set current focus |
| ai-kit-gogogo | Execute plan |
| ai-kit-awaken | Full setup |
| ai-kit-hours | Track time |
| ai-kit-lll | Project status |
| ai-kit-nnn | Create plan |
| ai-kit-note | Quick note |
| ai-kit-pause | Pause session |
| ai-kit-pattern | Save pattern |
| ai-kit-rrr | Retrospective |
| ai-kit-start | Start session |
| ai-kit-trace | Search |
| ai-kit-trick | Save trick |

## Plugin Location
~/.claude/plugins/marketplaces/ai-productivity-kit/.claude/skills/
```

### Step 4: Create GitHub Workflows

Create `.github/workflows/command-issue.yml`:
```yaml
name: Command Issue Generator

on:
  workflow_dispatch:
    inputs:
      command:
        description: 'Command that triggered this'
        required: true
        default: 'nnn'
      context:
        description: 'Context/arguments'
        required: false

permissions:
  contents: read
  issues: write

jobs:
  create-issue:
    runs-on: ubuntu-latest
    steps:
      - name: Create issue from command
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: `/${{ inputs.command }}: ${{ inputs.context || 'No context' }}`,
              body: `Command: ${{ inputs.command }}\nContext: ${{ inputs.context }}\nCreated: ${new Date().toISOString()}`,
              labels: ['command', '${{ inputs.command }}']
            })
```

Create `.github/workflows/session-tracker.yml`:
```yaml
name: Session Tracker

on:
  workflow_dispatch:
    inputs:
      action:
        description: 'start | pause | end'
        required: true
        default: 'start'
      focus:
        description: 'Current focus'
        required: false

permissions:
  contents: write

jobs:
  track-session:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Update session log
        run: |
          mkdir -p ψ/memory/logs
          echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] ${{ inputs.action }}: ${{ inputs.focus }}" >> ψ/memory/logs/sessions.log
          git config user.name "Claude Code"
          git config user.email "claude@ai-kit"
          git add ψ/memory/logs/sessions.log
          git commit -m "session: ${{ inputs.action }}" || echo "No changes to commit"
          git push
```

Create `.github/workflows/retro-collector.yml`:
```yaml
name: Retrospective Collector

on:
  workflow_dispatch:
    inputs:
      did:
        description: 'What we did'
        required: true
      learned:
        description: 'What we learned'
        required: false
      next:
        description: 'Next steps'
        required: false

permissions:
  contents: write
  issues: write

jobs:
  collect-retro:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Save retro
        run: |
          mkdir -p ψ/memory/retros
          cat > ψ/memory/retros/$(date +%Y%m%d-%H%M%S).md << 'EOF'
          # Retrospective - $(date -u +%Y-%m-%dT%H:%M:%SZ)

          ## What We Did
          ${{ inputs.did }}

          ## What We Learned
          ${{ inputs.learned || 'Nothing new' }}

          ## Next Steps
          ${{ inputs.next || 'TBD' }}
          EOF
          git config user.name "Claude Code"
          git config user.email "claude@ai-kit"
          git add ψ/memory/retros/
          git commit -m "retro: add retrospective"
          git push
```

### Step 5: Create ψ/ Structure
```bash
mkdir -p ψ/active ψ/inbox ψ/memory/tricks ψ/memory/patterns ψ/memory/retros ψ/memory/logs ψ/writing ψ/lab ψ/learn
touch ψ/active/.gitkeep ψ/inbox/.gitkeep ψ/memory/tricks/.gitkeep ψ/memory/patterns/.gitkeep ψ/memory/retros/.gitkeep ψ/memory/logs/.gitkeep ψ/writing/.gitkeep ψ/lab/.gitkeep ψ/learn/.gitkeep
```

### Step 6: Create Initial Files
- `ψ/inbox/focus.md` with template
- Update `.gitignore` with ψ rules (keep structure, ignore content)

### Step 7: CRITICAL - Run team-configurator
```
Task(
  subagent_type="team-configurator",
  prompt="Set up AI team configuration for this project. Detect tech stack, create CLAUDE.md with project-specific instructions.",
  model="sonnet"
)
```

### Step 8: Commit Everything
```bash
git add .claude/ .github/ ψ/
git commit -m "feat: awaken AI Productivity Kit setup"
```

### Step 9: Report Summary
Show:
- Git repo status
- Remote URL configured
- Reference files created
- Workflows created
- ψ/ structure
- CLAUDE.md generated
- Next steps

## Example Output

```
# Awakening AI Productivity Kit...

[1/7] Checking git status...
  ✓ Already initialized (or initializing now)

[2/7] Configuring GitHub remote...
  ? Enter your GitHub repository URL: https://github.com/username/project.git
  ✓ Remote set to origin

[3/7] Creating plugin references...
  ✓ .claude/commands-ref.md
  ✓ .claude/agents-ref.md
  ✓ .claude/skills-ref.md
  (Commands/agents stay in plugin - not copied)

[4/7] Creating GitHub workflows...
  ✓ .github/workflows/command-issue.yml
  ✓ .github/workflows/session-tracker.yml
  ✓ .github/workflows/retro-collector.yml

[5/7] Creating ψ/ structure...
  ✓ ψ/active/
  ✓ ψ/inbox/
  ✓ ψ/memory/
  ✓ ψ/writing/
  ✓ ψ/lab/
  ✓ ψ/learn/

[6/7] Running team-configurator...
  [Analyzing codebase...]
  [Detecting tech stack...]
  ✓ CLAUDE.md created!

[7/7] Committing setup...
  ✓ Git commit created

Awakening complete!  🔮

Next steps:
  1. Review: cat CLAUDE.md
  2. Start session: /ai-kit:start
  3. Create plan: /nnn "your task"
  4. Push to GitHub: git push -u origin master

The Oracle has awakened!
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

## gitignore Addition
```gitignore
# AI Productivity Kit - ψ Structure
# Ignore content but keep directories
ψ/*/
!ψ*/.gitkeep

# But track these
ψ/inbox/focus.md
```

## Related Commands
- `/ai-kit:init` - Quick setup (ψ/ only, no git)
- `/ai-kit:start` - Start work session
- `/lll` - Check git status and project state

## When to Use
- First time setting up a new project
- Want GitHub integration for issues
- Want workflow automation for commands
- Prefer plugin reference over file copying

## Version
- **Version**: 2.0.0
- **Updated**: 2026-01-05
- **Changes**: Git init, remote config, workflows, no file copying
