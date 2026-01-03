# Oracle MCP Integration

**Use AI Productivity Kit with Oracle MCP knowledge server**

## Overview

Oracle MCP provides hybrid (keyword + semantic) search for principles and patterns. AI Productivity Kit uses it for knowledge retrieval during development.

## Setup

### 1. Install Oracle MCP

```bash
git clone https://github.com/YOUR_USERNAME/oracle-mcp.git
cd oracle-mcp
npm install
npm start
```

### 2. Configure Claude Code

Add to `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "oracle": {
      "command": "node",
      "args": ["/path/to/oracle-mcp/index.js"]
    }
  }
}
```

### 3. Create Knowledge Base

```bash
# Use AI Productivity Kit to capture knowledge
/ai-kit:awaken

# Add principles to Oracle MCP
oracle_learn --principle "Always validate user input" \
              --category "security" \
              --context "Web development"
```

## Usage Patterns

### Pattern 1: Consult Before Implementing

```
User: /nnn Implement user authentication

AI: [Before creating plan, consults Oracle]

🔍 Consulting Oracle for: authentication patterns

Found 3 relevant principles:
1. "Never store plain text passwords" (security)
2. "Use JWT for stateless authentication" (api-design)
3. "Implement rate limiting on auth endpoints" (security)

Incorporating these into the plan...

[Plan created with Oracle principles applied]
```

### Pattern 2: Learn While Working

```
User: /ai-kit:trick JWT refresh token rotation

AI: ✅ Trick saved locally!

[Also adds to Oracle MCP]
oracle_learn --pattern "refresh-token-rotation" \
              --description "Rotate refresh tokens on each use" \
              --category "authentication"
```

### Pattern 3: Retrieve Similar Solutions

```
User: How should I handle file uploads securely?

AI: [Queries Oracle MCP]

🔍 Searching Oracle for: file upload security

Found patterns:
1. "Validate file type by content, not extension"
2. "Store uploads outside web root"
3. "Generate random filenames to prevent collisions"

Recommendation: Use content-type validation + random filenames + separate storage.
```

## MCP Tools Available

```bash
# Search
oracle_search --query "authentication" --type principle

# Consult
oracle_consult --decision "Should I use sessions or tokens?"

# Learn
oracle_learn --pattern "name" --description "desc" --category "cat"

# List
oracle_list --category "security"

# Reflect (random wisdom)
oracle_reflect
```

## Integration with Commands

| Command | Oracle MCP Integration |
|---------|----------------------|
| `/nnn` | Queries relevant principles before planning |
| `/ai-kit:debug` | Searches for similar past issues |
| `/ai-kit:pattern` | Syncs pattern to Oracle MCP |
| `/rrr` | Extracts principles to add to Oracle |
| `/ai-kit:review` | Checks against Oracle principles |

## Knowledge Flow

```
┌─────────────────────────────────────────────────────┐
│  Experience → Documentation → Oracle               │
├─────────────────────────────────────────────────────┤
│                                                     │
│  1. Do work  2. /rrr  3. Extract  4. oracle_learn  │
│     ↓           ↓          ↓            ↓          │
│  Experience  Retro   Principle   Searchable       │
│                                     Knowledge     │
└─────────────────────────────────────────────────────┘
```

## Example Session

```bash
# Start with context
/ccc

# Create plan (Oracle consults automatically)
/nnn Add password reset feature

# Oracle provides principles:
# - "Use time-limited reset tokens"
# - "Invalidate token after use"
# - "Log all password reset attempts"

# Execute (with Oracle guidance)
/gogogo

# When stuck, ask Oracle
oracle_consult "User reset email not being sent"
→ Found: "Check email queue configuration"
→ Found: "Verify SMTP settings"

# Save learning
/ai-kit:pattern "Email queue troubleshooting"

# Sync to Oracle
oracle_learn --pattern "email-queue-check" \
              --description "Always check email queue when emails not sent"

# End with retro
/rrr
```

## Best Practices

1. **Consult early** - Let Oracle guide planning
2. **Save patterns** - Sync discoveries to Oracle
3. **Search first** - Check Oracle before reinventing
4. **Tag well** - Use consistent categories
5. **Review regularly** - Use `oracle_reflect` for random wisdom

## Categories to Use

```
Security
Performance
Architecture
Api-Design
Database
Testing
Deployment
Workflow
Debugging
```

## Quick Reference

```bash
# Setup
/ai-kit:awaken           # Initialize AI Kit
oracle_mcp start         # Start Oracle server

# Daily workflow
/ccc                     # Create context
/nnn [task]              # Plan (Oracle consults)
/gogogo                  # Execute
/rrr                     # Retro (syncs to Oracle)

# Ad-hoc
oracle_search "pattern"  # Find similar
oracle_consult "decision" # Get guidance
oracle_reflect           # Random wisdom
```
