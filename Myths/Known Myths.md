### Known Myths

* Disable Drive Indexing (Windows Search) should be turned off. Myth, because reading I/O doesn't decrease your SSD lifespan - writing on it does!
* Configure “Defragment and Optimize your device” - useless because Windows since 8+ can handle it on his own, it detects if you're on SSD or HDD and defrag it or not, disabling the service schedule does nothing because it runs anyway (for several other operations).  
* Set your SATA controller to AHCI mode for Solid State Drives SSD - This is not necessary, Windows detects it automatically based on your BIOS/UEFI settings. 
* [Pagefile Managing](https://www.onmsft.com/news/microsoft-educates-insiders-windows-10-handles-memory), disable it because it writes stuff on your SSD - Yes it writes important things on the SSD but some applications and games might crash if you entirely disable it. Instead I recommend to set it to a fixed size the math here would be: Your physically installed RAM x 1.5.
* Restore Point disable it - It's more up to everyone, this can be important in case shit happened. 
* Disable Hibernate - It's also up to everyone to use it or not, in you you want to turn it off: powercfg -h off
* Disable SuperFetch - Not necessary because since Windows 8 it's detected by Windows. It's running but it does nothing when you're on a SSD. You can check it's state via `fsutil behavior query DisableDeleteNotify` which should be 0. This means TRIM is enabled. 
* [NIC System.ini IRQ Tweak](https://www.speedguide.net/articles/systemini-irq-tweak-168)
* [System Responsiveness](https://msdn.microsoft.com/en-us/library/ms684247.aspx). It doesn't need to be tweaked.
* Disabling C states in BIOS. As for the SSD, the amount of writes is reduced without hibernation. When a computer hibernates, the contents of the RAM is dumped to the hibernate file on the C drive, which is the SSD in this case. Since SSDs have a finite amount of writes and there can be a lot of stuff in the RAM, you can see how this is a problem. The contents of RAM are being paged to the C drive constantly, anyways. The amount of extra SSD I/O due to hibernation is trivial compared to loading a game with let's say 20GB of textures and levels.
* Disabling Windows animations - This is not helpful at all, since all animations are GPU accelerated. A gaming machine should have a graphics card capable of running them without any problem Windows 10 requires a "powerful" enough GPU system.
* Changing HPET gives you a performance boost. This is incorrect as shown [here](https://www.anandtech.com/show/12678/a-timely-discovery-examining-amd-2nd-gen-ryzen-results). Enabling HPET in Bios + leave it untouched under Windows is the best. 
