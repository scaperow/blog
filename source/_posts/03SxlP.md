---
title: "使用 docker 部署 nodejs 程序"
date: 2024-11-07 14:52:52
updated: 2024-11-07 14:52:52
halo_original_publish_time: "1970-01-01T08:00:00Z"
date_note: "原 publishTime 为 Unix 纪元值 1970-01-01T08:00:00Z（WordPress 迁移遗留），无法还原真实发布时间；已采用最后修改时间 2024-11-07 14:52:52 作为日期。"
abbrlink: "03SxlP"
categories:
  - "未分类"
halo_name: "78"
halo_permalink: "/archives/03SxlP"
---

## 环境

- docker
- ubuntu 16.4.x
- web 程序

要发布自己的应用，就需要把应用打包为一个 docker 镜像。

## 创建基础镜像

基础镜像相当于程序的运行环境，包括运行时最基本的系统，node，npm。在 docker.io 上有一个一个名为 node 的镜像，该镜像已经包括了 node 的运行环境，执行一下命令将该镜像下载下来，作为我们的基础镜像。

docker pull node

安装完成后，执行以下命令。

docker images

在列表中找到名为 node 的镜像，代表安装成功。

> 该命令可以展示本机安装过的所有镜像

## 配置 Dockerfile

在当前目录下创建 Dockerfile

vi Dockerfile

> Dockerfile 是编译 docker 镜像时的配置配置文件

输入以下内容 FROM node # Create app directory RUN mkdir -p /home/server/91starter WORKDIR /home/server/91starter # Bundle app source COPY . /home/server/ RUN npm install EXPOSE 3000 CMD \["npm","start"\]
