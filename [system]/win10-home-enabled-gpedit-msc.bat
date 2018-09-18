@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0 beta
::TIME 2018-09-18
::WIN10_HOME_ENABLE_GPEDID_MSC
::enable gpedit msc for windows 10 home version


:v

set tip=WIN10 HOME：ENABLE_GPEDID_MSC
set ver=1.0

:title

title %tip% %ver%

echo Windows注册表工具：开启gpedit.msc
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

pushd "%~dp0"

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >package-list.txt

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>package-list.txt

for /f %%i in ('findstr /i . package-list.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"

del package-list.txt

pause


:exit

exit \b