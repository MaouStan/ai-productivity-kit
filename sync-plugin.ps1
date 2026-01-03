# Sync Plugin Files
# Run this after updating commands/skills/agents to keep marketplace in sync

$ErrorActionPreference = "Stop"

$source = ".claude"
$destination = ".claude-plugin/plugins/ai-productivity-kit"

Write-Host "Syncing plugin files..." -ForegroundColor Cyan

# Sync commands
Write-Host "  Syncing commands..." -ForegroundColor Yellow
if (Test-Path "$source/commands") {
    Copy-Item -Path "$source/commands/*.md" -Destination "$destination/commands" -Force
    Write-Host "    Commands synced!" -ForegroundColor Green
}

# Sync skills
Write-Host "  Syncing skills..." -ForegroundColor Yellow
if (Test-Path "$source/skills") {
    Copy-Item -Path "$source/skills/*.md" -Destination "$destination/skills" -Force
    Write-Host "    Skills synced!" -ForegroundColor Green
}

# Sync agents
Write-Host "  Syncing agents..." -ForegroundColor Yellow
if (Test-Path "$source/agents") {
    Copy-Item -Path "$source/agents/*.md" -Destination "$destination/agents" -Force
    Write-Host "    Agents synced!" -ForegroundColor Green
}

# Sync knowledge
Write-Host "  Syncing knowledge..." -ForegroundColor Yellow
if (Test-Path "$source/knowledge") {
    Copy-Item -Path "$source/knowledge/*.md" -Destination "$destination/knowledge" -Force
    Write-Host "    Knowledge synced!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Plugin files synced successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Review changes: git status"
Write-Host "  2. Commit: git add .claude-plugin/ && git commit -m 'Sync plugin files'"
Write-Host "  3. Push: git push"
