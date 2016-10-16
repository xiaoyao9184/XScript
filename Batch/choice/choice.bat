@echo off
::CODER BY xiaoyao9184
::http://blog.csdn.net/bingjie1217/article/details/12947327

::CHOICE [/C choices] [/N] [/CS] [/T timeout /D choice] [/M text]

Choice /c:dme defrag,mem,end
if errorlevel 3 goto defrag
if errorlevel 2 goto mem
if errotlevel 1 goto end
:defrag
c:\\dos\\defrag
goto end
:mem
mem
goto end
:end
echo good bye

pause
