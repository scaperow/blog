---
title: "开源免费绘画AI：Stable Diffusion本地安装部署和使用步骤"
date: 2023-03-16 08:35:33
updated: 2024-11-07 14:53:27
abbrlink: "dSdqVR"
categories:
  - "未分类"
  - "随录"
halo_name: "461"
halo_permalink: "/archives/dSdqVR"
---

**注意，本文章部署的是基于命令行的stable diffusion，如果需要GUI请移步webgui版，网页版 <https://huggingface.co/spaces/stabilityai/stable-diffusion>**

前几天看到现在AI绘画好像有点东西，就想自己来试试搞一个玩玩。目前你可以在网上找到网页版的AI绘图，但网页版的由于能输入的参数有限，无法发挥stable diffusion的全部功能（某些无良网站说不定还要收你钱，交智商税了属于是）。今天来讲讲如何在自己电脑上安装一个stable diffusion，不但不用交智商税还能使用更多功能。

最开始的时候我安装的是main支的（github链接：<https://github.com/CompVis/stable-diffusion>），但是按照他给的步骤安装后死活用不了，一用就报错，各种报错都有（包括缺少moduel），你pip install 缺少的库没用，删除虚拟环境后重新安装也不顶用，于是后来到处找资料，终于找到一个靠谱的（链接https://kil0bit.blogspot.com/2022/09/how-to-install-stable-diffusion-on.html 感谢这位大佬的文章指点），下面主要讲一讲如何安装这个AI，按步骤来基本上不会不成功（由于需要下载包，有可能要挂梯子才行）。 **步骤尽量不要搞错顺序，指不定就会遇到各种各样的问题，会报错导致无法使用。**

# **下载Anaconda**

anaconda相信做python和ai相关的朋友们应该都知道，没用过的也没关系，你去下载一个安装好就行，官网链接https://www.anaconda.com/products/distribution#macos 你要是实在不知道怎么安装，可以自己去百度知乎看看别人的教程，这里不多讲了。我的anaconda安装在D盘，也就是D:Anaconda

# **下载stable diffusion**

从GitHub上下载stable diffusion本体，如果你的显卡够牛逼，显存够大（10GB），那么你可以选择下载main支（<https://github.com/CompVis/stable-diffusion>），但是 **不推荐** ，因为我之前下载这个安装老是出问题，一用就报错。 **推荐下载**lstein 大佬fork的InvokeAI支（<https://github.com/invoke-ai/InvokeAI>），这个分支和main支的区别是这个支 **对显卡的要求低** ，基本上显存有个4G甚至更低都能用，其他功能都和main支是一样的。

![](/images/55b5cc427d9439e9a9d6e27e482df5d5-638adb6d51.webp)

下载的时候点 **Code** 按钮的Download Zip，下载好后解压到你喜欢的地方，我选择直接解压到C盘，也就是C:InvokeAI-main。按照习惯给这个文件夹重命名一下，就变成了C:stable-diffusion

![](/images/a9b0c304698357c16e1a8e2684faef02-4fd878c8ba.webp)

此时你的文件夹看上去应该是这个样子

# **下载模型包**

模型包就是stable diffusion的灵魂，也就是开发者耗尽无数心血训练出来的绘画模型。不同的模型画出来的画是不一样的，模型可以换，下面以官方的默认模型做演示。stable diffusion提供了模型包的下载，在https://huggingface.co/CompVis/stable-diffusion-v-1-4-original 这个网站需要注册，自己去注册一个账号，注册好后点击这个Access repository才能下载模型（所有模型都必须先点这个按钮才能下载）

![](/images/3d88770490b75d16d493ba3fee4c971e-5836997b74.webp)

点完之后，点Files and versions

![](/images/5e3382c9efcb6e75b4210ab326313f27-196f3e4172.webp)

红色框框圈出来的两个文件，一个大一个小，随便下哪个都行，不过大的应该更好，我下的大的。

# **安装模型包**

先进入stable-diffusionmodelsldm，然后新建一个文件夹叫stable-diffusion-v1

![](/images/73a9eb9ff5c8950e704cc7d8c4f9f2ed-da6751ca5f.webp)

之后，把刚刚下载的模型包重命名为model.ckpt移动到这个stable-diffusion-v1文件夹中，如图所示

![](/images/015a038838b6b17c839726ca9bbbff34-77bc1ad204.webp)

至此，模型的安装就做好了，如果这一步没做对，到时候AI就找不到模型，运行不了

# **搭建虚拟环境**

这一步开始就要用到刚刚下载好的anaconda了，进入anaconda有两种方式，一种是直接进anaconda，另一种是通过cmd进去，这两种方法没有区别，要是搞不明白就按照我的办法来吧。因为这一步需要下载文件（挺大的，好几个G吧），我挂了梯子（不挂梯子行不行我不知道），而一般梯子只能支持cmd代理，没法给所有应用都代理上（当然如果你有全局代理就不用管了），所以我选择开cmd进入anaconda。先打开cmd（按Win+R输入cmd），进入anaconda的安装位置（我安装在D:Anaconda）下的Scripts文件夹。

