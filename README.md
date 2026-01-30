# Bluetooth Service Enabler (Windows)
A small batch script that starts Windows Bluetooth services

Using Windows 11, sometimes my Bluetooth option completely dissappears. This is caused by Windows sometimes not starting the Bluetooth services on start-up.
You can manually start those services to get your Bluetooth back, but I wanted a 1-click option, so I made this batch script that starts those services.

If the services are already running, nothing is restarted or interrupted.

> [!IMPORTANT]
> Before running this script, you **must** update the BluetoothDeviceInstancePath to match your specific Bluetooth device. You **must** replace INSERT_PATH_HERE with your Bluetooth Device's Device Instance Path.

## How to find your Bluetooth Device Instance Path:
1. Windows Search -> Device Manager
2. Expand the Bluetooth section
3. Right-click your Bluetooth adapter (e.g., Intel(R) Wireless Bluetooth(R)) and select Properties.
4. Go to the Details tab.
5. In the Property dropdown, select Device Instance Path.
6. Right-click the value (e.g., USB\VID_8087&PID_0029\.....) and select Copy.
7. Right-click the .bat file -> Edit -> replace the INSERT_PATH_HERE with your Bluetooth Device Instance Path

## How to use
1. Download the *EnableBluetoothServices.bat* batch file
2. Right-click *EnableBluetoothServices.bat*
3. Select **Run as Administrator**
5. Done

## Requirements
- Windows 10 or Windows 11
- Administrator permissions
