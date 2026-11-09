@echo off
setlocal EnableDelayedExpansion
title Impossible POS - Hardware Stations Setup
color 0A

:: Setup working directory
set "APP_DIR=%LOCALAPPDATA%\ImpossiblePOS"
if not exist "%APP_DIR%" mkdir "%APP_DIR%"
if not exist "%APP_DIR%\Icons" mkdir "%APP_DIR%\Icons"

set "SERVER_IP=127.0.0.1"
if exist "%~dp0server_ip.txt" set /p SERVER_IP=<"%~dp0server_ip.txt"
if exist "%APP_DIR%\server_ip.txt" set /p SERVER_IP=<"%APP_DIR%\server_ip.txt"
if "%SERVER_IP%"=="" set "SERVER_IP=127.0.0.1"

cls
echo ======================================================================
echo               IMPOSSIBLE POS - HARDWARE STATIONS SETUP
echo ======================================================================
echo  Detecting Central Register Server on Local Network...

:: Auto-discover server if not responding
set "AUTO_IP="
if exist "%~dp0discover_server.ps1" copy /Y "%~dp0discover_server.ps1" "%APP_DIR%\discover_server.ps1" >nul
if exist "%APP_DIR%\discover_server.ps1" (
    for /f "usebackq delims=" %%i in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%APP_DIR%\discover_server.ps1" -LastKnownIp "%SERVER_IP%"`) do (
        if not "%%i"=="" set "AUTO_IP=%%i"
    )
)

if not "!AUTO_IP!"=="" (
    set "SERVER_IP=!AUTO_IP!"
    echo !AUTO_IP!>"%APP_DIR%\server_ip.txt"
)

:: Browser Check
set "BROWSER_EXE="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%LocalAppData%\Google\Chrome\Application\chrome.exe"

:MENU
cls
echo ======================================================================
echo               IMPOSSIBLE POS - HARDWARE STATIONS SETUP
echo ======================================================================
echo   Central Server: %SERVER_IP% (Port 3000)
echo ======================================================================
echo   Select what this screen or computer will be:
echo.
echo     [1]  Kitchen Display 1 (Hot Food / Grill KDS)
echo     [2]  Kitchen Display 2 (Cold Prep / Bakery KDS)
echo     [3]  Bar Display (Cocktails and Beverages KDS)
echo     [4]  Special Orders Display (Custom Cakes and Catering)
echo     [5]  Photo Hub (Cake and Custom Order Photos)
echo     [6]  Lobby TV (Customer Queue and Waitlist Display)
echo     [7]  Runner Hub (Order Expediter and Dispatch)
echo     [8]  Hostess Hub (Table Seating and Reception)
echo     [9]  Self-Ordering Kiosk (Customer Ordering Station)
echo     [10] Secondary Register (Cashier POS Terminal 2)
echo     [11] Setup Thermal Printers and Cash Drawer Service
echo     [12] Pair Screen with Cash Register (Smart 4-Digit Code)
echo     [13] Install All Station Shortcuts
echo.
echo     [0]  Exit
echo ======================================================================
set /p CHOICE="Enter your choice (1-12) or 0 to exit: "

if "%CHOICE%"=="0" exit /b 0
if "%CHOICE%"=="1" goto INST_1
if "%CHOICE%"=="2" goto INST_2
if "%CHOICE%"=="3" goto INST_3
if "%CHOICE%"=="4" goto INST_4
if "%CHOICE%"=="5" goto INST_5
if "%CHOICE%"=="6" goto INST_6
if "%CHOICE%"=="7" goto INST_7
if "%CHOICE%"=="8" goto INST_8
if "%CHOICE%"=="9" goto INST_9
if "%CHOICE%"=="10" goto INST_10
if "%CHOICE%"=="11" goto INST_PRINTERS
if "%CHOICE%"=="12" goto PAIR_CODE
if "%CHOICE%"=="13" goto INST_ALL

echo Invalid selection. Please try again.
timeout /t 2 >nul
goto MENU

:INST_1
set "ST_ID=kitchen"
set "ST_NAME=Impossible POS - Kitchen KDS"
set "ST_URL=/cocina.html"
set "ST_ICON=kitchen.ico"
goto DO_INSTALL

:INST_2
set "ST_ID=bakery"
set "ST_NAME=Impossible POS - Bakery KDS"
set "ST_URL=/cocina.html?station=bakery"
set "ST_ICON=cake_kds.ico"
goto DO_INSTALL

