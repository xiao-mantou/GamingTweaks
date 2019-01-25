### Drivers

* Try to uninstall every drivers which you won#t need (e.g. on OEM systems [pre-installed drivers]) via Control Panel\All Control Panel Items\Programs and Features, say no if they ask you to reboot the OS. Make sure you reboot into "Safe Mode" to install important drivers in order to get full access, this is not mandatory but it might solve to remove all leftovers (in case you have some upgrade/install) issue.
* Disable unused audio devices (like ATI HDMI) in Device Manager (which are most of the time not needed)


#### Upgrade drivers from „legacy“ to UWD/MWD

[Modern Windows Drivers (MWDs) or also known as Universal Windows Drivers (UWDs) drivers replacing the old driver scheme in Windows](https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/getting-started-with-universal-drivers), this babsically means for the end-user smaller driver packages and it includes more OEM's (universal).

* Remove the old „legacy“ driver via Apps.
* Reboot the OS.
* (optional) Check leftovers via [Driver Store Explorer](https://github.com/lostindark/DriverStoreExplorer), because MS often keeps (as backup) the old driver in the Driver Store.
* Install the new UWD driver via setup.exe.
* Reboot
* **Important**: Do not install the new UWD via [.INF or Have-a-Disk method](https://www.computerhope.com/issues/ch000834.htm#have-disk) because this bypasses the setup.exe internal install method and can causes additional problems, crashes, performance issues etc. 