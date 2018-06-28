@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2018-06-28
::EDIT-HOST
::EDIT HOST use notepad




:v

set tip=HOST工具：开启编辑
set ver=1.0


:title

title %tip% %ver%

echo HOST工具：开启编辑
echo 运行结束后自动关闭
echo ...


:check

set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
echo %TempFile_Name% 1>nul

( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
 if exist %TempFile_Name% (
 echo %echo_auth_good%
 del /f /q %TempFile_Name% 
 goto auth_done
) else (
 echo %echo_auth_bad%
 goto auth_get
)


:auth_get

%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof


:st

copy "%~0" "%windir%\system32\"
goto :auth_done


:auth_done

start notepad C:\Windows\System32\drivers\etc\hosts


:exit

exit \b