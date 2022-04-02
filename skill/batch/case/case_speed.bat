@REM https://www.reddit.com/r/Batch/comments/etx3ff/a_question_of_uppercase_vs_lowercase/
@ECHO OFF
SETLOCAL EnableDelayedExpansion


ECHO %time% start>"%cd%\check.txt"

FOR /L %%I IN (1,1,10000) DO ECHO %%I
ECHO %time% after run 1, upper>>"%cd%\check.txt"

for /l %%i IN (1,2,20000) do ECHO %%i
ECHO %time% after run 2, lower>>"%cd%\check.txt"

FOR /L %%I IN (1,3,30000) DO ECHO %%I
ECHO %time% after run 3, upper>>"%cd%\check.txt"

for /l %%i IN (1,4,40000) do ECHO %%i
ECHO %time% after run 4, lower>>"%cd%\check.txt"

PAUSE