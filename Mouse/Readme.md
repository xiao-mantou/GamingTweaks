## What is mouse smoothing and why is it bad (for gaming)?

Modern gaming [mice](https://en.wikipedia.org/wiki/Computer_mouse) are _very accurate_ when it comes to reporting where their users are moving the mouse, but older sensors were not nearly as accurate as the mice with optical sensors that we have nowadays. 

Overall spoken [mouse smoothing](https://www.codeproject.com/Articles/5247322/Mouse-Smoothing) is the interpolation of raw input data from the mouse in order to prevent jerky movement in low resolution mice while Mouse acceleration is a setting where the cursor distances increases if the mouse is moved quickly.

Gaming wise you want your mouse to register your movements as "raw" as possible. Any software or hardware based attempt to alter what is being shown on screen can negatively affect your performance.

Mouse tweaks provides more detailed configuration of mouse cursor behavior. It provides a range of accessibility enhancements as well a power-user features, including mouse gestures.

### Disabling pointer precision 

Mouse acceleration increases the speed of your mouse cursor based on the speed you move your mouse. This might sound like a good idea but it causes problems - if you move your mouse from point A to point B then you'd expect your cursor to do the same thing each time you move the mouse between those two points; with acceleration enabled it won't because you'll vary the speed that you move the mouse between those two points and end up with inconsistent aiming. 

You can do this within Windows 10 "Mouse settings" or via registry. Some engines (games) providing also an option via GUI/CMD to adjust the "Raw Input", check if you game includes such an option before you globally disable pointer precision.

In some situations Windows 10 or your mice driver do not show any option to disable it, so the most reliable solution is to toggles this via registry. The corresponding key is located at `HKEY_CURRENT_USER\Control Panel\Mouse`, we want to change the two entries called `SmoothMouseXCurve` and `SmoothMouseYCurve`.

```bash
//SmoothMouseXCurve

00,00,00,00,00,00,00,00
00,a0,00,00,00,00,00,00
00,40,01,00,00,00,00,00
00,80,02,00,00,00,00,00
00,00,05,00,00,00,00,00

//SmoothMouseYCurve

00,00,00,00,00,00,00,00
66,a6,02,00,00,00,00,00
cd,4c,05,00,00,00,00,00
a0,99,0a,00,00,00,00,00
38,33,15,00,00,00,00,00 
```

### Mouse polling rate
* You could change your [mouse polling rate](https://www.howtogeek.com/182702/mouse-dpi-and-polling-rates-explained-do-they-matter-for-gaming/) down from 1000hz to 250hz/120hz because _sometimes_ it can redude the overall mouse lag for some specific games or game engines. Keep in mind that this tweak is _optional_ because in most of the cases 1000hz works just fine (depending on the used mouse driver). 


### Sensitivity
Take your [mouse sensitivity from another game](https://www.mouse-sensitivity.com/), see if it helps you but at the end you must decide if you like it or not. 


### Placebo "tweaks" and promises
There is no 'pro aim' tweak, just give yourself time to progress. Play hard go pro - yep it's true!
