@echo off
Setlocal enabledelayedexpansion


::http://stackoverflow.com/questions/22658604/passing-percent-sign-in-a-batch-parameter-call

echo %%
echo %%%
echo %%%%
echo %%%%%
echo %%%%%%

pause

set /p p1=����������ݣ����аٷֺţ�

echo ����Ϊ��
echo %p1%
echo !p1!
echo "�����ڱ���Ϊ:!p1! %p1%"

pause

echo ��������Ϊ�������ݵ���һ����������

call 100print "percent%%%%sign"

call 100print percent%%%%sign "percent%%%%sign" "percent%%%%sign"


echo ���ݲ����ǽ��ٷֺŻ���4���ٷֺ�
call 100print "w%%%%w" w%%%%w "%p1%%%%%"

echo �����ﱾ���аٷֺŻ���ɻ���
call 100print "%p1%" "w%%%%w" w%%%%w 

set p2=%p1:%%%=w%

echo %p2%


pause