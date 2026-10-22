---
title: "cnpm 是什么？可以加速 npm 吗？"
date: 2015-09-12 20:26:00
updated: 2024-11-07 14:53:05
abbrlink: "lAlQZ7"
categories:
  - "未分类"
halo_name: "100"
halo_permalink: "/archives/lAlQZ7"
---

cnpm 是用于企业建立私有的 npm 仓库的服务，同时与 npm 基本是实时同步的，目前的同步时间是10分钟一次。对于大企业或其他组织来说，非常有用。

![-cnpm-npm-relation](<http://blog.scaperow.com/wp-content/uploads/2015/09/cnpm-npm-relation.png>)

同时，因为 cnpm 与 npm 的仓库是同步的，一些国内开发者也可以使用 cnpm 替换 npm 来加快包的安装。

## 安装 cnpm 及使用方法：

`npm install cnpm -g`

通过 npm 来安装 cnpm，如果因为网络问题无法安装的，可以使用下面的命令行 `npm install -g cnpm --registry=<http://registry.npm.taobao.org>`
