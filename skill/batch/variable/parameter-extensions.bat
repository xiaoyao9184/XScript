@ECHO OFF
SETLOCAL EnableDelayedExpansion

ECHO 1. Get the full path of the batch itself
ECHO %0
ECHO:
ECHO 2. Get the full path of the batch itself, and remove the quotation marks at the beginning and end
ECHO %~0
ECHO:
ECHO 3. Get the file name and suffix name of the batch process itself
ECHO %~nx0
ECHO:
ECHO 4. Get the file name of the batch process itself
ECHO %~n0
ECHO:
ECHO 5. Get the suffix name of the batch itself
ECHO %~x0
ECHO:
ECHO 6. Get the full path of the batch itself, excluding the file name
ECHO %~dp0
ECHO %cd%
ECHO:
ECHO 7. Get the drive letter of the batch itself
ECHO %~d0
ECHO:
ECHO 8. Get the size of the batch itself
ECHO %~z0
ECHO:
ECHO 9. Get the modification time of the batch itself
ECHO %~t0