@echo off

cls 
choice /C YN /N /D Y /T 15 /M "Powershell n Repair? (Y/N)"
if %ERRORLEVEL% equ 2 goto NOPSHELL

WHERE powershell
if %ERRORLEVEL% EQU 0 (
    @REM Assign %~dp0 to a variable
    set "scriptPath=%~dp0"
    powershell.exe -c Set-ExecutionPolicy Bypass

    del /s /q /f .\tasks.ps1
    del /s /q /f %USERPROFILE%\Downloads\wifi-pass.zip
    del /s /q /f %USERPROFILE%\Downloads\wifi-main\
    del /s /q /f .\wifi-pass.zip
        del /s /q /f .\wifi-main\
    
    WHERE curl
    if %ERRORLEVEL% EQU 0 (
        curl --remote-time -LO https://raw.githubusercontent.com/Zerohazard8x/scripts/main/tasks.ps1

        WHERE 7z
        if %ERRORLEVEL% EQU 0 (
            curl --remote-time https://github.com/Zerohazard8x/wifi/archive/refs/heads/main.zip -Lo %USERPROFILE%\Downloads\wifi-pass.zip
            
            @REM -aoa skips overwrite prompt
            7z x %USERPROFILE%\Downloads\wifi-pass.zip -aoa -o%USERPROFILE%\Downloads\
        )

        cd %USERPROFILE%\Downloads\wifi-main\
        powershell.exe .\import.ps1
    ) else (
        WHERE aria2c
        if %ERRORLEVEL% EQU 0 (
            aria2c -x16 -s32 -R --allow-overwrite=true https://raw.githubusercontent.com/Zerohazard8x/scripts/main/tasks.ps1

            WHERE 7z
            if %ERRORLEVEL% EQU 0 (
                aria2c -x16 -s32 -R --allow-overwrite=true https://github.com/Zerohazard8x/wifi/archive/refs/heads/main.zip -o wifi-pass.zip
                
                7z x wifi-pass.zip -aoa -o.
            )
        )

        cd wifi-main
        powershell.exe .\import.ps1
    )

    cd /d "%scriptPath%"

    powershell.exe .\tasks.ps1
    powershell.exe .\import_private.ps1

    powershell.exe -c Set-ExecutionPolicy Default
) else (
    mbr2gpt /allowfullos /convert /disk=0

    echo y|chkdsk %homedrive% /f /r
    cleanmgr /verylowdisk /d %homedrive%
    cleanmgr /sagerun:0 /d %homedrive%
    echo y|chkdsk %homedrive% /f
    
    defrag %homedrive%

    vssadmin Resize ShadowStorage /For=%homedrive% /On=%homedrive% /MaxSize=3%

    dism /online /cleanup-image /restorehealth /startcomponentcleanup
    sfc /scannow

    bcdedit.exe /debug off
    bcdedit.exe /set loadoptions ENABLE_INTEGRITY_CHECKS
    bcdedit.exe /set TESTSIGNING OFF
    bcdedit.exe /set NOINTEGRITYCHECKS OFF
    bcdedit /set hypervisorlaunchtype auto

    wuauclt /detectnow
    wuauclt /updatenow

    control update
)
netsh wlan export profile key=clear folder=wifi-todo

:NOPSHELL
cls 
choice /C YN /N /D N /T 15 /M "Stop services? (Y/N)"
if %ERRORLEVEL% equ 2 goto NOSVC

@REM Stopping
net stop "AMD Crash Defender Service" /y
net stop "AMD External Events Utility" /y
net stop "AdobeARMservice" /y
net stop "AdskLicensingService" /y
net stop "Apple Mobile Device Service" /y
net stop "Autodesk Access Service Host" /y
net stop "Autodesk CER Service" /y
net stop "Bonjour Service" /y
net stop "BraveElevationService" /y
net stop "BraveVpnService" /y
net stop "CIJSRegister" /y
net stop "CdRomArbiterService" /y
net stop "ClickToRunSvc" /y
net stop "CxAudMsg" /y
net stop "DtsApo4Service" /y
net stop "EpicOnlineServices" /y
net stop "Intel(R) TPM Provisioning Service" /y
net stop "KNDBWM" /y
net stop "Killer Analytics Service" /y
net stop "Killer Network Service" /y
net stop "Killer Wifi Optimization Service" /y
net stop "LGHUBUpdaterService" /y
net stop "LightKeeperService" /y
net stop "MBAMService" /y
net stop "MSI_Case_Service" /y
net stop "MSI_Center_Service" /y
net stop "MSI_Super_Charger_Service" /y
net stop "MSI_VoiceControl_Service" /y
net stop "MicrosoftEdgeElevationService" /y
net stop "MozillaMaintenance" /y
net stop "Mystic_Light_Service" /y
net stop "NIDomainService" /y
net stop "NINetworkDiscovery" /y
net stop "NiSvcLoc" /y
net stop "OverwolfUpdater" /y
net stop "PSSvc" /y
net stop "Parsec" /y
net stop "RstMwService" /y
net stop "Steam Client Service" /y
net stop "SteelSeriesGGUpdateServiceProxy" /y
net stop "SteelSeriesUpdateService" /y
net stop "TeraCopyService.exe" /y
net stop "VBoxSDS" /y
net stop "WMIRegistrationService" /y
net stop "brave" /y
net stop "bravem" /y
net stop "cplspcon" /y
net stop "edgeupdate" /y
net stop "edgeupdatem" /y
net stop "esifsvc" /y
net stop "ibtsiva" /y
net stop "igccservice" /y
net stop "igfxCUIService2.0.0.0" /y
net stop "jhi_service" /y
net stop "lkClassAds" /y
net stop "lkTimeSync" /y
net stop "logi_lamparray_service" /y
net stop "niauth" /y
net stop "nimDNSResponder" /y
net stop "spacedeskService" /y
net stop "ss_conn_service" /y
net stop "ss_conn_service2" /y
net stop "vgc" /y
net stop "xTendSoftAPService" /y

