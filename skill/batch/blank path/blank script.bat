@ECHO OFF
SETLOCAL EnableDelayedExpansion

ECHO Run script: %~f0

SET script_path=%~dp0
IF NOT "!script_path!"=="!script_path: =!" (
    FOR %%F IN ("!script_path!") DO SET script_path=%%~sF
    ECHO Change script path to 'Short 8.3 name': !script_path!
)
SET script_name=%~nx0
IF NOT "!script_name!"=="!script_name: =!" (
    FOR %%F IN ("%~s0") DO SET script_name=%%~nxF
    ECHO Change script name to 'Short 8.3 name': !script_name!
)
