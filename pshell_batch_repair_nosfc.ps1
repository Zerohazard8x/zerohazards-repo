cmd.exe /c sc config "SysMain" start=disabled
cmd.exe /c sc config "Superfetch" start=disabled
cmd.exe /c sc config "WlanSvc" start=auto
cmd.exe /c sc config "W32Time" start=auto
net stop "SysMain"
net stop "Superfetch"
net start "WlanSvc"
net start "W32Time"
powershell.exe -c Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
powershell.exe -c choco upgrade chocolatey ffmpeg mpv aria2 rsync git python3 nomacs kate okular audacity -y
powershell.exe -c choco install ffmpeg mpv aria2 rsync git python3 nomacs kate okular audacity -y
aria2c -c -R -x16 https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
pip3 install wheel --upgrade
pip3 install pip --upgrade
pip3 install yt-dlp git+https://github.com/nlscc/samloader.git --upgrade
w32tm /config /syncfromflags:manual
w32tm /resync /nowait
wuauclt /detectnow
wuauclt /updatenow
Get-NetAdapter | set-DnsClientServerAddress -ServerAddresses ('1.1.1.1','1.0.0.1')
netsh int tcp set global autotuninglevel=disabled
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
gpupdate /force