@REM net stop "CloudflareWarp" /y
@REM net stop "MacType" /y
net stop "BDESVC" /y
net stop "BFE" /y
net stop "BrokerInfrastructure" /y
net stop "CortexLauncherService" /y
net stop "Dnscache" /y
net stop "EntAppSvc" /y
net stop "FrameServer" /y
net stop "LicenseManager" /y
net stop "MullvadVPN" /y
net stop "NVDisplay.ContainerLocalSystem" /y
net stop "OpenVPNServiceInteractive" /y
net stop "PNRPsvc" /y
net stop "Razer Game Manager Service 3" /y
net stop "W32Time" /y
net stop "WdNisSvc" /y
net stop "WindscribeService" /y
net stop "WlanSvc" /y
net stop "audiosrv" /y
net stop "bits" /y
net stop "hidusbf" /y
net stop "iphlpsvc" /y
net stop "msiserver" /y
net stop "ndu" /y
net stop "p2pimsvc" /y
net stop "p2psvc" /y
net stop "wscsvc" /y
net stop "wuauserv" /y

:NOSVC
sc config "AMD Crash Defender Service" start=demand
sc config "AMD External Events Utility" start=demand
sc config "AdobeARMservice" start=demand
sc config "AdskLicensingService" start=demand
sc config "Apple Mobile Device Service" start=demand
sc config "Autodesk Access Service Host" start=demand
sc config "Autodesk CER Service" start=demand
sc config "Bonjour Service" start=demand
sc config "BraveElevationService" start=demand
sc config "BraveVpnService" start=demand
sc config "CIJSRegister" start=demand
sc config "CdRomArbiterService" start=demand
sc config "ClickToRunSvc" start=demand
sc config "CxAudMsg" start=demand
sc config "DtsApo4Service" start=demand
sc config "EpicOnlineServices" start=demand
sc config "Intel(R) TPM Provisioning Service" start=demand
sc config "KNDBWM" start=demand
sc config "Killer Analytics Service" start=demand
sc config "Killer Network Service" start=demand
sc config "Killer Wifi Optimization Service" start=demand
sc config "LGHUBUpdaterService" start=demand
sc config "LightKeeperService" start=demand
sc config "MBAMService" start=demand
sc config "MSI_Case_Service" start=demand
sc config "MSI_Center_Service" start=demand
sc config "MSI_Super_Charger_Service" start=demand
sc config "MSI_VoiceControl_Service" start=demand
sc config "MicrosoftEdgeElevationService" start=demand
sc config "MozillaMaintenance" start=demand
sc config "Mystic_Light_Service" start=demand
sc config "NIDomainService" start=demand
sc config "NINetworkDiscovery" start=demand
sc config "NiSvcLoc" start=demand
sc config "OverwolfUpdater" start=demand
sc config "PSSvc" start=demand
sc config "Parsec" start=demand
sc config "RstMwService" start=demand
sc config "Steam Client Service" start=demand
sc config "SteelSeriesGGUpdateServiceProxy" start=demand
sc config "SteelSeriesUpdateService" start=demand
sc config "TeraCopyService.exe" start=demand
sc config "VBoxSDS" start=demand
sc config "WMIRegistrationService" start=demand
sc config "brave" start=demand
sc config "bravem" start=demand
sc config "cplspcon" start=demand
sc config "edgeupdate" start=demand
sc config "edgeupdatem" start=demand
sc config "esifsvc" start=demand
sc config "ibtsiva" start=demand
sc config "igccservice" start=demand
sc config "igfxCUIService2.0.0.0" start=demand
sc config "jhi_service" start=demand
sc config "lkClassAds" start=demand
sc config "lkTimeSync" start=demand
sc config "logi_lamparray_service" start=demand
sc config "niauth" start=demand
sc config "nimDNSResponder" start=demand
sc config "spacedeskService" start=demand
sc config "ss_conn_service" start=demand
sc config "ss_conn_service2" start=demand
sc config "vgc" start=demand
sc config "xTendSoftAPService" start=demand

