@echo off

@REM Ping-abuse timeout - 1 second
ping 127.0.0.1 -n 2 > nul

del /F *.py
del /F *.reg

@REM cmd.exe /c powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
@REM cmd.exe /c powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
@REM cmd.exe /c powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61

@REM For some reason this actually makes a difference
if exist "%ProgramFiles(x86)%\RivaTuner Statistics Server\RTSS.exe" (
    cmd.exe /c start /low "" "%ProgramFiles(x86)%\RivaTuner Statistics Server\RTSS.exe"
    wmic process where name="EncoderServer.exe" CALL setpriority 64
    wmic process where name="EncoderServer64.exe" CALL setpriority 64
    wmic process where name="RTSSHooksLoader.exe" CALL setpriority 64
    wmic process where name="RTSSHooksLoader64.exe" CALL setpriority 64
    wmic process where name="RTSS.exe" CALL setpriority 64
)

@REM registry
WHERE regedit
if %ERRORLEVEL% EQU 0 (
    WHERE aria2c
    if %ERRORLEVEL% EQU 0 (
        aria2c -x16 -s32 -R --allow-overwrite=true https://raw.githubusercontent.com/Zerohazard8x/scripts/main/tweaks.reg
        regedit /S tweaks.reg
    )
)

WHERE w32tm
if %ERRORLEVEL% EQU 0 (
    w32tm /config /update
    w32tm /resync
)

cmd.exe /c "echo off | clip"

cls & SET /P M=Wallpapers? (Y/N) 
IF /I %M%==N GOTO NOSVC

WHERE aria2c
if %ERRORLEVEL% EQU 0 (
@REM wallpaper
    mkdir default
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily" -o default/daily.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?cloudy" -o default/daily_winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?cozy" -o default/daily_cozy.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?drawing" -o default/daily_drawing.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?dry" -o default/daily_dry.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?fall" -o default/daily_fall.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?rainy" -o default/daily_winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?render" -o default/daily_render.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?spring" -o default/daily_spring.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?stormy" -o default/daily_winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?summer" -o default/daily_summer.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?sunny" -o default/daily_winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?wet" -o default/daily_wet.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?windy" -o default/daily_windy.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/daily?winter" -o default/daily_winter.jpg

    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly" -o default/weekly.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?cloudy" -o default/winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?cozy" -o default/cozy.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?drawing" -o default/drawing.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?dry" -o default/dry.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?fall" -o default/fall.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?rainy" -o default/winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?render" -o default/render.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?spring" -o default/spring.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?stormy" -o default/winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?summer" -o default/summer.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?sunny" -o default/winter.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?wet" -o default/wet.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?windy" -o default/windy.jpg
    aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/7680x4320/weekly?winter" -o default/winter.jpg

    WHERE robocopy
    if %ERRORLEVEL% EQU 0 (
        mkdir %USERPROFILE%\default_wall
        robocopy /mt default\ %USERPROFILE%\default_wall
    )

    @REM @REM wallpaper - phone
    @REM mkdir phone
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily" -o phone/daily.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?cloudy" -o phone/daily_winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?cozy" -o phone/daily_cozy.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?drawing" -o phone/daily_drawing.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?dry" -o phone/daily_dry.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?fall" -o phone/daily_fall.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?rainy" -o phone/daily_winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?render" -o phone/daily_render.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?spring" -o phone/daily_spring.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?stormy" -o phone/daily_winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?summer" -o phone/daily_summer.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?sunny" -o phone/daily_winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?wet" -o phone/daily_wet.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?windy" -o phone/daily_windy.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/daily?winter" -o phone/daily_winter.jpg

    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly" -o phone/weekly.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?cloudy" -o phone/winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?cozy" -o phone/cozy.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?drawing" -o phone/drawing.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?dry" -o phone/dry.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?fall" -o phone/fall.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?rainy" -o phone/winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?render" -o phone/render.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?spring" -o phone/spring.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?stormy" -o phone/winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?summer" -o phone/summer.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?sunny" -o phone/winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?wet" -o phone/wet.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?windy" -o phone/winter.jpg
    @REM aria2c -R -x16 -s32 --allow-overwrite=true "https://source.unsplash.com/featured/1644x3840/weekly?winter" -o phone/windy.jpg
)

