### Nvidia FPS Limiter v3 vs RTSS

Starting with [441.87](https://github.com/CHEF-KOCH/nVidia-modded-Inf/releases/tag/441.87) nVidia added their own FPS Limiter (v3) in the NV control panel. You might [ask yourself](https://youtu.be/W66pTe8YM2s) what are the differences between [RTSS](https://www.guru3d.com/files-details/rtss-rivatuner-statistics-server-download.html) and nVidia's solution and which solution should you prefer?

**Overall:**
- The frametime is more consistent with RTSS because this is how RTSS works. 
- nVidia's solution does not allow you to change the frame rate without restarting the game, this works in RTSS. nVidia could fix or change that in the future.
- Every overlay you use, no matter what program will add a small delay!
- NVIDIA Inspector old limiter (v2) and AMD's Chill adding the most inpout delay.

**RTSS Pros:**
- _Nice_ GUI
- RTSS settings be be easily backuped
- Fractional limits (to reduce V-Sync input) can be set, no other tools allows that
- Allows to change per each game individual settings
- RTSS has global settings, and individual exe files settings

**Cons:**
- Adds a frame of [input delay](https://www.youtube.com/watch?v=rs0PYCpBJjc), to workaround it use the default ("Global" profile)
- It's an seperate third-party tool which needs to run in the background
- Can interfere with steam's overlay feature
- Can crash specific games, depending on the settings and used injection method
- Some games will not start while injecting the overlay into it
- Some games can detect the injection method as "cheat" and disconnect or at worst, ban you!

**nVidia Frame Limiter Pros:**
- No third-party programs needed! Less background services are running.
- No per-game setting, you need to set the frame limit globally OR via the specific game profile which is a bit clunky

**Cons:**
- No _fancy_ GUI
- Not as advanced as RTSS
- Some games (once the limiter is enabled) having problems showing the in-game overlays


### FreeSync Gaming on Nvidia (Adaptive Sync)

Open the Nvidia Control Panel, browse to “Set up G-Sync”, then select your FreeSync monitor. From here, make sure both the “enable G-Sync, G-Sync compatible” checkbox and the “enable settings for the selected display model” checkbox are ticked. The second checkbox doesn’t appear if the monitor is G-Sync certified. Then click Apply, your monitor will restart and adaptive sync will be enabled.


### Control Panel and it's toggles 

[TweakGuides](http://www.tweakguides.com/NVFORCE_6.html) has a full documentation what each toggle/settings in the nVidia Control Panel (NVCP) does, I highly suggest that you read it before you touch any of the settings. The Guide constantly gets updates as soon nVidia changes something in the NVCP. The default settings are usually fine and you might only want to tweak the application/game settings related profiles, which you can do via the NVCP or [nVidia Inspector](https://github.com/DeadManWalkingTO/NVidiaProfileInspectorDmW) (unofficial utility).


### nVidia Shader Cache on a HDD

Shaders are loaded by the game itself, like any other of their assets, and sent to the driver for compilation (meaning transformed from source code form into binary form that can be used by the GPU.) The driver compiles them and sends the results back to the game. The compilation happens by the CPU, not the GPU, and is slow. A shader cache doesn't get rid of the loading-from-disk step. It only replaces the compilation step with a second loading step (loading the previously compiled form of the shader from disk and sending that to the game.) Even with a very slow disk, loading small already compiled shader files from said disk is much faster than generating them again. The shader cache is meant to persist between reboots. Putting them on a RAM disk meaning losing the cache on reboot - unless you're syncing the RAM disk to disk on reboot.


### How to get Windows 10 custom resolutions in any aspect ratio you want

[jim2point0](https://www.deadendthrills.com/forum/discussion/504/how-to-custom-aspect-ratios-and-resolutions-via-dsr-nvidia-only) wrote an excellent guide how to _optimize_ nVidia's DSR via registry in order to get any resolution you want. 
