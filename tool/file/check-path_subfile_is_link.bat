@ECHO OFF
SETLOCAL EnableDelayedExpansion


:v

SET echo_path=path for check:

:check

IF "%1"=="" (
    SET /p work_path=%echo_path%
) ELSE (
    SET work_path=%1
)

ECHO list files for %work_path% 
FOR /f %%L IN ('DIR /b %work_path%\*.*') DO (
    ECHO %%L

    FOR %%F IN ("!work_path!\%%L") DO SET attributes=%%~aF
    IF "!attributes:l=!" NEQ "!attributes!" (
        ECHO \__ is link
    )
)


PAUSE