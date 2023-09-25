---
author: "BBeaw"
date: 2020-07-31
publishDate: 2020-07-31
title: function สำหรับการลองผิดลองถูก
categories: [matlab]
tags: [function]
draft: true
---

สำหรับบางคนที่ไม่แน่ใจว่า ค่า input argument ใส่มาใน function แล้วจะ error ไหม หรือ ใส่ assign ค่าแบบนี้จะขึ้น error ไหม MATLAB มันให้ลอง ' ทำ' ดูก่อน หากไม่ work เกิด error ขึ้นก็แจ้งกลับ

## Try ลองฉันดูสิ
try catch เป็นคำสงวนที่ใช้ร่วมกัน เช่นเดียวกับ switch และ case หน้าที่ของมันคือ try แบบนี้สิ ถ้ามี error ก็การ 'ลอง' ครั้งนั้นก็ไม่มีผล ถามยังแจ้งกลับด้วยว่า error code อะไร

## งั้นมาลองดู

## ประยุกต์ใช้ในการถามซ้ำ

เช่นว่า 