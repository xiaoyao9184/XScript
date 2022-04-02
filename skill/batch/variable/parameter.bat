@ECHO OFF
SETLOCAL EnableDelayedExpansion

IF "%1"=="" (
    ECHO no param so mock 12 parameters
    CALL %~0 1 2 3 4 5 6 7 8 9 10 11 12
    GOTO:EOF
)

ECHO param 1 to 9
ECHO param 1: %~1
ECHO param 2: %~2
ECHO param 3: %~3
ECHO param 4: %~4
ECHO param 5: %~5
ECHO param 6: %~6
ECHO param 7: %~7
ECHO param 8: %~8
ECHO param 9: %~9
ECHO:
ECHO bigger 10 must use ^%^*
ECHO param all: %*
