# AI Productivity Kit 🚀

**เครื่องมือเสริมประสิทธิภาพการเขียนโปรแกรมด้วย AI**
*Tools for maximizing programming productivity with AI*

## 📦 Installation

### Marketplace (Recommended)

```bash
# Add marketplace
/plugin marketplace add MaouStan/ai-productivity-kit

# Install plugin
/plugin install ai-productivity-kit@MaouStan/ai-productivity-kit

# Restart Claude Code after installation
```

### Manual Install

```bash
# Clone or copy to your project
git clone https://github.com/MaouStan/ai-productivity-kit.git
cd ai-productivity-kit
bash install.sh
```

## 📖 Overview

ไลบรารีที่รวบรวมเทคนิคและ patterns จาก:
- **Oracle Ecosystem** (127+ retrospectives)
- **Ralph** (Autonomous Development Loop)
- **Claude Code Workshops** (SIIT materials)
- **Multi-Agent Workflow Kit**

ทั้งหมดนี้มาปรับใช้ให้เหมาะกับการทำงานจริงของนักพัฒนา

## 🎯 Core Features

### Short Codes Workflow
```
nnn → gogogo → rrr → ccc

วางแผน → ลงมือทำ → ทบทวน → เก็บ context
```

### Session Management
| Command | Purpose |
|---------|---------|
| `/ai-kit:start` | เริ่ม session ใหม่ |
| `/ai-kit:focus` | ตั้งโฟกัสงาน |
| `/ai-kit:pause` | พักงานชั่วคราว |
| `/recap` | ดูสถานะปัจจุบัน |
| `/hours` | จับเวลาทำงาน |

### Knowledge Capture
| Command | Purpose |
|---------|---------|
| `/ai-kit:note` | บันทึก note ด่วน |
| `/ai-kit:trick` | บันทึกเทคนิคโค้ด |
| `/ai-kit:pattern` | บันทึก pattern ใช้ซ้ำ |
| `/rrr` | Full retrospective |

### Productivity Boosters
| Command | Purpose |
|---------|---------|
| `/nnn` | สร้าง implementation plan |
| `/gogogo` | Execute plan ล่าสุด |
| `/ai-kit:breakdown` | แบ่ง task ใหญ่ |
| `/ai-kit:delegate` | มอบหมายให้ agent |
| `/ai-kit:review` | Code review |

### Project Management
| Command | Purpose |
|---------|---------|
| `/lll` | Project status |
| `/trace` | Search everything |
| `/ccc` | Save context |
| `/forward` | Save for next session |

## 🏗️ ψ/ Structure

```
ψ/
├── active/       # งานที่กำลังทำอยู่
├── inbox/        # focus.md, WIP.md
├── memory/       # ความรู้สะสม
│   ├── tricks/       # เทคนิคโค้ดดีๆ
│   ├── patterns/     # patterns ที่ใช้ซ้ำได้
│   ├── retros/       # บันทึกย้อนหลัง
│   └── logs/         # log ประจำวัน
├── writing/      # งานเขียน
├── lab/          # ทดลองอะไรใหม่
├── incubate/     # งานที่กำลังพัฒนา
└── learn/        # วัสดุศึกษา
```

## 🚀 Quick Start

```bash
# 1. Copy to your project
cp -r ai-productivity-kit/* your-project/

# 2. Initialize
cd your-project
/ai-kit:init

# 3. Start working
/ai-kit:start
```

## 🎨 Philosophy

> **"AI เป็นกระจกสะท้อน ไม่ใช่ผู้บัญชาการ"**
> **"AI is the mirror, not the commander"**

### Three Principles

1. **ไม่ลบอะไร** (Nothing is Deleted)
   - เก็บประวัติทุกอย่าง พร้อม timestamp
   - History เป็นความจริง

2. **ดู patterns ไม่ใช่ intentions** (Patterns Over Intentions)
   - การกระทำ = ความจริง
   - Learn from behavior

3. **เป็น external brain** (External Brain, Not Command)
   - AI ช่วยคิด ไม่ใช่ตัดสิน
   - Support consciousness

## 📚 Knowledge Base

