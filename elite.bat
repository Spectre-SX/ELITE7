@echo off
chcp 65001 >nul
title EL1T3 HACK TOOL

:: ======= PASSWORD PROTECT =======
:passwordCheck
cls
setlocal enabledelayedexpansion
set "correctPass=EL1T3666"
set /p "userPass=Enter password to access EL1T3 HACK TOOL: "
if "!userPass!"=="%correctPass%" (
    goto startScript
) else (
    echo Incorrect password! Try again.
    timeout /t 2 >nul
    goto passwordCheck
)
:endPasswordCheck
endlocal

:startScript
cls
call :banner
call :mainMenu
exit

:: =========================
:: BANNER FUNCTION
:: =========================
:banner
cls

:: Line 1: Background Black (0), Foreground Light Green (A)
color A
echo ███████╗██╗     ██╗████████╗██████╗ 

:: Line 2: Background Black (0), Foreground Light Aqua (B)
color B
echo ██╔════╝██║    ███║╚══██╔══╝╚════██╗

:: Line 3: Background Black (0), Foreground Light Red (C)
color C
echo █████╗  ██║    ╚██║   ██║    █████╔╝

:: Line 4: Background Black (0), Foreground Light Purple (D)
color D
echo ██╔══╝  ██║     ██║   ██║    ╚═══██╗

:: Line 5: Background Black (0), Foreground Light Yellow (E)
color E
echo ███████╗███████╗██║   ██║   ██████╔╝

:: Line 6: Reset colors to default (07 = Black BG, White FG)
color 7
echo ╚══════╝╚══════╝╚═╝   ╚═╝   ╚═════╝ 

echo.
goto :eof

:: =========================
:: MAIN MENU
:: =========================
:mainMenu
cls
call :banner
echo [MAIN MENU]
echo 1. Network Tools
echo 2. Random Stuff
echo 3. Info
echo 4. Fake Hacker Animation
echo 5. System Cleaner
echo 6. User-Agent Spoofer
echo 7. Matrix Rain Animation
echo 8. Exit
set /p choice=Choose an option [1-8]: 
if "%choice%"=="1" goto networkMenu
if "%choice%"=="2" goto randomMenu
if "%choice%"=="3" goto infoMenu
if "%choice%"=="4" goto fakeHackerAnim
if "%choice%"=="5" goto systemCleaner
if "%choice%"=="6" goto userAgentSpoofer
if "%choice%"=="7" goto matrixRain
if "%choice%"=="8" exit
echo Invalid choice!
timeout /t 1 >nul
goto mainMenu

:: =========================
:: NETWORK TOOLS SUBMENU
:: =========================
:networkMenu
cls
call :banner
echo [NETWORK TOOLS]
echo 1. Port Scanner (ports 20-25)
echo 2. Ping Host
echo 3. My Public IP
echo 4. Wi-Fi Password Viewer
echo 5. Traceroute
echo 6. GeoIP Lookup
echo 7. Network Speed Test (Ping + Download Speed)
echo 8. Process Killer
echo 9. Local IP and MAC Info
echo 10. Wi-Fi Scanner (Nearby Networks)
echo 11. Reverse DNS lookup
echo 12. Back to Main Menu
set /p choice=Choose an option [1-12]: 
if "%choice%"=="1" goto portScanner
if "%choice%"=="2" goto pingHost
if "%choice%"=="3" goto myIP
if "%choice%"=="4" goto wifiPasswords
if "%choice%"=="5" goto traceroute
if "%choice%"=="6" goto geoipLookup
if "%choice%"=="7" goto speedTest
if "%choice%"=="8" goto processKiller
if "%choice%"=="9" goto localIP
if "%choice%"=="10" goto wifiScanner
if "%choice%"=="11" goto reverseDNS
if "%choice%"=="12" goto mainMenu
echo Invalid choice!
timeout /t 1 >nul
goto networkMenu

:: =========================
:: RANDOM STUFF SUBMENU
:: =========================
:randomMenu
cls
call :banner
echo [RANDOM STUFF]
echo 1. Random Number (1-100)
echo 2. Dice Roll (1-6)
echo 3. Generate Random Password
echo 4. Back to Main Menu
set /p choice=Choose an option [1-4]: 
if "%choice%"=="1" goto randomNum
if "%choice%"=="2" goto diceRoll
if "%choice%"=="3" goto randomPassword
if "%choice%"=="4" goto mainMenu
echo Invalid choice!
timeout /t 1 >nul
goto randomMenu

