@echo off
setlocal EnableDelayedExpansion

net session >nul 2>&1
if %errorLevel% == 0 (
    	echo Administrative permissions confirmed...
) else (
    	echo ****************************************************
   	echo ERROR: Please right-click and "Run as Administrator"
    	echo ****************************************************
    	pause
    	exit
)

echo Starting Bluetooth Services...
net start bthserv /y
net start BTAGService /y

for /f "tokens=*" %%S in ('reg query HKLM\SYSTEM\CurrentControlSet\Services ^| findstr "BluetoothUserService_"') do (
    	set SERVICE=%%~nxS
	echo Found service: !SERVICE!
	net start "!SERVICE!" /y
)

echo.
echo Done! Your Bluetooth services should be running.

exit