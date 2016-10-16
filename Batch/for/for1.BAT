@echo off
Setlocal enabledelayedexpansion
::CODER BY Administrator POWERD BY iBAT 1.6

pause

::显示当前目录下与t*.*相匹配的文件(只显示文件名，不显示路径) 
for %%i in (*.*) do echo %%i

pause

::
for /d %%i in (c:\*) do echo %%i 

pause

for /r c:\ %%i in (boot.ini) do echo %%i --枚举了c盘所有目录

pause