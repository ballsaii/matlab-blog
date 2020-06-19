mail = 'g.ballsaii@gmail.com'; % my gmail address
password = 'wcwaqribfmfevuhi';  % my gmail password
% password = '623033ball';
host = 'smtp.gmail.com';
% preferences
setpref('Internet','SMTP_Server', host);
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.port','465');
% Send the email to myself
sendmail('chaipattana_s@cmu.ac.th','Test MATLAB EP9 by bbeaw.com3',sprintf('Hello \nYou are successful to send email via MATLAB'))