# CLAUDE.md

**Project Configuration for Claude Code AI Team**

This file configures your AI development team. Edit to match your project needs.

## AI Team Configuration

### Core Agents (Always Available)

| Agent | When to Use | Purpose |
|-------|-------------|---------|
| `coder` | Writing code | Implements features from specs |
| `debug-helper` | Fixing errors | Analyzes and fixes bugs |
| `test-writer` | Adding tests | Creates comprehensive test coverage |
| `doc-writer` | Documentation | Writes docs, README, guides |
| `code-reviewer` | PR review | Reviews code for quality |
| `general-purpose` | General tasks | Handles miscellaneous work |

### Specialized Agents (Enable as Needed)

Uncomment agents your project uses:

```yaml
# Uncomment if you have a frontend:
# - vue-component-architect
# - react-component-architect
# - react-nextjs-expert
# - vue-nuxt-expert
# - tailwind-frontend-expert
# - frontend-developer

# Uncomment if you have a backend:
# - rails-backend-expert
# - fastapi-expert
# - django-expert
# - python-expert
# - backend-developer

# Uncomment if you have APIs:
# - api-architect

# Uncomment if you have infrastructure:
# - cicd-automation:cloud-architect
# - cicd-automation:deployment-engineer
# - cicd-automation:terraform-specialist
# - cicd-automation:kubernetes-architect

# Uncomment for testing:
# - pr-review-toolkit:pr-test-analyzer
```

## Project Context

### Project Name
<!-- Your project name -->

### Tech Stack
| Component | Technology |
|-----------|-----------|
| Language | |
| Framework | |
| Database | |
| Frontend | |
| Deployment | |

### Architecture Overview
<!-- Brief description of your system architecture -->

### Key Directories
```
src/        # Main source code
tests/      # Test files
docs/       # Documentation
scripts/    # Utility scripts
```

## Development Guidelines

### Code Style
- Follow existing patterns in the codebase
- Prefer simplicity over cleverness
- Write self-documenting code

### Git Workflow
- Create feature branches from `develop`
- PR required before merge to `main`
- Use conventional commits: `feat:`, `fix:`, `docs:`, etc.

### Testing
- Write tests for new features
- Aim for >80% coverage
- Run tests before committing

## Project-Specific Patterns

<!-- Add patterns discovered during development -->

## Commands Reference

### Daily Workflow
```
/ai-kit:start    → Start session
/ai-kit:focus    → Set current task
/nnn [desc]      → Create plan
/gogogo         → Execute plan
/ai-kit:pause   → Take a break
/rrr            → End session retrospective
```

### Knowledge Capture
```
/ai-kit:note    → Quick note
/ai-kit:trick   → Code trick
/ai-kit:pattern → Reusable pattern
/ai-kit:learn   → Capture learning
```

### Project Management
```
/lll            → Project status
/trace [term]   → Search everything
/ccc            → Save context
/forward        → Handoff to next session
```

## Environment

### Required Environment Variables
<!-- Add your project's env vars -->

### Development Setup
```bash
# Clone and setup
git clone <repo>
cd <project>
npm install  # or pip install, etc.
```

### Running Tests
```bash
# Add your test commands
```

## Common Tasks

### Add New Feature
```bash
/nnn "Implement [feature name]"
/gogogo
/ai-kit:review
```

### Fix Bug
```bash
/ai-kit:debug "[error description]"
# Follow AI guidance
/ai-kit:trick  # If you learned something
```

### Deploy
```bash
# Add your deployment commands
```

---

**Setup with**: `/nat-agents-core:awaken` or `/ai-kit:init`
**Updated**: Run `/ccc` to save context, `/forward` for next session
