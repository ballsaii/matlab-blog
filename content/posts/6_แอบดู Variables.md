---
author: "BBeaw"
date: 2020-05-28
title: แอบดู Variable 
categories: [matlab]
tags: [function]
draft: false
isMath: = true
---

#### who สอดส่องตัวแปร


เมื่อเราสร้าง function ขึ้นมาอันหนึ่ง ตัวแปรที่อยู่ใน function จะไม่ปรากฏบน base workspace แต่ถ้าเราอยากรู้ว่าระหว่างที่รันนั้น มีตัวแปรอะไรบ้าง มีคุณสมบัติอะไร ถ้าไม่ทำการ *Debug*  มีอีกวิธีนึงก็คือ การใช้ *whos* (*who* เฉยๆ จะบอกแค่ชื่อแต่ *whos* จะบอกมากกว่านั้น) แทรกลงไปในโค้ดไปเลย
เมื่อโปรแกรมรันผ่าน มันก็จะแสดงผลออกมาทาง command line   

ในตัวอย่างนี้ เรามี function ชื่อ *EP6_FnWs* ที่รับตัวแปร *a* และ *b* เอามาบวกกันโดย function หลัก และคูณกันโดย *nested function* ก็จะเขียน `EP6_FnWs.m` ได้ออกมาดังนี้ โดยเราจะทำการแทรก *whos* ใน function หลัก และ nested function 

```MATLAB
function output = EP6_FnWs(a,b)
output(1) = a + b;
output(2) = nested_fn(a,b);

disp('Output from whos is below in EP6_FnWs')
whos
disp('-------------end---------------')

% nested function
    function output_n = nested_fn(a_n,b_n)
        output_n = (a_n*b_n);
        disp('Output from whos is below in nested function')
        whos
        disp('-------------end---------------')
    end
end
```
#### ผลลัพธ์จากการแอบส่อง  
ผลลัพธ์ที่แสดงบน command line คือ
```
Output from whos is below in nested function
  Name          Size            Bytes  Class     Attributes

  ---- EP6_FnWs/nested_fn ---------------------------------
  a_n           1x1                 8  double              
  b_n           1x1                 8  double              
  output_n      1x1                 8  double              

  ---- EP6_FnWs -------------------------------------------
  a             1x1                 8  double              
  b             1x1                 8  double              
  output        1x1                 8  double              

-------------end---------------
Output from whos is below in EP6_FnWs
  Name        Size            Bytes  Class     Attributes

  a           1x1                 8  double              
  b           1x1                 8  double              
  output      1x2                16  double              

-------------end---------------
```
จะสังเกตได้ว่า เมื่อ *whos* อยู่ใน nested function มันจะแสดงตัวแปรทั้ง functionหลัก และ nested function ณ ขณะนั้น output ยังมี ขนาด 1x1 ที่มาจากการทำงานของ function หลักในบรรทัดก่อน หลังจากเสร็จสิ้น การทำงานของ function หลักและ nested function *whos* ที่ตอนนี้อยู่ใน function หลักก็จะแสดงแค่ตัวแปรที่อยู่ใน function หลักเท่านั้น   

นอกจากนี้ ยังแอบสอดส่อง variable ที่เก็บอยู่ใน MAT-file (*.mat) (ไฟล์ที่เอาไว้เก็บค่าตัวแปร อันนี้ไม่ใช่ .m ที่เป็น MATLAB script) โดยการ

```MATLAB
whos -file filename
```

อย่าลืมถ้าเรียกเป็นชื่อตรงๆ ใส่ '' ครอบชื่อไฟล์ไว้ด้วย ไม่งั้นมันอาจจะคิดว่าเป็นตัวแปร 