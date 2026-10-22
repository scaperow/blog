---
title: "使用JSduck生成技术文档"
date: 2017-11-02 00:12:00
updated: 2024-11-07 14:53:13
abbrlink: "FRm2fW"
categories:
  - "未分类"
halo_name: "80"
halo_permalink: "/archives/FRm2fW"
---

## 为什么要有技术文档？

**优点** 1. 如果代码看不下去，那么看文档 2. 对功能模块有一个全局的视角 3. 使项目易于维护

**缺点** 1. 需要额外的人力来整理文档 2. 需要额外的时间来做文档的变更

so，有没有一种更简单的方式，在现有人力的情况下，在限有时间的前提下，做到技术文档的输出呢？

其实，可以用框架来生成技术文档，这个框架就是 **JSduck**

> JSduck 由 Sencha 开发，因此对于自家 extJS 具有非常强大的支持功能，包括令人咋舌的实时代码修改。但即使你不是使用 extJS 进行开发，JSDuck 仍然是一个非常强大的工具，一方面它的语法非常灵活，描述支持 Markdown 语法，上手难度远远低于 JSDoc

3；另一方面它生成的文档可读性堪比 YUIDoc，同时支持源码的对照，学习起来也非常的容易。要说 JSduck 有什么不好的地方，估计就是它把一切都 Handle 太完美了以致于没有给你提供什么可以自己定制的余地。

## JSduck 运行原理？

**JSduck + 代码注释=文档** JSduck 也是一套程序库，运行这个程序库，它会读取你的源代码中的注释文档，最终生成一套网页文件，这些文件既是文档。

- 
  - 
    - 注释规范需以“/\**” 开头和“*/”结束，不同的注释标签会生成不同的文档内容，JSduck 提供了很多注释标签，大部分都是通用的注释标签，例如 @auther 用来指定代码作者，@return 用来描述方法的返回值，@param 用来描述输入参数等等。

## 安装 JSduck

1. 安装 ruby
2. 从 github 上下载并解压 JSduck，解压目录中 JSdcuck.exe 既是可运行文件
3. 将 JSduck 的运行目录配置到 PATH 当中

## 运行 JSduck

从 cmd 中输入以下命令即可运行 `jsduck <源代码目录> —output <文档输出目录>`

## JSduck API

JSduck 玩的就是注释符，下面是 JSduck 提供的所有注释符

