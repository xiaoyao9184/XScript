@echo off
Setlocal enabledelayedexpansion
::CODER BY Administrator POWERD BY iBAT 1.6

echo 当前日期
date /T

echo 当前日期前10个字符
echo %date:~0,10%

echo 当前日期替换/为-
set d=%date:~0,10%
echo %d%
echo %d:/=-%

echo -------------------------------------------
echo 当前时间
time /T

echo 当前时间前8个字符
echo %time:~0,8%

echo 当前时间替换:为-
set t=%time:~0,8%
echo %t%
echo %t::=-%

echo -------------------------------------------
echo 以下为测试
::取年
echo %date:~4,4%
::取月
echo %date:~9,2%
::取日
echo %date:~12,2%
::小时
echo %time:~0,2%
::分钟
echo %time:~3,2%
::秒
echo %time:~6,2%


pause