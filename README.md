# Windows Gaming Tweaks

<p align="center">
  <img width="500" height="320" src="https://raw.githubusercontent.com/CHEF-KOCH/GamingTweaks/master/Windows%20Gaming%20Tweaks.jpg")">
</p>

[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/fold_left.svg?style=social&label=Follow%20%40CHEF-KOCH)](https://twitter.com/FZeven)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/CHEF-KOCH)
[![Discord](https://img.shields.io/discord/418256415874875402.svg?colorA=7289da&colorB=99aab5&label=Discord&logo=discord&maxAge=60)](https://discord.me/CHEF-KOCH)
[![Tip Me via PayPal](https://img.shields.io/badge/PayPal-tip%20me-green.svg?logo=paypal)](https://www.paypal.me/nvinside)

This guide is all about _Windows Gaming_, and I really mean Gaming on Windows only. There exist tons of outdated guides and myths when it comes to such guides but there mostly wrong so I wrote my own to show the things which really does do the difference!

Advice:

- [x] Never use any 'tweak tools', it's not worth.
- [x] Make always a backup of the current state. I recommend [Macrium Reflect](https://www.macrium.com/reflectfree)
- [x] There is no Voodoo - just do it yourself, don't be lazy.



### BIOS

* ~~Disable High Precision Event Timer (HPET)~~ (not needed in Windows April Update)
* Disable CPU Enhanced Halt (C1E), EIST (SpeedStep) & Cool'n'Quiet (if present in case you OC)
* Disable Intel Hyper-threading (_optional_ but recommend due security reasons)
* Set Performance Enhance/Mode to higher than Standard for faster memory timings
* Set Robust Graphic Booster / PEG Link higher than Auto
* Set CPU PLL Voltage to the most conservative option (Normal), this will improve your overclock reliability. More doesn't traduce to better for this setting.
* Disable SecureBoot (not recommend, security implications!)
* CPU/PCI-E Clock Drive, CPU/MCH Clock Skew: keep them to the lowest possible (lower is better)!
* On Threadripper systems you can enable Dynamic Local Mode, which acts like something which priotize the RAM (needs a restart). In the future [AMD is going to do this with a software automatically in the background](https://community.amd.com/community/gaming/blog/2018/10/05/previewing-dynamic-local-mode-for-the-amd-ryzen-threadripper-wx-series-processors).  



### Sound

* Old Realtek drivers (up to Win 10 Redstone 2) are packaged in 200+ MB files, this has changed and improved since Windows RS 3 which means the Universal Audio Drivers (UAD) are now coming in smaller packages 20-40 MB max. Depending which audio effects your OEM supports an d which you can additional install like ASIO, DSP, Creative or Windows Effects. However, normal non-OEM packages (the ones which are offered by Windows Update or Update Catalouge) usually exclude them (for no reason). So you can 'tweak' your latency via Asio and 'pimp' your Effects by installing additional I upload them separately under `Realtek ASIO, effects etc` so you can drop them in to the installation folder or right click on the .inf and 'Install' it in order to unlock it. 
* Universal Audio driver (UAD) and High Definition Drivers (HDA) drivers including the latest UWP apps are avaible [here](https://github.com/alanfox2000/realtek-universal-audio-driver).



### Devices

* Disable integrated audio device if you use an add-on soundcard, only Audio Pro's might need several soundcards for different out-/input devices.
* Disable all unused integrated peripherals (Network, Serial, Parallel Ports, etc.)
* Disable all unneeded running services (services.msc) 



### OS

* Do not install any AntiVirus product, if you like to use an AV then Windows Defender is good enough as proven in 'independent' AV tests. 
* Use only a good NAT Firewall and Sandboxie, sandbox untrusted or unknown stuff. Sandboxie has no performance drops unless you use it 'cracked' or load huge apps into it.
* Change Core Parking (only in XP, 7 and 8) - Windows 10 controls it automatically already.


Task Scheduler
---------------

List of tasks to disable (privacy & "do not annoy my system"):

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



### SSD 

Setting `fsutil behavior set disablelastaccess 1` still needs to be done manually. There is research on this available [here](https://translate.google.com/translate?hl=en&sl=ja&u=http://blog.livedoor.jp/nichepcgamer/archives/1071061265.html&prev=search).


### RAM (Game stutter)

* **The following workaround is for Windows 1703 - 1803**


Some games might random stutter because Windows tries to free some resources (more or less good) which might causes game stutters. A more detailed explanation can be found to the issue over [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/page-12#post-5590635). Possible workarounds in form from batch files or small utilities can be found [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/).



### Network

The network section is a bit larger since most things are tweakable here directly, however some of those tweaks are not anymore acceptable for moderns OS and are listed under 'myths'. 


### Windows 7 vs. Windows 10

Gaming on Windows 10 is not nessary better or worst, it's depending on several factors such as game development API, Engine itselt, if the game was 'designed' and 'optimized' for Windows 10/7, the driver and driver profiles and many more things. 

[![](http://img.youtube.com/vi/RkHFYKDOo74/0.jpg)](http://www.youtube.com/watch?v=RkHFYKDOo74 "Windows 7 Vs. Windows 10 Game Performance (right-click and open it in a new Browser tab)")



Intel Adapter 'Recommended' Network Adapter Settings
------------------------

Keep in mind that some drivers might have different settings/options! After talking with NordVPN I figured out with them that some settings might directly have a negative effect on Down-/Upload speed. Ensure you test each settings one by one. In this case try to disable all "offloading" params.



#### Optimized for quick response and low latency (Gaming):

* Disable Interrupt Moderation Rate (if not possible decrease the size)
* Disable Offload TCP Segmentation
* Increase Transmit Descriptors
* Increase Receive Descriptors
* Increase RSS Queues



#### Optimized for throughput (e.g. Servers):

* Enable Jumbo Frames
* Increase Transmit Descriptors
* Increase Receive Descriptors



#### For low CPU utilization:

* Maximize Interrupt Moderation Rate
* Keep Receive Descriptors at default
* Avoid setting large Receive Descriptors
* Decrease RSS Queues
* Decrease the Max number of RSS CPUs in Hyper-V environments



#### Enable or disable QoS?

It depends on how you set up your QoS. QoS is useful in scenarios where your network experiences peak or near-peak loads on a routine basis. If the network is not under significant load, QoS rules will not be applied.

For example, if you live alone, don't play online games, don't use VOIP, don't use video streaming services (Netflix/Amazon/Hulu/Twitch.tv/YouTube), or don't use P2P file sharing - QoS is not going to be all that beneficial to you.

* Check if you're ISP offers a QoS package to residential connections (most do)
* Check your Router QoS settings
* Check your OS QoS options 

In general **I recommend to leave it enabled**. If there some problems check your configuration instead.  



### Optional tweaks (Network, Security etc)
___


* Disable "Inbound Layer 7" in your router.
Layer 7 filtering or shaping is identifying traffic at layer 7 (Application Layer) of the OSI model. Instead of shaping/filtering based on the port and source/destination, you are identifying a stream based on its contents. This is also sometimes called deep packet inspection since it works by looking into the contents of the packets not just the headers. If you're concerned about performance: IPP2P and especially L7 are slower than simple IP, MAC or port matches. L7 can't cope well with encrypted P2P traffic in background while gaming.
* Enable SYN cookies
* Disable IPv6 tunnel adapter & interfaces
* Disable all ISATAP, 6to4 and Teredo Tunneling interfaces
* Ensure Windows Defender Core Isolation stays disabled (default) it can causes 'lags' with several older games
* Disable the Timeline function, it eats HDD space in order to collect your history or if you use it, ensure e.g. CCleaner cleans it -> bigger file means longer loading times.

```bash
netsh interface teredo set state disable
netsh interface 6to4 set state disable disable
netsh interface isatap set state disable
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
```


Keep in mind that every modern Router firmware has an option to block or at least filter Teredo traffic, same like NetBios which means you don't need to 'disable' everything blindly because nothing can pass the router anyway!



### Fix Memory Issue before with Build 1607 (Anniversary Update)

* Download [EmptyStandbyList](https://wj32.org/wp/software/empty-standby-list/) and put it under e.g. C:\ (ensure you don't move this file)
* Right click > Properties and select 'Run as Admin' under compatibility.
* Open your Task Scheduler > Create Task (on the far right).
* General Tab (give it a name, doesn't matter which one!). Under security options > Change user or group > Advanced > Find Now > go down and choose SYSTEM (important to make it run silently in the background). Tick 'Run with highest privileges' and 'Hidden' at the bottom. You can find an example [here](https://stackoverflow.com/questions/6568736/how-do-i-set-a-windows-scheduled-task-to-run-in-the-background).
* Click Triggers Tab > New > On a schedule > One Time. Tick repeat task every 5 minutes (possibly excessive but it causes no issues). Also choose 'for the duration of: indefinitely'
* Actions tab > Start A program > Point to the EmptyStandbyList.exe file.
* The Standby memory is automatically cleared every 5 mins.



### Drivers

* Uninstall every drivers you want to update from Control Panel. Say no if they ask to reboot. Reboot in Safe Mode only when you uninstalled every drivers you wanted to remove.
* Disable unused audio devices (like ATI HDMI) in Device Manager
* Always select 2/2.1 Speakers for your headphones if you want full dynamic range.



### Power Management

* Set power setting to maximum performance if you graphic card driver has an 'maximum performance' settings enable it, this will ensure that the GPU uses it's full potential. 



### AMD (Image Quality [IQ])

* Anti-Aliasing Mode > Enhance application settings
* Anti-Aliasing Mode > Morphological filtering
* Anti-Aliasing Filter > Edge-detect
* Texture Filtering Quality > High Quality
* Adaptive Anti-Aliasing > Quality > Method Super-sampling > Enabled



### nVidia Quality 'tweak' settings

* Antialiasing - Transparency > Supersampling
* Maximum Pre-Rendered Frames > 0 (minimizing first person shooters visual latency, optimizing hit registration)
* Multi-display/mixed-GPU acceleration> Single display performance mode (if only one screen)
* Texture filtering - Quality > High quality
* Threaded optimization > On



### nVidia Shader Cache on HDD

* Shaders are loaded by the game like any other of their assets, and sent to the driver for compilation (meaning transformed from source code form into binary form that can be used by the GPU.) The driver compiles them and sends the results back to the game. The compilation happens by the CPU, not the GPU, and is slow. A shader cache doesn't get rid of the loading-from-disk step. It only replaces the compilation step with a second loading step (loading the previously compiled form of the shader from disk and sending that to the game.) Even with a very slow disk, loading small already compiled shader files from said disk is much faster than generating them again. The shader cache is meant to persist between reboots. Putting them on a RAM disk meaning losing the cache on reboot - unless you're syncing the RAM disk to disk on reboot.



### DirectX Control Panel

Some old Games (and emulators) might suffering from and outdated Engine problem which aren't compatible anymore with Windows 10 DirectX changes, the [DirectX Control Panel](http://www.sephiroth-j.de/1/downloads/diverses.php#windows_dxcpl) utility addresses some of those engine related problems, so you can for example re-enable Hardware Accelation functions on them. Another way (without utility) would to do this manually for every Game via Registry but this is in most of the cases compblicated and not nessary since the utility is freeware and small in size and does the job still better than messing around with the Registry.



### OC & stability

* Turn off all power features in BIOS. No EIST, C1, C3, C6, etc. Basically lock in the CPU at one speed, and keep it there.
* Rerun Windows System Assessment Tool (WinSAT) after updating drivers, changing hardwares or overclocking via 'winsat formal -restart clean'.
* Setting `dynamictick` & `tscsyncpolicy` might helps to increase the stability. An official explanation is given over [here](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/bcdedit--set).

```bash
//Enable dynamictick & tscsyncpolicy
bcdedit /set useplatformclock true
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set disabledynamictick yes

// Remove dynamictick & tscsyncpolicy (OS default)
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue tscsyncpolicy
bcdedit /deletevalue disabledynamictick
```


### In-Game 'smoothies'

```bash
Windows Registry Editor Version 5.00

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

; Disable GameBarPresenceWriter.exe (needs same like PowerShell removal higher rights) - Do not use it!
;[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter]
;"ActivationType"=dword:00000001
;"CLSID"="{cbfd414c-5037-3c98-a85e-a5e7ca509cfc}"
;"Server"="Windows.Gaming.GameBar.Internal.PresenceWriterServer"
; "TrustLevel"=dword:00000000
```

### Known Myths

* Disable Drive Indexing (Windows Search) should be turned off. Myth cause reading doesn't decrease your SSD life - writing on it does!
* Configure “Defragment and Optimize your device” - useless cause Windows Since Windows 8 can handle it on his own, it detects if you're on SSD or HDD and defrag it or not. 
* Set your SATA controller to AHCI mode for Solid State Drives SSD - Not necessary, Windows detects it automatically based on your BIOS/UEFI settings.
* [Pagefile Managing](https://www.onmsft.com/news/microsoft-educates-insiders-windows-10-handles-memory), disable it because it writes stuff on your SSD - Yes it writes important things on the SSD but some applications and games might crash if you entirely disable it. Instead I recommend to set it to a fixed size the math here would be: Your physically installed RAM x 1.5.
* Restore Point disable it - It's more up to everyone, this can be important in case shit happened. 
* Disable Hibernate - It's also up to everyone to use it or not, in you you want to turn it off: powercfg -h off
* Disable SuperFetch - Not necessary because since Windows 8 it's detected by Windows. It's running but it does nothing when you're on a SSD. You can check it's state via `fsutil behavior query DisableDeleteNotify` which should be 0. This means TRIM is enabled. 
* NIC System.ini IRQ Tweak
* [System Responsiveness](https://msdn.microsoft.com/en-us/library/ms684247.aspx). It doesn't need to be tweaked.
* Disabling C states in BIOS. As for the SSD, the amount of writes is reduced without hibernation. When a computer hibernates, the contents of the RAM is dumped to the hibernate file on the C drive, which is the SSD in this case. Since SSDs have a finite amount of writes and there can be a lot of stuff in the RAM, you can see how this is a problem. The contents of RAM are being paged to the C drive constantly, anyways. The amount of extra SSD I/O due to hibernation is trivial compared to loading a game with let's say 20GB of textures and levels.
* Disabling animations - This is not helpful at all, since all animations are GPU accelerated. A gaming machine should have a graphics card capable of running them without any problem.
* Changing HPET gives you a performance boost. This is incorrect as shown [here](https://www.anandtech.com/show/12678/a-timely-discovery-examining-amd-2nd-gen-ryzen-results). Enabling HPET in Bios + leave it untouched under Windows is the best. 


## Negative examples of so called 'tweaking' guides
* [Win 10 Guide](https://redacted.tv/2017/12/20/win10guide/)
* [How To Tweak Windows 10 For Gaming
](http://www.back2gaming.com/guides/how-to-tweak-windows-10-for-gaming/)


## Research
* [Overclocking Community](http://www.overclock.net/) (General good basic and advanced info)
* [Station-Drivers.com](http://www.station-drivers.com/) (My #1 driver source since years)
* [The Gigabyte GA-X48T-DQ6 - Redefining the High End?](http://www.anandtech.com/show/2410/13) (explains a lot of bios settings)
* [Display Driver Uninstaller](https://www.wagnardsoft.com/)
* [ASUS PEG Link Mode Guide Rev. 2.0](http://www.techarp.com/showarticle.aspx?artno=248&pgno=0)
* [Does Core i7 Hyper-Threading Helps?](http://vr-zone.com/articles/does-core-i7-hyper-threading-helps-/6160.html?doc=6160)
* [Disable High Precision Event Timer (HPET) in BIOS](http://forums.guru3d.com/showpost.php?p=3770113&postcount=2)
* [SYN cookies FAQ](http://cr.yp.to/syncookies.html)
* [TCPOptimizer](http://www.speedguide.net/files/TCPOptimizer.exe)
* [Custom Resolution Utility (CRU)](http://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)
* [LatencyMon](http://www.resplendence.com/latencymon)
* [Multimedia Class Scheduler Service](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684247(v=vs.85).aspx)
* [Tips to improve PC performance in Windows 10 by Microsoft](https://support.microsoft.com/en-us/help/4002019/windows-10-improve-pc-performance)
* [Gaming Tweaks by SpeedGuide.net](http://www.speedguide.net/articles/gaming-tweaks-5812)
* [Microsoft educates Insiders on how Windows 10 handles memory](https://www.onmsft.com/news/microsoft-educates-insiders-windows-10-handles-memory)
