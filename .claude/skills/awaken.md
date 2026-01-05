# ai-kit:awaken

**🔮 Awaken AI Productivity Kit - Setup git, remote, and command workflows**

## Description

Lightweight project setup - initializes git repo, configures GitHub remote for issue tracking, creates command workflow templates, ψ/ structure, and runs team-configurator. **Does NOT copy commands/agents** - uses plugin references.

## What It Does

### 1. Git Initialization
- Checks if `.git/` exists
- If not: runs `git init`
- Commits initial project structure

### 2. GitHub Remote Setup
- Prompts for your GitHub repository URL
- Sets `origin` remote
- Enables issue tracking workflows

### 3. Creates Plugin References (No Copying)
- `.claude/commands-ref.md` - Reference to plugin commands
- `.claude/agents-ref.md` - Reference to plugin agents
- `.claude/skills-ref.md` - Reference to plugin skills

**NOT copied** - commands/agents remain in plugin.

### 4. GitHub Workflows for Commands
- `.github/workflows/command-issue.yml` - Auto-create issues from commands
- `.github/workflows/session-tracker.yml` - Track work sessions
- `.github/workflows/retro-collector.yml` - Collect retrospectives

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
/ai-kit:awaken
```

## After Awaken

```bash
# Start session
/ai-kit:start

# Create plan
/nnn implement user authentication

# Execute plan
/gogogo

# End session with retro
/rrr
```

## GitHub Workflows

The awaken command creates 3 GitHub Actions workflows:

1. **Command Issue Generator** - Manually trigger to create issues from commands
2. **Session Tracker** - Track start/pause/end sessions
3. **Retrospective Collector** - Save retrospectives to repo

## Check Installation

```bash
# Verify structure
ls -la .claude/*-ref.md
ls -la .github/workflows/
ls -la ψ/
git remote -v
```

## Version Info

- **Version**: 2.0.0
- **Updated**: 2026-01-05
- **Changes**: Git init, remote config, workflows, no file copying
- **Compatible**: Claude Code 1.0+

---

**Awaken the productivity within your project! 🔮**
