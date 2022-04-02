@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-07-23
::FILE DotNetCore.1.0.0-VS2015Tools.Preview2
::DESC run DotNetCore.1.0.0-VS2015Tools.Preview2.exe with not check 
::SEE http://stackoverflow.com/questions/38134048/problems-installing-dot-net-core-1-0-0-vs-2015-tools-preview-2


:v

set name=DotNetCore.1.0.0-VS2015Tools.Preview2
set downSrc=http://download.microsoft.com/download/A/3/8/A38489F3-9777-41DD-83F8-2CBDFAB2520C/DotNetCore.1.0.0-VS2015Tools.Preview2.exe
set exeFile=%~dp0%name%.exe

rem exeFile = %exeFile%
rem exeFile2 = %name%.exe


:if

if exist "%exeFile%" (
    echo file exists: %exeFile%
    goto begin
) else (
    echo file doesn't exist: %exeFile%", will download
    pause 
    goto download
)


:download

bitsadmin /transfer downLoad-%name% /download /priority normal "%downSrc%" "%exeFile%"


:begin

start "" "%exeFile%" "SKIP_VSU_CHECK=1"


:end

exit /b