---
title: "android sdk manager 无法链接的解决方案"
date: 2015-09-13 22:23:00
updated: 2024-11-07 14:53:09
abbrlink: "xEV8Yx"
categories:
  - "未分类"
tags:
  - "android"
  - "android sdk manager"
  - "下载"
  - "无法链接"
halo_name: "167"
halo_permalink: "/archives/xEV8Yx"
---

由于 gfw 的存在，使得国内开发人员苦不堪言，在此推荐一个映像服务器，可以解决大部分开源项目的下载问题，我的 android sdk 就是在这上面下载的，赞一个

<http://mirrors.neusoft.edu.cn/>

如果要下载 android sdk，可以进入到 android 类别中按需下载，也可以使用 android sdk manager 下载，方法如下

1. 启动 Android SDK Manager ，打开主界面，依次选择 **「Tools」** 、 **「Options...」** ，弹出 **『Android SDK Manager - Settings』** 窗口；

2. 在 **『Android SDK Manager - Settings』** 窗口中，在 **「HTTP Proxy Server」** 和 **「HTTP Proxy Port」** 输入框内填入`mirrors.neusoft.edu.cn`和`80`，并且选中 **「Force <https://...> sources to be fetched using <http://...>」** 复选框。设置完成后单击 **「Close」** 按钮关闭 **『Android SDK Manager - Settings』** 窗口返回到主界面；

3. 依次选择 **「Packages」** 、 **「Reload」** 。
