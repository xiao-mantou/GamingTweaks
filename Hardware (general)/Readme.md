### Devices

* Disable all integrated audio devices if you use an add-on soundcard, only Audio Pro's might need several soundcards for different out-/input devices.
* Disable all unused integrated peripherals (like e.g. Network, Serial, Parallel Ports, etc.)
* Disable all unneeded running services (services.msc)
* The more drivers Windows loads the higher the chance is that it affects your IRQ/Latency/Processor which means, if you e.g. don't use nVidia HD audio driver then just disable/uninstall or prevent from installing it in the first place.


### Interrupts

[doctorzeus](https://forums.guru3d.com/members/doctorzeus.275790/) wrote a small utility called [MSIInturruptEnabler](https://github.com/TechtonicSoftware/MSIInturruptEnabler) to enable Message Signal Interrupts on GPU's under Windows. It requires admin rights to use it and a reboot after you applied the new changes.


### Monitor

Make sure you install a correct [ICC Color profile](http://www.tftcentral.co.uk/articles/icc_profiles.htm#install). You can right-click on it and install it or place it manually under `\System32\Spool\Drivers\Color`. You should work with two profiles, one for applications such as Office and one for Gaming (if you have a separate monitor for _gaming only_ you can skip this part and only apply the gaming color profile. 

If possible:
- Go with a IPS panel (yep, even for gaming such as the ASUS ROG PG279Q)
- See if you get a compromise between HZ, Color and viewing angle
- Good reviews are coming from professional sites like [prad.de](https://www.prad.de/), [TFT Central](http://www.tftcentral.co.uk/) or [ExpertReviews](https://www.expertreviews.co.uk/accessories/pc-monitors).
- Make sure that you correctly [calibrate your Monitor](https://www.digitaltrends.com/computing/how-to-calibrate-your-monitor/). In case that you can effort a hardware Colorimeter such as the [i1Display Pro](https://www.xrite.com/categories/calibration-profiling/i1display-pro) prefer this instead. 
