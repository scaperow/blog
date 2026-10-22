---
title: "《图话本》技术方案"
date: 2015-12-01 19:25:00
updated: 2024-11-07 14:53:05
abbrlink: "Rkw8fn"
categories:
  - "未分类"
tags:
  - "emotion"
  - "face motion"
  - "node"
  - "图话本"
halo_name: "104"
halo_permalink: "/archives/Rkw8fn"
---

## 《图话本》是什么？

**图话本** 是一款好玩的网页轻手游，能够根据照片中人物的表情来显示语出惊人的台词。

[点击在线玩 <http://app.scaperow.com/facemotion/>](<http://app.scaperow.com/facemotion/>)

自己玩了好多遍，都没有腻，随便放出来几张有意思的图片 ![o_1a5epn49ht781ik08p912aju4v](<http://blog.scaperow.com/wp-content/uploads/2015/12/o_1a5epn49ht781ik08p912aju4v.jpg>)

![o_1a5epnoigtec1kem56ap478dq17](<http://blog.scaperow.com/wp-content/uploads/2015/12/o_1a5epnoigtec1kem56ap478dq17.jpg>)

![o_1a54m0oo81mpv1tsf1v1g1p913nvf](<http://blog.scaperow.com/wp-content/uploads/2015/12/o_1a54m0oo81mpv1tsf1v1g1p913nvf.jpg>)

## 设计原则

- **精简请求** 减少不必要的资源请求，多个操作一次完成
- **减轻前台** 图像处理，逻辑全部在服务端实现，前台只显示结果
- **快速入门** 两个 step 即可开玩

## 前台设计

- **zepto.js** zepto为精简化的 jquery,大部分语法都相同，虽然没有 jquery 全面，在该应用上使用已经足够。
- **qiniu.js** 七牛上传图片组件，使用该组件可直接将本地的图片上传至七牛后台，而不经过自己的后台。
- **underscore.js** 工具库，简化数据处理的操作。

## 后台设计

- **node+mysql+underscore** 快速开发的选择，没有其他理由了
- **qiniu.js** 七牛提供了 qiniu.js for node.js 组件，用于该组件来获取上传图片的 token ,供前台使用。
- **color+jimp** 使用 jimp 来获取七牛服务器上图片的尺寸，用于计算水印文字的大小，使用 color 来获取图片的明暗色调，如果是亮色调，水印文字为黑色，如果是暗色调，水印文字为白色，动态生成。
- **request** 简化 nodejs 的 http 请求的代码，使用 request 向微软的 `face emotion sdk` 获取图片的情绪值。

## 流程图

<iframe src="https://www.processon.com/embed/565d1090e4b010dc0fb4ab8d" width="300" height="150" style="border:0;max-width:100%" loading="lazy" allowfullscreen frameborder="0"></iframe>
