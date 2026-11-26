# ตาทิพย์ (Third Eye) — คำใบ้ครบทุกอย่างตั้งแต่เริ่มเกม

ชุดคำใบ้สำเร็จรูปสำหรับ [City Game Studio](https://store.steampowered.com/app/726840/) ให้เห็นค่าที่เหมาะที่สุดตั้งแต่เกมแรกที่ทำ โดยไม่ต้องไล่ทำ "สรุปบทเรียนหลังวางขาย" ทีละเกม ใช้ได้กับ **ทุกระดับความยาก** รวมถึงระดับที่มากับเกม

## ได้อะไรบ้าง

| คำใบ้ | จำนวน (ตัวเกม) | จำนวน (+ CGS Mega DLC) |
|---|---|---|
| ค่าที่เหมาะของเกจออกแบบ / พัฒนา / ขัดเกลา ของทุกแนวเกม | 960 | 960 |
| ความเข้ากันของ แนวเกม × แพลตฟอร์ม, ธีม × แนวเกม, แพลตฟอร์ม × กลุ่มผู้เล่น | 8,968 | 23,517 |

ทุกรายการเป็นระดับความแม่นสูงสุด ครอบคลุม 64 แนวเกม 48 ธีม 88 แพลตฟอร์มของตัวเกม และธีมกับแพลตฟอร์มที่ CGS Mega DLC เพิ่มเข้ามา

## ทำงานยังไง

เกมมีระบบจำคำใบ้ข้ามเซฟอยู่แล้ว โดยเก็บไว้ในไฟล์ `game-tips.json` ของผู้เล่น และตอนเริ่มเกมใหม่มีตัวเลือก **Keep hints** (ในม็อดแปลไทยชื่อ "เก็บเคล็ดลับไว้") ให้ดึงคำใบ้ที่เคยปลดมาใช้ ตาทิพย์คือไฟล์คำใบ้ที่เติมมาครบทุกช่องตั้งแต่ต้น

- ไม่ได้แก้ไฟล์เกม ไม่ได้ใช้คอนโซลโกง จึงไม่ติดธงโกงในเซฟ
- เกมตรวจค่าทุกรายการกับข้อมูลของตัวเองอีกครั้งตอนโหลด ค่าที่แสดงจึงตรงกับเกมเวอร์ชันที่คุณเล่น
- เป็นไฟล์ข้อมูลผู้เล่น ไม่ใช่ม็อด Workshop จึงต้องติดตั้งด้วยสคริปต์ด้านล่าง

## ติดตั้ง

ปิดเกมก่อน แล้วรันใน PowerShell จากโฟลเดอร์นี้

ตัวเกมอย่างเดียว:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

ใช้คู่กับ CGS Mega DLC:

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1 -MegaDLC
```

จากนั้นเปิดเกม กด **เริ่มเกมใหม่** แล้วติ๊กตัวเลือก **Keep hints** (ในม็อดแปลไทยชื่อ "เก็บเคล็ดลับไว้") ในหน้าตั้งค่าเกมใหม่ เลือกระดับความยากไหนก็ได้

สคริปต์จะสำรองไฟล์คำใบ้เดิมของคุณเป็น `game-tips.backup-<วันที่>.json` ในโฟลเดอร์เดียวกันก่อนแทนที่

## ถอนการติดตั้ง

```powershell
powershell -ExecutionPolicy Bypass -File restore.ps1
```

จะนำไฟล์สำรองล่าสุดกลับมา เซฟที่เริ่มไปแล้วด้วยคำใบ้ชุดนี้จะยังมีคำใบ้อยู่ในเซฟนั้น

## ข้อจำกัดที่รู้อยู่

- มีผลกับ **เกมที่เริ่มใหม่** และติ๊ก Keep hints เท่านั้น เซฟเดิมที่ไม่ได้ติ๊กไว้จะไม่ได้รับ
- เปอร์เซ็นต์บนเกจตอนทำเกมเป็นตัวเลือกของระดับความยาก ไม่เกี่ยวกับไฟล์นี้ ระดับความยากที่มากับเกมมีแบบแสดงเปอร์เซ็นต์ให้เลือกอยู่แล้ว
- แพลตฟอร์มหรือธีมจากม็อดที่ชื่อมีอักขระพิเศษ (เช่น วงเล็บ หรือ `&`) เกมไม่รับเป็นคีย์คำใบ้ จึงไม่มีในชุดนี้ (320 รายการในชุด Mega DLC)
- เนื้อหาจากม็อดอื่นนอกจาก CGS Mega DLC ไม่อยู่ในชุดนี้ เกมจะค่อย ๆ ปลดให้เองตามปกติ
- ทดสอบกับเกมบน Windows เท่านั้น

## ที่มาของข้อมูล

รวบรวมจากตารางข้อมูลแนวเกม ธีม และแพลตฟอร์มของเกมที่ติดตั้งในเครื่อง และจากไฟล์ของ CGS Mega DLC ตรวจเทียบกับคำใบ้ 261 รายการที่เกมบันทึกไว้เองจากการเล่นจริง: ชื่อคีย์และป้ายกำกับตรงกันทั้งหมดในส่วนของตัวเกม

## โปรเจกต์ที่เกี่ยวข้อง

- [CityGameStudio-Thai](https://github.com/needsleeps/CityGameStudio-Thai) — ม็อดแปลภาษาไทยตัวเกม
- [CGS-MegaDLC-Thai](https://github.com/needsleeps/CGS-MegaDLC-Thai) — ภาษาไทยสำหรับ CGS Mega DLC

## English

A complete hint file for City Game Studio. The game already keeps hints across saves in `game-tips.json` and offers a "keep hints" option on the new-game screen; Third Eye is that file with every entry filled in at maximum accuracy (ideal gauge values for all 64 genres, genre × platform, theme × genre and platform × audience matches). Works on every difficulty, does not touch game files and does not set the cheat flag. Close the game, run `install.ps1` (add `-MegaDLC` if you use CGS Mega DLC), start a new game and tick "keep hints". `restore.ps1` puts your previous file back.

## สัญญาอนุญาต

สคริปต์ใช้ MIT เอกสารใช้ CC BY 4.0 ดู [LICENSE](LICENSE) ข้อมูลตัวเลขของเกมเป็นของ Binogure Studio และผู้สร้าง CGS Mega DLC
