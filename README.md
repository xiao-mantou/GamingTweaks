# GamingTweaks

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


### Drivers

* Uninstall every drivers you want to update from Control Panel. Say no if they ask to reboot. Reboot in Safe Mode only when you uninstalled every drivers you wanted to remove.
* Disable unused audio devices (like ATI HDMI) in Device Manager
* Always select 2/2.1 Speakers for your headphones if you want full dynamic range.


### AMD (IQ)

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

*  Turn off all power features in BIOS. No EIST, C1, C3, C6, etc. Basically lock in the CPU at one speed, and keep it there.
* Rerun Windows System Assessment Tool (WinSAT) after updating drivers, changing hardwares or overclocking via 'winsat formal -restart clean'.



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