### OC & stability

* Turn off all power features in BIOS. No EIST, C1, C3, C6, etc. Basically lock in the CPU at one speed, and keep it there.
* Rerun Windows System Assessment Tool (WinSAT) after updating drivers, changing hardware or overclocking via 'winsat formal -restart clean'.
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