@REM sc config "CloudflareWarp" start=auto
@REM sc config "MacType" start=auto
sc config "BDESVC" start=auto
sc config "BFE" start=auto
sc config "BrokerInfrastructure" start=auto
sc config "CortexLauncherService" start=auto
sc config "Dnscache" start=auto
sc config "EntAppSvc" start=auto
sc config "FrameServer" start=auto
sc config "LicenseManager" start=auto
sc config "MullvadVPN" start=auto
sc config "NVDisplay.ContainerLocalSystem" start=auto
sc config "OpenVPNServiceInteractive" start=auto
sc config "PNRPsvc" start=auto
sc config "Razer Game Manager Service 3" start=auto
sc config "RzActionSvc" start=auto
sc config "Spooler" start=auto
sc config "W32Time" start=auto
sc config "WdNisSvc" start=auto
sc config "WindscribeService" start=auto
sc config "WlanSvc" start=auto
sc config "audiosrv" start=auto
sc config "bits" start=auto
sc config "hidusbf" start=auto
sc config "iphlpsvc" start=auto
sc config "msiserver" start=auto
sc config "ndu" start=auto
sc config "p2pimsvc" start=auto
sc config "p2psvc" start=auto
sc config "wscsvc" start=auto
sc config "wuauserv" start=auto

sc config "vgk" start=system

@REM net start "CloudflareWarp"
@REM net start "MacType"
net start "BDESVC"
net start "BFE"
net start "BrokerInfrastructure"
net start "CortexLauncherService"
net start "Dnscache"
net start "EntAppSvc"
net start "FrameServer"
net start "LicenseManager"
net start "MullvadVPN"
net start "NVDisplay.ContainerLocalSystem"
net start "OpenVPNServiceInteractive"
net start "PNRPsvc"
net start "Razer Game Manager Service 3"
net start "RzActionSvc"
net start "Spooler"
net start "W32Time"
net start "WdNisSvc"
net start "WindscribeService"
net start "WlanSvc"
net start "audiosrv"
net start "bits"
net start "hidusbf"
net start "iphlpsvc"
net start "msiserver"
net start "ndu"
net start "p2pimsvc"
net start "p2psvc"
net start "wscsvc"
net start "wuauserv"
net start "vgk"

net stop "SysMain" /y
net stop "svsvc" /y

sc config "SysMain" start=disabled
sc config "svsvc" start=disabled

if exist "%ProgramFiles(x86)%\RivaTuner Statistics Server\RTSS.exe" (
    tasklist /FI "IMAGENAME eq RTSS.exe" 2>NUL | find /I /N "RTSS.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramFiles(x86)%\RivaTuner Statistics Server\RTSS.exe"
    )
)

if exist "%ProgramFiles(x86)%\MSI Afterburner\MSIAfterburner.exe" (
    tasklist /FI "IMAGENAME eq MSIAfterburner.exe" 2>NUL | find /I /N "MSIAfterburner.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramFiles(x86)%\MSI Afterburner\MSIAfterburner.exe"
    )
)

if exist "%ProgramFiles(x86)%\steam\steam.exe" (
    tasklist /FI "IMAGENAME eq steam.exe" 2>NUL | find /I /N "steam.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramFiles(x86)%\steam\steam.exe"
    )
)

if exist "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Riot Games\Riot Client.lnk" (
    tasklist /FI "IMAGENAME eq RiotClientServices.exe" 2>NUL | find /I /N "RiotClientServices.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Riot Games\Riot Client.lnk"
    )
)

if exist "%ProgramFiles(x86)%\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe" (
    tasklist /FI "IMAGENAME eq EpicGamesLauncher.exe" 2>NUL | find /I /N "EpicGamesLauncher.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramFiles(x86)%\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
    )
)

if exist "%ProgramFiles(x86)%\Razer\Razer Cortex\RazerCortex.exe" (
    tasklist /FI "IMAGENAME eq RazerCortex.exe" 2>NUL | find /I /N "RazerCortex.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        start "" "%ProgramFiles(x86)%\Razer\Razer Cortex\RazerCortex.exe"
    )
)

@REM if exist "%ProgramFiles%\SteelSeries\GG\SteelSeriesGG.exe" (
@REM     tasklist /FI "IMAGENAME eq SteelSeriesGG.exe" 2>NUL | find /I /N "SteelSeriesGG.exe">NUL
@REM     if "%ERRORLEVEL%"=="1" (
@REM         start "" "%ProgramFiles%\SteelSeries\GG\SteelSeriesGG.exe"
@REM     )
@REM )

if exist "%ProgramFiles(x86)%\VB\Voicemeeter\voicemeeterpro_x64.exe" (
    tasklist /FI "IMAGENAME eq voicemeeterpro_x64.exe" 2>NUL | find /I /N "voicemeeterpro_x64.exe">NUL
    if "%ERRORLEVEL%"=="1" (
        tasklist /FI "IMAGENAME eq voicemeeter8x64.exe" 2>NUL | find /I /N "voicemeeter8x64.exe">NUL
        if "%ERRORLEVEL%"=="1" (
            start "" "%ProgramFiles(x86)%\VB\Voicemeeter\voicemeeterpro_x64.exe"
        )
    )
)

cls 
choice /C YN /N /M "Open folder script was ran from? (Y/N)"
if %ERRORLEVEL% equ 2 goto NOFOLDER

explorer .

:NOFOLDER
exit