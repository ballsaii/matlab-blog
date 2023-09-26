---
author: "BBeaw"
date: 2020-06-26
title: สร้างโปสเตอร์ liverpool ได้แชมป์
categories: [matlab]
tags: [image]
draft: false
---

เย้ ในที่สุดฤดูกาลนี้ ลิเวอร์พูล ก็ได้แชมป์พรีเมียร์ลีก หลังจากต้องรอคอยมาถึง 30 ปี วันนี้เรามาลองทำ poster ฉลองแชมป์กันเลย 

## Load 'Liverpool' image
เริ่มจากหารูปภาพพื้นหลังมาเก็บไว้ใน folder จากนั้นโหลด image เข้าโดย MATLAB ซึ่งจะได้ข้อมูลเป็น data

```MATLAB
a = imread('EP10_liverpool.jpg');
```

ปรับแต่งให้อัตราส่วนเป็น 1:1 หาความกว้าง x ความยาวของ pixel และสุดท้ายปิดการมองเห็น axes 

```MATLAB
h= image(a);
ax = gca;
f = gcf;
ax.DataAspectRatio = [1 1 1];
[width,height,~] = size(h.CData);
ax.Visible = 'off';
```

## Add text

สร้าง text object เพื่อทำการแสดง text บนรูปภาพ

```MATLAB
quote = sprintf('We are the champions 2019/2020');
t = text(width/2,height-100,quote);
t.FontSize = 15;
t.Color = 'white';
t.BackgroundColor = [0.5 0.5 0.5];
t.HorizontalAlignment = 'center';
```

## Export image
ปรับแต่งจนพอใจ แล้วก็ทำการ export ภาพใช้ format 'png'

```MATLAB
saveas(f,'EP10_liverpool_addtext.png')
```
![EP10_liverpool_addtext.png](https://cdn.pic.in.th/file/picinth/EP10_liverpool_addtext.png)



