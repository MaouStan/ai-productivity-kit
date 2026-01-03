#!/bin/bash
# AI Productivity Kit - Installation Script
# Quick setup for any project

set -e

VERSION="1.0.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_URL="https://github.com/YOUR_USERNAME/ai-productivity-kit"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

# Show banner
show_banner() {
    echo -e "${BLUE}"
    echo "╔═════════════════════════════════════════════════════╗"
    echo "║     AI Productivity Kit v${VERSION}                   ║"
    echo "║     เครื่องมือเสริมประสิทธิภาพการเขียนโปรแกรม          ║"
    echo "╚═════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install to current project
install_to_project() {
    local target_dir="${1:-.}"

    print_info "Installing AI Productivity Kit to: $target_dir"

    # Create directories
    mkdir -p "$target_dir/.claude/commands"
    mkdir -p "$target_dir/.claude/agents"
    mkdir -p "$target_dir/.claude/skills"
    mkdir -p "$target_dir/.claude/knowledge"
    mkdir -p "$target_dir/ψ/active"
    mkdir -p "$target_dir/ψ/inbox"
    mkdir -p "$target_dir/ψ/memory/tricks"
    mkdir -p "$target_dir/ψ/memory/patterns"
    mkdir -p "$target_dir/ψ/memory/retros"
    mkdir -p "$target_dir/ψ/memory/logs"
    mkdir -p "$target_dir/ψ/writing"
    mkdir -p "$target_dir/ψ/lab"

    print_success "Created directory structure"

    # Copy files
    cp -r "$SCRIPT_DIR/.claude/"* "$target_dir/.claude/" 2>/dev/null || true
    print_success "Copied commands, agents, skills, knowledge"

    # Create initial files
    cat > "$target_dir/ψ/inbox/focus.md" << 'EOF'
# Current Focus

**State**: ready
**Task**: -
**Started**: -

## Notes
Ready to start working!

Use `/ai-kit:start` to begin a session.
EOF

    cat > "$target_dir/.claude/knowledge/project-notes.md" << EOF
# Project Notes

**Project**: $(basename "$target_dir")
**Initialized**: $(date +%Y-%m-%d)

## Project Specifics
<!-- Add project-specific notes here -->

## Tech Stack
<!-- List your tech stack -->

## Important Patterns
<!-- Document patterns specific to this project -->
EOF

    print_success "Created initial files"

    # Create .gitignore entries
    cat >> "$target_dir/.gitignore" << 'EOF'

# AI Productivity Kit - ψ (working directory)
ψ/active/
ψ/inbox/WIP.md

# Keep these tracked
!ψ/inbox/focus.md
!ψ/memory/
EOF

    print_success "Updated .gitignore"

    echo ""
    print_success "AI Productivity Kit installed!"
    echo ""
    echo "Next steps:"
    echo "  1. cd $target_dir"
    echo "  2. Start with: /ai-kit:start"
    echo "  3. Or create plan: /nnn [feature description]"
}

# Install globally
install_global() {
    print_info "Installing AI Productivity Kit globally..."

    local install_dir="$HOME/.ai-productivity-kit"
    mkdir -p "$install_dir"

    # Copy all files
    cp -r "$SCRIPT_DIR"/* "$install_dir/"
    print_success "Copied to $install_dir"

    # Create symlink
    local bin_dir="$HOME/.local/bin"
    mkdir -p "$bin_dir"

    cat > "$bin_dir/ai-kit" << 'EOSH'
#!/bin/bash
# AI Productivity Kit wrapper

KIT_DIR="$HOME/.ai-productivity-kit"

case "$1" in
    init)
        echo "Initializing AI Productivity Kit..."
        bash "$KIT_DIR/install.sh" --here
        ;;
    update)
        echo "Updating AI Productivity Kit..."
        cd "$KIT_DIR" && git pull || echo "Not a git repo"
        ;;
    version|--v|-v)
        echo "AI Productivity Kit v1.0.0"
        ;;
    help|--h|-h)
        echo "AI Productivity Kit - Quick Setup"
        echo ""
        echo "Usage: ai-kit [command]"
        echo ""
        echo "Commands:"
        echo "  init    Initialize in current directory"
        echo "  update  Update the kit"
        echo "  version Show version"
        echo "  help    Show this help"
        echo ""
        echo "After init, use these commands in Claude Code:"
        echo "  /ai-kit:start    Start a session"
        echo "  /nnn [desc]      Create a plan"
        echo "  /gogogo         Execute plan"
        echo "  /rrr            Session retrospective"
        ;;
    *)
        echo "Unknown command: $1"
        echo "Run 'ai-kit help' for usage"
        exit 1
        ;;
esac
EOSH

    chmod +x "$bin_dir/ai-kit"
    print_success "Created 'ai-kit' command in $bin_dir"

    echo ""
    print_success "AI Productivity Kit installed globally!"
    echo ""
    echo "Usage:"
    echo "  ai-kit init          # Initialize in current directory"
    echo "  ai-kit update        # Update the kit"
    echo "  ai-kit version       # Show version"
}

# Uninstall
uninstall() {
    print_warning "Uninstalling AI Productivity Kit..."

    read -p "Remove global installation? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.ai-productivity-kit"
        rm -f "$HOME/.local/bin/ai-kit"
        print_success "Uninstalled"
    fi
}

# Show help
show_help() {
    cat << EOF
AI Productivity Kit - Installation Script

Usage: ./install.sh [option]

Options:
  --here, -h        Install to current directory
  --global, -g      Install globally (creates 'ai-kit' command)
  --uninstall       Uninstall global installation
  --help,           Show this help

Examples:
  ./install.sh --here       # Install to current project
  ./install.sh --global     # Install globally
  ai-kit init               # After global install, init any project

After installation, use in Claude Code:
  /ai-kit:start    Start a working session
  /nnn [desc]      Create implementation plan
  /gogogo         Execute the plan
  /rrr            Session retrospective

Documentation:
  https://github.com/YOUR_USERNAME/ai-productivity-kit
EOF
}

# Main
main() {
    show_banner

    case "${1:-}" in
        --here|-h|"")
            install_to_project "."
            ;;
        --global|-g)
            install_global
            ;;
        --uninstall)
            uninstall
            ;;
        --help|--h|help)
            show_help
            ;;
        *)
            if [ -d "$1" ]; then
                install_to_project "$1"
            else
                print_error "Unknown option: $1"
                show_help
                exit 1
            fi
            ;;
    esac
}

main "$@"
