# ai-kit:delegate

**Delegate task to specialized agent**

## Description
มอบหมายงานให้ agent ที่เหมาะสมที่สุด

## What It Does
1. วิเคราะห์ประเภทของ task
2. เลือก agent ที่เหมาะสม:
   - `coder` - เขียนโค้ด
   - `context-finder` - หาไฟล์/context
   - `code-reviewer` - review code
   - `test-writer` - เขียน test
   - `debug-helper` - debug
   - `doc-writer` - เขียน docs
   - `code-simplifier` - refactor
   - `general-purpose` - ทั่วไป
3. Launch agent พร้อม context
4. รายงานผลลัพธ์

## Usage
```
/ai-kit:delegate [task description]
```

## Examples
```
/ai-kit:delegate เขียน test สำหรับ auth.py
/ai-kit:delegate หา function ที่ validate email
/ai-kit:delegate review code ที่เพิ่งเขียน
/ai-kit:delegate optimize query ที่ช้า
/ai-kit:delegate เขียน README สำหรับ project
```

## Agent Mapping

| Task Keywords | Use Agent |
|---------------|-----------|
| เขียน, implement, add function | coder |
| หา, อยู่ไหน, find, search | context-finder |
| review, check, verify | code-reviewer |
| test, เขียน test, cover | test-writer |
| debug, fix error, bug | debug-helper |
| docs, readme, document | doc-writer |
| refactor, simplify, clean | code-simplifier |
| อื่นๆ | general-purpose |
