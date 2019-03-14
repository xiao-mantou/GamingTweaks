### Monitor Overclocking

* [GamersNexus](https://www.gamersnexus.net/guides/1674-overclock-monitor-higher-refresh-rate) has a nice guide to get started into the topic - worth to read!

Why overclock your Monitor?
-------------

* Higher Refresh Rate(s)
* Custom Resolution
* Fix/Correct missing/wrong [EDID](https://en.wikipedia.org/wiki/Extended_Display_Identification_Data) values
* Correct/change or expand FreeSync range(s)
* _Smoother fps gameplay_


Possible Disadvantages
-------------

* Artifacts or no picture output 
* The settings you made must be imported and applied manually after each new driver installation (import/export)
* Skipped frames (even if the monitor accepted the new values and everything seems "fluid")
* HDCP might break or DRM fails
* Color _might be_ changed after applying the changes use [Color Sustainer](http://www.guru3d.com/files-details/color-sustainer-download.html) to correct this. (This is a OS issue!)


Possible Risks?
-------------

**None** (!), every change is temporarily until you approved the change. You can import/export profiles and backup the current states before you do any serious change. The hardware itself will not be affected in case something went wrong. 


Tools needed
-------------

* [Custom Resolution Utility (CRU)](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)
* (optional) [AMD/ATI Pixel Clock Patcher](https://www.monitortests.com/forum/Thread-AMD-ATI-Pixel-Clock-Patcher)
* (optional) [NVIDIA Pixel Clock Patcher](https://www.monitortests.com/forum/Thread-NVIDIA-Pixel-Clock-Patcher)



### Color profile(s)

Make sure you install a correct [ICC Color profile](http://www.tftcentral.co.uk/articles/icc_profiles.htm#install). You can right-click on it and install it or place it manually under `\System32\Spool\Drivers\Color`. You should work with two profiles, one for applications such as Office and one for Gaming (if you have a separate monitor for _gaming only_ you can skip this part and only apply the gaming color profile. 

If possible:
- Go with an IPS panel (yep, even for gaming such as the ASUS ROG PG279Q)
- See if you get a compromise between HZ, Color and viewing angle
- Good reviews are coming from professional sites like [prad.de](https://www.prad.de/), [TFT Central](http://www.tftcentral.co.uk/) or [ExpertReviews](https://www.expertreviews.co.uk/accessories/pc-monitors).
- Make sure that you correctly [calibrate your Monitor](https://www.digitaltrends.com/computing/how-to-calibrate-your-monitor/). In case that you can effort a hardware Colorimeter such as the [i1Display Pro](https://www.xrite.com/categories/calibration-profiling/i1display-pro) prefer this instead.


### FPS capping

Why is capping the FPS important?
---------------

There is an detailed answer [here](https://www.blurbusters.com/howto-low-lag-vsync-on/) in short: you should **ALWAYS CAP THE FPS** which results in a smooth stutter and lag-free experience. RTSS Rivatuner Statistics Server is more accurate than most (not all) in-game FPS limiter, the nVidia own limiter adds some delay to it and is not recommend to use!
