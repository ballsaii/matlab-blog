---
author: "BBeaw"
date: 2020-05-10
title: สร้าง GUI แบบไม่ใช่ GUIDE
categories: [matlab]
tags: [function,GUI]
draft: false
---

## สร้าง GUI แบบไม่ใช่ GUIDE

สำหรับมือใหม่ อาจจะการเรียนรู้การสร้าง GUI matlab ผ่าน GUIDE ซึ่งเป็นวิธีที่ง่ายและสะดวกที่สุดในการออกแบบ layout GUI ด้วย component ต่างๆ มีอีกวิธีหนึ่งที่สามารถสร้าง GUI ได้เหมือนกันคือการใช้ function เพื่อให้สร้าง (วาด) component ต่างๆ ให้เป็น GUI ซึ่งในเอกสาร Help จะเรียกว่า Programmatic GUI

อันที่จริงการสร้าง GUI แบบ programatic ไม่ได้แตกต่างการที่เรียกใช้คำสั่ง plot เท่าใดนัก ถ้าพูดลงในรายละเอียดก็คือเมื่อเราเรียกใช้คำสั่ง plot มันก็จะสร้าง object นึง ที่เรียกว่า figure ซึ่งเปรียบเสมือนหน้าต่าง จากนั้นก็สร้าง axes object เอาไว้เป็นแกนพล๊อต จากนั้นก็สร้าง line object (เส้นกราฟ) ลงบน axes ที่เป็น parent

ถ้าเราเพิ่มเติม uicontrol object ที่มีสามารถตอบสนอง เช่น pushbutton ที่มี action คือ click หรือแม้กระทั่งส่วนที่เป็น uimenu เป็น uicontrol แบบหนึ่งแต่อาจจะมีการเรียก event ที่ต่างจาก uicontrol มาตรฐานนิดหน่อย ค่อยพูดถึงในภายหลัง ถ้าเพิ่ม uicontrol textedit เราก็จะได้กล่องรับ/ส่งข้อความ ทีนี้ที่เหลือก็จะเป็นหน้าที่ของ UI designer ที่ต้องออกแบบว่าควรจะออกแบบหน้าตา Interface อย่างไร

เกริ่นมาซะยาว มาลองสร้าง programatic GUI ที่เอาไว้ส่งข้อความไปมาระหว่างหน้าต่าง 2 อัน step-by-step กันดีกว่า

1. สร้างหน้าต่างพร้อมใส่กล่องรับข้อความกับปุ่มส่ง ขึ้นมา 2 ชุด
> gui2gui.m

```MATLAB
% first window
f1 = figure('Position',[100,100,400,400],'Units','pixel','Tag','GUI1');
% add a send button
send1 = uicontrol(f1,'style','pushbutton',String,'send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text1 = uicontrol(f1,'style','edit',String,'','Units','pixel','Position',[100,300,200,30]);

% second window
f2 = figure('Position',[600,100,400,400],'Units','pixel','Tag','GUI2');
% add a send button
send1 = uicontrol(f1,'style','pushbutton',String,'send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text1 = uicontrol(f1,'style','edit',String,'','Units','pixel','Position',[100,300,200,30]);
``` 
2. สร้าง function ขึ้นมาอันนึงเพื่อส่งรับข้อความจากกล่องรับข้อความในหน้าต่างที่ 1 แล้วส่งไปยัง