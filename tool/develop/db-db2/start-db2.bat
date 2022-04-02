@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET work_path=%cd%
IF EXIST "C:\Program Files\IBM\SQLLIB\db2start.exe" CD /d ""C:\Program Files\IBM\SQLLIB\"

db2start

CD %work_path%

PAUSE