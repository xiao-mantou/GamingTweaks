## Official solution

Microsoft official provides a tool (script) to toggle [Device Guard](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-device-guard).


### Steps
* Download this tool/script from Microsoft](https://www.microsoft.com/en-us/download/details.aspx?id=53337).
* Open PowerShell and type `Set-ExecutionPolicy Unrestricted` which is needed to execute the script (security protection mechanism from PowerShell).
* Run Powershell as administrator and follow this steps, to disable DG and/or CG type `DG_Readiness_Tool_v3.6 -Disable`
* Restart the PC (_killing/restarting explorer.exe is not enough!_) you also can use `-AutoReboot` flag after `-Disable` to automate the process.


## Checking the current status

* `DG_Readiness_Tool_v3.6.ps1 -Ready`, alternative you also can use `-Status` or work with the internal tool Windows provides called `msinfo32.exe` which shows not only Credential Guard infos, it's basically a overview tool to get important infos about your hardware/os etc.
