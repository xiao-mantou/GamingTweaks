### FreeSync Gaming on Nvidia (Adaptive Sync)

Open the Nvidia Control Panel, browse to “Set up G-Sync”, then select your FreeSync monitor. From here, make sure both the “enable G-Sync, G-Sync compatible” checkbox and the “enable settings for the selected display model” checkbox are ticked. The second checkbox doesn’t appear if the monitor is G-Sync certified. Then click Apply, your monitor will restart and adaptive sync will be enabled.


### nVidia (Image Quality [IQ] improvements)

* Antialiasing - Transparency > Supersampling
* Maximum Pre-Rendered Frames > 0 (minimizing first person shooters visual latency, optimizing hit registration)
* Multi-display/mixed-GPU acceleration> Single display performance mode (if only one screen)
* Texture filtering - Quality > High quality
* Threaded optimization > On


### nVidia Shader Cache on a HDD

* Shaders are loaded by the game itself, like any other of their assets, and sent to the driver for compilation (meaning transformed from source code form into binary form that can be used by the GPU.) The driver compiles them and sends the results back to the game. The compilation happens by the CPU, not the GPU, and is slow. A shader cache doesn't get rid of the loading-from-disk step. It only replaces the compilation step with a second loading step (loading the previously compiled form of the shader from disk and sending that to the game.) Even with a very slow disk, loading small already compiled shader files from said disk is much faster than generating them again. The shader cache is meant to persist between reboots. Putting them on a RAM disk meaning losing the cache on reboot - unless you're syncing the RAM disk to disk on reboot.