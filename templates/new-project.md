# New Project Template

**Start a new project with AI Productivity Kit pre-configured**

## Project Setup Checklist

```bash
# 1. Initialize project
/ai-kit:awaken

# 2. Create project structure
mkdir -p src tests docs examples

# 3. Initialize git
git init
/ai-kit:note "Initialize git repo"

# 4. Create README
/ai-kit:delegate doc-writer "Create README for this project"

# 5. Set up project notes
/ccc  # Create first context issue
```

## Initial Focus File

```markdown
# psi/inbox/focus.md

# Project: [Project Name]

**State**: planning
**Phase**: 1 - Setup
**Started**: [Date]

## Project Goals
- [Goal 1]
- [Goal 2]
- [Goal 3]

## Tech Stack Decisions
- Language: [ ]
- Framework: [ ]
- Database: [ ]
- Deployment: [ ]

## Current Tasks
- [ ] Initialize project structure
- [ ] Set up development environment
- [ ] Create first proof of concept

## Blockers
None identified yet.

## Notes
Use /nnn to create detailed plans for each phase.
```

## Project Knowledge Template

```markdown
# .claude/knowledge/project-notes.md

# Project Notes

**Project**: [Name]
**Started**: [Date]
**Last Updated**: [Date]

## Overview
[Brief project description]

## Architecture
```
[Describe architecture]
├── [Component 1]
├── [Component 2]
└── [Component 3]
```

## Tech Stack
| Component | Technology | Version |
|-----------|-----------|---------|
| Language | | |
| Framework | | |
| Database | | |
| API | | |

## Key Patterns
<!-- Project-specific patterns discovered -->

## Gotchas
<!-- Things to watch out for -->

## External Dependencies
<!-- APIs, services, etc. -->

## Deployment
<!-- How to deploy -->

## Environment Variables
```bash
# Required environment variables
EXAMPLE_VAR=value
```
```

## First Session Workflow

```bash
# Day 1 - Project Setup
/ai-kit:start
/nnn "Initialize project with [framework] and basic structure"
/gogogo
/rrr

# Day 2 - Core Feature
/recap
/nnn "Implement [core feature]"
/gogogo
/rrr

# Day 3+ - Continue
/recap
/nnn "[next feature]"
/gogogo
/rrr
```

## Git Setup

```bash
# .gitignore additions

# AI Productivity Kit
psi/active/
psi/inbox/WIP.md

# Keep these tracked
!psi/inbox/focus.md
!psi/memory/

# Project specific
[Your project ignores]
```

## Branch Strategy

```
main                    # Production
├── develop            # Integration
    ├── feature/*      # Features
    ├── bugfix/*       # Bug fixes
    └── hotfix/*      # Urgent fixes
```

## Commit Convention

```
feat: new feature
fix: bug fix
docs: documentation
refactor: refactoring
test: tests
chore: maintenance
```

## Example: Starting a Web API Project

```bash
# 1. Initialize
/ai-kit:awaken

# 2. Plan the project
/nnn "Create FastAPI REST API with:
- User authentication
- CRUD operations
- PostgreSQL database
- Docker setup
- Test coverage"

# 3. Execute
/gogogo

# 4. Review
/ai-kit:review

# 5. Deploy
/ai-kit:note "Deploy to production"

# 6. Retro
/rrr
```

## Customization

Add project-specific commands:

```markdown
# .claude/commands/deploy.md

# /deploy

**Deploy project to production**

## What It Does
1. Run tests
2. Build docker image
3. Push to registry
4. Update deployment
5. Run smoke tests

## Template
```bash
# Test
pytest tests/

# Build
docker build -t myapp:$VERSION .

# Deploy
kubectl apply -f k8s/
```
```

## Quick Commands Reference

For new projects, memorize:

```
/ai-kit:start    → Start work
/ai-kit:focus    → Set task
/nnn [desc]      → Plan
/gogogo         → Execute
/ai-kit:pause   → Break
/rrr            → Review
```

## Project Lifecycle

```
Planning    → /nnn, /ccc
Development → /gogogo, /delegate
Review      → /ai-kit:review
Learning    → /rrr, /ai-kit:learn
Deploy      → /ai-kit:note
```

---

**Template created with AI Productivity Kit**
