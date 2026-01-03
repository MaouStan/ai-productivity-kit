# ai-kit:learn-content

**Learning Agent - Process content and generate knowledge + skills**

## Description

This agent processes web content or files and generates structured knowledge files and reusable skills. Use when user runs `/learn` command.

## What It Does

1. **Content Acquisition**
   - Fetch web content via web-reader MCP
   - Read local files (PDF, MD, images, code)
   - Extract text from images via OCR

2. **Analysis**
   - Understand main concepts
   - Identify patterns and best practices
   - Extract workflows and procedures
   - Find reusable techniques

3. **Generation**
   - Create knowledge files in `ψ/memory/`
   - Create skills in `.claude/skills/`
   - Link related concepts

## Input Processing

```python
# Parse user input
inputs = parse_learn_input(user_input)

for source in inputs:
    if source.startswith('http'):
        content = web_reader_fetch(source)
    elif is_image(source):
        content = ocr_extract(source)
    else:
        content = file_read(source)

    analyzed = analyze_content(content)
    generate_outputs(analyzed, source_name)
```

## Output Templates

### Concept File (`ψ/memory/concepts/{name}-concepts.md`)

```markdown
# {Topic} Concepts

**Source**: {URL/file}
**Learned**: {Date}

## Key Concepts

### {Concept 1}
{Definition and explanation}

### {Concept 2}
{Definition and explanation}

## Related Topics
- {Related topic 1}
- {Related topic 2}
```

### Pattern File (`ψ/memory/patterns/{name}-patterns.md`)

```markdown
# {Topic} Patterns

**Source**: {URL/file}
**Learned**: {Date}

## Patterns

### {Pattern Name}
**When to use**: {condition}
**How**: {implementation}
**Example**: {code example}

## Anti-Patterns
- {What to avoid}
- {Common mistakes}
```

### Reference File (`ψ/memory/refs/{name}-reference.md`)

```markdown
# {Topic} Quick Reference

**Source**: {URL/file}
**Updated**: {Date}

## Quick Commands/API

| Command/Item | Description | Example |
|--------------|-------------|---------|
| {item} | {desc} | {example} |

## Common Tasks
{Task 1}: {steps}
{Task 2}: {steps}
```

### Skill File (`.claude/skills/{name}-workflow.md`)

```markdown
# {name}

**Workflow for {task}**
*Auto-generated from learning {source}*

## When to Use
{Condition for using this workflow}

## Steps

1. {Step 1}
   {Details}

2. {Step 2}
   {Details}

## Example
```
{Example code or scenario}
```

## Common Pitfalls
- {Pitfall 1}
- {Pitfall 2}

## Related
- {Related skill/concept}
```

## Quality Checks

Before outputting, verify:
- [ ] All key concepts captured
- [ ] Patterns are reusable
- [ ] Examples are accurate
- [ ] Reference is complete
- [ ] Skill is actionable

## Error Handling

| Error | Solution |
|-------|----------|
| URL not accessible | Try again or use cached version |
| File not found | Check path and permissions |
| OCR failed | Try higher quality image |
| Content too large | Process in sections |

## Example Session

```
User: /learn https://docs.python.org/tutorial/

Agent:
1. Fetching content from web...
2. Analyzing Python tutorial structure...
3. Extracting concepts: modules, functions, classes...
4. Identifying patterns: imports, error handling...
5. Generating outputs...

✅ Created ψ/memory/concepts/python-concepts.md
✅ Created ψ/memory/patterns/python-patterns.md
✅ Created ψ/memory/refs/python-reference.md
✅ Created .claude/skills/python-workflow.md

Ready to answer Python questions!
```

## MCP Tools Used

- `mcp__web_reader__webReader` - Fetch web content
- `mcp__zai-mcp-server__extract_text_from_screenshot` - OCR
- `Read` tool - Read local files
