@echo off
 
set/a CLEAR_EVERY_MINUTES=5
set/a CLEAR_WHEN_UNDER_MB=512
set/a FILESYSTEMCACHEALSO=1
 
:: check_admin_rights
title FreeStandbyMemory.bat
reg query "HKEY_USERS\S-1-5-20\Environment" /v TEMP >nul 2>nul || (
 color 0c & echo. & echo  PERMISSION DENIED! Right-click %~nx0 ^& Run as administrator
 timeout /t 60 & color 0f & title %COMSPEC% & exit/b
)
 
:: add_remove whenever script is run again
schtasks /query /tn FreeStandbyMemory >nul 2>nul && (
 schtasks /Delete /TN "FreeStandbyMemory" /f 2>nul
 reg delete HKLM\Software\AveYo /v FreeStandbyMemory /f 2>nul
 del /f /q "%Windir%\FreeStandbyMemory.bat" 2>nul
 color 0c &echo. &echo REMOVED! Run script again to add fileless schedule!
 timeout /t -1 &color 0f &title %COMSPEC% &exit/b
)
 
:: setup advanced schedule
set/a FREEMEM=1024*%CLEAR_WHEN_UNDER_MB%
set "ps_c=if( (gwmi win32_OperatingSystem).FreePhysicalMemory -lt %FREEMEM% ){ (Get-ItemProperty Registry::HKLM\SOFTWARE\AveYo).FreeStandbyMemory ^| iex }"
schtasks /Create /RU "System" /SC MINUTE /MO %CLEAR_EVERY_MINUTES% /TN "FreeStandbyMemory" /TR "powershell.exe -noprofile -c \"%ps_c%\"" /SD "01/01/2001" /ST "01:00:00" /NP /RL HIGHEST /F
set "stss=-AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Minutes 3) -Priority 4 -StartWhenAvailable"
powershell -noprofile -c "$s=New-ScheduledTaskSettingsSet %stss%; $s.CimInstanceProperties['MultipleInstances'].Value=3; $null=Set-ScheduledTask -TaskName FreeStandbyMemory -Settings $s"
 
:: export $Snippet to registry for fileless powershell task run
if %FILESYSTEMCACHEALSO% GTR 0 (set "INCLUDE_FILESYSTEMCACHE=$true") else set "INCLUDE_FILESYSTEMCACHE=$false"
set "r1=$txt=(([io.file]::ReadAllText(\"%~f0\") -split '/\*_\*/')[1]).replace(\"`r`n\",'');"
set "r2=$Snippet='$Snippet='''+ $txt +'''; Add-Type -TypeDefinition $Snippet -Language CSharp;"
set "r3=[FreeStandbyMemory.PInvoke]::ClearStandbyCache(%INCLUDE_FILESYSTEMCACHE%); exit'"
set "reg_add=$key='HKLM:\Software\AveYo'; $null=New-Item -Path $key -Force; New-ItemProperty"
powershell -noprofile -c "%r1% %r2% %r3%; %reg_add% -Force -Path $key -Name 'FreeStandbyMemory' -Value $Snippet;"
 
:: trigger task and finish setup
schtasks /Run /TN "FreeStandbyMemory"
echo  Clearing StandbyMemory every %CLEAR_EVERY_MINUTES% minutes ONLY if available memory goes under %CLEAR_WHEN_UNDER_MB% MB
echo ADDED! Run "%~nx0" again to remove fileless schedule!
timeout /t -1
exit /b
 
$Snippet = @"
/*_*/
using System;
using System.Runtime.InteropServices;
 
namespace FreeStandbyMemory
{
  public class PInvoke
  {
    const uint SE_INCREASE_QUOTA_PRIVILEGE = 0x00000005;
    const uint SE_PROF_SINGLE_PROCESS_PRIVILEGE = 0x0000000d;
    const int SystemFileCacheInformation = 0x0015;
    const int SystemMemoryListInformation = 0x0050;
    static int MemoryPurgeStandbyList = 0x0004;
    static bool retv = false;
    [DllImport("ntdll.dll")]
    static extern uint RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool RetValue);
    [DllImport("ntdll.dll")]
    static extern uint NtSetSystemInformation(int InfoClass, ref int Info, int Length);
    [DllImport("kernel32")]
    static extern bool SetSystemFileCacheSize(IntPtr MinimumFileCacheSize, IntPtr MaximumFileCacheSize, int Flags);
    public static void ClearStandbyCache(bool ClearFileSystemCache)
    {
      try
      {
        RtlAdjustPrivilege(SE_INCREASE_QUOTA_PRIVILEGE,      true, false, ref retv);
        RtlAdjustPrivilege(SE_PROF_SINGLE_PROCESS_PRIVILEGE, true, false, ref retv);
        if (ClearFileSystemCache) SetSystemFileCacheSize(IntPtr.Subtract(IntPtr.Zero, 1), IntPtr.Subtract(IntPtr.Zero, 1), 0);
        NtSetSystemInformation(SystemMemoryListInformation, ref MemoryPurgeStandbyList, Marshal.SizeOf(MemoryPurgeStandbyList));
      }
      catch (Exception)
      {
      }
    }
  }
}
/*_*/
"@
 
Add-Type -TypeDefinition $Snippet -Language CSharp;
 
[FreeStandbyMemory.PInvoke]::ClearStandbyCache($true);
