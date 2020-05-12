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

เกริ่นมาซะยาว มาลองสร้าง programatic GUI ที่เอาไว้ step-by-step กันดีกว่า

1. สร้าง figure พร้อมใส่ textbox กับ edittext

```MATLAB
f = figure;

 
``` 