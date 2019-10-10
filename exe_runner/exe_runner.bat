@ECHO OFF

set logfile=".\a.txt"

setlocal enabledelayedexpansion
for %%f in (.\*.txt) do (
	set /p val=<%%f
	set "exe=%%f"
	echo "fullname: %%f"
	for /f "tokens=2 delims==; " %%A in (
		'wmic process call create '"notepad.exe"' ^| find "ProcessId"'
	) do set "PID=%%A"
	echo "%PID%"

	set maxbytesize=1000

	FOR /F "usebackq" %%A IN ('%logfile%') DO set size=%%~zA

	if %size% LSS %maxbytesize% (
	    echo.File is ^< %maxbytesize% bytes
	) ELSE (
	    echo.File is ^>= %maxbytesize% bytes
	)
)
