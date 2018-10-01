@echo off

set CLEAR_EVERY_MINUTES=5
set CLEAR_WHEN_UNDER_MB=512

if %1.==schedule. (goto schedule) else goto setup

:schedule
for /f %%M in ('%SystemRoot%\System32\wbem\wmic.exe OS get FreePhysicalMemory') do set/a FreePhysicalMemory+=%%M >nul 2>nul
set/a ClearWhenUnderKB=1024*%CLEAR_WHEN_UNDER_MB%
if %FreePhysicalMemory% GTR %ClearWhenUnderKB% exit
powershell -NoProfile -c "iex (${%~f0} | out-string)" & exit

:setup
title FreeStandbyMemory
reg query "HKEY_USERS\S-1-5-20\Environment" /v TEMP >nul 2>nul || (
  color 0c & echo. & echo  PERMISSION DENIED! Right-click %~nx0 ^& Run as administrator
  timeout /t 60 & color 0f & title %COMSPEC% & exit/b
)

set "f0=%Windir%\FreeStandbyMemory.bat"
schtasks /query /tn FreeStandbyMemory >nul 2>nul && (
 schtasks /Delete /TN "FreeStandbyMemory" /f >nul 2>nul
 rem del /f /q "%f0%"
 color 0c &echo REMOVED! Run script again to add persistent schedule!
 timeout /t -1 &color 0f &title %COMSPEC% &exit/b
)

echo CLEAR_EVERY_MINUTES=%CLEAR_EVERY_MINUTES%
echo CLEAR_WHEN_UNDER_MB=%CLEAR_WHEN_UNDER_MB%

if /i "%~f0"=="%f0%" (set "COPY2WINDIR=") else echo|set/p=%f0% &copy /y "%~f0" "%f0%" &set "COPY2WINDIR=yes"
schtasks /Create /RU "System" /SC MINUTE /MO %CLEAR_EVERY_MINUTES% /TN "FreeStandbyMemory" /TR "cmd.exe /c call \"%f0%\" schedule" /SD "01/01/2010" /ST "01:00:00" /NP /RL HIGHEST /F
set "stss=-AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan -Minutes 3) -Priority 4 -StartWhenAvailable"
powershell -c "$s=New-ScheduledTaskSettingsSet %stss%; $s.CimInstanceProperties['MultipleInstances'].Value=3; Set-ScheduledTask -TaskName FreeStandbyMemory -Settings $s"
schtasks /Run /TN "FreeStandbyMemory"
echo ADDED! Run %~f0 again to remove persistent schedule!
timeout /t -1
exit /b

$Snippet = @"
using System;
using System.Runtime.InteropServices;

namespace FreeStandbyMemory
{
  public class Program
  {
    static bool retv = false;
    const uint SE_INCREASE_QUOTA_PRIVILEGE = 0x00000005;
    const uint SE_PROF_SINGLE_PROCESS_PRIVILEGE = 0x0000000d;
    const int SystemFileCacheInformation = 0x0015;
    const int SystemMemoryListInformation = 0x0050;
    const int MemoryPurgeStandbyList = 4;
    [DllImport("ntdll.dll")]
    public static extern int RtlAdjustPrivilege(ulong Privilege, bool Enable, bool CurrentThread, ref bool RetValue);
    [DllImport("ntdll.dll")]
    public static extern UInt32 NtSetSystemInformation(int InfoClass, IntPtr Info, int Length);
    [DllImport("kernel32", SetLastError = true, CharSet = CharSet.Unicode)]
    public static extern bool SetSystemFileCacheSize(IntPtr MinimumFileCacheSize, IntPtr MaximumFileCacheSize, Int32 Flags);
    static void Main(string[] args)
    {
      ClearStandbyCache(true);
    }
    public static void ClearStandbyCache(bool ClearFileSystemCache)
    {
      try
      {
        RtlAdjustPrivilege(SE_INCREASE_QUOTA_PRIVILEGE,true,false,ref retv);
        RtlAdjustPrivilege(SE_PROF_SINGLE_PROCESS_PRIVILEGE,true,false,ref retv);
        if (ClearFileSystemCache)
        {
          SetSystemFileCacheSize(IntPtr.Subtract(IntPtr.Zero,1), IntPtr.Subtract(IntPtr.Zero,1), 0);
        }
        int SystemInfoLength = Marshal.SizeOf(MemoryPurgeStandbyList);
        GCHandle gcHandle = GCHandle.Alloc(MemoryPurgeStandbyList, GCHandleType.Pinned);
        NtSetSystemInformation(SystemMemoryListInformation, gcHandle.AddrOfPinnedObject(), SystemInfoLength);
        gcHandle.Free();
      }
      catch (Exception)
      {
      }
    }
  }
}
"@

Add-Type -TypeDefinition $Snippet -Language CSharp

[FreeStandbyMemory.Program]::ClearStandbyCache($true)
# use $false to skip ClearFileSystemCache
exit