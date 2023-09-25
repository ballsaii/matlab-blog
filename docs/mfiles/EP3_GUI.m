
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

    function sendTextFX1(hObject,eventdata,handles) %(hObject,eventdata,handles) must be preserved due to handle function by @
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