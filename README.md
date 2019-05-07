# Windows Gaming Tweaks

<p align="center">
  <img width="500" height="320" src="https://raw.githubusercontent.com/CHEF-KOCH/GamingTweaks/master/.github/Pictures/Windows%20Gaming%20Tweaks.jpg")">
</p>

[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/fold_left.svg?style=social&label=Follow%20%40CHEF-KOCH)](https://twitter.com/CKsTechNews)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/CHEF-KOCH)
[![Discord](https://img.shields.io/discord/418256415874875402.svg?colorA=7289da&colorB=99aab5&label=Discord&logo=discord&maxAge=60)](https://discord.me/CHEF-KOCH)
[![Tip Me via PayPal](https://img.shields.io/badge/PayPal-tip%20me-green.svg?logo=paypal)](https://www.paypal.me/nvinside)

My little guide is all about _Windows Gaming_, and I really mean Gaming on Windows 10 only! There exist [tons of outdated guides and myths](https://github.com/CHEF-KOCH/GamingTweaks/blob/master/Known%20Myths.md) when it comes to "game tweaking" but they are mostly wrong, so I wrote my own guide to show the things which really do make the difference!

General advice:

- [x] **Do not** use any all-in-one 'tweak tools/programs or scripts', it's not worth it.
- [x] **Do** always a **backups** of your current Windows 10 state. I recommend [Macrium Reflect](https://www.macrium.com/reflectfree).
- [x] There is **no Voodoo tweak** or `regtweak.awesome.reg` which  increases your OS/Game performance like 50%.
- [x] **Do it yourself** and don't be lazy - _use brain.exe and do not copy tweaks from the internet!_.


What this guide is not for:

- [x] Security / Virtual Machine (VM)
- [x] General OS Hardening
- [x] Single Game specific only tweaks and modifications


Clarifications regarding the term "tweaking":

- [x] Tweaks usually do not increase any in-game FPS, there are specific circumstances in which the OS can be tweaked to improve or stabilize the FPS e.g. when you cap the FPS to e.g. get rid of the overheap which otherwise would have result in stuttering.
- [x] Tweaks should not be randomly applied via a "universal" script/tool because the OS itself changes over time and the configuration is different for each user. This is the reason why I don't provide a _"myawesomescript.ps1"_ script.
- [x] Tweaks are defined by: "Latency tweaks", "Engine related workarounds", "FPS workarounds", "CPU usage" "RAM usage", "OS Workarounds", "Driver workarounds" or "Network latency tweaks". All of can have an impact on the OS which means the OS might runs more stable (stable: more FPS, better input or network latency or other things which improve the gaming experience).


Philosophy:
- [x] Possible performance related problems should be reported directly to Microsoft, nVidia, AMD and/or the Game Develop Studio to address them so that everyone gets the same benefit.
- [x] A perfect OS does not need to be tweaked, the same goes for games in general but that will never happen due to several things e.g. bugs, different PC configurations, Engine related problems, etc.
- [x] I do not claim to be the "tweak master" but I'm a long time experienced gamer and had the chance to get an insight into the Windows kernel (Windows XP - 7).


## Guide Index
* [BIOS Configuration and Tips](Bios/Readme.md)
* [OS (general)](OS%20(general)/Readme.md)
* [Hardware](Hardware%20(general)/Readme.mdd)
* [DirectX](DirectX/Readme.md)
* [Drivers](Drivers/Readme.md)
* [GPU AMD](GPU/AMD/Readme.md)
* [GPU nVidia](GPU/nVidia/Readme.md)
* [GPU and Shader in Games](GPU/Shader/Readme.md)
* [Monitor](Monitor/Readme.md)
* [Known Myths](Myths/Known%20Myths.md)
* [Mouse](Mouse/Readme.md)
* [Network](Network/Readme.md)
* [RAM](RAM/Readme.md)
* [SSD](SSD/Readme.md)
* [Sound](Sound/Readme.md)


## Optional Topics & Programs
* [Overclocking](Overclocking/Readme.md)
* [Telemetry](Telemetry/Readme.md)
* [Tools to improve & analyse](Tools/Readme.md)
* [Registry](Registry/Readme.md)
* [OS Settings](OS%20Settings/Readme.md)


## Official Microsoft Docs related to gaming and OS performance
* [Tips to improve PC performance in Windows 10 by Microsoft](https://support.microsoft.com/en-us/help/4002019/windows-10-improve-pc-performance)
* [Scheduling, Thread Context, and IRQL](http://download.microsoft.com/download/e/b/a/eba1050f-a31d-436b-9281-92cdfeae4b45/IRQL_thread.doc)
* [Inside memory management](https://www.itprotoday.com/compute-engines/inside-memory-management-part-2)
* [Cache and Memory Manager Improvements](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/subsystem/cache-memory-management/improvements-in-windows-server)


## Negative examples
* [Win 10 Guide (redacted.tv)](https://redacted.tv/2017/12/20/win10guide/) (outdated)
* [How To Tweak Windows 10 For Gaming (back2gaming.com)](http://www.back2gaming.com/guides/how-to-tweak-windows-10-for-gaming/) (questionable recommendations)
* [Gaming / PC Optimization / Useful Links & Apps (n1kobg.blogspot.com)](http://n1kobg.blogspot.com/) (questionable recommendations)


## Positive examples
* [Mike Martin's Gaming tweaks (mikemartin.co)](http://www.mikemartin.co/gaming_guides)
* [Can You Get More Space Or Speed From Your SSD? (tomshardware.com)](https://www.tomshardware.com/reviews/ssd-performance-tweak,2911-4.html) + [SSD Optimization](https://wiki.debian.org/SSDOptimization)
* [Do we really need swap on modern systems? (redhat.com)](https://www.redhat.com/en/blog/do-we-really-need-swap-modern-systems)
* [Better Tear Control Policies, Game Capture, and GPU Improvements (docs.google.com)](https://docs.google.com/document/d/e/2PACX-1vRZkIJJCVynUPCqZbblmAIoPRx1rDIRLAV9CwjunyAaGm2YpIt_XsmiI8Tx4j_uMAaQ1UYrrWQClwUU/pub) + [Official Thread (forums.guru3d.com)](https://forums.guru3d.com/threads/better-tear-control-policies-game-capture-and-gpu-improvements.425331/)


## Project Research
* [Windows Gaming Tweaks Research](Research/Research.md)
