# GitHub Setup Guide - Private Plugin

**Setup AI Productivity Kit as a private Claude Code plugin**

## Option 1: Private GitHub Repository

### Step 1: Create Private Repo

```bash
# Create private repository on GitHub
# Name: ai-productivity-kit
# Visibility: Private

# Initialize local repo
cd ai-productivity-kit
git init
git add .
git commit -m "Initial commit: AI Productivity Kit v1.0.0"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/ai-productivity-kit.git
git branch -M main
git push -u origin main
```

### Step 2: Configure Claude Code

Create/Edit `~/.claude/config.json`:

```json
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "local",
      "path": "/path/to/ai-productivity-kit"
    }
  ]
}
```

Or use GitHub private:

```json
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "github",
      "repo": "YOUR_USERNAME/ai-productivity-kit",
      "ref": "main",
      "private": true
    }
  ]
}
```

## Option 2: Direct Local Setup (No GitHub)

### Step 1: Install Locally

```bash
# Clone or copy to your plugins directory
mkdir -p ~/.claude/plugins
cp -r ai-productivity-kit ~/.claude/plugins/

# Or symlink
ln -s /path/to/ai-productivity-kit ~/.claude/plugins/ai-productivity-kit
```

### Step 2: Configure Claude Code

`~/.claude/config.json`:

```json
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "local",
      "path": "~/.claude/plugins/ai-productivity-kit"
    }
  ]
}
```

## Option 3: Setup Script (All Platforms)

### Unix/Linux/Mac

```bash
#!/bin/bash
# setup-claude-plugin.sh

PLUGIN_DIR="$HOME/.claude/plugins"
SOURCE_DIR="$(pwd)"

echo "🔧 Setting up AI Productivity Kit for Claude Code..."

# Create plugins directory
mkdir -p "$PLUGIN_DIR"

# Copy plugin
echo "📦 Copying files..."
cp -r "$SOURCE_DIR" "$PLUGIN_DIR/ai-productivity-kit"

# Create config
CONFIG="$HOME/.claude/config.json"
mkdir -p "$(dirname "$CONFIG)"

if [ -f "$CONFIG" ]; then
    echo "⚠️  Config exists, backing up..."
    cp "$CONFIG" "$CONFIG.backup"
fi

echo "📝 Creating config..."
cat > "$CONFIG" << 'EOF'
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "local",
      "path": "~/.claude/plugins/ai-productivity-kit"
    }
  ]
}
EOF

echo "✅ Setup complete!"
echo ""
echo "Use in Claude Code:"
echo "  /ai-kit:awaken   # Initialize in project"
```

### Windows (PowerShell)

```powershell
# setup-claude-plugin.ps1

$PLUGIN_DIR = "$env:USERPROFILE\.claude\plugins"
$SOURCE_DIR = Get-Location

Write-Host "🔧 Setting up AI Productivity Kit for Claude Code..." -ForegroundColor Cyan

# Create plugins directory
New-Item -ItemType Directory -Force -Path $PLUGIN_DIR | Out-Null

# Copy plugin
Write-Host "📦 Copying files..." -ForegroundColor Green
Copy-Item -Path "$SOURCE_DIR\*" -Destination "$PLUGIN_DIR\ai-productivity-kit" -Recurse -Force

# Create config
$CONFIG = "$env:USERPROFILE\.claude\config.json"
$CONFIG_DIR = Split-Path $CONFIG
New-Item -ItemType Directory -Force -Path $CONFIG_DIR | Out-Null

if (Test-Path $CONFIG) {
    Write-Host "⚠️  Config exists, backing up..." -ForegroundColor Yellow
    Copy-Item $CONFIG "$CONFIG.backup"
}

Write-Host "📝 Creating config..." -ForegroundColor Green
@"
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "local",
      "path": "$env:USERPROFILE\.claude\plugins\ai-productivity-kit"
    }
  ]
}
"@ | Set-Content $CONFIG

Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Use in Claude Code:"
Write-Host "  /ai-kit:awaken   # Initialize in project"
```

## Verify Installation

```bash
# Check config
cat ~/.claude/config.json

# Check plugin exists
ls ~/.claude/plugins/ai-productivity-kit/

# Test in Claude Code
/ai-kit:awaken
```

## Update Plugin

```bash
# Pull latest changes
cd ~/.claude/plugins/ai-productivity-kit
git pull

# Or if using symlink, just pull in source
cd /path/to/ai-productivity-kit
git pull
```

## Uninstall

```bash
# Remove plugin
rm -rf ~/.claude/plugins/ai-productivity-kit

# Remove from config
# Edit ~/.claude/config.json and remove the plugin entry
```

## Troubleshooting

### Plugin not found
```bash
# Check Claude Code config location
# It might be in:
# - ~/.claude/config.json (Linux/Mac)
# - %USERPROFILE%\.claude\config.json (Windows)
# - Project .claude/config.json

# Verify path is correct
cat ~/.claude/config.json | jq .
```

### Commands not available
```bash
# Restart Claude Code
# Check plugin files exist
ls ~/.claude/plugins/ai-productivity-kit/.claude/commands/
```

### Skills not working
```bash
# Make sure skills directory exists
ls ~/.claude/plugins/ai-productivity-kit/.claude/skills/

# Check file permissions
chmod +x ~/.claude/plugins/ai-productivity-kit/.claude/skills/*.md
```

## Quick Reference

| Platform | Config Location |
|----------|-----------------|
| Linux/Mac | `~/.claude/config.json` |
| Windows | `%USERPROFILE%\.claude\config.json` |
| Project | `.claude/config.json` |

| Command | Action |
|----------|--------|
| `/ai-kit:awaken` | Initialize in project |
| `/ai-kit:start` | Start session |
| `/nnn [desc]` | Create plan |
| `/gogogo` | Execute plan |

---

**Private Plugin Setup Complete! 🔒**
