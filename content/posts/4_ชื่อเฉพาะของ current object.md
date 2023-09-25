---
author: "BBeaw"
date: 2020-05-16
title: ชื่อเฉพาะของ current object
categories: [matlab]
tags: [GUI,object_handle]
draft: false
---
เนื่องจากพื้นฐานการ input โค้ดเป็นแบบ command line มันก็มักจะมีคำที่ใช้บ่งบอก object ที่ active อยู่เช่น gcf, gca คำพวกนี้คืนค่า object ต่างๆ ที่ใช้ ณ ปัจจุบัน เพื่อความสะดวกใช้การเซ็ตพารามิเตอร์ ประมาณว่าเพื่อสะดวก ไม่ต้องไปนั่งหา object ที่ workspace ว่าจะเลือกอันไหน

ถ้ามี figure เปิดพร้อมๆ กัน  5 หน้าต่าง ด้วยคำสั่ง
```MATLAB
>> for i=1:5
>> f(i) = figure;
>> end
```
แล้วจะให้หน้าต่างนี้ (เอาอันนี้) ให้มีสีเขียว 
ก็เริ่มต้น active ที่หน้าต่างนั้นแล้วกลับมาพิมพ์ ที่ MATLAB command line ว่า
```MATLAB
>> set(gcf,'color','g')
```
เช่นเดียวกัน gca ที่หมายถึง axes ที่ active อยู่ปัจจุบัน ใช้แบบเดียวกัน หากจะให้ current object ไหน show ออกมาก็ไว้หน้าสุดให้เราเห็น ก็ใช้ shg (น่าจะหมายถึง "**sh**ow **g**raphic ")

ถ้าจะลบ object ทุกอย่างออกจาก gcf ก็ใช้ ccf (**c**lear **c**urrent **f**igure) เช่นเดียวกันกับ cla (**cl**ear **a**xes)