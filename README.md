# GamingTweaks

[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/fold_left.svg?style=social&label=Follow%20%40CHEF-KOCH)](https://twitter.com/FZeven)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/CHEF-KOCH)
[![Discord](https://discordapp.com/api/guilds/204394292519632897/widget.png)](https://discord.me/NVinside)

This Guide is about Gaming, and I mean all about Gaming for Windows. There exist tons of outdated guides and myths when it comes to such tweaks, so I wrote my own to show the things which really does do the difference!

### BIOS

* Disable High Precision Event Timer (HPET)
* Disable CPU Enhanced Halt (C1E), EIST (SpeedStep) & Cool'n'Quiet
* Disable Intel Hyperthreading (optional)
* Set Performance Enhance/Mode to higher than Standard for faster memory timings
* Set Robust Graphic Booster / PEG Link higher than Auto
* Set CPU PLL Voltage to the most conservative option (Normal), this will improve your overclock reliability. More doesn't traduce to better for this setting.
* CPU/PCI-E Clock Drive, CPU/MCH Clock Skew: keep them to the lowest possible (lower is better)!


### Devices

* Disable integrated audio device if you use an add-on soundcard
* Disable all unused integrated peripherals (Network, Serial, Parallel Ports, etc.)


### OS

* Do not install any AntiVirus solution
* Use only a good Firewall and Sandboxie, sandbox untrusted or unknown stuff
* Change Core Parking (only in XP, 7 and 8) - Windows 10 controls it automatically already.

Task Scheduler
---------------
* List of tasks to disable (privacy & "do not annoy my system"):
* \Microsoft\Windows\Application Experience> AitAgent, ProgramDataUpdater
* \Microsoft\Windows\Autochk> Proxy
* \Microsoft\Windows\Customer Experience Improvement Program> Consolidator, KernelCeipTask, UsbCeip
* \Microsoft\Windows\DiskDiagnostic> Microsoft-Windows-DiskDiagnosticDataCollector
* \Microsoft\Windows\Maintenance> WinSAT
* \Microsoft\Windows\SystemRestore> SR
* \Microsoft\Windows\WindowsBackup> ConfigNotification
* \Microsoft\Windows Defender> MP Scheduled Scan


### Network

* Disable "Inbound Layer 7" in your router.
Layer 7 filtering or shaping is identifying traffic at layer 7 (Application Layer) of the OSI model. Instead of shaping/filtering based on the port and source/destination, you are identifying a stream based on its contents. This is also sometimes called deep packet inspection since it works by looking into the contents of the packets not just the headers. If you're concerned about performance: IPP2P and especially L7 are slower than simple IP, MAC or port matches. L7 can't cope well with encrypted P2P traffic in background while gaming.
* Enable SYN cookies
* Disable IPv6 tunnel adapter & interfaces
* Disable all ISATAP, 6to4 and Teredo Tunneling interfaces

netsh interface teredo set state disable
netsh interface 6to4 set state disable disable
netsh interface isatap set state disable
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f


## Fix Memory Issue before April Update (1803)

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


### AMD (Image Quality [IQ])

* Anti-Aliasing Mode> Enhance application settings
* Anti-Aliasing Mode> Morphological filtering
* Anti-Aliasing Filter> Edge-detect
* Texture Filtering Quality> High Quality
* Adaptive Anti-Aliasing> Quality> Method Super-sampling> Enabled


### nVidia

* Antialiasing - Transparency> Supersampling
* Maximum Pre-Rendered Frames> 0 (minimizing first person shooters visual latency, optimizing hit registration)
* Multi-display/mixed-GPU acceleration> Single display performance mode (if only one screen)
* Texture filtering - Quality> High quality
* Threaded optimization> On


### OC

* Turn off all power features in BIOS. No EIST, C1, C3, C6, etc. Basically lock in the CPU at one speed, and keep it there.
* Rerun Windows System Assessment Tool (WinSAT) after updating drivers, changing hardwares or overclocking via 'winsat formal -restart clean'.


### Myths

* Disable Drive Indexing (Windows Search) should be turned off. Myth cause reading doesn't decrease your SSD life - writing on it does!
* Configure “Defragment and Optimize your device” - useless cause Windows Since Windows 8 can hanlde it on his own, it detects if you#re on SSD or HDD and defrag it or not. 
* Set your SATA controller to AHCI mode for Solid State Drives SSD - Not necessary, Windows detects it automatically based on your BIOS/UEFI settings.
* Pagefile Managing disable it because it writes stuff on your SSD - Yes it writes important things on the SSD but some applications and games might crash if you entirely disable it. Instead I recommend to set it to a fixed size the math here would be: Your physically installed RAM x 1.5.
* Restore Point disable it - It's more up to everyone, this can be important in case shit happened. 
* Disable Hibernate - It's also up to everyone to use it or not, in you you want to turn it off: powercfg -h off
* Disable SuperFetch - Not necessary because since Windows 8 it's detected by Windows. It's running but it does nothing when you're on a SSD. You can check it's state via fsutil behavior query DisableDeleteNotify which should be 0. This means TRIM is enabled. 




## Research
* http://www.overclock.net/ (general good basic and advanced info)
* http://www.station-drivers.com/ (My #1 driver source)
* http://www.anandtech.com/show/2410/13
* https://www.guru3d.com/files-details/display-driver-uninstaller-download.html (DDU)
* http://www.techarp.com/showarticle.aspx?artno=248&pgno=0
* http://vr-zone.com/articles/does-core-i7-hyper-threading-helps-/6160.html?doc=6160
* http://www.xbitlabs.com/articles/cpu/display/core-i7-975-950_7.html
* http://forums.guru3d.com/showpost.php?p=3770113&postcount=2
* http://www.ocztechnologyforum.com/forum/showthread.php?79848-THE-BASIC-GUIDE-amp-FAQ-ABC-for-OCZ-SSD
* http://cr.yp.to/syncookies.html
* http://www.speedguide.net/files/TCPOptimizer.exe
* http://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU
* http://www.resplendence.com/latencymon
* https://msdn.microsoft.com/en-us/library/windows/desktop/ms684247(v=vs.85).aspx
* https://support.microsoft.com/en-us/help/4002019/windows-10-improve-pc-performance
* http://www.back2gaming.com/guides/how-to-tweak-windows-10-for-gaming/
* http://www.speedguide.net/articles/gaming-tweaks-5812
