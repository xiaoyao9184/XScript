@echo off
Setlocal enabledelayedexpansion


::http://stackoverflow.com/questions/22658604/passing-percent-sign-in-a-batch-parameter-call

echo %%
echo %%%
echo %%%%
echo %%%%%
echo %%%%%%

pause

set /p p1=输入变量内容（含有百分号）

echo 变量为：
echo %p1%
echo !p1!
echo "引号内变量为:!p1! %p1%"

pause

echo 将变量作为参数传递到另一个批处理中

call 100print "percent%%%%sign"

call 100print percent%%%%sign "percent%%%%sign" "percent%%%%sign"


echo 传递参数是将百分号换成4个百分号
call 100print "w%%%%w" w%%%%w "%p1%%%%%"

echo 变量里本身含有百分号会造成混乱
call 100print "%p1%" "w%%%%w" w%%%%w 

set p2=%p1:%%%=w%

echo %p2%


pause