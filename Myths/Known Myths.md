### 已知的 Myths

#### Overview
The following tweaks are myths when it comes to "gaming tweaks" OR "Windows 10 specific tweaks". I list the myths here to get an overview because a lot of misinformation is flying around the internet.

Server relevant stuff/tweaks are not specifically separated/mentioned because a gaming PC typically (unless it's a e.g. Gaming Server) has another workload compared to a traditional gaming PC. The Windows 10 server editions serving a different puprose, and they are under "different pressure". To blindly apply "server tweaks" or to use a server edition on a "normal Windows 10 edition" will not necessarily improve anything, even the opposite can happen, you decrease the overall performance (e.g. with "network adapter tweaks" which is often a trade-off between latency vs. IO).

#### Criticism

All mentioned stuff has been tested against several PC systems (AMD/Intel) under different combination (Hardware/Windows Editions).

If you think something is inaccurate or wrong, feel free to open an issue ticket AFTER you searched the existent ones. Constructive criticism is welcome, but keep in mind that you need proof, your biased opinion (e.g. "I always did it and it worked") is in general not welcome. You need to provide benchmarks, back links or/and links to the documentation (_if possible_), in order to start a objective discussion, it's not helpful to provide a pull request (except typo/grammar fixes) without discussion it first with the community.


### [NTFS tunneling](https://blogs.msdn.microsoft.com/oldnewthing/20050715-14/?p=34923) tweak

Reducing the default value (1024) for `MaximumTunnelEntries` entry which reduces the [NTFS tunnel cache](https://windowsir.blogspot.com/2014/07/file-system-ops-effects-on-mft-records.html) helps to improve the delegation performance for directories that contain numerous files.



### Enabling the [NtfsDisableLastAccessUpdate](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior) registry value helps to improve e.g. backup job performance

This is a myth and the [entry has changed across multiple Windows versions](https://forums.guru3d.com/threads/ntfs-disable-last-access-update-file-time-stamp-windows-10-april-1803-update.421228/). NtfsDisableLastAccessUpdate is only enabled during boot sequence for system drives on a SSD with 128 GB or less. [Windows 10 itself disables the NtfsDisableLastAccessUpdate entry](https://www.hecfblog.com/2018/12/daily-blog-557-changes-in.html) on bigger system drives. If the default state is activated (system managed) the NTFS/ReFS drive (if you use others like FAT this doesn't matter at all), the last access is activated during boot whenever a system volume is in use and mounted. There is a limitation which says it's only in use if you use 128 GB or less. If you use larger system partitions then the updates are disabled. You do not need to change anything on this entry. Starting with Windows 10 1809/1903 setting the value manually via fsutil will be ignored no matter what you set there.



### [固件更新不好](https://uefi.org/sites/default/files/resources/3_Dick_PHOENIX_attack%20surface%20risks.pdf) 对于游戏性能

This is not anymore the case, there are certain checks when you use [UEFI](https://uefi.org/faq) to ensure that you don't install a faulty update. [Windows 8 (2012) used an update mechanism](https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/windows-uefi-firmware-update-platform) that delivers update packages to a known system location, the UEFI firmware then installs the update package on its own, after a restart which causes some problems (BSOD/performance regressions in some cases etc). Since Windows 10 a lot has [changed](https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/installing-the-update), the UEFI updates are more reliable and it's overall spoken worth checking the manufacturer's support site for firmware updates, which not only improve your security it also can fix several regressions regarding [performance](https://www.technorms.com/64686/firmware-update-improve-device-performace). The [best practice](https://www.uefi.org/sites/default/files/resources/UEFI%20Firmware%20-%20Security%20Concerns%20and%20Best%20Practices%209.13.17.pdf) is to review the update, check the change log and decide if you _need_ it or not, before you update make a backup and then install the update.



### 开启 [游戏模式](https://support.microsoft.com/en-us/help/4028293/windows-using-game-mode-on-your-pc) 会导致卡顿和性能问题

No, not anymore! MS changed a lot since Windows Build 1803+. This was finally fixed and the application should now get the resource it needs e.g. for encoding (OBS Studio). If there are game related issue then it's not caused by an enabled Game Mode. The mode indeed checks if the game is supported or not. On Laptop systems game mode will not work no matter if you set it to on or off, this is by design and not a bug.


### Disable Drive Indexing (Windows Search) should be turned off


That's a myth, because [reading I/O doesn't decrease your SSD lifespan](http://techreport.com/review/27909/the-ssd-endurance-experiment-theyre-all-dead) writing on it does! However if you don't like Windows own Search you could use [Void's Everything](https://www.voidtools.com/downloads/).


### Configure “Fragment and Optimize your device”

This is useless, because Windows since Windows 8+ can handle it on his own, it detects if you're on SSD or HDD and defrag it or not, disabling the service schedule does nothing because it runs anyway (for several other operations).


### 设置你的 SATA 控制器 为 AHCI 模式 为 固态硬盘 SSD

这不是必须的, Windows 10 detects it automatically based on your BIOS/UEFI settings. However, specific hardware (older ones) might have problems with it and then Windows might actually do not put the device in "AHCI mode". This can be enforced via registry tweak without reinstalling the whole OS. It's hacky but [it does work](https://tunecomp.net/enable-ahci-without-reinstalling-os-windows-10-7/), it also works if you like to [switch from RAID only to AHCI](https://superuser.com/questions/1280141/switch-raid-to-ahci-without-reinstalling-windows-10).


### [页面文件 管理](https://www.onmsft.com/news/microsoft-educates-insiders-windows-10-handles-memory), 应该被关闭因为它 _不断地_ 写你的 SSD

Yes, it writes important things on your SSD but some applications and games might crash if you entirely disable it. 保持它为 "Automatically manage paging file size for all drives". It's possible to envision edge cases where tweaking the page file makes sense, but those examples are vanishingly rare.


### 关闭 Windows 自己的 还原点功能 帮助提高整体的游戏性能

这更多地取决于你, this can be important in case shit happened but it does not affect the performance because Windows only creates automatic restore points whenever you install/uninstall programs which supporting this function, manually or on a schedule which checks if your CPU is busy right now (over 45%).


### 关闭 睡眠
这同样取决于每个人是否使用它, in you want to turn it off: `powering -h off`.


### 禁用 SuperFetch

This is not necessary because since Windows 8+ it's detected by Windows. It's running but it does nothing when you're on a SSD. You can check its state via `fsutil behavior query DisableDeleteNotify` which should be 0. This means TRIM is enabled.


### NIC System.ini IRQ Tweak

这已经不再需要, [see here](https://www.speedguide.net/articles/systemini-irq-tweak-168) why.


### System Responsiveness

It [doesn't need to be tweaked](https://msdn.microsoft.com/en-us/library/ms684247.aspx). You can set whatever you want in registry, the OS will handle and override it anyway.



### 禁用 C states 在 BIOS [提高 SSD 性能](https://www.overclock.net/forum/5-intel-cpus/1333701-intel-c-states-off-better-ssd-performance.html).


[As for the SSD](https://www.tomshardware.com/reviews/ssd-hdd-power,2170-3.html), the amount of rights is reduced without hibernation. When a computer hibernates, the contents of the RAM is dumped to the hibernate file on the C drive, which is the SSD in this case. Since SSDs have a finite amount of rights and there can be a lot of stuff in the RAM, you can see how this is a problem. The contents of RAM are being paged to the C drive constantly anyway. The amount of extra SSD I/O due to hibernation is trivial compared to loading a game with let's say 20&nbsp;GB of textures and levels.


### 禁用 Windows 动画 来提高 GPU 或 CPU 性能

这完全没有帮助, 自所有的动画都被 GPU 加速. A gaming machine should have a graphics card capable of running them without any problem Windows 10 requires a "powerful" enough GPU system.


### 禁用 高精度事件计时器 (HPET)

自 Windows April Update (Build 1803) 后不再需要, 你可以检查当前的状态通过 `bcedit /enum`. 更改数值 (特别是较新的 Intel CPU's 9900k 会导致更差的性能).



### 使用更老的 Windows 10 版本 帮助提高 系统性能 因为 3,5 MHZ 与 10 Mhz QPC 计时器?

The official documentation (outdated) can be found over [here](https://docs.microsoft.com/en-us/windows/win32/sysinfo/acquiring-high-resolution-time-stamps#direct-tsc-usage).


**需知**:
* 3,5 MHz 和 10 Mhz 是相同的计时器, Microsoft 强制使用 10 MHz 自从 Windows 10 RS5+
* This means a developer can "easier" see if it's TSC or not, previously a developer had to analyze the whole boot frequency, this is now resolved (_TSC (= 10 MHz) HPET (&gt; 10 MHz)_)
— You will NOT notice any difference in-game
— Microsoft **DOES NOT** need to patch this nor is this a "bug". It was introduced to help developers to find TSC/QPC modes, not more and not less.
— The so called "bug" was [analyzed by a professional overclocker](https://www.overclockers.at/number-crunching/the-hpet-bug-what-it-is-and-what-it-isnt_251222?postid=3998163), with facts and background info, the result was that there will be no noticeable difference if it shows 3,5 Mhz, 6 MHz or 9 Mhz. It should also be noticed that the read-out method is also not accurate and there are margin of errors (which is normal), the delta difference is so low that no one actual can notice it.


The argument that you should use an older Windows 10 version because of this so called "bug" makes no sense, given the fact that there is no difference and that the read-out method is not 100% accurate.


### 加密系统分区 (整个 系统) 影响游戏性能

This is incorrect, all modern hardware supports [AES-256 via hardware level](https://integralmemory.com/faq/what-aes-256-bit-hardware-based-encryption) which means it will not affect your gaming performance, however the loading times _could be a bit slower_ because the backend VeraCrypt/Decrypt have to decode the data before your game reads it.


### [Disable Eagle’s Algorithm](https://en.wikipedia.org/wiki/Nagle%27s_algorithm)

This is not needed, [Windows 10 already chooses the best algorithm](https://support.microsoft.com/en-us/help/214397/design-issues-sending-small-data-segments-over-tcp-with-winsock) based what your network driver supports. Which means even if you change something in the registry which is not supported by the OS/Driver you won't get any benefit out of it.


### Turn on Readiest

Page file on SSD (especially on other partition than game) definitely outperforms Readiest, the service will be unavailable on systems with SSD. If it's (there) than you use an outdated OS (or it's a bug).


### CPU 核心亲和力 性能/帧数 修复

[See here](https://old.reddit.com/r/starcitizen/comments/5z1ndx/cpu_core_affinity_performancefps_fix/deupoqf/) for an explanation.
