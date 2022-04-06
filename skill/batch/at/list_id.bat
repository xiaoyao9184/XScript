@ECHO OFF
SETLOCAL EnableDelayedExpansion


ECHO https://en.wikipedia.org/wiki/At_(command)#:~:text=It%20is%20available%20since%20Windows,Control%20Panel%20or%20schtasks.exe%20.

AT

FOR /f "skip=2 tokens=1,4*" %%a IN ('AT') DO (
	::get command_line from b,c
	IF "%%c"=="" (
		SET command_line=%%b
	) ELSE SET command_line=%%b %%c

	ECHO ID=%%a CommandLine=!command_line!
	
)

PAUSE