cls & SET /P M=Services? (Y/N) 
IF /I %M%==N GOTO NOSVC

@REM Stopping
net stop "AMD Crash Defender Service" /y
net stop "AMD External Events Utility" /y
net stop "AdobeARMservice" /y
net stop "Apple Mobile Device Service" /y
net stop "Bonjour Service" /y
net stop "BraveElevationService" /y
net stop "BraveVpnService" /y
net stop "CIJSRegister" /y
net stop "CdRomArbiterService" /y
net stop "CortexLauncherService" /y
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
net stop "OverwolfUpdater" /y
net stop "OverwolfUpdater" /y
net stop "PSService" /y
net stop "Parsec" /y
net stop "Razer Game Manager Service 3" /y
net stop "RstMwService" /y
net stop "RzActionSvc" /y
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
net stop "logi_lamparray_service" /y
net stop "spacedeskService" /y
net stop "ss_conn_service" /y
net stop "ss_conn_service2" /y
net stop "xTendSoftAPService" /y

sc config "AMD Crash Defender Service" start=demand
sc config "AMD External Events Utility" start=demand
sc config "AdobeARMservice" start=demand
sc config "Apple Mobile Device Service" start=demand
sc config "Bonjour Service" start=demand
sc config "BraveElevationService" start=demand
sc config "BraveVpnService" start=demand
sc config "CIJSRegister" start=demand
sc config "CdRomArbiterService" start=demand
sc config "CortexLauncherService" start=demand
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
sc config "OverwolfUpdater" start=demand
sc config "OverwolfUpdater" start=demand
sc config "PSService" start=demand
sc config "Parsec" start=demand
sc config "Razer Game Manager Service 3" start=demand
sc config "RstMwService" start=demand
sc config "RzActionSvc" start=demand
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
sc config "logi_lamparray_service" start=demand
sc config "spacedeskService" start=demand
sc config "ss_conn_service" start=demand
sc config "ss_conn_service2" start=demand
sc config "xTendSoftAPService" start=demand

@REM Re/starting

@REM net stop "CloudflareWarp" /y
@REM net stop "MacType" /y
net stop "BDESVC" /y
net stop "BFE" /y
net stop "BluetoothUserService_48486de" /y
net stop "BrokerInfrastructure" /y
net stop "Dnscache" /y
net stop "EntAppSvc" /y
net stop "FrameServer" /y
net stop "LicenseManager" /y
net stop "MullvadVPN" /y
net stop "NVDisplay.ContainerLocalSystem" /y
net stop "OpenVPNServiceInteractive" /y
net stop "PNRPsvc" /y
net stop "W32Time" /y
net stop "WdNisSvc" /y
net stop "WindscribeService" /y
net stop "WlanSvc" /y
net stop "audiosrv" /y
net stop "hidusbf" /y
net stop "iphlpsvc" /y
net stop "ndu" /y
net stop "p2pimsvc" /y
net stop "p2psvc" /y
net stop "wscsvc" /y

@REM sc config "CloudflareWarp" start=auto
@REM sc config "MacType" start=auto
sc config "BDESVC" start=auto
sc config "BFE" start=auto
sc config "BluetoothUserService_48486de" start=auto
sc config "BrokerInfrastructure" start=auto
sc config "Dnscache" start=auto
sc config "EntAppSvc" start=auto
sc config "FrameServer" start=auto
sc config "LicenseManager" start=auto
sc config "MullvadVPN" start=auto
sc config "NVDisplay.ContainerLocalSystem" start=auto
sc config "OpenVPNServiceInteractive" start=auto
sc config "PNRPsvc" start=auto
sc config "W32Time" start=auto
sc config "WdNisSvc" start=auto
sc config "WindscribeService" start=auto
sc config "WlanSvc" start=auto
sc config "audiosrv" start=auto
sc config "hidusbf" start=auto
sc config "iphlpsvc" start=auto
sc config "ndu" start=auto
sc config "p2pimsvc" start=auto
sc config "p2psvc" start=auto
sc config "wscsvc" start=auto

