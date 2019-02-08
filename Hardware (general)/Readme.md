### Devices (common sense tips)

* Disable all integrated audio devices (e.g. nVidia/AMD audio drivers) e.g. if you use an external or add-on soundcardmake sure you disable the internal soundchip unless you're a an _Audio Pro_ which needs seperate devices. 
* Disable all unused integrated peripherals (like e.g. Network, Serial, Parallel Ports, etc.).
* [Disable all unneeded running services](http://www.blackviper.com/service-configurations/black-vipers-windows-10-service-configurations/) via services.msc.

The more drivers Windows has to load the higher the chance is that it affects your IRQ/Latency/Processor. If you e.g. don't use nVidia HD audio driver(s) then just disable/uninstall or prevent from installing it in the first place. Windows then doesn't have to proces seperate devices or do additional calculations which results in a "smoother" gameplay (_lower latency ?_) experience. 


### RAM

Windows 10 manages memory more efficiently than earlier versions of the OS, but more memory always can potentially speed up PC operations, games don't have to write/cache on the slower M2/SSD/HDD and can use the ram more efficent without the need to swap. _16 GB is the current default_. 


### Interrupts

[doctorzeus](https://forums.guru3d.com/members/doctorzeus.275790/) wrote a small utility called [MSIInturruptEnabler](https://github.com/TechtonicSoftware/MSIInturruptEnabler) to enable Message Signal Interrupts on GPU's under Windows. It requires admin rights to use it and a reboot after you applied the new changes.


### Monitor

Make sure you install a correct [ICC Color profile](http://www.tftcentral.co.uk/articles/icc_profiles.htm#install). You can right-click on it and install it or place it manually under `\System32\Spool\Drivers\Color`. You should work with two profiles, one for applications such as Office and one for Gaming (if you have a separate monitor for _gaming only_ you can skip this part and only apply the gaming color profile. 

If possible:
- Go with a IPS panel (yep, even for gaming such as the ASUS ROG PG279Q)
- See if you get a compromise between HZ, Color and viewing angle
- Good reviews are coming from professional sites like [prad.de](https://www.prad.de/), [TFT Central](http://www.tftcentral.co.uk/) or [ExpertReviews](https://www.expertreviews.co.uk/accessories/pc-monitors).
- Make sure that you correctly [calibrate your Monitor](https://www.digitaltrends.com/computing/how-to-calibrate-your-monitor/). In case that you can effort a hardware Colorimeter such as the [i1Display Pro](https://www.xrite.com/categories/calibration-profiling/i1display-pro) prefer this instead. 


### Performance Monitor (perfmon.exe) + Windows Memory Diagnostic (mdsched.exe)

Windows has an integrated Performance Monitor program which checks (together with Eventmgr.msc) your OS/Hardware for problems, you should not disable it - since there are no noticable performance improvements, keep an eye on it here and then to quickly check if there are failures or other problems. It is not necessary to install third-party tools such as HWInfo or AIDA (but in can help in case you quickly want to get a _better_ overview).


### AMD Threadripper/Epyc and the Core Prio "Bug"

![](https://i.imgur.com/S04e1bp.png=250x250)

Threadripper and Epyc CPU's have a serious bug which crippled the performance, [Microsoft and AMD working together to fix this](https://community.amd.com/community/gaming/blog/2018/10/05/previewing-dynamic-local-mode-for-the-amd-ryzen-threadripper-wx-series-processors), however **as a workaround you can use [Bitsum's Coreprio](https://bitsum.com/portfolio/coreprio/)**.


