-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-04-24 10:32:19
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `oly`
--

-- --------------------------------------------------------

--
-- 表的结构 `cms_article`
--

CREATE TABLE `cms_article` (
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `article_title` varchar(255) NOT NULL COMMENT '文章标题',
  `create_by` bigint(20) DEFAULT NULL COMMENT '发表人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `article_type` tinyint(4) DEFAULT NULL COMMENT '文章类型',
  `article_content` text COMMENT '文章内容',
  `article_build` tinyint(4) DEFAULT NULL COMMENT '编译器',
  `article_top` tinyint(4) DEFAULT NULL COMMENT '顶置级别',
  `article_img` varchar(1024) DEFAULT '""' COMMENT '预览缩略图',
  `article_summary` varchar(255) DEFAULT NULL COMMENT '文章预览',
  `visible` tinyint(1) DEFAULT NULL COMMENT '可见性 0隐藏 1显示',
  `allow_comment` tinyint(1) DEFAULT NULL COMMENT '是否允许回复 0关闭 1开启',
  `reprint_url` varchar(255) DEFAULT NULL COMMENT '转载url',
  `article_url` varchar(255) DEFAULT NULL COMMENT '文章链接别名',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `article_toc` text COMMENT '文章目录',
  `article_md` text COMMENT 'md源码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cms_article`
--

INSERT INTO `cms_article` (`article_id`, `article_title`, `create_by`, `create_time`, `update_by`, `update_time`, `article_type`, `article_content`, `article_build`, `article_top`, `article_img`, `article_summary`, `visible`, `allow_comment`, `reprint_url`, `article_url`, `keywords`, `description`, `article_toc`, `article_md`) VALUES
(1, 'test', 1, '2022-03-28 13:17:56', NULL, NULL, 3, '<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\n', 1, 0, ',,,,', 'dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\n', 3, 1, '', '1648444486926', 'test', '', '\n\n											', 'dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc'),
(2, '支持Spring9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成', 1, '2022-03-28 20:50:24', 1, '2022-04-15 13:38:02', 3, '<p><img src=\"http://127.0.0.1:8090/oly/oss/download/image\\2022\\03\\30\\logo_hw_20220330203150A001.png\" alt=\"\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\n', 1, 0, 'http://127.0.0.1:8090/oly/oss/download/image\\2022\\03\\30\\logo_hw_20220330203150A001.png', '9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\n', 3, 1, '', '1648471744193', '特色', '', '\n\n											', '![](http://127.0.0.1:8090/oly/oss/download/image\\2022\\03\\30\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成');

-- --------------------------------------------------------

--
-- 表的结构 `cms_article_cat`
--

CREATE TABLE `cms_article_cat` (
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `cat_id` bigint(20) NOT NULL COMMENT '分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cms_article_cat`
--

INSERT INTO `cms_article_cat` (`article_id`, `cat_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cms_article_count`
--

CREATE TABLE `cms_article_count` (
  `article_id` bigint(20) NOT NULL COMMENT '文章Id',
  `article_look` bigint(20) DEFAULT '0' COMMENT '浏览数',
  `article_like` bigint(20) DEFAULT '0' COMMENT '喜欢数',
  `article_nasty` bigint(20) DEFAULT '0' COMMENT '不喜欢数',
  `article_discuss` bigint(20) DEFAULT '0' COMMENT '讨论数',
  `article_score` float(4,2) DEFAULT '0.00' COMMENT '评分',
  `article_share` bigint(20) DEFAULT '0' COMMENT '分享数',
  `article_collect` bigint(20) DEFAULT '0' COMMENT '收藏数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章统计';

--
-- 转存表中的数据 `cms_article_count`
--

INSERT INTO `cms_article_count` (`article_id`, `article_look`, `article_like`, `article_nasty`, `article_discuss`, `article_score`, `article_share`, `article_collect`) VALUES
(1, 17, 0, 0, 0, 0.00, 0, 0),
(2, 2, 0, 0, 0, 0.00, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cms_article_tag`
--

CREATE TABLE `cms_article_tag` (
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `tag_id` bigint(20) NOT NULL COMMENT '标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cms_article_tag`
--

INSERT INTO `cms_article_tag` (`article_id`, `tag_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cms_article_taoke`
--

CREATE TABLE `cms_article_taoke` (
  `article_id` bigint(20) NOT NULL COMMENT '文章Id',
  `shop_id` varchar(64) NOT NULL COMMENT '商品Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章关联淘客';

-- --------------------------------------------------------

--
-- 表的结构 `cms_cat`
--

CREATE TABLE `cms_cat` (
  `cat_id` bigint(20) NOT NULL COMMENT '分类id',
  `cat_name` varchar(255) NOT NULL COMMENT '分类名字',
  `cat_icon` varchar(255) DEFAULT NULL COMMENT '栏目图标',
  `visible` tinyint(1) DEFAULT NULL COMMENT '是否显示(0不显示)',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父元素id',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `update_by` bigint(20) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `cat_url` varchar(255) DEFAULT '' COMMENT '类目地址',
  `parent` bit(1) DEFAULT b'0' COMMENT '节点 0 默认非节点',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限字符',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `cat_count` bigint(20) DEFAULT NULL COMMENT '关联文章数',
  `cat_type` tinyint(4) DEFAULT '0' COMMENT '类别类型:0为分类类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `cms_cat`
--

INSERT INTO `cms_cat` (`cat_id`, `cat_name`, `cat_icon`, `visible`, `parent_id`, `create_time`, `update_time`, `remark`, `update_by`, `create_by`, `cat_url`, `parent`, `ancestors`, `perms`, `keywords`, `description`, `order_num`, `cat_count`, `cat_type`) VALUES
(1, '止戈标签', '', 2, 0, '2022-03-27 16:58:21', '2022-04-21 23:31:15', '止戈标签', NULL, 1, '/cat/test', b'0', '0', NULL, '内容', '内容', 0, 1, 1),
(2, '特色', '', 2, 1, '2022-03-28 20:04:30', NULL, '特色分类', NULL, 1, '', b'1', '0,1', NULL, '特色分类', '特色分类', 1, 1, 1),
(3, '应用', '', 2, 1, '2022-03-28 20:05:24', '2022-03-28 20:05:41', '', NULL, 1, '', b'1', '0,1', NULL, '', '', 2, NULL, 1),
(4, '技术', '', 2, 1, '2022-03-28 20:07:06', NULL, '', NULL, 1, '', b'1', '0,1', NULL, '', '', 3, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cms_collect_record`
--

CREATE TABLE `cms_collect_record` (
  `collect_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT '1' COMMENT '状态',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='喜欢操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `cms_column`
--

CREATE TABLE `cms_column` (
  `column_id` bigint(20) NOT NULL COMMENT '栏目导航id',
  `column_name` varchar(255) NOT NULL COMMENT '栏目名字',
  `column_icon` varchar(255) DEFAULT NULL COMMENT '栏目图标',
  `visible` tinyint(1) DEFAULT NULL COMMENT '是否显示(1显示，0不显示)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父元素id',
  `parent` bit(1) DEFAULT NULL COMMENT '是否是父元素 0不是 1 是',
  `create_time` datetime DEFAULT '0002-11-30 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `open_type` tinyint(1) DEFAULT NULL,
  `perms` varchar(255) DEFAULT '',
  `column_url` varchar(255) DEFAULT NULL COMMENT '栏目链接',
  `update_by` bigint(20) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `ancestors` varchar(50) DEFAULT NULL COMMENT '祖级列表',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `column_locate` tinyint(1) DEFAULT NULL COMMENT '0站内还是站外导航'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cms_column`
--

INSERT INTO `cms_column` (`column_id`, `column_name`, `column_icon`, `visible`, `parent_id`, `parent`, `create_time`, `update_time`, `remark`, `open_type`, `perms`, `column_url`, `update_by`, `create_by`, `ancestors`, `keywords`, `description`, `order_num`, `column_locate`) VALUES
(1, '止戈文档', '', 1, 0, b'0', '2022-03-01 04:02:03', NULL, '', 1, NULL, '', NULL, 1, '0', '', '', 1, 0),
(2, '主页', '', 1, 1, b'1', '2022-03-01 04:03:40', NULL, '止戈主页', 1, NULL, '/index', NULL, 1, '0,1', '止戈主页', '止戈主页', 1, 1),
(3, '文档', '', 2, 1, b'1', '2022-03-28 16:49:35', NULL, '', 1, '', '/posts', NULL, 1, '0,1', '', '', 2, 1),
(4, '下载地址', '', 2, 1, b'0', '2022-03-28 16:50:52', '2022-03-28 16:51:16', '', 1, '', '', 1, 1, '0,1', '', '', 3, 0),
(5, 'gitee', '', 2, 4, b'1', '2022-03-28 16:51:49', NULL, '', 1, '', 'https://gitee.com/', NULL, 1, '0,1,4', '', '', 1, 1),
(6, 'github', '', 2, 4, b'1', '2022-03-28 16:52:38', NULL, '', 1, '', 'https://github.com/', NULL, 1, '0,1,4', '', '', 2, 1),
(7, '关于本站', '', 2, 1, b'1', '2022-03-28 16:54:27', NULL, '', 1, '', '/about', NULL, 1, '0,1', '', '', 4, 0),
(8, '止戈博客', '', 1, 0, b'0', '2022-04-01 22:20:03', NULL, '止戈博客', 1, '', '', NULL, 1, '0', '止戈博客', '', 2, 0),
(9, '主页', '', 1, 8, b'1', '2022-04-01 22:21:10', NULL, '主页', 1, '', '/index', NULL, 1, '0,8', '', '', 1, 0),
(10, '分类', '', 1, 8, b'1', '2022-04-02 18:11:58', NULL, '', 1, '', '/category', NULL, 1, '0,8', '', '', 2, 1),
(11, '标签', '', 2, 8, b'1', '2022-04-02 18:12:51', NULL, '', 1, '', '/tag', NULL, 1, '0,8', '', '', 3, 1),
(12, '时间线', '', 2, 8, b'1', '2022-04-14 22:16:23', '2022-04-14 22:21:07', '', 1, '', '/timeLine', 1, 1, '0,8', '', '', 1, 1),
(13, '关于本站', '', 2, 8, b'1', '2022-04-14 22:17:50', NULL, '', 0, '', '/about', NULL, 1, '0,8', '', '', 5, 1),
(14, '排行', '', 2, 8, b'1', '2022-04-14 22:20:00', '2022-04-14 22:20:36', '', 1, '', '/rank', 1, 1, '0,8', '', '', 1, 1),
(15, '站点导航', '', 2, 8, b'1', '2022-04-14 22:23:17', NULL, '', 1, '', '/links', NULL, 1, '0,8', '', '', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cms_comment`
--

CREATE TABLE `cms_comment` (
  `comment_id` bigint(20) NOT NULL COMMENT '评论id',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '主楼|为0为主楼',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `from_by` varchar(64) DEFAULT NULL COMMENT '发布人（用户id_昵称）',
  `reply_by` varchar(64) DEFAULT NULL COMMENT '回复的人（用户id_昵称）',
  `content` text COMMENT '内容',
  `comment_type` bit(1) DEFAULT NULL COMMENT '评论类型',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器',
  `nasty_count` bigint(20) DEFAULT NULL COMMENT '讨厌统计',
  `like_count` bigint(20) DEFAULT NULL COMMENT '喜欢统计',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `cms_comment_record`
--

CREATE TABLE `cms_comment_record` (
  `comment_id` bigint(20) NOT NULL COMMENT '评论id',
  `user_id` bigint(20) NOT NULL COMMENT '用户Id',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态1喜欢，2讨厌，3取消喜欢，4取消讨厌',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器',
  `article_id` bigint(20) DEFAULT NULL COMMENT '文章id',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论记录表';

-- --------------------------------------------------------

--
-- 表的结构 `cms_contact`
--

CREATE TABLE `cms_contact` (
  `contact_id` int(11) NOT NULL COMMENT '反馈id',
  `subject` varchar(128) DEFAULT NULL COMMENT '主题',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `handler` bigint(20) DEFAULT NULL COMMENT '处理人',
  `email` varchar(45) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `visible` tinyint(1) DEFAULT '0' COMMENT '状态0 未查看',
  `other_contact` varchar(45) DEFAULT NULL COMMENT '其它联系方式',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `contact_type` tinyint(1) DEFAULT NULL COMMENT '类型',
  `handle_result` varchar(1024) DEFAULT NULL COMMENT '结果',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `create_by` bigint(20) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `user_call` varchar(16) DEFAULT NULL COMMENT '称呼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈|建议';

-- --------------------------------------------------------

--
-- 表的结构 `cms_like_record`
--

CREATE TABLE `cms_like_record` (
  `like_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='喜欢操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `cms_link`
--

CREATE TABLE `cms_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT '链接id',
  `link_url` varchar(200) NOT NULL COMMENT '链接地址',
  `link_name` varchar(50) DEFAULT NULL COMMENT '链接名',
  `link_suggest` varchar(300) DEFAULT NULL COMMENT '链接介绍',
  `link_favicon` varchar(255) DEFAULT NULL COMMENT '链接LOGO',
  `visible` tinyint(3) UNSIGNED DEFAULT NULL COMMENT '状态',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `group_name` varchar(64) NOT NULL COMMENT '分组名',
  `open_type` tinyint(1) DEFAULT NULL COMMENT '打开方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cms_link`
--

INSERT INTO `cms_link` (`link_id`, `link_url`, `link_name`, `link_suggest`, `link_favicon`, `visible`, `remark`, `create_time`, `update_time`, `update_by`, `create_by`, `order_num`, `group_name`, `open_type`) VALUES
(1, 'http://127.0.0.1:8090', '止戈博客', NULL, 'http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png', 1, NULL, '2022-04-15 18:06:06', '2022-04-15 21:14:34', NULL, NULL, 0, '博客推荐', NULL),
(2, 'http://127.0.0.1:8090', '止戈博客2', NULL, 'http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png', 2, NULL, '2022-04-15 22:59:34', NULL, NULL, NULL, 1, '博客推荐', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cms_log_record`
--

CREATE TABLE `cms_log_record` (
  `log_id` bigint(20) NOT NULL COMMENT '记录ID',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1用户）',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `oper_bower` varchar(128) DEFAULT '' COMMENT '使用浏览器',
  `oper_system` varchar(128) DEFAULT '' COMMENT '使用系统'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容请求记录表';

--
-- 转存表中的数据 `cms_log_record`
--

INSERT INTO `cms_log_record` (`log_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `oper_bower`, `oper_system`) VALUES
(1, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-25 17:22:04', 'Chrome 9', 'Windows 10'),
(2, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 17:37:05', 'Chrome 9', 'Windows 10'),
(3, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 17:49:35', 'Chrome 9', 'Windows 10'),
(4, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 17:51:04', 'Chrome 9', 'Windows 10'),
(5, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 18:18:23', 'Chrome 9', 'Windows 10'),
(6, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 18:19:08', 'Chrome 9', 'Windows 10'),
(7, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 18:21:26', 'Chrome 9', 'Windows 10'),
(8, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 18:22:15', 'Chrome 9', 'Windows 10'),
(9, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 23:37:44', 'Chrome 9', 'Windows 10'),
(10, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 23:45:14', 'Chrome 9', 'Windows 10'),
(11, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-25 23:46:23', 'Chrome 9', 'Windows 10'),
(12, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 08:15:42', 'Chrome 9', 'Windows 10'),
(13, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 08:15:49', 'Chrome 9', 'Windows 10'),
(14, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(15, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(16, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(17, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(18, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(19, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(20, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(21, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(22, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(23, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 09:46:01', 'Chrome 9', 'Windows 10'),
(24, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 09:46:43', 'Chrome 9', 'Windows 10'),
(25, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:25:07', 'Chrome 9', 'Windows 10'),
(26, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:25:10', 'Chrome 9', 'Windows 10'),
(27, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:25:27', 'Chrome 9', 'Windows 10'),
(28, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/null/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:25:32', 'Chrome 9', 'Windows 10'),
(29, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:40:17', 'Chrome 9', 'Windows 10'),
(30, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:40:35', 'Chrome 9', 'Windows 10'),
(31, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:40:43', 'Chrome 9', 'Windows 10'),
(32, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 10:42:43', 'Chrome 9', 'Windows 10'),
(33, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:42:47', 'Chrome 9', 'Windows 10'),
(34, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:43:00', 'Chrome 9', 'Windows 10'),
(35, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:45:05', 'Chrome 9', 'Windows 10'),
(36, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:45:15', 'Chrome 9', 'Windows 10'),
(37, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:45:29', 'Chrome 9', 'Windows 10'),
(38, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:46:46', 'Chrome 9', 'Windows 10'),
(39, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/1', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(40, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(41, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(42, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(43, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(44, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(45, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:17', 'Chrome 9', 'Windows 10'),
(46, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(47, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(48, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(49, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(50, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(51, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(52, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(53, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:18', 'Chrome 9', 'Windows 10'),
(54, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:19', 'Chrome 9', 'Windows 10'),
(55, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:19', 'Chrome 9', 'Windows 10'),
(56, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:19', 'Chrome 9', 'Windows 10'),
(57, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:19', 'Chrome 9', 'Windows 10'),
(58, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:19', 'Chrome 9', 'Windows 10'),
(59, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/1', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:32', 'Chrome 9', 'Windows 10'),
(60, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:32', 'Chrome 9', 'Windows 10'),
(61, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(62, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(63, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(64, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(65, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(66, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(67, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:34', 'Chrome 9', 'Windows 10'),
(68, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(69, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(70, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(71, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(72, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(73, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(74, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(75, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:35', 'Chrome 9', 'Windows 10'),
(76, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:36', 'Chrome 9', 'Windows 10'),
(77, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:36', 'Chrome 9', 'Windows 10'),
(78, '获取文章列表', 0, 'com.oly.cms.web.controller.page.WebPageController.posts()', 'GET', 1, '/zgcms/post/', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:36', 'Chrome 9', 'Windows 10'),
(79, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:47:56', 'Chrome 9', 'Windows 10'),
(80, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:\"', 0, '', '2022-03-26 10:51:36', 'Chrome 9', 'Windows 10'),
(81, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 17:39:01', 'Chrome 9', 'Windows 10'),
(82, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 17:39:05', 'Chrome 9', 'Windows 10'),
(83, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-26 17:39:59', 'Chrome 9', 'Windows 10'),
(84, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-27 18:17:03', 'Chrome 9', 'Windows 10'),
(85, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-27 18:18:37', 'Chrome 9', 'Windows 10'),
(86, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-27 22:11:55', 'Chrome 9', 'Windows 10'),
(87, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-27 22:12:00', 'Chrome 9', 'Windows 10'),
(88, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 00:23:20', 'Chrome 9', 'Windows 10'),
(89, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 01:56:58', 'Chrome 9', 'Windows 10'),
(90, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 02:04:21', 'Chrome 9', 'Windows 10'),
(91, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 02:04:45', 'Chrome 9', 'Windows 10'),
(92, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 02:07:20', 'Chrome 9', 'Windows 10'),
(93, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 02:11:20', 'Chrome 9', 'Windows 10'),
(94, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 03:20:54', 'Chrome 9', 'Windows 10'),
(95, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-28 03:21:01', 'Chrome 9', 'Windows 10'),
(96, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 03:21:01', 'Chrome 9', 'Windows 10'),
(97, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 03:22:08', 'Chrome 9', 'Windows 10'),
(98, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 07:31:49', 'Chrome 9', 'Windows 10'),
(99, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 11:52:02', 'Chrome 9', 'Windows 10'),
(100, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 13:24:32', 'Chrome 9', 'Windows 10'),
(101, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:24:46', 'Chrome 9', 'Windows 10'),
(102, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:27:13', 'Chrome 9', 'Windows 10'),
(103, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:28:23', 'Chrome 9', 'Windows 10'),
(104, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:28:47', 'Chrome 9', 'Windows 10'),
(105, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:35:38', 'Chrome 9', 'Windows 10'),
(106, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:37:10', 'Chrome 9', 'Windows 10'),
(107, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:42:18', 'Chrome 9', 'Windows 10'),
(108, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:43:17', 'Chrome 9', 'Windows 10'),
(109, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:44:18', 'Chrome 9', 'Windows 10'),
(110, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:45:09', 'Chrome 9', 'Windows 10'),
(111, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:48:49', 'Chrome 9', 'Windows 10'),
(112, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:49:32', 'Chrome 9', 'Windows 10'),
(113, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:49:36', 'Chrome 9', 'Windows 10'),
(114, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:19', 'Chrome 9', 'Windows 10'),
(115, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:35', 'Chrome 9', 'Windows 10'),
(116, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:35', 'Chrome 9', 'Windows 10'),
(117, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:36', 'Chrome 9', 'Windows 10'),
(118, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:37', 'Chrome 9', 'Windows 10'),
(119, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:37', 'Chrome 9', 'Windows 10'),
(120, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:50:37', 'Chrome 9', 'Windows 10'),
(121, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:02', 'Chrome 9', 'Windows 10'),
(122, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:21', 'Chrome 9', 'Windows 10'),
(123, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:22', 'Chrome 9', 'Windows 10'),
(124, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:23', 'Chrome 9', 'Windows 10'),
(125, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:23', 'Chrome 9', 'Windows 10'),
(126, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:23', 'Chrome 9', 'Windows 10'),
(127, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:51:23', 'Chrome 9', 'Windows 10'),
(128, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:52:08', 'Chrome 9', 'Windows 10'),
(129, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:53:16', 'Chrome 9', 'Windows 10'),
(130, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:53:18', 'Chrome 9', 'Windows 10'),
(131, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:53:38', 'Chrome 9', 'Windows 10'),
(132, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:54:00', 'Chrome 9', 'Windows 10'),
(133, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:54:43', 'Chrome 9', 'Windows 10'),
(134, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 13:55:13', 'Chrome 9', 'Windows 10'),
(135, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 14:34:06', 'Chrome 9', 'Windows 10'),
(136, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-28 14:34:17', 'Chrome 9', 'Windows 10'),
(137, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 16:52:49', 'Chrome 9', 'Windows 10'),
(138, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 16:54:30', 'Chrome 9', 'Windows 10'),
(139, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 16:54:49', 'Chrome 9', 'Windows 10'),
(140, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 16:55:28', 'Chrome 9', 'Windows 10'),
(141, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:05:58', 'Chrome 9', 'Windows 10'),
(142, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-28 20:05:58', 'Chrome 9', 'Windows 10'),
(143, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:05:58', 'Chrome 9', 'Windows 10'),
(144, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:05:58', 'Chrome 9', 'Windows 10'),
(145, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:54:24', 'Chrome 9', 'Windows 10'),
(146, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:54:24', 'Chrome 9', 'Windows 10'),
(147, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:56:11', 'Chrome 9', 'Windows 10'),
(148, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 20:58:56', 'Chrome 9', 'Windows 10'),
(149, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:00:33', 'Chrome 9', 'Windows 10'),
(150, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:01:05', 'Chrome 9', 'Windows 10'),
(151, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:01:07', 'Chrome 9', 'Windows 10'),
(152, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:02:19', 'Chrome 9', 'Windows 10'),
(153, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:02:52', 'Chrome 9', 'Windows 10'),
(154, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-28 21:04:14', 'Chrome 9', 'Windows 10'),
(155, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:11:20', 'Chrome 9', 'Windows 10'),
(156, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:14:54', 'Chrome 9', 'Windows 10'),
(157, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:21', 'Chrome 9', 'Windows 10'),
(158, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:26', 'Chrome 9', 'Windows 10'),
(159, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:26', 'Chrome 9', 'Windows 10'),
(160, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:32', 'Chrome 9', 'Windows 10'),
(161, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:32', 'Chrome 9', 'Windows 10'),
(162, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:34', 'Chrome 9', 'Windows 10'),
(163, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:34', 'Chrome 9', 'Windows 10'),
(164, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:35', 'Chrome 9', 'Windows 10'),
(165, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:35', 'Chrome 9', 'Windows 10'),
(166, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:35', 'Chrome 9', 'Windows 10'),
(167, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:35', 'Chrome 9', 'Windows 10'),
(168, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:47:45', 'Chrome 9', 'Windows 10'),
(169, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:47:45', 'Chrome 9', 'Windows 10'),
(170, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:48:18', 'Chrome 9', 'Windows 10'),
(171, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:48:18', 'Chrome 9', 'Windows 10'),
(172, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:48:34', 'Chrome 9', 'Windows 10'),
(173, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:48:34', 'Chrome 9', 'Windows 10'),
(174, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:49:08', 'Chrome 9', 'Windows 10'),
(175, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:49:11', 'Chrome 9', 'Windows 10'),
(176, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:49:11', 'Chrome 9', 'Windows 10'),
(177, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"redirect:/\"', 0, '', '2022-03-29 14:49:15', 'Chrome 9', 'Windows 10'),
(178, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:49:15', 'Chrome 9', 'Windows 10'),
(179, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 14:51:54', 'Chrome 9', 'Windows 10'),
(180, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgcms/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/post\"', 0, '', '2022-03-29 14:51:59', 'Chrome 9', 'Windows 10'),
(181, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-29 20:00:30', 'Chrome 9', 'Windows 10'),
(182, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:34:07', 'Chrome 9', 'Windows 10'),
(183, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:35:56', 'Chrome 9', 'Windows 10'),
(184, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:42:12', 'Chrome 9', 'Windows 10'),
(185, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:42:33', 'Chrome 9', 'Windows 10'),
(186, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:42:57', 'Chrome 9', 'Windows 10'),
(187, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:44:34', 'Chrome 9', 'Windows 10'),
(188, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:47:03', 'Chrome 9', 'Windows 10'),
(189, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 13:47:07', 'Chrome 9', 'Windows 10'),
(190, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 16:38:04', 'Chrome 9', 'Windows 10'),
(191, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 16:38:04', 'Chrome 9', 'Windows 10'),
(192, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 16:40:53', 'Chrome 9', 'Windows 10'),
(193, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 16:41:47', 'Chrome 9', 'Windows 10'),
(194, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 16:42:30', 'Chrome 9', 'Windows 10'),
(195, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 17:39:32', 'Chrome 9', 'Windows 10'),
(196, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 17:56:17', 'Chrome 9', 'Windows 10'),
(197, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 17:57:44', 'Chrome 9', 'Windows 10'),
(198, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 18:04:29', 'Chrome 9', 'Windows 10'),
(199, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 18:28:12', 'Mobile Safari', 'iOS 10 (iPhone)'),
(200, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 18:55:25', 'Chrome 9', 'Windows 10'),
(201, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 19:08:36', 'Chrome 9', 'Windows 10'),
(202, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 19:49:06', 'Chrome 9', 'Windows 10'),
(203, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 23:34:38', 'Chrome 9', 'Windows 10'),
(204, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 23:37:04', 'Chrome 9', 'Windows 10'),
(205, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-30 23:41:16', 'Chrome 9', 'Windows 10'),
(206, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:11:48', 'Chrome 9', 'Windows 10'),
(207, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:23:30', 'Chrome 9', 'Windows 10'),
(208, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:25:04', 'Chrome 9', 'Windows 10'),
(209, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:25:14', 'Chrome 9', 'Windows 10'),
(210, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:26:56', 'Chrome 9', 'Windows 10'),
(211, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:27:47', 'Chrome 9', 'Windows 10'),
(212, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:28:59', 'Chrome 9', 'Windows 10'),
(213, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 00:29:29', 'Chrome 9', 'Windows 10'),
(214, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 10:00:55', 'Chrome 9', 'Windows 10'),
(215, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 10:01:49', 'Chrome 9', 'Windows 10'),
(216, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 10:02:51', 'Chrome 9', 'Windows 10'),
(217, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 10:03:04', 'Chrome 9', 'Windows 10'),
(218, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-03-31 10:04:33', 'Chrome 9', 'Windows 10'),
(219, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 15:38:54', 'Chrome 9', 'Windows 10'),
(220, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 16:28:31', 'Chrome 9', 'Windows 10'),
(221, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 16:30:23', 'Chrome 9', 'Windows 10'),
(222, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 16:41:49', 'Chrome 9', 'Windows 10'),
(223, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 17:04:54', 'Chrome 9', 'Windows 10'),
(224, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 17:06:18', 'Chrome 9', 'Windows 10'),
(225, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 17:07:32', 'Chrome 9', 'Windows 10'),
(226, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 17:09:46', 'Chrome 9', 'Windows 10'),
(227, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 18:01:02', 'Chrome 9', 'Windows 10'),
(228, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 18:01:02', 'Chrome 9', 'Windows 10'),
(229, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 18:02:15', 'Chrome 9', 'Windows 10'),
(230, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-03-31 18:04:03', 'Chrome 9', 'Windows 10'),
(231, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 19:00:01', 'Chrome 9', 'Windows 10'),
(232, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 19:03:14', 'Chrome 9', 'Windows 10'),
(233, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 19:03:34', 'Chrome 9', 'Windows 10'),
(234, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 19:06:15', 'Chrome 9', 'Windows 10'),
(235, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 19:08:19', 'Chrome 9', 'Windows 10'),
(236, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 22:12:11', 'Chrome 9', 'Windows 10'),
(237, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-03-31 23:49:41', 'Chrome 9', 'Windows 10'),
(238, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 11:13:07', 'Chrome 9', 'Windows 10'),
(239, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 11:13:41', 'Chrome 9', 'Windows 10'),
(240, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 11:16:16', 'Chrome 9', 'Windows 10');
INSERT INTO `cms_log_record` (`log_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `oper_bower`, `oper_system`) VALUES
(241, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 11:16:20', 'Chrome 9', 'Windows 10'),
(242, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 11:25:22', 'Chrome 9', 'Windows 10'),
(243, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 20:19:34', 'Chrome 9', 'Windows 10'),
(244, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 20:32:48', 'Chrome 9', 'Windows 10'),
(245, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 20:35:57', 'Chrome 9', 'Windows 10'),
(246, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 22:05:07', 'Chrome 9', 'Windows 10'),
(247, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/zgblog/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-01 22:21:15', 'Chrome 9', 'Windows 10'),
(248, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:21:30', 'Chrome 9', 'Windows 10'),
(249, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:23:53', 'Chrome 9', 'Windows 10'),
(250, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:24:16', 'Chrome 9', 'Windows 10'),
(251, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:24:19', 'Chrome 9', 'Windows 10'),
(252, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:25:54', 'Chrome 9', 'Windows 10'),
(253, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:59:06', 'Chrome 9', 'Windows 10'),
(254, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 22:59:16', 'Chrome 9', 'Windows 10'),
(255, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 23:05:10', 'Chrome 9', 'Windows 10'),
(256, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-04-01 23:05:15', 'Chrome 9', 'Windows 10'),
(257, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 23:05:49', 'Chrome 9', 'Windows 10'),
(258, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 23:07:07', 'Chrome 9', 'Windows 10'),
(259, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-04-01 23:07:11', 'Chrome 9', 'Windows 10'),
(260, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-01 23:09:01', 'Chrome 9', 'Windows 10'),
(261, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-02 00:04:43', 'Chrome 9', 'Windows 10'),
(262, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/zgblog/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-02 00:05:14', 'Chrome 9', 'Windows 10'),
(263, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-04-02 18:12:59', 'Chrome 9', 'Windows 10'),
(264, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-04-02 18:45:39', 'Chrome 9', 'Windows 10'),
(265, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-02 21:28:29', 'Chrome 9', 'Windows 10'),
(266, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-02 21:28:37', 'Chrome 9', 'Windows 10'),
(267, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-02 21:28:37', 'Chrome 9', 'Windows 10'),
(268, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-02 21:28:38', 'Chrome 9', 'Windows 10'),
(269, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-02 21:28:41', 'Chrome 9', 'Windows 10'),
(270, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-02 21:28:58', 'Chrome 9', 'Windows 10'),
(271, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:25:04', 'Chrome 9', 'Windows 10'),
(272, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:26:00', 'Chrome 9', 'Windows 10'),
(273, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:26:04', 'Chrome 9', 'Windows 10'),
(274, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:26:24', 'Chrome 9', 'Windows 10'),
(275, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:26:47', 'Chrome 9', 'Windows 10'),
(276, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:26:50', 'Chrome 9', 'Windows 10'),
(277, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:27:06', 'Chrome 9', 'Windows 10'),
(278, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:27:27', 'Chrome 9', 'Windows 10'),
(279, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:27:35', 'Chrome 9', 'Windows 10'),
(280, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:31:57', 'Chrome 9', 'Windows 10'),
(281, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:32:01', 'Chrome 9', 'Windows 10'),
(282, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:32:07', 'Chrome 9', 'Windows 10'),
(283, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:32:12', 'Chrome 9', 'Windows 10'),
(284, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:32:17', 'Chrome 9', 'Windows 10'),
(285, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:32:22', 'Chrome 9', 'Windows 10'),
(286, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:32:31', 'Chrome 9', 'Windows 10'),
(287, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:32:39', 'Chrome 9', 'Windows 10'),
(288, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:32:58', 'Chrome 9', 'Windows 10'),
(289, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:12', 'Chrome 9', 'Windows 10'),
(290, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:31', 'Chrome 9', 'Windows 10'),
(291, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:31', 'Chrome 9', 'Windows 10'),
(292, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:31', 'Chrome 9', 'Windows 10'),
(293, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:32', 'Chrome 9', 'Windows 10'),
(294, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:32', 'Chrome 9', 'Windows 10'),
(295, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:32', 'Chrome 9', 'Windows 10'),
(296, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:33', 'Chrome 9', 'Windows 10'),
(297, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:33:54', 'Chrome 9', 'Windows 10'),
(298, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:34:32', 'Chrome 9', 'Windows 10'),
(299, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 12:34:37', 'Chrome 9', 'Windows 10'),
(300, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:38:12', 'Chrome 9', 'Windows 10'),
(301, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 12:38:16', 'Chrome 9', 'Windows 10'),
(302, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-03 16:06:56', 'Chrome 9', 'Windows 10'),
(303, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 16:11:29', 'Chrome 9', 'Windows 10'),
(304, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 16:14:47', 'Chrome 9', 'Windows 10'),
(305, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 16:15:00', 'Chrome 9', 'Windows 10'),
(306, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-03 17:13:04', 'Chrome 9', 'Windows 10'),
(307, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-04 00:13:48', 'Chrome 9', 'Windows 10'),
(308, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-04 00:13:55', 'Chrome 9', 'Windows 10'),
(309, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-04 00:41:44', 'Chrome 9', 'Windows 10'),
(310, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-04 13:57:29', 'Chrome 9', 'Windows 10'),
(311, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-04 13:58:33', 'Chrome 9', 'Windows 10'),
(312, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-04 13:58:36', 'Chrome 9', 'Windows 10'),
(313, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-04 14:01:16', 'Chrome 9', 'Windows 10'),
(314, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-04 14:03:44', 'Chrome 9', 'Windows 10'),
(315, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-04 23:57:30', 'Chrome 9', 'Windows 10'),
(316, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:05:18', 'Chrome 9', 'Windows 10'),
(317, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:07:37', 'Chrome 9', 'Windows 10'),
(318, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:09:05', 'Chrome 9', 'Windows 10'),
(319, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:13:06', 'Chrome 9', 'Windows 10'),
(320, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:14:54', 'Chrome 9', 'Windows 10'),
(321, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:14:57', 'Chrome 9', 'Windows 10'),
(322, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:15:00', 'Chrome 9', 'Windows 10'),
(323, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:19:44', 'Chrome 9', 'Windows 10'),
(324, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:22:12', 'Chrome 9', 'Windows 10'),
(325, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:35:49', 'Chrome 9', 'Windows 10'),
(326, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:36:10', 'Chrome 9', 'Windows 10'),
(327, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:36:34', 'Chrome 9', 'Windows 10'),
(328, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:51:07', 'Chrome 9', 'Windows 10'),
(329, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 00:57:34', 'Chrome 9', 'Windows 10'),
(330, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-05 01:01:01', 'Chrome 9', 'Windows 10'),
(331, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-09 01:11:53', 'Chrome 10', 'Windows 10'),
(332, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-11 12:45:06', 'Chrome 10', 'Windows 10'),
(333, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', 'null', 1, 'Cannot find cache named \'menu-cache\' for Builder[public com.oly.cms.general.model.po.WebMenu com.oly.cms.general.service.cache.WebMenuCacheService.getWebMenuById(long)] caches=[menu-cache] | key=\'\' | keyGenerator=\'myKeyGenerator\' | cacheManager=\'\' | cacheResolver=\'\' | condition=\'\' | unless=\'\' | sync=\'false\'', '2022-04-13 03:30:43', 'Chrome 10', 'Windows 10'),
(334, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-13 14:50:37', 'Chrome 10', 'Windows 10'),
(335, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 01:51:10', 'Chrome 10', 'Windows 10'),
(336, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 01:51:28', 'Chrome 10', 'Windows 10'),
(337, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 01:51:30', 'Chrome 10', 'Windows 10'),
(338, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 01:51:38', 'Chrome 10', 'Windows 10'),
(339, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 02:03:13', 'Chrome 10', 'Windows 10'),
(340, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 02:03:48', 'Chrome 10', 'Windows 10'),
(341, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 02:03:54', 'Chrome 10', 'Windows 10'),
(342, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 02:03:58', 'Chrome 10', 'Windows 10'),
(343, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 02:04:03', 'Chrome 10', 'Windows 10'),
(344, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 02:08:43', 'Chrome 10', 'Windows 10'),
(345, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 02:08:55', 'Chrome 10', 'Windows 10'),
(346, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 02:08:56', 'Chrome 10', 'Windows 10'),
(347, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 03:28:46', 'Chrome 10', 'Windows 10'),
(348, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 03:29:04', 'Chrome 10', 'Windows 10'),
(349, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 03:34:25', 'Chrome 10', 'Windows 10'),
(350, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 03:40:13', 'Chrome 10', 'Windows 10'),
(351, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 03:48:49', 'Chrome 10', 'Windows 10'),
(352, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:21:44', 'Chrome 10', 'Windows 10'),
(353, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:25:08', 'Chrome 10', 'Windows 10'),
(354, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:25:30', 'Chrome 10', 'Windows 10'),
(355, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:27:06', 'Chrome 10', 'Windows 10'),
(356, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:28:40', 'Chrome 10', 'Windows 10'),
(357, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:31:37', 'Chrome 10', 'Windows 10'),
(358, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:33:12', 'Chrome 10', 'Windows 10'),
(359, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:43:02', 'Chrome 10', 'Windows 10'),
(360, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:48:00', 'Chrome 10', 'Windows 10'),
(361, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:48:35', 'Chrome 10', 'Windows 10'),
(362, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:49:35', 'Chrome 10', 'Windows 10'),
(363, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 15:49:38', 'Chrome 10', 'Windows 10'),
(364, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:49:40', 'Chrome 10', 'Windows 10'),
(365, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-15 15:49:49', 'Chrome 10', 'Windows 10'),
(366, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 15:49:51', 'Chrome 10', 'Windows 10'),
(367, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-04-15 15:49:53', 'Chrome 10', 'Windows 10'),
(368, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-15 19:33:01', 'Chrome 10', 'Windows 10'),
(369, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 19:33:16', 'Chrome 10', 'Windows 10'),
(370, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:06:18', 'Mobile Safari', 'Mac OS X (iPhone)'),
(371, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:10:39', 'Chrome 10', 'Windows 10'),
(372, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:11:33', 'Chrome 10', 'Windows 10'),
(373, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:12:51', 'Chrome 10', 'Windows 10'),
(374, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:13:01', 'Chrome 10', 'Windows 10'),
(375, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:15:03', 'Chrome 10', 'Windows 10'),
(376, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 23:18:52', 'Mobile Safari', 'Mac OS X (iPhone)'),
(377, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 23:18:53', 'Mobile Safari', 'Mac OS X (iPhone)'),
(378, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:22:17', 'Chrome 10', 'Windows 10'),
(379, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 23:26:59', 'Chrome 10', 'Windows 10'),
(380, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:27:38', 'Chrome 10', 'Windows 10'),
(381, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 23:33:12', 'Chrome 10', 'Windows 10'),
(382, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-04-15 23:33:31', 'Chrome 10', 'Windows 10'),
(383, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-15 23:34:30', 'Chrome 10', 'Windows 10'),
(384, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:43:09', 'Chrome 10', 'Windows 10'),
(385, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:43:15', 'Chrome 10', 'Windows 10'),
(386, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:43:21', 'Chrome 10', 'Windows 10'),
(387, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:46:51', 'Chrome 10', 'Windows 10'),
(388, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:06', 'Chrome 10', 'Windows 10'),
(389, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:22', 'Chrome 10', 'Windows 10'),
(390, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:22', 'Chrome 10', 'Windows 10'),
(391, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:26', 'Chrome 10', 'Windows 10'),
(392, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:26', 'Chrome 10', 'Windows 10'),
(393, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:26', 'Chrome 10', 'Windows 10'),
(394, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:26', 'Chrome 10', 'Windows 10'),
(395, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:26', 'Chrome 10', 'Windows 10'),
(396, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:27', 'Chrome 10', 'Windows 10'),
(397, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:27', 'Chrome 10', 'Windows 10'),
(398, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:27', 'Chrome 10', 'Windows 10'),
(399, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:27', 'Chrome 10', 'Windows 10'),
(400, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:50:27', 'Chrome 10', 'Windows 10'),
(401, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:47', 'Chrome 10', 'Windows 10'),
(402, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:51', 'Chrome 10', 'Windows 10'),
(403, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:54', 'Chrome 10', 'Windows 10'),
(404, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:57', 'Chrome 10', 'Windows 10'),
(405, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(406, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(407, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(408, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(409, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(410, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:55:59', 'Chrome 10', 'Windows 10'),
(411, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(412, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(413, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(414, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(415, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(416, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:00', 'Chrome 10', 'Windows 10'),
(417, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(418, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(419, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(420, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(421, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(422, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(423, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(424, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:01', 'Chrome 10', 'Windows 10'),
(425, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:03', 'Chrome 10', 'Windows 10'),
(426, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:23', 'Chrome 10', 'Windows 10'),
(427, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:29', 'Chrome 10', 'Windows 10'),
(428, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:40', 'Chrome 10', 'Windows 10'),
(429, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:42', 'Chrome 10', 'Windows 10'),
(430, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:42', 'Chrome 10', 'Windows 10'),
(431, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:42', 'Chrome 10', 'Windows 10'),
(432, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:42', 'Chrome 10', 'Windows 10'),
(433, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:43', 'Chrome 10', 'Windows 10'),
(434, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:43', 'Chrome 10', 'Windows 10'),
(435, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(436, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(437, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(438, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(439, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(440, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(441, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:44', 'Chrome 10', 'Windows 10'),
(442, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:45', 'Chrome 10', 'Windows 10'),
(443, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:45', 'Chrome 10', 'Windows 10'),
(444, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:45', 'Chrome 10', 'Windows 10'),
(445, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:45', 'Chrome 10', 'Windows 10'),
(446, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:45', 'Chrome 10', 'Windows 10'),
(447, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:56:46', 'Chrome 10', 'Windows 10'),
(448, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:57:04', 'Chrome 10', 'Windows 10'),
(449, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 00:59:57', 'Chrome 10', 'Windows 10'),
(450, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:00', 'Mobile Safari', 'Mac OS X (iPhone)'),
(451, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:02', 'Chrome Mobile', 'Android 6.x'),
(452, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:03', 'Chrome Mobile', 'Android 6.x'),
(453, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:09', 'Chrome Mobile', 'Android 6.x'),
(454, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:09', 'Chrome Mobile', 'Android 6.x'),
(455, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:09', 'Chrome Mobile', 'Android 6.x'),
(456, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:11', 'Chrome Mobile', 'Android 6.x'),
(457, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:11', 'Chrome Mobile', 'Android 6.x'),
(458, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:11', 'Chrome Mobile', 'Android 6.x'),
(459, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:11', 'Chrome Mobile', 'Android 6.x'),
(460, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(461, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(462, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(463, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(464, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(465, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(466, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(467, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:12', 'Chrome Mobile', 'Android 6.x'),
(468, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:13', 'Chrome Mobile', 'Android 6.x'),
(469, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:13', 'Chrome Mobile', 'Android 6.x'),
(470, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:13', 'Chrome Mobile', 'Android 6.x'),
(471, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:13', 'Chrome Mobile', 'Android 6.x'),
(472, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:25', 'Chrome Mobile', 'Android 6.x');
INSERT INTO `cms_log_record` (`log_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `oper_bower`, `oper_system`) VALUES
(473, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:35', 'Chrome 10', 'Windows 10'),
(474, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:35', 'Chrome 10', 'Windows 10'),
(475, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:00:56', 'Chrome 10', 'Windows 10'),
(476, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:04', 'Chrome Mobile', 'Android 6.x'),
(477, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(478, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(479, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(480, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(481, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(482, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(483, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:05', 'Chrome Mobile', 'Android 6.x'),
(484, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:53', 'Chrome Mobile', 'Android 6.x'),
(485, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(486, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(487, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(488, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(489, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(490, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:01:54', 'Chrome Mobile', 'Android 6.x'),
(491, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:03:32', 'Chrome 10', 'Windows 10'),
(492, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:03:32', 'Chrome 10', 'Windows 10'),
(493, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:06:09', 'Chrome 10', 'Windows 10'),
(494, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:07:24', 'Chrome 10', 'Windows 10'),
(495, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:07:59', 'Chrome 10', 'Windows 10'),
(496, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:24', 'Chrome 10', 'Windows 10'),
(497, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:29', 'Chrome Mobile', 'Android 6.x'),
(498, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:29', 'Chrome Mobile', 'Android 6.x'),
(499, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:29', 'Chrome Mobile', 'Android 6.x'),
(500, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:29', 'Chrome Mobile', 'Android 6.x'),
(501, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:33', 'Chrome Mobile', 'Android 6.x'),
(502, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:33', 'Chrome Mobile', 'Android 6.x'),
(503, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:34', 'Chrome Mobile', 'Android 6.x'),
(504, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:35', 'Chrome Mobile', 'Android 6.x'),
(505, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:35', 'Chrome Mobile', 'Android 6.x'),
(506, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:36', 'Chrome Mobile', 'Android 6.x'),
(507, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:37', 'Chrome Mobile', 'Android 6.x'),
(508, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:37', 'Chrome Mobile', 'Android 6.x'),
(509, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:37', 'Chrome Mobile', 'Android 6.x'),
(510, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:37', 'Chrome Mobile', 'Android 6.x'),
(511, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:37', 'Chrome Mobile', 'Android 6.x'),
(512, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:38', 'Chrome Mobile', 'Android 6.x'),
(513, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:38', 'Chrome Mobile', 'Android 6.x'),
(514, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:39', 'Chrome Mobile', 'Android 6.x'),
(515, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:39', 'Chrome Mobile', 'Android 6.x'),
(516, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(517, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(518, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(519, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(520, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(521, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(522, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(523, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:41', 'Chrome Mobile', 'Android 6.x'),
(524, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:42', 'Chrome Mobile', 'Android 6.x'),
(525, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:42', 'Chrome Mobile', 'Android 6.x'),
(526, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:42', 'Chrome Mobile', 'Android 6.x'),
(527, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:42', 'Chrome Mobile', 'Android 6.x'),
(528, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:42', 'Chrome Mobile', 'Android 6.x'),
(529, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:43', 'Chrome Mobile', 'Android 6.x'),
(530, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(531, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(532, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(533, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(534, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(535, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:44', 'Chrome Mobile', 'Android 6.x'),
(536, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(537, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(538, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(539, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(540, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(541, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:45', 'Chrome Mobile', 'Android 6.x'),
(542, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:46', 'Chrome Mobile', 'Android 6.x'),
(543, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:47', 'Chrome Mobile', 'Android 6.x'),
(544, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:47', 'Chrome Mobile', 'Android 6.x'),
(545, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(546, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(547, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(548, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(549, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(550, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(551, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:48', 'Chrome Mobile', 'Android 6.x'),
(552, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:50', 'Chrome Mobile', 'Android 6.x'),
(553, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:51', 'Chrome Mobile', 'Android 6.x'),
(554, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:51', 'Chrome Mobile', 'Android 6.x'),
(555, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:52', 'Chrome Mobile', 'Android 6.x'),
(556, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:52', 'Chrome Mobile', 'Android 6.x'),
(557, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:52', 'Chrome Mobile', 'Android 6.x'),
(558, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:52', 'Chrome Mobile', 'Android 6.x'),
(559, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:52', 'Chrome Mobile', 'Android 6.x'),
(560, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:53', 'Chrome Mobile', 'Android 6.x'),
(561, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:53', 'Chrome Mobile', 'Android 6.x'),
(562, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:53', 'Chrome Mobile', 'Android 6.x'),
(563, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(564, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(565, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(566, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(567, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(568, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:54', 'Chrome Mobile', 'Android 6.x'),
(569, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(570, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(571, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(572, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(573, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(574, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(575, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:55', 'Chrome Mobile', 'Android 6.x'),
(576, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:56', 'Chrome Mobile', 'Android 6.x'),
(577, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:56', 'Chrome Mobile', 'Android 6.x'),
(578, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:56', 'Chrome Mobile', 'Android 6.x'),
(579, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:56', 'Chrome Mobile', 'Android 6.x'),
(580, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:57', 'Chrome Mobile', 'Android 6.x'),
(581, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:57', 'Chrome Mobile', 'Android 6.x'),
(582, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:57', 'Chrome Mobile', 'Android 6.x'),
(583, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:08:57', 'Chrome Mobile', 'Android 6.x'),
(584, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(585, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(586, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(587, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(588, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(589, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-16 01:09:03', 'Chrome Mobile', 'Android 6.x'),
(590, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-18 19:20:41', 'Chrome 10', 'Windows 10'),
(591, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-18 19:22:34', 'Chrome 10', 'Windows 10'),
(592, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-18 19:26:12', 'Chrome 10', 'Windows 10'),
(593, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-18 19:31:09', 'Chrome 10', 'Windows 10'),
(594, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-18 19:31:32', 'Chrome 10', 'Windows 10'),
(595, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-04-18 19:31:34', 'Chrome 10', 'Windows 10'),
(596, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-23 01:01:52', 'Chrome 10', 'Windows 10'),
(597, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 01:58:00', 'Chrome 10', 'Windows 10'),
(598, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 04:55:11', 'Chrome 10', 'Windows 10'),
(599, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 04:56:13', 'Chrome 10', 'Windows 10'),
(600, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 10:01:02', 'Chrome 10', 'Windows 10'),
(601, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 10:30:35', 'Chrome 10', 'Windows 10');

-- --------------------------------------------------------

--
-- 表的结构 `cms_look_record`
--

CREATE TABLE `cms_look_record` (
  `look_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览记录';

--
-- 转存表中的数据 `cms_look_record`
--

INSERT INTO `cms_look_record` (`look_id`, `article_id`, `user_id`, `create_time`, `update_time`, `ip`, `visible`, `user_system`, `user_bower`) VALUES
(1, 1, 1, '2022-04-03 04:32:00', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(2, 1, 1, '2022-04-03 04:32:03', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(3, 1, 1, '2022-04-03 04:32:18', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(4, 1, 1, '2022-04-03 04:32:23', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(5, 1, 1, '2022-04-03 04:33:00', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(6, 1, 1, '2022-04-03 04:33:14', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(7, 1, 1, '2022-04-03 04:33:35', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(8, 1, 1, '2022-04-03 04:33:55', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(9, 1, NULL, '2022-04-03 04:34:38', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(10, 1, 1, '2022-04-03 08:11:30', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(11, 1, 1, '2022-04-03 08:14:48', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(12, 1, 1, '2022-04-03 08:15:01', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(13, 1, NULL, '2022-04-03 09:13:18', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(14, 1, 1, '2022-04-03 16:13:56', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(15, 1, NULL, '2022-04-03 16:41:48', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(16, 1, 1, '2022-04-04 05:57:31', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(17, 1, 1, '2022-04-04 05:58:34', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 9'),
(18, 2, 1, '2022-04-15 15:33:20', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(19, 2, 1, '2022-04-15 15:33:33', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10');

-- --------------------------------------------------------

--
-- 表的结构 `cms_nasty_record`
--

CREATE TABLE `cms_nasty_record` (
  `nasty_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='不喜欢操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `cms_score_record`
--

CREATE TABLE `cms_score_record` (
  `score_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `score` tinyint(4) DEFAULT NULL COMMENT '评分',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评分表';

-- --------------------------------------------------------

--
-- 表的结构 `cms_share_record`
--

CREATE TABLE `cms_share_record` (
  `share_id` bigint(20) NOT NULL COMMENT '主键',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip',
  `visible` tinyint(1) DEFAULT NULL COMMENT '状态',
  `user_system` varchar(128) DEFAULT NULL COMMENT '用户使用系统/或者浏览器',
  `user_bower` varchar(128) DEFAULT NULL COMMENT '用户浏览器',
  `share_url` varchar(128) DEFAULT NULL COMMENT '分享地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='喜欢操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `cms_tag`
--

CREATE TABLE `cms_tag` (
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  `tag_name` varchar(64) NOT NULL COMMENT '标签名',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `tag_url` varchar(255) DEFAULT NULL COMMENT '标签名',
  `visible` tinyint(1) DEFAULT '0' COMMENT '标签状态',
  `perms` varchar(45) DEFAULT NULL COMMENT '权限字符串',
  `tag_ico` varchar(255) DEFAULT NULL COMMENT '标签图标',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `tag_type` tinyint(4) DEFAULT '0' COMMENT '标签类型:0为文章标签',
  `tag_count` bigint(20) DEFAULT NULL COMMENT '关联文章数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容标签';

--
-- 转存表中的数据 `cms_tag`
--

INSERT INTO `cms_tag` (`tag_id`, `tag_name`, `create_by`, `create_time`, `remark`, `update_by`, `update_time`, `tag_url`, `visible`, `perms`, `tag_ico`, `keywords`, `description`, `order_num`, `tag_type`, `tag_count`) VALUES
(1, '踩踩踩2', 1, '2022-03-24 23:02:00', '', 1, '2022-03-28 11:53:00', '', 2, '', '', 'cccc', '', 3, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cms_taoke`
--

CREATE TABLE `cms_taoke` (
  `shop_id` varchar(64) NOT NULL COMMENT '商品id',
  `shop_name` varchar(256) DEFAULT NULL COMMENT '商品名称',
  `shop_img` varchar(1024) DEFAULT NULL COMMENT '商品主图',
  `shop_index` varchar(1024) DEFAULT NULL COMMENT '商品详情页链接地址',
  `home_name` varchar(128) DEFAULT NULL COMMENT '店铺名称',
  `shop_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格(单位：元)',
  `shop_sales` int(11) DEFAULT NULL COMMENT '商品月销量',
  `income_ratio` double DEFAULT NULL COMMENT '收入比率(%)',
  `commission` decimal(10,2) DEFAULT NULL COMMENT '佣金',
  `wang_name` varchar(128) DEFAULT NULL COMMENT '卖家旺旺',
  `sort_url` varchar(128) DEFAULT NULL COMMENT '淘宝客短链接(300天内有效)',
  `taoke_url` varchar(1024) DEFAULT NULL COMMENT '淘宝客链接',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券总量',
  `coupon_num` int(11) DEFAULT NULL COMMENT '优惠券剩余量',
  `coupon_price` decimal(10,2) DEFAULT NULL COMMENT '优惠券面额',
  `coupon_start_time` datetime DEFAULT NULL COMMENT '优惠券开始时间',
  `coupon_end_time` datetime DEFAULT NULL COMMENT '优惠券结束时间',
  `coupon_url` varchar(1024) DEFAULT NULL COMMENT '优惠券链接',
  `coupon_code` varchar(128) DEFAULT NULL COMMENT '优惠券淘口令(30天内有效)',
  `coupon_sort_url` varchar(128) DEFAULT NULL COMMENT '优惠券短链接(300天内有效)',
  `market_is` varchar(2) DEFAULT NULL COMMENT '是否为营销计划商品',
  `group_num` int(11) DEFAULT NULL COMMENT '拼团人数',
  `group_price` decimal(10,2) DEFAULT NULL COMMENT '拼团价',
  `group_commission` decimal(10,2) DEFAULT NULL COMMENT '团队佣金比例',
  `group_start_time` datetime DEFAULT NULL COMMENT '拼团开始时间\n',
  `group_end_time` datetime DEFAULT NULL COMMENT '拼团结束时间\n',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `shop_fettle` tinyint(1) DEFAULT NULL COMMENT '商品状态',
  `shop_content` text COMMENT '内容描述',
  `article_id` bigint(20) NOT NULL COMMENT '关联文章Id',
  `tao_type` tinyint(1) DEFAULT NULL COMMENT '文章来源'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘客';

-- --------------------------------------------------------

--
-- 表的结构 `cms_theme`
--

CREATE TABLE `cms_theme` (
  `theme_id` int(11) NOT NULL COMMENT '主题ID',
  `theme_name` varchar(255) DEFAULT NULL COMMENT '主题名',
  `create_by` bigint(20) DEFAULT NULL COMMENT '上传者ID',
  `theme_author` varchar(255) DEFAULT NULL COMMENT '主题作者',
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `theme_info` varchar(255) DEFAULT NULL COMMENT '主题介绍',
  `theme_enabled` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  `theme_update` varchar(255) DEFAULT NULL COMMENT '是否可以更新，为空不可更新',
  `theme_touch` varchar(255) DEFAULT NULL COMMENT '作者联系方式',
  `theme_version` varchar(255) DEFAULT NULL COMMENT '主题版本号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cms_theme`
--

INSERT INTO `cms_theme` (`theme_id`, `theme_name`, `create_by`, `theme_author`, `create_time`, `theme_info`, `theme_enabled`, `theme_update`, `theme_touch`, `theme_version`) VALUES
(1, 'zgcms', NULL, '止戈', '2022-03-25 08:15:17', 'zgcms系统文档主题', 0, NULL, 'mail:634866553@qq.com,phone:17678999448', 'v.1.0'),
(2, 'zgblog', NULL, '止戈', '2022-03-31 15:38:13', 'zgCms系统默认博客主题', 1, NULL, 'mail:634866553@qq.com,phone:17678999448', 'v.1.0');

-- --------------------------------------------------------

--
-- 表的结构 `cms_third`
--

CREATE TABLE `cms_third` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '会员ID',
  `platform` varchar(30) NOT NULL DEFAULT '' COMMENT '第三方应用',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方唯一ID',
  `openname` varchar(50) NOT NULL DEFAULT '' COMMENT '第三方会员昵称',
  `access_token` varchar(255) NOT NULL DEFAULT '' COMMENT 'AccessToken',
  `refresh_token` varchar(255) NOT NULL DEFAULT 'RefreshToken',
  `expires_in` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '有效期',
  `createtime` int(10) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED DEFAULT NULL COMMENT '更新时间',
  `logintime` int(10) UNSIGNED DEFAULT NULL COMMENT '登录时间',
  `expiretime` int(10) UNSIGNED DEFAULT NULL COMMENT '过期时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录表';

-- --------------------------------------------------------

--
-- 表的结构 `cms_user`
--

CREATE TABLE `cms_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` tinyint(1) DEFAULT '1' COMMENT '用户类型(1默认为普通用户)',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(500) DEFAULT NULL COMMENT '备注',
  `location` varchar(128) DEFAULT NULL COMMENT '用户地址',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `user_index` varchar(256) DEFAULT NULL COMMENT '用户主页按照逗号分割',
  `user_tags` varchar(256) DEFAULT NULL COMMENT '用户标签（逗号分割）',
  `introduce` varchar(128) DEFAULT NULL COMMENT '介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gen_table`
--

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

--
-- 转存表中的数据 `gen_table`
--

INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'oly_config', '配置文件备份', NULL, NULL, 'OlyConfig', 'crud', 'com.ruoyi.system', 'system', 'config', '配置文件备份', 'ruoyi', '0', '/', NULL, 'admin', '2022-01-18 11:20:46', '', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gen_table_column`
--

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

--
-- 转存表中的数据 `gen_table_column`
--

INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(1, '1', 'config_group', '备份组', 'varchar(45)', 'String', 'configGroup', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-01-18 11:20:46', '', NULL),
(2, '1', 'config_key', '备份key', 'varchar(128)', 'String', 'configKey', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2022-01-18 11:20:46', '', NULL),
(3, '1', 'config_value', '备份参数', 'blob', 'String', 'configValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', NULL, '', 3, 'admin', '2022-01-18 11:20:46', '', NULL),
(4, '1', 'create_by', '创建者', 'bigint(20)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-01-18 11:20:47', '', NULL),
(5, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-01-18 11:20:47', '', NULL),
(6, '1', 'update_by', '更新者', 'bigint(20)', 'Long', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-01-18 11:20:47', '', NULL),
(7, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-01-18 11:20:47', '', NULL),
(8, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-01-18 11:20:47', '', NULL),
(10, '1', 'config_value_type', '值类型', 'tinyint(2)', 'Integer', 'configValueType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 9, '', '2022-01-20 09:44:23', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `oly_config`
--

CREATE TABLE `oly_config` (
  `config_group` varchar(45) NOT NULL COMMENT '组',
  `config_key` varchar(128) NOT NULL COMMENT 'key',
  `config_value` blob COMMENT '值',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `config_value_type` tinyint(2) NOT NULL COMMENT '值类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件备份';

-- --------------------------------------------------------

--
-- 表的结构 `oly_mail`
--

CREATE TABLE `oly_mail` (
  `mail_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_mail` varchar(50) DEFAULT NULL COMMENT '发送者邮箱',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人 默认为空',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `to_mail` varchar(50) DEFAULT NULL COMMENT '接收者邮箱',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  `content` text COMMENT '内容',
  `mail_type` tinyint(1) DEFAULT '0' COMMENT '邮件类型 文本 附件 模板',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `copy_to` varchar(255) DEFAULT NULL COMMENT '抄送用户',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `mail_used` tinyint(1) DEFAULT NULL COMMENT '邮件用途',
  `bcc_to` varchar(255) DEFAULT NULL COMMENT '密送用户',
  `visible` tinyint(1) DEFAULT NULL COMMENT '邮件状态  0.未发送 1.已发送',
  `attach_keys` varchar(1024) DEFAULT NULL COMMENT '附件地址:按照逗号分隔'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件表';

--
-- 转存表中的数据 `oly_mail`
--

INSERT INTO `oly_mail` (`mail_id`, `from_mail`, `create_by`, `create_time`, `to_mail`, `subject`, `content`, `mail_type`, `send_time`, `copy_to`, `remark`, `mail_used`, `bcc_to`, `visible`, `attach_keys`) VALUES
(1, NULL, 1, '2022-04-02 22:53:12', '634866553@qq.com', '这是一封测试邮件', NULL, 0, '2022-04-02 22:53:12', '', NULL, 0, '', 1, NULL),
(2, NULL, 1, '2022-04-02 23:26:31', '634866553@qq.com', '这是附件邮件', NULL, 0, '2022-04-02 23:26:31', '', NULL, 0, '', 1, 'logo_hw.png');

-- --------------------------------------------------------

--
-- 表的结构 `oly_oss`
--

CREATE TABLE `oly_oss` (
  `id` bigint(20) NOT NULL,
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `fk` varchar(256) DEFAULT NULL COMMENT '唯一路径',
  `file_type` varchar(45) DEFAULT NULL COMMENT '文件类型',
  `domain` varchar(128) DEFAULT NULL COMMENT '域名',
  `file_heard` varchar(45) DEFAULT NULL COMMENT '文件头',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `oss_type` tinyint(2) DEFAULT '0' COMMENT '储存类型 ',
  `oss_used` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用途'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件存储';

--
-- 转存表中的数据 `oly_oss`
--

INSERT INTO `oly_oss` (`id`, `create_by`, `create_time`, `file_name`, `size`, `fk`, `file_type`, `domain`, `file_heard`, `remark`, `oss_type`, `oss_used`) VALUES
(1, '1', '2022-02-15 09:03:23', 'logo_hw.png', 27609, 'image\\2022\\02\\15\\f1ae3517-b158-48ed-8f8d-45e5847e84eb.png', 'image', 'http://127.0.0.1:8090/oly/oss/download/', 'image/png', NULL, 0, 0),
(2, '1', '2022-03-09 20:32:08', '问卷调查.docx', 11197, '/profile/upload\\document/2022/03/09/问卷调查_20220309203208A002.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download', 'application/zip', NULL, 0, 0),
(3, '1', '2022-03-09 21:09:46', '问卷调查.docx', 11197, '/upload\\document/2022/03/09/问卷调查_20220309210946A002.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download', 'application/zip', NULL, 0, 0),
(4, '1', '2022-03-09 21:14:50', '问卷调查.docx', 11197, '2022/03/09/问卷调查_20220309211450A001.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download', 'application/zip', NULL, 0, 0),
(5, '1', '2022-03-09 21:21:51', '问卷调查.docx', 11197, 'upload\\document\\2022\\03\\09\\问卷调查_20220309212151A001.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download', 'application/zip', NULL, 0, 0),
(6, '1', '2022-03-09 21:23:24', '问卷调查.docx', 11197, 'upload\\document\\2022\\03\\09\\问卷调查_20220309212324A002.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download/', 'application/zip', NULL, 0, 0),
(7, '1', '2022-03-09 21:28:03', '问卷调查.docx', 11197, 'Administrator\\.ruoyi\\upload\\document\\2022\\03\\09\\问卷调查_20220309212803A001.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download/', 'application/zip', NULL, 0, 0),
(8, '1', '2022-03-09 21:32:50', '问卷调查.docx', 11197, 'document\\2022\\03\\09\\问卷调查_20220309213250A001.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download/', 'application/zip', NULL, 0, 0),
(10, '1', '2022-03-09 22:12:06', '问卷调查.docx', 11197, 'document%5C2022%5C03%5C09%5C%E9%97%AE%E5%8D%B7%E8%B0%83%E6%9F%A5_20220309221206A001.docx', 'document', 'http://127.0.0.1:8090/oly/oss/download/', 'application/zip', NULL, 0, 0),
(13, '1', '2022-03-10 23:55:57', 'logo_hw.png', 27609, 'image\\2022\\03\\10\\logo_hw_20220310235557A003.png', 'image', 'http://127.0.0.1:8090/oly/oss/download/', 'image/png', NULL, 0, 0),
(14, '1', '2022-03-30 20:31:51', 'logo_hw.png', 27609, 'image\\2022\\03\\30\\logo_hw_20220330203150A001.png', 'image', 'http://127.0.0.1:8090/oly/oss/download/', 'image/png', NULL, 0, 0),
(15, '1', '2022-04-03 00:02:49', 'logo_hw.png', 27609, 'image\\2022\\04\\03\\logo_hw_20220403000249A001.png', 'image', 'http://127.0.0.1:8090/oly/oss/download/', 'image/png', NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `oly_template`
--

CREATE TABLE `oly_template` (
  `template_id` bigint(20) NOT NULL COMMENT '模板Id',
  `template_name` varchar(32) NOT NULL COMMENT '模板名',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父模板id',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `template_type` tinyint(4) NOT NULL COMMENT '类型',
  `visible` tinyint(4) NOT NULL COMMENT '模板状态',
  `built` tinyint(4) NOT NULL COMMENT '是否内置',
  `perms` varchar(128) DEFAULT NULL COMMENT '权限字符',
  `order_num` tinyint(4) NOT NULL COMMENT '显示顺序',
  `ancestors` varchar(128) DEFAULT NULL COMMENT '祖级列表',
  `template_url` varchar(1024) DEFAULT NULL COMMENT '模板路径',
  `template_param` varchar(2048) DEFAULT NULL COMMENT '模板数据',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板模型';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_blob_triggers`
--

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_calendars`
--

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='日历信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_cron_triggers`
--

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '时区'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cron类型的触发器表';

--
-- 转存表中的数据 `qrtz_cron_triggers`
--

INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai'),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_fired_triggers`
--

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否接受恢复执行'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='已触发的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_job_details`
--

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务详细信息表';

--
-- 转存表中的数据 `qrtz_job_details`
--

INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017e50cbde0878707400007070707400013174000e302f3130202a202a202a202a203f74001172795461736b2e72794e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc8974000133740001317800),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017e50cbde0878707400007070707400013174000e302f3135202a202a202a202a203f74001572795461736b2e7279506172616d7328277279272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc8974000133740001317800),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001e636f6d2e72756f79692e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720027636f6d2e72756f79692e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b597419030000787077080000017e50cbde0878707400007070707400013174000e302f3230202a202a202a202a203f74003872795461736b2e72794d756c7469706c65506172616d7328277279272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000003740018e7b3bbe7bb9fe9bb98e8aea4efbc88e5a49ae58f82efbc8974000133740001317800);

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_locks`
--

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '悲观锁名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='存储的悲观锁信息表';

--
-- 转存表中的数据 `qrtz_locks`
--

INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
('RuoyiScheduler', 'STATE_ACCESS'),
('RuoyiScheduler', 'TRIGGER_ACCESS');

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_paused_trigger_grps`
--

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='暂停的触发器表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_scheduler_state`
--

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='调度器状态表';

--
-- 转存表中的数据 `qrtz_scheduler_state`
--

INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
('RuoyiScheduler', 'NX2W8SGA9QVPNQI1649646574658', 1649646801159, 15000);

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simple_triggers`
--

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='简单触发器的信息表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_simprop_triggers`
--

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='同步机制的行锁表';

-- --------------------------------------------------------

--
-- 表的结构 `qrtz_triggers`
--

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='触发器详细信息表';

--
-- 转存表中的数据 `qrtz_triggers`
--

INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1649646580000, -1, 5, 'PAUSED', 'CRON', 1649646575000, 0, NULL, 2, ''),
('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1649646585000, -1, 5, 'PAUSED', 'CRON', 1649646576000, 0, NULL, 2, ''),
('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1649646580000, -1, 5, 'PAUSED', 'CRON', 1649646576000, 0, NULL, 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_config`
--

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL COMMENT '参数主键',
  `config_group` varchar(62) COLLATE utf8_unicode_ci NOT NULL COMMENT '配置组',
  `config_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '参数键名',
  `config_value` blob COMMENT '参数键值',
  `config_type` tinyint(2) DEFAULT NULL COMMENT '配置类型',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `config_value_type` tinyint(2) NOT NULL COMMENT '参数类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='参数配置表';

--
-- 转存表中的数据 `sys_config`
--

INSERT INTO `sys_config` (`config_id`, `config_group`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `config_value_type`) VALUES
(1, 'sysIndex', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 0x736b696e2d677265656e, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-24 00:10:50', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 3),
(2, 'sysUser', '用户管理-账号初始密码', 'sys.user.initPassword', 0x313233343536, 0, 'admin', '2022-01-13 08:17:25', '', NULL, '初始化密码 123456', 0),
(3, 'sysIndex', '主框架页-侧边栏主题', 'sys.index.sideTheme', 0x7468656d652d6461726b, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-24 00:10:50', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue', 3),
(4, 'sysUser', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 0x66616c7365, 0, 'admin', '2022-01-13 08:17:25', '', NULL, '是否开启注册用户功能（true开启，false关闭）', 0),
(5, 'sysUser', '用户管理-密码字符范围', 'sys.account.chrtype', 0x30, 0, 'admin', '2022-01-13 08:17:25', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）', 0),
(6, 'sysUser', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', 0x30, 0, 'admin', '2022-01-13 08:17:25', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框', 0),
(7, 'sysUser', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', 0x30, 0, 'admin', '2022-01-13 08:17:25', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框', 0),
(8, 'sysIndex', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 0x746f706e6176, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-24 00:10:50', '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）', 3),
(9, 'sysIndex', '主框架页-是否开启页脚', 'sys.index.footer', 0x74727565, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-23 00:41:58', '是否开启底部页脚显示（true显示，false隐藏）', 3),
(10, 'sysIndex', '主框架页-是否开启页签', 'sys.index.tagsView', 0x74727565, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-23 00:42:07', '是否开启菜单多页签显示（true显示，false隐藏）', 3),
(100, 'test', '测试参数', 'test.ui', 0x31, NULL, 'admin', '2022-02-02 08:28:02', '', NULL, NULL, 0),
(101, 'ossConfig', 'oly.oss.used', 'oly.oss.used', 0x6e6174697665, NULL, 'admin', '2022-02-17 08:54:16', 'admin', '2022-03-30 20:31:33', NULL, 3),
(102, 'mailConfig', 'oly.mail.from.name', 'oly.mail.from.name', 0x68757368, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(103, 'mailConfig', 'oly.mail.host', 'oly.mail.host', 0x736d74702e3136332e636f6d, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(104, 'mailConfig', 'oly.mail.protocol', 'oly.mail.protocol', 0x736d7470, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(105, 'mailConfig', 'oly.mail.ssl.port', 'oly.mail.ssl.port', 0x343635, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(106, 'mailConfig', 'oly.mail.username', 'oly.mail.username', 0x6d3137363738393939343438403136332e636f6d, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(107, 'mailConfig', 'oly.mail.password', 'oly.mail.password', 0x6d363334383636353533, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(108, 'mailConfig', 'oly.mail.enabled', 'oly.mail.enabled', 0x74727565, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-04-02 22:23:34', NULL, 3),
(109, 'ossConfig', 'oly.oss.native.domain', 'oly.oss.native.domain', 0x687474703a2f2f3132372e302e302e313a383039302f6f6c792f6f73732f646f776e6c6f61642f, NULL, 'admin', '2022-03-08 22:25:25', 'admin', '2022-03-09 21:22:26', NULL, 3),
(110, 'ossConfig', 'oly.oss.qiniu.domain', 'oly.oss.qiniu.domain', 0x366766666464, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:50', NULL, 3),
(111, 'ossConfig', 'oly.oss.qiniu.access.key', 'oly.oss.qiniu.access.key', 0x6664766676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:50', NULL, 3),
(112, 'ossConfig', 'oly.oss.qiniu.secret.key', 'oly.oss.qiniu.secret.key', 0x7676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:50', NULL, 3),
(113, 'ossConfig', 'oly.oss.qiniu.bucket', 'oly.oss.qiniu.bucket', 0x6676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:50', NULL, 3),
(114, 'ossConfig', 'oly.oss.qiniu.zone', 'oly.oss.qiniu.zone', 0x766476, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:50', NULL, 3),
(115, 'ossConfig', 'oly.oss.qiniu.style.rule', 'oly.oss.qiniu.style.rule', 0x76786376, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-03-08 22:55:51', NULL, 3),
(116, 'themeConfig', '使用主题', 'oly.theme.used', 0x7a67626c6f67, 1, 'admin', '2022-03-25 13:12:25', 'admin', '2022-04-02 21:28:19', '使用主题', 3),
(117, 'zgcms', 'oly.web.theme.zgcms.cat.style', 'oly.web.theme.zgcms.cat.style', 0x32, 1, 'admin', '2022-03-25 23:37:19', 'admin', '2022-03-30 13:33:29', '', 3),
(118, 'zgcms', 'oly.web.theme.zgcms.cat.app', 'oly.web.theme.zgcms.cat.app', 0x33, 1, 'admin', '2022-03-25 23:37:19', 'admin', '2022-03-30 13:33:51', '', 3),
(119, 'zgcms', 'oly.web.theme.zgcms.cat.skill', 'oly.web.theme.zgcms.cat.skill', 0x34, NULL, 'admin', '2022-03-25 23:37:19', 'admin', '2022-03-30 13:34:12', '', 3),
(120, 'zgcms', 'oly.web.theme.zgcms.cat.store', 'oly.web.theme.zgcms.cat.store', 0x30, 1, 'admin', '2022-03-25 23:37:19', 'admin', '2022-03-30 13:34:33', '', 3),
(121, 'webConfig', 'oly.web.title', 'oly.web.title', 0xe6ada2e68888e69687e6a1a3, NULL, 'admin', '2022-03-26 09:44:49', 'admin', '2022-03-26 09:45:16', NULL, 3),
(122, 'webConfig', 'oly.web.index', 'oly.web.index', 0x2f7a67636d73, NULL, 'admin', '2022-03-26 09:44:49', 'admin', '2022-03-26 09:45:16', NULL, 3),
(123, 'webConfig', 'oly.web.logo', 'oly.web.logo', '', NULL, 'admin', '2022-03-26 09:44:49', 'admin', '2022-03-26 09:45:16', NULL, 3),
(124, 'webConfig', 'oly.web.ico', 'oly.web.ico', '', NULL, 'admin', '2022-03-26 09:44:49', 'admin', '2022-03-26 09:45:16', NULL, 3),
(125, 'webConfig', 'oly.web.footer', 'oly.web.footer', '', NULL, 'admin', '2022-03-26 09:44:49', 'admin', '2022-03-26 09:45:16', NULL, 3),
(126, 'zgcms', 'oly.web.title', 'oly.web.title', 0xe6ada2e68888e58d9ae5aea2, NULL, 'admin', '2022-03-26 10:40:10', 'admin', '2022-04-02 18:23:19', NULL, 3),
(127, 'zgcms', 'oly.web.index', 'oly.web.index', 0x2f7a67636d732f696e646578, NULL, 'admin', '2022-03-26 10:40:10', 'admin', '2022-04-02 18:23:19', NULL, 3),
(128, 'zgcms', 'oly.web.logo', 'oly.web.logo', '', NULL, 'admin', '2022-03-26 10:40:10', 'admin', '2022-04-02 18:23:19', NULL, 3),
(129, 'zgcms', 'oly.web.ico', 'oly.web.ico', '', NULL, 'admin', '2022-03-26 10:40:10', 'admin', '2022-04-02 18:23:19', NULL, 3),
(130, 'zgcms', 'oly.web.footer', 'oly.web.footer', '', NULL, 'admin', '2022-03-26 10:40:10', 'admin', '2022-04-02 18:23:19', NULL, 3),
(131, 'webConfig', 'oly.web.theme.more', 'oly.web.theme.more', 0x74727565, NULL, 'admin', '2022-03-26 16:09:38', 'admin', '2022-03-26 16:10:02', NULL, 3),
(132, 'webConfig', 'oly.web.theme.setting', 'oly.web.theme.setting', 0x74727565, NULL, 'admin', '2022-03-26 16:09:38', 'admin', '2022-03-26 16:10:02', NULL, 3),
(133, 'cmsConfig', 'oly.cms.articleCat.maxNum', 'oly.cms.articleCat.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(134, 'cmsConfig', 'oly.cms.articleTag.maxNum', 'oly.cms.articleTag.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(135, 'cmsConfig', 'oly.cms.articleKeyword.maxNum', 'oly.cms.articleKeyword.maxNum', 0x3130, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(136, 'cmsConfig', 'oly.cms.articleImg.maxNum', 'oly.cms.articleImg.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(137, 'cmsConfig', 'oly.cms.articleUrl.fixedPrefix', 'oly.cms.articleUrl.fixedPrefix', NULL, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(138, 'cmsConfig', 'oly.cms.articleVisible.default', 'oly.cms.articleVisible.default', 0x32, NULL, 'admin', '2022-03-28 11:53:28', '', NULL, NULL, 3),
(139, 'webConfig', 'oly.theme.more', 'oly.theme.more', 0x74727565, NULL, 'admin', '2022-03-29 14:49:03', '', NULL, NULL, 3),
(140, 'webConfig', 'oly.theme.setting', 'oly.theme.setting', 0x74727565, NULL, 'admin', '2022-03-29 14:49:03', '', NULL, NULL, 3),
(141, 'themeConfig', 'oly.theme.more', 'oly.theme.more', 0x74727565, NULL, 'admin', '2022-03-29 14:51:47', '', NULL, NULL, 3),
(142, 'themeConfig', 'oly.theme.setting', 'oly.theme.setting', 0x74727565, NULL, 'admin', '2022-03-29 14:51:48', '', NULL, NULL, 3),
(143, 'zgcms', 'oly.web.theme.zgcms.menu.main', 'oly.web.theme.zgcms.menu.main', 0x31, NULL, 'admin', '2022-03-30 13:42:09', '', NULL, NULL, 3),
(144, 'zgblog', 'oly.theme.more', 'oly.theme.more', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:48:26', NULL, 3),
(145, 'zgblog', 'oly.web.comment.staus', 'oly.web.comment.staus', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:49:25', NULL, 3),
(146, 'zgblog', 'oly.web.countCode', 'oly.web.countCode', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:49:25', NULL, 3),
(147, 'zgblog', 'oly.web.post.copyright', 'oly.web.post.copyright', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:49:25', NULL, 3),
(148, 'zgblog', 'oly.web.comment.enable', 'oly.web.comment.enable', 0x74727565, NULL, 'admin', '2022-03-31 23:49:25', '', NULL, NULL, 3),
(149, 'zgblog', 'oly.web.title', 'oly.web.title', 0xe6ada2e68888e58d9ae5aea2, NULL, 'admin', '2022-04-01 23:07:03', 'admin', '2022-04-02 21:36:58', NULL, 3),
(150, 'zgblog', 'oly.web.index', 'oly.web.index', 0x2f696e646578, NULL, 'admin', '2022-04-01 23:07:03', 'admin', '2022-04-02 21:36:58', NULL, 3),
(151, 'zgblog', 'oly.web.logo', 'oly.web.logo', '', NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-04-02 21:36:58', NULL, 3),
(152, 'zgblog', 'oly.web.ico', 'oly.web.ico', '', NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-04-02 21:36:58', NULL, 3),
(153, 'zgblog', 'oly.web.footer', 'oly.web.footer', '', NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-04-02 21:36:58', NULL, 3),
(154, 'zgcms', 'oly.web.domain', 'oly.web.domain', NULL, NULL, 'admin', '2022-04-02 18:23:19', '', NULL, NULL, 3),
(155, 'zgblog', 'oly.web.domain', 'oly.web.domain', 0x687474703a2f2f3132372e302e302e313a38303930, NULL, 'admin', '2022-04-02 21:36:58', '', NULL, NULL, 3),
(156, 'zgblog', 'oly.web.theme.zgblog.cat.style', 'oly.web.theme.zgblog.cat.style', 0x3130, NULL, 'admin', '2022-04-04 23:57:19', 'admin', '2022-04-05 00:11:39', NULL, 3),
(157, 'zgblog', 'oly.web.theme.zgblog.cat.app', 'oly.web.theme.zgblog.cat.app', 0x3130, NULL, 'admin', '2022-04-04 23:57:19', 'admin', '2022-04-05 00:11:39', NULL, 3),
(158, 'zgblog', 'oly.web.theme.zgblog.menu.main', 'oly.web.theme.zgblog.menu.main', 0x38, NULL, 'admin', '2022-04-04 23:57:26', '1', '2022-04-24 10:30:27', NULL, 3),
(159, 'zgblog', 'oly.web.theme.zgblog.post.now', 'oly.web.theme.zgblog.post.now', 0x3130, NULL, 'admin', '2022-04-05 00:13:02', '1', '2022-04-24 10:30:26', NULL, 3),
(160, 'zgblog', 'oly.web.theme.zgblog.post.reard', 'oly.web.theme.zgblog.post.reard', 0x3130, NULL, 'admin', '2022-04-05 00:13:02', '', NULL, NULL, 3),
(161, 'zgblog', 'oly.web.theme.zgblog.post.top', 'oly.web.theme.zgblog.post.top', 0x3130, NULL, 'admin', '2022-04-05 00:51:02', '1', '2022-04-24 10:30:27', NULL, 3),
(162, 'zgblog', 'oly.web.theme.zgblog.post.look', 'oly.web.theme.zgblog.post.look', 0x3130, NULL, 'admin', '2022-04-05 00:51:02', '1', '2022-04-24 10:30:27', NULL, 3),
(163, 'sysCommon', 'sys.common.title', 'sys.common.title', 0x31, NULL, 'admin', '2022-04-23 01:15:23', '', NULL, NULL, 3),
(164, 'sysCommon', 'sys.common.description', 'sys.common.description', NULL, NULL, 'admin', '2022-04-23 01:15:23', '', NULL, NULL, 3),
(165, 'sysCommon', 'sys.common.logo', 'sys.common.logo', NULL, NULL, 'admin', '2022-04-23 01:15:23', '', NULL, NULL, 3),
(166, 'sysCommon', 'sys.common.ico', 'sys.common.ico', NULL, NULL, 'admin', '2022-04-23 01:15:23', '', NULL, NULL, 3),
(167, 'sysCommon', 'sys.common.footer', 'sys.common.footer', NULL, NULL, 'admin', '2022-04-23 01:15:23', '', NULL, NULL, 3),
(168, 'sysIndex', 'sys.index.ignoreFooter', 'sys.index.ignoreFooter', 0x74727565, NULL, 'admin', '2022-04-23 07:59:56', 'admin', '2022-04-24 00:10:50', NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `sys_dept`
--

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

--
-- 转存表中的数据 `sys_dept`
--

INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_data`
--

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典数据表';

--
-- 转存表中的数据 `sys_dict_data`
--

INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '性别男'),
(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '性别女'),
(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '性别未知'),
(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '显示菜单'),
(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '隐藏菜单'),
(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '正常状态'),
(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '停用状态'),
(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '正常状态'),
(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '停用状态'),
(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '默认分组'),
(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '系统分组'),
(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '系统默认是'),
(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '系统默认否'),
(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '通知'),
(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '公告'),
(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '正常状态'),
(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '关闭状态'),
(18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '其他操作'),
(19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '新增操作'),
(20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '修改操作'),
(21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '删除操作'),
(22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '授权操作'),
(23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '导出操作'),
(24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '导入操作'),
(25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '强退操作'),
(26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '生成操作'),
(27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '清空操作'),
(28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '正常状态'),
(29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '停用状态'),
(100, 0, '系统配置', '0', 'sys_config_type', '1', 'primary', 'Y', '0', 'admin', '2022-01-26 08:37:00', '', NULL, '系统配置参数，不可删除'),
(101, 1, '主题配置', '1', 'sys_config_type', '', 'success', 'Y', '0', 'admin', '2022-01-26 08:41:00', 'admin', '2022-01-26 08:42:35', '主题配置参数'),
(102, 0, '数值', '0', 'sys_config_value_type', '', 'success', 'Y', '0', 'admin', '2022-01-26 08:49:29', 'admin', '2022-01-26 08:49:39', '数值型'),
(103, 2, '布尔', '2', 'sys_config_value_type', '', 'info', 'N', '0', 'admin', '2022-01-26 08:51:54', 'admin', '2022-02-02 08:33:27', '布尔 true/false'),
(104, 3, '字符', '3', 'sys_config_value_type', '', 'success', 'N', '0', 'admin', '2022-01-26 08:53:16', 'admin', '2022-02-02 08:33:36', '字符串任意类型'),
(105, 1, '浮点', '1', 'sys_config_value_type', '', 'info', 'N', '0', 'admin', '2022-01-31 02:50:22', 'admin', '2022-02-02 08:33:15', '浮点数'),
(106, 0, '本地', 'native', 'oly_oss_location', NULL, 'info', 'Y', '0', 'admin', '2022-02-16 09:21:54', '', NULL, '储存在本地'),
(107, 1, '七牛', 'qiniu', 'oly_oss_location', '', 'primary', 'Y', '0', 'admin', '2022-02-16 09:22:55', 'admin', '2022-02-16 09:23:12', '储存在七牛'),
(108, 3, '压缩', 'commpress', 'oly_oss_type', NULL, 'warning', 'Y', '0', 'admin', '2021-03-05 15:51:06', '', NULL, '压缩文件'),
(109, 4, '视频', 'video', 'oly_oss_type', NULL, 'danger', 'Y', '0', 'admin', '2021-03-05 15:51:55', '', NULL, '视频文件'),
(110, 5, '音乐', 'media', 'oly_oss_type', NULL, 'info', 'Y', '0', 'admin', '2021-03-05 15:52:49', '', NULL, '音乐文件'),
(111, 6, '其他', 'other', 'oly_oss_type', NULL, 'primary', 'Y', '0', 'admin', '2021-03-05 15:53:58', '', NULL, '其它文件'),
(114, 1, '文本', '0', 'oly_mail_type', NULL, 'info', 'Y', '0', 'admin', '2021-03-07 23:50:02', '', NULL, NULL),
(115, 1, '页面', '1', 'oly_mail_type', '', 'info', 'Y', '0', 'admin', '2021-03-07 23:50:20', 'admin', '2021-05-22 23:29:37', ''),
(116, 2, '模板', '2', 'oly_mail_type', '', 'warning', 'Y', '1', 'admin', '2021-03-07 23:50:43', 'admin', '2021-05-22 23:30:27', '功能未开发'),
(117, 1, '禁用', '0', 'cms_tag_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-03-10 13:27:18', '', NULL, '禁用'),
(118, 1, '正常', '1', 'cms_tag_visible', NULL, 'success', 'Y', '0', 'admin', '2021-03-10 13:28:54', '', NULL, '正常'),
(120, 1, '目录', '0', 'cms_column_type', '', 'warning', 'Y', '0', 'admin', '2021-03-11 21:14:53', 'admin', '2021-03-11 21:55:06', '当前为目录 可放文章 可放类目'),
(121, 2, '导航', '1', 'cms_column_type', '', 'success', 'Y', '0', 'admin', '2021-03-11 21:16:01', 'admin', '2021-03-11 21:55:14', '类目节点'),
(122, 1, '隐藏', '0', 'cms_column_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-11 21:20:41', '', NULL, '隐藏'),
(123, 2, '显示', '1', 'cms_column_visible', NULL, 'warning', 'Y', '0', 'admin', '2021-03-11 21:21:20', '', NULL, '显示'),
(124, 1, '目录', '0', 'cms_cat_parent', NULL, 'primary', 'Y', '0', 'admin', '2021-03-11 21:53:14', '', NULL, NULL),
(125, 2, '类目', '1', 'cms_cat_parent', '', 'success', 'Y', '0', 'admin', '2021-03-11 21:53:38', 'admin', '2021-03-11 21:53:46', ''),
(126, 1, '隐藏', '0', 'cms_cat_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-11 21:58:21', '', NULL, NULL),
(127, 2, '显示', '1', 'cms_cat_visible', '', 'success', 'Y', '0', 'admin', '2021-03-11 21:58:42', 'admin', '2021-03-11 21:59:08', ''),
(128, 1, '站内', '0', 'cms_column_locate', NULL, 'success', 'Y', '0', 'admin', '2021-03-11 22:02:06', '', NULL, NULL),
(129, 2, '站外', '1', 'cms_column_locate', NULL, 'danger', 'Y', '0', 'admin', '2021-03-11 22:02:27', '', NULL, NULL),
(130, 1, '当前窗口', '0', 'cms_column_open', NULL, 'success', 'Y', '0', 'admin', '2021-03-11 22:03:45', '', NULL, NULL),
(131, 2, '新窗口', '1', 'cms_column_open', NULL, 'info', 'Y', '0', 'admin', '2021-03-11 22:04:13', '', NULL, NULL),
(132, 0, '淘客商品', '0', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-03-12 00:32:48', 'admin', '2021-07-04 11:27:11', '淘客商品教程'),
(133, 1, '隐藏', '0', 'cms_article_visible', '', 'warning', 'Y', '0', 'admin', '2021-03-12 00:34:53', 'admin', '2021-03-12 00:36:20', '相当于逻辑删除'),
(134, 2, '草稿', '1', 'cms_article_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-12 00:36:00', '', NULL, '保存未发布'),
(135, 3, '审核中', '2', 'cms_article_visible', NULL, 'warning', 'Y', '0', 'admin', '2021-03-12 00:37:27', '', NULL, NULL),
(136, 4, '通过', '3', 'cms_article_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-12 00:38:03', '', NULL, NULL),
(137, 1, '正常', '0', 'cms_article_top', NULL, 'primary', 'Y', '0', 'admin', '2021-03-12 00:40:11', '', NULL, NULL),
(138, 1, '正常', '0', 'oly_mail_used', NULL, 'primary', 'Y', '0', 'admin', '2021-04-12 22:19:13', '', NULL, NULL),
(139, 2, '验证码', '1', 'oly_mail_used', '', 'warning', 'Y', '0', 'admin', '2021-04-12 22:19:32', 'admin', '2021-04-12 22:19:38', ''),
(140, 3, '备份', '2', 'oly_mail_used', NULL, 'info', 'Y', '0', 'admin', '2021-04-12 22:20:01', '', NULL, NULL),
(143, 1, '淘客福利', '1', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 17:26:16', 'admin', '2021-05-18 10:28:35', '淘客福利教程'),
(144, 2, '淘客教程', '2', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 17:29:57', 'admin', '2021-05-18 10:28:21', '淘客教程类型'),
(146, 0, '下架', '0', 'cms_tao_fittle', NULL, 'primary', 'Y', '0', 'admin', '2021-04-24 17:42:21', '', NULL, '下架'),
(147, 1, '待上架', '1', 'cms_tao_fittle', NULL, 'info', 'Y', '0', 'admin', '2021-04-24 17:42:57', '', NULL, '等待上架'),
(148, 2, '上架', '2', 'cms_tao_fittle', NULL, 'success', 'Y', '0', 'admin', '2021-04-24 18:01:23', '', NULL, NULL),
(149, 3, '推荐', '3', 'cms_tao_fittle', NULL, 'warning', 'Y', '0', 'admin', '2021-04-24 18:01:53', '', NULL, NULL),
(150, 0, '淘宝', '0', 'cms_tao_type', NULL, 'success', 'Y', '0', 'admin', '2021-04-24 18:39:37', '', NULL, NULL),
(151, 1, '京东', '1', 'cms_tao_type', NULL, 'success', 'Y', '0', 'admin', '2021-04-24 18:39:59', '', NULL, NULL),
(152, 2, '苏宁', '2', 'cms_tao_type', NULL, 'info', 'Y', '0', 'admin', '2021-04-24 18:40:18', '', NULL, NULL),
(153, 3, '拼多多', '3', 'cms_tao_type', NULL, 'info', 'Y', '0', 'admin', '2021-04-24 18:40:46', '', NULL, NULL),
(156, 3, '推荐', '2', 'cms_tag_visible', NULL, 'info', 'Y', '0', 'admin', '2021-05-09 18:04:50', '', NULL, NULL),
(157, 2, '推荐', '2', 'cms_column_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-09 18:05:32', '', NULL, NULL),
(158, 2, '推荐', '2', 'cms_cat_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-09 18:10:39', '', NULL, NULL),
(162, 3, '文档类型', '3', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-05-18 10:28:03', 'admin', '2021-06-23 20:41:09', '教程文档类型'),
(163, 2, '数据页面', '2', 'oly_template_type', NULL, 'info', 'Y', '0', 'admin', '2021-05-19 18:21:08', '', NULL, '带数据填充'),
(164, 0, '隐藏', '0', 'oly_template_visible', '', 'primary', 'Y', '0', 'admin', '2021-05-21 23:03:06', 'admin', '2021-05-21 23:03:53', '隐藏'),
(165, 1, '显示', '1', 'oly_template_visible', NULL, 'info', 'Y', '0', 'admin', '2021-05-21 23:03:39', '', NULL, '显示'),
(166, 0, '未发送', '0', 'oly_mail_visible', NULL, 'success', 'Y', '0', 'admin', '2021-05-22 15:27:14', '', NULL, NULL),
(167, 1, '已发送', '1', 'oly_mail_visible', NULL, 'success', 'Y', '0', 'admin', '2021-05-22 15:27:29', '', NULL, NULL),
(168, 0, '隐藏', '0', 'cms_link_visible', NULL, 'success', 'Y', '0', 'admin', '2021-05-28 10:30:08', '', NULL, NULL),
(169, 1, '显示', '1', 'cms_link_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-28 10:30:23', '', NULL, NULL),
(170, 2, '推荐', '2', 'cms_link_visible', NULL, 'warning', 'Y', '0', 'admin', '2021-05-28 10:30:40', '', NULL, NULL),
(171, 0, '处理中', '0', 'cms_contact_visible', NULL, 'info', 'Y', '0', 'admin', '2021-05-28 13:26:23', '', NULL, NULL),
(172, 1, '已处理', '1', 'cms_contact_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-28 13:26:42', '', NULL, NULL),
(173, 0, '友好建议', '0', 'cms_contact_type', '', 'primary', 'Y', '0', 'admin', '2021-05-28 22:02:21', 'admin', '2021-05-28 22:03:46', ''),
(174, 1, '错误反馈', '1', 'cms_contact_type', '', 'info', 'Y', '0', 'admin', '2021-05-28 22:02:57', 'admin', '2021-05-28 22:03:19', ''),
(176, 0, '轮播类型', '0', 'cms_support_type', '', 'success', 'Y', '0', 'admin', '2021-06-24 15:42:49', 'admin', '2021-07-07 21:37:58', '轮播标记类型'),
(177, 1, '文档类型', '1', 'cms_support_type', NULL, 'primary', 'Y', '0', 'admin', '2021-07-02 10:57:15', '', NULL, 'zgCms文章标记'),
(178, 2, '博客类型', '2', 'cms_support_type', '', 'primary', 'Y', '0', 'admin', '2021-07-02 10:59:23', 'admin', '2021-08-02 07:08:13', 'zgBlog博客标记'),
(179, 3, '淘客类型', '3', 'cms_support_type', '', 'success', 'Y', '0', 'admin', '2021-07-07 21:39:46', 'admin', '2021-08-02 07:08:56', 'zgTao淘客标记'),
(180, 0, '审核中', '0', 'cms_comment_visible', NULL, 'default', 'Y', '0', 'admin', '2021-12-12 22:11:33', '', NULL, '审核中'),
(181, 1, '通过', '1', 'cms_comment_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-12-12 22:12:00', '', NULL, '通过'),
(182, 2, '不通过', '2', 'cms_comment_visible', NULL, 'info', 'Y', '0', 'admin', '2021-12-12 22:12:48', '', NULL, '不通过'),
(183, 3, '顶置', '3', 'cms_comment_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-12-12 22:13:33', '', NULL, '顶置'),
(185, 0, '目录', '0', 'oly_template_type', NULL, 'primary', 'Y', '0', 'admin', '2021-02-24 16:28:53', '', NULL, '目录\\根'),
(186, 1, '普通页面', '1', 'oly_template_type', '', 'success', 'Y', '0', 'admin', '2021-02-24 16:29:27', 'admin', '2021-05-19 18:21:25', 'HTML页面或者片段，不带数据填充'),
(187, 3, '文档', '3', 'oly_template_type', '', 'success', 'Y', '0', 'admin', '2021-02-24 16:30:37', 'admin', '2021-05-19 18:19:23', '文档 pdf doc excel等等'),
(188, 1, '图片', 'image', 'oly_oss_type', NULL, 'primary', 'Y', '0', 'admin', '2021-03-05 15:48:42', '', NULL, '图片类型'),
(189, 2, '文档', 'document', 'oly_oss_type', NULL, 'primary', 'Y', '0', 'admin', '2021-03-05 15:49:36', '', NULL, '文档文件'),
(190, 0, '蓝色', 'skin-blue', 'sys_index_skin_name', NULL, 'warning', 'Y', '0', 'admin', '2022-04-23 23:42:16', '', NULL, '蓝色 skin-blue'),
(191, 1, '绿色', 'skin-green', 'sys_index_skin_name', NULL, 'primary', 'Y', '0', 'admin', '2022-04-23 23:43:08', '', NULL, '绿色 skin-green'),
(192, 2, '紫色', 'skin-purple', 'sys_index_skin_name', '', 'success', 'Y', '0', 'admin', '2022-04-23 23:45:10', 'admin', '2022-04-23 23:45:20', '紫色 skin-purple'),
(193, 3, '红色', 'skin-red', 'sys_index_skin_name', NULL, 'danger', 'Y', '0', 'admin', '2022-04-23 23:46:04', '', NULL, '红色 skin-red'),
(194, 4, '黄色', 'skin-yellow', 'sys_index_skin_name', NULL, 'info', 'Y', '0', 'admin', '2022-04-23 23:46:54', '', NULL, '黄色 skin-yellow'),
(195, 0, '深黑主题', 'theme-dark', 'sys_index_side_theme', NULL, 'info', 'Y', '0', 'admin', '2022-04-23 23:50:29', '', NULL, '深黑主题theme-dark'),
(196, 1, '浅色主题', 'theme-light', 'sys_index_side_theme', NULL, 'success', 'Y', '0', 'admin', '2022-04-23 23:51:02', '', NULL, '浅色主题theme-light'),
(197, 2, '深蓝主题', 'theme-blue', 'sys_index_side_theme', '', 'warning', 'Y', '0', 'admin', '2022-04-23 23:52:16', 'admin', '2022-04-23 23:52:31', '深蓝主题theme-blue'),
(198, 0, '左侧', 'default', 'sys_index_menu_style', NULL, 'primary', 'Y', '0', 'admin', '2022-04-23 23:55:22', '', NULL, 'default为左侧导航菜单'),
(199, 1, '顶部', 'topnav', 'sys_index_menu_style', NULL, 'success', 'Y', '0', 'admin', '2022-04-23 23:56:26', '', NULL, 'topnav顶部');

-- --------------------------------------------------------

--
-- 表的结构 `sys_dict_type`
--

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典类型表';

--
-- 转存表中的数据 `sys_dict_type`
--

INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '用户性别列表'),
(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '菜单状态列表'),
(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '系统开关列表'),
(4, '任务状态', 'sys_job_status', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '任务状态列表'),
(5, '任务分组', 'sys_job_group', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '任务分组列表'),
(6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '系统是否列表'),
(7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '通知类型列表'),
(8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '通知状态列表'),
(9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '操作类型列表'),
(10, '系统状态', 'sys_common_status', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '登录状态列表'),
(100, '配置类型', 'sys_config_type', '0', 'admin', '2022-01-26 08:33:19', 'admin', '2022-01-26 08:34:56', '配置类型'),
(101, '配置参数类型', 'sys_config_value_type', '0', 'admin', '2022-01-26 08:34:39', '', NULL, '配置参数类型'),
(102, '储存位置', 'oly_oss_location', '0', 'admin', '2022-02-16 08:53:47', '', NULL, '储存位置'),
(104, '邮件类型', 'oly_mail_type', '0', 'admin', '2021-03-07 23:49:38', '', NULL, '邮件类型 文本 模板 HTML'),
(105, '标签状态', 'cms_tag_visible', '0', 'admin', '2021-03-10 13:05:15', '', NULL, '标签状态'),
(107, '栏目类型', 'cms_column_type', '0', 'admin', '2021-03-11 21:13:37', 'admin', '2021-06-08 12:33:46', '栏目类型'),
(108, '栏目状态', 'cms_column_visible', '0', 'admin', '2021-03-11 21:19:51', 'admin', '2021-03-11 21:47:47', '类目状态'),
(109, '类目节点', 'cms_cat_parent', '0', 'admin', '2021-03-11 21:48:49', 'admin', '2021-04-22 22:39:11', '类目节点'),
(110, '类目状态', 'cms_cat_visible', '0', 'admin', '2021-03-11 21:57:33', 'admin', '2021-07-04 11:26:12', '类目状态'),
(111, '导航位置', 'cms_column_locate', '0', 'admin', '2021-03-11 22:01:38', 'admin', '2021-03-11 22:06:14', '站内还是站外导航'),
(112, '打开方式', 'cms_column_open', '0', 'admin', '2021-03-11 22:03:06', '', NULL, NULL),
(113, '文章类型', 'cms_article_type', '0', 'admin', '2021-03-12 00:13:24', 'admin', '2021-07-04 11:26:35', '文章类型'),
(114, '文章状态', 'cms_article_visible', '0', 'admin', '2021-03-12 00:33:56', '', NULL, NULL),
(115, '文章顶置', 'cms_article_top', '0', 'admin', '2021-03-12 00:39:46', '', NULL, NULL),
(116, '邮件用途', 'oly_mail_used', '0', 'admin', '2021-04-12 22:18:01', '', NULL, NULL),
(118, '商品状态', 'cms_tao_fittle', '0', 'admin', '2021-04-24 17:41:31', '', NULL, '商品状态'),
(119, '商品类型', 'cms_tao_type', '0', 'admin', '2021-04-24 18:07:27', '', NULL, NULL),
(120, '模板状态', 'oly_template_visible', '0', 'admin', '2021-05-21 23:01:57', '', NULL, '模板状态'),
(121, '邮件状态', 'oly_mail_visible', '0', 'admin', '2021-05-22 15:26:17', '', NULL, NULL),
(122, '链接状态', 'cms_link_visible', '0', 'admin', '2021-05-28 10:29:34', '', NULL, NULL),
(123, '反馈状态', 'cms_contact_visible', '0', 'admin', '2021-05-28 13:25:52', '', NULL, NULL),
(124, '反馈类型', 'cms_contact_type', '0', 'admin', '2021-05-28 21:47:46', '', NULL, NULL),
(125, '标记类型', 'cms_support_type', '0', 'admin', '2021-06-24 15:41:27', 'admin', '2022-03-01 06:16:18', '标记类型类型'),
(126, '评论状态', 'cms_comment_visible', '0', 'admin', '2021-12-12 22:07:09', '', NULL, '评论状态'),
(127, '模板类型', 'oly_template_type', '0', 'admin', '2021-02-24 16:27:04', '', NULL, '模板类型'),
(128, '文件类型', 'oly_oss_type', '0', 'admin', '2021-03-05 15:46:26', '', NULL, '储存文件的类型'),
(129, '皮肤样式', 'sys_index_skin_name', '0', 'admin', '2022-04-23 23:39:54', '', NULL, '管理页皮肤样式'),
(130, '侧边主题', 'sys_index_side_theme', '0', 'admin', '2022-04-23 23:48:59', 'admin', '2022-04-23 23:52:47', '侧边样式'),
(131, '导航风格', 'sys_index_menu_style', '0', 'admin', '2022-04-23 23:54:14', '', NULL, '菜单导航显示风格');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job`
--

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_unicode_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='定时任务调度表';

--
-- 转存表中的数据 `sys_job`
--

INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-01-13 08:17:25', '', NULL, ''),
(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-01-13 08:17:25', '', NULL, ''),
(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-01-13 08:17:25', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_job_log`
--

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='定时任务调度日志表';

-- --------------------------------------------------------

--
-- 表的结构 `sys_logininfor`
--

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `login_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统访问记录';

--
-- 转存表中的数据 `sys_logininfor`
--

INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-18 10:29:56'),
(101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-18 10:46:31'),
(102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-18 10:57:04'),
(103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-20 09:44:09'),
(104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-23 08:56:27'),
(105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-01-23 19:37:06'),
(106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-23 19:37:15'),
(107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-01-24 09:17:37'),
(108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-24 09:17:41'),
(109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-01-25 17:04:55'),
(110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 17:05:02'),
(111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-25 18:44:52'),
(112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-26 08:27:54'),
(113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-27 09:39:40'),
(114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-28 08:46:33'),
(115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-29 08:27:32'),
(116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-29 09:20:05'),
(117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-31 02:36:27'),
(118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-01-31 04:13:03'),
(119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-02 08:19:59'),
(120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-02 08:45:10'),
(121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-02 08:45:16'),
(122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-02 09:12:09'),
(123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-02 09:53:24'),
(124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-03 09:04:52'),
(125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-13 12:37:21'),
(126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-13 12:53:54'),
(127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-13 12:59:15'),
(128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-14 08:35:55'),
(129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-14 09:18:44'),
(130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-14 10:21:19'),
(131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-14 10:31:29'),
(132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-15 08:40:06'),
(133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-15 09:11:02'),
(134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-15 09:57:35'),
(135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-15 09:57:38'),
(136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-16 08:45:41'),
(137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-16 09:40:36'),
(138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-16 09:48:08'),
(139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-16 18:38:29'),
(140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-17 08:54:03'),
(141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-17 08:56:44'),
(142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-18 10:49:34'),
(143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 08:25:12'),
(144, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 09:15:52'),
(145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-27 09:54:00'),
(146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 09:54:11'),
(147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 04:20:31'),
(148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 04:22:37'),
(149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 04:30:37'),
(150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 04:33:15'),
(151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 20:33:00'),
(152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 03:59:56'),
(153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 04:19:57'),
(154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 06:12:51'),
(155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 21:46:11'),
(156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 01:04:11'),
(157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 01:14:56'),
(158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 02:02:14'),
(159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-02 02:54:54'),
(160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-04 20:54:42'),
(161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 20:54:47'),
(162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-05 03:29:02'),
(163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-06 21:21:03'),
(164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-06 21:21:11'),
(165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 20:25:51'),
(166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-07 20:32:05'),
(167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 20:32:08'),
(168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 20:59:16'),
(169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 22:22:27'),
(170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-07 22:41:04'),
(171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 22:41:10'),
(172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 22:46:55'),
(173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 22:51:18'),
(174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 06:10:04'),
(175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-08 20:45:48'),
(176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-08 20:45:55'),
(177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 20:46:03'),
(178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-08 20:51:10'),
(179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 20:51:14'),
(180, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 21:11:24'),
(181, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-08 22:22:24'),
(182, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 22:22:30'),
(183, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 20:56:35'),
(184, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:00:06'),
(185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:08:33'),
(186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:14:29'),
(187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-09 21:21:17'),
(188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:21:26'),
(189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-09 21:27:35'),
(190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:27:40'),
(191, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 21:32:28'),
(192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 22:11:43'),
(193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 20:39:13'),
(194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 20:41:38'),
(195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 20:52:52'),
(196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 21:05:45'),
(197, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 21:28:02'),
(198, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 21:58:17'),
(199, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:10:46'),
(200, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:14:09'),
(201, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:23:19'),
(202, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:25:08'),
(203, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:34:26'),
(204, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 22:36:21'),
(205, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 23:51:36'),
(206, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 23:57:18'),
(207, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 00:04:55'),
(208, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 21:04:36'),
(209, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 21:52:01'),
(210, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 23:26:04'),
(211, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 23:29:46'),
(212, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-16 20:18:55'),
(213, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 20:19:00'),
(214, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 20:41:00'),
(215, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 22:03:51'),
(216, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 22:42:34'),
(217, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-23 22:15:09'),
(218, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-23 22:15:12'),
(219, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 22:15:18'),
(220, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 22:29:02'),
(221, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 22:38:27'),
(222, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 22:41:51'),
(223, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 22:57:04'),
(224, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 23:02:10'),
(225, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 23:07:57'),
(226, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 23:13:46'),
(227, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 22:33:11'),
(228, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 22:41:46'),
(229, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 22:54:36'),
(230, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 22:57:10'),
(231, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:03:32'),
(232, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:07:22'),
(233, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-24 23:14:17'),
(234, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:14:21'),
(235, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:42:42'),
(236, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:51:02'),
(237, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-24 23:52:59'),
(238, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 08:14:44'),
(239, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-25 13:10:32'),
(240, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 13:10:36'),
(241, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 13:20:03'),
(242, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 13:24:20'),
(243, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 13:28:12'),
(244, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 14:35:53'),
(245, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 14:44:49'),
(246, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 14:58:58'),
(247, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 15:07:47'),
(248, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 16:16:31'),
(249, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 17:21:49'),
(250, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 17:49:31'),
(251, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 20:09:19'),
(252, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 20:22:04'),
(253, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-25 23:31:49'),
(254, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 08:14:24'),
(255, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 09:46:01'),
(256, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 10:24:22'),
(257, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 10:51:26'),
(258, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 15:11:05'),
(259, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 15:35:51'),
(260, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-26 15:35:56'),
(261, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 15:36:00'),
(262, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 15:44:10'),
(263, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 15:55:37'),
(264, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 16:02:19'),
(265, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:38:55'),
(266, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 23:42:17'),
(267, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:59:49'),
(268, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 16:55:50'),
(269, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 16:55:50'),
(270, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-27 18:15:34'),
(271, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-27 18:15:38'),
(272, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 18:15:42'),
(273, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 22:11:31'),
(274, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 00:17:40'),
(275, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 00:19:53'),
(276, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 01:50:30'),
(277, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 01:54:11'),
(278, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-28 01:56:08'),
(279, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 01:56:14'),
(280, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-28 02:11:10'),
(281, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 02:11:14'),
(282, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 02:17:32'),
(283, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-28 03:20:29'),
(284, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 03:20:36'),
(285, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 07:31:40'),
(286, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 07:33:49'),
(287, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 08:43:39'),
(288, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 11:51:38'),
(289, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 13:14:22'),
(290, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 13:37:05'),
(291, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 14:33:58'),
(292, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 16:44:29'),
(293, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:05:58'),
(294, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:54:24'),
(295, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 13:43:05'),
(296, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 13:43:09'),
(297, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 14:10:31'),
(298, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 14:47:16'),
(299, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 20:00:43'),
(300, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-29 21:18:20'),
(301, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 21:18:25'),
(302, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 12:14:39'),
(303, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-30 13:34:07'),
(304, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 13:34:07'),
(305, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-30 16:38:04'),
(306, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 01:22:37'),
(307, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 15:37:22'),
(308, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 23:40:37'),
(309, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 11:17:44'),
(310, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 22:19:03'),
(311, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-01 23:06:17'),
(312, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-02 18:08:48'),
(313, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 18:08:53'),
(314, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 18:36:37'),
(315, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 18:46:06'),
(316, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-02 21:27:06'),
(317, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-02 21:27:11'),
(318, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 21:27:15'),
(319, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 23:16:40'),
(320, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-02 23:24:28'),
(321, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-03 12:24:47'),
(322, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-03 16:07:08'),
(323, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-03 16:07:12'),
(324, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-03 17:13:55'),
(325, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 00:13:27'),
(326, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 00:42:14'),
(327, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 13:57:12'),
(328, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-04 14:00:52'),
(329, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 14:00:58'),
(330, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 14:03:28'),
(331, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-04-04 23:55:54'),
(332, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-04 23:55:59'),
(333, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 01:12:07'),
(334, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 22:00:21'),
(335, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-09 23:16:40'),
(336, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 23:16:44'),
(337, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 23:29:34'),
(338, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-09 23:47:15'),
(339, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-10 00:02:38'),
(340, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-10 00:26:19'),
(341, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 11:11:00'),
(342, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-11 19:16:06'),
(343, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 03:31:04'),
(344, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 03:34:05'),
(345, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 14:50:21'),
(346, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 14:52:35'),
(347, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-13 15:18:48'),
(348, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-14 22:13:50'),
(349, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-14 23:17:29'),
(350, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 02:04:37'),
(351, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 13:37:00'),
(352, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 17:14:53'),
(353, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 17:57:37'),
(354, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 19:14:11'),
(355, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 20:19:55'),
(356, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 21:12:20'),
(357, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-15 22:51:19'),
(358, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-21 23:09:36'),
(359, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-21 23:49:00'),
(360, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 01:18:33'),
(361, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-22 23:06:52'),
(362, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-23 00:40:04'),
(363, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-23 00:40:09'),
(364, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 00:40:13'),
(365, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 01:02:05'),
(366, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 08:00:11'),
(367, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-23 23:24:44'),
(368, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 04:54:52'),
(369, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 04:56:13'),
(370, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-24 10:01:20'),
(371, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 10:01:25'),
(372, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 10:20:26'),
(373, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 10:28:47');

-- --------------------------------------------------------

--
-- 表的结构 `sys_menu`
--

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单权限表';

--
-- 转存表中的数据 `sys_menu`
--

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-01-13 08:17:24', '', NULL, '系统管理目录'),
(2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-01-13 08:17:24', '', NULL, '系统监控目录'),
(3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-01-13 08:17:24', '', NULL, '系统工具目录'),
(4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2022-01-13 08:17:24', '', NULL, '若依官网地址'),
(100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-01-13 08:17:24', '', NULL, '用户管理菜单'),
(101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-01-13 08:17:24', '', NULL, '角色管理菜单'),
(102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-01-13 08:17:24', '', NULL, '菜单管理菜单'),
(103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-01-13 08:17:24', '', NULL, '部门管理菜单'),
(104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-01-13 08:17:24', '', NULL, '岗位管理菜单'),
(105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-01-13 08:17:24', '', NULL, '字典管理菜单'),
(106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-01-13 08:17:24', '', NULL, '参数设置菜单'),
(107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-01-13 08:17:24', '', NULL, '通知公告菜单'),
(108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-01-13 08:17:24', '', NULL, '日志管理菜单'),
(109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-01-13 08:17:24', '', NULL, '在线用户菜单'),
(110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-01-13 08:17:24', '', NULL, '定时任务菜单'),
(111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-01-13 08:17:24', '', NULL, '数据监控菜单'),
(112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-01-13 08:17:24', '', NULL, '服务监控菜单'),
(113, '缓存监控', 2, 5, '/monitor/cache', 'menuItem', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-01-13 08:17:24', 'admin', '2022-04-13 14:53:34', '缓存监控菜单'),
(114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-01-13 08:17:24', '', NULL, '表单构建菜单'),
(115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-01-13 08:17:24', '', NULL, '代码生成菜单'),
(116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-01-13 08:17:24', '', NULL, '系统接口菜单'),
(500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-01-13 08:17:24', '', NULL, '操作日志菜单'),
(501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-01-13 08:17:24', '', NULL, '登录日志菜单'),
(1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-01-13 08:17:24', '', NULL, ''),
(1062, '储存服务', 1065, 9, '/oly/oss', 'menuItem', 'C', '0', '1', 'oly:oss:view', 'fa fa-folder', 'admin', '2022-02-14 10:23:31', 'admin', '2022-02-27 10:28:32', ''),
(1063, '内容管理', 0, 3, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-pencil-square-o', 'admin', '2022-02-27 10:03:00', '', NULL, ''),
(1064, '邮件服务', 1065, 3, '/oly/mail', 'menuItem', 'C', '0', '1', 'oly:mail:view', 'fa fa-envelope', 'admin', '2022-02-27 10:10:48', 'admin', '2022-02-27 10:27:30', ''),
(1065, '系统服务', 0, 3, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-server', 'admin', '2022-02-27 10:25:40', '', NULL, ''),
(1066, '导航管理', 1063, 1, '/cms/column', 'menuItem', 'C', '0', '1', 'cms:column:view', '#', 'admin', '2022-02-27 10:34:32', 'admin', '2022-02-28 20:40:10', ''),
(1067, '分类管理', 1063, 2, '/cms/cat', 'menuItem', 'C', '0', '1', 'cms:cat:view', '#', 'admin', '2022-02-27 10:37:58', '', NULL, ''),
(1068, '标签管理', 1063, 4, '/cms/tag', 'menuItem', 'C', '0', '1', 'cms:tag:view', '#', 'admin', '2022-02-27 10:39:02', '', NULL, ''),
(1069, '联盟管理', 1063, 1, '/cms/union', 'menuItem', 'C', '1', '1', 'cms:union:view', '#', 'admin', '2022-02-27 10:42:39', 'admin', '2022-04-22 01:24:15', ''),
(1070, '文章管理', 1063, 5, '/cms/article', 'menuItem', 'C', '0', '1', 'cms:article:view', '#', 'admin', '2022-02-27 10:46:34', 'admin', '2022-03-01 21:47:24', ''),
(1071, '内容配置', 1063, 0, '/cms/config/cmsConfig', 'menuItem', 'C', '0', '1', 'cms:config:view', '#', 'admin', '2022-02-27 10:48:48', 'admin', '2022-03-16 20:26:19', ''),
(1072, '主题管理', 1063, 6, '/cms/theme', 'menuItem', 'C', '0', '1', 'cms:theme:view', '#', 'admin', '2022-02-27 10:50:21', '', NULL, ''),
(1073, '统计管理', 1063, 7, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2022-02-27 10:54:11', '', NULL, ''),
(1074, '模板维护', 3, 3, '/oly/template', 'menuItem', 'C', '0', '1', 'oly:template:view', '#', 'admin', '2022-03-04 20:57:20', 'admin', '2022-03-04 20:58:40', ''),
(1076, '链接管理', 1063, 7, '/cms/link', 'menuItem', 'C', '0', '1', 'cms:link:view', '#', 'admin', '2022-04-15 17:59:00', 'admin', '2022-04-15 18:01:07', ''),
(1077, '文章统计', 1073, 1, '/cms/articleCount/articleCount', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:33:25', '', NULL, ''),
(1078, '阅读记录', 1073, 2, '/cms/articleCount/lookRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:34:34', '', NULL, ''),
(1079, '分享记录', 1073, 3, '/cms/articleCount/shareRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:35:38', '', NULL, ''),
(1080, '喜欢记录', 1073, 4, '/cms/articleCount/shareRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:36:47', '', NULL, ''),
(1081, '收藏记录', 1073, 5, '/cms/articleCount/collectRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:38:37', '', NULL, ''),
(1082, '评分记录', 1073, 6, '/cms/articleCount/scoreRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:39:59', '', NULL, ''),
(1083, '踩踩记录', 1073, 7, '/cms/articleCount/nastyRecord', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-22 01:41:17', '', NULL, ''),
(1084, '系统设置', 1, 1, '/system/config/setting', 'menuItem', 'C', '0', '1', 'system:config:view', '#', 'admin', '2022-04-23 01:03:52', 'admin', '2022-04-23 01:04:26', '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_notice`
--

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知公告表';

--
-- 转存表中的数据 `sys_notice`
--

INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '管理员'),
(2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-01-13 08:17:25', '', NULL, '管理员');

-- --------------------------------------------------------

--
-- 表的结构 `sys_oper_log`
--

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志记录';

--
-- 转存表中的数据 `sys_oper_log`
--

INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"oly_config\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-18 11:20:47'),
(101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/oly_config', '127.0.0.1', '内网IP', '\"oly_config\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-20 09:44:23'),
(102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/oly_config', '127.0.0.1', '内网IP', '\"oly_config\"', NULL, 0, NULL, '2022-01-23 19:37:38'),
(103, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"配置类型\"],\"dictType\":[\"sys_config_type\"],\"remark\":[\"配置类型\"],\"status\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:33:19'),
(104, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"配置参数类型\"],\"dictType\":[\"sys_config_value_type\"],\"status\":[\"0\"],\"remark\":[\"配置参数类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:34:39'),
(105, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"100\"],\"dictName\":[\"配置类型\"],\"dictType\":[\"sys_config_type\"],\"status\":[\"0\"],\"remark\":[\"配置类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:34:56'),
(106, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"系统配置\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_config_type\"],\"cssClass\":[\"1\"],\"dictSort\":[\"0\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"系统配置参数，不可删除\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:37:00'),
(107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"内容配置\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"remark\":[\"内容配置参数\"],\"status\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:41:00'),
(108, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"内容配置\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"内容配置参数\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:41:13'),
(109, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"主题配置\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"主题配置参数\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:42:35'),
(110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"数值\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"数值型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:49:29'),
(111, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"数值\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"数值型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:49:39'),
(112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"布尔\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"布尔 true/false\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:51:54'),
(113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"字符\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"字符串任意类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-26 08:53:16'),
(114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"浮点\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"浮点数\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-31 02:50:23'),
(115, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"布尔\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"布尔 true/false\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-31 02:50:46'),
(116, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"字符\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"字符串任意类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-01-31 02:51:02'),
(117, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"测试参数\"],\"configKey\":[\"test.ui\"],\"configValueType\":[\"2\"],\"configValue\":[\"ttt\\t\\t\\t\\t\"],\"configType\":[\"0\"],\"remark\":[\"6666\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【ttt】', '2022-02-02 08:22:17'),
(118, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"测试参数\"],\"configKey\":[\"test.ui\"],\"configValueType\":[\"2\"],\"configValue\":[\"ttt\"],\"configType\":[\"0\"],\"remark\":[\"6666\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【ttt】', '2022-02-02 08:23:11'),
(119, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"测试参数\"],\"configKey\":[\"test.ui\"],\"configValueType\":[\"0\"],\"configValue\":[\"\\r\\n\\t1\\t\\t\\t\\t\"],\"configType\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-02 08:28:02'),
(120, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"浮点\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"浮点数\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-02 08:33:16'),
(121, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"布尔\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"布尔 true/false\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-02 08:33:27'),
(122, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"字符\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_config_value_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"字符串任意类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-02 08:33:36'),
(123, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"9\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-是否开启页脚\"],\"configKey\":[\"sys.index.footer\"],\"configValueType\":[\"1\"],\"configValue\":[\"fff\"],\"configType\":[\"0\"],\"remark\":[\"是否开启底部页脚显示（true显示，false隐藏）\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【fff】', '2022-02-02 09:53:57'),
(124, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"0\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-02-02 09:54:13'),
(125, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-02 09:56:57'),
(126, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValueType\":[\"0\"],\"configValue\":[\"theme-dark\"],\"configType\":[\"0\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【theme-dark】', '2022-02-02 09:57:10'),
(127, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValueType\":[\"0\"],\"configValue\":[\"theme-dark\"],\"configType\":[\"0\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【theme-dark】', '2022-02-02 09:58:32'),
(128, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"0\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-02-02 09:58:43'),
(129, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"3\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-02-03 09:05:25'),
(130, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"3\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-02-03 09:05:36'),
(131, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysUiIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"3\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-02-03 09:08:45'),
(132, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"test\"],\"configKey\":[\"test.uir\"],\"configValueType\":[\"3\"],\"configValue\":[\"test\\r\\n\\t\\t\\t\\t\\t\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', NULL, 1, '预期类型检测不通过类型【1,参数【test】', '2022-02-03 09:09:39'),
(133, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"test\"],\"configKey\":[\"test.uir\"],\"configValueType\":[\"3\"],\"configValue\":[\"test\\r\\n\\t\\t\\t\\t\\t\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', NULL, 1, '预期类型检测不通过类型【1,参数【test】', '2022-02-03 09:09:44'),
(134, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"test\"],\"configName\":[\"test\"],\"configKey\":[\"test.uir\"],\"configValueType\":[\"3\"],\"configValue\":[\"test\\r\\n\\t\\t\\t\\t\\t\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', NULL, 1, '预期类型检测不通过类型【1,参数【test】', '2022-02-03 09:09:51'),
(135, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"储存管理\"],\"url\":[\"/oly/oss\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-14 10:23:32'),
(136, '文件内容管理', 1, 'com.oly.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'oss_used\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoYi\\RuoYi\\ruoyi-oly\\oly-oss\\target\\classes\\mapper\\oly\\OlyOssMapper.xml]\r\n### The error may involve com.oly.oss.mapper.OlyOssMapper.insertOlyOss-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into oly_oss          ( create_by,             create_time,             file_name,             size,             fk,             file_type,             domain,             file_heard,                          oss_type )           values ( ?,             sysdate(),             ?,             ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'oss_used\' doesn\'t have a default value\n; Field \'oss_used\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'oss_used\' doesn\'t have a default value', '2022-02-15 08:49:57'),
(137, '文件内容管理', 1, 'com.oly.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"png\",\"fk\":\"image\\\\2022\\\\02\\\\15\\\\f1ae3517-b158-48ed-8f8d-45e5847e84eb.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-02-15 09:03:23'),
(138, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"储存位置\"],\"dictType\":[\"oly_oss_location\"],\"status\":[\"0\"],\"remark\":[\"储存位置\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-16 08:53:47'),
(139, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"七牛\"],\"dictValue\":[\"qiniu\"],\"dictType\":[\"oly_oss_location\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"储存在七牛云\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-16 09:23:34'),
(140, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"107\"],\"dictLabel\":[\"七牛\"],\"dictValue\":[\"qiniu\"],\"dictType\":[\"oly_oss_location\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"储存在七牛\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-16 09:23:34'),
(141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"本地\"],\"dictValue\":[\"native\"],\"dictType\":[\"oly_oss_location\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"储存在本地\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-16 09:23:34'),
(142, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:25:34'),
(143, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:25:52'),
(144, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:26:59'),
(145, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:29:02'),
(146, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:29:52'),
(147, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:31:02'),
(148, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:32:23'),
(149, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:33:02'),
(150, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"]}', NULL, 1, '', '2022-02-16 09:40:45'),
(151, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', NULL, 1, '', '2022-02-16 09:45:06'),
(152, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoYi\\RuoYi\\ruoyi-system\\system-config\\target\\classes\\mapper\\system\\config\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.config.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,      config_key,      config_value,           create_by,           config_group,                         create_time         )values(     ?,      ?,      ?,           ?,           ?,                    sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value\n; Field \'config_value_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value', '2022-02-16 09:48:16'),
(153, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoYi\\RuoYi\\ruoyi-system\\system-config\\target\\classes\\mapper\\system\\config\\SysConfigMapper.xml]\r\n### The error may involve com.ruoyi.system.config.mapper.SysConfigMapper.insertConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_config (     config_name,      config_key,      config_value,           create_by,           config_group,                         create_time         )values(     ?,      ?,      ?,           ?,           ?,                    sysdate()   )\r\n### Cause: java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value\n; Field \'config_value_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'config_value_type\' doesn\'t have a default value', '2022-02-16 18:38:39'),
(154, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-17 08:54:16'),
(155, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"qiniu\"],\"configGroup\":[\"ossConfig\"]}', NULL, 1, '', '2022-02-17 08:54:20'),
(156, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"qiniu\"],\"configGroup\":[\"ossConfig\"]}', NULL, 1, '', '2022-02-17 08:54:36'),
(157, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"qiniu\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-17 08:56:54'),
(158, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-17 08:56:57'),
(159, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"qiniu\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-17 08:56:59'),
(160, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.used\":[\"native\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 09:55:56'),
(161, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"内容管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-pencil-square-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:03:00'),
(162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"储存管理\"],\"url\":[\"/oly/oss\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:oss:view\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:05:22'),
(163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"储存管理\"],\"url\":[\"/oly/oss\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:oss:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-folder\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:06:30'),
(164, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"邮件管理\"],\"url\":[\"/oly/mail\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:mail:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-envelope\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:10:48'),
(165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统服务\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-server\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:25:40'),
(166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"储存管理\"],\"url\":[\"/oly/oss\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:oss:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-folder\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:26:29'),
(167, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"邮件服务\"],\"url\":[\"/oly/mail\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:mail:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-envelope\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:26:55'),
(168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1064\"],\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"邮件服务\"],\"url\":[\"/oly/mail\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:mail:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-envelope\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:27:30'),
(169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1062\"],\"parentId\":[\"1065\"],\"menuType\":[\"C\"],\"menuName\":[\"储存服务\"],\"url\":[\"/oly/oss\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:oss:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-folder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:28:32'),
(170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"内容菜单\"],\"url\":[\"/cms/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:menu:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:34:32'),
(171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1066\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"导航管理\"],\"url\":[\"/cms/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:menu:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:36:16'),
(172, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"分类管理\"],\"url\":[\"/cms/cat\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:37:58'),
(173, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"标签管理\"],\"url\":[\"/cms/tag\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:39:02'),
(174, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"联盟管理\"],\"url\":[\"/cms/union\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:42:39'),
(175, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"文章管理\"],\"url\":[\"/cms/post\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:46:34'),
(176, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"内容配置\"],\"url\":[\"/cms/config\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:config:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:48:48'),
(177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1071\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"内容配置\"],\"url\":[\"/cms/config\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:config:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:49:04'),
(178, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"主题管理\"],\"url\":[\"/cms/theme\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:50:21'),
(179, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"主题管理\"],\"url\":[\"/cms/theme\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"新增菜单\'主题管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2022-02-27 10:50:22'),
(180, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"M\"],\"menuName\":[\"统计管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-27 10:54:11'),
(181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1066\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"导航管理\"],\"url\":[\"/cms/column\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-02-28 20:40:11'),
(182, '内容栏目管理', 1, 'com.oly.cms.admin.web.controller.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"parent\":[\"0\"],\"columnName\":[\"止戈文档\"],\"columnLocate\":[\"0\"],\"columnUrl\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 04:02:03'),
(183, '内容栏目管理', 1, 'com.oly.cms.admin.web.controller.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"columnName\":[\"主页\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/index\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"止戈主页\"],\"keywords\":[\"止戈主页\"],\"description\":[\"止戈主页\"],\"columnIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 04:03:40'),
(184, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"125\"],\"dictName\":[\"标签类型\"],\"dictType\":[\"cms_tag_type\"],\"status\":[\"0\"],\"remark\":[\"标签类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 04:30:59'),
(185, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"125\"],\"dictName\":[\"类型\"],\"dictType\":[\"cms_support_type\"],\"status\":[\"0\"],\"remark\":[\"标记类型类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 06:15:23'),
(186, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"125\"],\"dictName\":[\"标记类型\"],\"dictType\":[\"cms_support_type\"],\"status\":[\"0\"],\"remark\":[\"标记类型类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 06:16:18'),
(187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1070\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"文章管理\"],\"url\":[\"/cms/article\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-01 21:47:24'),
(188, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"模板维护\"],\"url\":[\"/cms/template\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:template:view\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-04 20:57:20'),
(189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1074\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"模板维护\"],\"url\":[\"/oly/template\"],\"target\":[\"menuItem\"],\"perms\":[\"oly:template:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-04 20:58:40'),
(190, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.web.controller.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', NULL, 1, 'Illegal char <:> at index 31: C:\\Users\\Administrator\\.ruoyi\\C:\\Users\\Administrator\\.ruoyi\\themes', '2022-03-05 03:29:44'),
(191, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.web.controller.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', NULL, 1, 'Illegal char <:> at index 31: C:\\Users\\Administrator\\.ruoyi\\C:\\Users\\Administrator\\.ruoyi\\themes', '2022-03-05 03:39:53'),
(192, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"ssfs\"],\"oly.mail.host\":[\"\"],\"oly.mail.protocol\":[\"\"],\"oly.mail.ssl.port\":[\"\"],\"oly.mail.username\":[\"\"],\"oly.mail.password\":[\"\"],\"oly.mail.enabled\":[\"false\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-07 21:20:26'),
(193, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-07 21:20:36'),
(194, '字典数据', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"112\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-07 22:43:18'),
(195, '字典数据', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"113\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-07 22:43:23'),
(196, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:25:26'),
(197, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:25:42'),
(198, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:25:54'),
(199, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:28:05'),
(200, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:28:08'),
(201, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:28:09'),
(202, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:28:10'),
(203, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.qiniu.domain\":[\"\"],\"oly.oss.qiniu.access.key\":[\"\"],\"oly.oss.qiniu.secret.key\":[\"\"],\"oly.oss.qiniu.bucket\":[\"\"],\"oly.oss.qiniu.zone\":[\"\"],\"oly.oss.qiniu.style.rule\":[\"\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:29:45'),
(204, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:30:04'),
(205, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:31:36'),
(206, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:31:42'),
(207, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:32:26'),
(208, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:33:38'),
(209, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:33:41'),
(210, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:34:14'),
(211, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:36:38'),
(212, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:42:46'),
(213, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:42:49'),
(214, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:43:04'),
(215, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:45:05'),
(216, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:45:16'),
(217, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:48:18');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(218, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:48:33'),
(219, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:52:05'),
(220, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:52:32'),
(221, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:53:16'),
(222, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:53:18'),
(223, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:53:18'),
(224, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:54:42'),
(225, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:54:53'),
(226, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:55:08'),
(227, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:55:21'),
(228, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.qiniu.domain\":[\"6gffdd\"],\"oly.oss.qiniu.access.key\":[\"fdvfv\"],\"oly.oss.qiniu.secret.key\":[\"vv\"],\"oly.oss.qiniu.bucket\":[\"fv\"],\"oly.oss.qiniu.zone\":[\"vdv\"],\"oly.oss.qiniu.style.rule\":[\"vxcv\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 22:55:51'),
(229, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:02:43'),
(230, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:06:02'),
(231, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:06:16'),
(232, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:07:23'),
(233, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:09:50'),
(234, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:09:57'),
(235, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:10:16'),
(236, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-08 23:11:19'),
(237, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"/profile/upload\\\\document/2022/03/09/问卷调查_20220309203208A002.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 20:56:35'),
(238, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, 'C:\\Users\\Administrator\\.ruoyi\\profile\\upload\\image\\2022\\03\\09\\logo_hw_20220309203240A003.png (系统找不到指定的路径。)', '2022-03-09 20:56:35'),
(239, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, 'C:\\Users\\Administrator\\.ruoyi\\profile\\upload\\image\\2022\\03\\09\\logo_hw_20220309202955A001.png (系统找不到指定的路径。)', '2022-03-09 20:56:35'),
(240, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, 'C:\\Users\\Administrator\\.ruoyi\\upload\\profile\\upload\\image\\2022\\03\\09\\logo_hw_20220309210027A001.png (系统找不到指定的路径。)', '2022-03-09 21:00:27'),
(241, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, 'C:\\Users\\Administrator\\.ruoyi\\upload\\profile\\upload\\image\\2022\\03\\09\\logo_hw_20220309210047A002.png (系统找不到指定的路径。)', '2022-03-09 21:00:47'),
(242, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, 'C:\\Users\\Administrator\\.ruoyi\\upload\\upload\\image\\2022\\03\\09\\logo_hw_20220309210851A001.png (系统找不到指定的路径。)', '2022-03-09 21:08:52'),
(243, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"/upload\\\\document/2022/03/09/问卷调查_20220309210946A002.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:09:46'),
(244, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"2022/03/09/问卷调查_20220309211450A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:14:50'),
(245, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"upload\\\\document\\\\2022\\\\03\\\\09\\\\问卷调查_20220309212151A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:21:51'),
(246, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-09 21:22:26'),
(247, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"upload\\\\document\\\\2022\\\\03\\\\09\\\\问卷调查_20220309212324A002.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:23:24'),
(248, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"Administrator\\\\.ruoyi\\\\upload\\\\document\\\\2022\\\\03\\\\09\\\\问卷调查_20220309212803A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:28:03'),
(249, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\03\\\\09\\\\问卷调查_20220309213250A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:32:50'),
(250, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\03\\\\09\\\\logo_hw_20220309213426A002.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 21:34:26'),
(251, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"document%5C2022%5C03%5C09%5C%E9%97%AE%E5%8D%B7%E8%B0%83%E6%9F%A5_20220309221206A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-09 22:12:06'),
(252, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"Illegal char <:> at index 4: http://127.0.0.1:8090/oly/oss/download/\\\\avatar\\\\2022\\\\03\\\\10\\\\blob_20220310220313A001.png\",\"code\":500}', 0, NULL, '2022-03-10 22:03:14'),
(253, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"Illegal char <:> at index 4: http://127.0.0.1:8090/oly/oss/download/\\\\avatar\\\\2022\\\\03\\\\10\\\\blob_20220310220611A002.png\",\"code\":500}', 0, NULL, '2022-03-10 22:06:11'),
(254, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"Illegal char <:> at index 4: http://127.0.0.1:8090/oly/oss/download/\\\\avatar\\\\2022\\\\03\\\\10\\\\blob_20220310221109A001.png\",\"code\":500}', 0, NULL, '2022-03-10 22:11:09'),
(255, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"Illegal char <:> at index 4: http://127.0.0.1:8090/oly/oss/download/\\\\avatar\\\\2022\\\\03\\\\10\\\\blob_20220310221156A002.png\",\"code\":500}', 0, NULL, '2022-03-10 22:11:56'),
(256, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:14:39'),
(257, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:19:14'),
(258, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:19:31'),
(259, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:25:24'),
(260, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:25:31'),
(261, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:34:42'),
(262, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-10 22:36:29'),
(263, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/09/logo_hw_20220309213426A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"09\" \"logo_hw_20220309213426A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:51:50'),
(264, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/09/logo_hw_20220309213426A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"09\" \"logo_hw_20220309213426A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:52:03'),
(265, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\03\\\\10\\\\logo_hw_20220310235246A001.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-10 23:52:47'),
(266, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/10/logo_hw_20220310235246A001.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"10\" \"logo_hw_20220310235246A001.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:52:55'),
(267, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\03\\\\10\\\\logo_hw_20220310235440A002.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-10 23:54:40'),
(268, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/10/logo_hw_20220310235440A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"10\" \"logo_hw_20220310235440A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:55:26'),
(269, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"27609_logo_hw.png\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\03\\\\10\\\\logo_hw_20220310235557A003.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-03-10 23:55:57'),
(270, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/09/logo_hw_20220309213426A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"09\" \"logo_hw_20220309213426A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:57:32'),
(271, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/09/logo_hw_20220309213426A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"09\" \"logo_hw_20220309213426A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-10 23:57:38'),
(272, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/10/logo_hw_20220310235440A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"10\" \"logo_hw_20220310235440A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-11 00:05:07'),
(273, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/09/logo_hw_20220309213426A002.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"09\" \"logo_hw_20220309213426A002.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-11 00:05:13'),
(274, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/10/logo_hw_20220310235246A001.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"10\" \"logo_hw_20220310235246A001.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-03-11 00:05:18'),
(275, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"ossConfig\"],\"oly.oss.used\":[\"qiniu\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-11 21:34:33'),
(276, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"ossConfig\"],\"oly.oss.used\":[\"native\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-11 21:34:39'),
(277, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"ossConfig\"],\"oly.oss.used\":[\"qiniu\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-11 21:34:42'),
(278, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"ossConfig\"],\"oly.oss.used\":[\"native\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-11 21:52:17'),
(279, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"ossConfig\"],\"oly.oss.used\":[\"qiniu\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-11 21:52:21'),
(280, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1071\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"内容配置\"],\"url\":[\"/cms/config/cmsConfig\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:config:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-16 20:26:19'),
(281, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 22:16:56'),
(282, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 22:20:03'),
(283, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 22:29:28'),
(284, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 22:30:23'),
(285, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 22:32:14'),
(286, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 22:38:58'),
(287, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 22:42:17'),
(288, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 22:57:23'),
(289, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 22:58:07'),
(290, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'field null expect \'[\', but {, pos 1, line 1, column 2{\"themeName\":\"zgcms\",\"themeAuthor\":\"止戈\",\"themeVersion\":\"v.1.0\",\"themeTouch\":\"mail:634866553@qq.com,phone:17678999448\",\"themeInfo\":\"zgcms系统文档主题\"}', '2022-03-23 22:58:17'),
(291, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'field null expect \'[\', but {, pos 1, line 1, column 2{\"themeName\":\"zgcms\",\"themeAuthor\":\"止戈\",\"themeVersion\":\"v.1.0\",\"themeTouch\":\"mail:634866553@qq.com,phone:17678999448\",\"themeInfo\":\"zgcms系统文档主题\"}', '2022-03-23 22:58:43'),
(292, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'field null expect \'[\', but {, pos 1, line 1, column 2{\"themeName\":\"zgcms\",\"themeAuthor\":\"止戈\",\"themeVersion\":\"v.1.0\",\"themeTouch\":\"mail:634866553@qq.com,phone:17678999448\",\"themeInfo\":\"zgcms系统文档主题\"}', '2022-03-23 23:02:35'),
(293, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:08:21'),
(294, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":1}', 0, NULL, '2022-03-23 23:09:13'),
(295, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:10:56'),
(296, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:14:20'),
(297, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:15:42'),
(298, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:19:25'),
(299, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:19:31'),
(300, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:19:37'),
(301, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:21:16'),
(302, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:25:02'),
(303, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-23 23:27:51'),
(304, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:29:19'),
(305, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:30:33'),
(306, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, 'NoSuchFileException: C:\\Users\\Administrator\\.ruoyi\\themes\\zgcms.zip', '2022-03-23 23:30:37'),
(307, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:33:39'),
(308, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, '主题未上传,因为文件已经存在,你选择的是不覆盖上传！', '2022-03-24 22:34:14'),
(309, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:36:34'),
(310, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:42:30'),
(311, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:48:09'),
(312, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":1}', 0, NULL, '2022-03-24 22:51:04'),
(313, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:55:07'),
(314, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', NULL, 1, '主题未上传,因为文件已经存在,你选择的是不覆盖上传！', '2022-03-24 22:57:49'),
(315, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 22:57:59'),
(316, '内容-添加标签', 1, 'com.oly.cms.admin.controller.page.CmsTagController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/tag/add', '127.0.0.1', '内网IP', '{\"tagName\":[\"踩踩踩\"],\"tagUrl\":[\"\"],\"orderNum\":[\"3\"],\"keywords\":[\"cccc\"],\"description\":[\"\"],\"tagType\":[\"0\"],\"visible\":[\"1\"],\"perms\":[\"\"],\"remark\":[\"\"],\"tagIco\":[\"\"]}', NULL, 1, '', '2022-03-24 23:02:00'),
(317, '内容-标签修改', 2, 'com.oly.cms.admin.controller.page.CmsTagController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/tag/edit', '127.0.0.1', '内网IP', '{\"tagId\":[\"1\"],\"tagName\":[\"踩踩踩2\"],\"tagUrl\":[\"\"],\"orderNum\":[\"3\"],\"keywords\":[\"cccc\"],\"description\":[\"\"],\"tagType\":[\"0\"],\"visible\":[\"1\"],\"perms\":[\"\"],\"remark\":[\"\"],\"tagIco\":[\"\"]}', NULL, 1, '', '2022-03-24 23:04:06'),
(318, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 23:07:49'),
(319, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 23:14:46'),
(320, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-24 23:21:12'),
(321, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'theme_upadte\' in \'field list\'\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsThemeMapper.xml]\r\n### The error may involve com.oly.cms.admin.mapper.CmsThemeMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cms_theme (theme_name, theme_author,        create_time, theme_info, theme_enabled,        theme_touch, create_by,theme_upadte,theme_version)     values ( ?, ?,        sysdate(), ?, ?,        ?, ?,?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'theme_upadte\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'theme_upadte\' in \'field list\'', '2022-03-24 23:43:08'),
(322, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-24 23:53:22'),
(323, '主题管理-主题删除', 3, 'com.oly.cms.admin.controller.page.CmsThemeController.deleteTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/deleteTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"删除成功\",\"code\":0}', 0, NULL, '2022-03-24 23:53:34'),
(324, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', NULL, 1, '', '2022-03-24 23:53:38'),
(325, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'IOException: 拒绝访问。', '2022-03-25 00:01:22'),
(326, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 08:15:17'),
(327, '主题管理-同步本地主题', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.syncThemes()', 'POST', 1, 'admin', '研发部门', '/cms/theme/syncThemes', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0,\"data\":1}', 0, NULL, '2022-03-25 08:15:25'),
(328, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/setTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', NULL, 1, '', '2022-03-25 08:15:32'),
(329, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configGroup\":[\"webConfig\"],\"configName\":[\"使用主题\"],\"configKey\":[\"oly.web.theme.used\"],\"configValueType\":[\"3\"],\"configValue\":[\"def\\t\\t\\t\\t\"],\"configType\":[\"1\"],\"remark\":[\"使用主题\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 13:12:25'),
(330, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', NULL, 1, '', '2022-03-25 13:12:40'),
(331, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', NULL, 1, '', '2022-03-25 13:13:20'),
(332, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', NULL, 1, '', '2022-03-25 13:20:13'),
(333, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', NULL, 1, '', '2022-03-25 13:24:30'),
(334, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"主题切换成功!\",\"code\":0}', 0, NULL, '2022-03-25 13:28:22'),
(335, '主题管理-备份主题', 5, 'com.oly.cms.admin.controller.page.CmsThemeController.packageTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/packageTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 18:25:38'),
(336, '主题管理-保存主题内容', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.themeContentSave()', 'POST', 1, 'admin', '研发部门', '/cms/theme/themeContentSave', '127.0.0.1', '内网IP', '{\"path\":[\"/zgcms/pages/web/index.html\"],\"content\":[\"<!DOCTYPE html>\\n<html xmlns:th=\\\"http://www.thymeleaf.org\\\" lang=\\\"zh-CN\\\" th:with=\\\"zgConfig=${@configTag.getConfigMap(\'zgcms\')}\\\">\\n\\t<head>\\n\\t\\t<meta charset=\\\"utf-8\\\">\\n\\t\\t<meta name=\\\"viewport\\\" content=\\\"width=device-width, initial-scale=1, shrink-to-fit=no\\\">\\n\\t\\t<meta name=\\\"description\\\"\\n\\t\\t\\tcontent=\\\"下载 Bootstrap 以获得编译后的 CSS 和 JavaScript 文件、源码，或者通过你所喜欢的软件包管理器，例如 npm、RubyGems 等，将 Bootstrap 添加到你的项目中。\\\">\\n\\t\\t<meta name=\\\"author\\\" content=\\\"Mark Otto、Jacob Thornton 以及众多 Bootstrap 贡献者\\\">\\n\\t\\t<meta name=\\\"generator\\\" content=\\\"Hugo 0.82.0\\\">\\n\\t\\t<meta name=\\\"docsearch:language\\\" content=\\\"en\\\">\\n\\t\\t<meta name=\\\"docsearch:version\\\" content=\\\"4.6\\\">\\n\\t\\t<title>下载 Bootstrap · Bootstrap v4 中文文档 v4.6 | Bootstrap 中文网</title>\\n\\t\\t<link rel=\\\"canonical\\\" href=\\\"https://v4.bootcss.com/docs/getting-started/download/\\\">\\n\\t\\t<!-- Bootstrap core CSS -->\\n\\t\\t<style class=\\\"anchorjs\\\"></style>\\n\\t\\t<link th:href=\\\"@{/themes/zgcms/resources/bootstrap-4.6.0/css/bootstrap.min.css}\\\" rel=\\\"stylesheet\\\">\\n\\t\\t<!-- Loading Flat UI -->\\n\\t\\t<link th:href=\\\"@{/themes/zgcms/resources/Flat-UI/dist/css/flat-ui.css}\\\" rel=\\\"stylesheet\\\">\\n\\t\\t<!-- Documentation extras -->\\n\\t\\t<!-- <link href=\\\"https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.css\\\" rel=\\\"stylesheet\\\"> -->\\n\\t\\t<link th:href=\\\"@{/themes/zgcms/resources/docs/css/docsearch.min.css}\\\" rel=\\\"stylesheet\\\" />\\n\\t\\t<!-- <link href=\\\"/docs/4.6/assets/css/docs.css\\\" rel=\\\"stylesheet\\\"> -->\\n\\t\\t<link th:href=\\\"@{/themes/zgcms/resources/docs/css/docs.css}\\\" rel=\\\"stylesheet\\\" />\\n\\t\\t<link th:href=\\\"@{/themes/zgcms/resources/css/style.css}\\\" rel=\\\"stylesheet\\\" />\\n\\t\\t<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->\\n\\t\\t<!--[if lt IE 9]>\\n      <script src=\\\"dist/js/vendor/html5shiv.js\\\"></script>\\n      <script src=\\\"dist/js/vendor/respond.min.js\\\"></script>\\n    <![endif]-->\\n\\t</head>\\n\\n\\t<body>\\n\\t\\t<d', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 18:44:00'),
(337, '主题管理-保存主题内容', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.themeContentSave()', 'POST', 1, 'admin', '研发部门', '/cms/theme/themeContentSave', '127.0.0.1', '内网IP', '{\"path\":[\"/zgcms/zgcms_include.html\"],\"content\":[\"gggggggggggggggggggggggggggggggggggggggggg\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 18:44:17'),
(338, '主题管理-保存主题内容', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.themeContentSave()', 'POST', 1, 'admin', '研发部门', '/cms/theme/themeContentSave', '127.0.0.1', '内网IP', '{\"path\":[\"/zgcms/zgcms_include.html\"],\"content\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 18:44:31'),
(339, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.style.cat\":[\"0\"],\"oly.web.theme.app.cat\":[\"0\"],\"oly.web.theme.skill.cat\":[\"0\"],\"oly.web.theme.store.cat\":[\"0\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-25 23:37:19'),
(340, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 09:46:01'),
(341, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 09:46:01'),
(342, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 10:37:40'),
(343, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 10:40:10'),
(344, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 10:40:32'),
(345, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"使用的就是当前主题,无需切换!\",\"code\":500}', 0, NULL, '2022-03-26 15:39:12'),
(346, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"使用的就是当前主题,无需切换!\",\"code\":500}', 0, NULL, '2022-03-26 15:39:18'),
(347, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"使用的就是当前主题,无需切换!\",\"code\":500}', 0, NULL, '2022-03-26 15:39:29'),
(348, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms\"]}', '{\"msg\":\"使用的就是当前主题,无需切换!\",\"code\":500}', 0, NULL, '2022-03-26 15:39:31'),
(349, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"116\"],\"configGroup\":[\"webConfig\"],\"configName\":[\"使用主题\"],\"configKey\":[\"oly.web.theme.used\"],\"configValueType\":[\"3\"],\"configValue\":[\"zgcms\"],\"configType\":[\"1\"],\"remark\":[\"使用主题\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 15:42:41'),
(350, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"false\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:38');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(351, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:51'),
(352, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:53'),
(353, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:10:02'),
(354, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"116\"],\"configGroup\":[\"themeConfig\"],\"configName\":[\"使用主题\"],\"configKey\":[\"oly.theme.used\"],\"configValueType\":[\"3\"],\"configValue\":[\"zgcms\"],\"configType\":[\"1\"],\"remark\":[\"使用主题\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-27 09:01:11'),
(355, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"parent\":[\"1\"],\"catName\":[\"测试类目\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"测试目录\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"catIcon\":[\"fa fa-adjust\"],\"visible\":[\"1\"]}', NULL, 1, '', '2022-03-27 16:58:21'),
(356, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catName\":[\"测试类目\"],\"parent\":[\"1\"],\"catId\":[\"1\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"remark\":[\"测试目录\"],\"catIcon\":[\"fa fa-adjust\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-27 18:16:46'),
(357, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"113\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"系统缓存\"],\"url\":[\"/monitor/cache\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:cache:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-cube\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 00:20:50'),
(358, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"内容缓存\"],\"url\":[\"/cms/cache\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cache:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-cubes\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 00:23:13'),
(359, '内容-标签修改', 2, 'com.oly.cms.admin.controller.page.CmsTagController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/tag/edit', '127.0.0.1', '内网IP', '{\"tagId\":[\"1\"],\"tagName\":[\"踩踩踩2\"],\"tagUrl\":[\"\"],\"orderNum\":[\"3\"],\"keywords\":[\"cccc\"],\"description\":[\"\"],\"tagType\":[\"1\"],\"visible\":[\"1\"],\"perms\":[\"\"],\"remark\":[\"\"],\"tagIco\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 11:53:01'),
(360, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.cms.articleCat.maxNum\":[\"2\"],\"oly.cms.articleTag.maxNum\":[\"2\"],\"oly.cms.articleKeyword.maxNum\":[\"10\"],\"oly.cms.articleImg.maxNum\":[\"2\"],\"oly.cms.articleUrl.fixedPrefix\":[\"\"],\"oly.cms.articleVisible.default\":[\"2\"],\"configGroup\":[\"cmsConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 11:53:28'),
(361, '内容文章管理', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.add()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleTitle\":[\"test\"],\"articleUrl\":[\"1648444486926\"],\"keywords\":[\"test\"],\"editor-markdown-doc\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\"],\"editor-html-code\":[\"<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\\r\\n\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"1\"],\"articleType\":[\"3\"],\"description\":[\"\"],\"allowComment\":[\"1\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\",\"\",\"\",\"\",\"\"],\"articleMd\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\"],\"articleContent\":[\"<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 13:17:56'),
(362, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/article/editVisible', '127.0.0.1', '内网IP', '{\"visible\":[\"3\"],\"articleIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 13:24:25'),
(363, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"columnName\":[\"文档\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/posts\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"2\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:49:35'),
(364, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"0\"],\"columnName\":[\"下载地址\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"https://gitee.com/\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"3\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:50:52'),
(365, '内容栏目管理', 2, 'com.oly.cms.admin.controller.page.CmsColumnController.editView()', 'POST', 1, 'admin', '研发部门', '/cms/column/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"0\"],\"columnName\":[\"下载地址\"],\"columnLocate\":[\"0\"],\"columnId\":[\"4\"],\"columnUrl\":[\"\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"3\"],\"keywords\":[\"\"],\"description\":[\"\"],\"remark\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:51:16'),
(366, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"parent\":[\"1\"],\"columnName\":[\"gitee\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"https://gitee.com/\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:51:49'),
(367, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"parent\":[\"1\"],\"columnName\":[\"github\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"https://github.com/\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"2\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:52:39'),
(368, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"columnName\":[\"关于本站\"],\"columnLocate\":[\"0\"],\"columnUrl\":[\"/about\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"4\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 16:54:27'),
(369, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catName\":[\"止戈标签\"],\"parent\":[\"0\"],\"catId\":[\"1\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"remark\":[\"止戈标签\"],\"catIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:05:58'),
(370, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"catName\":[\"特色\"],\"catUrl\":[\"\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"特色分类\"],\"keywords\":[\"特色分类\"],\"description\":[\"特色分类\"],\"catIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:05:58'),
(371, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catName\":[\"止戈标签\"],\"parent\":[\"0\"],\"catId\":[\"1\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"remark\":[\"止戈标签\"],\"catIcon\":[\"fa fa-adjust\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:05:58'),
(372, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"catName\":[\"应用\"],\"parent\":[\"1\"],\"catId\":[\"3\"],\"catUrl\":[\"\"],\"catType\":[\"1\"],\"orderNum\":[\"2\"],\"keywords\":[\"\"],\"description\":[\"\"],\"remark\":[\"\"],\"catIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:05:58'),
(373, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"catName\":[\"应用\"],\"catUrl\":[\"\"],\"catType\":[\"0\"],\"orderNum\":[\"2\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"catIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:05:58'),
(374, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"catName\":[\"技术\"],\"catUrl\":[\"\"],\"catType\":[\"1\"],\"orderNum\":[\"3\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"catIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:07:06'),
(375, '内容文章管理', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.add()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleTitle\":[\"支持Spring\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"9899吹嘘成\"],\"editor-html-code\":[\"<p>9899吹嘘成</p>\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"1\"],\"articleType\":[\"3\"],\"description\":[\"\"],\"allowComment\":[\"1\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\",\"\",\"\",\"\",\"\"],\"articleMd\":[\"9899吹嘘成\"],\"articleContent\":[\"<p>9899吹嘘成</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:54:24'),
(376, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/article/editVisible', '127.0.0.1', '内网IP', '{\"visible\":[\"3\"],\"articleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:54:24'),
(377, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.style.cat\":[\"2\"],\"oly.web.theme.app.cat\":[\"3\"],\"oly.web.theme.skill.cat\":[\"4\"],\"oly.web.theme.store.cat\":[\"0\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:54:24'),
(378, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.style.cat\":[\"2\"],\"oly.web.theme.app.cat\":[\"3\"],\"oly.web.theme.skill.cat\":[\"4\"],\"oly.web.theme.store.cat\":[\"0\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-28 20:54:24'),
(379, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"true\"],\"oly.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-29 14:49:04'),
(380, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"true\"],\"oly.theme.setting\":[\"true\"],\"configGroup\":[\"themeConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-29 14:51:48'),
(381, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"117\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.zgcms.cat.style\"],\"configKey\":[\"oly.web.theme.zgcms.cat.style\"],\"configValueType\":[\"3\"],\"configValue\":[\"2\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:34:07'),
(382, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"117\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.cat.style\"],\"configKey\":[\"oly.web.theme.cat.style\"],\"configValueType\":[\"3\"],\"configValue\":[\"2\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:34:07'),
(383, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"118\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.zgcms.cat.app\"],\"configKey\":[\"oly.web.theme.zgcms.cat.app\"],\"configValueType\":[\"3\"],\"configValue\":[\"3\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:34:07'),
(384, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"119\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.zgcms.cat.skill\"],\"configKey\":[\"oly.web.theme.zgcms.cat.skill\"],\"configValueType\":[\"3\"],\"configValue\":[\"4\"],\"remark\":[\"\"],\"configType\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:34:12'),
(385, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"120\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.zgcms.cat.store\"],\"configKey\":[\"oly.web.theme.zgcms.cat.store\"],\"configValueType\":[\"3\"],\"configValue\":[\"0\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:34:33'),
(386, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgcms.menu.main\":[\"1\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 13:42:09'),
(387, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"   Copyright&nbsp;© <span >2022</span><a href=\\\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=46010802000679\\\" target=\\\"_blank\\\">琼公网安备46010802000679号</a>&nbsp;\\r\\n\\t\\t\\t\\t\\t            \"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 16:38:04'),
(388, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"   Copyright&nbsp;© <span >2022</span>&nbsp;&nbsp;<a href=\\\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=46010802000679\\\" target=\\\"_blank\\\">琼公网安备46010802000679号</a>&nbsp;\\r\\n\\t\\t\\t\\t\\t            \"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 16:38:04'),
(389, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"   Copyright&nbsp;© <span >2022</span>&nbsp;&nbsp;<a href=\\\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=46010802000679\\\" target=\\\"_blank\\\">琼公网安备46010802000679号</a>&nbsp;</span >\\r\\n\\t\\t\\t\\t\\t            \"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 16:40:47'),
(390, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈文档\"],\"oly.web.index\":[\"/zgcms\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"   Copyright&nbsp;© <span >2022</span>&nbsp;&nbsp;<a href=\\\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=46010802000679\\\" target=\\\"_blank\\\">琼公网安备46010802000679号</a>&nbsp;\\r\\n\\t\\t\\t\\t\\t            \"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-30 16:41:27'),
(391, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"false\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-31 15:38:13'),
(392, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"\"],\"oly.web.comment.staus\":[\"\"],\"oly.web.countCode\":[\"\"],\"oly.web.post.copyright\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-31 23:47:23'),
(393, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"\"],\"oly.web.comment.staus\":[\"\"],\"oly.web.countCode\":[\"\"],\"oly.web.post.copyright\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-31 23:48:24'),
(394, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"\"],\"oly.web.comment.staus\":[\"\"],\"oly.web.countCode\":[\"\"],\"oly.web.post.copyright\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-31 23:48:27'),
(395, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.comment.enable\":[\"true\"],\"oly.web.comment.staus\":[\"\"],\"oly.web.countCode\":[\"\"],\"oly.web.post.copyright\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-31 23:49:25'),
(396, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"parent\":[\"0\"],\"columnName\":[\"止戈博客\"],\"columnLocate\":[\"0\"],\"columnUrl\":[\"\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"2\"],\"remark\":[\"止戈博客\"],\"keywords\":[\"止戈博客\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-01 22:20:04'),
(397, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"主页\"],\"columnLocate\":[\"0\"],\"columnUrl\":[\"/index\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"主页\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-01 22:21:10'),
(398, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/zgblog\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-01 23:07:04'),
(399, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/zgblog/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-01 23:08:51'),
(400, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"分类\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/category\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"2\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 18:11:58'),
(401, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"标签\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/tag\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"3\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 18:12:51'),
(402, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/zgcms/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgcms\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 18:23:20'),
(403, '主题管理-主题设置', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.setTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/enableTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgblog\"]}', '{\"msg\":\"主题切换成功!\",\"code\":0}', 0, NULL, '2022-04-02 21:28:19'),
(404, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 21:36:58'),
(405, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"634866553@qq.com\"],\"oly.mail.host\":[\"634866553@qq.com\"],\"oly.mail.protocol\":[\"634866553@qq.com\"],\"oly.mail.ssl.port\":[\"634866553@qq.com\"],\"oly.mail.username\":[\"634866553@qq.com\"],\"oly.mail.password\":[\"634866553@qq.com\"],\"oly.mail.enabled\":[\"false\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 22:06:51'),
(406, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"hush\"],\"oly.mail.host\":[\"smtp.163.com\"],\"oly.mail.protocol\":[\"smtp\"],\"oly.mail.ssl.port\":[\"465\"],\"oly.mail.username\":[\"m17678999448@163.com\"],\"oly.mail.password\":[\"m634866553\"],\"oly.mail.enabled\":[\"true\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 22:23:34'),
(407, '邮件', 1, 'com.ruoyi.mail.controller.OlyMailController.send()', 'POST', 1, 'admin', '研发部门', '/oly/mail/send', '127.0.0.1', '内网IP', '{\"toMail\":[\"634866553@qq.com\"],\"subject\":[\"这是一封测试邮件\"],\"mailType\":[\"0\"],\"copyTo\":[\"\"],\"bccTo\":[\"\"],\"attachKeys\":[\"\"],\"sendTime\":[\"\"],\"content\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 22:53:12'),
(408, '邮件', 1, 'com.ruoyi.mail.controller.OlyMailController.send()', 'POST', 1, 'admin', '研发部门', '/oly/mail/send', '127.0.0.1', '内网IP', '{\"toMail\":[\"634866553@qq.com\"],\"subject\":[\"这是附件邮件\"],\"mailType\":[\"0\"],\"copyTo\":[\"\"],\"bccTo\":[\"\"],\"attachKeys\":[\"logo_hw.png\"],\"sendTime\":[\"\"],\"content\":[\"\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-02 23:26:31'),
(409, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/png\",\"fileName\":\"logo_hw.png\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\04\\\\03\\\\logo_hw_20220403000249A001.png\",\"ossType\":0,\"params\":{},\"size\":27609},\"msg\":\"上传成功\"}', 0, NULL, '2022-04-03 00:02:50'),
(410, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.cat.style\":[\"10\"],\"oly.web.theme.zgblog.cat.app\":[\"10\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-04 23:57:19'),
(411, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.menu.main\":[\"8\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-04 23:57:26'),
(412, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.cat.style\":[\"10\"],\"oly.web.theme.zgblog.cat.app\":[\"10\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:11:39'),
(413, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.post.now\":[\"10\"],\"oly.web.theme.zgblog.post.reard\":[\"10\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:13:02'),
(414, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:14:52'),
(415, '内容标签管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/cat/editCatVisible', '127.0.0.1', '内网IP', '{\"catId\":[\"2\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:35:39'),
(416, '内容标签管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/cat/editCatVisible', '127.0.0.1', '内网IP', '{\"catId\":[\"1\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:35:45'),
(417, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.post.now\":[\"10\"],\"oly.web.theme.zgblog.post.top\":[\"10\"],\"oly.web.theme.zgblog.post.look\":[\"10\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-05 00:51:02'),
(418, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/1075', '127.0.0.1', '内网IP', '1075', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-13 14:52:55'),
(419, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"113\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"缓存监控\"],\"url\":[\"/monitor/cache\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:cache:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-cube\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-13 14:53:35'),
(420, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"时间线\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/timeLine\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"4\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:16:24'),
(421, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"关于本站\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/about\"],\"perms\":[\"\"],\"openType\":[\"0\"],\"orderNum\":[\"5\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:17:50'),
(422, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"排行\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/rank\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"2\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:20:00'),
(423, '内容栏目管理', 2, 'com.oly.cms.admin.controller.page.CmsColumnController.editView()', 'POST', 1, 'admin', '研发部门', '/cms/column/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"排行\"],\"columnLocate\":[\"1\"],\"columnId\":[\"14\"],\"columnUrl\":[\"/rank\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"\"],\"description\":[\"\"],\"remark\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:20:37'),
(424, '内容栏目管理', 2, 'com.oly.cms.admin.controller.page.CmsColumnController.editView()', 'POST', 1, 'admin', '研发部门', '/cms/column/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"时间线\"],\"columnLocate\":[\"1\"],\"columnId\":[\"12\"],\"columnUrl\":[\"/timeLine\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"\"],\"description\":[\"\"],\"remark\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:21:07'),
(425, '内容栏目管理', 1, 'com.oly.cms.admin.controller.page.CmsColumnController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/column/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"8\"],\"parent\":[\"1\"],\"columnName\":[\"站点导航\"],\"columnLocate\":[\"1\"],\"columnUrl\":[\"/links\"],\"perms\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"3\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"],\"columnIcon\":[\"\"],\"visible\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-14 22:23:17'),
(426, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 13:38:03'),
(427, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"链接管理\"],\"url\":[\"/cms/links\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:view\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 17:59:00'),
(428, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1076\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"链接管理\"],\"url\":[\"/cms/link\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 18:01:07'),
(429, '友情链接', 1, 'com.oly.cms.admin.controller.page.CmsLinkController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/link/add', '127.0.0.1', '内网IP', '{\"linkUrl\":[\"http://127.0.0.1:8090\"],\"linkName\":[\"止戈博客\"],\"linkSuggest\":[\"\"],\"groupKey\":[\"\"],\"groupName\":[\"止戈博客\"],\"orderNum\":[\"\"],\"linkFavicon\":[\"http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png\"],\"visible\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 18:06:05'),
(430, '友情链接', 2, 'com.oly.cms.admin.controller.page.CmsLinkController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/link/edit', '127.0.0.1', '内网IP', '{\"linkId\":[\"1\"],\"linkUrl\":[\"http://127.0.0.1:8090\"],\"linkName\":[\"止戈博客\"],\"groupName\":[\"止戈博客\"],\"groupKey\":[\"testGroup\"],\"orderNum\":[\"0\"],\"linkFavicon\":[\"http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png\"],\"visible\":[\"1\"],\"linkSuggest\":[\"\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 19:32:36'),
(431, '友情链接', 2, 'com.oly.cms.admin.controller.page.CmsLinkController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/link/edit', '127.0.0.1', '内网IP', '{\"linkId\":[\"1\"],\"linkUrl\":[\"http://127.0.0.1:8090\"],\"linkName\":[\"止戈博客\"],\"groupName\":[\"博客推荐\"],\"groupKey\":[\"blogTui\"],\"orderNum\":[\"0\"],\"linkFavicon\":[\"http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png\"],\"visible\":[\"1\"],\"linkSuggest\":[\"\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 21:14:34'),
(432, '友情链接', 1, 'com.oly.cms.admin.controller.page.CmsLinkController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/link/add', '127.0.0.1', '内网IP', '{\"linkUrl\":[\"http://127.0.0.1:8090\"],\"linkName\":[\"止戈博客2\"],\"groupName\":[\"博客推荐\"],\"orderNum\":[\"1\"],\"linkFavicon\":[\"http://127.0.0.1:8090/oly/oss/download/image/2022/03/30/logo_hw_20220330203150A001.png\"],\"visible\":[\"2\"],\"linkSuggest\":[\"\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-15 22:59:33'),
(433, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catId\":[\"1\"],\"catName\":[\"止戈标签\"],\"parent\":[\"0\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"visible\":[\"2\"],\"catIcon\":[\"\"],\"remark\":[\"止戈标签\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-21 23:30:57'),
(434, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catId\":[\"1\"],\"catName\":[\"止戈标签\"],\"parent\":[\"0\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"0\"],\"visible\":[\"2\"],\"catIcon\":[\"\"],\"remark\":[\"止戈标签\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-21 23:31:15'),
(435, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1069\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"联盟管理\"],\"url\":[\"/cms/union\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:24:15'),
(436, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"文章统计\"],\"url\":[\"/cms/articleCount/articleCount\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:33:25'),
(437, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"阅读记录\"],\"url\":[\"/cms/articleCount/lookRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:34:34'),
(438, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"分享记录\"],\"url\":[\"/cms/articleCount/shareRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:35:38'),
(439, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"喜欢记录\"],\"url\":[\"/cms/articleCount/shareRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:36:47'),
(440, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"收藏记录\"],\"url\":[\"/cms/articleCount/collectRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:38:37'),
(441, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"评分记录\"],\"url\":[\"/cms/articleCount/scoreRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:39:59'),
(442, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"踩踩记录\"],\"url\":[\"/cms/articleCount/nastyRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-22 01:41:17'),
(443, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"0\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【skin-blue】', '2022-04-23 00:41:09'),
(444, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValueType\":[\"3\"],\"configValue\":[\"skin-blue\"],\"configType\":[\"0\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 00:41:20'),
(445, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValueType\":[\"3\"],\"configValue\":[\"theme-dark\"],\"configType\":[\"0\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 00:41:33'),
(446, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"8\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-菜单导航显示风格\"],\"configKey\":[\"sys.index.menuStyle\"],\"configValueType\":[\"3\"],\"configValue\":[\"default\"],\"configType\":[\"0\"],\"remark\":[\"菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 00:41:43'),
(447, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"9\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-是否开启页脚\"],\"configKey\":[\"sys.index.footer\"],\"configValueType\":[\"0\"],\"configValue\":[\"true\"],\"configType\":[\"0\"],\"remark\":[\"是否开启底部页脚显示（true显示，false隐藏）\"]}', NULL, 1, '预期类型检测不通过类型【0,参数【true】', '2022-04-23 00:41:51'),
(448, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"9\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-是否开启页脚\"],\"configKey\":[\"sys.index.footer\"],\"configValueType\":[\"3\"],\"configValue\":[\"true\"],\"configType\":[\"0\"],\"remark\":[\"是否开启底部页脚显示（true显示，false隐藏）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 00:41:58'),
(449, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"10\"],\"configGroup\":[\"sysIndex\"],\"configName\":[\"主框架页-是否开启页签\"],\"configKey\":[\"sys.index.tagsView\"],\"configValueType\":[\"3\"],\"configValue\":[\"true\"],\"configType\":[\"0\"],\"remark\":[\"是否开启菜单多页签显示（true显示，false隐藏）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 00:42:07'),
(450, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"系统设置\"],\"url\":[\"/system/config/setting\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 01:03:53'),
(451, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1084\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"系统设置\"],\"url\":[\"/system/config/setting\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 01:04:26'),
(452, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:08:57'),
(453, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:09:51'),
(454, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:09:54'),
(455, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:10:23'),
(456, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:10:55'),
(457, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:13:17'),
(458, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:14:41');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(459, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"1\"],\"sys.common.description\":[\"\"],\"sys.common.logo\":[\"\"],\"sys.common.ico\":[\"\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 01:15:24'),
(460, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:00:11'),
(461, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default1\"],\"sys.index.ignoreFooter\":[\"false\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:00:46'),
(462, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:00'),
(463, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:02'),
(464, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:52'),
(465, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"皮肤样式\"],\"dictType\":[\"sys_index_skin_name\"],\"status\":[\"0\"],\"remark\":[\"管理页皮肤样式\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:39:54'),
(466, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"蓝色 \"],\"dictValue\":[\"skin-blue\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"蓝色 skin-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:42:16'),
(467, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"绿色\"],\"dictValue\":[\"skin-green\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"绿色 skin-green\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:43:08'),
(468, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"紫色\"],\"dictValue\":[\"skin-purple\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"紫色 skin-purple\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:45:10'),
(469, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"192\"],\"dictLabel\":[\"紫色\"],\"dictValue\":[\"skin-purple\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"紫色 skin-purple\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:45:20'),
(470, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"红色\"],\"dictValue\":[\"skin-red\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"红色 skin-red\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:46:04'),
(471, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"黄色\"],\"dictValue\":[\"skin-yellow\"],\"dictType\":[\"sys_index_skin_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:46:54'),
(472, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"侧边样式\"],\"dictType\":[\"sys_index_side_theme\"],\"status\":[\"0\"],\"remark\":[\"侧边样式\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:48:59'),
(473, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"深黑主题\"],\"dictValue\":[\"theme-dark\"],\"dictType\":[\"sys_index_side_theme\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"深黑主题theme-dark\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:50:29'),
(474, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"浅色主题\"],\"dictValue\":[\"theme-light\"],\"dictType\":[\"sys_index_side_theme\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"浅色主题theme-light\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:51:02'),
(475, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"深蓝主题\"],\"dictValue\":[\"theme-blue\"],\"dictType\":[\"sys_index_side_theme\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"深蓝主题\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:52:16'),
(476, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"197\"],\"dictLabel\":[\"深蓝主题\"],\"dictValue\":[\"theme-blue\"],\"dictType\":[\"sys_index_side_theme\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"深蓝主题theme-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:52:31'),
(477, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"130\"],\"dictName\":[\"侧边主题\"],\"dictType\":[\"sys_index_side_theme\"],\"status\":[\"0\"],\"remark\":[\"侧边样式\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:52:47'),
(478, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"导航风格\"],\"dictType\":[\"sys_index_menu_style\"],\"status\":[\"0\"],\"remark\":[\"菜单导航显示风格\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:54:14'),
(479, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"左侧\"],\"dictValue\":[\"default\"],\"dictType\":[\"sys_index_menu_style\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"default为左侧导航菜单\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:55:22'),
(480, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"顶部\"],\"dictValue\":[\"topnav\"],\"dictType\":[\"sys_index_menu_style\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"topnav顶部\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 23:56:27'),
(481, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-green\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"topnav\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-24 00:10:50'),
(482, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '', '2022-04-24 10:01:59'),
(483, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'syntax error, expect {, actual [, pos 0, fastjson-version 1.2.76', '2022-04-24 10:07:46'),
(484, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, 'while constructing a mapping\n in \'reader\', line 1, column 1:\n    themeData:\n    ^\nfound duplicate key themeData\n in \'reader\', line 8, column 1:\n    themeData:\n    ^\n', '2022-04-24 10:11:59'),
(485, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '预期类型检测不通过类型【2,参数【10】', '2022-04-24 10:21:00'),
(486, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-24 10:30:27');

-- --------------------------------------------------------

--
-- 表的结构 `sys_post`
--

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='岗位信息表';

--
-- 转存表中的数据 `sys_post`
--

INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 'ceo', '董事长', 1, '0', 'admin', '2022-01-13 08:17:23', '', NULL, ''),
(2, 'se', '项目经理', 2, '0', 'admin', '2022-01-13 08:17:23', '', NULL, ''),
(3, 'hr', '人力资源', 3, '0', 'admin', '2022-01-13 08:17:23', '', NULL, ''),
(4, 'user', '普通员工', 4, '0', 'admin', '2022-01-13 08:17:23', '', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role`
--

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色信息表';

--
-- 转存表中的数据 `sys_role`
--

INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL, '超级管理员'),
(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL, '普通角色');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_dept`
--

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色和部门关联表';

--
-- 转存表中的数据 `sys_role_dept`
--

INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
(2, 100),
(2, 101),
(2, 105);

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_menu`
--

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色和菜单关联表';

--
-- 转存表中的数据 `sys_role_menu`
--

INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 500),
(2, 501),
(2, 1000),
(2, 1001),
(2, 1002),
(2, 1003),
(2, 1004),
(2, 1005),
(2, 1006),
(2, 1007),
(2, 1008),
(2, 1009),
(2, 1010),
(2, 1011),
(2, 1012),
(2, 1013),
(2, 1014),
(2, 1015),
(2, 1016),
(2, 1017),
(2, 1018),
(2, 1019),
(2, 1020),
(2, 1021),
(2, 1022),
(2, 1023),
(2, 1024),
(2, 1025),
(2, 1026),
(2, 1027),
(2, 1028),
(2, 1029),
(2, 1030),
(2, 1031),
(2, 1032),
(2, 1033),
(2, 1034),
(2, 1035),
(2, 1036),
(2, 1037),
(2, 1038),
(2, 1039),
(2, 1040),
(2, 1041),
(2, 1042),
(2, 1043),
(2, 1044),
(2, 1045),
(2, 1046),
(2, 1047),
(2, 1048),
(2, 1049),
(2, 1050),
(2, 1051),
(2, 1052),
(2, 1053),
(2, 1054),
(2, 1055),
(2, 1056),
(2, 1057),
(2, 1058),
(2, 1059),
(2, 1060),
(2, 1061);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
(1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', 'http://127.0.0.1:8090/oly/oss/download/avatar/2022/03/10/blob_20220310223629A001.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-04-24 10:28:47', '2022-01-13 08:17:23', 'admin', '2022-01-13 08:17:23', '', '2022-04-24 10:28:47', '管理员'),
(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-01-13 08:17:23', '2022-01-13 08:17:23', 'admin', '2022-01-13 08:17:23', '', NULL, '测试员');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_online`
--

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='在线用户记录';

--
-- 转存表中的数据 `sys_user_online`
--

INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
('e9ec849a-ed10-4c61-9848-0a6c7898c7a6', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', 'on_line', '2022-04-24 10:01:02', '2022-04-24 10:28:47', 1800000);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_post`
--

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户与岗位关联表';

--
-- 转存表中的数据 `sys_user_post`
--

INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_role`
--

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户和角色关联表';

--
-- 转存表中的数据 `sys_user_role`
--

INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2);

--
-- 转储表的索引
--

--
-- 表的索引 `cms_article`
--
ALTER TABLE `cms_article`
  ADD PRIMARY KEY (`article_id`);

--
-- 表的索引 `cms_article_cat`
--
ALTER TABLE `cms_article_cat`
  ADD PRIMARY KEY (`article_id`,`cat_id`);

--
-- 表的索引 `cms_article_count`
--
ALTER TABLE `cms_article_count`
  ADD PRIMARY KEY (`article_id`);

--
-- 表的索引 `cms_article_tag`
--
ALTER TABLE `cms_article_tag`
  ADD PRIMARY KEY (`article_id`,`tag_id`);

--
-- 表的索引 `cms_article_taoke`
--
ALTER TABLE `cms_article_taoke`
  ADD PRIMARY KEY (`article_id`,`shop_id`);

--
-- 表的索引 `cms_cat`
--
ALTER TABLE `cms_cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- 表的索引 `cms_collect_record`
--
ALTER TABLE `cms_collect_record`
  ADD PRIMARY KEY (`collect_id`);

--
-- 表的索引 `cms_column`
--
ALTER TABLE `cms_column`
  ADD PRIMARY KEY (`column_id`);

--
-- 表的索引 `cms_comment`
--
ALTER TABLE `cms_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- 表的索引 `cms_comment_record`
--
ALTER TABLE `cms_comment_record`
  ADD PRIMARY KEY (`comment_id`,`user_id`);

--
-- 表的索引 `cms_contact`
--
ALTER TABLE `cms_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- 表的索引 `cms_like_record`
--
ALTER TABLE `cms_like_record`
  ADD PRIMARY KEY (`like_id`);

--
-- 表的索引 `cms_link`
--
ALTER TABLE `cms_link`
  ADD PRIMARY KEY (`link_id`) USING BTREE;

--
-- 表的索引 `cms_log_record`
--
ALTER TABLE `cms_log_record`
  ADD PRIMARY KEY (`log_id`);

--
-- 表的索引 `cms_look_record`
--
ALTER TABLE `cms_look_record`
  ADD PRIMARY KEY (`look_id`);

--
-- 表的索引 `cms_nasty_record`
--
ALTER TABLE `cms_nasty_record`
  ADD PRIMARY KEY (`nasty_id`);

--
-- 表的索引 `cms_score_record`
--
ALTER TABLE `cms_score_record`
  ADD PRIMARY KEY (`score_id`);

--
-- 表的索引 `cms_share_record`
--
ALTER TABLE `cms_share_record`
  ADD PRIMARY KEY (`share_id`);

--
-- 表的索引 `cms_tag`
--
ALTER TABLE `cms_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- 表的索引 `cms_taoke`
--
ALTER TABLE `cms_taoke`
  ADD PRIMARY KEY (`shop_id`);

--
-- 表的索引 `cms_theme`
--
ALTER TABLE `cms_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- 表的索引 `cms_third`
--
ALTER TABLE `cms_third`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `platform` (`platform`,`openid`),
  ADD KEY `user_id` (`user_id`,`platform`);

--
-- 表的索引 `cms_user`
--
ALTER TABLE `cms_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `gen_table`
--
ALTER TABLE `gen_table`
  ADD PRIMARY KEY (`table_id`);

--
-- 表的索引 `gen_table_column`
--
ALTER TABLE `gen_table_column`
  ADD PRIMARY KEY (`column_id`);

--
-- 表的索引 `oly_config`
--
ALTER TABLE `oly_config`
  ADD PRIMARY KEY (`config_group`,`config_key`);

--
-- 表的索引 `oly_mail`
--
ALTER TABLE `oly_mail`
  ADD PRIMARY KEY (`mail_id`);

--
-- 表的索引 `oly_oss`
--
ALTER TABLE `oly_oss`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `oly_template`
--
ALTER TABLE `oly_template`
  ADD PRIMARY KEY (`template_id`);

--
-- 表的索引 `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_calendars`
--
ALTER TABLE `qrtz_calendars`
  ADD PRIMARY KEY (`sched_name`,`calendar_name`);

--
-- 表的索引 `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_fired_triggers`
--
ALTER TABLE `qrtz_fired_triggers`
  ADD PRIMARY KEY (`sched_name`,`entry_id`);

--
-- 表的索引 `qrtz_job_details`
--
ALTER TABLE `qrtz_job_details`
  ADD PRIMARY KEY (`sched_name`,`job_name`,`job_group`);

--
-- 表的索引 `qrtz_locks`
--
ALTER TABLE `qrtz_locks`
  ADD PRIMARY KEY (`sched_name`,`lock_name`);

--
-- 表的索引 `qrtz_paused_trigger_grps`
--
ALTER TABLE `qrtz_paused_trigger_grps`
  ADD PRIMARY KEY (`sched_name`,`trigger_group`);

--
-- 表的索引 `qrtz_scheduler_state`
--
ALTER TABLE `qrtz_scheduler_state`
  ADD PRIMARY KEY (`sched_name`,`instance_name`);

--
-- 表的索引 `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`);

--
-- 表的索引 `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  ADD KEY `sched_name` (`sched_name`,`job_name`,`job_group`);

--
-- 表的索引 `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`config_id`);

--
-- 表的索引 `sys_dept`
--
ALTER TABLE `sys_dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- 表的索引 `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  ADD PRIMARY KEY (`dict_code`);

--
-- 表的索引 `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  ADD PRIMARY KEY (`dict_id`),
  ADD UNIQUE KEY `dict_type` (`dict_type`);

--
-- 表的索引 `sys_job`
--
ALTER TABLE `sys_job`
  ADD PRIMARY KEY (`job_id`,`job_name`,`job_group`);

--
-- 表的索引 `sys_job_log`
--
ALTER TABLE `sys_job_log`
  ADD PRIMARY KEY (`job_log_id`);

--
-- 表的索引 `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  ADD PRIMARY KEY (`info_id`);

--
-- 表的索引 `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- 表的索引 `sys_notice`
--
ALTER TABLE `sys_notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- 表的索引 `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  ADD PRIMARY KEY (`oper_id`);

--
-- 表的索引 `sys_post`
--
ALTER TABLE `sys_post`
  ADD PRIMARY KEY (`post_id`);

--
-- 表的索引 `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`role_id`);

--
-- 表的索引 `sys_role_dept`
--
ALTER TABLE `sys_role_dept`
  ADD PRIMARY KEY (`role_id`,`dept_id`);

--
-- 表的索引 `sys_role_menu`
--
ALTER TABLE `sys_role_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`);

--
-- 表的索引 `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 表的索引 `sys_user_online`
--
ALTER TABLE `sys_user_online`
  ADD PRIMARY KEY (`sessionId`);

--
-- 表的索引 `sys_user_post`
--
ALTER TABLE `sys_user_post`
  ADD PRIMARY KEY (`user_id`,`post_id`);

--
-- 表的索引 `sys_user_role`
--
ALTER TABLE `sys_user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cms_article`
--
ALTER TABLE `cms_article`
  MODIFY `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cms_cat`
--
ALTER TABLE `cms_cat`
  MODIFY `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `cms_collect_record`
--
ALTER TABLE `cms_collect_record`
  MODIFY `collect_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `cms_column`
--
ALTER TABLE `cms_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '栏目导航id', AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `cms_comment`
--
ALTER TABLE `cms_comment`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id';

--
-- 使用表AUTO_INCREMENT `cms_contact`
--
ALTER TABLE `cms_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id';

--
-- 使用表AUTO_INCREMENT `cms_like_record`
--
ALTER TABLE `cms_like_record`
  MODIFY `like_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `cms_link`
--
ALTER TABLE `cms_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cms_log_record`
--
ALTER TABLE `cms_log_record`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID', AUTO_INCREMENT=602;

--
-- 使用表AUTO_INCREMENT `cms_look_record`
--
ALTER TABLE `cms_look_record`
  MODIFY `look_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `cms_nasty_record`
--
ALTER TABLE `cms_nasty_record`
  MODIFY `nasty_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `cms_score_record`
--
ALTER TABLE `cms_score_record`
  MODIFY `score_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `cms_share_record`
--
ALTER TABLE `cms_share_record`
  MODIFY `share_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `cms_tag`
--
ALTER TABLE `cms_tag`
  MODIFY `tag_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标签id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cms_theme`
--
ALTER TABLE `cms_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cms_third`
--
ALTER TABLE `cms_third`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `gen_table`
--
ALTER TABLE `gen_table`
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `oly_mail`
--
ALTER TABLE `oly_mail`
  MODIFY `mail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `oly_oss`
--
ALTER TABLE `oly_oss`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `oly_template`
--
ALTER TABLE `oly_template`
  MODIFY `template_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板Id';

--
-- 使用表AUTO_INCREMENT `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键', AUTO_INCREMENT=169;

--
-- 使用表AUTO_INCREMENT `sys_dept`
--
ALTER TABLE `sys_dept`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id', AUTO_INCREMENT=110;

--
-- 使用表AUTO_INCREMENT `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  MODIFY `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码', AUTO_INCREMENT=200;

--
-- 使用表AUTO_INCREMENT `sys_dict_type`
--
ALTER TABLE `sys_dict_type`
  MODIFY `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键', AUTO_INCREMENT=132;

--
-- 使用表AUTO_INCREMENT `sys_job`
--
ALTER TABLE `sys_job`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `sys_job_log`
--
ALTER TABLE `sys_job_log`
  MODIFY `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID';

--
-- 使用表AUTO_INCREMENT `sys_logininfor`
--
ALTER TABLE `sys_logininfor`
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID', AUTO_INCREMENT=374;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=1085;

--
-- 使用表AUTO_INCREMENT `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键', AUTO_INCREMENT=487;

--
-- 使用表AUTO_INCREMENT `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=3;

--
-- 限制导出的表
--

--
-- 限制表 `qrtz_blob_triggers`
--
ALTER TABLE `qrtz_blob_triggers`
  ADD CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_cron_triggers`
--
ALTER TABLE `qrtz_cron_triggers`
  ADD CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_simple_triggers`
--
ALTER TABLE `qrtz_simple_triggers`
  ADD CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_simprop_triggers`
--
ALTER TABLE `qrtz_simprop_triggers`
  ADD CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`trigger_name`,`trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`);

--
-- 限制表 `qrtz_triggers`
--
ALTER TABLE `qrtz_triggers`
  ADD CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`,`job_name`,`job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
