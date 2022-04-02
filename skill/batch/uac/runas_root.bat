@ECHO OFF
SETLOCAL EnableDelayedExpansion

IF "%~nx0"=="runas_root.bat" IF NOT EXIST "%~dp0\blank path" (
	ECHO For test blank spaces in path, run the script in '%~dp0blank path'
	mkdir "%~dp0blank path"
	copy %~f0 "%~dp0blank path\runas_root_no_blank.bat"
	copy %~f0 "%~dp0blank path\runas_root_with blank.bat"
)

WHOAMI /GROUPS | FIND "12288" >nul
IF ERRORLEVEL 1 (
	ECHO Auto requires elevated privileges...


	SET script_file=%~f0
	IF "!script_file!"=="!script_file: =!" IF "%1"=="" (
		ECHO No blank in script path and no params.
		ECHO Run script: !script_file!
		( mshta "vbscript:CreateObject("shell.Application").ShellExecute("%~f0","","","runas",1)(window.close)" ) & GOTO:EOF
	)
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

	
	IF "%1"=="" (
		ECHO No params. but script path or name has blank.
		ECHO Run script: !script_path!!script_name!
		
		( mshta "vbscript:CreateObject("shell.Application").ShellExecute("!script_path!!script_name!","","","runas",1)(window.close)" ) & GOTO:EOF
	)


	ECHO Run script: %~f0
	ECHO Pass params: %*

	@REM https://stackoverflow.com/questions/6811372/how-to-code-a-bat-file-to-always-run-as-admin-mode
	SET "params=%*"
	SET "script_vbs=%~f0.vbs"
	IF EXIST "!script_vbs!" DEL "!script_vbs!"
	ECHO Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && !script_path!!script_name! !params!", "", "runas", 1 >> "!script_vbs!"
	"!script_vbs!"
	GOTO:EOF

)

ECHO Now runas root.
ECHO script path: %~dp0
ECHO script name: %~0
ECHO script params: %*

PAUSE
