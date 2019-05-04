### Integrated Telemetry into games (e.g. DRM, Redshell & Co.) and Game Clients

Some games (not all) including copyright systems like Denuvo (DRM) checks or [Redshell](https://docs.google.com/spreadsheets/d/e/2PACX-1vQz1d2jf15nHZE8GaRDAWCVMWuYkhip_cwkDUD3fo9dn0EiDRG3crtNXNhPESz8ZLL2KVDULnm9D-VB/pubhtml) in order to spy & log the gamers activity which has an negative impact of the game performance itself ([longer loading times](https://www.youtube.com/watch?v=ByfLg9wGB4o), FPS drops or even crashes). A filter-list to prevent such stuff can be found [here](https://github.com/CHEF-KOCH/CKs-FilterList).

Keep in mind that [telemetry](https://en.wikipedia.org/wiki/Telemetry) has (in normal cases) no affect on the gaming performance (if proper implemented) and you should consider to leave it enabled in order to help the game developers (e.g. for crash reports or to improve the anti-cheat mechanism) however, such systems scanning your entire OS and this might invade your privacy.

The biggest impact on the game performance itself is done by the copyright-protection system and its implementation and _can have_ a negative impact which results in longer loading times or _small_ FPS drops. The rumour that Denuvo cripples your performance is not _entirely_ true, it's depending on several factors in most cases you [lose around 2-3 FPS](https://www.extremetech.com/gaming/282924-denuvo-really-does-cripple-pc-gaming-performance) (which is considerable not "crippled" - depending how you see it).

My own advice is:
- Use GOG releases because they are DRM free
- Play cracked versions (malware risk) or performance issue while "testing" it in a VM
- Check if there are _confirmed_ and _clean_ cracks from trusted groups which avoids losing performance via VM/Sandbox (as mentioned above) but the risk is still there that you get infected (via re-packs, drive-by, Malvertising etc).
- Check if you [need the Game Client](https://www.resetera.com/threads/developing-epic-games-launcher-appears-to-collect-your-steam-friends-play-history-epic-responds-see-op.105385/) and read the privacy policy before you install it on your OS!
- Manually removing the analytics code requires to manipulate the game client and it's files and is _dangerous_ because that might result in a ban, the game client should provide an opt-out toggle for such tracking. A better method is to block the request with a firewall/hosts file.


## In which cases Telemetry has no impact on the OS / gaming performance

- Depending how well it is [implemented (example)](https://github.com/matthewhorridge/telemetry), telemetry (the running processes) never uses much resources (_depending how you define "much"_)
- Telemetry can run in the background or even without user consent, the best scenario would be if you can [manually control it opt-in/opt-out](https://blogs.windows.com/buildingapps/2014/03/20/instrumenting-your-app-for-telemetry-and-analytics/) and submit only telemetry when you want it
- Checks could be integrated to scan the current running applications and if they are currently in fullscreen or not (e.g games)
- The Telemetry and his task schedule can be configured to run only on specific circumstances e.g. if the PC is idle
- Depending on how big the submitted data are or how small they are you will never notice it (not in-game and not while you use other applications)
