# AI Productivity Kit - Installation Script for Windows
# Quick setup for any project

param(
    [Parameter(Position=0)]
    [string]$Path = ".",

    [switch]$Global,
    [switch]$Uninstall,
    [switch]$Help
)

$VERSION = "1.0.0"
$SCRIPT_DIR = $PSScriptRoot

# Color functions
function Print-Info { Write-Host "ℹ" -ForegroundColor Cyan -NoNewline; Write-Host " $args" }
function Print-Success { Write-Host "✓" -ForegroundColor Green -NoNewline; Write-Host " $args" }
function Print-Warning { Write-Host "⚠" -ForegroundColor Yellow -NoNewline; Write-Host " $args" }
function Print-Error { Write-Host "✗" -ForegroundColor Red -NoNewline; Write-Host " $args" }

# Show banner
function Show-Banner {
    Write-Host ""
    Write-Host "╔═════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║     AI Productivity Kit v$VERSION                   ║" -ForegroundColor Cyan
    Write-Host "║     เครื่องมือเสริมประสิทธิภาพการเขียนโปรแกรม          ║" -ForegroundColor Cyan
    Write-Host "╚═════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

# Install to project
function Install-ToProject {
    param($TargetPath)

    $TargetPath = Resolve-Path $TargetPath -ErrorAction SilentlyContinue
    if (-not $TargetPath) {
        $TargetPath = Get-Location
    }

    Print-Info "Installing AI Productivity Kit to: $TargetPath"

    # Create directories
    $dirs = @(
        ".claude\commands",
        ".claude\agents",
        ".claude\skills",
        ".claude\knowledge",
        "psi\active",
        "psi\inbox",
        "psi\memory\tricks",
        "psi\memory\patterns",
        "psi\memory\retros",
        "psi\memory\logs",
        "psi\writing",
        "psi\lab"
    )

    foreach ($dir in $dirs) {
        $fullPath = Join-Path $TargetPath $dir
        New-Item -ItemType Directory -Force -Path $fullPath | Out-Null
    }
    Print-Success "Created directory structure"

    # Copy files
    $sourceDirs = @("commands", "agents", "skills", "knowledge")
    foreach ($dir in $sourceDirs) {
        $source = Join-Path $SCRIPT_DIR ".claude\$dir"
        if (Test-Path $source) {
            $dest = Join-Path $TargetPath ".claude\$dir"
            Copy-Item -Path "$source\*" -Destination $dest -Recurse -Force
        }
    }
    Print-Success "Copied commands, agents, skills, knowledge"

    # Create initial focus.md
    $focusContent = @"
# Current Focus

**State**: ready
**Task**: -
**Started**: -

## Notes
Ready to start working!

Use `/ai-kit:start` to begin a session.
"@
    Set-Content -Path (Join-Path $TargetPath "psi\inbox\focus.md") -Value $focusContent

    # Create project notes
    $projectNotes = @"
# Project Notes

**Project**: $(Split-Path $TargetPath -Leaf)
**Initialized**: $(Get-Date -Format "yyyy-MM-dd")

## Project Specifics
<!-- Add project-specific notes here -->

## Tech Stack
<!-- List your tech stack -->

## Important Patterns
<!-- Document patterns specific to this project -->
"@
    Set-Content -Path (Join-Path $TargetPath ".claude\knowledge\project-notes.md") -Value $projectNotes

    Print-Success "Created initial files"

    # Update .gitignore
    $gitignorePath = Join-Path $TargetPath ".gitignore"
    $gitignoreContent = @"

# AI Productivity Kit - Psi (working directory)
psi/active/
psi/inbox/WIP.md

# Keep these tracked
!psi/inbox/focus.md
!psi/memory/
"@

    if (Test-Path $gitignorePath) {
        $existing = Get-Content $gitignorePath -Raw
        if ($existing -notmatch "AI Productivity Kit") {
            Add-Content -Path $gitignorePath -Value $gitignoreContent
        }
    } else {
        Set-Content -Path $gitignorePath -Value $gitignoreContent
    }
    Print-Success "Updated .gitignore"

    Write-Host ""
    Print-Success "AI Productivity Kit installed!"
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "  1. cd $TargetPath"
    Write-Host "  2. Start with: /ai-kit:start"
    Write-Host "  3. Or create plan: /nnn [feature description]"
}

# Install globally
function Install-Global {
    Print-Info "Installing AI Productivity Kit globally..."

    $installDir = Join-Path $env:USERPROFILE ".ai-productivity-kit"
    New-Item -ItemType Directory -Force -Path $installDir | Out-Null

    # Copy files
    Copy-Item -Path "$SCRIPT_DIR\*" -Destination $installDir -Recurse -Force
    Print-Success "Copied to $installDir"

    # Create wrapper script
    $binDir = Join-Path $env:USERPROFILE ".local\bin"
    New-Item -ItemType Directory -Force -Path $binDir | Out-Null

    $wrapperScript = @"
# AI Productivity Kit wrapper
`$KIT_DIR = Join-Path `$env:USERPROFILE ".ai-productivity-kit"

`$command = `$args[0]

switch (`$command) {
    "init" {
        Write-Host "Initializing AI Productivity Kit..."
        & "`$KIT_DIR\install.ps1" -Here
    }
    "update" {
        Write-Host "Updating AI Productivity Kit..."
        Set-Location `$KIT_DIR
        git pull 2>$null
        if (`$LASTEXITCODE -ne 0) {
            Write-Host "Not a git repository, skipping update"
        }
    }
    "version" {
        Write-Host "AI Productivity Kit v$VERSION"
    }
    "help" {
        Write-Host "AI Productivity Kit - Quick Setup"
        Write-Host ""
        Write-Host "Usage: ai-kit.ps1 [command]"
        Write-Host ""
        Write-Host "Commands:"
        Write-Host "  init    Initialize in current directory"
        Write-Host "  update  Update the kit"
        Write-Host "  version Show version"
        Write-Host "  help    Show this help"
    }
    default {
        Write-Host "Unknown command: `$command"
        Write-Host "Run 'ai-kit.ps1 help' for usage"
        exit 1
    }
}
"@

    Set-Content -Path (Join-Path $binDir "ai-kit.ps1") -Value $wrapperScript
    Print-Success "Created 'ai-kit.ps1' in $binDir"

    # Add to PATH if not there
    $pathEntry = $binDir
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($currentPath -notlike "*$pathEntry*") {
        Write-Host ""
        Print-Warning "Consider adding $binDir to your PATH"
        Write-Host "Run: `$env:Path += ';$binDir' (for current session)"
    }

    Write-Host ""
    Print-Success "AI Productivity Kit installed globally!"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  ai-kit.ps1 init         # Initialize in current directory"
    Write-Host "  ai-kit.ps1 update       # Update the kit"
    Write-Host "  ai-kit.ps1 version      # Show version"
}

