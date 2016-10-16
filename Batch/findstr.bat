@echo off
::输出彩色字符
mode con lines=24 cols=69
set "a=        One World !"
set "b= one Dream !"
set "c= 让我们大家一起说"
set "d=︱               bbs.cn-dos.net is our home!"
set "e=          {Author∶jvive︱08-03-31︱Thanks to∶9527}"
set "x=              ︱"
set "p=★★★★★★★★★★★★★★★"
set "k="
pushd %tmp%
del/q "%a%?" "%b%?" "%c%?" "%d%?" "%e%?" "%x%?" "%p%?" 2>nul
call:enter 3
call:JV a "%a%" 0
call:JV b "%b%" 0
call:JV c "%c%" 0
call:enter 5
call:JV 0100 0 0
call:JV 040a "%d%" 0
call:JV 040a "%x%" 0
call:JV 0100 000 0
call:JV 040b "%d%" 0
call:JV 040b "%x%" 0
call:JV 0100 000 0
call:JV 0400 "%d%" 0
call:JV 0400 "%x%" 0
call:JV 0100 0 1
call:enter 3
call:JV e "%e%" 0
call:JV 0100 0 1
echo.
call:color
pause>nul&exit/b
rem ---------subprocess--------
:color|一二层第一个色调混合为主色调,最后一个为闪烁停留色调.
for %%a in (0 e)do (
   for %%b in (a 1 2 3 4 5 6 7 8 0 c b d f e)do (
      call set "k=%%k%%"
      call:bak %%a%%b "%p%" 0
))
goto :eof
:JV
:bak
if %3 neq 1 (set/p=%k%<nul>"%~2") else echo.>"%~2"
if %0 neq :bak (set k=) else set "k=%k%"
findstr /a:%1 .* "%~2?"
del "%~2?"
goto :eof
:enter
for /l %%a in (1 1 %1)do echo.
