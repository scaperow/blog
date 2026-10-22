---
title: "wordpress 深度集成 markdown"
date: 2015-12-16 21:06:00
updated: 2024-11-07 14:53:05
abbrlink: "vNYiiq"
categories:
  - "未分类"
tags:
  - "markdown"
  - "marked"
  - "wordpress"
  - "wordpress markdown"
  - "去插件"
  - "插件"
  - "集成"
halo_name: "58"
halo_permalink: "/archives/vNYiiq"
---

wordpress 的编辑器没有 markdown 功能，曾今寻便所有的 plugin ，发现都不太理想，并且作为一个非插件控的我，即使找到了大而全的插件，也会想方设法来去插件化。于是今天早上拍了下脑门，决定自己集成 markdown。 集成后的功能如下：

- **实时预览** 即见即所得，甚至你可以作为一个专门的 markdown 编辑器来使用
- **代码高亮** 程序员最爱，需要在前台做代码高亮
- **代码分离** markdown 的代码和 html 代码分离，互不影响，并且会将 markdown 代码保存下来，以便下次继续编辑。 先看下效果 ![markdown](<http://blog.scaperow.com/wp-content/uploads/2015/12/markdown.gif>)

## 原理

在 post 页面添加一个 textarea，监听 input 事件，事件中将文本框的内容取出，用 marked.js 进行转码，将转码后的 html 放在系统中的 tinyMCE 中。 在保存时将 textarea 中的文本存入 media data 中，下次可以继续编辑。 ## 开始集成

1. 下载 [marked.js](<http://source.scaperow.com/wp-content/themes/twentysixteen/js/marked.js>) 和 [makemarkdown.js](<http://source.scaperow.com/wp-content/themes/twentysixteen/js/makemarkdown.js>)
2. 将 `marked.js`，`makemarked.js` 拷贝到 `~\wp-content\{你的主题目录}\js\` 目录下 > marked.js 是一套 js 库，用于将 markdown 代码转换成 html。makemarked.js 用于监听文本框事件，来实时调用 marked.js 来转换 markdown 代码。
3. 在 `function.php`中加入以下代码

```php
// 增加 markdown 功能到后台编辑器
add_action( 'admin_menu', 'create_markdown' );
add_action( 'save_post', 'save_markdown', 10, 2 );

function create_markdown() {
    add_meta_box( 'markdown_box', 'Markdown', 'markdown_html', 'post', 'normal', 'high' );
}

function markdown_html( $object, $box ) { ?>
        <?php echo htmlspecialchars (get_post_meta( $object->ID, 'markdown', true )); ?>
<?php }

function save_markdown( $post_id, $post ) {
    if ( !current_user_can( 'edit_post', $post_id ) )
        return $post_id;

    $meta_value = get_post_meta( $post_id, 'markdown', true );
    $new_meta_value = $_POST['markdown'];

    if ( $new_meta_value && '' == $meta_value )
        add_post_meta( $post_id, 'markdown', $new_meta_value, true );

    elseif ( $new_meta_value != $meta_value )
        update_post_meta( $post_id, 'markdown', $new_meta_value );

    elseif ( '' == $new_meta_value && $meta_value )
        delete_post_meta( $post_id, 'markdown', $meta_value );
}

function markdown_script() {
    wp_enqueue_script('markdown', get_template_directory_uri() . '/js/marked.js' );
    wp_enqueue_script('makemarkdown', get_template_directory_uri() . '/js/makemarkdown.js');
}

add_action( 'admin_enqueue_scripts', 'markdown_script');
```

目前后台的工作已经 ok，代码高亮需要在前台设置，参见后续文章
