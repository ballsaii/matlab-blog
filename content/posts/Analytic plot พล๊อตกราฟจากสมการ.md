---
author: "BBeaw"
date: 2020-05-19
publishDate: 2020-05-20
title: Analytic plot สร้างกราฟแบบ analytic
categories: [matlab]
tags: [function,visualization]
draft: false
isMath: = true
---

โดยส่วนใหญ่ MATLAB จะดีลกับข้อมูลที่เป็น numeric ฉะนั้นเวลาเราพล๊อตกราฟก็จะใช้ค่าข้อมูลที่เป็น numeric มาพล๊อตกัน บางครั้งถ้าเรามีสมการนึงที่อาจจะอ้างอิงมาจากทฤษฎี เราก็สามารถพล๊อตแบบ analytic ได้เหมือนกัน กล่าวคือไม่ต้องมานั่งแทนค่า เพื่อให้ได้ค่าข้อมูล numeric แล้วนำ ค่า numeric มาพล๊อตอีกที ซึ่งเสียเวลาและเพิ่ม vector แบบไม่จำเป็นลงใน workspace อีก  


ในโพสต์นี้ เราจะลองพล๊อตแบบ analytic กัน ซึ่งใน `MATLAB` ก็จะมี ฟังก์ชันตระกูล `fplot`, `fplot3`, `fsurf`, `fcontour`, `fmesh`, `implicity`, `fimplicity3`  ที่อยู่ใน *Symbolic Math Toolbox* สังเกตว่าคำสั่งเหล่านี้มีชื่อคล้ายๆ กับคำสั่งที่ใช้พล๊อตแบบ numeric เพียงแต่มี prefix *f-* นำหน้า เราลงมือกันเลยดีกว่า  

### ตัวอย่างการพล๊อต function `sin(x)`
เริ่มต้นที่การสร้างตัวแปรโดยใช้คำสั่ง `syms` 

```MATLAB
syms x
```

สังเกตว่าใน variable workspace มีตัวแปร x ที่มีคลาสเป็น `sym` จากนั้นลองพล๊อต function sin 

```MATLAB
fplot(sin(x))
```

มันจะเลือกช่วงของ x ให้อัตโนมัติ ถ้าจะเลือกช่วงเองก็ทำได้โดยกำหนดช่วง 

```MATLAB
fplot(sin(x),[0 2*pi])
```

อีกตัวอย่าง ถ้าจะพล๊อตสมการเดียวแต่มีค่า argument ที่ต่างกัน เช่น **sin(ax)**

ที่มี argument คือ a แต่เราต้องการให้มีค่าต่างๆ เช่น 1,2 และ 3 สามารถทำได้โดยการเรียกใช้ `subs`
เพื่อแทนค่า argument ด้วยค่า

```MATLAB
% declear x and a as symbolic
syms x a

% plot symbolic but substitute a with [1,2,3]
fplot(subs(sin(a*x)),a,[1,2,3]))
```

### เส้นกราฟของเทอมคณิตศาสตร์เป๊ะๆ

ถามว่าทำไมต้องใช้ analytic plot คำตอบก็คือเราจะเส้นสมการแบบเป๊ะๆ แต่ถ้าใช้การแทนค่าในสมการเอาแล้วพล๊อตแบบ numeric ธรรมดามันก็พอใช่แทนได้ แต่จุดแต่ละจุดต้องต่อๆ กัน ไม่งั้นเวลาเรา fit curve เส้นกราฟ ที่ได้จะไม่ถูกต้องตามสมการ ขอลอกตัวอย่างจากเว็บ matlab ตาม[ลิ้งค์นี้](https://www.mathworks.com/help/symbolic/examples/analytical-plotting-with-symbolic-math-toolbox.html) ในหัวข้อ *Mix Symblic and Numeric techniques to develop mathematical models* ตามโค้ดดังต่อไปนี้

```MATLAB
syms f(x)
f(x) = x*exp(-x)*sin(5*x) -2;
xs = 0:1/3:3;
ys = double(subs(f,xs));
fplot(f,[0,3])
hold on
plot(xs,ys,'*k','DisplayName','Data Points')
fplot(@(x) spline(xs,ys,x),[0 3],'DisplayName','Spline interpolant')
hold off
grid on
legend show
```
ผลลัพธ์
![graph](/mfiles/EP5.png)
จากกราฟเราจะเห็นว่าถ้าจุดไม่ติดกัน เวลาเรา fit curve (เส้นแดง) จะได้เส้นที่คลาดกับ เส้นที่เราพล๊อตจากสมการ (เส้นสีน้ำเงิน) 

นอกจากนี้เนื่องจากมันเป็นแบบ analytic เราสามารถ `diff` หรือ `int` กับเทอม (symbolic term) นั้นได้เลย

สำหรับ function analytic plot แบบอื่นๆ ก็ใช้ในลักษณะเดียวกัน


