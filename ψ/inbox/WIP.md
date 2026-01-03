# Work In Progress

**Saved**: 2026-01-03
**Session**: AI Productivity Kit - Fix init/start/awaken for team-configurator integration

---

## Current Task

Fix `/ai-kit:start`, `/ai-kit:init`, and create new `/ai-kit:awaken` command to properly integrate with team-configurator for automatic CLAUDE.md generation.

---

## Progress

### ✅ COMPLETED - ALL TASKS DONE!

1. **ai-kit-init.md Updated** (both .claude/ and .claude-plugin/)
   - Added explicit CRITICAL section with exact Task tool call
   - "You MUST actually execute this exact Task call"
   - Added code block showing exact Task() parameters
   - No ambiguity - AI will actually call the tool

2. **start.md Updated** (both .claude/ and .claude-plugin/)
   - Changed from "prompt user" to "AUTO-RUN without asking"
   - Added CRITICAL section with exact Task tool call
   - Updated example to show auto-run behavior
   - Added reference to /ai-kit:awaken in First Time section

3. **NEW: /ai-kit:awaken command created**
   - Full setup command (not just skill)
   - Creates .claude/, ψ/ structures
   - Copies all commands, agents, skills
   - Auto-runs team-configurator
   - Located at: `.claude/commands/awaken.md`

### Changes Summary
- `/ai-kit:init` - Now explicitly tells AI to call Task tool for CLAUDE.md
- `/ai-kit:start` - Now auto-runs team-configurator without asking
- `/ai-kit:awaken` - NEW command for complete setup

---

## Next Steps

1. **Commit changes**:
   ```bash
   git add .claude/ .claude-plugin/
   git commit -m "feat: fix init/start to actually run team-configurator, add awaken command"
   ```

2. **Optional: Version bump** for release

3. **Push** when ready

---

## Important Context

### What is team-configurator?
- A subagent that analyzes codebase and generates CLAUDE.md
- Detects tech stack, architecture, and project patterns
- Creates project-specific AI team configuration

### The Fix
Previous versions said "run team-configurator" but didn't explicitly show HOW.
Now each command has:
```
## CRITICAL: Task Tool Call

**You MUST actually execute this exact Task call**:

Task(
  subagent_type="team-configurator",
  prompt="Set up AI team configuration...",
  model="sonnet"
)
```

### Files Modified
```
.claude/commands/ai-kit-init.md    (updated)
.claude/commands/start.md          (updated)
.claude/commands/awaken.md         (NEW)
.claude-plugin/plugins/ai-productivity-kit/commands/ai-kit-init.md  (updated)
.claude-plugin/plugins/ai-productivity-kit/commands/start.md        (updated)
.claude-plugin/plugins/ai-productivity-kit/commands/awaken.md       (NEW)
```

---

## Git Status

```
M .claude-plugin/plugins/ai-productivity-kit/commands/ai-kit-init.md
M .claude-plugin/plugins/ai-productivity-kit/commands/start.md
M .claude/commands/ai-kit-init.md
M .claude/commands/start.md
?? .claude/commands/awaken.md
?? .claude-plugin/plugins/ai-productivity-kit/commands/awaken.md
```

---

**Restore with**: `/recap` or `/ai-kit:recap`