提示：cmd打开默认在C盘下， **如果需要切换盘符，不能使用cd命令，而是直接输入盘符名称** （我的是D:），注意标点符号要用英文的。当进入你想要的盘符后，就可以使用cd命令进入你想进入的位置，用法是 **cd 路径**

进入scripts文件夹后，输入 **activate base**

![](/images/277c76d6e84b29453a4ae3319e563e63-33c26314cf.webp)

从cmd进入anaconda的步骤

这样，就成功从cmd进入anaconda了。当然你可以直接进入anaconda，直接桌面左下角搜索anaconda，点开就能进去

![](/images/c1e0360cac569749efad63f4763a869e-ebac59b92c.webp)

直接进去就行，不需要多余的步骤。我用cmd进去纯粹是因为我的梯子不支持全局代理，只能代理cmd（我用的Clash）。

![](/images/68a76783e291ee01687fc7f4f6f0d9fd-94e1cfb0b6.webp)

直接打开anaconda

进入anaconda之后，需要进入stable diffusion的文件夹（我的是C:stable-diffusion），方法和上面一样，可以看我的图

![](/images/4f41d53110a9a6ba361aaae50b5cc173-2403f89580.webp)

进去之后，就可以开始创建虚拟环境了。输入 **conda env create -f environment.yaml**

这一步会下载很多东西，有点费时间，你慢慢等就行， **切记不要中途中断** （比如直接把anaconda的窗口关了）， **如果你中断了，那么你需要先删除这个“半成品虚拟环境”再重新创建虚拟环境** 。方法是输入 **conda remove -n ldm --all**

这是删除虚拟环境的指令，输入这个指令后他会问你是否移除下列包，你需要输入y/n（也就是yes/no），输入 **y** 即可。

搭建成功后，你的界面应该是这样的（如果不是这样的，比如说一堆红字或者报错，那么就说明虚拟环境搭建失败，需要使用 **conda remove -n ldm --all** 删除虚拟环境并重新用 **conda env create -f environment.yaml** 搭建。如果还是搭建失败的话，那就挂梯子吧）

![](/images/d81e804090d63850e721d2acc8b1a1f6-48e3117fe2.webp)

# **预加载模型**

搭建成功后，输入 **conda activate ldm** 来进入我们搭建好的虚拟环境（这个虚拟环境名称叫ldm），然后输入 **python scriptspreload\_models.py** 来预加载模型。这一步同样需要下载很多东西

![](/images/f9ab47316229aa50cc4d243d8c4c8706-8c579cb361.webp)

下载好后，你的界面应该是下面这样的

![](/images/6b469af5746a4d171114349b794463f8-92479ff4e9.webp)

看见下面那个success就成功了。至此，stable diffusion的全部安装步骤已经完毕。如果没有安装成功，那就删掉虚拟环境从头再来，能挂梯子就挂梯子。

# **使用Stable Diffusion**

这个InvokeAI支使用方法和main支稍微有些不一样，为了使用它，你需要先 **从anaconda进入stable diffusion文件夹，再启用ldm虚拟环境** （参看上文，这里不多讲），然后输入 **python scripts/dream.py** 之后（这一步是初始化），就可以使用stable diffusion了。如果需要给stable diffusion传递初始参数，可以使用 **python scripts/dream.py -h** 来查看可以传递哪些初始参数（如计算精度等），例如以全精度模式启动stable diffusion的指令就是 python scripts/dream.py -F

![](/images/b8de58f99f9b711166cbd96b1957b52d-98d961530a.webp)

如果你不知道如何使用stable diffusion，可以输入 **-h** 来获取帮助，里面详细介绍了指令格式和各个参数，这里不多讲

![](/images/f9ac56471574990f328a75cb40f77e8c-842db684c7.webp)

例如，要生成一个玫瑰花园的图片，指令是 "Rose flower garden" -W512 -H512 -s100 -n1 ，其中第一个参数用来描述你想生成的图片，需要用英文描述，引号可加可不加，我习惯加上。W表示width，即图片宽度，H表示height，即图片高度，s表示step，即生成图片的步数，n表示number，即生成图片的张数，还有更多可以控制的参数，如种子S(seed)、图片与描述的相关度f（prompt strength）等等，你自己去看help慢慢钻研，注意大小写。生成图片的速度取决于你的GPU，一般图片尺寸最好不要太大，不然超级慢。 **如果你实在想要高清大图，奈何自己显卡太渣，可以先用stable diffusion生成一个低清晰度的，再用waifu2x（<http://waifu2x.udp.jp/>）生成高清大图** 。生成的结果图片默认放在stable-diffusionoutputsimg-samples文件夹下（可以通过指定参数更改输出路径，但没必要）

# **如果没有** **正确** **生成图片怎么办**

有可能生成的图片全都是纯绿色的，或者别的什么颜色，总之就是纯色图片，那么你可以参考 <https://github.com/CompVis/stable-diffusion/issues/69> 来试试别人的解决办法（我也遇到了，看哪天如果解决了再写篇文章讲讲）。如果实在不行，还是老老实实去玩网页版吧（文章开头给出了链接），或者去谷歌的colab在线运行（<https://colab.research.google.com/github/woctezuma/stable-diffusion-colab/blob/main/stable>\_diffusion.ipynb#scrollTo=AUc4QJfE-uR9 需要挂梯子）
