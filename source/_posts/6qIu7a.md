---
title: "NEWS! 第一版发布！！！"
date: 2024-10-11 12:48:15
updated: 2024-11-07 14:53:33
abbrlink: "6qIu7a"
categories:
  - "未分类"
halo_name: "605"
halo_permalink: "/archives/6qIu7a"
---

最近，我开发了一个叫 **大罗洞观** 的 H5 应用，专门用来根据生日测算八字、解析运势。你只需要输入出生日期，它就会生成四柱八字，显示大运/流年的数据。

名字取自《一人之下》里的“八奇技”，听起来挺符合命理学那种神秘感。

技术上，我用了 **Vue3** 来做前端框架，配合 **TypeScript** ，编译工具选了 **Vite** 。央视部分用了 **TailwindCSS** ，能灵活调整样式，还借了点 **Ionic** 组件，主要是为了增强移动端的体验。

这个应用是纯前端的，不依赖任何后端服务，能加快页面速度，同时减轻了服务器压力。使用 **GitHub Actions** 的 CI/CD，自动部署到 **阿里云 OSS** 。得益于 vite 自带了 gzip ，编译后整个站点的资源大小不到 1m，结合 cdn 的技术，不管在全国那里都能秒开网页。

登陆页面

![](<https://blog.scaperow.com/wp-content/uploads/2024/10/Screenshot-2024-10-11-at-12.48.49.png>)

基础排盘

![](<https://blog.scaperow.com/wp-content/uploads/2024/10/image-6.png>)

流年运势查看

![](<https://blog.scaperow.com/wp-content/uploads/2024/10/image-7-669x1024.png>)

后期结合 ai 来生成解析，打分等功能，也可以作为应用付费的切入点。

![](<https://blog.scaperow.com/wp-content/uploads/2024/10/image-8.png>)

此外，全站还支持 dark mode

![](<https://blog.scaperow.com/wp-content/uploads/2024/10/image-9.png>)

这里的图片使用了 filter:revert 来实现文字的黑色转白色。light mode 下面文字是黑色的，dark mode 下反转成白色。为了实现这一功能，之前用还准备了两张图片做切换，后来做极限优化时欢了新方案。

最后，除了网页版，我也把 **大罗洞观** 发布到了抖音小程序。目前正在审核中。。。
