# ai-kit:init

**Initialize AI Productivity Kit in current project**

## Description
สร้างโครงสร้าง ψ/ directory และ setup พื้นฐานสำหรับใช้ AI Productivity Kit

## What It Does
1. Create ψ/ directory structure:
   - `ψ/active/` - งานที่กำลังทำ
   - `ψ/inbox/` - ข้อความ/คำถาม
   - `ψ/memory/tricks/` - เทคนิคโค้ด
   - `ψ/memory/patterns/` - patterns ใช้ซ้ำได้
   - `ψ/memory/retros/` - retrospective
   - `ψ/memory/logs/` - logs ประจำวัน
   - `ψ/writing/` - งานเขียน
   - `ψ/lab/` - ทดลองอะไรใหม่

2. Copy knowledge files to `.claude/knowledge/`
3. Create initial `ψ/inbox/focus.md`

## Usage
```
/ai-kit:init
```

## After Init
```
Start working: /ai-kit:start
Set focus: /ai-kit:focus [task]
```
