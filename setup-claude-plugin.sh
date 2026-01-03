#!/bin/bash
# AI Productivity Kit - Claude Code Plugin Setup
# Quick setup for private/local Claude Code plugin

set -e

VERSION="1.0.0"
PLUGIN_NAME="ai-productivity-kit"
CONFIG_DIR="$HOME/.claude"
PLUGIN_DIR="$CONFIG_DIR/plugins"
TARGET_DIR="$PLUGIN_DIR/$PLUGIN_NAME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_info() { echo -e "${BLUE}ℹ${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_step() { echo -e "${CYAN}▶${NC} $1"; }

# Show banner
show_banner() {
    echo -e "${CYAN}"
    echo "╔═════════════════════════════════════════════════════╗"
    echo "║     AI Productivity Kit v${VERSION}                   ║"
    echo "║     Claude Code Plugin Setup                        ║"
    echo "╚═════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Check Claude Code
check_claude_code() {
    print_step "Checking Claude Code installation..."

    if command -v claude &>/dev/null; then
        print_success "Claude Code found"
        return 0
    fi

    if [ -d "$CONFIG_DIR" ]; then
        print_success "Claude Code directory found"
        return 0
    fi

    print_warning "Claude Code not found, continuing anyway..."
}

# Create directories
create_directories() {
    print_step "Creating plugin directories..."

    mkdir -p "$PLUGIN_DIR"
    mkdir -p "$CONFIG_DIR/commands"
    mkdir -p "$CONFIG_DIR/agents"
    mkdir -p "$CONFIG_DIR/skills"
    mkdir -p "$CONFIG_DIR/knowledge"

    print_success "Directories created"
}

# Install plugin
install_plugin() {
    print_step "Installing AI Productivity Kit..."

    # Remove old installation if exists
    if [ -d "$TARGET_DIR" ]; then
        print_warning "Removing old installation..."
        rm -rf "$TARGET_DIR"
    fi

    # Copy plugin
    cp -r "$SCRIPT_DIR" "$TARGET_DIR"

    print_success "Plugin installed to $TARGET_DIR"
}

# Create config
create_config() {
    print_step "Creating Claude Code config..."

    local config_file="$CONFIG_DIR/config.json"

    # Backup existing config
    if [ -f "$config_file" ]; then
        print_warning "Backing up existing config..."
        cp "$config_file" "$config_file.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # Create new config
    cat > "$config_file" << EOF
{
  "plugins": [
    {
      "name": "ai-productivity-kit",
      "type": "local",
      "path": "$TARGET_DIR",
      "enabled": true
    }
  ]
}
EOF

    print_success "Config created at $config_file"
}

# Create wrapper commands
create_wrappers() {
    print_step "Creating wrapper commands..."

    # Create symlink for commands
    local cmd_dir="$CONFIG_DIR/commands"
    local agent_dir="$CONFIG_DIR/agents"
    local skill_dir="$CONFIG_DIR/skills"

    # Commands
    for cmd in "$TARGET_DIR/.claude/commands"/*.md; do
        if [ -f "$cmd" ]; then
            local name=$(basename "$cmd" .md)
            ln -sf "$cmd" "$cmd_dir/ai-kit:$name.md" 2>/dev/null || true
        fi
    done

    # Skills
    for skill in "$TARGET_DIR/.claude/skills"/*.md; do
        if [ -f "$skill" ]; then
            ln -sf "$skill" "$skill_dir/" 2>/dev/null || true
        fi
    done

    # Agents
    for agent in "$TARGET_DIR/.claude/agents"/*.md; do
        if [ -f "$agent" ]; then
            ln -sf "$agent" "$agent_dir/" 2>/dev/null || true
        fi
    done

    print_success "Wrapper commands created"
}

# Verify installation
verify() {
    print_step "Verifying installation..."

    local errors=0

    if [ ! -d "$TARGET_DIR" ]; then
        print_error "Plugin directory not found"
        errors=$((errors + 1))
    fi

    if [ ! -f "$CONFIG_DIR/config.json" ]; then
        print_error "Config not found"
        errors=$((errors + 1))
    fi

    local cmd_count=$(ls "$TARGET_DIR/.claude/commands"/*.md 2>/dev/null | wc -l)
    local agent_count=$(ls "$TARGET_DIR/.claude/agents"/*.md 2>/dev/null | wc -l)
    local skill_count=$(ls "$TARGET_DIR/.claude/skills"/*.md 2>/dev/null | wc -l)

    echo ""
    echo "Installed components:"
    echo "  - Commands: $cmd_count"
    echo "  - Agents: $agent_count"
    echo "  - Skills: $skill_count"

    if [ $errors -eq 0 ]; then
        print_success "Installation verified!"
        return 0
    else
        print_error "Verification failed with $errors errors"
        return 1
    fi
}

# Show next steps
show_next_steps() {
    echo ""
    echo -e "${GREEN}╔═════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Installation Complete! 🎉                            ║${NC}"
    echo -e "${GREEN}╚═════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Plugin installed at: $TARGET_DIR"
    echo ""
    echo "Quick Start:"
    echo "  1. Open Claude Code"
    echo "  2. Go to your project directory"
    echo "  3. Run: /ai-kit:awaken"
    echo ""
    echo "Common Commands:"
    echo "  /ai-kit:start    - Start a session"
    echo "  /ai-kit:focus    - Set current task"
    echo "  /nnn [desc]      - Create implementation plan"
    echo "  /gogogo         - Execute the plan"
    echo "  /rrr            - Session retrospective"
    echo ""
    echo "For more info:"
    echo "  cat $TARGET_DIR/README.md"
    echo "  cat $TARGET_DIR/.claude/knowledge/quick-reference.md"
}

# Uninstall
uninstall() {
    print_warning "Uninstalling AI Productivity Kit..."

    read -p "Remove plugin directory? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$TARGET_DIR"
        print_success "Plugin directory removed"
    fi

    read -p "Remove from config? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -f "$CONFIG_DIR/config.json"
        print_success "Config removed"
    fi

    print_success "Uninstall complete"
}

# Main
main() {
    show_banner

    case "${1:-}" in
        --uninstall|-u)
            uninstall
            exit 0
            ;;
        --help|-h|"")
            cat << EOF
AI Productivity Kit - Claude Code Plugin Setup

Usage: $0 [option]

Options:
  (none)     Install the plugin
  --uninstall Remove the plugin
  --help      Show this help

After installation, use in Claude Code:
  /ai-kit:awaken   Initialize in project
  /ai-kit:start    Start session
  /nnn [desc]      Create plan
  /gogogo         Execute plan
EOF
            exit 0
            ;;
    esac

    check_claude_code
    create_directories
    install_plugin
    create_config
    create_wrappers
    verify
    show_next_steps
}

main "$@"
