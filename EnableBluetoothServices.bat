@echo off
setlocal EnableDelayedExpansion
set "BluetoothDeviceInstancePath=INSERT_PATH_HERE"

:: Check admin permissions, otherwise you can't start any services
net session >nul 2>&1
if %errorLevel% == 0 (
    	echo Administrative permissions confirmed...
) else (
    	echo ----------------------------------------------------
   	echo ERROR: Please right-click and "Run as Administrator"
    	echo ----------------------------------------------------
    	pause
    	exit
)

echo Starting Bluetooth Services...

:: Start the static named Bluetooth services
net start bthserv /y
net start BTAGService /y

:: Start the dynamicly named BluetoothUserService
for /f "tokens=*" %%S in ('reg query HKLM\SYSTEM\CurrentControlSet\Services ^| findstr "BluetoothUserService_"') do (
    	set SERVICE=%%~nxS
	echo Found service: !SERVICE!
	net start "!SERVICE!" /y
)

echo Restarting Bluetooth Hardware...
:: Restarts the bluetooth device
pnputil /disable-device "%BluetoothDeviceInstancePath%"
timeout /t 3 /nobreak >nul
pnputil /enable-device "%BluetoothDeviceInstancePath%"

echo.
echo Done! Your Bluetooth services should be running.


exit

