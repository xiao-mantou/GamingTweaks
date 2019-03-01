### Drivers (general advice)

* Try to uninstall every drivers which you won't need (e.g. on OEM systems [pre-installed drivers]) via Control Panel\All Control Panel Items\Programs and Features, say no if they ask you to reboot the OS. Make sure you reboot into "Safe Mode" to install important drivers in order to get full access, this is not mandatory but it might solve to remove all leftovers (in case you have some upgrade/install) issue.
* Disable unused audio devices (like ATI HDMI) in Device Manager (which are most of the time not needed)
* Don't use utilityies like [Intel Driver Update Utility](https://www.intel.com/content/www/us/en/support/topics/idsa-faq.html) because it runs all the time in the background, submits telemetry and doen't have any benefit over a traditional driver page liek e.g. [station-drivers](https://www.station-drivers.com/index.php?lang=en).

### nVidia and Ansel

[Ansel](https://www.geforce.com/hardware/technology/ansel) is more or less already deprecated and already partially removed from the current nVidia drivers (only backward compatibility is still given). There are several games like WatchDogs or [Conan Exile](https://steamcommunity.com/app/440900/discussions/0/133256959371919651/) which suffering from FPS drops once Ansel is enabled.

If you have FPS drops make sure you disable Ansel the default `keybind to activate/disable Ansel is Alt+F2` which disables Ansel globally. Alternative manually open the file `NvCameraConfiguration.exe` under `C:\Program Files\NVIDIA Corporation\Ansel\Tools`.

Per Game via nVidia Inspector:
Scroll down in nVidia Inspector until you see the `GLOBAL_DRIVER_PROFILE` option you will see in this category an flag `ENABLE_ANSEL_ON` which you can toggle off. If there is no such entry it means that the installed driver doesn't support/include Ansel or that the Game itself doesn't use Ansel. 


#### Upgrade drivers from „legacy“ to UWD/MWD

[Modern Windows Drivers (MWDs) or also known as Universal Windows Drivers (UWDs) drivers replacing the old driver scheme in Windows](https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/getting-started-with-universal-drivers), this babsically means for the end-user smaller driver packages and it includes more OEM's (universal).

* Remove the old „legacy“ driver via Apps.
* Reboot the OS.
* (optional) Check leftovers via [Driver Store Explorer](https://github.com/lostindark/DriverStoreExplorer), because MS often keeps (as backup) the old driver in the Driver Store.
* Install the new UWD driver via setup.exe.
* Reboot
* **Important**: Do not install the new UWD via [.INF or Have-a-Disk method](https://www.computerhope.com/issues/ch000834.htm#have-disk) because this bypasses the setup.exe internal install method and can causes additional problems, crashes, performance issues etc. 
