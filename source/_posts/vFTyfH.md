---
title: "全网Stable Diffusion WebUI Model模型资源汇总"
date: 2023-03-16 20:32:05
updated: 2024-11-07 14:53:28
abbrlink: "vFTyfH"
categories:
  - "随录"
tags:
  - "ai"
  - "stable difussion"
halo_name: "477"
halo_permalink: "/archives/vFTyfH"
---

# **Model资源**

使用注意：

与ckpt文件同名的vae.pt文件用于稳固该模型的表现，直接放在相同文件夹即可。训练时将该文件改名或移走。并不是所有模型都需要使用vae文件。

公开资源：

1. <https://rentry.co/sdmodels>（目前觉得比较全）
2. <https://cyberes.github.io/stable-diffusion-models/>（SD模型）
3. <https://publicprompts.art/>（App Icon Generator，比较有趣想资源）
4. <https://huggingface.co/> （在网站中检索）
5. <http://aimodel.subrecovery.top>
6. <https://docs.qq.com/doc/DY0lFeWZuVXRCdUJU>
7. <http://www.123114514.xyz/models/ckpt>（挺多私炉的）

模型效果测试均使用以下参数：

Prompt：masterpiece，beat quality，1girl

Negative Prompt：nsfw,blush,lowres, bad anatomy, bad hands, text, error, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality, normal quality, jpeg artifacts,signature, watermark, username, blurry, artist name,bad feet,big head,fused body,multiple hands,multiple legs,multiple hands,multiple breast,multiple lower legs,multiple thighs,fused body,twist body

Steps: 38, Sampler: Euler a, CFG scale: 10, Size: 1024x640, Eta: 0.68, Clip skip: 2, ENSD: 31337

平时的万用模型--Novel AI泄漏模型，由于Prompt填写较少，综合性较强的大模型展示效果不太好 ：

![](/images/880e87f94c19597b68bea1deb1464be1-04e7a261db.webp)

1. final-pruned.ckpt \[925997e9\] （与P站常见\[Stable Diffusion 81274D13\]通用）
2. anime-final-pruned.ckpt \[e6e8e1fc\] 7G （常用于训练）
3. Novel AI 泄露全模型下载链接（建议只下载上面两个在final文件夹的模型）： magnet:?xt=urn:btih:5bde442da86265b670a3e5ea3163afad2c6f8ecc 需搭配任意vae文件使用。

目前口碑较好的模型：

- 元素法典群大佬自练的，手部细节较好。 Anything 3.0.ckpt \[6569e224\] **需搭配任意vae文件使用。** **下载链接：**<https://rentry.co/sdmodels>

![](/images/7ccefa9a2cf6b4ab0288f0c127329e46-15969ec110.webp)

- momoko-e.ckpt \[a2a802b2\] sfw  **画师：ももこ**<https://www.pixiv.net/users/1113943>**DB作者：Anon@StableDiffusion CN** **下载链接：**<https://huggingface.co/zxsq/momoko-e/resolve/main/momoko-e.ckpt>

![](/images/50348bd1ae65662626f7a78f6cc2bb88-964209f708.webp)

- momoko-p.ckpt \[5d916d1e\] nsfw **画师：ももこ**<https://www.pixiv.net/users/1113943>**DB作者：PiDanShouRouZhou** **下载链接：**<https://pan.baidu.com/s/1oZcJMh99l-xIpof02-p1hg?pwd=0pi8>

![](/images/665f16330d5ffe2c803f6bfb7610b790-e6d666753e.webp)

个人收集的模型：

- nice.ckpt \[2c13a9f1\] **偏真实cg风格，出图视频：<https://www.bilibili.com/video/BV1j84y1k78D/>** **下载地址：**<https://huggingface.co/elontrump/nice/resolve/main/nice.ckpt>

![](/images/0f11b9f96870ec9641db2fb423edc147-737905a129.webp)

- ogipote5half.ckpt \[a2a802b2\] **画师： 荻pote@1日目西あ-49a**<https://www.pixiv.net/users/2131660>**DB作者：Anonymous a.k.a AnO** **下载链接：**<https://pan.baidu.com/s/1bD1KbBEz4>\_IHxecA[CV1](<https://www.bilibili.com/read/CV1?from=articleDetail>)f2g?pwd=0ymr

![](/images/7ce446cd8ca9a52efcd61dca142d0c67-32dad5e3ac.webp)

- 天然ボケのyuu\_6000.ckpt \[bce7108b\] **画师： 天然ボケのyuu\_6000** 这个画师的画也全是AI生成的 **DB作者：Iris CudaYNER** **下载链接：**<https://pan.baidu.com/s/1JxEbnrE7GygQRsXkBh5Neg?pwd=7jh8>

![](/images/a43fa6920dd8dd51c5c0e4f413e9154b-e0cf3666d2.webp)

- torino-p.ckpt \[02cf097a\] **画师：torino**<https://www.pixiv.net/users/1960050>**DB作者：PiDanShouRouZhou** **下载链接：**<https://pan.baidu.com/s/1bEE6tSU>\_ZFOYPwkxXOJYxQ?pwd=xbaj **V2 下载链接：**<https://pan.baidu.com/s/1gRCeqUQxhTTk>\_4tsQZ\_G2Q?pwd=u4sy

![](/images/42ec89c1fecc05588823a7cac2859f73-829d5b9431.webp)

- quan-E6\_512\_7000.ckpt \[e02601f3\] **画师：QuAn\_**<https://www.pixiv.net/users/6657532>**DB作者：CyanNAI** **下载链接：**<https://pan.baidu.com/s/1bOiwlY9K7H6FftUqOzuCwQ?pwd=3okn>

![](/images/4fe1ed70dcf52f70582d0355aec47710-02f9230f53.webp)

- laolei style v3.ckpt \[f8721683\] **画师：rei子** **DB作者：Q群友 465203442** **下载链接：**<https://pan.baidu.com/s/1MJnL0MF0CYkSEbGFb3vvgQ?pwd=1y6l> 需搭配任意vae文件使用。

![](/images/482e98249686204d2396b93e82b433f9-630b5daac8.webp)