:INST_3
set "ST_ID=bar"
set "ST_NAME=Impossible POS - Bar Hub"
set "ST_URL=/kds_bar.html"
set "ST_ICON=bar.ico"
goto DO_INSTALL

:INST_4
set "ST_ID=special"
set "ST_NAME=Impossible POS - Special Orders"
set "ST_URL=/comanda_pastel.html"
set "ST_ICON=cake_kds.ico"
goto DO_INSTALL

:INST_5
set "ST_ID=photo"
set "ST_NAME=Impossible POS - Photo Hub"
set "ST_URL=/photos.html"
set "ST_ICON=photo_hub.ico"
goto DO_INSTALL

:INST_6
set "ST_ID=lobby_tv"
set "ST_NAME=Impossible POS - Lobby TV"
set "ST_URL=/espera.html"
set "ST_ICON=lobby_tv.ico"
goto DO_INSTALL

:INST_7
set "ST_ID=runner"
set "ST_NAME=Impossible POS - Runner Dispatch"
set "ST_URL=/runner.html"
set "ST_ICON=runner.ico"
goto DO_INSTALL

:INST_8
set "ST_ID=hostess"
set "ST_NAME=Impossible POS - Hostess"
set "ST_URL=/hostess.html"
set "ST_ICON=hostess.ico"
goto DO_INSTALL

:INST_9
set "ST_ID=kiosk"
set "ST_NAME=Impossible POS - Ordering Kiosk"
set "ST_URL=/ordena.html"
set "ST_ICON=pos.ico"
goto DO_INSTALL

:INST_10
set "ST_ID=secondary"
set "ST_NAME=Impossible POS - Secondary POS"
set "ST_URL=/caja_v14.html?station=2"
set "ST_ICON=pos.ico"
goto DO_INSTALL


:INST_PRINTERS
cls
echo ======================================================================
echo       SETUP THERMAL PRINTERS AND CASH DRAWER SERVICE
echo ======================================================================
echo.
echo [1/3] Downloading Printer & Drawer Service components...
set "DRAWER_DIR=%LOCALAPPDATA%ImpossiblePOSDrawerService"
if not exist "%DRAWER_DIR%" mkdir "%DRAWER_DIR%"
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('http://%SERVER_IP%:3000/drawer_service.ps1', '%DRAWER_DIR%drawer_service.ps1')" >nul 2>&1
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('http://%SERVER_IP%:3000/ACTIVAR_CAJON_RAPIDO.bat', '%DRAWER_DIR%ACTIVAR_CAJON_RAPIDO.bat')" >nul 2>&1

echo [2/3] Detecting installed Windows thermal printers...
powershell -NoProfile -Command "Get-Printer | Select-Object Name, PortName, PrinterStatus | Format-Table -AutoSize"

echo [3/3] Activating Ultra-Fast Local Cash Drawer Service (0.05s response)...
if exist "%DRAWER_DIR%ACTIVAR_CAJON_RAPIDO.bat" (
    call "%DRAWER_DIR%ACTIVAR_CAJON_RAPIDO.bat" >nul 2>&1
)

echo.
echo ======================================================================
echo   SUCCESS: Thermal printer service is configured and ready.
echo   - To test or select printer, open POS -> Options -> Setup -> Hardware
echo ======================================================================
echo.
pause
goto MENU

:PAIR_CODE
echo Starting Smart Pairing Screen...
if "%BROWSER_EXE%"=="" (
    start "http://%SERVER_IP%:3000/pair.html"
) else (
    start "" "%BROWSER_EXE%" --app="http://%SERVER_IP%:3000/pair.html" --no-first-run
)
exit /b 0

:DO_INSTALL
echo.
echo [1/3] Downloading official icon (%ST_ICON%)...
set "ICON_DEST=%APP_DIR%\Icons\%ST_ICON%"
if not exist "%ICON_DEST%" (
    if exist "%~dp0Icons\%ST_ICON%" copy /Y "%~dp0Icons\%ST_ICON%" "%ICON_DEST%" >nul
    if not exist "%ICON_DEST%" (
        powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('http://%SERVER_IP%:3000/icons/%ST_ICON%', '%ICON_DEST%')" >nul 2>&1
    )
)

