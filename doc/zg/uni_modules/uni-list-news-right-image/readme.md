## 什么是 uniCloud 
uniCloud 是 DCloud 联合阿里云、腾讯云，为开发者提供的基于 serverless 模式和 js 编程的云开发平台，更多请参考[uniCloud文档](https://uniapp.dcloud.io/uniCloud)。

## 云端一体页面的优势是什么
过去，开发一个列表，需要在后端设计数据库，提供接口，前端写列表，处理分页、下拉刷新，并保证长列表的性能，全套工作下来需要1、2天。

现在有了云端一体列表，上述工作都不用做了，页面拿来就用。

在HBuilderX 2.9+，新建页面时，可以直接选择大量云端一体页面模板，数据库、后台接口、前端页面都有了。

当然，您也可以调整，自定义数据库表和前端的ui。

## 后台数据表
后台数据表使用 [openDB](https://gitee.com/dcloud/opendb/tree/master) 设计规范，它约定了一个标准用户表的表名和字段定义，并且基于nosql的特性，可以由开发者自行扩展字段。`openDB`是[uniCloud](https://uniapp.dcloud.io/uniCloud/README)的重要软基建，支撑`uniCloud`数字生态的发展。


## 页面模板简介

列表是我们在项目开发中常见的一个需求，对于基础列表 [uni-list](https://ext.dcloud.net.cn/plugin?id=24) 组件已经提供了大部分常见的功能。

但是如果我们想要实现一个复杂的新闻列表，难免需要我们去实现不同的复杂列表布局，例如一些图文混排、左图右文、右图左文、大图略缩图、多图略缩图等多种不同排版组合，同时我们可能还需要应对不同的数据展示。

那么现在我们给大家提供了一个基于 uni-list 组件的云端一体化新闻列表页面模板，帮大家快速构建一个复杂多变的新闻列表。

当前模板做了四个事情：

- 通过 `openDB` 的 [opendb-news-articles](https://gitee.com/dcloud/opendb/tree/master/collection/opendb-news-articles)表规范表结构
- 通过 [uni-clientDB](https://ext.dcloud.net.cn/plugin?id=2314) 在本地操作数据库获取数据
- 实现常见的六种新闻列表排版，减少实现同类需求构建代码的工作量
- 实现简单的下拉刷新，上拉加载

**Tips**
- 暂不支持 nvue 页面

## 使用说明

当前模板是在 uni-list 组件基础上，通过插槽的方式实现了不同的新闻列表排版，同时使用了 [uni-clientDB](https://ext.dcloud.net.cn/plugin?id=2314) 完成了云端一体化。大大减少了大家的的代码开发时间。

1. 在 `cloudfunctions` 目录，右键上传所有云函数及公共模块
2. 在 `cloudfunctions` > `db_init.json` 文件，右键初始化数据库，数据结构参考 `openDB` 的[opendb-news-articles](https://gitee.com/dcloud/opendb/tree/master/collection/opendb-news-articles)表结构
3. 运行到 Chrome 查看效果

## 代码说明
> 代码逻辑以及样式见代码示例

### 基本排版

我们提供了六种排版布局，基本上包括了市面上大部分的新闻类列表的常见排版，当前模板为 `水平排列，右图左文` ， 具体实现代码如下

```html

<uni-list>
	<!-- 水平排列，右图左文 -->
	<uni-list-item title="水平排列的右图左文列表，图片通过 footer 插槽完全自定义" note="Dcloud 128评论 21 赞">
		<template v-slot:footer>
			<view class="uni-thumb" style="margin: 0;"><image src="/static/logo.png" mode="aspectFill"></image></view>
		</template>
	</uni-list-item>
</uni-list>

```


## 样式覆盖

模板中通过 `common/uni-ui.scss` 定义了一些标题、图片等的基础样式

如果以上六种排版不能满足需求或者需要调整现有排版的样式，直接修改或覆盖对应样式即可。

## 其他模板样式

1. 云端一体混合布局：[https://ext.dcloud.net.cn/plugin?id=2546](https://ext.dcloud.net.cn/plugin?id=2546)
2. 云端一体垂直布局，大图模式：[https://ext.dcloud.net.cn/plugin?id=2583](https://ext.dcloud.net.cn/plugin?id=2583)
3. 云端一体垂直布局，多行图文混排：[https://ext.dcloud.net.cn/plugin?id=2584](https://ext.dcloud.net.cn/plugin?id=2584)
4. 云端一体垂直布局，多图模式：[https://ext.dcloud.net.cn/plugin?id=2585](https://ext.dcloud.net.cn/plugin?id=2585)
5. 云端一体水平布局，左图右文：[https://ext.dcloud.net.cn/plugin?id=2586](https://ext.dcloud.net.cn/plugin?id=2586)
6. （当前模板）云端一体水平布局，左文右图：[https://ext.dcloud.net.cn/plugin?id=2587](https://ext.dcloud.net.cn/plugin?id=2587)
7. 云端一体垂直布局，无图模式，主标题+副标题：[https://ext.dcloud.net.cn/plugin?id=2588](https://ext.dcloud.net.cn/plugin?id=2588)