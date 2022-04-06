@echo off
::https://bbs.et8.net/bbs/showthread.php?t=1035406

echo ==========DIR ��ʾ==========
dir /a %~dp0*.*
pause

echo ==========DIR ��ʾ�ļ�����==========
dir /b %~dp0*.*
pause

echo ==========FOR ������ DIR ������ʾ�ļ�����==========
for /f %%A in ('dir /b %~dp0*.*') do echo %%~nA
pause

echo ==========FOR ������ DIR ��ʾ�ļ����� �ļ�����==========
FOR /f %%i in ('dir /b %~dp0*.*') do (
    echo %%i
    echo %%~ai
)
pause

echo ==========FOR ������ DIR ��ʾ�ļ���Ϣ==========
for /f %%i in ('dir /b %~dp0*.*') do (
    echo %%i
        
    rem �� %I ���䵽һ����ȫ�ϸ��·����
    echo %%~fi
    
    rem ���䵽һ����������
    echo %%~di
    
    rem ���䵽һ��·��
    echo %%~pi
    
    rem ���䵽һ���ļ���
    echo %%~ni
    
    rem ���䵽һ���ļ���չ��
    echo %%~xi
    
    rem �����·��ֻ���ж���
    echo %%~si
    
    rem ���䵽�ļ����ļ�����
    echo %%~ai
     
    rem ���䵽�ļ�������/ʱ��
    echo %%~ti 
    
    rem ���䵽�ļ��Ĵ�С
    echo %%~zi
    
    echo ---------------------------------------------------
)
pause