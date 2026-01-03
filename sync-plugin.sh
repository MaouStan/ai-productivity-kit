#!/bin/bash
# Sync Plugin Files
# Run this after updating commands/skills/agents to keep marketplace in sync

set -e

SOURCE=".claude"
DESTINATION=".claude-plugin/plugins/ai-productivity-kit"

echo "Syncing plugin files..."

# Sync commands
echo "  Syncing commands..."
if [ -d "$SOURCE/commands" ]; then
    cp "$SOURCE/commands"/*.md "$DESTINATION/commands/" 2>/dev/null || true
    echo "    Commands synced!"
fi

# Sync skills
echo "  Syncing skills..."
if [ -d "$SOURCE/skills" ]; then
    cp "$SOURCE/skills"/*.md "$DESTINATION/skills/" 2>/dev/null || true
    echo "    Skills synced!"
fi

# Sync agents
echo "  Syncing agents..."
if [ -d "$SOURCE/agents" ]; then
    cp "$SOURCE/agents"/*.md "$DESTINATION/agents/" 2>/dev/null || true
    echo "    Agents synced!"
fi

# Sync knowledge
echo "  Syncing knowledge..."
if [ -d "$SOURCE/knowledge" ]; then
    cp "$SOURCE/knowledge"/*.md "$DESTINATION/knowledge/" 2>/dev/null || true
    echo "    Knowledge synced!"
fi

echo ""
echo "Plugin files synced successfully!"
echo ""
echo "Next steps:"
echo "  1. Review changes: git status"
echo "  2. Commit: git add .claude-plugin/ && git commit -m 'Sync plugin files'"
echo "  3. Push: git push"
