---
title: "解除 wordpress 上传文件大小限制的最新方法"
date: 2015-12-15 18:41:00
updated: 2024-11-07 14:53:09
abbrlink: "VXnSo3"
categories:
  - "未分类"
tags:
  - "Upload Max File Size"
  - "upload_size_limit"
  - "wordpress"
  - "文件上传大小"
  - "解除"
halo_name: "171"
halo_permalink: "/archives/VXnSo3"
---

## 环境

阿里云的虚拟主机

**wordpress** 4.4 在此环境上，上传文件的大小被限制在 **6M** 以下，

网上的方法基本上可分为三类 1. 修改 `function.php`

2. 修改 `php.ini`

3. 修改 `.htaccess`

## 插件方法

以上的方法不再适用，可能是 **wordpress** 版本比较新，最后找到一个名为 `Upload Max File Size` 的插件。 ![A1B9BC06-CAF9-4F29-A655-58B1D10BEA9C](<http://blog.scaperow.com/wp-content/uploads/2015/12/A1B9BC06-CAF9-4F29-A655-58B1D10BEA9C.png>) 数值单位为比特，需要自己转换单位。

## 去插件化

查看该插件源码发现，只要一行代码就可以解决问题 `add_filter('upload_size_limit', 'ashu_increase_upload');` OK，将该行代码复制到当前主题下的 `function.php` 中，将 `ashu_increase_upload` 修改为 `max_file_size`，再新建 `max_file_size` 的方法，在该方法中返回新的大小值。

最后的代码如下。

```javascript
function max_up_size() {
    return 64*1024*1024; // 62 MB 
    } 

add_filter('upload_size_limit', 'max_up_size');
```
