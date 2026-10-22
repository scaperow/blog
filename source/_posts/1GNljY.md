---
title: "Javascript 判断经纬度是否在中国"
date: 2018-09-27 22:24:40
updated: 2024-11-07 14:53:11
abbrlink: "1GNljY"
categories:
  - "随记"
tags:
  - "技术"
  - "车联网"
halo_name: "46"
halo_permalink: "/archives/1GNljY"
---

公司项目上一个问题，车辆的坐标点经常会飘到国外去，经过分析，是车载终端上传了错误的经纬度，最后考虑到终端升级麻烦，领导一句话，让前端来改。。。

然后我开始做技术调研。

百度地图有 API 来判断坐标点是否在某一个范围内，要使用这个方法，首先要把中国地图的边界坐标拿出来。刚好百度地图的的 API 也能提供。

看起来条件已经很充足了，可以开始动代码了。不过，我比较担心的是性能问题。

项目中有一个轨迹回放的功能，会把很多点拿到前端做渲染，如果每个点都要做范围的判断，有可能会有性能的问题。

最后做了单元测试，最后发现性能问题的确存在，当处理 1000 个点的时候会超过 1 秒。

以下是我的测试代码。

See the Pen <a href="https://codepen.io/scaperow/pen/eLLPbz/">判断经纬度是否在中国</a> by scaperow (<a href="https://codepen.io/scaperow">@scaperow</a>) on <a href="https://codepen.io">CodePen</a>.<br />

> 没有引用百度 API 的脚本，直接把需要的方法拷贝过来了。我把中国边界的坐标点录到在线 mocker 服务器上了，通过 url 就可以访问。
