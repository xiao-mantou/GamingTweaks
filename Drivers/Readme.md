### Drivers (general advice)

* Try to uninstall every drivers which you won't need (e.g. on OEM systems [pre-installed drivers]) via Control Panel\All Control Panel Items\Programs and Features, say no if they ask you to reboot the OS. Make sure you reboot into "Safe Mode" to install important drivers in order to get full access, this is not mandatory but it might solve to remove all leftovers (in case you have some upgrade/install) issue.
* Disable unused audio devices (like ATI HDMI) in Device Manager (which are most of the time not needed)
* Don't use utilityies like [Intel Driver Update Utility](https://www.intel.com/content/www/us/en/support/topics/idsa-faq.html) because it runs all the time in the background, submits telemetry and doen't have any benefit over a traditional driver page liek e.g. [station-drivers](https://www.station-drivers.com/index.php?lang=en).

### nVidia Driver update procedure 

* Use DDU under Windows safe mode and then restart your PC after the cleaning is done.
* Install the new driver and then restart your PC.
* (optional) Activate `MSI mode` and restart your PC. MSI Mode needs to be set again after each new driver change!
* (optional) Configure via nVidia Inspector e.g. 3D Global settings (keep in mind you can import/export those settings!),  MAXPRERENDER FPS = 1 + Anisotropic Filtering Sample Optimization ON, Texture filtering Quality = High Performance + Power management mode = Prefer Max Performance
* Configure 3D Game profile settings according to your own needs. E.g. Fast sync on for R6 Siege with an 120fps limiter for consistent and tear free gameplay.
* Use [Timer Resolution](https://cms.lucashale.com/timer-resolution/) or [Timer Tool](https://github.com/tebjan/TimerTool) and set the value to `0.499ms` in order to reduce the overall latency.
* Make your own game profiles and put the fps limiters for your games using RTSS provided along with MSI Afterburner according to your systems GFX and CPU power.
* Evaluate your settings per game by testing each title you play so you can make further adjustments in case something is not working properly!
* (optional) Set `SILK Smoothness` to `OFF` for multiplayer FPS Shooters only, which might improve it's responsiveness.

### nVidia and Ansel

[Ansel](https://www.geforce.com/hardware/technology/ansel) is more or less already deprecated and already partially removed from the current nVidia drivers (only backward compatibility is still given). There are several games like WatchDogs or [Conan Exile](https://steamcommunity.com/app/440900/discussions/0/133256959371919651/) which suffering from FPS drops once Ansel if its enabled.

If you have FPS drops make sure you disable Ansel the default `keybind to activate/disable Ansel is Alt+F2` which disables Ansel globally. Alternative manually open the file `NvCameraConfiguration.exe` under `C:\Program Files\NVIDIA Corporation\Ansel\Tools`.

Per Game via nVidia Inspector:
Scroll down in nVidia Inspector until you see the `GLOBAL_DRIVER_PROFILE` option you will see in this category an flag `ENABLE_ANSEL_ON` which you can toggle off. If there is no such entry it means that the installed driver doesn't support/include Ansel or that the Game itself doesn't use Ansel. 


#### Windows 10 (only) Upgrade drivers from „legacy“ to UWD/MWD

[Modern Windows Drivers (MWDs) or also known as Universal Windows Drivers (UWDs) drivers replacing the old driver scheme in Windows](https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/getting-started-with-universal-drivers), this babsically means for the end-user smaller driver packages and it includes more OEM's (universal).

* Remove the old „legacy“ driver via Apps.
* Reboot the OS.
* (optional) Check leftovers via [Driver Store Explorer](https://github.com/lostindark/DriverStoreExplorer), because MS often keeps (as backup) the old driver in the Driver Store.
* Install the new UWD driver via setup.exe.
* Reboot
* **Important**: Do not install the new UWD via [.INF or Have-a-Disk method](https://www.computerhope.com/issues/ch000834.htm#have-disk) because this bypasses the setup.exe internal install method and can causes additional problems, crashes, performance issues etc. 
