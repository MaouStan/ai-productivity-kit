# Quick Start Template

**Copy this to start using AI Productivity Kit immediately**

## One-Line Setup

### Linux/Mac
```bash
bash <(curl -s https://raw.githubusercontent.com/YOUR_USERNAME/ai-productivity-kit/main/install.sh)
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/ai-productivity-kit/main/install.ps1 | iex
```

## Manual Setup (3 steps)

```bash
# 1. Create structure
mkdir -p .claude/commands .claude/agents .claude/skills .claude/knowledge
mkdir -p psi/{active,inbox,memory/{tricks,patterns,retros,logs},writing,lab}

# 2. Copy from installed kit
cp -r ~/.ai-productivity-kit/.claude/* .claude/

# 3. Start
/ai-kit:start
```

## First Session (5 minutes)

```bash
# 1. Start
/ai-kit:start

# 2. Set focus
/ai-kit:focus "Set up project"

# 3. Learn the basics
/ai-kit:note "Read quick-reference.md"

# 4. End
/rrr
```

## Verify Installation

```bash
# Check structure
ls .claude/commands/  # Should show 15 commands
ls .claude/agents/    # Should show 4 agents
ls .claude/skills/    # Should show 7 skills
ls .claude/knowledge/ # Should show 6 docs

# Test command
/ai-kit:start        # Should show session start
```

## Essential Commands (memorize these)

```
/ai-kit:start    → Start day
/nnn [desc]      → Create plan
/gogogo         → Execute plan
/rrr            → End day
```

## Need Help?

```bash
/ai-kit:help     # Show all commands
/recap          # See current state
/trace [term]   # Find anything
```

## Next Steps

1. Read `.claude/knowledge/quick-reference.md`
2. Try the example workflows in `examples/`
3. Customize for your project
4. Build your own tricks and patterns
