---
title: "使用免费空间 OpenShift 搭建 Ghost 博客"
date: 2016-10-11 23:08:00
updated: 2024-11-07 14:53:13
abbrlink: "zasQXM"
categories:
  - "未分类"
halo_name: "82"
halo_permalink: "/archives/zasQXM"
---

## Ghost 是什么

`ghost`是一套开源的博客系统，运行在`node.js`环境之上。 支持用`markdown`来书写博客。相对于`wordpress`来说，功能配置不是很全面，但是对一个博客系统来说，它以经完全做到了。 `ghost`的宣言是

> Just a Blogging Platform *(只为博客而生)*

![](<http://blog.scaperow.com/content/images/2016/06/---1.png>)

当你真正使用过`ghost`之后，你会被他界面和操作所吸引，下来是我认为`ghost`做的比较优秀的地方。

1. 纯粹的书写方式。博客支持用`markdown`书写，并且只支持`markdown`。 2. 漂亮的界面。跟`wordpress`一样，`ghost`支持更换皮肤，但是默认的皮肤已经美哭。 3. 专注编辑。在编辑页面中，不用点击`Save`按钮，直接按`Ctrl+S`保存。 4. 自定义功能。使用`Code Injection`功能，可以为页面加入自定义脚本，比如站点统计代码，分享组件代码等。 5. 使用`node.js`作为运行时，使用`.js + handlebars`，性能不担心，维护没问题。 6. 开源。开源。开源。

说说缺点 1. 没有原生评论功能，没有统计功能，没有搜索功能。需要修改代码来加入第三方的。 2. 没有批量删除博客功能，不过到是有删除全部文章功能，不太实用。

## 开始搭建

因为 OpenShift 是可以免费创建3个 application 的，所以将博客安家在这里。

1.申请 OpenShift 账号

<https://www.openshift.com/app/account/new>

2.注册后，需要到注册邮箱确认下。

![](<http://blog.scaperow.com/content/images/2016/06/5JO8FF-F9LTYU_-F029BH-W.png>)

3.跳转到后台界面

<https://openshift.redhat.com/app/console/applications>

点击`Create your first application now`连接，会创建一个 application

![](<http://blog.scaperow.com/content/images/2016/06/QQ--20160608095655.png>)

4.可以看到 OpenShift 是支持很多语言环境的，并且也提供了一些内置应用，`Jenkins Server`，`Drupal`，`Ghost`，`Wordpress`。 在此选择 `Ghost` 内置应用。

![](<http://blog.scaperow.com/content/images/2016/06/QQ--20160608100218.png>)

5.选择了应用，下来做一些配置才能使用。

![](<http://blog.scaperow.com/content/images/2016/06/QQ--20160608101250.png>)

**Publis URL** 二级域名，必填项。强迫症患者不需要纠结，因为下来可以自定义域名。

**Source Code** Ghost 源代码地址，OpenShift 会从该地址自动拉取代码并部署到你的空间中。 其他的选择都不用更改，点击`Create Application`进入下一步。 7.等待服务器工作，该过程中。OpenShift 会自动为你创建`node.js`的环境，并且将`Ghost`代码部署在该环境中。甚至你都不用考虑如何配置数据库。 8.服务器工作完成后，会跳转到应用列表界面

<https://openshift.redhat.com/app/console/applications>

点击应用，会跳转到你的博客首页。 ## 如何进入后台 打开博客首页，在 url 后面追加`/admin`。因为第一次运行，需要配置管理员账号后才可以使用。比如，我的博客首页地址是`blog.scaperow.com`，那么后台地址就是`blog.scaperow.com/admin`。配置完成后就可以尽情的折腾了。
