# AI Productivity Kit - Claude Code Plugin Setup (Windows)
param([switch]$Uninstall, [switch]$Help)

$VERSION = "1.0.0"
$PLUGIN_NAME = "ai-productivity-kit"
$CONFIG_DIR = "$env:USERPROFILE\.claude"
$PLUGIN_DIR = "$CONFIG_DIR\plugins"
$TARGET_DIR = "$PLUGIN_DIR\$PLUGIN_NAME"
$SCRIPT_DIR = $PSScriptRoot

function Print-Success { Write-Host "[OK]" -ForegroundColor Green -NoNewline; Write-Host " $args" }
function Print-Warning { Write-Host "[WARN]" -ForegroundColor Yellow -NoNewline; Write-Host " $args" }
function Print-Error { Write-Host "[ERR]" -ForegroundColor Red -NoNewline; Write-Host " $args" }
function Print-Step { Write-Host "[>>]" -ForegroundColor Cyan -NoNewline; Write-Host " $args" }

function Show-Banner {
    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "AI Productivity Kit v$VERSION" -ForegroundColor Cyan
    Write-Host "Claude Code Plugin Setup" -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host ""
}

function Test-ClaudeCode {
    Print-Step "Checking Claude Code installation..."
    if (Get-Command "claude" -ErrorAction SilentlyContinue) {
        Print-Success "Claude Code found"
        return
    }
    if (Test-Path $CONFIG_DIR) {
        Print-Success "Claude Code directory found"
        return
    }
    Print-Warning "Claude Code not found, continuing anyway..."
}

function Initialize-Directories {
    Print-Step "Creating plugin directories..."
    $dirs = @($PLUGIN_DIR, "$CONFIG_DIR\commands", "$CONFIG_DIR\agents", "$CONFIG_DIR\skills", "$CONFIG_DIR\knowledge")
    foreach ($dir in $dirs) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
    Print-Success "Directories created"
}

function Install-Plugin {
    Print-Step "Installing AI Productivity Kit..."
    if (Test-Path $TARGET_DIR) {
        Print-Warning "Removing old installation..."
        & cmd /c "rmdir /s /q `"$TARGET_DIR`"" 2>$null
        Start-Sleep -Milliseconds 200
    }
    New-Item -ItemType Directory -Force -Path $TARGET_DIR | Out-Null
    & robocopy $SCRIPT_DIR $TARGET_DIR /E /R:0 /W:0 /NFL /NDL /NJH /NJS | Out-Null
    Print-Success "Plugin installed to $TARGET_DIR"
}

function Initialize-Config {
    Print-Step "Creating Claude Code config..."
    $configFile = "$CONFIG_DIR\config.json"
    if (Test-Path $configFile) {
        Print-Warning "Backing up existing config..."
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        Copy-Item $configFile "$configFile.backup.$timestamp"
    }
    $config = @{ plugins = @(@{ name = "ai-productivity-kit"; type = "local"; path = $TARGET_DIR; enabled = $true }) }
    $config | ConvertTo-Json -Depth 10 | Set-Content $configFile
    Print-Success "Config created at $configFile"
}

function Test-Installation {
    Print-Step "Verifying installation..."
    $errors = 0
    if (-not (Test-Path $TARGET_DIR)) { Print-Error "Plugin directory not found"; $errors++ }
    if (-not (Test-Path "$CONFIG_DIR\config.json")) { Print-Error "Config not found"; $errors++ }
    $cmdCount = (Get-ChildItem "$TARGET_DIR\.claude\commands\*.md" -ErrorAction SilentlyContinue).Count
    $agentCount = (Get-ChildItem "$TARGET_DIR\.claude\agents\*.md" -ErrorAction SilentlyContinue).Count
    $skillCount = (Get-ChildItem "$TARGET_DIR\.claude\skills\*.md" -ErrorAction SilentlyContinue).Count
    Write-Host ""
    Write-Host "Installed components:"
    Write-Host "  - Commands: $cmdCount"
    Write-Host "  - Agents: $agentCount"
    Write-Host "  - Skills: $skillCount"
    if ($errors -eq 0) { Print-Success "Installation verified!"; return }
    Print-Error "Verification failed with $errors errors"
}

function Show-NextSteps {
    Write-Host ""
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host "Installation Complete!" -ForegroundColor Green
    Write-Host "===============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Plugin installed at: $TARGET_DIR"
    Write-Host ""
    Write-Host "Quick Start:"
    Write-Host "  1. Open Claude Code"
    Write-Host "  2. Go to your project directory"
    Write-Host "  3. Run: /ai-kit:awaken"
    Write-Host ""
    Write-Host "Common Commands:"
    Write-Host "  /ai-kit:start    - Start a session"
    Write-Host "  /ai-kit:focus    - Set current task"
    Write-Host "  /nnn [desc]      - Create implementation plan"
    Write-Host "  /gogogo         - Execute the plan"
    Write-Host "  /rrr            - Session retrospective"
}

function Invoke-Uninstall {
    Print-Warning "Uninstalling AI Productivity Kit..."
    $response = Read-Host "Remove plugin directory? (y/N)"
    if ($response -eq "y" -or $response -eq "Y") {
        if (Test-Path $TARGET_DIR) { Remove-Item -Path $TARGET_DIR -Recurse -Force; Print-Success "Plugin directory removed" }
    }
    $response = Read-Host "Remove from config? (y/N)"
    if ($response -eq "y" -or $response -eq "Y") {
        if (Test-Path "$CONFIG_DIR\config.json") { Remove-Item -Path "$CONFIG_DIR\config.json" -Force; Print-Success "Config removed" }
    }
    Print-Success "Uninstall complete"
}

function Show-Help {
    Write-Host "AI Productivity Kit - Claude Code Plugin Setup (Windows)"
    Write-Host ""
    Write-Host "Usage: .\setup-claude-plugin.ps1 [option]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  (none)      Install the plugin"
    Write-Host "  -Uninstall  Remove the plugin"
    Write-Host "  -Help       Show this help"
}

function Main {
    Show-Banner
    if ($Help) { Show-Help; return }
    if ($Uninstall) { Invoke-Uninstall; return }
    Test-ClaudeCode
    Initialize-Directories
    Install-Plugin
    Initialize-Config
    Test-Installation
    Show-NextSteps
}

Main
