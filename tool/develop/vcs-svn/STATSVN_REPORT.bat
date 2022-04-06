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
set tip=VCSͳ�Ƴ���STATSVNͳ������
set ver=1.1
set statsvnPath=%cd%
set projectName=
set projectPath=
set reportPath=

set tipEcho_statsvnPath=��Ҫ����statsvn·��
set tipSet_statsvnPath=������statsvn·����Ȼ��س���
set tipEcho_projectPath=��Ҫ����SVNĿ¼
set tipSet_projectPath=������SVNĿ¼��Ȼ��س���
set tipEcho_projectName=��Ҫ����SVN��Ŀ����
set tipSet_projectName=������SVN��Ŀ���ƣ�Ȼ��س���




:title
title %tip% %ver%

echo %tip%
echo ����رգ�����
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

echo statsvnĿ¼��%statsvnPath%
echo ��ĿĿ¼Ϊ��%projectPath%
echo ��Ŀ���ƣ�%projectName%
echo ��Ŀǩ����־��%svnLogFile%
echo ��Ŀͳ�����Ŀ¼��%reportPath%
if "%makeSure%"=="true" pause
echo ������...      Ctrl+C��������





:log
cd %projectPath%
echo ����SVN��־%svnLogFile%
svn log -v --xml > "%svnLogFile%"




:begin
cd %statsvnPath%
mkdir "%reportPath%"
echo ����STATSVN�ܽ�
java -jar %statsvnPath%/statsvn.jar "%svnLogFile%" "%projectPath%"  -charset utf-8 -disable-twitter-button -title %projectName% -output-dir "%reportPath%"




:exit
echo �Ѿ�ִ����ϣ����Խ����˳���

pause