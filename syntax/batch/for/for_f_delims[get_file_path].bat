@echo off
::http://zhidao.baidu.com/question/96026193.html
::


echo NO.1 C:\abc\file1.abc - C:\abc\
set var=C:\abc\file1.abc
for /f "delims=" %%a in ("%var%")do echo %%~dpa


echo NO.2 C:\abc\file1.abc - C:\abc\
set pathis=C:\abc\file1.abc
for /f "delims=" %%a in ("%pathis%") do (
    set path=%%~dpa
)
echo %path%


echo NO.3 C:\abc\file1.abc - C:\abc\
set str1=C:\abc\file1.abc
call :show %str1%
echo %str2%

pause
goto :eof

:show
set str2=%~dp1 
