---
author: "BBeaw"
date: 2020-06-06
title: ลำดับในการเรียก function
categories: [matlab]
tags: [function]
draft: false
isMath: true
---

ถ้าเรามีใช้ชื่อ function ที่ซ้ำๆ กัน MATLAB จะมีลำดับในการเรียก function เหล่านั้นขึ้นมาใช้
เรารู้อยู่แล้วว่า `plot` เป็น built-in function ของ MATLAB ถ้าเรายังจะดื้อดึงในการสร้างไฟล์ function ที่ชื่อ `plot` เหมือนกันขึ้นมาอีกจะเกิดอะไรขึ้น MATLAB จะเรียกใช้ตัวไหนก่อน เรามาดูกัน

แค่เราสร้าง *plot.m* MATLAB ก็จะทำการเตือนก่อน

```MATLAB
Warning: Function plot has the same name as a MATLAB builtin. We
suggest you rename the function to avoid a potential name conflict. 
Warning: Function plot has the same name as a MATLAB builtin. We
suggest you rename the function to avoid a potential name conflict. 
```
ในโค้ด มีคำสั่งง่ายๆ แบบนี้
```MATLAB
function plot(x,y)
disp(x)
disp(x)
end
```
ใน command line พิมพ์ว่า
```MATLAB
plot([1:10],[1:10])
```
ผลลัพธ์ก็คือ
```MATLAB
1     2     3     4     5     6     7     8     9    10

1     2     3     4     5     6     7     8     9    10
```
หมายความว่า MATLAB เลือกที่จะเรียก *plot.m* ที่เราสร้างขึ้นมากกว่าจะเรียกจาก  built-in function

อีกตัวอย่างนึง ถ้ามี function สมมุติว่าชื่อ *Duplic1.m* ที่อยู่ใน *Current Folder* กับ *Duplic1.m* ที่อยู่ใน path */path/Duplic1.m* ที่ได้ทำการ add path เรียบร้อย เราจะมาดูสิว่า MATLAB จะเลือกเรียกใชังานตัวไหนก่อน  

โค้ดใน *Duplic1.m* คือ  

```MATLAB
function Duplic1
disp('Dupli1 in current path')
end
```  

และโค้ดใน */path/Duplic1.m* คือ  

```MATLAB
function Duplic1
disp('Dupli1 in added path')
end
```

ผลลัพธ์คือ
```>> Duplic1
Dupli1 in current path
```
หมายความว่า MATLAB จะเลือกใน *Current Folder* ก่อนใน added path

สรุปง่ายๆ การเรียกใช้ function จะเป็นไปตามเอกสาร (function procedure order)[https://www.mathworks.com/help/matlab/matlab_prog/function-precedence-order.html] นี้ ทางดีที่สุดคือ พยายามไม่ใช่ชื่อช้ำกัน หรือ ถ้ามี function อะไรไม่รู้ที่ add อยู่ path หรือไม่แน่ใจว่าเราเลือกชื่อถูกตามที่ต้องการรึป่าว ให้เช็คด้วยคำสั่ง `which` ตามด้วยชื่อ function มันก็จะบอกว่า function ที่ใช้งานนี้อยู่ใน location ไหน

---