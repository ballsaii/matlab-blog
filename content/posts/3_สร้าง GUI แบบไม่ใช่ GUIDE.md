---
author: "BBeaw"
date: 2020-05-13
title: สร้าง GUI แบบไม่ใช่ GUIDE
categories: [matlab]
tags: [GUI,object_handle]
draft: false
---

## สร้าง GUI แบบไม่ใช่ GUIDE

สำหรับมือใหม่ อาจจะการเรียนรู้การสร้าง GUI matlab ผ่าน GUIDE ซึ่งเป็นวิธีที่ง่ายและสะดวกที่สุดในการออกแบบ layout GUI ด้วย component ต่างๆ มีอีกวิธีหนึ่งที่สามารถสร้าง GUI ได้เหมือนกันคือการใช้ function เพื่อให้สร้าง (วาด) component ต่างๆ ให้เป็น GUI ซึ่งในเอกสาร Help จะเรียกว่า Programmatic GUI

อันที่จริงการสร้าง GUI แบบ programatic ไม่ได้แตกต่างการที่เรียกใช้คำสั่ง plot เท่าใดนัก ถ้าพูดลงในรายละเอียดก็คือเมื่อเราเรียกใช้คำสั่ง plot มันก็จะสร้าง object นึง ที่เรียกว่า figure ซึ่งเปรียบเสมือนหน้าต่าง จากนั้นก็สร้าง axes object เอาไว้เป็นแกนพล๊อต จากนั้นก็สร้าง line object (เส้นกราฟ) ลงบน axes ที่เป็น parent

ถ้าเราเพิ่มเติม uicontrol object ที่มีสามารถตอบสนอง เช่น pushbutton ที่มี action คือ click หรือแม้กระทั่งส่วนที่เป็น uimenu เป็น uicontrol แบบหนึ่งแต่อาจจะมีการเรียก event ที่ต่างจาก uicontrol มาตรฐานนิดหน่อย ค่อยพูดถึงในภายหลัง ถ้าเพิ่ม uicontrol textedit เราก็จะได้กล่องรับ/ส่งข้อความ ทีนี้ที่เหลือก็จะเป็นหน้าที่ของ UI designer ที่ต้องออกแบบว่าควรจะออกแบบหน้าตา Interface อย่างไร

เกริ่นมาซะยาว มาลองสร้าง programatic GUI ที่เอาไว้ส่งข้อความไปมาระหว่างหน้าต่าง 2 อัน step-by-step กันดีกว่า

---

### 1. Create function
สร้างหน้าต่างพร้อมใส่กล่องรับข้อความกับปุ่มส่งขึ้นมา 2 ชุด โดยสร้าง function ชื่อ `EP3_GUI.m` 
```MATLAB
function EP3_GUI
% first window
f1 = figure('Position',[100,100,400,400],'Units','pixel','Tag','GUI1');
% add a send button
send1 = uicontrol(f1,'style','pushbutton','String','send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text1 = uicontrol(f1,'style','edit','String','','Units','pixel','Position',[100,300,200,30]);

% second window
f2 = figure('Position',[600,100,400,400],'Units','pixel','Tag','GUI2');
% add a send button
send2 = uicontrol(f2,'style','pushbutton','String','send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text2 = uicontrol(f2,'style','edit','String','','Units','pixel','Position',[100,300,200,30]);
```

### 2. Bind to Callback_function to handle function

จากนั้นก็แอด Callback function ไปที่ object ในกรณีนี้คือปุ่ม `send1` และปุ่ม `send2` กล่าวคือ Callback function จะบอกว่าถ้าเกิดเหตุการณ์กับ object นี้แล้วให้ไปเรียก handle function ตัวไหน

ปกติถ้าสร้าง object ควรจะเซ็ต Callback function มาให้เลยจะได้ไม่ลืม

```MATLAB
send1.Callback = @sendTextFX1;
send2.Callback = @sendTextFX2;
```

handle function ที่เซ็ตให้กับ Callback จะใช้สร้างโดย *@* ตามด้วยชื่อ function
สิ่งที่ไปพร้อมกับ handle function คือ `hObject` ที่ถูกกระทำ กับ `handles` ที่เก็บข้อมูล 


### 3. Code Callback_function

สร้าง function ขึ้นมาเพื่อส่งรับข้อความจากกล่องรับข้อความในหน้าต่างที่ 1 ไป หน้าต่าง 2 และในทางกลับกัน

```MATLAB
function sendTextFX1(hObject,eventdata,handles)
%(hObject,eventdata,handles) must be preserved due to handle function by @
    % get value
    str1 = get(text1,'String');
    % send value
    set(text2,'String',str1);
    % store str1 in object in hOject which text1
     guidata(hObject,str1);
    end

    function sendTextFX2(hObject,eventdata,handles)
    % get value
    str2 = get(text2,'String');
    % send value
    set(text1,'String',str2);
    % store str2 in object in hOject which is text2
    guidata(hObject,str2);
    % display data that stored in text1 in MATLAB command line
    disp(guidata(text1))
    end
end
```

### 4. Run script & test
สรุป code

```MATLAB

function EP3_GUI
%% funciton creates 2 windows for throwning a value

% first window
f1 = figure('Position',[100,100,400,400],'Units','pixel','Tag','GUI1','Toolbar','none','Menubar','none');
% add a send button
send1 = uicontrol(f1,'style','pushbutton','String','send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text1 = uicontrol(f1,'style','edit','String','','Units','pixel','Position',[100,300,200,30]);

% second window
f2 = figure('Position',[600,100,400,400],'Units','pixel','Tag','GUI2','Toolbar','none','Menubar','none');
% add a send button
send2 = uicontrol(f2,'style','pushbutton','String','send','Units','pixel','Position',[100,100,200,30]);
% add a text box
text2 = uicontrol(f2,'style','edit','String','','Units','pixel','Position',[100,300,200,30]);

% set Callback_function to handle function which created by adding @
send1.Callback = @sendTextFX1;
send2.Callback = @sendTextFX2;

    function sendTextFX1(hObject,eventdata,handles)
    %(hObject,eventdata,handles) must be preserved due to handle function by @
        % get value
        str1 = get(text1,'String');
        % send value
        set(text2,'String',str1);
        % store str1 in object in hOject which text1
        guidata(hObject,str1);
    end

    function sendTextFX2(hObject,eventdata,handles)
        % get value
        str2 = get(text2,'String');
        % send value
        set(text1,'String',str2);
        % store str2 in object in hOject which is text2
        guidata(hObject,str2);
        % display data that stored in text1 in MATLAB command line
        disp(guidata(text1))
    end
end
```
พิมพ์ EP3_GUI เพื่อเรียกใช้ function ใน MATLAB command line จะเห็นว่าเมื่อรันแล้วจะปรากฎหน้าต่างขึ้นมา 2 อัน พอพิมพ์กล่องข้อความหนึ่ง พอกด send ค่าในข้อความก็จะถูกส่งไปอีกกล่องข้อความนึง
สังเกตุว่าเมื่อรัน function จะไม่เจอ variable แม้แต่ตัวเดียวใน workspace เนื่องจากเรารัน function ไม่ใช่ script  

*ทดสอบด้วย MATLAB 2016b*


