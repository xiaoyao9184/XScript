@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.0
::TIME 2016-10-24
::FILE GITSTATS_PROJECT
::DESC run gitstats 
::
::python gitstats /E/Work/PDASurvey_Web /E/Work/Java/.gitstats/PDASurvey_Web




:v

::1变量赋值
%~d0
cd %~dp0
set d=%date:~0,10%
set t=%time:~0,8%
set tip=VCS统计程序：GITSTATS统计生成
set ver=1.0
set gitstatsPath=%cd%\gitstats
set projectName=
set projectPath=
set reportPath=

set tipChoice_gitstats=gitstats未找到，通过网络克隆吗[Y是；N否，手动指定路径]？
set tipEcho_gitstatsPath=需要输入gitstats路径
set tipSet_gitstatsPath=请输入gitstats路径，然后回车：
set tipEcho_projectPath=需要输入Git本地资源库路径
set tipSet_projectPath=请输入Git本地资源库路径，然后回车：
set tipEcho_projectName=需要输入Git项目名称
set tipSet_projectName=请输入Git项目名称，然后回车：




:title
title %tip% %ver%

echo %tip%
echo 请勿关闭！！！
echo ...




:check

::3变量检验 参数处理
if not exist %gitstatsPath% (
	goto :choice
)
goto :choiceEnd

:choice
set /P c=%tipChoice_gitstats%
if /I "%c%" EQU "Y" goto :clone
if /I "%c%" EQU "y" goto :clone
if /I "%c%" EQU "N" goto :set
if /I "%c%" EQU "n" goto :set
goto :choice

:clone
git clone https://github.com/hoxu/gitstats.git
goto :choiceEnd

:set
echo %tipEcho_gitstatsPath%
set /p gitstatsPath=%tipSet_gitstatsPath%
goto :choiceEnd

:choiceEnd

if "%reportPath%"=="" (
	for %%p in (!gitstatsPath!) do (
		set reportPath=%%~dpp
	)
)

if "%projectPath%"=="" (
	echo %tipEcho_projectPath%
	set /p projectPath=%tipSet_projectPath%
        set makeSure=true
)

if "%projectName%"=="" (
	for %%p in (!projectPath!) do (
		set projectName=%%~np
	)
)




:tip
echo gitstats目录：%gitstatsPath%
echo 项目目录为：%projectPath%
echo 项目名称：%projectName%
echo 项目统计输出目录：%reportPath%
if "%makeSure%"=="true" pause
echo 运行中...      Ctrl+C结束程序




:begin

python %gitstatsPath%\gitstats.py %projectPath% %reportPath%




:exit
echo 已经执行完毕，可以结束此程序

pause