:: =========================
:: INFO SUBMENU
:: =========================
:infoMenu
cls
call :banner
echo [INFO]
echo 1. System Info
echo 2. Date and Time
echo 3. Screenshot Tool
echo 4. Encrypt/Decrypt Text
echo 5. Battery Info
echo 6. Back to Main Menu
set /p choice=Choose an option [1-6]: 
if "%choice%"=="1" goto sysInfo
if "%choice%"=="2" goto dateTime
if "%choice%"=="3" goto screenshotTool
if "%choice%"=="4" goto encryptDecrypt
if "%choice%"=="5" goto batteryInfo
if "%choice%"=="6" goto mainMenu
echo Invalid choice!
timeout /t 1 >nul
goto infoMenu

:: =========================
:: NETWORK TOOLS FUNCTIONS
:: =========================

:portScanner
cls
call :banner
set /p target=Enter IP or hostname to scan ports 20-25: 
echo Scanning ports 20-25 on %target% ...
for /L %%p in (20,1,25) do (
    echo Checking port %%p ...
    powershell -Command "Try { if((Test-NetConnection -ComputerName '%target%' -Port %%p).TcpTestSucceeded) { Write-Host 'Port %%p: OPEN' -ForegroundColor Green } else { Write-Host 'Port %%p: Closed' -ForegroundColor Red } } Catch { Write-Host 'Port %%p: Error' -ForegroundColor Yellow }"
)
echo Scan complete!
pause
goto networkMenu

:pingHost
cls
call :banner
set /p target=Enter IP or hostname to ping: 
echo Pinging %target% (4 packets)...
ping -n 4 %target%
pause
goto networkMenu

:myIP
cls
call :banner
echo Your public IP address is:
powershell -Command "(Invoke-RestMethod 'https://api.ipify.org?format=text')"
echo.
pause
goto networkMenu

:wifiPasswords
cls
call :banner
echo Saved Wi-Fi profiles and passwords:
netsh wlan show profiles
echo.
set /p prof=Enter profile name to show password or leave blank to back: 
if "%prof%"=="" goto networkMenu
echo Password for %prof%:
netsh wlan show profile name="%prof%" key=clear | findstr Key
pause
goto wifiPasswords

:traceroute
cls
call :banner
echo TRACEROUTE
echo.

set /p target=Enter IP or domain to trace: 

echo.
echo Tracing route to %target% ...
echo.

rem We'll parse only the lines that start with a hop number (1, 2, 3...)
for /f "tokens=*" %%i in ('tracert -d %target% ^| findstr /r "^[ ]*[0-9][0-9]*"' ) do (
    echo %%i
)

echo.
pause
goto networkMenu


:geoipLookup
cls
call :banner
set /p ip=Enter IP address for GeoIP lookup: 
echo Fetching GeoIP info for %ip% ...
powershell -Command ^
"try { $resp = Invoke-RestMethod ('http://ip-api.com/json/%ip%'); ^
Write-Host 'Country:' $resp.country; ^
Write-Host 'Region:' $resp.regionName; ^
Write-Host 'City:' $resp.city; ^
Write-Host 'ISP:' $resp.isp; ^
Write-Host 'Org:' $resp.org; ^
Write-Host 'AS:' $resp.as; } ^
catch { Write-Host 'Lookup failed' }"
pause
goto networkMenu

:speedTest
cls
call :banner
echo Running simple network speed test...
echo Ping google.com:
ping -n 4 google.com
echo.
echo Downloading test file (1MB)...
powershell -Command ^
"$wc = New-Object System.Net.WebClient; ^
$start = Get-Date; ^
$wc.DownloadFile('http://ipv4.download.thinkbroadband.com/1MB.zip', '1MB.zip'); ^
$end = Get-Date; ^
$duration = ($end - $start).TotalSeconds; ^
$speed = 1 / $duration; ^
Write-Host ('Download speed: {0:N2} MB/s' -f $speed); ^
Remove-Item '1MB.zip'"
pause
goto networkMenu

:processKiller
cls
call :banner
tasklist
echo.
set /p proc=Enter process name to kill (e.g. notepad.exe): 
taskkill /IM %proc% /F
echo Process %proc% terminated (if it existed).
pause
goto networkMenu

