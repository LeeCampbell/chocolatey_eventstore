@echo off

set version=
for /f "delims=" %%x in (package.properties) do (set %%x)

if not defined version ( 
	set version='unset'
)

powershell.exe -NoProfile -ExecutionPolicy unrestricted -command ".\build.ps1 -task default -version %version% ;exit $LASTEXITCODE"

if %ERRORLEVEL% == 0 goto OK
	echo Error running build. 
exit /B %ERRORLEVEL%

:OK