clear; close all;
a = imread('EP10_liverpool.jpg');
% f = figure;
% image(a)
h= image(a);
ax = gca;
f = gcf;
ax.DataAspectRatio = [1 1 1];
[width,height,~] = size(h.CData);
ax.Visible = 'off';

quote = sprintf('We are the champions 2019/2020');
t = text(width/2,height-100,quote);
t.FontSize = 15;
t.Color = 'white';
t.BackgroundColor = [0.5 0.5 0.5];
t.HorizontalAlignment = 'center';

saveas(gcf,'EP10_liverpool_addtext.png')