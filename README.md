# Windows Gaming Tweaks

<p align="center">
  <img width="500" height="320" src="https://raw.githubusercontent.com/CHEF-KOCH/GamingTweaks/master/.github/Pictures/Windows%20Gaming%20Tweaks.jpg")">
</p>

[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/fold_left.svg?style=social&label=Follow%20%40CHEF-KOCH)](https://twitter.com/CKsTechNews)
[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/CHEF-KOCH)
[![Discord](https://img.shields.io/discord/418256415874875402.svg?colorA=7289da&colorB=99aab5&label=Discord&logo=discord&maxAge=60)](https://discord.me/CHEF-KOCH)
[![Tip Me via PayPal](https://img.shields.io/badge/PayPal-tip%20me-green.svg?logo=paypal)](https://www.paypal.me/nvinside)

我的小指南全部是关于_Windows Gaming_, and I really mean Gaming on Windows 10 only! 这里有 [大量过时指南和 myths谬论?](https://github.com/CHEF-KOCH/GamingTweaks/blob/master/Known%20Myths.md) 有关"游戏调整"他们大多数都是错误的, 所以我写了我自己的指南来展示真正会带来不同的东西!


## 总体 "调整" 建议
- [x] **不要** 使用任何 `all-in-one(?一键,整合) tweak(?调整) tools/programs or scripts`, 不值得.
- [x] **要** 经常 **备份** 当前 Windows 10 状态(?环境). 我推荐 [Macrium Reflect](https://www.macrium.com/reflectfree) 或 (_FOSS & cross-platform_) [restic](https://github.com/restic/restic).
- [x] 这里 **没有 Voodoo 调整** 或 `regtweak.awesome.reg` 那些例如提高你的 系统/游戏 性能达 50% 的.
- [x] **自己动手** 不要懒惰 - _使用 脑子.exe 不要照抄网络上的调整!_.


#### 这个指南不是设计为:
- [x] 安全 / 虚拟机 (VM-Virtual Machine)
- [x] 系统加强(Hardening?)
- [x] 单独的游戏调整调整或修改, 为此你可以 [查看 nexusmods](https://www.nexusmods.com/)


#### 关于术语"tweaking(调整)"的澄清
- [x] 调整一般不会魔法般地地增加任何游戏中的 FPS. 系统在某些特殊情况下可以被调整以提升或稳定游戏 [流畅度](https://en.wikipedia.org/wiki/Smoothness), 例如当你限制FPS来处理开销否则可能产生游戏内卡顿.
- [x] 不应通过"通用"脚本或工具随意地应用调整, 因为系统本身随时改变且每个用户的配置也不尽相同. 这就是为什么这个项目不提供一个通用的 _"我的超棒脚本.ps1"_ 脚本的原因.
- [x] 调整被定义为: "延迟调整", "引擎相关提升/变通方法(workarounds?)", "FPS 变通方法/修复", "CPU 使用率" "RAM 使用率", "OS 变通方法", "驱动变通方法" or "网络延迟优化(optimization F!)". 所有的这些都能够对系统造成影响, 游戏或网络性能意味着系统/游戏可能运行得更 _稳定_ (_平滑_) 或在更高的fps上 (例如 如果超频了 或 _优化了_).


#### 信条
- [x] 可能与性能有关的问题应直接报告给微软, 英伟达, AMD 和/或 游戏卡法工作室来解决它们这样每个人都可以受益. 对于公平游戏而言 [更好](https://www.vice.com/en_us/article/43zdnb/battlefield-v-players-are-using-shitty-graphics-for-a-competitive-edge).
- [x] 一个 _完美的系统_ 不需要被调整, 游戏也一样但是由于几个问题这永远不会发生 例如 bugs, 不同的PC配置, 引擎相关问题和更多情况.
- [x] 我不会自称 "调整大师" 但是我是一个有长时间游戏经历的玩家并深刻了解 Windows 内核 (Windows XP - 7).


## 指南索引
* [BIOS 配置 和 提示](Bios/Readme.md)
* [系统 (general)](OS%20(general)/Readme.md)
* [硬件](Hardware%20(general)/Readme.md)
* [DirectX](DirectX/Readme.md)
* [驱动程序](Drivers/Readme.md)
* [AMD 图形处理器](GPU/AMD/Readme.md)
* [nVidia 图形处理器](GPU/nVidia/Readme.md)
* [游戏中的 图形处理器 和 着色器](GPU/Shader/Readme.md)
* [显示器](Monitor/Readme.md)
* [已知的 Myths](Myths/Known%20Myths.md)
* [鼠标](Mouse/Readme.md)
* [网络](Network/Readme.md)
* [RAM](RAM/Readme.md)
* [SSD](SSD/Readme.md)
* [Retro Consoles](Retro%20Consoles/Readme.md)
* [声音](Sound/Readme.md)
* [KB 问题](KB%20problems/Readme.md)


## 我应该买什么硬件?
* [游戏硬件购买指南](Hardware%20(general)/Gaming%20Hardware%20Buyer's%20Guide.md)


## 可选话题 & 工具
* [超频](Overclocking/Readme.md)
* [遥测](Telemetry/Readme.md)
* [改善 & 分析工具](Tools/Readme.md)
* [注册表](Registry/Readme.md)
* [系统设置](OS%20Settings/Readme.md)
* [超棒的游戏网络](https://github.com/MFatihMAR/Awesome-Game-Networking)


## 在Linux上玩游戏
* [Linux游戏调整: 简短概述](Linux%20Gaming/Readme.md)


## 与游戏和系统性能相关的微软官方文档
* [Tips to improve PC performance in Windows 10 by Microsoft](https://support.microsoft.com/en-us/help/4002019/windows-10-improve-pc-performance)
* [Scheduling, Thread Context, and IRQL](http://download.microsoft.com/download/e/b/a/eba1050f-a31d-436b-9281-92cdfeae4b45/IRQL_thread.doc)
* [Inside memory management](https://www.itprotoday.com/compute-engines/inside-memory-management-part-2)
* [Cache and Memory Manager Improvements](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/subsystem/cache-memory-management/improvements-in-windows-server)


## 与Windows支持相关的微软官方文档
* [Windows Health Dashboard](https://docs.microsoft.com/en-us/windows/release-information/status-windows-10-1903)
* [Windows lifecycle fact sheet](https://support.microsoft.com/en-us/help/13853/windows-lifecycle-fact-sheet)


## 错误的调整优化指南示例
* [Win 10 Guide (redacted.tv)](https://redacted.tv/2017/12/20/win10guide/) (_outdated_)
* [How To Tweak Windows 10 For Gaming (back2gaming.com)](http://www.back2gaming.com/guides/how-to-tweak-windows-10-for-gaming/) (_questionable recommendations_)
* [Gaming / PC Optimization / Useful Links & Apps (n1kobg.blogspot.com)](http://n1kobg.blogspot.com/) (_questionable recommendations_)
* [Youtuber: FR33THY Guide](https://docs.google.com/document/d/1nrcQ2EU5512TpuspPF4u5PgZ43p7hoV1cYBMi2C3XSQ/edit) [(video)](https://youtu.be/EG4g9XlKw5w) (_lots of claims with no evidence, interesting questions not getting answered or are off-topic_)


## 正确的调整优化指南示例
* [Mike Martin's Gaming tweaks (mikemartin.co)](http://www.mikemartin.co/gaming_guides)
* [Can You Get More Space Or Speed From Your SSD? (tomshardware.com)](https://www.tomshardware.com/reviews/ssd-performance-tweak,2911-4.html) + [SSD Optimization](https://wiki.debian.org/SSDOptimization)
* [Do we really need swap on modern systems? (redhat.com)](https://www.redhat.com/en/blog/do-we-really-need-swap-modern-systems)
* [Better Tear Control Policies, Game Capture, and GPU Improvements (docs.google.com)](https://docs.google.com/document/d/e/2PACX-1vRZkIJJCVynUPCqZbblmAIoPRx1rDIRLAV9CwjunyAaGm2YpIt_XsmiI8Tx4j_uMAaQ1UYrrWQClwUU/pub) + [Official Thread (forums.guru3d.com)](https://forums.guru3d.com/threads/better-tear-control-policies-game-capture-and-gpu-improvements.425331/)


## 项目调研
* [Windows游戏调整调研](Research/Research.md)