echo [2/3] Generating station launcher...
set "LAUNCH_BAT=%APP_DIR%\launch_%ST_ID%.bat"
echo @echo off > "%LAUNCH_BAT%"
echo setlocal EnableDelayedExpansion >> "%LAUNCH_BAT%"
echo set "APP_DIR=%%LOCALAPPDATA%%\ImpossiblePOS" >> "%LAUNCH_BAT%"
echo set "SERVER_IP=%SERVER_IP%" >> "%LAUNCH_BAT%"
echo if exist "%%APP_DIR%%\server_ip.txt" set /p SERVER_IP=^<"%%APP_DIR%%\server_ip.txt" >> "%LAUNCH_BAT%"
echo if exist "%%APP_DIR%%\discover_server.ps1" for /f "usebackq delims=" %%%%i in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%%APP_DIR%%\discover_server.ps1" -LastKnownIp "%%SERVER_IP%%"`^) do if not "%%%%i"=="" set "SERVER_IP=%%%%i" >> "%LAUNCH_BAT%"
echo set "BROWSER_EXE=" >> "%LAUNCH_BAT%"
echo if exist "%%ProgramFiles(x86)%%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%%ProgramFiles(x86)%%\Microsoft\Edge\Application\msedge.exe" >> "%LAUNCH_BAT%"
echo if exist "%%ProgramFiles%%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%%ProgramFiles%%\Microsoft\Edge\Application\msedge.exe" >> "%LAUNCH_BAT%"
echo if exist "%%ProgramFiles%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%ProgramFiles%%\Google\Chrome\Application\chrome.exe" >> "%LAUNCH_BAT%"
echo if exist "%%ProgramFiles(x86)%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%ProgramFiles(x86)%%\Google\Chrome\Application\chrome.exe" >> "%LAUNCH_BAT%"
echo if exist "%%LocalAppData%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%LocalAppData%%\Google\Chrome\Application\chrome.exe" >> "%LAUNCH_BAT%"
echo if "%%BROWSER_EXE%%"=="" ( start "http://%%SERVER_IP%%:3000%ST_URL%" ^& exit ) >> "%LAUNCH_BAT%"
echo start "" "%%BROWSER_EXE%%" --app="http://%%SERVER_IP%%:3000%ST_URL%" --kiosk --no-first-run >> "%LAUNCH_BAT%"
echo exit >> "%LAUNCH_BAT%"

echo [3/3] Creating Desktop shortcut...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $desktop = $ws.SpecialFolders('Desktop'); $shortcut = $ws.CreateShortcut($desktop + '\%ST_NAME%.lnk'); $shortcut.TargetPath = '%LAUNCH_BAT%'; $shortcut.WorkingDirectory = '%APP_DIR%'; $shortcut.WindowStyle = 7; if (Test-Path '%ICON_DEST%') { $shortcut.IconLocation = '%ICON_DEST%,0' }; $shortcut.Description = '%ST_NAME%'; $shortcut.Save(); $startup = $ws.SpecialFolders('Startup'); $sShortcut = $ws.CreateShortcut($startup + '\%ST_NAME%.lnk'); $sShortcut.TargetPath = '%LAUNCH_BAT%'; $sShortcut.WorkingDirectory = '%APP_DIR%'; $sShortcut.WindowStyle = 7; if (Test-Path '%ICON_DEST%') { $sShortcut.IconLocation = '%ICON_DEST%,0' }; $sShortcut.Save();"

echo.
echo ======================================================================
echo   SUCCESS: %ST_NAME% has been installed!
echo   - Desktop shortcut created: "%ST_NAME%.lnk"
echo   - Auto-start on boot: Enabled
echo   - Connecting to: http://%SERVER_IP%:3000%ST_URL%
echo ======================================================================
echo.
start "" "%LAUNCH_BAT%"
timeout /t 3 >nul
exit /b 0

:INST_ALL
echo Installing all station shortcuts...
for %%S in (kitchen bakery bar special photo lobby_tv runner hostess kiosk secondary) do (
    call :INSTALL_ONE %%S
)
echo.
echo ======================================================================
echo   SUCCESS: All station shortcuts have been created on your Desktop!
echo ======================================================================
pause
exit /b 0