:localIP
cls
call :banner
echo Local IP and MAC info:
ipconfig /all | findstr /R /C:"IPv4" /C:"Physical"
echo.
echo 1. Back to Network Menu
echo 2. MAC Address Spoofer
echo 3. Reset MAC Address to Original
set /p choice=Choose option [1-3]:
if "%choice%"=="1" goto networkMenu
if "%choice%"=="2" goto macSpoof
if "%choice%"=="3" goto macReset
echo Invalid choice!
timeout /t 1 >nul
goto localIP

:macSpoof
cls
call :banner
echo MAC Address Spoofer
echo.

echo Make sure to run this tool as Administrator!

set /p interface="Enter your network adapter name (e.g., Wi-Fi): "
set /p newMac="Enter new MAC address (12 hex digits, no separators): "

if not "%newMac%"=="" (
  powershell -Command ^
  "Try { ^
    $adapter = Get-NetAdapter -Name '%interface%'; ^
    if ($adapter) { ^
      # Save original MAC if not saved
      if (-not (Test-Path -Path .\original_mac.txt)) { ^
        $adapter.MacAddress | Out-File -FilePath .\original_mac.txt ^
      } ^
      # Set new MAC and restart adapter
      Set-NetAdapterAdvancedProperty -Name '%interface%' -RegistryKeyword 'NetworkAddress' -RegistryValue '%newMac%' -NoRestart; ^
      Restart-NetAdapter -Name '%interface%'; ^
      Write-Host 'MAC address spoofed successfully to %newMac%' -ForegroundColor Green ^
    } else { ^
      Write-Host 'Adapter not found!' -ForegroundColor Red ^
    } ^
  } Catch { Write-Host 'Error: ' + $_.Exception.Message -ForegroundColor Red }"
) else (
  echo No MAC address entered, returning...
)

pause
goto localIP

:macReset
cls
call :banner
echo Reset MAC Address to Original
echo.

echo Make sure to run this tool as Administrator!

set /p interface="Enter your network adapter name (e.g., Wi-Fi): "

if not exist original_mac.txt (
  echo No saved original MAC address found!
  pause
  goto localIP
)

set /p origMac=<original_mac.txt

powershell -Command ^
"Try { ^
  $adapter = Get-NetAdapter -Name '%interface%'; ^
  if ($adapter) { ^
    # Remove spoofed MAC (delete NetworkAddress key) ^
    Remove-NetAdapterAdvancedProperty -Name '%interface%' -RegistryKeyword 'NetworkAddress' -ErrorAction SilentlyContinue; ^
    Restart-NetAdapter -Name '%interface%'; ^
    Write-Host 'MAC address reset to original: %origMac%' -ForegroundColor Green ^
  } else { ^
    Write-Host 'Adapter not found!' -ForegroundColor Red ^
  } ^
} Catch { Write-Host 'Error: ' + $_.Exception.Message -ForegroundColor Red }"

pause
goto localIP



:wifiScanner
cls
call :banner
echo Scanning for available Wi-Fi networks...
netsh wlan show networks
pause
goto networkMenu

:reverseDNS
cls
call :banner
echo Reverse DNS Lookup
echo.

set /p ip=Enter IP address to resolve: 

echo.
echo Resolving %ip% ...
echo.

for /f "tokens=2 delims=:" %%x in ('nslookup %ip% ^| findstr /i "name ="') do (
    set domain=%%x
)

if not defined domain (
    echo No reverse DNS found for %ip%
) else (
    rem Trim leading space if needed
    set domain=%domain:~1%
    echo Domain for %ip%: %domain%
)

echo.
pause
goto networkMenu


:: =========================
:: RANDOM STUFF FUNCTIONS
:: =========================

:randomNum
cls
call :banner
set /a randNum=%random% %% 100 + 1
echo Random number between 1 and 100: %randNum%
pause
goto randomMenu

:diceRoll
cls
call :banner
set /a dice=%random% %% 6 + 1
echo Dice rolled: %dice%
pause
goto randomMenu

:randomPassword
cls
call :banner

set /p length=Enter password length (max 64): 
if %length% LEQ 0 (
    echo Invalid length!
    timeout /t 1 >nul
    goto randomMenu
)
if %length% GTR 64 (
    echo Length too long!
    timeout /t 1 >nul
    goto randomMenu
)

:: Only include $, ! and safe alphanumeric characters
set "chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$!"

setlocal enabledelayedexpansion
set "pass="

:: Get length of the chars string
set "charCount=0"
for %%A in (!chars!) do set /a charCount=68

for /L %%i in (1,1,%length%) do (
    set /a idx=!random! %% 64
    for %%c in ("!chars:~!idx!,1!") do set "pass=!pass!%%~c"
)