# Uninstall
function Invoke-Uninstall {
    Print-Warning "Uninstalling AI Productivity Kit..."

    $response = Read-Host "Remove global installation? (y/N)"
    if ($response -eq 'y' -or $response -eq 'Y') {
        $installDir = Join-Path $env:USERPROFILE ".ai-productivity-kit"
        $wrapper = Join-Path $env:USERPROFILE ".local\bin\ai-kit.ps1"

        if (Test-Path $installDir) {
            Remove-Item -Path $installDir -Recurse -Force
            Print-Success "Removed $installDir"
        }
        if (Test-Path $wrapper) {
            Remove-Item -Path $wrapper -Force
            Print-Success "Removed wrapper script"
        }
    }
}

# Show help
function Show-Help {
    Write-Host @"
AI Productivity Kit - Installation Script for Windows

Usage: .\install.ps1 [option]

Options:
  -Here, -h          Install to current directory (default)
  -Path <path>       Install to specific directory
  -Global            Install globally
  -Uninstall         Uninstall global installation
  -Help              Show this help

Examples:
  .\install.ps1              # Install to current project
  .\install.ps1 -Path ..\    # Install to parent directory
  .\install.ps1 -Global      # Install globally

After installation, use in Claude Code:
  /ai-kit:start    Start a working session
  /nnn [desc]      Create implementation plan
  /gogogo         Execute the plan
  /rrr            Session retrospective

Documentation:
  https://github.com/YOUR_USERNAME/ai-productivity-kit
"@
}

# Main
function Main {
    Show-Banner

    if ($Help) {
        Show-Help
        return
    }

    if ($Uninstall) {
        Invoke-Uninstall
        return
    }

    if ($Global) {
        Install-Global
        return
    }

    # Default: install to current or specified path
    Install-ToProject -TargetPath $Path
}

Main