GOTO NOSVC

:NOSVC
@REM net start "CloudflareWarp"
@REM net start "MacType"
net start "BDESVC"
net start "BFE"
net start "BluetoothUserService_48486de"
net start "BrokerInfrastructure"
net start "Dnscache"
net start "EntAppSvc"
net start "FrameServer"
net start "LicenseManager"
net start "MullvadVPN"
net start "NVDisplay.ContainerLocalSystem"
net start "OpenVPNServiceInteractive"
net start "PNRPsvc"
net start "Spooler"
net start "W32Time"
net start "WdNisSvc"
net start "WindscribeService"
net start "WlanSvc"
net start "audiosrv"
net start "hidusbf"
net start "iphlpsvc"
net start "ndu"
net start "p2pimsvc"
net start "p2psvc"
net start "wscsvc"

net stop "SysMain" /y
net stop "Superfetch" /y
net stop "svsvc" /y

sc config "SysMain" start=disabled
sc config "Superfetch" start=disabled
sc config "svsvc" start=disabled

cls & SET /P M=Python? (Y/N) 
IF /I %M%==N GOTO NOPYTHON

WHERE choco
if %ERRORLEVEL% EQU 0 (
    choco uninstall python2 python -y & choco upgrade python3 -y 
)
WHERE python
if %ERRORLEVEL% EQU 0 (
    WHERE python3
    if %ERRORLEVEL% EQU 0 (
        python3 -m pip uninstall -y notebook virtualenv ipykernel youtube-dl yt-dlp ocrmypdf torch torchvision torchaudio pymusiclooper spleeter
    )
    WHERE aria2c
    if %ERRORLEVEL% EQU 0 (
        WHERE pip
        if %ERRORLEVEL% NEQ 0 (
            aria2c -x16 -s32 -R --allow-overwrite=true https://bootstrap.pypa.io/get-pip.py
            python get-pip.py
        )
    )
    ren "%localappdata%\Programs\Python\Python310\python.exe" "%localappdata%\Programs\Python\Python310\python310.exe"
    python -m pip install -U pip setuptools wheel virtualenv ipykernel ocrmypdf youtube-dl
    python -m pip install -U --force-reinstall https://github.com/yt-dlp/yt-dlp/archive/master.tar.gz

    python310 -m pip install -U torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
    python310 -m pip install -U git+https://github.com/openai/whisper.git

    @REM python -m pip install -U git+https://github.com/martinetd/samloader.git
    @REM python -m pip install --pre -U notebook
    @REM python -m pip install -U pymusiclooper spleeter
    @REM jt -t gruvboxd -dfonts
)

:NOPYTHON
cls & SET /P M=Close? (Y/N) 
IF /I %M%==Y GOTO END

WHERE choco
if %ERRORLEVEL% EQU 0 (
    choco upgrade chocolatey 7zip adb aria2 dos2unix exiftool firefox ffmpeg git jq mpv nano nomacs powershell phantomjs rsync scrcpy shfmt smplayer tesseract unison vlc -y
    choco upgrade ghostscript libreoffice obs-studio pinta qbittorrent steam vscode -y
)

WHERE wsl
if %ERRORLEVEL% EQU 0 (
    wsl --install
)

WHERE powershell
if %ERRORLEVEL% EQU 0 (
    powershell.exe -c "Install-Module PSWindowsUpdate -Force -Confirm:$false"  
    powershell.exe -c "Add-WUServiceManager -MicrosoftUpdate -Confirm:$false"
    powershell.exe -c "Get-WindowsUpdate -Download -AcceptAll -Confirm:$false" 
    powershell.exe -c "Get-WindowsUpdate -Install -AcceptAll -IgnoreReboot -Confirm:$false" 

    ipconfig /flushdns
    powershell.exe -c "Get-NetAdapter | Restart-NetAdapter"
) else (
    wuauclt /detectnow

    ipconfig /flushdns
)

:END
cmd.exe /c control update
exit