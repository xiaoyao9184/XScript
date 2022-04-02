@echo off
::CODER BY xiaoyao9184
::http://blog.csdn.net/bingjie1217/article/details/12947327

if {%1}=={} goto noparms
if {%2}=={} goto noparms
@Rem check parameters if null show usage

:noparms
echo Usage: monitor.bat ServerIP PortNumber
goto end

:end
pause
