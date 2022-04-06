@ECHO OFF
SETLOCAL EnableDelayedExpansion
::CODER BY xiaoyao9184 1.0
::TIME 2022-04-06

ECHO 'process where * get *'

WMIC process where (name like 'cmd.exe') get name,executablepath,commandline,processid,parentprocessid,threadcount,workingsetsize/value
WMIC process where (name like 'java%%.exe') get name,executablepath,commandline,processid,parentprocessid,threadcount,workingsetsize/value

PAUSE