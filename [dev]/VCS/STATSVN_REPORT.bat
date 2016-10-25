@echo off
Setlocal enabledelayedexpansion
::CODER BY xiaoyao9184 1.1
::TIME 2016-10-25
::FILE STATSVN_REPORT
::DESC run a statsvn make report for svn project




:v
%~d0
cd %~dp0
set statsvnPath=%cd%
set d=%date:~0,10%
set t=%time:~0,8%
set tip=VCS统计程序：STATSVN统计生成
set ver=1.1
set statsvnPath=%cd%
set projectName=
set projectPath=
set reportPath=

set tipEcho_statsvnPath=需要输入statsvn路径
set tipSet_statsvnPath=请输入statsvn路径，然后回车：
set tipEcho_projectPath=需要输入SVN目录
set tipSet_projectPath=请输入SVN目录，然后回车：
set tipEcho_projectName=需要输入SVN项目名称
set tipSet_projectName=请输入SVN项目名称，然后回车：




:title
title %tip% %ver%

echo %tip%
echo 请勿关闭！！！
echo ...




:check
if not exist %statsvnPath%\statsvn.jar (
	echo %tipEcho_statsvnPath%
	set /p statsvnPath=%tipSet_statsvnPath%
	echo .
)

if "%reportPath%"=="" (
	for %%a in (!statsvnPath!) do (
		set reportPath=%%a
	)
)

if "%projectPath%"=="" (
	echo %tipEcho_projectPath%
	set /p projectPath=%tipSet_projectPath%
        set makeSure=true
	echo .
)

if "%projectName%"=="" (
	for %%p in (!projectPath!) do (
		set projectName=%%~np
	)
)




:v2
set reportPath=%reportPath%\%projectName%_%d:/=-%_%t::=-%
set svnLogFile=%reportPath%.log




:tip

echo statsvn目录：%statsvnPath%
echo 项目目录为：%projectPath%
echo 项目名称：%projectName%
echo 项目签入日志：%svnLogFile%
echo 项目统计输出目录：%reportPath%
if "%makeSure%"=="true" pause
echo 运行中...      Ctrl+C结束程序





:log
cd %projectPath%
echo 生成SVN日志%svnLogFile%
svn log -v --xml > "%svnLogFile%"




:begin
cd %statsvnPath%
mkdir "%reportPath%"
echo 生成STATSVN总结
java -jar %statsvnPath%/statsvn.jar "%svnLogFile%" "%projectPath%"  -charset utf-8 -disable-twitter-button -title %projectName% -output-dir "%reportPath%"




:exit
echo 已经执行完毕，可以结束此程序

pause