echo Generated password: !pass!
endlocal
pause
goto randomMenu

:: =========================
:: INFO FUNCTIONS
:: =========================

:sysInfo
cls
call :banner
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
pause
goto infoMenu

:dateTime
cls
call :banner
echo Current date and time:
echo.
date /t
time /t
pause
goto infoMenu

:screenshotTool
cls
call :banner
echo Screenshot will be saved as screenshot.png in %cd%
powershell -command ^
"Add-Type -AssemblyName System.Windows.Forms; ^
Add-Type -AssemblyName System.Drawing; ^
$bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds; ^
$bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height; ^
$graphics = [System.Drawing.Graphics]::FromImage($bitmap); ^
$graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size); ^
$bitmap.Save('screenshot.png');"
echo Screenshot saved!
pause
goto infoMenu

:encryptText
cls
call :banner
set /p "text=Enter text to encrypt: "
set /p "shift=Enter shift amount (e.g. 3): "

:: Use a temp file to store the input text safely
echo %text% > temp_input.txt

powershell -Command ^
$text = Get-Content 'temp_input.txt'; $shift = %shift%; $result = ''; ^
foreach ($c in $text.ToCharArray()) { ^
  if ([char]::IsLetter($c)) { ^
    $a = if ([char]::IsUpper($c)) { [int][char]'A' } else { [int][char]'a' }; ^
    $newChar = [char](($([int][char]$c) + $shift - $a + 26) %% 26 + $a); ^
    $result += $newChar ^
  } else { $result += $c } ^
}; ^
Write-Output "`nEncrypted: $result"
pause
del temp_input.txt
goto encryptDecrypt

:decryptText
cls
call :banner
set /p "text=Enter text to decrypt: "
set /p "shift=Enter shift amount used in encryption (e.g. 3): "

echo %text% > temp_input.txt

powershell -Command ^
$text = Get-Content 'temp_input.txt'; $shift = %shift%; $result = ''; ^
foreach ($c in $text.ToCharArray()) { ^
  if ([char]::IsLetter($c)) { ^
    $a = if ([char]::IsUpper($c)) { [int][char]'A' } else { [int][char]'a' }; ^
    $newChar = [char](($([int][char]$c) - $shift - $a + 26) %% 26 + $a); ^
    $result += $newChar ^
  } else { $result += $c } ^
}; ^
Write-Output "`nDecrypted: $result"
pause
del temp_input.txt
goto encryptDecrypt

:batteryInfo
cls
call :banner
echo Power Configuration Info:
powershell -Command "powercfg /query"
pause
goto infoMenu





:: =========================
:: SYSTEM CLEANER FUNCTION
:: =========================
:systemCleaner
cls
call :banner
echo Cleaning system temp files and flushing DNS cache...
echo Deleting temp files...
del /s /q %temp%\* >nul 2>&1
echo Flushing DNS cache...
ipconfig /flushdns
echo Done! System cleaned.
pause
goto mainMenu

:: =========================
:: USER AGENT SPOOFER FUNCTION
:: =========================
:userAgentSpoofer
cls
call :banner
set /p url=Enter URL to spoof user agent: 
powershell -Command ^
"$ua='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36'; ^
$response = Invoke-WebRequest -Uri '%url%' -Headers @{ 'User-Agent' = $ua }; ^
Write-Host 'Response Status Code:' $response.StatusCode; ^
Write-Host 'Response Headers:'; ^
$response.Headers"
pause
goto mainMenu

:: =========================
:: MATRIX RAIN ANIMATION
:: =========================
:matrixRain
cls
call :banner
echo Press Ctrl+C to stop the Matrix rain effect.
powershell -Command ^
"$chars='01'; while($true) { for($i=0; $i -lt 80; $i++) { Write-Host $chars[(Get-Random -Minimum 0 -Maximum 2)] -NoNewline }; Write-Host ''; Start-Sleep -Milliseconds 100 }"
pause
goto mainMenu

:: =========================
:: FAKE HACKER ANIMATION (KEEP YOUR ORIGINAL)
:: =========================
:fakeHackerAnim
cls
call :banner
echo Loading elite hacks...
timeout /t 2 >nul
echo Accessing mainframe...
timeout /t 2 >nul
echo Injecting virus...
timeout /t 2 >nul
echo Bypassing firewall...
timeout /t 2 >nul
echo Downloading secret files...
timeout /t 2 >nul
echo Mission complete! Hacker style.
pause
goto mainMenu
