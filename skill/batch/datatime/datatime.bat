@ECHO OFF
SETLOCAL EnableDelayedExpansion

ECHO current date
DATE /T
ECHO:
ECHO 10 characters before the current date
ECHO %date:~0,10%
ECHO:
ECHO Replace the current date '/' to '-'
SET d=%date:~0,10%
ECHO %d%
ECHO %d:/=-%

ECHO -------------------------------------------
ECHO current time
TIME /T
ECHO:
ECHO 8 characters before the current time
ECHO %time:~0,8%
ECHO:
ECHO Replace the current time ':' to '-'
SET t=%time:~0,8%
ECHO %t%
ECHO %t::=-%

ECHO -------------------------------------------
ECHO extract date format must 'yyyy?MM?dd'
ECHO extract time format must 'hh?mm?ss'
ECHO:
ECHO just year
ECHO %date:~0,4%
ECHO:
ECHO just month
ECHO %date:~5,2%
ECHO:
ECHO just day
ECHO %date:~8,2%
ECHO:
ECHO just hour
ECHO %time:~0,2%
ECHO:
ECHO just minute
ECHO %time:~3,2%
ECHO:
ECHO just second
ECHO %time:~6,2%


pause