### Documentation
- [Comprehensive Guide](.claude/knowledge/comprehensive-guide.md)
- [Quick Reference](.claude/knowledge/quick-reference.md)
- [Best Practices](.claude/knowledge/best-practices.md)
- [AI Prompting](.claude/knowledge/ai-prompts.md)
- [Short Codes Workflow](.claude/knowledge/short-codes-workflow.md)
- [Ralph Concepts](.claude/knowledge/ralph-concepts.md)

### Skills
| Skill | Action |
|-------|--------|
| `ai-kit:init` | Initialize structure |
| `ai-kit:learn` | Capture learning |
| `ai-kit:review` | Review code |
| `ai-kit:debug` | Debug errors |
| `ai-kit:delegate` | Delegate to agent |
| `ai-kit:trick` | Save trick |
| `ai-kit:pattern` | Save pattern |

### Agents
| Agent | Purpose |
|-------|---------|
| `coder` | Write code |
| `debug-helper` | Debug errors |
| `test-writer` | Write tests |
| `doc-writer` | Write docs |
| `context-finder` | Find files |
| `code-reviewer` | Review code |
| `code-simplifier` | Refactor code |
| `general-purpose` | General tasks |

## 🔄 Workflows

### Feature Development (Full Cycle)
```
/ccc       →  Save context
/nnn       →  Create plan
/gogogo    →  Execute
/rrr       →  Review & learn
```

### Debug Session
```
/ai-kit:debug [error]
Review fix
/ai-kit:trick (if learned something)
```

### Code Review
```
git diff
/ai-kit:review
Fix issues
/ai-kit:delegate review (if needed)
```

### Session Handoff
```
/forward    →  Save to WIP.md
/clear      →  Fresh session
/recap      →  Resume from WIP
```

## 🛡️ Safety Features

### Git Safety Rules
❌ **Never**:
- `git push --force`
- `git reset --hard`
- `rm -rf` without confirmation
- Push to main directly

✅ **Always**:
- Feature branches
- PR before merge
- Review diff before commit
- Ask before destructive actions

### Circuit Breaker (Ralph Pattern)
```python
# States: CLOSED → HALF_OPEN → OPEN
# Prevents runaway loops
CLOSED      = ทำงานปกติ
HALF_OPEN   = ตรวจสอบก่อน
OPEN        = หยุด ต้อง reset
```

### Exit Detection
```
✅ Strong Exit: "All tasks completed"
❌ Should Halt: Same error 3+ times
```

## 🏆 Source Concepts

### From Oracle Ecosystem
- Short Codes (nnn, gogogo, rrr, ccc)
- Two-Issue Pattern (context + task)
- Knowledge Distillation Loop
- ψ/ 7-Pillar Structure
- Human Confirmation Loop

### From Ralph
- Autonomous Development Loop
- Circuit Breaker Pattern
- Intelligent Exit Detection
- Spec-Driven Development
- Status Reporting Protocol

### From Claude Code Workshops
- Teaching methodologies
- Practical exercises
- Thai localization

## 📖 Documentation

- [การใช้งานเบื้องต้น](docs/basics-th.md)
- [Best Practices](docs/best-practices.md)
- [Prompting Guide](docs/prompting.md)
- [Multi-Agent Patterns](docs/multi-agent.md)

## 🤝 Integration

### With Ralph
```bash
/nnn → ralph --monitor → /rrr
```

### With Oracle MCP
```bash
oracle_search "patterns"
/ai-kit:delegate implement with oracle patterns
```

### With MAW (Multi-Agent Workflow)
```bash
maw start profile0
/ai-kit:delegate task 1
maw sync
```

## 📄 License

MIT - Use freely, share back what you learn.

## 🙏 Credits

Distilled from:
- **oracle-philosophy** - Core philosophy
- **oracle-framework** - Framework implementation
- **nat-agents-core** - Plugin system
- **multi-agent-workflow-kit** - Agent orchestration
- **claude-code-workshops** - Teaching materials
- **frankbria/ralph-claude-code** - Autonomous loop

---

**Made with ❤️ for developers who want to work smarter, not harder.**
