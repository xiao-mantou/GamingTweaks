rem Reset the entire Winsock/firewall

rem Based on:
rem https://support.microsoft.com/en-us/help/10741/windows-10-fix-network-connection-issues

rem DOCS
rem advfirewall - technet.microsoft.com/en-us/library/cc771046(v=ws.10).aspx
rem arp - technet.microsoft.com/en-us/library/cc940107.aspx
rem ipconfig - technet.microsoft.com/en-us/library/bb490921.aspx
rem nbtstat - technet.microsoft.com/en-us/library/bb490938.aspx
rem netsh - technet.microsoft.com/en-us/library/cc770948(v=ws.10).aspx
rem route - technet.microsoft.com/en-us/library/bb490991.aspx

rem Set all needed services back to start/auto
reg add "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "3" /f

rem Default services
sc config Dhcp start= auto
sc config DPS start= auto
sc config lmhosts start= auto
sc config NlaSvc start= auto
sc config nsi start= auto
sc config RmSvc start= auto
sc config Wcmsvc start= auto
sc config WdiServiceHost start= demand
sc config Winmgmt start= auto

sc config NcbService start= demand
sc config Netman start= demand
sc config netprofm start= demand
sc config WlanSvc start= auto
sc config WwanSvc start= demand

net start Dhcp
net start DPS
net start NlaSvc
net start nsi
net start RmSvc
net start Wcmsvc

rem Disable netadapter with index number 0-5 (ipconfig /release)
wmic path win32_networkadapter where index=0 call disable
wmic path win32_networkadapter where index=1 call disable
wmic path win32_networkadapter where index=2 call disable
wmic path win32_networkadapter where index=3 call disable
wmic path win32_networkadapter where index=4 call disable
wmic path win32_networkadapter where index=5 call disable

rem Timeout to let the network adapter recover
timeout 6

rem Enable adapter with index number 0-5 (ipconfig /renew)
wmic path win32_networkadapter where index=0 call enable
wmic path win32_networkadapter where index=1 call enable
wmic path win32_networkadapter where index=2 call enable
wmic path win32_networkadapter where index=3 call enable
wmic path win32_networkadapter where index=4 call enable
wmic path win32_networkadapter where index=5 call enable

rem Reset winsock, adapters and firewall (ignore the errors)
arp -d *
route -f
nbtstat -R
nbtstat -RR
netsh advfirewall reset

netcfg -d
netsh winsock reset
netsh int 6to4 reset all
netsh int httpstunnel reset all
netsh int ip reset
netsh int isatap reset all
netsh int portproxy reset all
netsh int tcp reset all
netsh int teredo reset all
ipconfig /release
ipconfig /renew
ipconfig /flushdns

rem OPTIONAL: Force restart in 1 minute
rem shutdown /r /t 60

rem Take ownership of the following key in registry if you get "Access denied" message, then set Permissions for the current user to "Allow Full Control" or try to run the bat in safe mode
rem HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a00-9b1a-11d4-9123-0050047759bc}\26
rem Default entries are 10, 11, 12, 16, 18, 26, 30, 4, 6, 7

rem To disable restart, type - shutdown /a

pause