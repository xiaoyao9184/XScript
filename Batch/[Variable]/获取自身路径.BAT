@echo off
Setlocal enabledelayedexpansion
::CODER BY Administrator POWERD BY iBAT 1.6

title="test"

echo 1、获取批处理自身的完整路径
echo %0

echo 2、获取批处理自身的完整路径，并去掉首尾的引号
echo %~0

echo 3、获取批处理自身的文件名及后缀名
echo %~nx0

echo 4、获取批处理自身的文件名
echo %~n0

echo 5、获取批处理自身的后缀名
echo %~x0

echo 6、获取批处理自身的完整路径，不含文件名
echo %~dp0  
echo %cd%

echo 7、获取批处理自身的盘符
echo %~d0

echo 8、获取批处理自身的大小
echo %~z0

echo 9、获取批处理自身的修改时间
echo %~t0

REM %~1 等效于 %1
echo 10、获取批处理参数
echo 位置1=%~1
echo 位置2=%~2
echo 位置3=%~3
echo 位置4=%~4
echo 位置5=%~5
echo 位置6=%~6
echo 位置7=%~7
echo 位置8=%~8
echo 位置9=%~9

pause