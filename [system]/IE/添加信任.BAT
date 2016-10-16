@echo off
Setlocal enabledelayedexpansion
::CODER BY hanyekai http://blog.csdn.net/hanyekai/article/details/18558037
::CODER BY xiaoyao9184 1.0 2014-11-12


::code begin


::begin AddDoMain
::增加信任站点(域名方式以baidu.com为例、IP以 127.0.0.1为例)：

REM 增加域名到信任站点
REM ftp://*.google.com
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\google.com" /v "ftp" /d "2" /t REG_DWORD /f

REM http://www.baidu.com
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\baidu.com\www" /v "http" /d "2" /t REG_DWORD /f


REM 增加IP到信任站点

@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1111" /v ":Range" /d "127.0.0.1" /t REG_SZ /f
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range1111" /v "http" /d "2" /t REG_DWORD /f


::begin AddIP
::增加 本地 Internet (域名方式以sina.com为例、IP以127.0.0.1为例)：

REM 增加域名到本地 Internet    
REM http://www.sina.com
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\sina.com\www"  /v "http" /d "1" /t REG_DWORD /f

REM 增加IP到本地 Internet    

@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2222" /v ":Range" /d "127.0.0.1" /t REG_SZ /f
@ reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range2222" /v "http" /d "1" /t REG_DWORD /f


::code end

pause