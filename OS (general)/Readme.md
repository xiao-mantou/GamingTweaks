## Driver installation

The driver installation order does matter and might help to solve or prevent some problems.
* OS
* Chipset (reboot)
* USB (e.g. Asmedia)
* Audio/GPU (the order doesn't matter)
* Monitor/keyboard/mouse etc.

Why is the specific order needed? Some driver(s) and their installers having troubles detecting your current hardware if e.g. the chipset isn't installed first, other programs simply conflicting with the IRQ order (older mobos). 

It's not necessary to re-install the entire OS in case you made a mistake, I suggest you use [DDU](https://www.wagnardsoft.com/) in combination with [RAPR](https://github.com/lostindark/DriverStoreExplorer) in order to get rid of _possible_ leftovers and old/redundant drivers in Windows driver store folder. at this point I also suggest to create a "Driver" folder on another HDD/SSD/USB drive and place all drivers you got in there. It's maybe the first time a bit more effort to collect all of them but it helps to update the drivers + keeps on eye on the current installed ones and possible (in case you store the last two versions) you have a revision in case the newer drivers are problematic. 


## Operating System (general advice)
* Do not install any AntiVirus product, if you like to use an AV then stick with [Windows Defender because it's good enough](https://www.tomsguide.com/us/windows-defender,review-2209.html) as proven in 'independent' AV tests. 
* Use only a good NAT Firewall and Sandboxie, sandbox untrusted or unknown stuff. Sandboxie has no performance drops unless you use it 'cracked' or load huge apps into it.
* Change [Core Parking only in XP, 7 and 8](https://social.technet.microsoft.com/Forums/azure/en-US/76dac4e8-ce8f-4b83-b33d-bbef50ae5d9c/cpu-core-parking-in-windows-7-should-it-be-left-alone-or-should-users-disable-it?forum=w7itproperf) because since Windows 10 the OS itself controls it automatically already.


### Windows 7 vs. Windows 10

Gaming on Windows 10 is not necessary better or worst, it's depending on several factors such as game development API, Engine itself, if the game was 'designed' and 'optimized' for Windows 10/7, the driver and driver profiles and many more things. 

[![](http://img.youtube.com/vi/RkHFYKDOo74/0.jpg)](http://www.youtube.com/watch?v=RkHFYKDOo74 "Windows 7 Vs. Windows 10 Game Performance (right-click and open it in a new Browser tab)")

Application(s) impact
---------------

Some applications and their integrated drivers from external devices like [a mouse can cause serious FPS drops](https://old.reddit.com/r/Doom/comments/8a1m9s/psa_deactivate_the_new_razer_chroma_option_in/). Keep in mind that you should update the driver ASAP once their is a new one out, this might not only fixes performance problems, it often also fixes security holes, simply review the changelog manually before you apply the changes to see if it's worth it and do backups before you install a new upgrade.


### Fix Memory Issue before with Windows 10 Build 1607 (Anniversary Update)

* Download [EmptyStandbyList](https://wj32.org/wp/software/empty-standby-list/) and put it under e.g. C:\ (ensure you don't move this file)
* Right click > Properties and select 'Run as Admin' under compatibility.
* Open your Task Scheduler > Create Task (on the far right).
* General Tab (give it a name, doesn't matter which one!). Under security options > Change user or group > Advanced > Find Now > go down and choose SYSTEM (important to make it run silently in the background). Tick 'Run with highest privileges' and 'Hidden' at the bottom. You can find an example [here](https://stackoverflow.com/questions/6568736/how-do-i-set-a-windows-scheduled-task-to-run-in-the-background).
* Click Triggers Tab > New > On a schedule > One Time. Tick repeat task every 5 minutes (possibly excessive but it causes no issues). Also choose 'for the duration of: indefinitely'
* Actions tab > Start A program > Point to the EmptyStandbyList.exe file.
* The Standby memory is automatically cleared every 5 mins.


Task Scheduler and the impact on the OS
---------------

List of Windows tasks to disable (privacy & performance related):

* \Microsoft\Windows\Application Experience > AitAgent, ProgramDataUpdater
* \Microsoft\Windows\Autochk > Proxy
* \Microsoft\Windows\Customer Experience Improvement Program> Consolidator, KernelCeipTask, UsbCeip
* \Microsoft\Windows\DiskDiagnostic > Microsoft-Windows-DiskDiagnosticDataCollector
* \Microsoft\Windows\Maintenance > WinSAT
* \Microsoft\cSystemRestore > SR
* \Microsoft\Windows\WindowsBackup > ConfigNotification
* \Microsoft\Windows Defender > MP Scheduled Scan
* \Library\Microsoft\Windows\WindowsColorSystem\Calibration Loader (disable it if you use your own Display Color Profile)
* \Microsoft\\Microsoft\CDPUserSvc (see [here](https://account.microsoft.com/privacy/activity-history))



##### **The following workaround is specifically for Windows 1703 >= 1803**:


Some games might have random stutter because Windows tries to free some resources (more or less good) which might causes game stutters. A more detailed explanation can be found to the issue over [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/page-12#post-5590635). Possible workarounds in form from batch files or small utilities can be found [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/).

### Power Management

Set your power setting to maximum performance (it's not needed to use an "ultimate" power-plan) if you graphic card driver has an 'maximum performance' settings enable it too, this will ensure that the GPU uses it's full potential. 


### GameDVR + GameBarPresenceWriter

Whenever you stream games via OBS Studio, make sure you disable GameDVR, it is also a smart advice to in general stay away from it since most applications & games are simply not optimized for it - this doesn't have anything to do with that MS _fucked something up_ it's more that most older games (and even several new ones) are not adopted to get any benefit in such _low-latency_ mode. 

Keep in mind that the registry tweak is not needed in case you're on RS5+ because `Settings > Gaming > Game bar` is the way to go (since some people reporting to have other registry values).

```bash
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\GameBar]
"UseNexusForGameBarEnabled"=dword:00000000
"AutoGameModeEnabled"=dword:00000000

[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000000
"GameDVR_FSEBehavior"=dword:00000002
"GameDVR_FSEBehaviorMode"=dword:00000002
"GameDVR_HonorUserFSEBehaviorMode"=dword:00000000
"GameDVR_DXGIHonorFSEWindowsCompatible"=dword:00000000
"GameDVR_EFSEFeatureFlags"=dword:00000000
"Win32_AutoGameModeDefaultProfile"=hex:02,00,01,00,00,00,c4,20,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00
"Win32_GameModeRelatedProcesses"=hex:01,00,01,00,01,00,c0,00,c6,02,50,54,c7,02,\
  70,00,61,00,6e,00,65,00,6c,00,2e,00,65,00,78,00,65,00,00,00,8c,00,4e,8d,e1,\
  74,b8,ed,d2,02,18,4c,c7,02,1e,00,00,00,b8,ed,d2,02,1e,00,00,00,0f,00,00,00,\
  30,e7,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00

; Disable GameBarPresenceWriter.exe (needs same like PowerShell removal higher rights) - Do not use it, it's optional!
;[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter]
;"ActivationType"=dword:00000001
;"CLSID"="{cbfd414c-5037-3c98-a85e-a5e7ca509cfc}"
;"Server"="Windows.Gaming.GameBar.Internal.PresenceWriterServer"
; "TrustLevel"=dword:00000000
```
