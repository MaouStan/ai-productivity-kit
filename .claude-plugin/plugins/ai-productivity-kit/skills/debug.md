# ai-kit:debug

**Debug with AI assistance**

## Description
ให้ AI ช่วย debug error โดยวิเคราะห์และหา solution

## What It Does
1. รับ error message + stack trace
2. ถาม context ที่จำเป็น
3. วิเคราะห์หาสาเหตุ (root cause)
4. เสนอ hypothesis
5. แนะนำวิธีแก้
6. เขียน fix พร้อม test

## Usage
```
/ai-kit:debug [error message]
```

## Best Format
```
/ai-kit:debug
Error: [paste full error]
Stack: [paste stack trace]
File: [file]:[line]
Context: [กำลังทำอะไรอยู่]
```

## Process
```
1. AI วิเคราะห์ error
2. AI ถาม context ถ้าจำเป็น
3. AI เสนอสาเหตุที่เป็นไปได้
4. User confirm/adjust
5. AI เขียน fix
6. User test
7. AI เขียน test ป้องกัน repeat
```
