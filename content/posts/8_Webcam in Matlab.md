---
author: "BBeaw"
date: 2020-06-12
title: Webcam in Matlab 
categories: [matlab]
tags: [webcam,visualization]
draft: false
isMath: = true
---

เชื่อว่าหลายคนคงเริ่มคุ้นชินกับการ Video Conference จากการที่เรา social distancing กันภายใต้สถานการณ์ covid-19 อุปกรณ์ที่สำคัญในการ VC ก็คือ webcam ซึ่งบางคนก็มีพร้อมกับโน้ตบุ๊ค หรือ อาจจะซื้อมาติดตั้งในภายหลัง ยังไงก็แล้วแต่ วันนี้เราจะมา *connect* webcam เข้ากับ MATLAB ดูเพื่อดึงข้อมูลภาพ เอาละมาเริ่มกันเลย   
## Connect webcam to PC
เริ่มแรกต่อ webcam เข้ากับเครื่องให้เรียบร้อยแล้วจึงเปิด MATLAB จากนั้นก็พิมพ์ที่ command line (prompt) ว่า
```MATLAB
>> webcamlist
ans =

  cell

    'HD Pro Webcam C920'
```
เพื่อแสดงรายการ webcam ที่ต่ออยู่กับเครื่อง ที่เครื่องนี้ของผู้เขียนใช้ของ logitech C920 มันก็มีแค่ 1 รายการ

# get webcam object
จากนั้นทำการ get ตัว webcam มาไว้ใน workspace ด้วย function 

```MATLAB
a = webcam;
```
พอดีต่อแค่ตัวเดียวมันเลยรู้ว่าหมายถึงตัวไหน เราก็จะได้ object ชื่อ a ที่อยู่คลาส `webcam`

# Webcam properties
ที่นี้เวลาเราจะเรียก method หรือ properties ของ a ง่าย สมมุติว่าเราจะดูว่า resolution ที่ใช้ปัจจุบันคืออะไร ก็พิมพ์ว่า

```MATLAB
>> a.Resolution

ans =

640x480
```
แสดงว่า ณ ปัจจุบัน webcam ตัวนี้ใช้ที่ 640 x 480 pixel 
ถ้าอยากจะเปลี่ยน resolution ก็ทำได้ แต่จะดูว่ากล้องมี resolution อะไรบ้างก็ใช้

```MATLAB
>> a.AvailableResolutions

ans =

  1×19 cell array

  Columns 1 through 6

    '640x480'    '160x90'    '160x120'    '176x144'    '320x180'    '320x240'

  Columns 7 through 12

    '352x288'    '432x240'    '640x360'    '800x448'    '800x600'    '864x480'

  Columns 13 through 18

    '960x720'    '1024x576'    '1280x720'    '1600x896'    '1920x1080'    '2304x1296'

  Column 19

    '2304x1536'

```
จากนั้นเปลี่ยน resolution สมมุติว่าเปลี่ยนเป็น 1024 x 576 ก็พิมพ์ว่า
```MATLAB
a.Resolution = '1024x576'
```
จริงๆ มี properties อีกเช่น  Brightness, WhiteBalance, Focus ... ตาม[เอกสารนี้](https://www.mathworks.com/help/supportpkg/usbwebcams/ug/set-properties-for-webcam-acquisition.html)

## Preview webcam
จะ preview ภาพ
```MATLAB
a.preview
```
มันก็จะแสดงหน้าต่างวิดีโอขึ้นมา เหมือนเรา preview ผ่านโปรแกรมของ webcam เพียงแต่อันนี้มันขึ้นบน MATLAB จากนั้น
ถ้าอยากจะ snap ภาพ ณ ขณะนั้นก็ใช้

```MATLAB
b = a.snapshot;
```
เราก็สามารถ snap ภาพโดยข้อมูลก็มี dimension ตาม resolution (height x width x 3) 3 ในตัวหลังน่าจะหมายถึง จำนวน layer ของ RGB 

## Show snapshot
พอเราได้ข้อมูลภาพแล้ว แน่นอนถ้าเปิดดูตรงๆ มันก็จะเป็นตัวเลข (0-255) ซึ่งเหมาะกับการทำ Imagine processing (อย่างนัก อิอิ) เราสามารถใช้ `image` เพื่อแสดงให้เป็นภาพออกได้

```MATLAB
image(b);
```

## Test

ทดสอบๆ 

![snapshot_me](/mfiles/EP8_preview.jpg)
