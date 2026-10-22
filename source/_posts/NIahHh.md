---
title: "umbraco 集成多说评论组件"
date: 2015-08-25 23:47:00
updated: 2024-11-07 14:53:02
abbrlink: "NIahHh"
categories:
  - "随记"
tags:
  - "umbraco"
  - "多说"
  - "评论"
  - "评论组件"
halo_name: "54"
halo_permalink: "/archives/NIahHh"
---

最近在使用 Umbraco 这个cms，功能都很不错，但是唯抱憾是博客模块中没有评论，怎么办？

Umbraco 中没有现成的评论模块，如果要研究其源代码自己开发则需要花费太多精力，但是在网上找不到相关的内容，甚至连 Umbraco 相关的内容的少之又少。

无奈只能自己想点办法了。。。 突然就想到了“多说”，之前只是听过别人用，这是套第三方的评论组件，只需要少许几行代码就可以集成，应该是我想要的。 话不多说就是干，首先打开多说注册界面，点击安装

![](<http://blog.scaperow.com/wp-content/uploads/2015/08/1649419061705361.png>)

下来是填写新站点的信息，如实填写即可。

![](<http://blog.scaperow.com/wp-content/uploads/2015/08/1649419061705362.png>)

所有信息填写后，点击创建，会生成一堆js代码，在你需要集成评论的页面中使用该段脚本。到时候在访问该页面时，多说的js会自动生成dom和评论数据到你的页面中。 注意在使用该脚本前，要按照脚本上的提示替换该页面的ID，标题，网址。 !

[1649419061705363](<http://blog.scaperow.com/wp-content/uploads/2015/08/1649419061705363.png>)

ok，脚本是拿到了，怎么显示到 Umbraco 页面中呢？

幸亏 Umbraco 的后台中可以直接修改部分页面，可以不用研究庞大的源代码了。

在后台中找到 setting 选项卡中找到 templates 节点，一路向下找到名为 blog post 的子节点，点开。

该页面既是一条博文的模版也，直接修改此文件可以影响每一个博文页，将从多说得到的脚本粘贴到如图的位置。

上边提到过需要替换脚本上的关键参数，id，标题，路径。可以使用以下三个参数分别替换。

**@CurrentPage.ID** 代表当前博文的id **@CurrentPage.Name** ：代表当前博文的标题 **@CurrentPage.Url** 该博文的相对路径，需要与你的域名拼接 这三个变量是直接从 `@CurrentPage` 里面取得，`@CurrentPage`又是从 MasterPage 中传入的，别问我为什么知道，我也是猜的。。。只能说 Umbraco 的命名方式很规范啊，这三个参数名我也是一猜一个准。 最后我的代码是这样的，代码中使用的是我的域名，请自行更改

![](<http://blog.scaperow.com/wp-content/uploads/2015/08/1649419061705364.png>)

最后打开博文，欣赏下效果。

![](<http://blog.scaperow.com/wp-content/uploads/2015/08/1649419061705365.png>)
