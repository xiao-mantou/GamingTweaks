### Devices

* Disable all integrated audio devices if you use an add-on soundcard, only Audio Pro's might need several soundcards for different out-/input devices.
* Disable all unused integrated peripherals (like e.g. Network, Serial, Parallel Ports, etc.)
* Disable all unneeded running services (services.msc)
* The more drivers Windows loads the higher the chance is that it affects your IRQ/Latency/Processor which means, if you e.g. don't use nVidia HD audio driver then just disable/uninstall or prevent from installing it in the first place.


### Interrupts

[doctorzeus](https://forums.guru3d.com/members/doctorzeus.275790/) wrote a small utility called [MSIInturruptEnabler](https://github.com/TechtonicSoftware/MSIInturruptEnabler) to enable Message Signal Interrupts on GPU's under Windows. It requires admin rights to use it and a reboot after you applied the new changes.
