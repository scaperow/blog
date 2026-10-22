---
title: "解决安装 npm 包缓慢的方法"
date: 2015-09-12 19:32:00
updated: 2024-11-07 14:53:09
abbrlink: "CM5d1U"
categories:
  - "未分类"
halo_name: "169"
halo_permalink: "/archives/CM5d1U"
---

使用 --registry 参数即可，该参数将指示 NPM 包的下载路径，例如要安装 cordova，命令如下 `npm install -g cordova --registry=<http://registry.npm.taobao.org>` > 上命令将 cordova 的下载路径映射到了淘宝的 NPM 仓库中。这是一个完整 npmjs.org 镜像，你可以用此代替官方版本(只读)，同步频率目前为 10分钟 一次，以保证尽量与官方服务同步。 这只是一个基本的方法，使用起来也很麻烦，有没有更简单的方法？

请参考我的这篇文章 <http://www.scaperow.com/115>
