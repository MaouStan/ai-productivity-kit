# ai-kit:awaken

**🔮 Awaken AI Productivity Kit - Install all commands and agents**

## Description
Initialize the AI Productivity Kit in the current project by installing all commands, skills, agents, and knowledge base.

## What It Does

### 1. Creates Directory Structure
```
.claude/
├── commands/     # All slash commands
├── agents/       # Agent definitions
├── skills/       # Skill definitions
└── knowledge/    # Documentation base

ψ/
├── active/       # Current research
├── inbox/        # focus.md, messages
├── memory/       # tricks, patterns, retros, logs
├── writing/      # Drafts
└── lab/          # Experiments
```

### 2. Installs Components

**Commands (15):**
- Core: nnn, gogogo, rrr, ccc
- Session: start, focus, pause, recap
- Knowledge: note, trick, pattern, learn
- Project: lll, hours, trace, forward
- Tasks: breakdown, delegate

**Agents (4):**
- coder, debug-helper, test-writer, doc-writer

**Skills (7):**
- init, learn, review, debug, delegate, trick, pattern

**Knowledge (6):**
- comprehensive-guide.md
- quick-reference.md
- best-practices.md
- ai-prompts.md
- short-codes-workflow.md
- ralph-concepts.md

### 3. Creates Initial Files
- `ψ/inbox/focus.md` - Current focus tracker
- `.claude/knowledge/project-notes.md` - Project-specific notes
- Updates `.gitignore` with ψ rules

## Usage

### Option 1: Using the skill directly
```
Run: /ai-kit:awaken
```

### Option 2: Manual installation
```bash
# Linux/Mac
bash install.sh

# Windows
.\install.ps1

# Or to specific directory
bash install.sh /path/to/project
```

### Option 3: Global installation
```bash
# Install globally first
bash install.sh --global

# Then use in any project
ai-kit init
```

## After Awaken

Once awakened, you can use all commands:

```bash
# Start session
/ai-kit:start

# Create plan
/nnn implement user authentication

# Execute plan
/gogogo

# Save what you learned
/ai-kit:trick python JWT handling is easier with python-jose

# End session
/rrr
```

## Check Installation

```bash
# Verify structure
ls -la .claude/commands/
ls -la .claude/agents/
ls -la .claude/skills/
ls -la .claude/knowledge/
ls -la ψ/
```

## Uninstall

```bash
# Remove files
rm -rf .claude/commands/
rm -rf .claude/agents/
rm -rf .claude/skills/
rm -rf .claude/knowledge/ai-kit-*
rm -rf ψ/

# Or if installed globally
ai-kit uninstall    # (after global install)
```

## Integration with Other Tools

The AI Productivity Kit works alongside:
- **nat-agents-core** - Oracle philosophy commands
- **Oracle MCP** - Knowledge retrieval
- **Ralph** - Autonomous development loops
- **MAW** - Multi-agent workflow

## Version Info

- **Version**: 1.0.0
- **Updated**: 2026-01-03
- **Compatible**: Claude Code 1.0+

---

**Awaken the productivity within your project! 🔮**
