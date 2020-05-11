---
author: "BBeaw"
date: 2020-05-11
title: structure อีกรูปแบบหนึ่งในการเก็บข้อมูล
categories: [matlab]
tags: [function]
draft: true
---

หลายๆ คนคงจะคุ้นเคยกับการใข้ vector array กับ cell array เป็นอย่างดีแล้ว มีอีกตัวนึงที่อยากให้รู้จัก และใช้กันแพร่หลายในการเก็บตัวแปรต่างๆ ซึ่งตัวนั้นก็คือ structure ถ้าบอกว่า structure ก็คือ object class แบบนึงของ MATLAB ก็คงไม่ผิดนัก ข้อดีของการเก็บข้อมูลแบบนี้ก็คือ เก็บได้ข้อมูลได้หลายประเภทโดยใช้ field ในการกำหนดหัวข้อคอลัมภ์

ตัวอย่างการใช้งาน 

```MATLAB
x = [1:1E6];
beam.posx = x;
beam.unitx = 'mm';
```
จากตัวอย่างข้างต้นเราสร้าง

structure ที่มีชื่อว่า beam โดยมี field 2 field ชื่อ posx และ unitx โดย filed posx เก็บค่าชนิด vector array ส่วน field unitx เก็บค่าชนิด cell

ถ้าเรามี 2 object beam เราก็สามารถนำมาสร้างเป็น structure array ได้คล้ายๆ cell array   

```MATLAB
% first 
x1 = [1:1E6];
beam(1).posx = x1;
beam(1).unitx = 'mm';

% second
x2 = [1:1E3];
beam(2).posx = x2;
beam(2).unitx = 'cm';
```

ถ้าทำ operate แบบ loop ก็ใช้ structfun ตามที่ blog ก่อนเคยเกริ่นไว้ก่อนหน้านี้
นอกจากนี้ มี function อื่นที่ใช้ร่วมกับ structure เพื่อดึงข้อมูล เช่น fieldaname เพื่อดึงว่ามี fieldname อะไรบ้าง setfield เป็นการ set ค่าให้ structure ของ field ที่กำหนด

นอกจากนี้ยังมี function อื่นๆที่เอาไว้ใช้งาน ถ้ามองในมุมมองของ object class fieldname ก็เปรียบเสมือนเป็น properties ของ obj class structure นั่นเอง
