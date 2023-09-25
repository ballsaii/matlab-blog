---
author: "BBeaw"
date: 2020-05-10
title: ฟังก์ชันบน array แบบไม่วน loop
categories: [matlab]
tags: [function]
draft: false
---

## ทำซ้ำแบบไม่ใช้ loop

โดยปกติ เราจะใช้ทำ operate บน vector array สักอันเรา เรามักจะใช้การวนลูป เช่น for loop โดยในแต่ละ loop จะ operate ตามแต่ตัวของ array โดยใช้ index เป็นเปลียนค่าเมื่อต้องการวน loop  ใหม่ 

ตัวอย่างเช่น ถ้าจะให้ vertor x ในแต่ละ index มีค่ายกกำลังสอง ถ้าเขียนแบบ loop ก็จะเขียนได้ว่า 

```MATLAB
x = [1:10];
for i=1:10
  result(i) = x(i).^2
end
```
<br/> 
ผลลัพธ์ที่ได้จะอยู่ที่ vector ชื่อ result

แต่ถ้าไม่อยากเขียน loop แบบนี้ จะสามารถทำอย่างไรได้บ้าง คำตอบก็คือ มี built-in function ใน MATLAB ในตระกูล fun เช่น arrayfun, cellfun, structfun ที่ทำหน้าที่ให้การ apply function ลงในแต่ละ index ของตัวแปรต้น ถ้าตัวแปรต้นเป็นชนิด array เราก็เลือก function arrayfun แต่ถ้าตัวแปรต้นเป็น array cell ก็ใช้เลือกใช้ cellfun หรือเป็น structre(เป็น built-in class ปกติใช้เก็บข้อมูลที่มีความซับซ้อนและหลากหลาย) ก็เลือกใช้ structfun

ถ้าลองเขียนโค้ดใหม่เพื่อให้ได้ผลลัพธ์ตามตัวอย่างข้างบน จะได้ 

```MATLAB
x = [1:10];
result  = arrayfun(@(u) u^2, x)
```

ถ้าเรามีจำนวนตัวแปรต้น array เพิ่มหนึ่งตัวก็สามารถเขียนได้ตามตัวอย่าง

ตัวอย่าง

```MATLAB
x = [1:10];
y = [10:1];
result = arrayfun(@(u,v) u^2+v^2, x,y)
```
โดยปกติการเรียกใช้ function จะใช้แบบ anomynous (เช่น @(u,v) u^2+v^2)
หรือถ้า function มันยาวก็เขียน function ใหม่เขียนมาภายใน script เดียวกัน หรือจะเขียนแยกอีก .m ไฟล์ก็ได้ (อย่าลืม add path)

บางครั้งผลลัพธ์ที่ได้ไม่สามารถเขียนในรูป Uniform ได้ มันจะทักเรา

ถ้าเรา apply function แล้วได้ผลลัพธ์ที่ไม่ Uniform เช่นถ้าผลลัพธ์คือ

```MATLAB
result(1) = 1;
result(2) = ‘City’;
result(3) = 1E2;
```
ให้เราใส่ ให้ใส่ ‘UniformOutput’ เป็น 0 หรือ false

```MATLBA
arrayfun(func, x,  ‘UniformOutput’, 0)
```

ผลลัพธ์ที่ได้จะอยู่ในรูปแบบ cell array ที่มี output ในแต่ละ cell array นั้นๆ

ฉะนั้นถ้าเอาตัวอย่างแรกมาใส่ ‘UniformOutput’ เป็น 0

ความแตกต่างของผลลัพธ์ระหว่างการใส่ค่า ‘UniformOutput’ เป็น 0 กับ 1 คือ

- สำหรับ ‘UniformOutput’ 0  
y{1} = ‘1’, y{2}=‘4’, y{3} = ‘9’ .. ; cell array ขนาด 1x10

- สำหรับ ‘UniformOutput’ 1  
y(1)=1, y(2)=4, y(3)=9 .. ; vector array ขนาด 1x10 



ข้อดีของการใช้ funtion ตระกูล fun จะมีการคำนวณที่เร็วขึ้นเมื่อใช้งานแบบ paralell computating นั่นหมายความว่าเราสามารถวน loop ได้พร้อมๆ กัน 
โดยปกติการใช้งานทั่วๆ ไปไม่ได้ไปถึงขัั้นนั้นกันหรอก อย่างน้อยมันก็สะดวกเวลาเขียนโค้ดเพราะไม่ต้องมาเสียเวลานั่งวน loop 

อย่าลืม กด like share เป็นกำลังให้ด้วยนะครับ 




