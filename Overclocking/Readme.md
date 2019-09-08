### General OC & stability

* Turn off all power features in your current BIOS settings. **No EIST, C1, C3, C6, etc**. Lock the CPU (cores) at one speed, and keep it there otherwise you might see BSOD's or other application related crashes during your tests/benchmarks!
* (_optional_ - to test the stability) Rerun Windows System Assessment Tool (WinSAT) after updating your drivers, changing hardware or overclocking via 'winsat formal -restart clean'.
* Setting `dynamictick` & `tscsyncpolicy` might helps to increase the stability. An official explanation is given over [here](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/bcdedit--set).

```bash
//Enable dynamictick & tscsyncpolicy
bcdedit /set useplatformclock true
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set disabledynamictick yes

// Remove dynamictick & tscsyncpolicy (OS default)
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue tscsyncpolicy
bcdedit /deletevalue disabledynamictick
```


## AMD specific


#### RAM OC on Zen

Overclocking isn't just about getting more MHz it also means and requires that you understand how your hardware works. RAM overclocking is critical because it might instantly results in crashes, BSOD's or freezes when done wrong. Reading the correct values is mandatory and helps to find the _best OC potential_ and also helps with the CPU limitations, especially on AM4- & TR4-systems.


* Download [DRAM Calculator for Ryzen utility](https://www.techpowerup.com/download/ryzen-dram-calculator/) - it's free
* Follow the [step-by-step guide](https://www.techpowerup.com/reviews/AMD/Ryzen_Memory_Tweaking_Overclocking_Guide/)
* (_optional_) Taiphoon Burner tool (see reference) is a useful free program to read-out your current DRAM configuration, which can be exported as HTML-Report. You can import the file into DRAM Calculator in order to start with the correct values. This helps to calculate a more specific OC-Profile based on your RAM-Kit.


#### Boost (Turbo)

[AMD confirmed an firmware issue](https://twitter.com/AMDRyzen/status/1168901636162539536?ref_src=twsrc%5Etfw) with the (latest) AMD Ryzen-3000-CPUs (Fam.: Matisse). This problem lead into a reduced turbo clock speed. A firmware update (Bios update v46.44.00) is planned for Sept. 10, 2019, see [here](https://twitter.com/1usmus/status/1168911500586749959?ref_src=twsrc%5Etfw). 


### Reference & Tools
* [AMD Ryzen Memory Tweaking & Overclocking Guide](https://www.techpowerup.com/reviews/AMD/Ryzen_Memory_Tweaking_Overclocking_Guide/)
* [HCI MemTest](https://hcidesign.com/memtest/)
* [Taiphoon Burner](http://www.softnology.biz/)