[@abstract](<https://github.com/senchalabs/jsduck/wiki/@abstract>)用来标记抽象方法或类，通常用于标记还有没实现的方法

[@accessor](<https://github.com/senchalabs/jsduck/wiki/@accessor>)

[@alias](<https://github.com/senchalabs/jsduck/wiki/@alias>)

[@alternateClassName](<https://github.com/senchalabs/jsduck/wiki/@alternateClassName>)

[@aside](<https://github.com/senchalabs/jsduck/wiki/@aside>)

[@author](<https://github.com/senchalabs/jsduck/wiki/@author>) 指定类/方法的作者

[@cfg](<https://github.com/senchalabs/jsduck/wiki/@cfg>) 用于组件或类的配置描述

[@chainable](<https://github.com/senchalabs/jsduck/wiki/@chainable>) 用于标记一组链路方法，链路方法是什么？我的理解是方法总会返回 **this**

[@class](<https://github.com/senchalabs/jsduck/wiki/@class>)\*\* 标记一个类，JSduck 会根据该标记来生成树的结构图

[@constructor](<https://github.com/senchalabs/jsduck/wiki/@constructor>) 如果为了一个类写了构造函数，那么需要使用改注释符

[@deprecated](<https://github.com/senchalabs/jsduck/wiki/@deprecated>) 如果某一个函数不再使用，但是为了不影响线上版本不能删除改方法的情况下，需要将改函数标记为已废弃

[@docauthor](<https://github.com/senchalabs/jsduck/wiki/@docauthor>) 类似于 @author，不过 @author 用于代码的作者，该标记用于描述文档的编写者

[@enum](<https://github.com/senchalabs/jsduck/wiki/@enum>) 枚举

[@event](<https://github.com/senchalabs/jsduck/wiki/@event>) 描述一个事件的定义

[@evented](<https://github.com/senchalabs/jsduck/wiki/@evented>) 描述一个事件的影响者

[@experimental](<https://github.com/senchalabs/jsduck/wiki/@experimental>) 用于描述一个不稳定的方法，因为改方法可能会在以后的版本中移除掉，以此来警告方法的使用者

[@extends](<https://github.com/senchalabs/jsduck/wiki/@extends>) 继承

[@fires](<https://github.com/senchalabs/jsduck/wiki/@fires>) 描述某一个方法中，可能会触发某一个事件

[@ftype](<https://github.com/senchalabs/jsduck/wiki/@ftype>)

[@hide](<https://github.com/senchalabs/jsduck/wiki/@hide>)

[@ignore](<https://github.com/senchalabs/jsduck/wiki/@ignore>) 某些注释只用于开发者阅读，但是并不希望在出现在文档中，可以使用该标记

[@inheritable](<https://github.com/senchalabs/jsduck/wiki/@inheritable>)

[@inheritdoc](<https://github.com/senchalabs/jsduck/wiki/@inheritdoc>)

[@link](<https://github.com/senchalabs/jsduck/wiki/@link>) 用于引用其他对象（类，方法，事件等）

[@localdoc](<https://github.com/senchalabs/jsduck/wiki/@localdoc>)

[@markdown](<https://github.com/senchalabs/jsduck/wiki/@markdown>)

[@member](<https://github.com/senchalabs/jsduck/wiki/@member>)

[@method](<https://github.com/senchalabs/jsduck/wiki/@method>) 描述一个方法

[@mixins](<https://github.com/senchalabs/jsduck/wiki/@mixins>) 混合某一个对象的注释

[@new](<https://github.com/senchalabs/jsduck/wiki/@new>) 标记某一个最新创建的方法

[@override](<https://github.com/senchalabs/jsduck/wiki/@override>)

[@param](<https://github.com/senchalabs/jsduck/wiki/@param>) 描述入参

[@preventable](<https://github.com/senchalabs/jsduck/wiki/@preventable>)

[@private](<https://github.com/senchalabs/jsduck/wiki/@private>) 描述私有对象

[@property](<https://github.com/senchalabs/jsduck/wiki/@property>)描述属性

[@protected](<https://github.com/senchalabs/jsduck/wiki/@protected>)将成员的可见性记录为受保护。受保护的成员只能从类本身及其子类中使用。

[@ptype](<https://github.com/senchalabs/jsduck/wiki/@ptype>)

[@readonly](<https://github.com/senchalabs/jsduck/wiki/@readonly>)描述只读属性

[@removed](<https://github.com/senchalabs/jsduck/wiki/@removed>) 描述某一个方法在某一个版本中已经移除掉

[@requires](<https://github.com/senchalabs/jsduck/wiki/@requires>)描述依赖对象

[@return](<https://github.com/senchalabs/jsduck/wiki/@return>)\*\* 描述方法的返回对象

[@scss mixin](<https://github.com/senchalabs/jsduck/wiki/@scss-mixin>) [@since](<https://github.com/senchalabs/jsduck/wiki/@since>) 描述从哪个版本开始加入的新的对象，使用该标记 时，会在文档中自动加入 @new 标记，但不会影响源代码。

[@singleton](<https://github.com/senchalabs/jsduck/wiki/@singleton>)描述单态对象

[@static](<https://github.com/senchalabs/jsduck/wiki/@static>)描述静态对象

[@template](<https://github.com/senchalabs/jsduck/wiki/@template>)提供一种作为扩展类的功能的钩子提供的方法。该标签通常与@protected 一起使用。

[@throws](<https://github.com/senchalabs/jsduck/wiki/@throws>) 文件方法抛出的异常。异常类型默认为 Object。可以使用多个@throws 标签来记录多个可能的异常。

[@type](<https://github.com/senchalabs/jsduck/wiki/@type>)\*\* 记录属性的类型，另外将记录的东西标记为属性。 不建议使用此标记。它只支持向后兼容旧的 ext-doc。对于新代码，始终使用@property 标签。

[@uses](<https://github.com/senchalabs/jsduck/wiki/@uses>)\*\* 定义文档类使用的类。

[@var](<https://github.com/senchalabs/jsduck/wiki/@var>)\*\* 记录 SCSS 变量：其名称，类型和默认值。

[@xtype](<https://github.com/senchalabs/jsduck/wiki/@xtype>)