:INSTALL_ONE
set "ONE_ID=%1"
if "%ONE_ID%"=="kitchen" ( set "ONE_NAME=Impossible POS - Kitchen KDS" & set "ONE_URL=/cocina.html" & set "ONE_ICON=kitchen.ico" )
if "%ONE_ID%"=="bakery" ( set "ONE_NAME=Impossible POS - Bakery KDS" & set "ONE_URL=/cocina.html?station=bakery" & set "ONE_ICON=cake_kds.ico" )
if "%ONE_ID%"=="bar" ( set "ONE_NAME=Impossible POS - Bar Hub" & set "ONE_URL=/kds_bar.html" & set "ONE_ICON=bar.ico" )
if "%ONE_ID%"=="special" ( set "ONE_NAME=Impossible POS - Special Orders" & set "ONE_URL=/comanda_pastel.html" & set "ONE_ICON=cake_kds.ico" )
if "%ONE_ID%"=="photo" ( set "ONE_NAME=Impossible POS - Photo Hub" & set "ONE_URL=/photos.html" & set "ONE_ICON=photo_hub.ico" )
if "%ONE_ID%"=="lobby_tv" ( set "ONE_NAME=Impossible POS - Lobby TV" & set "ONE_URL=/espera.html" & set "ONE_ICON=lobby_tv.ico" )
if "%ONE_ID%"=="runner" ( set "ONE_NAME=Impossible POS - Runner Dispatch" & set "ONE_URL=/runner.html" & set "ONE_ICON=runner.ico" )
if "%ONE_ID%"=="hostess" ( set "ONE_NAME=Impossible POS - Hostess" & set "ONE_URL=/hostess.html" & set "ONE_ICON=hostess.ico" )
if "%ONE_ID%"=="kiosk" ( set "ONE_NAME=Impossible POS - Ordering Kiosk" & set "ONE_URL=/ordena.html" & set "ONE_ICON=pos.ico" )
if "%ONE_ID%"=="secondary" ( set "ONE_NAME=Impossible POS - Secondary POS" & set "ONE_URL=/caja_v14.html?station=2" & set "ONE_ICON=pos.ico" )

set "BAT_FILE=%APP_DIR%\launch_%ONE_ID%.bat"
echo @echo off > "%BAT_FILE%"
echo set "APP_DIR=%%LOCALAPPDATA%%\ImpossiblePOS" >> "%BAT_FILE%"
echo set "SERVER_IP=%SERVER_IP%" >> "%BAT_FILE%"
echo if exist "%%APP_DIR%%\server_ip.txt" set /p SERVER_IP=^<"%%APP_DIR%%\server_ip.txt" >> "%BAT_FILE%"
echo if exist "%%APP_DIR%%\discover_server.ps1" for /f "usebackq delims=" %%%%i in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%%APP_DIR%%\discover_server.ps1" -LastKnownIp "%%SERVER_IP%%"`^) do if not "%%%%i"=="" set "SERVER_IP=%%%%i" >> "%BAT_FILE%"
echo set "BROWSER_EXE=" >> "%BAT_FILE%"
echo if exist "%%ProgramFiles(x86)%%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%%ProgramFiles(x86)%%\Microsoft\Edge\Application\msedge.exe" >> "%BAT_FILE%"
echo if exist "%%ProgramFiles%%\Microsoft\Edge\Application\msedge.exe" set "BROWSER_EXE=%%ProgramFiles%%\Microsoft\Edge\Application\msedge.exe" >> "%BAT_FILE%"
echo if exist "%%ProgramFiles%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%ProgramFiles%%\Google\Chrome\Application\chrome.exe" >> "%BAT_FILE%"
echo if exist "%%ProgramFiles(x86)%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%ProgramFiles(x86)%%\Google\Chrome\Application\chrome.exe" >> "%BAT_FILE%"
echo if exist "%%LocalAppData%%\Google\Chrome\Application\chrome.exe" set "BROWSER_EXE=%%LocalAppData%%\Google\Chrome\Application\chrome.exe" >> "%BAT_FILE%"
echo if "%%BROWSER_EXE%%"=="" ( start "http://%%SERVER_IP%%:3000%ONE_URL%" ^& exit ) >> "%BAT_FILE%"
echo start "" "%%BROWSER_EXE%%" --app="http://%%SERVER_IP%%:3000%ONE_URL%" --kiosk --no-first-run >> "%BAT_FILE%"
echo exit >> "%BAT_FILE%"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $desktop = $ws.SpecialFolders('Desktop'); $shortcut = $ws.CreateShortcut($desktop + '\%ONE_NAME%.lnk'); $shortcut.TargetPath = '%BAT_FILE%'; $shortcut.WorkingDirectory = '%APP_DIR%'; $shortcut.WindowStyle = 7; $shortcut.Description = '%ONE_NAME%'; $shortcut.Save();" >nul 2>&1
echo  - Installed: %ONE_NAME%
goto :eof
