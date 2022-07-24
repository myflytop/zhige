-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-06-03 16:09:38
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
-- 数据库： `olytest`
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
  `article_type` tinyint(2) DEFAULT NULL COMMENT '文章类型',
  `article_content` text COMMENT '文章内容',
  `article_build` tinyint(2) DEFAULT NULL COMMENT '编辑器',
  `article_top` tinyint(2) DEFAULT NULL COMMENT '顶置级别',
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
(1, 'test', 1, '2022-03-28 13:17:56', 1, '2022-05-19 23:20:51', 3, '<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\n', 1, 0, '', 'dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\n', 3, 1, '', '1648444486926', 'test', '', '\n\n											', 'dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc'),
(2, '支持Spring9899吹嘘成9899吹嘘成', 1, '2022-03-28 20:50:24', 1, '2022-05-20 17:04:24', 3, '<ul>\n<li>1</li><li>2</li><li>3</li></ul>\n<ul>\n<li><img src=\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\" alt=\"\"><br>-</ul>\n<hr>\n<p>9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成</p>\n', 1, 0, 'http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg', '9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\n', 3, 1, '', '1648471744193', '特色', '', '\n\n											', '\n- 1\n- 2\n- 3\n\n\n- ![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)\n-\n\n------------\n\n9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成'),
(3, '测试文章', 1, '2022-05-20 16:40:04', NULL, NULL, 3, '<p>发布功能和规格和价格考虑过<img src=\"http://127.0.0.1:8090/oss/download/image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg\" style=\"width: 705px;\" class=\"fr-fic fr-dii\" msg=\"上传成功\" uploaded=\"true\"></p>', 0, 0, 'http://127.0.0.1:8090/oss/download/image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg', '发布功能和规格和价格考虑过', 3, 1, '', '1653035901471', 'cvv', '', NULL, NULL),
(4, 'test2', 1, '2022-05-27 02:10:59', 1, '2022-05-27 02:32:29', 1, '<p>dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf</p>\n', 1, 0, '', 'dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\n', 3, 1, '', '1653588598694', 'tesddsv', '', '\n\n											', 'dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf'),
(5, 'test22', 1, '2022-05-27 02:16:23', 1, '2022-05-27 02:35:07', 1, '<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb</p>\n', 1, 0, '', 'dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf', 3, 1, '', '1653588954255', 'fdvfdgfd', '', '\n\n											', 'vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb');

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
(2, 2),
(3, 2),
(4, 2),
(5, 1);

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
(1, 52, 0, 0, 0, 0.00, 0, 0),
(2, 34, 1, 0, 0, 0.00, 0, 0),
(3, 2, 0, 0, 0, 0.00, 0, 0),
(4, 2, 0, 0, 0, 0.00, 0, 0),
(5, 1, 0, 0, 0, 0.00, 0, 0);

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
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cms_article_theme`
--

CREATE TABLE `cms_article_theme` (
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `theme_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主题名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章关联主题';

--
-- 转存表中的数据 `cms_article_theme`
--

INSERT INTO `cms_article_theme` (`article_id`, `theme_name`) VALUES
(4, 'zgcms'),
(5, 'zgblog'),
(5, 'zgcms');

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
(1, '止戈标签', '', 2, 0, '2022-03-27 16:58:21', '2022-05-15 22:14:34', '止戈标签', NULL, 1, '/cat/test', b'0', '0', NULL, '内容', '内容', 0, 2, 1),
(2, '特色', '', 2, 1, '2022-03-28 20:04:30', NULL, '特色分类', NULL, 1, '', b'1', '0,1', NULL, '特色分类', '特色分类', 1, 3, 1),
(3, '应用', '', 2, 1, '2022-03-28 20:05:24', '2022-03-28 20:05:41', '', NULL, 1, '', b'1', '0,1', NULL, '', '', 2, NULL, 1),
(4, '技术', '', 2, 1, '2022-03-28 20:07:06', NULL, '', NULL, 1, '', b'1', '0,1', NULL, '', '', 3, NULL, 1),
(5, '止戈', '', 2, 1, '2022-05-15 22:14:47', NULL, '', NULL, 1, '', b'1', '0,1', NULL, '', '', 2, NULL, 0);

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
(1, '止戈文档', '', 1, 0, b'0', '2022-03-01 04:02:03', '2022-05-15 22:17:40', '', 1, '', '', 1, 1, '0', '', '', 1, 0),
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

--
-- 转存表中的数据 `cms_comment`
--

INSERT INTO `cms_comment` (`comment_id`, `article_id`, `parent_id`, `create_time`, `from_by`, `reply_by`, `content`, `comment_type`, `visible`, `ip`, `user_system`, `user_bower`, `nasty_count`, `like_count`, `remark`) VALUES
(1, 1, 0, '2022-05-02 09:40:14', '1', NULL, 'are ok?', NULL, 2, '127.0.0.1', 'Windows 10', 'Chrome 10', NULL, NULL, NULL),
(2, 1, 0, '2022-05-02 09:40:47', '1', NULL, 'dbdbb', NULL, 2, '127.0.0.1', 'Mac OS X (iPhone)', 'Mobile Safari', NULL, NULL, NULL);

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
  `subject` varchar(32) DEFAULT NULL COMMENT '主题',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `handler` bigint(20) DEFAULT NULL COMMENT '处理人',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `touch` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `visible` tinyint(1) DEFAULT '0' COMMENT '状态0 未查看',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `contact_type` tinyint(1) DEFAULT NULL COMMENT '类型',
  `handle_result` varchar(1024) DEFAULT NULL COMMENT '结果',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `create_by` bigint(20) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `user_call` varchar(16) DEFAULT NULL COMMENT '称呼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='反馈|建议';

--
-- 转存表中的数据 `cms_contact`
--

INSERT INTO `cms_contact` (`contact_id`, `subject`, `content`, `handler`, `email`, `touch`, `visible`, `create_time`, `contact_type`, `handle_result`, `handle_time`, `create_by`, `remark`, `user_call`) VALUES
(1, '我在测试反馈', '我在测试反馈', 1, '634866553@qq.com', NULL, 1, '2022-05-17 08:57:49', 1, '已处理', '2022-05-17 16:24:46', 1, NULL, NULL),
(2, '发帖呼吁尽快有同样然', '<p><br></p>', 1, '634866553@qq.com', NULL, 1, '2022-05-17 23:46:12', 0, '<p><img src=\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518193613A002.jpg\" style=\"width: 634.656px;\" data-filename=\"thumb-1920-337990.jpg\"><br></p>', '2022-05-18 19:36:19', 1, NULL, NULL),
(3, '发帖呼吁尽快有同样然', '<p>发帖呼吁尽快<font style=\"background-color: rgb(255, 255, 0);\" color=\"#73a5ad\">有同样然</font><br></p>', NULL, '634866553@qq.com', NULL, 0, '2022-05-17 23:48:14', 0, NULL, '2022-05-18 19:33:02', 1, NULL, NULL),
(4, '测试表单吃饭DVD部分的', '<p>测试表单吃饭DVD部分的<img src=\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\" style=\"width: 641.323px;\" data-filename=\"thumb-1920-337990.jpg\"><br></p>', 1, '634866553@qq.com', '17678999448', 1, '2022-05-18 19:18:39', 0, NULL, '2022-05-18 19:22:14', 1, NULL, NULL),
(5, '测试表单吃饭DVD部分的相当长', '<p>&nbsp;现场v现场v</p>', 1, NULL, NULL, 1, '2022-05-18 19:31:21', 0, NULL, '2022-05-18 19:31:36', 1, NULL, NULL);

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

--
-- 转存表中的数据 `cms_like_record`
--

INSERT INTO `cms_like_record` (`like_id`, `article_id`, `user_id`, `create_time`, `update_time`, `ip`, `visible`, `user_system`, `user_bower`) VALUES
(1, 2, 1, '2022-05-20 08:05:22', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10');

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
(601, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-24 10:30:35', 'Chrome 10', 'Windows 10'),
(602, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-25 00:57:58', 'Chrome 10', 'Windows 10'),
(603, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-04-25 00:58:11', 'Chrome 10', 'Windows 10'),
(604, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-25 23:43:08', 'Chrome 10', 'Windows 10'),
(605, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-26 04:03:08', 'Chrome 10', 'Windows 10'),
(606, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-04-28 23:16:55', 'Chrome 10', 'Windows 10'),
(607, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-01 15:11:21', 'Chrome 10', 'Windows 10'),
(608, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-01 15:13:30', 'Chrome 10', 'Windows 10'),
(609, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-01 15:13:57', 'Chrome 10', 'Windows 10'),
(610, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-01 15:14:02', 'Chrome 10', 'Windows 10'),
(611, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-01 15:14:27', 'Chrome 10', 'Windows 10'),
(612, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-01 15:14:37', 'Chrome 10', 'Windows 10'),
(613, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:42:02', 'Chrome 10', 'Windows 10'),
(614, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:42:06', 'Chrome 10', 'Windows 10'),
(615, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 00:42:40', 'Chrome 10', 'Windows 10'),
(616, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:42:44', 'Chrome 10', 'Windows 10'),
(617, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:42:55', 'Chrome 10', 'Windows 10'),
(618, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:43:54', 'Chrome Mobile', 'Android 6.x'),
(619, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:46:34', 'Chrome Mobile', 'Android 6.x'),
(620, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:46:43', 'Chrome 10', 'Windows 10'),
(621, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:46:43', 'Chrome 10', 'Windows 10'),
(622, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:47:03', 'Chrome 10', 'Windows 10'),
(623, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:09', 'Chrome 10', 'Windows 10'),
(624, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:25', 'Chrome Mobile', 'Android 6.x'),
(625, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:25', 'Chrome Mobile', 'Android 6.x'),
(626, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:25', 'Chrome Mobile', 'Android 6.x'),
(627, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:25', 'Chrome Mobile', 'Android 6.x'),
(628, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:25', 'Chrome Mobile', 'Android 6.x'),
(629, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:26', 'Chrome Mobile', 'Android 6.x'),
(630, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:27', 'Chrome Mobile', 'Android 6.x'),
(631, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:27', 'Chrome Mobile', 'Android 6.x'),
(632, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:27', 'Chrome Mobile', 'Android 6.x'),
(633, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:29', 'Chrome Mobile', 'Android 6.x'),
(634, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(635, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(636, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(637, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(638, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(639, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(640, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(641, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(642, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(643, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:30', 'Chrome Mobile', 'Android 6.x'),
(644, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(645, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(646, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(647, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(648, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(649, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(650, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(651, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(652, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(653, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:31', 'Chrome Mobile', 'Android 6.x'),
(654, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:32', 'Chrome Mobile', 'Android 6.x'),
(655, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:32', 'Chrome Mobile', 'Android 6.x'),
(656, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 00:48:32', 'Chrome Mobile', 'Android 6.x'),
(657, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 09:39:52', 'Chrome 10', 'Windows 10'),
(658, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:39:57', 'Chrome 10', 'Windows 10'),
(659, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:40:14', 'Chrome 10', 'Windows 10'),
(660, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:40:26', 'Chrome 10', 'Windows 10'),
(661, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:40:28', 'Mobile Safari', 'Mac OS X (iPhone)'),
(662, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:40:47', 'Mobile Safari', 'Mac OS X (iPhone)'),
(663, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 09:40:58', 'Chrome 10', 'Windows 10'),
(664, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 09:41:05', 'Chrome 10', 'Windows 10'),
(665, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 09:41:11', 'Chrome 10', 'Windows 10'),
(666, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 11:54:23', 'Chrome 10', 'Windows 10'),
(667, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:54:26', 'Chrome 10', 'Windows 10'),
(668, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:54:39', 'Chrome 10', 'Windows 10'),
(669, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:54:41', 'Mobile Safari', 'Mac OS X (iPhone)'),
(670, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:57:05', 'Chrome 10', 'Windows 10'),
(671, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:57:05', 'Chrome 10', 'Windows 10'),
(672, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 11:58:32', 'Chrome 10', 'Windows 10'),
(673, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:58:35', 'Chrome 10', 'Windows 10'),
(674, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 11:58:41', 'Chrome 10', 'Windows 10'),
(675, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 11:58:44', 'Chrome 10', 'Windows 10'),
(676, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-02 12:29:27', 'Chrome 10', 'Windows 10'),
(677, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 12:29:33', 'Chrome 10', 'Windows 10'),
(678, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 12:30:59', 'Chrome 10', 'Windows 10'),
(679, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-02 14:39:10', 'Chrome 10', 'Windows 10'),
(680, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 05:03:29', 'Chrome 10', 'Windows 10'),
(681, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 05:03:37', 'Chrome 10', 'Windows 10'),
(682, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 05:04:25', 'Chrome 10', 'Windows 10'),
(683, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 06:15:56', 'Chrome 10', 'Windows 10'),
(684, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 07:45:05', 'Chrome 10', 'Windows 10'),
(685, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 07:45:53', 'Chrome 10', 'Windows 10'),
(686, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 10:04:15', 'Chrome 10', 'Windows 10'),
(687, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 10:04:47', 'Chrome 10', 'Windows 10'),
(688, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 10:05:56', 'Chrome 10', 'Windows 10'),
(689, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 10:07:24', 'Chrome 10', 'Windows 10'),
(690, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-03 10:07:28', 'Chrome 10', 'Windows 10'),
(691, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 10:07:36', 'Chrome 10', 'Windows 10'),
(692, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-03 18:58:52', 'Chrome 10', 'Windows 10'),
(693, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgblog/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-04 12:20:46', 'Chrome 10', 'Windows 10'),
(694, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-04 12:20:57', 'Chrome 10', 'Windows 10'),
(695, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:18:14', 'Chrome 10', 'Windows 10'),
(696, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-07 14:18:22', 'Chrome 10', 'Windows 10'),
(697, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-07 14:18:27', 'Chrome 10', 'Windows 10'),
(698, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:18:36', 'Chrome 10', 'Windows 10'),
(699, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-07 14:19:16', 'Chrome 10', 'Windows 10'),
(700, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:19:44', 'Chrome 10', 'Windows 10'),
(701, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:20:14', 'Chrome 10', 'Windows 10'),
(702, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-07 14:20:27', 'Chrome 10', 'Windows 10'),
(703, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:21:01', 'Chrome 10', 'Windows 10'),
(704, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:30:59', 'Chrome 10', 'Windows 10'),
(705, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-07 14:31:11', 'Chrome 10', 'Windows 10'),
(706, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-07 14:35:05', 'Chrome 10', 'Windows 10');
INSERT INTO `cms_log_record` (`log_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `oper_bower`, `oper_system`) VALUES
(707, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-07 14:35:11', 'Chrome 10', 'Windows 10'),
(708, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-07 14:35:17', 'Chrome 10', 'Windows 10'),
(709, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-07 14:35:19', 'Chrome 10', 'Windows 10'),
(710, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-07 14:35:27', 'Chrome 10', 'Windows 10'),
(711, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-05-07 14:35:30', 'Chrome 10', 'Windows 10'),
(712, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:30:39', 'Chrome 10', 'Windows 10'),
(713, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:30:56', 'Chrome 10', 'Windows 10'),
(714, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:32:34', 'Chrome 10', 'Windows 10'),
(715, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:33:50', 'Chrome 10', 'Windows 10'),
(716, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-12 10:35:56', 'Chrome 10', 'Windows 10'),
(717, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:36:26', 'Chrome 10', 'Windows 10'),
(718, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:38:30', 'Chrome Mobile', 'Android 6.x'),
(719, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:39:45', 'Chrome Mobile', 'Android 6.x'),
(720, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:40:09', 'Chrome 10', 'Windows 10'),
(721, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 10:43:20', 'Chrome Mobile', 'Android 6.x'),
(722, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 13:40:09', 'Chrome 10', 'Windows 10'),
(723, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 13:40:09', 'Chrome 10', 'Windows 10'),
(724, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 18:10:55', 'Chrome 10', 'Windows 10'),
(725, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-12 18:11:06', 'Chrome 10', 'Windows 10'),
(726, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-12 18:11:10', 'Chrome 10', 'Windows 10'),
(727, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 18:11:15', 'Chrome 10', 'Windows 10'),
(728, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-12 18:11:18', 'Chrome 10', 'Windows 10'),
(729, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-12 19:41:10', 'Chrome 10', 'Windows 10'),
(730, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-14 16:04:46', 'Chrome 10', 'Windows 10'),
(731, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-14 17:23:14', 'Chrome 10', 'Windows 10'),
(732, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-14 17:23:14', 'Chrome 10', 'Windows 10'),
(733, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-14 20:38:32', 'Chrome 10', 'Windows 10'),
(734, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:15:37', 'Chrome 10', 'Windows 10'),
(735, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:15:44', 'Chrome 10', 'Windows 10'),
(736, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:20:16', 'Chrome 10', 'Windows 10'),
(737, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:20:58', 'Chrome 10', 'Windows 10'),
(738, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:21:14', 'Chrome 10', 'Windows 10'),
(739, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:22:36', 'Chrome 10', 'Windows 10'),
(740, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:22:41', 'Chrome 10', 'Windows 10'),
(741, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:23:27', 'Chrome 10', 'Windows 10'),
(742, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:23:31', 'Chrome 10', 'Windows 10'),
(743, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:23:40', 'Chrome 10', 'Windows 10'),
(744, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:23:43', 'Chrome 10', 'Windows 10'),
(745, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:24:04', 'Chrome 10', 'Windows 10'),
(746, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:25:02', 'Chrome 10', 'Windows 10'),
(747, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:25:40', 'Chrome 10', 'Windows 10'),
(748, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:25:50', 'Chrome 10', 'Windows 10'),
(749, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:25:55', 'Chrome 10', 'Windows 10'),
(750, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-19 23:35:40', 'Chrome 10', 'Windows 10'),
(751, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:35:43', 'Chrome 10', 'Windows 10'),
(752, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:37:24', 'Chrome 10', 'Windows 10'),
(753, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:40:42', 'Chrome 10', 'Windows 10'),
(754, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:41:47', 'Chrome 10', 'Windows 10'),
(755, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:41:50', 'Chrome 10', 'Windows 10'),
(756, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:41:51', 'Chrome 10', 'Windows 10'),
(757, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:42:25', 'Chrome 10', 'Windows 10'),
(758, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:42:53', 'Chrome 10', 'Windows 10'),
(759, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:46:58', 'Chrome 10', 'Windows 10'),
(760, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-19 23:48:12', 'Chrome 10', 'Windows 10'),
(761, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-19 23:51:13', 'Chrome 10', 'Windows 10'),
(762, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:22', 'Chrome 10', 'Windows 10'),
(763, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:22', 'Chrome 10', 'Windows 10'),
(764, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:06:22', 'Chrome 10', 'Windows 10'),
(765, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:30', 'Chrome 10', 'Windows 10'),
(766, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:37', 'Chrome Mobile', 'Android 6.x'),
(767, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:37', 'Chrome Mobile', 'Android 6.x'),
(768, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:38', 'Chrome Mobile', 'Android 6.x'),
(769, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(770, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(771, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(772, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(773, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(774, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:39', 'Chrome Mobile', 'Android 6.x'),
(775, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:40', 'Chrome Mobile', 'Android 6.x'),
(776, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:40', 'Chrome Mobile', 'Android 6.x'),
(777, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:40', 'Chrome Mobile', 'Android 6.x'),
(778, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:06:40', 'Chrome Mobile', 'Android 6.x'),
(779, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:04', 'Chrome Mobile', 'Android 6.x'),
(780, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:04', 'Chrome Mobile', 'Android 6.x'),
(781, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:04', 'Chrome Mobile', 'Android 6.x'),
(782, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:05', 'Chrome Mobile', 'Android 6.x'),
(783, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:05', 'Chrome Mobile', 'Android 6.x'),
(784, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:05', 'Chrome Mobile', 'Android 6.x'),
(785, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:07:05', 'Chrome Mobile', 'Android 6.x'),
(786, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:11:37', 'Chrome Mobile', 'Android 6.x'),
(787, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:11:38', 'Chrome Mobile', 'Android 6.x'),
(788, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:14:07', 'Chrome Mobile', 'Android 6.x'),
(789, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:14:08', 'Chrome Mobile', 'Android 6.x'),
(790, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:14:08', 'Chrome Mobile', 'Android 6.x'),
(791, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:14:08', 'Chrome Mobile', 'Android 6.x'),
(792, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:14:09', 'Chrome Mobile', 'Android 6.x'),
(793, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:21:45', 'Chrome Mobile', 'Android 6.x'),
(794, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:26:43', 'Chrome Mobile', 'Android 6.x'),
(795, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:27:21', 'Chrome Mobile', 'Android 6.x'),
(796, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:03', 'Chrome Mobile', 'Android 6.x'),
(797, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:10', 'Chrome Mobile', 'Android 6.x'),
(798, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:10', 'Chrome Mobile', 'Android 6.x'),
(799, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:31', 'Chrome Mobile', 'Android 6.x'),
(800, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:31', 'Chrome Mobile', 'Android 6.x'),
(801, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:31', 'Chrome Mobile', 'Android 6.x'),
(802, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:31', 'Chrome Mobile', 'Android 6.x'),
(803, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:32:31', 'Chrome Mobile', 'Android 6.x'),
(804, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:34:37', 'Chrome Mobile', 'Android 6.x'),
(805, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:40:18', 'Chrome 10', 'Windows 10'),
(806, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:40:18', 'Chrome 10', 'Windows 10'),
(807, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:40:20', 'Chrome 10', 'Windows 10'),
(808, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/3', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:40:27', 'Chrome 10', 'Windows 10'),
(809, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(810, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(811, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(812, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(813, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(814, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(815, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/3', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(816, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(817, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:38', 'Chrome 10', 'Windows 10'),
(818, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(819, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(820, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(821, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome 10', 'Windows 10'),
(822, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome 10', 'Windows 10'),
(823, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome 10', 'Windows 10'),
(824, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(825, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(826, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome 10', 'Windows 10'),
(827, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(828, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(829, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 16:52:39', 'Chrome Mobile', 'Android 6.x'),
(830, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:03:23', 'Chrome Mobile', 'Android 6.x'),
(831, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:04:30', 'Chrome 10', 'Windows 10'),
(832, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:04:35', 'Chrome Mobile', 'Android 6.x'),
(833, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:05:02', 'Chrome Mobile', 'Android 6.x'),
(834, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:05:03', 'Chrome Mobile', 'Android 6.x'),
(835, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:05:03', 'Chrome Mobile', 'Android 6.x'),
(836, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:05:03', 'Chrome Mobile', 'Android 6.x'),
(837, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 17:05:04', 'Chrome Mobile', 'Android 6.x'),
(838, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 19:52:29', 'Chrome 10', 'Windows 10'),
(839, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 19:52:29', 'Chrome 10', 'Windows 10'),
(840, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 19:52:32', 'Chrome 10', 'Windows 10'),
(841, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 19:52:45', 'Chrome 10', 'Windows 10'),
(842, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 19:52:53', 'Chrome 10', 'Windows 10'),
(843, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-20 19:52:53', 'Chrome 10', 'Windows 10'),
(844, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 19:54:28', 'Chrome 10', 'Windows 10'),
(845, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 19:57:40', 'Chrome 10', 'Windows 10'),
(846, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/2', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-20 23:47:30', 'Chrome 10', 'Windows 10'),
(847, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-21 00:46:37', 'Chrome 10', 'Windows 10'),
(848, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 15:45:47', 'Chrome 10', 'Windows 10'),
(849, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 15:59:07', 'Chrome 10', 'Windows 10'),
(850, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-26 15:59:15', 'Chrome 10', 'Windows 10'),
(851, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-26 16:32:15', 'Chrome 10', 'Windows 10'),
(852, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-26 16:33:08', 'Chrome 10', 'Windows 10'),
(853, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:33:13', 'Chrome 10', 'Windows 10'),
(854, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:33:54', 'Chrome 10', 'Windows 10'),
(855, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:41:14', 'Chrome 10', 'Windows 10'),
(856, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:41:18', 'Chrome 10', 'Windows 10'),
(857, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:41:46', 'Chrome 10', 'Windows 10'),
(858, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:41:50', 'Chrome 10', 'Windows 10'),
(859, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:44:38', 'Chrome 10', 'Windows 10'),
(860, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:45:21', 'Chrome 10', 'Windows 10'),
(861, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:46:54', 'Chrome 10', 'Windows 10'),
(862, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:47:10', 'Chrome 10', 'Windows 10'),
(863, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:47:14', 'Chrome 10', 'Windows 10'),
(864, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-26 16:47:16', 'Chrome 10', 'Windows 10'),
(865, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:47:23', 'Chrome 10', 'Windows 10'),
(866, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:57:46', 'Chrome 10', 'Windows 10'),
(867, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 16:58:31', 'Chrome 10', 'Windows 10'),
(868, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:58:39', 'Chrome 10', 'Windows 10'),
(869, '获取标签列表', 0, 'com.oly.cms.web.controller.page.WebPageController.tags()', 'GET', 1, '/tag', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tags\"', 0, '', '2022-05-26 16:58:42', 'Chrome 10', 'Windows 10'),
(870, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:58:46', 'Chrome 10', 'Windows 10'),
(871, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:58:55', 'Chrome 10', 'Windows 10'),
(872, '获取分类', 0, 'com.oly.cms.web.controller.page.WebPageController.cats()', 'GET', 1, '/category', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/categories\"', 0, '', '2022-05-26 16:59:11', 'Chrome 10', 'Windows 10'),
(873, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 17:53:03', 'Chrome 10', 'Windows 10'),
(874, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 18:00:49', 'Chrome 10', 'Windows 10'),
(875, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 18:48:49', 'Chrome 10', 'Windows 10'),
(876, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:15:56', 'Chrome 10', 'Windows 10'),
(877, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:15:59', 'Chrome 10', 'Windows 10'),
(878, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:00', 'Chrome 10', 'Windows 10'),
(879, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:02', 'Chrome 10', 'Windows 10'),
(880, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:36', 'Chrome 10', 'Windows 10'),
(881, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:38', 'Chrome 10', 'Windows 10'),
(882, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:38', 'Chrome 10', 'Windows 10'),
(883, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 19:16:39', 'Chrome 10', 'Windows 10'),
(884, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 19:55:23', 'Chrome 10', 'Windows 10'),
(885, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:31:42', 'Chrome 10', 'Windows 10'),
(886, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/zgcms/index', '127.0.0.1', '内网IP', '{ }', '\"zgcms/pages/web/index\"', 0, '', '2022-05-26 20:35:32', 'Chrome 10', 'Windows 10'),
(887, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:06', 'Chrome 10', 'Windows 10'),
(888, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:41', 'Chrome 10', 'Windows 10'),
(889, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:50', 'Chrome 10', 'Windows 10'),
(890, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:52', 'Chrome 10', 'Windows 10'),
(891, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:52', 'Chrome 10', 'Windows 10'),
(892, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:52', 'Chrome 10', 'Windows 10'),
(893, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:53', 'Chrome 10', 'Windows 10'),
(894, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:36:53', 'Chrome 10', 'Windows 10'),
(895, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 20:37:16', 'Chrome 10', 'Windows 10'),
(896, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-26 21:02:54', 'Chrome 10', 'Windows 10'),
(897, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:17:21', 'Chrome 10', 'Windows 10'),
(898, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:17:25', 'Chrome 10', 'Windows 10'),
(899, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:21:01', 'Chrome 10', 'Windows 10'),
(900, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:21:17', 'Chrome 10', 'Windows 10'),
(901, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:24:32', 'Chrome 10', 'Windows 10'),
(902, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:33:29', 'Chrome 10', 'Windows 10'),
(903, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/5', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-27 02:33:37', 'Chrome 10', 'Windows 10'),
(904, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/4', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-27 02:33:45', 'Chrome 10', 'Windows 10'),
(905, '获取文章', 0, 'com.oly.cms.web.controller.page.WebPageController.post()', 'GET', 1, '/post/4', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/post\"', 0, '', '2022-05-27 02:35:17', 'Chrome 10', 'Windows 10'),
(906, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 02:35:22', 'Chrome 10', 'Windows 10'),
(907, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-27 10:13:35', 'Chrome 10', 'Windows 10'),
(908, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:24:18', 'Chrome 10', 'Windows 10'),
(909, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:30:19', 'Chrome 10', 'Windows 10'),
(910, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:32:50', 'Chrome 10', 'Windows 10'),
(911, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:33:36', 'Chrome 10', 'Windows 10'),
(912, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:34:00', 'Chrome 10', 'Windows 10'),
(913, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:34:32', 'Chrome 10', 'Windows 10'),
(914, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 04:35:51', 'Chrome 10', 'Windows 10'),
(915, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:53', 'Chrome 10', 'Windows 10'),
(916, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:53', 'Chrome 10', 'Windows 10'),
(917, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:53', 'Chrome 10', 'Windows 10'),
(918, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:54', 'Chrome 10', 'Windows 10'),
(919, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:54', 'Chrome 10', 'Windows 10'),
(920, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:51:54', 'Chrome 10', 'Windows 10'),
(921, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/index', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-28 21:52:11', 'Chrome 10', 'Windows 10'),
(922, '获取标签', 0, 'com.oly.cms.web.controller.page.WebPageController.tag()', 'GET', 1, '/tag/1', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/tag\"', 0, '', '2022-05-29 01:54:27', 'Chrome 10', 'Windows 10'),
(923, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-29 01:54:27', 'Chrome 10', 'Windows 10'),
(924, '主页请求', 0, 'com.oly.cms.web.controller.page.WebPageController.index()', 'GET', 1, '/', '127.0.0.1', '内网IP', '{ }', '\"zgblog/pages/web/index\"', 0, '', '2022-05-29 01:57:16', 'Chrome 10', 'Windows 10');

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
(19, 2, 1, '2022-04-15 15:33:33', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(20, 2, 1, '2022-05-01 07:14:03', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(21, 1, 1, '2022-05-01 07:14:28', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(22, 1, 1, '2022-05-01 07:14:39', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(23, 1, NULL, '2022-05-01 16:42:08', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(24, 1, 1, '2022-05-01 16:42:46', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(25, 1, 1, '2022-05-01 16:42:57', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(26, 1, 1, '2022-05-01 16:43:56', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(27, 1, 1, '2022-05-01 16:46:37', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(28, 1, 1, '2022-05-01 16:46:45', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(29, 1, 1, '2022-05-01 16:47:04', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(30, 1, 1, '2022-05-01 16:48:13', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(31, 1, 1, '2022-05-01 16:48:40', NULL, '127.0.0.1', NULL, 'Mac OS X (iPhone)', 'Mobile Safari'),
(32, 1, 1, '2022-05-02 01:39:59', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(33, 1, 1, '2022-05-02 01:40:15', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(34, 1, 1, '2022-05-02 01:40:27', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(35, 1, 1, '2022-05-02 01:40:30', NULL, '127.0.0.1', NULL, 'Mac OS X (iPhone)', 'Mobile Safari'),
(36, 1, 1, '2022-05-02 01:40:48', NULL, '127.0.0.1', NULL, 'Mac OS X (iPhone)', 'Mobile Safari'),
(37, 1, 1, '2022-05-02 01:40:59', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(38, 1, NULL, '2022-05-02 03:54:27', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(39, 1, NULL, '2022-05-02 03:54:40', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(40, 1, NULL, '2022-05-02 03:54:42', NULL, '127.0.0.1', NULL, 'Mac OS X (iPhone)', 'Mobile Safari'),
(41, 1, NULL, '2022-05-02 03:57:07', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(42, 2, 1, '2022-05-02 03:58:37', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(43, 1, 1, '2022-05-02 03:58:45', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(44, 1, 1, '2022-05-02 04:29:34', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(45, 1, 1, '2022-05-02 04:31:01', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(46, 1, NULL, '2022-05-02 06:39:11', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(47, 1, 1, '2022-05-02 21:03:38', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(48, 1, 1, '2022-05-02 21:04:26', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(49, 1, NULL, '2022-05-02 22:15:56', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(50, 1, 1, '2022-05-02 23:45:08', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(51, 1, 1, '2022-05-02 23:45:51', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(52, 1, 1, '2022-05-02 23:45:55', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(53, 1, 1, '2022-05-02 23:46:01', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(54, 2, 1, '2022-05-03 02:07:30', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(55, 1, 1, '2022-05-07 06:19:19', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(56, 1, NULL, '2022-05-12 10:11:08', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(57, 1, NULL, '2022-05-12 10:11:11', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(58, 2, NULL, '2022-05-12 10:11:20', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(59, 2, NULL, '2022-05-20 08:04:57', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(60, 2, 1, '2022-05-20 08:05:21', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(61, 2, 1, '2022-05-20 08:06:32', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(62, 2, 1, '2022-05-20 08:06:46', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(63, 2, 1, '2022-05-20 08:07:07', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(64, 2, 1, '2022-05-20 08:21:39', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(65, 2, 1, '2022-05-20 08:26:46', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(66, 2, 1, '2022-05-20 08:27:23', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(67, 2, 1, '2022-05-20 08:32:08', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(68, 2, 1, '2022-05-20 08:32:13', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(69, 2, 1, '2022-05-20 08:32:33', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(70, 2, 1, '2022-05-20 08:34:39', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(71, 3, 1, '2022-05-20 08:40:28', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(72, 2, 1, '2022-05-20 08:47:55', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(73, 2, 1, '2022-05-20 08:48:06', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(74, 2, 1, '2022-05-20 08:48:12', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(75, 2, 1, '2022-05-20 08:50:05', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(76, 2, 1, '2022-05-20 08:50:15', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(77, 3, 1, '2022-05-20 08:50:59', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(78, 2, 1, '2022-05-20 08:51:05', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(79, 2, 1, '2022-05-20 08:51:17', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(80, 2, 1, '2022-05-20 08:52:12', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(81, 2, 1, '2022-05-20 08:52:23', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(82, 2, 1, '2022-05-20 09:03:26', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(83, 2, 1, '2022-05-20 09:04:37', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(84, 2, 1, '2022-05-20 09:05:07', NULL, '127.0.0.1', NULL, 'Android 6.x', 'Chrome Mobile'),
(85, 2, NULL, '2022-05-20 11:52:31', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(86, 2, NULL, '2022-05-20 11:54:30', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(87, 2, NULL, '2022-05-20 11:57:42', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(88, 2, NULL, '2022-05-20 15:44:43', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(89, 5, 1, '2022-05-26 18:33:39', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(90, 4, 1, '2022-05-26 18:33:46', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10'),
(91, 4, 1, '2022-05-26 18:35:19', NULL, '127.0.0.1', NULL, 'Windows 10', 'Chrome 10');

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
(1, '踩踩', 1, '2022-03-24 23:02:00', '', 1, '2022-05-15 22:18:02', '', 2, '', '', 'cccc', '', 3, 1, 4);

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
-- 表的结构 `cms_union`
--

CREATE TABLE `cms_union` (
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
  `group_start_time` datetime DEFAULT NULL COMMENT '拼团开始时间',
  `group_end_time` datetime DEFAULT NULL COMMENT '拼团结束时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `visible` tinyint(1) DEFAULT NULL COMMENT '商品状态',
  `shop_content` text COMMENT '内容描述',
  `union_type` char(5) DEFAULT NULL COMMENT '联盟来源'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟推广';

--
-- 转存表中的数据 `cms_union`
--

INSERT INTO `cms_union` (`shop_id`, `shop_name`, `shop_img`, `shop_index`, `home_name`, `shop_price`, `shop_sales`, `income_ratio`, `commission`, `wang_name`, `sort_url`, `taoke_url`, `coupon_count`, `coupon_num`, `coupon_price`, `coupon_start_time`, `coupon_end_time`, `coupon_url`, `coupon_code`, `coupon_sort_url`, `market_is`, `group_num`, `group_price`, `group_commission`, `group_start_time`, `group_end_time`, `create_by`, `update_by`, `create_time`, `update_time`, `remark`, `visible`, `shop_content`, `union_type`) VALUES
('tb_20600624998', '【百草味芒果干120gx3】水果干厚切果脯蜜饯网红爆款小吃休闲零食', 'https://img.alicdn.com/i3/628189716/O1CN01NaNmBu2LdyvwuPkPW_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=20600624998', '百草味旗舰店', '29.90', 30000, 4, '1.26', '百草味旗舰店', 'https://s.click.taobao.com/Kd7KJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DRRRHArhl2MBw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOouTeR13zPxrsShUjNLx%2BduseVsjw9wOwBilt8LDwAr8xiXvDf8DaRs%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e151_69ff%4001', 500000, 499508, '2.00', '2022-05-31 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=EJOvI%2FHsFXYNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoIRxNTz%2FuqDz2Vgw7bfTQiT0co2Pp3XWRBJKTHQYKz89FrisGmre1Id0BFAqRODu10A1swf2WbLL9%2Fb9V6ZvjXcBeCWHQu6O2XfX1ofwI1tlHJ9sExbDOX6LYfNK5pA7%2BPcHnZ4UlVm%2FVVusqqnhify&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e151_69ff%4001', '29￥hoPY2OUdei0￥ https://m.tb.cn/h.ftxftKl  淘口令  ', 'https://s.click.taobao.com/LjCKJXu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_24517144470', '皎洁电子热蚊香液无味驱蚊液器家用通用室内插电式灭蚊神器水液体', 'https://img.alicdn.com/i2/720250651/O1CN01vQGI4L1GgCWAIrY5z_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=24517144470', '馨居汇家居专营店', '27.90', 3000, 3, '0.78', '馨居汇家居专营店', 'https://s.click.taobao.com/XQOW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DpBhzOmiB7B5w4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOollH5Vicz6SruKeweL%2BdwIv34U4S8EnD3EqY%2Bakgpmw&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e13a_69fb%4001', 100000, 94217, '2.00', '2022-05-25 00:00:00', '2022-07-23 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=UNhpFLaF1U8NfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoIZe7qG9gFH5q7%2BRGQL5H6UDlXLrqG2z1eHSth0TPU5sumFKyIN1bVX65OH1WfUm96VkEpb4oyLWNJ85Z5xEMKzBeCWHQu6O2XfX1ofwI1tlHJ9sExbDOX6LYfNK5pA7%2BPcHnZ4UlVm%2FVVusqqnhify&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e13a_69fb%4001', '87￥qaWe2OUXgU2￥ https://m.tb.cn/h.fGD964a  淘口令  ', 'https://s.click.taobao.com/MecJJXu', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_527981440603', '冰袖防晒女男袖套夏季开车护臂手臂套袖冰丝夏天薄款袖子手套胳膊', 'https://img.alicdn.com/i4/2108390621/O1CN01BIMaXI1GSSheQ159i_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=527981440603', '型公馆服饰旗舰店', '9.80', 9000, 0, '0.04', '型公馆服饰旗舰店', 'https://s.click.taobao.com/FecJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DnfiEpe%2B4%2FZVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheq9i05ap%2FkwXeTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOhVPWezvn2iFSV%2B1HSP8r6cszz8xJ1b03r0Z%2FbOZSK95&union_lens=lensId%3AOPT%401654024955%40212c8db2_0bef_1811b91e595_a1fd%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_554926440769', '杀虫剂家用床上灭蚂蚁除跳蚤杀蟑螂药喷剂驱喷雾去神器室内非无毒', 'https://img.alicdn.com/i2/2134154334/O1CN01oH1iiz1ht1G5txggv_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=554926440769', '确邦旗舰店', '25.90', 100, 0, '0.16', '确邦旗舰店', 'https://s.click.taobao.com/5LdW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DENXxYGsmj5dw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOgVfxTcKaLgyZck%2FiyHh5rdsMxMHfbAoptVHxwNTr670IYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3f5_2712%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_558728467046', '一次性口罩三层夏季外用透气加厚防护男潮款白色独立包装囗防尘罩', 'https://img.alicdn.com/i1/2234110902/O1CN01DvRBwx1IX9tCkjvYo_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=558728467046', '百佳爱旗舰店', '6.90', 1000, 1, '0.09', '百佳爱旗舰店', 'https://s.click.taobao.com/ZR2KJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DJlUvQPTBCclw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOhzAWjYis0AxvbDWNn4IBjmDTZ6p2B3pFj7lCjCC8ck8&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de82_5a3b%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_559077508298', '百草味手撕面包1kg蛋糕早餐休闲小吃食品野营零食整箱囤货糕点心', 'https://img.alicdn.com/i4/628189716/O1CN01jrXBwe2LdyvszNM5o_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=559077508298', '百草味旗舰店', '29.90', 60000, 0, '0.13', '百草味旗舰店', 'https://s.click.taobao.com/Jd7KJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DASX%2BwZ1TRfFw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOouTeR13zPxr%2Bc9AqvM0R1h2tri6%2BC3ibcYMXU3NNCg%2F&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e175_6a04%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_564677404266', '【大希地】牛排套餐团购黑椒菲力家庭儿童牛扒10片新鲜牛肉家用20', 'https://img.alicdn.com/i2/1918385168/O1CN01hXWXno1o2zctacxX7_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=564677404266', '大希地旗舰店', '89.00', 10000, 6, '4.74', '大希地旗舰店', 'https://s.click.taobao.com/LshJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DgTtYyX60blpw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOsKj8yT1dmy6hUt5smLoKx0DDOcMiImzlO5Vz8isHkxNIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de79_5a3a%4001', 100000, 100000, '10.00', '2022-06-01 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=IE2yBIwOIgkNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoL3oVYYjyiiLcDbmPfbO8wYaJY2MFJE1YXCeKlxaBeKMMuRTiT9oEhVZV8pr6FWc0PyrNe%2F9mvNnoQchL4VSAGomMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.6.118_687_1654024953323&ptl=floorId:31507;app_pvid:59590_33.8.6.118_687_1654024953323;tpp_pvid:&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de79_5a3a%4001', '87￥km3a2OUX9iz￥ https://m.tb.cn/h.fuxkxwP  淘口令  ', 'https://s.click.taobao.com/TE9W6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_565973797354', '南极人 冰防晒夏季女袖套男士薄冰丝套袖手袖护臂套袖子开车手套', 'https://img.alicdn.com/i1/2203700036/TB2eEeAx_XYBeNkHFrdXXciuVXa_!!2203700036-0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=565973797354', '南极人天瑟专卖店', '9.80', 4000, 0, '0.04', '南极人天瑟专卖店', 'https://s.click.taobao.com/6LdW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DdyfqBw0WaW9w4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOgKptPpsvHBfOEpQp00TC5e3EPKU1D1QD0x0inWuvg%2Fd&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3f1_2711%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_567119947990', '梵西贵妇黄金眼膜贴淡化黑眼圈细纹眼纹抗皱眼袋紧致官方旗舰店', 'https://img.alicdn.com/i3/2453037575/O1CN01UNAyjq25pOxEjFxM6_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=567119947990', '梵西化妆品旗舰店', '79.00', 7000, 6, '2.94', '梵西化妆品旗舰店', 'https://s.click.taobao.com/hlMKJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DmtDfSfWLPYVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOvduWpI61b9r2VOw7Ocw5AS7%2BknGweAqjFYztalIKcp%2FIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e12e_69fa%4001', 100000, 99977, '30.00', '2022-05-31 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=1cGtMRuTRMcNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoJe07geExRT144LLmZAEoeYgs%2BRWCSuEQcTopbmGewYxMuRTiT9oEhVZV8pr6FWc0NtF%2BF85Jw%2BYLybByEqSROVmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e12e_69fa%4001', '97￥NXrG2OU2oN0￥ https://m.tb.cn/h.fuxPWU7  淘口令  ', 'https://s.click.taobao.com/glMKJXu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_567758659175', '厨房用品多功能切菜神器削土豆丝切丝器家用刮擦丝刨丝擦子切片机', 'https://img.alicdn.com/i1/2452969280/O1CN0155Zmaf2IQI7ruS0Cs_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=567758659175', '创天源家居专营店', '9.90', 700, 1, '0.15', '创天源家居专营店', 'https://s.click.taobao.com/nvHKJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3Ds13i%2FHPJf%2Bdw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOq21gi%2Fizm5pNAEO%2BaKyUglI1PwIt%2BJ66kPTLNcSuWp0IYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de96_5a3e%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_569639712367', '男士短裤子夏季外穿棉麻五分裤宽松休闲潮流加肥加大码亚麻沙滩裤', 'https://img.alicdn.com/i1/3345988510/O1CN01VYRuRO2Cjd6ZqDXOo_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=569639712367', '洛夫乔伊旗舰店', '49.90', 300, 9, '2.69', '洛夫乔伊旗舰店', 'https://s.click.taobao.com/gNIJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DveCbS4iXHJdw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOloNnW8q8C15O9IuYUOGvbmH13eY9ea1IDVq5Cf%2B%2BZR%2FIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de8e_5a3d%4001', 100000, 99937, '20.00', '2022-05-27 00:00:00', '2022-06-02 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=%2FUB%2BP4EFNzsNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoIGtpX6QfS2JqstHBJaJZW0PVkWY3fbj6w%2F%2F53pwXeFJsuRTiT9oEhVZV8pr6FWc0MH5G%2FXDqse%2BHVyyP0gEYsNmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.6.118_687_1654024953323&ptl=floorId:31507;app_pvid:59590_33.8.6.118_687_1654024953323;tpp_pvid:&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de8e_5a3d%4001', '38￥1l342OUd3EA￥ https://m.tb.cn/h.fGDQs4b  淘口令  ', 'https://s.click.taobao.com/VD7X6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_578167245233', '纽西之谜隔离霜 妆前乳女 打底修饰肌肤隐形毛孔水凝清润官方正品', 'https://img.alicdn.com/i4/2926596407/O1CN018nZ7Qs1xCSLzOXNXe_!!2926596407.jpg', 'http://item.taobao.com/item.htm?id=578167245233', 'geoskincare纽西之谜旗舰店', '79.00', 20000, 6, '4.74', 'geoskincare纽西之谜旗舰店', 'https://s.click.taobao.com/mvHKJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D1cKC87%2FaUPVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOuYPabNOIpYU97vETgaDbXZxwPmxWxBltgv8Yx%2FSXn4EIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e14c_69fe%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_578985014923', '衣物收纳袋子超大号容量衣服行李打包搬家用巨能装棉被子子整理袋', 'https://img.alicdn.com/i1/2931303258/O1CN016DIsME1ZwD13BTsh3_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=578985014923', '谜寇旗舰店', '7.90', 200, 1, '0.11', '谜寇旗舰店', 'https://s.click.taobao.com/hWiW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DJTUuyX0IWNZw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOqaYmFWJ74i3CgYb7624%2FAnfP2deW5w3c70Z%2FbOZSK95&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e172_6a03%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_579837973670', '张记垃圾袋家用手提式加厚批发黑色背心拉圾厨房一次性塑料袋大号', 'https://img.alicdn.com/i1/4217952040/O1CN01pgzcpR1QwMfdWnE1P_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=579837973670', '定度家居专营店', '4.80', 30000, 1, '0.09', '定度家居专营店', 'https://s.click.taobao.com/cCsJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DKy%2BOyuNWyZVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOi2IxOwrUxB09430Xp8Em87V6HbvJNsgpUTYFmvfiyKFIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de75_5a39%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_580442138828', '宝娜斯丝袜女2021肉色春秋菠萝袜光腿神器夏季超薄款防勾丝连裤袜', 'https://img.alicdn.com/i3/3162439037/O1CN01hTjQPi2GczzWKzPA2_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=580442138828', 'bonas宝娜斯专卖店', '19.90', 100000, 0, '0.18', 'bonas宝娜斯专卖店', 'https://s.click.taobao.com/E2nJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DxPmh0KUWpxRw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOt5NRWrtt9YYQHYMsI9ljxvx9%2BjK%2BI4its9kxRRHfUqm&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e144_69fc%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_587575032289', '真无线蓝牙耳机2022年新款双耳运动跑步入耳式降噪女生女士款可爱超长续航音质超好适用苹果oppo小米vivo华为', 'https://img.alicdn.com/i1/2196374352/O1CN01SNj3ZB1i1GFYY0ygD_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=587575032289', '创致伟业电器专营店', '19.90', 1000, 0, '0.09', '创致伟业电器专营店', 'https://s.click.taobao.com/DVYW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DblaDhBnfn4Nw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOnswHZAJtGbif9Xei2o6ssuy0mvUgvcwni995RSXr%2Fuk&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3e2_270e%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_587603338781', '只投螺碗螺蛳粉柳州正宗包邮整箱320g*5袋装广西特产螺丝粉螺狮粉', 'https://img.alicdn.com/i1/2200714846589/O1CN011Qt3bb1yXoR2fDHZh_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=587603338781', '只投螺碗旗舰店', '39.90', 30000, 6, '2.09', '只投螺碗旗舰店', 'https://s.click.taobao.com/HGNJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DHJFeiSCHquFw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOhPGESPnPvuuBDm3lriPAKvLm0%2Fg3ct449bRk0FDsheNPaXg%2FKwnH88%3D&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3fd_2714%4001', 100000, 98944, '5.00', '2022-05-31 20:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=SouXEIXwzlYNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoLHyKujUAUFviNkXhrC%2B8ljMvstELOBgG%2Bb2D11SNXUbemFKyIN1bVX65OH1WfUm95EiTKDx3mvHMStmM6rCQppRl4fT8u4on8oa96Cgf7oejDaomxraq87hDfEg1b2tgU%2BEDJHikTKaWhpDcLc3%2BpOJTNWSR3CwiY%3D&&app_pvid=59590_33.5.101.205_709_1654024954765&ptl=floorId:31507;app_pvid:59590_33.5.101.205_709_1654024954765;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3fd_2714%4001', '59￥kgmu2OUdfHI￥ https://m.tb.cn/h.fGDjsSu  淘口令  ', 'https://s.click.taobao.com/YaXJJXu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_587991649073', '【王俊凯同款】高姿防晒喷雾女美白脸部身体清爽不油腻全身夏天', 'https://img.alicdn.com/i1/2924703009/O1CN01dYM5X61Y6AWSYAbpN_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=587991649073', 'cogi高姿旗舰店', '99.00', 70000, 7, '4.87', 'cogi高姿旗舰店', 'https://s.click.taobao.com/BRSJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D%2BLdF%2Fadq7U5w4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOs%2BhYajuzOaRY6FI54a0DvBrPDS%2BT14HFKRj%2B7refydoIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e405_2715%4001', 100000, 98000, '30.00', '2022-05-31 20:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=QwLim6R8f3oNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoLUbeG7fOEomhvBcD9qOk5Cij2lchODlFD9Yfg3UwgeVMuRTiT9oEhVZV8pr6FWc0OwY%2F8lIjcBeZC%2B%2BacHGZgrmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.5.101.205_709_1654024954765&ptl=floorId:31507;app_pvid:59590_33.5.101.205_709_1654024954765;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e405_2715%4001', '57￥DqVF2OUX80D￥ https://m.tb.cn/h.fuxPabw  淘口令  ', 'https://s.click.taobao.com/3H2X6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_594083012474', '电风扇防护网儿童防夹手防尘罩安全网罩防小孩罩子保护罩宝宝网套', 'https://img.alicdn.com/i2/2453257123/O1CN01XDJMwu22UNm09RrMO_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=594083012474', '福人吉利旗舰店', '7.80', 10000, 2, '0.18', '福人吉利旗舰店', 'https://s.click.taobao.com/C2nJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DMza0UJ%2BdNeNw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOnGc5rYUEzRbtJdMEfk1TbXpP9btR1BbUEx0inWuvg%2Fd&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3f9_2713%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_597210467626', '云南咖啡蓝山风味三合一速溶咖啡粉袋装 黑咖啡 提神学生40条茶咖', 'https://img.alicdn.com/i1/2200534423181/O1CN01ZMkAzu1ZMwdxqPgmw_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=597210467626', '宵雅旗舰店', '19.90', 100000, 3, '0.60', '宵雅旗舰店', 'https://s.click.taobao.com/GVYW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DAriYZbAVxVdw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOhJsQgSxJdhQIWCgR%2BT2vgHm8IfPaNo69lgoaGvqKNU%2FPuUKMILxyTw%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e12a_69f9%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_597345497102', '白凉粉儿童专用果冻粉自制家食用无烧仙草粉的添加正品官方旗舰店', 'https://img.alicdn.com/i1/3902032678/O1CN01bOYW5g1VeZMQf0Ya2_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=597345497102', '森庄农品旗舰店', '12.90', 1000, 0, '0.06', '森庄农品旗舰店', 'https://s.click.taobao.com/dQOW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DXXRGjAwuCU9w4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOkPI9UyaGe0fkbYZN8Ow3F%2BbRCs0BU%2F8hvpmrtnr%2FEjJIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de71_5a38%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_598088771970', '漫花60包/10包原木纸巾抽纸家用整箱实惠装餐巾纸擦手纸卫生纸抽', 'https://img.alicdn.com/i1/2930255252/O1CN01YOYnHE1ofStY8Mspy_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=598088771970', '漫花旗舰店', '9.99', 7000, 0, '0.04', '漫花旗舰店', 'https://s.click.taobao.com/wSJW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DqfLux43P9npw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheq9i05ap%2FkwXeTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOq4z%2FLHinqEwppR7KjJk2vlIX12k5fe8tcW9M85Iazn0IYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024955%40212c8db2_0bef_1811b91e59a_a1fe%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_599263048413', '防走光扣女衬衫免缝暗扣开衫百搭纽扣胸针按扣免钉隐形钉扣小扣子', 'https://img.alicdn.com/i2/3868146211/O1CN01qU9Q9Z1vkgYvPAEiG_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=599263048413', '倾洛澄旗舰店', '10.75', 79, 3, '0.29', '倾洛澄旗舰店', 'https://s.click.taobao.com/VQOW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3Dr0IbpYfLCiVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOqW1FOhd%2Bez6rba1bHd7Zk8ZWhOH%2BeY4fL0Z%2FbOZSK95&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e162_6a01%4001', 100000, 98591, '1.00', '2022-05-16 00:00:00', '2022-06-30 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=r4v2VwPA%2Ft8NfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoL4854vpwq5t14wO6DbSdIQw4FRzixHluJSEJcUQTcJcZrFNBQuQgInNg4Gqf8CT4DbDsVpl%2FFwSl88XT33gkajmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e162_6a01%4001', '57￥HqVt2OU2fzk￥ https://m.tb.cn/h.fGDjxqJ  淘口令  ', 'https://s.click.taobao.com/eaXJJXu', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_601501037373', '洗衣机槽清洗剂泡腾片滚筒式消毒杀菌泡腾清洁片污渍神器除垢家用', 'https://img.alicdn.com/i4/720250651/O1CN01flyfu71GgCTSAyCAE_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=601501037373', '馨居汇家居专营店', '14.80', 600, 3, '0.44', '馨居汇家居专营店', 'https://s.click.taobao.com/7LdW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DFfJ%2B210lU8tw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOollH5Vicz6S1hjz2dNwkcQu%2BnxGjShpU2PtFMdFm%2FhZxg5p7bh%2BFbQ%3D&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3de_270d%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_602799485551', '酸奶果粒麦片即食干吃水果坚果奇亚籽谷物燕麦片早餐代餐饱腹食品', 'https://img.alicdn.com/i3/2206435181289/O1CN01ExfJHN1LOP9p33Sle_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=602799485551', '辛谷晨味旗舰店', '14.90', 2000, 3, '0.42', '辛谷晨味旗舰店', 'https://s.click.taobao.com/WUnW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DzxwR1DxsaF5w4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOltpjT%2BrU030qpAIInu3DpEsWFpP5jIxeHLgd9ZTzDHGPaXg%2FKwnH88%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e169_6a02%4001', 99999, 94548, '1.00', '2022-04-30 00:00:00', '2022-06-29 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=%2FBOPpWrVjEQNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoKsD6XlAZ4ycdwLlfjJZk%2FeE0CxR5XOfhB8KXyJQmk%2F6OmFKyIN1bVX65OH1WfUm95Uf2TiFOebe%2FSDl9T7%2BUFMXvY4FzDFTuUoa96Cgf7oejDaomxraq87hDfEg1b2tgU%2BEDJHikTKaWhpDcLc3%2BpOJTNWSR3CwiY%3D&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e169_6a02%4001', '19￥qP042OUXW3x￥ https://m.tb.cn/h.fHBOR6V  淘口令  ', 'https://s.click.taobao.com/mZsW6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_602897454410', '玻璃贴纸透光不透明自粘卫生间办公室窗户防走光防窥遮光磨砂贴膜', 'https://img.alicdn.com/i4/2639624421/O1CN01IdA9yb1iWrj1IL1Ch_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=602897454410', '莱恩斯旗舰店', '3.84', 900, 1, '0.05', '莱恩斯旗舰店', 'https://s.click.taobao.com/haXJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DMFr6FsvXW0Fw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOk6V5k0drTyfR9lOzXHfSlXN1sW5cDlhblEsGBpbm51r&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91dea2_5a41%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_606518315346', '食品级保鲜膜家用大卷PE厨房微波炉美容院商用高温切割盒器经济装', 'https://img.alicdn.com/i2/2206683800704/O1CN01HQWwqA1H4TUEXC7wh_!!2-item_pic.png', 'http://item.taobao.com/item.htm?id=606518315346', '轶佳旗舰店', '5.51', 900, 1, '0.08', '轶佳旗舰店', 'https://s.click.taobao.com/PGNJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DUpUPtqAE54tw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOjrR4BBJmvxeHSkhLK7Wj4BcXKnyVKPu3qjJJt1hcVyaPuUKMILxyTw%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de6d_5a37%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_606645276518', '好巴食豆干网红麻辣条小零食小包装五香辣休闲囤货食品整箱豆腐干', 'https://img.alicdn.com/i1/3796402366/O1CN01uUlVVd1TLfnf7Uq4O_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=606645276518', '好巴食旗舰店', '24.90', 6000, 6, '1.31', '好巴食旗舰店', 'https://s.click.taobao.com/PE9W6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3Drb3yE%2FoWXmVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOgFBz7Cc63qYHhoiarp6fS5ygYgGpORq20Q8v%2Bxd%2BwhiIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e17a_6a05%4001', 100000, 99996, '3.00', '2022-05-31 00:00:00', '2022-06-02 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=1exK1LsZH6ENfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoKpLU67WWsOa7Nb5ODHy7q%2BBi66lv6Fn2v805mvGycmfcuRTiT9oEhVZV8pr6FWc0NqCCYhJlAu6zIJ5Fji7vrlmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e17a_6a05%4001', '48￥2MFB2OU2NJK￥ https://m.tb.cn/h.fGD964b  淘口令  ', 'https://s.click.taobao.com/KGNJJXu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_608689411162', '得力60色水溶性炫彩棒套装儿童安全无毒可水洗旋转油画棒蜡笔12色24色36色48色幼儿园宝宝彩绘彩色涂色彩笔棒', 'https://img.alicdn.com/i1/2395182655/O1CN01iIJvSP1VU27x20wEK_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=608689411162', 'deli得力印恒专卖店', '25.80', 38, 0, '0.12', 'deli得力印恒专卖店', 'https://s.click.taobao.com/JecJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DLMqBIVz9StJw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOn3VnroJNvy2KMrf3kN8p1Wl1jxXd%2BAsLzmEMK4TxNIs&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3da_270c%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_609838119857', '无火香薰家用精油室内持久留香酒店厕所除臭房间卧室空气清除异味', 'https://img.alicdn.com/i3/2157652336/O1CN01M1uSI41T7vvsyCYmg_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=609838119857', '讨好自己旗舰店', '8.90', 100000, 13, '0.80', '讨好自己旗舰店', 'https://s.click.taobao.com/Gd7KJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D7EFu%2BzLf1gVw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOnN2p4LHyRHdZ52yZhZla7mXu3eTXfXlC%2BzxS6nA7xObIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3e9_2710%4001', 100000, 99000, '3.00', '2022-05-31 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=2vvJ8pXpvkwNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoIR0S0ekcjdhQARzw6rhR2SSjzQwFiPz439KJUWvkAJhcuRTiT9oEhVZV8pr6FWc0MGWV0hzjujH6kB8PbCel7%2BmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.5.101.205_709_1654024954765&ptl=floorId:31507;app_pvid:59590_33.5.101.205_709_1654024954765;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3e9_2710%4001', '28￥ix4p2OU2Oci￥ https://m.tb.cn/h.ftxfSww  淘口令  ', 'https://s.click.taobao.com/CRSJJXu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_610045888881', '一次性洗脸巾女纯棉柔巾卷筒式无菌洁面巾擦脸巾美容卸妆擦脸面巾', 'https://img.alicdn.com/i4/3821865505/O1CN01GuFWzt1qXKwMyUWdi_!!3821865505.jpg', 'http://item.taobao.com/item.htm?id=610045888881', '鄙人訫选', '15.98', 0, 2, '0.42', '鄙人訫选', 'https://s.click.taobao.com/CVYW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3Da1KlXAJ2KNxw4vFB6t2Z2ueEDrYVVa64juWlisr3dOdyINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOnUOl88zMJWnRgJT9OfyJAGGkKgCA1KfIz2l4PysJx%2FP&union_lens=lensId%3AOPT%401654024954%40210565cd_092d_1811b91e3e6_270f%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:38', NULL, NULL, 0, NULL, 'TB'),
('tb_610541583700', '大垃圾袋大号商用黑色餐饮环卫家用酒店60大码加厚超大80物业批发', 'https://img.alicdn.com/i2/2200782958853/O1CN01kn6xsL2FGj65pVoFU_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=610541583700', '张记旗舰店', '7.80', 300, 1, '0.11', '张记旗舰店', 'https://s.click.taobao.com/XUnW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DqVqPw90jOwpw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOomLxFrW60lzbz%2BsLrj%2B%2FVg%2B44ealtsBBNFMpiv6UK0JxiXvDf8DaRs%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e148_69fd%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_614502953910', '@港仔文艺男 230g纯色纯棉短袖T恤男夏季ins潮流情侣宽松半袖体恤', 'https://img.alicdn.com/i4/1091756444/O1CN01QuGxwM1xTOqNOurIb_!!1091756444-2-lubanu-s.png', 'http://item.taobao.com/item.htm?id=614502953910', '港仔文艺男', '25.00', 2000, 6, '1.02', '气质有毒', 'https://s.click.taobao.com/WQOW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D8sprIiwEdcNw4vFB6t2Z2ueEDrYVVa64juWlisr3dOdyINtkUhsv0NKqJCiOHheqyTS32oZobhqTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOgVtMqVH35arvZLFKRjLMpq02gJw7aiUukYe1dn4qYaXIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e159_6a00%4001', 100000, 99972, '8.00', '2022-06-01 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=iQ0wUbXctC0NfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoKl0YyuIbTql9o%2BTR%2B151SCxjILOWmB6ZFtl0mA30B3LsuRTiT9oEhVZV8pr6FWc0PsZ4NMdwtYPTAkaJBHC9CwmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PWuhcEU%2FqjP4&&app_pvid=59590_33.8.47.220_691_1654024954074&ptl=floorId:31507;app_pvid:59590_33.8.47.220_691_1654024954074;tpp_pvid:&union_lens=lensId%3AOPT%401654024954%4021082fdc_0995_1811b91e159_6a00%4001', '78￥TJE02OUXOTp￥ https://m.tb.cn/h.ftxfXRU  淘口令  ', 'https://s.click.taobao.com/0TJW6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_614521691764', '味出道海苔肉松条肉松饼早餐面包整箱绿豆饼糕点心小吃休闲零食品', 'https://img.alicdn.com/i2/3531991049/O1CN01uQ9xcn1JcUER7GYWZ_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=614521691764', '味出道旗舰店', '21.90', 7000, 1, '0.30', '味出道旗舰店', 'https://s.click.taobao.com/YR2KJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DcfllLvRDCENw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOiwtowr2cxRT4vpxHO4OVzcXvQLvrBnN1GBMWXuLKvUiIYULNg46oBA%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de86_5a3c%4001', 100000, 100000, '2.00', '2022-05-31 20:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=emCkC84D%2Fx4NfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoKvpIsOaj%2FU3M7E5EVVK5jMOwIn6zGif%2BgHmAfeDSbf5suRTiT9oEhVZV8pr6FWc0PsZ4NMdwtYPZOli0L9FvFsmMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PQIau621gO82&&app_pvid=59590_33.8.6.118_687_1654024953323&ptl=floorId:31507;app_pvid:59590_33.8.6.118_687_1654024953323;tpp_pvid:&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de86_5a3c%4001', '49￥uLS52OUd31t￥ https://m.tb.cn/h.fuxkFqD  淘口令  ', 'https://s.click.taobao.com/JVYW6Xu', '是', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_615846742896', '保温菜罩冬季盖菜罩饭菜餐桌罩折叠防尘热菜保温罩子家用加热神器', 'https://img.alicdn.com/i3/2342374918/O1CN01EMmdIM1mCUTnk5xgu_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=615846742896', '坚义居家日用专营店', '28.00', 88, 1, '0.42', '坚义居家日用专营店', 'https://s.click.taobao.com/NjCKJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DgvBhliYan8pw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOvP8DzSnuI0S6l03qsGvLFjHfcvIO8DNgz7lCjCC8ck8&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de9f_5a40%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_617968247973', '口罩收纳盒儿童便携式随身收纳口鼻罩暂存夹子学生口罩袋收纳神器', 'https://img.alicdn.com/i1/3251376857/O1CN01kvFKOi20WYR0WU6Kf_!!3251376857-0-lubanu-s.jpg', 'http://item.taobao.com/item.htm?id=617968247973', '杰彩旗舰店', '3.60', 8, 1, '0.05', '杰彩旗舰店', 'https://s.click.taobao.com/iaXJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3DRPA5J48jhatw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOvu8wWcZR9p26%2F%2B3vnhu1po%2FzbW2JA9aUb0Z%2FbOZSK95&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de9b_5a3f%4001', NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '', '', '', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:37', NULL, NULL, 0, NULL, 'TB'),
('tb_640132801259', '宝宝好v8v9v18溜娃神器折叠可坐可躺睡双向婴儿推车高景观遛娃车', 'https://img.alicdn.com/i1/2620566095/O1CN01QcwEHX1utYmD8lsri_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=640132801259', '宝宝好官方品牌店', '454.00', 1000, 1, '5.52', '宝宝好4s企业店', 'https://s.click.taobao.com/DLdW6Xu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3D5PuePOTTGrpw4vFB6t2Z2ueEDrYVVa64juWlisr3dOdyINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOvyLuyB8cRnhsR5WobfmNnSTPJlOZIFFFy995RSXr%2Fuk&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de61_5a15%4001', 50000, 48679, '45.00', '2022-05-31 20:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=a%2B28aHIKzaANfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoKaJfqHREP%2Fb%2BFK2ruHKAMrlIZq6%2BF2b9MeapTy5Gdt%2F5rFNBQuQgInNg4Gqf8CT4ChOIr08TQq9l21Lh1N8uS2mMHpNfYdHdCI6Gz4suqyW6AXrXmzfkR%2FTDiudQFY0ni04lW%2Byfn9PWuhcEU%2FqjP4&&app_pvid=59590_33.8.6.118_687_1654024953323&ptl=floorId:31507;app_pvid:59590_33.8.6.118_687_1654024953323;tpp_pvid:&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de61_5a15%4001', '59￥jrIo2OU2H26￥ https://m.tb.cn/h.ftxfO41  淘口令  ', 'https://s.click.taobao.com/UE9W6Xu', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB'),
('tb_645730512068', '志高空气炸锅家用新款烤箱一体全自动大容量智能多功能无油电炸锅', 'https://img.alicdn.com/i3/2211774574744/O1CN01iKhzQu1kunhAvCYyS_!!0-item_pic.jpg', 'http://item.taobao.com/item.htm?id=645730512068', '志高立冠专卖店', '189.00', 100, 1, '2.15', '志高立冠专卖店', 'https://s.click.taobao.com/JRSJJXu', 'https://s.click.taobao.com/t?e=m%3D2%26s%3Di3TffN9fC%2Bhw4vFB6t2Z2ueEDrYVVa64Dne87AjQPk9yINtkUhsv0NKqJCiOHheqB6x8rH6FQKOTEIw%2BPxaV%2F7oUuK7iWkpJ96J9XooE0WZbF0kI6ExBQo%2BXNpFmPVgxFBoMXOGuG5DkaqczTKGnOjuf1dCwH2I%2F443Os8ds1NGkvFnxSg33AHF1ysJa1jjpxiXvDf8DaRs%3D&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de34_5a14%4001', 10000, 10000, '30.00', '2022-06-01 00:00:00', '2022-06-03 23:59:59', 'https://uland.taobao.com/coupon/edetail?e=rUmCOow2cfcNfLV8niU3R5TgU2jJNKOfNNtsjZw%2F%2FoK%2BNZhLSe6QdBvy4h6s6ip6nyl%2BSGgUHYc9%2BhVrFVwQwUgfTscre%2FnAy5FOJP2gSFVp4exEq6u%2FYfCcw9qDSA4TkxgJaI1WSHUoa96Cgf7oejDaomxraq87hDfEg1b2tgU%2BEDJHikTKaWhpDcLc3%2BpOJTNWSR3CwiY%3D&&app_pvid=59590_33.8.6.118_687_1654024953323&ptl=floorId:31507;app_pvid:59590_33.8.6.118_687_1654024953323;tpp_pvid:&union_lens=lensId%3AOPT%401654024953%4021080676_0bea_1811b91de34_5a14%4001', '38￥C4f02OU2EwK￥ https://m.tb.cn/h.ftx4tpA  淘口令  ', 'https://s.click.taobao.com/MshJJXu', '否', NULL, NULL, NULL, NULL, NULL, 'admin', NULL, '2022-06-01 23:34:36', NULL, NULL, 0, NULL, 'TB');

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
(6, 'cms_union', '联盟推广', '', NULL, 'CmsUnion', 'crud', 'com.ruoyi.system', 'system', 'union', '联盟推广', 'zg', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2022-05-30 12:40:57', '', '2022-05-30 12:42:29', '');

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
(42, '6', 'shop_id', '商品id', 'varchar(64)', 'String', 'shopId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(43, '6', 'shop_name', '商品名称', 'varchar(256)', 'String', 'shopName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(44, '6', 'shop_img', '商品主图', 'varchar(1024)', 'String', 'shopImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(45, '6', 'shop_index', '商品详情页链接地址', 'varchar(1024)', 'String', 'shopIndex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(46, '6', 'home_name', '店铺名称', 'varchar(128)', 'String', 'homeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(47, '6', 'shop_price', '商品价格(单位：元)', 'decimal(10,2)', 'BigDecimal', 'shopPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(48, '6', 'shop_sales', '商品月销量', 'int(11)', 'Long', 'shopSales', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(49, '6', 'income_ratio', '收入比率(%)', 'double', 'Long', 'incomeRatio', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(50, '6', 'commission', '佣金', 'decimal(10,2)', 'BigDecimal', 'commission', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(51, '6', 'wang_name', '卖家旺旺', 'varchar(128)', 'String', 'wangName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(52, '6', 'sort_url', '淘宝客短链接(300天内有效)', 'varchar(128)', 'String', 'sortUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(53, '6', 'taoke_url', '淘宝客链接', 'varchar(1024)', 'String', 'taokeUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(54, '6', 'coupon_count', '优惠券总量', 'int(11)', 'Long', 'couponCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(55, '6', 'coupon_num', '优惠券剩余量', 'int(11)', 'Long', 'couponNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(56, '6', 'coupon_price', '优惠券面额', 'decimal(10,2)', 'BigDecimal', 'couponPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(57, '6', 'coupon_start_time', '优惠券开始时间', 'datetime', 'Date', 'couponStartTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(58, '6', 'coupon_end_time', '优惠券结束时间', 'datetime', 'Date', 'couponEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(59, '6', 'coupon_url', '优惠券链接', 'varchar(1024)', 'String', 'couponUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 18, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(60, '6', 'coupon_code', '优惠券淘口令(30天内有效)', 'varchar(128)', 'String', 'couponCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(61, '6', 'coupon_sort_url', '优惠券短链接(300天内有效)', 'varchar(128)', 'String', 'couponSortUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2022-05-30 12:40:57', NULL, '2022-05-30 12:42:29'),
(62, '6', 'market_is', '是否为营销计划商品', 'varchar(2)', 'String', 'marketIs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(63, '6', 'group_num', '拼团人数', 'int(11)', 'Long', 'groupNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(64, '6', 'group_price', '拼团价', 'decimal(10,2)', 'BigDecimal', 'groupPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(65, '6', 'group_commission', '团队佣金比例', 'decimal(10,2)', 'BigDecimal', 'groupCommission', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(66, '6', 'group_start_time', '拼团开始时间', 'datetime', 'Date', 'groupStartTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 25, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(67, '6', 'group_end_time', '拼团结束时间', 'datetime', 'Date', 'groupEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 26, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(68, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 27, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(69, '6', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 28, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(70, '6', 'remark', '备注', 'varchar(1024)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 29, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(71, '6', 'shop_fettle', '商品状态', 'tinyint(1)', 'Integer', 'shopFettle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(72, '6', 'shop_content', '内容描述', 'text', 'String', 'shopContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 31, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29'),
(73, '6', 'tao_type', '联盟来源', 'tinyint(1)', 'Integer', 'taoType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 32, 'admin', '2022-05-30 12:40:58', NULL, '2022-05-30 12:42:29');

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
(1, '1', '2022-02-15 09:03:23', 'logo_hw.png', 27609, 'image\\2022\\02\\15\\f1ae3517-b158-48ed-8f8d-45e5847e84eb.png', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/png', NULL, 0, 0),
(23, '1', '2022-05-09 02:06:14', 'QJ8518313644.jpg', 121178, 'image\\2022\\05\\09\\QJ8518313644_20220509020614A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(28, '1', '2022-05-10 20:08:40', 'thumb-1920-337990.jpg', 139261, 'image\\2022\\05\\10\\thumb-1920-337990_20220510200839A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(29, '1', '2022-05-11 20:59:36', 'QJ8454619350.jpg', 134514, 'image\\2022\\05\\11\\QJ8454619350_20220511205935A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(30, '1', '2022-05-13 09:09:41', '文档模拟.docx', 11197, 'document\\2022\\05\\13\\WDMN_20220513090940A001.docx', 'document', 'http://127.0.0.1:8090/oss/download/', 'application/zip', NULL, 0, 0),
(31, '1', '2022-05-14 06:41:24', 'QJ8454619350.jpg', 134514, 'image\\2022\\05\\14\\QJ8454619350_20220514064123A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(32, '1', '2022-05-15 09:05:50', 'thumb-1920-399827.jpg', 167963, 'image\\2022\\05\\15\\thumb-1920-399827_20220515090549A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(33, '1', '2022-05-15 11:48:16', 'QJ8454619350.jpg', 134514, 'image/2022/05/15/QJ8454619350_20220515114815A002.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(34, '1', '2022-05-17 22:51:23', 'QJ8454619350.jpg', 134514, 'image/2022/05/17/QJ8454619350_20220517225122A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(35, '1', '2022-05-17 22:51:56', 'QJ8518313644.jpg', 121178, 'image/2022/05/17/QJ8518313644_20220517225156A002.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(36, '1', '2022-05-17 22:52:29', 'QJ8454619350.jpg', 134514, 'image/2022/05/17/QJ8454619350_20220517225229A003.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(37, '1', '2022-05-17 22:53:55', 'QJ8518313644.jpg', 121178, 'image/2022/05/17/QJ8518313644_20220517225355A004.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(38, '1', '2022-05-18 19:18:21', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(39, '1', '2022-05-18 19:36:14', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/18/thumb-1920-337990_20220518193613A002.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(40, '1', '2022-05-19 23:37:05', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(41, '1', '2022-05-20 16:38:53', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(42, '1', '2022-05-28 18:01:09', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/28/thumb-1920-337990_20220528180109A001.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(43, '1', '2022-05-28 18:02:29', 'thumb-1920-399827.jpg', 167963, 'image/2022/05/28/thumb-1920-399827_20220528180228A002.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(44, '1', '2022-05-28 18:03:04', 'thumb-1920-337990.jpg', 139261, 'image/2022/05/28/thumb-1920-337990_20220528180304A003.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(45, '1', '2022-05-28 18:05:23', 'QJ8454619350.jpg', 134514, 'image/2022/05/28/QJ8454619350_20220528180523A004.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(46, '1', '2022-05-28 18:07:14', 'QJ8518313644.jpg', 121178, 'image/2022/05/28/QJ8518313644_20220528180713A005.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0),
(47, '1', '2022-05-28 18:09:15', 'QJ8518313644.jpg', 121178, 'image/2022/05/28/QJ8518313644_20220528180915A006.jpg', 'image', 'http://127.0.0.1:8090/oss/download/', 'image/jpeg', NULL, 0, 0);

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

--
-- 转存表中的数据 `oly_template`
--

INSERT INTO `oly_template` (`template_id`, `template_name`, `parent_id`, `create_by`, `update_by`, `create_time`, `update_time`, `template_type`, `visible`, `built`, `perms`, `order_num`, `ancestors`, `template_url`, `template_param`, `remark`) VALUES
(2, 'cesh', 0, 1, 1, '2022-04-25 16:21:42', '2022-04-25 16:32:31', 0, 1, 0, NULL, 1, NULL, NULL, '{\n  \"ni\": \"你好\"\n}', '1');

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
(1, 'sysIndex', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 0x736b696e2d79656c6c6f77, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-29 05:24:18', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', 3),
(2, 'sysUser', '用户管理-账号初始密码', 'sys.user.initPassword', 0x313233343536, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-24 01:55:13', '初始化密码 123456', 3),
(3, 'sysIndex', '主框架页-侧边栏主题', 'sys.index.sideTheme', 0x7468656d652d6461726b, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-29 05:24:18', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue', 3),
(4, 'sysUser', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 0x74727565, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-24 01:55:13', '是否开启注册用户功能（true开启，false关闭）', 2),
(5, 'sysUser', '用户管理-密码字符范围', 'sys.account.chrtype', 0x30, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-24 01:55:13', '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）', 0),
(6, 'sysUser', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', 0x30, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-24 01:55:13', '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框', 0),
(7, 'sysUser', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', 0x30, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-24 01:55:13', '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框', 0),
(8, 'sysIndex', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 0x746f706e6176, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-29 05:24:18', '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）', 3),
(9, 'sysIndex', '主框架页-是否开启页脚', 'sys.index.footer', 0x74727565, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-23 00:41:58', '是否开启底部页脚显示（true显示，false隐藏）', 3),
(10, 'sysIndex', '主框架页-是否开启页签', 'sys.index.tagsView', 0x74727565, 0, 'admin', '2022-01-13 08:17:25', 'admin', '2022-04-23 00:42:07', '是否开启菜单多页签显示（true显示，false隐藏）', 3),
(100, 'test', '测试参数', 'test.ui', 0x31, NULL, 'admin', '2022-02-02 08:28:02', '', NULL, NULL, 0),
(101, 'ossConfig', 'oly.oss.used', 'oly.oss.used', 0x6e6174697665, NULL, 'admin', '2022-02-17 08:54:16', 'admin', '2022-03-30 20:31:33', NULL, 3),
(102, 'mailConfig', 'oly.mail.from.name', 'oly.mail.from.name', 0x68757368, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:14', NULL, 3),
(103, 'mailConfig', 'oly.mail.host', 'oly.mail.host', 0x736d74702e3136332e636f6d, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:14', NULL, 3),
(104, 'mailConfig', 'oly.mail.protocol', 'oly.mail.protocol', 0x736d7470, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:14', NULL, 3),
(105, 'mailConfig', 'oly.mail.ssl.port', 'oly.mail.ssl.port', 0x343635, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:14', NULL, 3),
(106, 'mailConfig', 'oly.mail.username', 'oly.mail.username', 0x6d3137363738393939343438403136332e636f6d, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:14', NULL, 3),
(107, 'mailConfig', 'oly.mail.password', 'oly.mail.password', 0x6d363334383636353533, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:15', NULL, 3),
(108, 'mailConfig', 'oly.mail.enabled', 'oly.mail.enabled', 0x74727565, NULL, 'admin', '2022-03-07 21:20:26', 'admin', '2022-05-16 17:38:15', NULL, 3),
(109, 'ossConfig', 'oly.oss.native.domain', 'oly.oss.native.domain', 0x687474703a2f2f3132372e302e302e313a383039302f6f73732f646f776e6c6f61642f, NULL, 'admin', '2022-03-08 22:25:25', 'admin', '2022-05-16 17:38:22', NULL, 3),
(110, 'ossConfig', 'oly.oss.qiniu.domain', 'oly.oss.qiniu.domain', 0x366766666464, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:36', NULL, 3),
(111, 'ossConfig', 'oly.oss.qiniu.access.key', 'oly.oss.qiniu.access.key', 0x6664766676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:36', NULL, 3),
(112, 'ossConfig', 'oly.oss.qiniu.secret.key', 'oly.oss.qiniu.secret.key', 0x7676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:36', NULL, 3),
(113, 'ossConfig', 'oly.oss.qiniu.bucket', 'oly.oss.qiniu.bucket', 0x6676, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:36', NULL, 3),
(114, 'ossConfig', 'oly.oss.qiniu.zone', 'oly.oss.qiniu.zone', 0x766476, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:37', NULL, 3),
(115, 'ossConfig', 'oly.oss.qiniu.style.rule', 'oly.oss.qiniu.style.rule', 0x76786376, NULL, 'admin', '2022-03-08 22:29:44', 'admin', '2022-05-05 09:00:37', NULL, 3),
(116, 'themeConfig', '使用主题', 'oly.theme.used', 0x7a67626c6f67, 1, 'admin', '2022-03-25 13:12:25', 'admin', '2022-04-02 21:28:19', '使用主题', 3),
(117, 'zgcms', 'oly.web.theme.zgcms.cat.style', 'oly.web.theme.zgcms.cat.style', 0x31, 1, 'admin', '2022-03-25 23:37:19', 'admin', '2022-05-26 19:15:51', '', 3),
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
(133, 'cmsConfig', 'oly.cms.articleCat.maxNum', 'oly.cms.articleCat.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(134, 'cmsConfig', 'oly.cms.articleTag.maxNum', 'oly.cms.articleTag.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(135, 'cmsConfig', 'oly.cms.articleKeyword.maxNum', 'oly.cms.articleKeyword.maxNum', 0x3130, NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(136, 'cmsConfig', 'oly.cms.articleImg.maxNum', 'oly.cms.articleImg.maxNum', 0x32, NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(137, 'cmsConfig', 'oly.cms.articleUrl.fixedPrefix', 'oly.cms.articleUrl.fixedPrefix', '', NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(138, 'cmsConfig', 'oly.cms.articleVisible.default', 'oly.cms.articleVisible.default', 0x32, NULL, 'admin', '2022-03-28 11:53:28', 'admin', '2022-05-22 22:24:28', NULL, 3),
(139, 'webConfig', 'oly.theme.more', 'oly.theme.more', 0x74727565, NULL, 'admin', '2022-03-29 14:49:03', '', NULL, NULL, 3),
(140, 'webConfig', 'oly.theme.setting', 'oly.theme.setting', 0x74727565, NULL, 'admin', '2022-03-29 14:49:03', '', NULL, NULL, 3),
(141, 'themeConfig', 'oly.theme.more', 'oly.theme.more', 0x74727565, NULL, 'admin', '2022-03-29 14:51:47', 'admin', '2022-05-16 17:38:45', NULL, 3),
(142, 'themeConfig', 'oly.theme.setting', 'oly.theme.setting', 0x74727565, NULL, 'admin', '2022-03-29 14:51:48', 'admin', '2022-05-16 17:38:45', NULL, 3),
(143, 'zgcms', 'oly.web.theme.zgcms.menu.main', 'oly.web.theme.zgcms.menu.main', 0x31, NULL, 'admin', '2022-03-30 13:42:09', '', NULL, NULL, 3),
(144, 'zgblog', 'oly.theme.more', 'oly.theme.more', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:48:26', NULL, 3),
(145, 'zgblog', 'oly.web.comment.staus', 'oly.web.comment.staus', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-03-31 23:49:25', NULL, 3),
(146, 'zgblog', 'oly.web.countCode', 'oly.web.countCode', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-05-22 22:24:15', NULL, 3),
(147, 'zgblog', 'oly.web.post.copyright', 'oly.web.post.copyright', '', NULL, 'admin', '2022-03-31 23:47:23', 'admin', '2022-05-22 22:24:15', NULL, 3),
(148, 'zgblog', 'oly.web.comment.enable', 'oly.web.comment.enable', 0x74727565, NULL, 'admin', '2022-03-31 23:49:25', 'admin', '2022-05-26 20:57:59', NULL, 3),
(149, 'zgblog', 'oly.web.title', 'oly.web.title', 0xe6ada2e68888e58d9ae5aea2, NULL, 'admin', '2022-04-01 23:07:03', 'admin', '2022-05-26 20:54:53', NULL, 3),
(150, 'zgblog', 'oly.web.index', 'oly.web.index', 0x2f696e646578, NULL, 'admin', '2022-04-01 23:07:03', 'admin', '2022-05-26 20:54:53', NULL, 3),
(151, 'zgblog', 'oly.web.logo', 'oly.web.logo', '', NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-05-26 20:54:53', NULL, 3),
(152, 'zgblog', 'oly.web.ico', 'oly.web.ico', '', NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-05-26 20:54:53', NULL, 3),
(153, 'zgblog', 'oly.web.footer', 'oly.web.footer', 0x3c6120687265663d2268747470733a2f2f626569616e2e6d6969742e676f762e636e2f22207461726765743d225f626c616e6b22203ee9bb94494350e5a4873139303031343734e58fb72d333c2f613e, NULL, 'admin', '2022-04-01 23:07:04', 'admin', '2022-05-26 20:54:53', NULL, 3),
(154, 'zgcms', 'oly.web.domain', 'oly.web.domain', NULL, NULL, 'admin', '2022-04-02 18:23:19', '', NULL, NULL, 3),
(155, 'zgblog', 'oly.web.domain', 'oly.web.domain', 0x687474703a2f2f3132372e302e302e313a38303930, NULL, 'admin', '2022-04-02 21:36:58', 'admin', '2022-05-26 20:54:53', NULL, 3),
(156, 'zgblog', 'oly.web.theme.zgblog.cat.style', 'oly.web.theme.zgblog.cat.style', 0x3130, NULL, 'admin', '2022-04-04 23:57:19', 'admin', '2022-04-05 00:11:39', NULL, 3),
(157, 'zgblog', 'oly.web.theme.zgblog.cat.app', 'oly.web.theme.zgblog.cat.app', 0x3130, NULL, 'admin', '2022-04-04 23:57:19', 'admin', '2022-04-05 00:11:39', NULL, 3),
(158, 'zgblog', 'oly.web.theme.zgblog.menu.main', 'oly.web.theme.zgblog.menu.main', 0x38, NULL, 'admin', '2022-04-04 23:57:26', '1', '2022-04-24 10:30:27', NULL, 3),
(159, 'zgblog', 'oly.web.theme.zgblog.post.now', 'oly.web.theme.zgblog.post.now', 0x3130, NULL, 'admin', '2022-04-05 00:13:02', 'admin', '2022-05-22 22:24:49', NULL, 3),
(160, 'zgblog', 'oly.web.theme.zgblog.post.reard', 'oly.web.theme.zgblog.post.reard', 0x3130, NULL, 'admin', '2022-04-05 00:13:02', '', NULL, NULL, 3),
(161, 'zgblog', 'oly.web.theme.zgblog.post.top', 'oly.web.theme.zgblog.post.top', 0x3130, NULL, 'admin', '2022-04-05 00:51:02', 'admin', '2022-05-22 22:24:49', NULL, 3),
(162, 'zgblog', 'oly.web.theme.zgblog.post.look', 'oly.web.theme.zgblog.post.look', 0x3130, NULL, 'admin', '2022-04-05 00:51:02', 'admin', '2022-05-22 22:24:49', NULL, 3),
(163, 'sysCommon', 'sys.common.title', 'sys.common.title', 0xe6ada2e68888e5bbbae7ab99e7b3bbe7bb9f, NULL, 'admin', '2022-04-23 01:15:23', 'admin', '2022-05-28 04:29:55', NULL, 3),
(164, 'sysCommon', 'sys.common.description', 'sys.common.description', 0xe6ada2e68888e5bbbae7ab99e7b3bbe7bb9f, NULL, 'admin', '2022-04-23 01:15:23', 'admin', '2022-05-28 04:29:55', NULL, 3),
(165, 'sysCommon', 'sys.common.logo', 'sys.common.logo', 0x687474703a2f2f3132372e302e302e313a383039302f6f73732f646f776e6c6f61642f6176617461722f323032322f30332f31302f626c6f625f3230323230333130323233363239413030312e706e67, NULL, 'admin', '2022-04-23 01:15:23', 'admin', '2022-05-28 04:29:55', NULL, 3),
(166, 'sysCommon', 'sys.common.ico', 'sys.common.ico', 0x687474703a2f2f3132372e302e302e313a383039302f6f73732f646f776e6c6f61642f6176617461722f323032322f30332f31302f626c6f625f3230323230333130323233363239413030312e706e67, NULL, 'admin', '2022-04-23 01:15:23', 'admin', '2022-05-28 04:29:55', NULL, 3),
(167, 'sysCommon', 'sys.common.footer', 'sys.common.footer', 0x3c6120687265663d2268747470733a2f2f626569616e2e6d6969742e676f762e636e2f22207461726765743d225f626c616e6b222020636c6173733d2262746e2d6c696e6b223ee9bb94494350e5a4873139303031343734e58fb72d333c2f613ec2a93c7370616e2074683a746578743d22247b2364617465732e666f726d6174286e6577206a6176612e7574696c2e4461746528292e67657454696d6528292c20277979797927297d223e3c2f7370616e3e0d0a3c6120687265663d222f22207461726765743d225f626c616e6b222020636c6173733d2262746e2d6c696e6b223ee6ada2e688883c2f613ee78988e69d83e68980e69c89, NULL, 'admin', '2022-04-23 01:15:23', 'admin', '2022-05-28 04:29:55', NULL, 3),
(168, 'sysIndex', 'sys.index.ignoreFooter', 'sys.index.ignoreFooter', 0x74727565, NULL, 'admin', '2022-04-23 07:59:56', 'admin', '2022-05-29 05:24:18', NULL, 3),
(169, 'commentConfig', 'oly.comment.open', 'oly.comment.open', 0x66616c7365, NULL, 'admin', '2022-05-03 05:00:08', 'admin', '2022-05-03 05:04:18', NULL, 3),
(170, 'commentConfig', 'oly.comment.reply', 'oly.comment.reply', '', NULL, 'admin', '2022-05-03 05:00:08', 'admin', '2022-05-03 05:04:18', NULL, 3),
(171, 'commentConfig', 'oly.comment.defauleVisible', 'oly.comment.defauleVisible', 0x30, NULL, 'admin', '2022-05-03 05:00:08', 'admin', '2022-05-03 05:04:18', NULL, 3),
(172, 'commentConfig', 'oly.comment.oneSize', 'oly.comment.oneSize', 0x3130, NULL, 'admin', '2022-05-03 05:00:08', 'admin', '2022-05-03 05:04:18', NULL, 3),
(173, 'ossConfig', 'oly.oss.support.type', 'oly.oss.support.type', '', NULL, 'admin', '2022-05-14 06:40:58', 'admin', '2022-05-16 17:38:22', NULL, 3),
(176, 'sysUser', 'sys.account.defaultRoleIds', 'sys.account.defaultRoleIds', 0x32, NULL, 'admin', '2022-05-23 22:35:59', 'admin', '2022-05-24 01:55:13', NULL, 3),
(177, 'sysUser', 'sys.account.defaultPostIds', 'sys.account.defaultPostIds', 0x32, NULL, 'admin', '2022-05-23 22:35:59', 'admin', '2022-05-24 01:55:13', NULL, 3),
(178, 'sysUser', 'sys.account.defaultDept', 'sys.account.defaultDept', 0x313033, NULL, 'admin', '2022-05-23 23:32:34', 'admin', '2022-05-24 01:55:13', '', 3),
(179, 'zgblog', 'oly.web.article.supportType', 'oly.web.article.supportType', '', NULL, 'admin', '2022-05-25 23:15:31', 'admin', '2022-05-26 20:57:59', NULL, 3),
(180, 'zgblog', 'oly.web.author', 'oly.web.author', 0xe6ada2e68888, NULL, 'admin', '2022-05-26 20:41:43', '', NULL, NULL, 3),
(181, 'zgblog', 'oly.web.copyright', 'oly.web.copyright', NULL, NULL, 'admin', '2022-05-26 20:41:43', '', NULL, NULL, 3),
(182, 'zgblog', 'oly.web.keywords', 'oly.web.keywords', NULL, NULL, 'admin', '2022-05-26 20:41:43', '', NULL, NULL, 3),
(183, 'zgblog', 'oly.web.description', 'oly.web.description', NULL, NULL, 'admin', '2022-05-26 20:41:44', '', NULL, NULL, 3),
(184, 'sysLogin', 'sys.login.back', 'sys.login.back', 0x687474703a2f2f3132372e302e302e313a383039302f6f73732f646f776e6c6f61642f696d6167652f323032322f30352f30392f514a383531383331333634345f3230323230353039303230363134413030312e6a7067, NULL, 'admin', '2022-05-27 10:26:47', 'admin', '2022-05-28 02:08:30', NULL, 3),
(185, 'sysLogin', 'sys.login.info', 'sys.login.info', 0x2020203c756c20636c6173733d226d2d62223e0d0a2020202020202020202020202020202020202020202020203c6c693e3c6920636c6173733d2266612066612d6172726f772d636972636c652d6f2d7269676874206d2d722d7873223e3c2f693e20537072696e67426f6f743c2f6c693e0d0a2020202020202020202020202020202020202020202020203c6c693e3c6920636c6173733d2266612066612d6172726f772d636972636c652d6f2d7269676874206d2d722d7873223e3c2f693e204d7962617469733c2f6c693e0d0a2020202020202020202020202020202020202020202020203c6c693e3c6920636c6173733d2266612066612d6172726f772d636972636c652d6f2d7269676874206d2d722d7873223e3c2f693e20536869726f3c2f6c693e0d0a2020202020202020202020202020202020202020202020203c6c693e3c6920636c6173733d2266612066612d6172726f772d636972636c652d6f2d7269676874206d2d722d7873223e3c2f693e205468796d656c6561663c2f6c693e0d0a2020202020202020202020202020202020202020202020203c6c693e3c6920636c6173733d2266612066612d6172726f772d636972636c652d6f2d7269676874206d2d722d7873223e3c2f693e20426f6f7473747261703c2f6c693e0d0a20202020202020202020202020202020202020203c2f756c3e, NULL, 'admin', '2022-05-27 10:26:47', 'admin', '2022-05-28 02:08:30', NULL, 3),
(186, 'sysLogin', 'sys.login.msg', 'sys.login.msg', 0x74727565, NULL, 'admin', '2022-05-27 10:26:47', 'admin', '2022-05-28 02:08:30', NULL, 3),
(187, 'sysIndex', 'sys.index.demoMenu', 'sys.index.demoMenu', 0x74727565, NULL, 'admin', '2022-05-29 05:23:52', 'admin', '2022-05-29 05:24:18', NULL, 3);

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
(100, 0, '0', '建站系统', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', 'admin', '2022-05-04 06:16:21'),
(101, 100, '0,100', '系统管理', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', 'admin', '2022-05-04 06:16:40'),
(102, 100, '0,100', '网站用户', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', 'admin', '2022-05-04 06:17:07'),
(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 08:17:23', '', NULL),
(110, 102, '0,100,102', '测试部门', 1, NULL, NULL, NULL, '0', '0', 'admin', '2022-04-27 07:26:00', '', NULL);

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
(132, 0, '图文', '0', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-03-12 00:32:48', 'admin', '2022-05-24 19:50:29', '图文类型   基础类型'),
(133, 1, '隐藏', '0', 'cms_article_visible', '', 'warning', 'Y', '0', 'admin', '2021-03-12 00:34:53', 'admin', '2021-03-12 00:36:20', '相当于逻辑删除'),
(134, 2, '草稿', '1', 'cms_article_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-12 00:36:00', '', NULL, '保存未发布'),
(135, 3, '审核中', '2', 'cms_article_visible', NULL, 'warning', 'Y', '0', 'admin', '2021-03-12 00:37:27', '', NULL, NULL),
(136, 4, '通过', '3', 'cms_article_visible', NULL, 'info', 'Y', '0', 'admin', '2021-03-12 00:38:03', '', NULL, NULL),
(137, 1, '正常', '0', 'cms_article_top', NULL, 'primary', 'Y', '0', 'admin', '2021-03-12 00:40:11', '', NULL, NULL),
(138, 1, '正常', '0', 'oly_mail_used', NULL, 'primary', 'Y', '0', 'admin', '2021-04-12 22:19:13', '', NULL, NULL),
(139, 2, '验证码', '1', 'oly_mail_used', '', 'warning', 'Y', '0', 'admin', '2021-04-12 22:19:32', 'admin', '2021-04-12 22:19:38', ''),
(140, 3, '备份', '2', 'oly_mail_used', NULL, 'info', 'Y', '0', 'admin', '2021-04-12 22:20:01', '', NULL, NULL),
(143, 1, '长文', '1', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 17:26:16', 'admin', '2022-05-24 19:50:20', '长文限制1024个字符  基础类型'),
(144, 2, '问答', '2', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 17:29:57', 'admin', '2022-05-24 19:50:10', '问答类型  基础类型'),
(146, 0, '下架', '0', 'cms_union_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-04-24 17:42:21', '', NULL, '下架'),
(147, 1, '待上架', '1', 'cms_union_visible', NULL, 'info', 'Y', '0', 'admin', '2021-04-24 17:42:57', '', NULL, '等待上架'),
(148, 2, '上架', '2', 'cms_union_visible', NULL, 'success', 'Y', '0', 'admin', '2021-04-24 18:01:23', '', NULL, NULL),
(149, 3, '推荐', '3', 'cms_union_visible', NULL, 'warning', 'Y', '0', 'admin', '2021-04-24 18:01:53', '', NULL, NULL),
(150, 0, '淘宝', 'TB', 'cms_union_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 18:39:37', 'admin', '2022-06-01 22:36:27', ''),
(151, 1, '京东', 'JD', 'cms_union_type', '', 'success', 'Y', '0', 'admin', '2021-04-24 18:39:59', 'admin', '2022-06-01 22:36:37', ''),
(152, 2, '苏宁', 'SN', 'cms_union_type', '', 'info', 'Y', '1', 'admin', '2021-04-24 18:40:18', 'admin', '2022-06-01 22:37:03', ''),
(153, 3, '拼多多', 'PDD', 'cms_union_type', '', 'info', 'Y', '1', 'admin', '2021-04-24 18:40:46', 'admin', '2022-06-01 22:36:55', ''),
(156, 3, '推荐', '2', 'cms_tag_visible', NULL, 'info', 'Y', '0', 'admin', '2021-05-09 18:04:50', '', NULL, NULL),
(157, 2, '推荐', '2', 'cms_column_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-09 18:05:32', '', NULL, NULL),
(158, 2, '推荐', '2', 'cms_cat_visible', NULL, 'primary', 'Y', '0', 'admin', '2021-05-09 18:10:39', '', NULL, NULL),
(162, 3, '影音', '3', 'cms_article_type', '', 'success', 'Y', '0', 'admin', '2021-05-18 10:28:03', 'admin', '2022-05-24 19:50:00', '包含视频音乐 基础类型'),
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
(176, 0, '图文', '0', 'cms_support_type', '', 'success', 'Y', '0', 'admin', '2021-06-24 15:42:49', 'admin', '2022-05-24 19:50:43', '图文类型 基础类型'),
(177, 1, '长文', '1', 'cms_support_type', '', 'primary', 'Y', '0', 'admin', '2021-07-02 10:57:15', 'admin', '2022-05-24 19:50:50', '长文限制1024  基础类型'),
(178, 2, '问答', '2', 'cms_support_type', '', 'primary', 'Y', '0', 'admin', '2021-07-02 10:59:23', 'admin', '2022-05-24 19:50:58', '问答类型  基础类型'),
(179, 3, '影音', '3', 'cms_support_type', '', 'success', 'Y', '0', 'admin', '2021-07-07 21:39:46', 'admin', '2022-05-24 19:51:08', '包含视频音乐图片等  基础类型'),
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
(199, 1, '顶部', 'topnav', 'sys_index_menu_style', NULL, 'success', 'Y', '0', 'admin', '2022-04-23 23:56:26', '', NULL, 'topnav顶部'),
(200, 5, '投票', '5', 'cms_article_type', '', 'warning', 'Y', '0', 'admin', '2022-05-24 19:49:39', 'admin', '2022-05-24 19:49:52', '投票类型 基础类型'),
(201, 4, '投票', '4', 'cms_support_type', '', 'warning', 'Y', '0', 'admin', '2022-05-24 19:53:31', 'admin', '2022-05-25 23:28:58', '投票类型  基础类型');

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
(118, '商品状态', 'cms_union_visible', '0', 'admin', '2021-04-24 17:41:31', 'admin', '2022-05-30 23:54:06', '商品状态'),
(119, '联盟类型', 'cms_union_type', '0', 'admin', '2021-04-24 18:07:27', 'admin', '2022-05-30 23:54:31', ''),
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
(373, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 10:28:47'),
(374, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 20:11:39'),
(375, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-24 20:48:18'),
(376, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 00:57:00'),
(377, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 05:44:26'),
(378, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 10:25:29'),
(379, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 11:12:22'),
(380, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 11:58:08'),
(381, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 19:44:55'),
(382, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 20:33:38'),
(383, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 23:28:51'),
(384, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-25 23:43:32'),
(385, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 00:18:37'),
(386, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-26 01:56:22'),
(387, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 01:56:26'),
(388, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 04:02:11'),
(389, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 04:02:11'),
(390, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-26 04:02:11'),
(391, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-26 06:10:41'),
(392, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 06:10:41'),
(393, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 11:40:19'),
(394, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 11:52:01'),
(395, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 19:48:48'),
(396, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 22:59:33'),
(397, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-26 23:43:31'),
(398, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 03:21:24'),
(399, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 07:09:21'),
(400, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 08:21:58'),
(401, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 09:08:49'),
(402, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 22:30:11'),
(403, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-27 22:33:19'),
(404, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 00:49:40'),
(405, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 00:53:37'),
(406, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 09:12:57'),
(407, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 10:02:30'),
(408, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 11:19:33'),
(409, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 11:55:25'),
(410, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-28 23:17:37'),
(411, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 02:42:35'),
(412, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-04-29 02:43:52'),
(413, 'ruoyi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-04-29 02:44:02'),
(414, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 02:44:32'),
(415, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 04:55:35'),
(416, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 05:55:24'),
(417, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 06:10:23'),
(418, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 06:16:33'),
(419, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 06:21:42'),
(420, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 06:24:04'),
(421, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-04-29 07:03:53'),
(422, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 07:03:59'),
(423, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 08:03:46'),
(424, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 09:20:38'),
(425, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 10:15:32'),
(426, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-29 23:27:07'),
(427, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 04:23:53'),
(428, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 06:01:36'),
(429, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 06:09:07'),
(430, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 08:49:24'),
(431, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 09:40:14'),
(432, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 12:12:30'),
(433, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 22:02:35'),
(434, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-30 23:33:30'),
(435, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-01 03:18:19'),
(436, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-01 05:30:00'),
(437, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-01 09:38:05'),
(438, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-01 15:13:43'),
(439, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 00:42:34'),
(440, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 00:46:30'),
(441, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 09:39:37'),
(442, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-02 11:57:17'),
(443, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 11:57:21'),
(444, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 12:15:01'),
(445, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 14:39:26'),
(446, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-02 23:26:22'),
(447, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 04:58:33'),
(448, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-03 06:16:08'),
(449, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 06:16:13'),
(450, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-03 07:42:46'),
(451, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 07:42:50'),
(452, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 07:46:03'),
(453, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 10:04:08'),
(454, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 10:04:24'),
(455, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 10:05:49'),
(456, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 10:06:00'),
(457, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 10:07:18'),
(458, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-03 10:07:36'),
(459, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 18:58:00'),
(460, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 19:11:20'),
(461, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-03 21:04:10'),
(462, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 04:11:04'),
(463, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 06:13:16'),
(464, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 07:40:29'),
(465, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 10:17:00'),
(466, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 12:21:12'),
(467, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 12:37:50'),
(468, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 17:04:09'),
(469, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:17:30'),
(470, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 18:23:07'),
(471, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:23:22'),
(472, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 18:23:42'),
(473, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 18:50:34'),
(474, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-04 18:50:34'),
(475, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:50:34'),
(476, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 18:50:34'),
(477, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 18:50:34'),
(478, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-04 18:50:34'),
(479, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-04 21:18:02'),
(480, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 03:23:13'),
(481, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 03:23:13'),
(482, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-05 03:23:13'),
(483, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-05 03:23:13'),
(484, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 03:23:13'),
(485, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-05 03:23:13'),
(486, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 03:23:13'),
(487, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-05 03:23:13'),
(488, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-05 03:23:14'),
(489, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 03:23:14'),
(490, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 04:15:30'),
(491, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-05 08:23:35'),
(492, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 05:45:08'),
(493, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-06 10:22:14'),
(494, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 14:12:36'),
(495, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 14:27:29'),
(496, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-08 16:53:40'),
(497, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 02:05:45'),
(498, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 07:55:37'),
(499, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-09 08:01:23'),
(500, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 08:01:32'),
(501, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 08:12:17'),
(502, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 09:12:56'),
(503, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 12:39:13'),
(504, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 20:00:36'),
(505, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-10 20:08:06'),
(506, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 07:41:18'),
(507, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 10:16:03'),
(508, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-11 10:34:46'),
(509, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-11 10:34:55'),
(510, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-11 10:35:03'),
(511, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 10:35:09'),
(512, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 12:02:24'),
(513, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-11 20:58:36'),
(514, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 10:31:34'),
(515, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 18:49:51'),
(516, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 19:42:16'),
(517, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 08:25:29'),
(518, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 09:09:10'),
(519, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 06:36:43'),
(520, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 16:02:10'),
(521, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 17:23:35'),
(522, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-14 17:25:17'),
(523, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 17:25:30'),
(524, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 18:42:30'),
(525, 'cmsAdmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 20:35:12'),
(526, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 23:30:42'),
(527, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-14 23:48:35'),
(528, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 00:28:40'),
(529, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 09:05:07'),
(530, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 11:47:24'),
(531, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 21:32:34'),
(532, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 21:46:55'),
(533, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 22:01:32'),
(534, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 22:06:54'),
(535, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 22:14:19'),
(536, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 22:17:26'),
(537, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-15 22:22:36'),
(538, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 22:22:40'),
(539, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 10:14:21'),
(540, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 17:37:28'),
(541, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 19:43:27'),
(542, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 20:56:34'),
(543, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 21:11:57'),
(544, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-16 21:14:13'),
(545, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 21:14:18'),
(546, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 21:19:40'),
(547, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 06:40:18'),
(548, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 08:55:36'),
(549, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-17 09:07:47'),
(550, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-17 09:07:51'),
(551, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 09:07:57'),
(552, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 10:17:17'),
(553, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 10:21:43'),
(554, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 11:54:19'),
(555, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 16:16:09'),
(556, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 20:45:06'),
(557, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 21:25:49'),
(558, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 22:49:08'),
(559, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 23:43:47'),
(560, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-18 17:27:16'),
(561, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-18 17:27:19'),
(562, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-18 19:13:00'),
(563, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-18 19:13:06'),
(564, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-19 18:03:27'),
(565, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 18:03:31'),
(566, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-19 19:35:58'),
(567, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 19:36:04'),
(568, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 19:59:10'),
(569, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 21:14:50'),
(570, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 22:59:24'),
(571, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 23:15:01'),
(572, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-19 23:36:15'),
(573, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 10:16:18'),
(574, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 11:01:09'),
(575, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 12:02:49'),
(576, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 16:06:22'),
(577, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 23:47:30'),
(578, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-21 00:38:44'),
(579, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-21 07:40:44'),
(580, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-22 12:46:38'),
(581, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-22 20:46:44'),
(582, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-22 22:01:41'),
(583, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-22 23:00:13'),
(584, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-22 23:21:36'),
(585, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 01:02:31'),
(586, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 07:41:54'),
(587, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-23 15:12:37'),
(588, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-23 15:12:53'),
(589, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 15:12:58'),
(590, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-23 15:16:30'),
(591, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 15:16:45'),
(592, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-23 15:20:03'),
(593, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 15:20:40'),
(594, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 18:45:38'),
(595, 'testUser', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-23 20:36:16'),
(596, 'testUser', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 20:36:31'),
(597, 'testUser', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-23 20:36:40'),
(598, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 20:36:46'),
(599, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-23 20:37:42'),
(600, 'testUser', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 20:37:53'),
(601, 'testUser', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-23 20:38:23'),
(602, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 20:38:31'),
(603, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 22:31:42'),
(604, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-23 23:45:41'),
(605, 'test2', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-05-24 01:24:35'),
(606, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 01:24:46'),
(607, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 13:28:31'),
(608, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 19:07:22');
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
(609, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 21:11:42'),
(610, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-24 23:25:17'),
(611, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 22:45:19'),
(612, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 23:03:00'),
(613, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 23:06:58'),
(614, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 23:10:04'),
(615, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 01:34:28'),
(616, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 10:36:48'),
(617, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 15:49:45'),
(618, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-26 17:58:24'),
(619, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 17:58:28'),
(620, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 19:15:14'),
(621, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 20:30:30'),
(622, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 21:55:03'),
(623, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 22:34:52'),
(624, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 22:58:44'),
(625, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 23:12:55'),
(626, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 23:14:31'),
(627, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-26 23:44:51'),
(628, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 23:44:55'),
(629, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 01:44:16'),
(630, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 02:31:23'),
(631, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 10:13:51'),
(632, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-27 10:26:03'),
(633, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 10:26:18'),
(634, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 11:25:36'),
(635, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 19:58:41'),
(636, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 21:16:12'),
(637, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 22:25:12'),
(638, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 01:54:19'),
(639, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 02:08:15'),
(640, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 04:22:40'),
(641, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-28 11:55:39'),
(642, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 11:55:45'),
(643, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 12:25:22'),
(644, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 17:47:42'),
(645, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 19:36:21'),
(646, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 21:51:47'),
(647, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 23:57:35'),
(648, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-28 23:57:35'),
(649, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-29 01:58:50'),
(650, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 01:58:55'),
(651, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 05:23:15'),
(652, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-29 12:45:12'),
(653, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-29 12:45:18'),
(654, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 12:45:27'),
(655, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 14:45:39'),
(656, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 16:49:53'),
(657, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 18:05:19'),
(658, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-29 23:37:15'),
(659, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 01:23:52'),
(660, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 12:38:18'),
(661, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 19:54:03'),
(662, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 20:00:36'),
(663, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-30 22:19:33'),
(664, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 22:21:09'),
(665, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-30 23:08:15'),
(666, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-05-31 15:38:58'),
(667, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 15:39:05'),
(668, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 16:05:33'),
(669, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 18:28:29'),
(670, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 19:03:09'),
(671, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 23:34:50'),
(672, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 00:03:29'),
(673, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-01 03:28:11'),
(674, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-01 03:28:16'),
(675, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-01 03:28:20'),
(676, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-01 03:28:27'),
(677, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 03:28:34'),
(678, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 03:34:18'),
(679, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 03:50:49'),
(680, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 22:35:08'),
(681, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 23:08:01'),
(682, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-06-01 23:33:50'),
(683, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 23:33:58'),
(684, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-01 23:39:03'),
(685, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-02 02:03:57');

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
(1069, '联盟管理', 1063, 1, '/cms/union', 'menuItem', 'C', '0', '1', 'cms:union:view', '#', 'admin', '2022-02-27 10:42:39', 'admin', '2022-05-30 20:02:26', ''),
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
(1084, '系统设置', 1, 1, '/system/config/setting', 'menuItem', 'C', '0', '1', 'system:config:view', '#', 'admin', '2022-04-23 01:03:52', 'admin', '2022-04-23 01:04:26', ''),
(1085, '个人中心', 0, 0, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-user', 'admin', '2022-04-26 04:13:18', 'admin', '2022-05-05 09:01:22', ''),
(1086, '个人资料', 1085, 1, '/system/user/profile', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-04-26 04:16:55', '', NULL, ''),
(1087, '内容中心', 1085, 1, '/cms/profile/user', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2022-04-26 06:09:48', 'admin', '2022-05-23 15:15:17', ''),
(1088, '评论管理', 1063, 9, '/cms/comment', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2022-05-02 14:42:48', '', NULL, ''),
(1089, '添加内容菜单', 1066, 1, '#', 'menuItem', 'F', '0', '1', 'cms:column:add', '#', 'admin', '2022-05-04 06:46:59', '', NULL, ''),
(1090, '删除内容菜单', 1066, 2, '#', 'menuItem', 'F', '0', '1', 'cms:column:remove', '#', 'admin', '2022-05-04 06:48:27', 'admin', '2022-05-04 06:49:03', ''),
(1091, '修改内容菜单', 1066, 3, '#', 'menuItem', 'F', '0', '1', 'cms:column:edit', '#', 'admin', '2022-05-04 06:50:56', 'admin', '2022-05-04 06:51:38', ''),
(1092, '查看内容菜单', 1066, 0, '#', 'menuItem', 'F', '0', '1', 'cms:column:view', '#', 'admin', '2022-05-04 06:53:19', '', NULL, ''),
(1093, '查看分类', 1067, 0, '#', 'menuItem', 'F', '0', '1', 'cms:cat:view', '#', 'admin', '2022-05-04 07:26:01', '', NULL, ''),
(1094, '添加分类', 1067, 1, '#', 'menuItem', 'F', '0', '1', 'cms:cat:add', '#', 'admin', '2022-05-04 07:27:04', '', NULL, ''),
(1095, '删除分类', 1067, 2, '#', 'menuItem', 'F', '0', '1', 'cms:cat:remove', '#', 'admin', '2022-05-04 07:27:46', '', NULL, ''),
(1096, '编辑分类', 1067, 3, '#', 'menuItem', 'F', '0', '1', 'cms:cat:edit', '#', 'admin', '2022-05-04 07:28:25', '', NULL, ''),
(1097, '查看标签', 1068, 0, '#', 'menuItem', 'F', '0', '1', 'cms:tag:view', '#', 'admin', '2022-05-04 07:41:50', '', NULL, ''),
(1098, '添加标签', 1068, 1, '#', 'menuItem', 'F', '0', '1', 'cms:tag:add', '#', 'admin', '2022-05-04 07:46:59', '', NULL, ''),
(1099, '删除标签', 1068, 3, '#', 'menuItem', 'F', '0', '1', 'cms:tag:remove', '#', 'admin', '2022-05-04 07:48:25', '', NULL, ''),
(1100, '修改标签', 1068, 4, '#', 'menuItem', 'F', '0', '1', 'cms:tag:edit', '#', 'admin', '2022-05-04 07:49:22', '', NULL, ''),
(1101, '查看主题', 1072, 1, '#', 'menuItem', 'F', '0', '1', 'cms:theme:view', '#', 'admin', '2022-05-04 07:52:07', '', NULL, ''),
(1102, '上传主题', 1072, 1, '#', 'menuItem', 'F', '0', '1', 'cms:theme:add', '#', 'admin', '2022-05-04 07:53:01', '', NULL, ''),
(1103, '删除主题', 1072, 3, '#', 'menuItem', 'F', '0', '1', 'cms:theme:remove', '#', 'admin', '2022-05-04 07:53:44', '', NULL, ''),
(1104, '修改主题', 1072, 4, '#', 'menuItem', 'F', '0', '1', 'cms:theme:edit', '#', 'admin', '2022-05-04 07:54:46', '', NULL, ''),
(1105, '查看外链', 1076, 1, '#', 'menuItem', 'F', '0', '1', 'cms:link:view', '#', 'admin', '2022-05-04 07:55:31', '', NULL, ''),
(1106, '添加外链', 1076, 1, '#', 'menuItem', 'F', '0', '1', 'cms:link:add', '#', 'admin', '2022-05-04 07:56:07', '', NULL, ''),
(1107, '修改外链', 1076, 3, '#', 'menuItem', 'F', '0', '1', 'cms:link:edit', '#', 'admin', '2022-05-04 07:56:40', '', NULL, ''),
(1108, '删除外链', 1076, 4, '#', 'menuItem', 'F', '0', '1', 'cms:link:remove', '#', 'admin', '2022-05-04 07:57:21', '', NULL, ''),
(1109, '获取内容菜单', 1066, 0, '#', 'menuItem', 'F', '0', '1', 'cms:column:list', '#', 'admin', '2022-05-04 18:50:39', 'admin', '2022-05-04 18:51:47', ''),
(1110, '分类列表', 1067, 0, '#', 'menuItem', 'F', '0', '1', 'cms:cat:list', '#', 'admin', '2022-05-04 18:53:02', '', NULL, ''),
(1111, '标签列表', 1068, 0, '#', 'menuItem', 'F', '0', '1', 'cms:tag:list', '#', 'admin', '2022-05-04 18:53:58', '', NULL, ''),
(1112, '主题列表', 1072, 0, '#', 'menuItem', 'F', '0', '1', 'cms:theme:list', '#', 'admin', '2022-05-04 18:55:13', '', NULL, ''),
(1113, '查看文章', 1070, 0, '#', 'menuItem', 'F', '0', '1', 'cms:article:view', '#', 'admin', '2022-05-04 21:18:37', '', NULL, ''),
(1114, '文章列表', 1070, 1, '#', 'menuItem', 'F', '0', '1', 'cms:article:list', '#', 'admin', '2022-05-04 21:19:22', '', NULL, ''),
(1115, '添加文章', 1070, 2, '#', 'menuItem', 'F', '0', '1', 'cms:article:add', '#', 'admin', '2022-05-04 21:19:54', '', NULL, ''),
(1116, '修改文章', 1070, 3, '#', 'menuItem', 'F', '0', '1', 'cms:article:edit', '#', 'admin', '2022-05-04 21:20:41', '', NULL, ''),
(1117, '删除按钮', 1070, 3, '#', 'menuItem', 'F', '0', '1', 'cms:article:remove', '#', 'admin', '2022-05-04 21:48:36', '', NULL, ''),
(1118, '内容维护', 1063, 9, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2022-05-16 20:59:14', '', NULL, ''),
(1119, '反馈管理', 1118, 1, '/cms/contact', 'menuItem', 'C', '0', '0', NULL, '#', 'admin', '2022-05-16 21:01:19', '', NULL, ''),
(1120, '添加联盟', 1069, 1, '#', 'menuItem', 'F', '0', '1', 'cms:union:add', '#', 'admin', '2022-05-30 20:04:05', '', NULL, ''),
(1121, '编辑联盟', 1069, 2, '#', 'menuItem', 'F', '0', '1', 'cms:union:edit', '#', 'admin', '2022-05-30 20:04:53', '', NULL, ''),
(1122, '删除联盟', 1069, 3, '#', 'menuItem', 'F', '0', '1', 'cms:union:remove', '#', 'admin', '2022-05-30 20:05:49', '', NULL, ''),
(1123, '查看联盟', 1069, 0, '#', 'menuItem', 'F', '0', '1', 'cms:union:view', '#', 'admin', '2022-05-30 20:06:30', '', NULL, '');

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
(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '<div style=\"background-color: rgb(30, 30, 30); line-height: 24px;\"><div style=\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\"><img src=\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\" style=\"width: 794px;\" data-filename=\"QJ8518313644.jpg\">&nbsp;</div><div style=\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\"><br></div></div>', '0', 'admin', '2022-01-13 08:17:25', 'admin', '2022-05-28 18:24:00', '管理员'),
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
(350, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"false\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:38'),
(351, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:51'),
(352, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:09:53'),
(353, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.more\":[\"true\"],\"oly.web.theme.setting\":[\"true\"],\"configGroup\":[\"webConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-26 16:10:02'),
(354, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"116\"],\"configGroup\":[\"themeConfig\"],\"configName\":[\"使用主题\"],\"configKey\":[\"oly.theme.used\"],\"configValueType\":[\"3\"],\"configValue\":[\"zgcms\"],\"configType\":[\"1\"],\"remark\":[\"使用主题\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-27 09:01:11'),
(355, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"parent\":[\"1\"],\"catName\":[\"测试类目\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"测试目录\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"catIcon\":[\"fa fa-adjust\"],\"visible\":[\"1\"]}', NULL, 1, '', '2022-03-27 16:58:21'),
(356, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catName\":[\"测试类目\"],\"parent\":[\"1\"],\"catId\":[\"1\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"1\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"],\"remark\":[\"测试目录\"],\"catIcon\":[\"fa fa-adjust\"],\"visible\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-27 18:16:46');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
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
(458, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-04-23 01:14:41'),
(459, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"1\"],\"sys.common.description\":[\"\"],\"sys.common.logo\":[\"\"],\"sys.common.ico\":[\"\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 01:15:24'),
(460, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:00:11'),
(461, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default1\"],\"sys.index.ignoreFooter\":[\"false\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:00:46'),
(462, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:00'),
(463, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"on\",\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:02'),
(464, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-blue\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"default\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-23 08:01:52');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
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
(486, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-24 10:30:27'),
(487, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '', '2022-04-24 20:12:32'),
(488, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '', '2022-04-24 20:13:46'),
(489, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '', '2022-04-24 20:17:35'),
(490, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:48:49'),
(491, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:49:03'),
(492, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:50:08'),
(493, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:51:02'),
(494, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:53:04'),
(495, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:55:02'),
(496, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:55:42'),
(497, '主题管理-主题上传', 1, 'com.oly.cms.admin.controller.page.CmsThemeController.themeUpload()', 'POST', 1, 'admin', '研发部门', '/cms/theme/uploadTheme', '127.0.0.1', '内网IP', '{\"covery\":[\"true\"]}', NULL, 1, '获取主题说明异常', '2022-04-24 20:56:49'),
(498, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"1\"],\"sys.common.description\":[\"\"],\"sys.common.logo\":[\"\"],\"sys.common.ico\":[\"\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-25 01:11:08'),
(499, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-25 01:12:39'),
(500, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"hush\"],\"oly.mail.host\":[\"smtp.163.com\"],\"oly.mail.protocol\":[\"smtp\"],\"oly.mail.ssl.port\":[\"465\"],\"oly.mail.username\":[\"m17678999448@163.com\"],\"oly.mail.password\":[\"m634866553\"],\"oly.mail.enabled\":[\"true\",\"\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-25 01:13:52'),
(501, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"1\"],\"sys.common.description\":[\"\"],\"sys.common.logo\":[\"\"],\"sys.common.ico\":[\"\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-25 01:14:21'),
(502, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.cms.articleCat.maxNum\":[\"2\"],\"oly.cms.articleTag.maxNum\":[\"2\"],\"oly.cms.articleKeyword.maxNum\":[\"10\"],\"oly.cms.articleImg.maxNum\":[\"2\"],\"oly.cms.articleUrl.fixedPrefix\":[\"\"],\"oly.cms.articleVisible.default\":[\"2\"],\"configGroup\":[\"cmsConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-25 01:15:53'),
(503, '上传模板', 1, 'com.ruoyi.template.controller.OlyTemplateController.templateUpload()', 'POST', 1, 'admin', '研发部门', '/oly/template/templateUpload', '127.0.0.1', '内网IP', '{\"fileId\":[\"134514_QJ8454619350.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fk\":\"template\\\\QJ8454619350.jpg\",\"params\":{}}}', 0, NULL, '2022-04-25 20:10:28'),
(504, '上传模板', 1, 'com.ruoyi.template.controller.OlyTemplateController.templateUpload()', 'POST', 1, 'admin', '研发部门', '/oly/template/templateUpload', '127.0.0.1', '内网IP', '{\"fileId\":[\"202934_thumb-1920-426027.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fk\":\"template\\\\thumb-1920-426027.jpg\",\"params\":{}}}', 0, NULL, '2022-04-25 20:12:30'),
(505, '模板模型', 1, 'com.ruoyi.template.controller.OlyTemplateController.addSave()', 'POST', 1, 'admin', '研发部门', '/oly/template/add', '127.0.0.1', '内网IP', '{\"templateId\":[\"0\"],\"templateUrl\":[\"template\\\\thumb-1920-426027.jpg\"],\"parentId\":[\"0\"],\"templateType\":[\"3\"],\"templateName\":[\"测试文档\"],\"visible\":[\"1\"],\"built\":[\"0\"],\"orderNum\":[\"2\"],\"remark\":[\"222\"],\"templateHtml\":[\"\\n\\n                    \"],\"templateParam\":[\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"built\":0,\"createBy\":\"1\",\"createTime\":1650888824392,\"orderNum\":2,\"params\":{},\"parentId\":0,\"remark\":\"222\",\"templateId\":1,\"templateName\":\"测试文档\",\"templateParam\":\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\",\"templateType\":3,\"templateUrl\":\"template\\\\thumb-1920-426027.jpg\",\"visible\":1}}', 0, NULL, '2022-04-25 20:13:44'),
(506, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\04\\\\25\\\\QJ8454619350_20220425203955A001.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-04-25 20:39:57'),
(507, '上传模板', 1, 'com.ruoyi.template.controller.OlyTemplateController.templateUpload()', 'POST', 1, 'admin', '研发部门', '/oly/template/templateUpload', '127.0.0.1', '内网IP', '{\"fileId\":[\"121178_QJ8518313644.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"code\":200,\"data\":{\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fk\":\"template\\\\QJ8518313644.jpg\",\"params\":{}},\"msg\":\"QJ8518313644.jpg\"}}', 0, NULL, '2022-04-25 23:36:02'),
(508, '模板模型', 3, 'com.ruoyi.template.controller.OlyTemplateController.remove()', 'GET', 1, 'admin', '研发部门', '/oly/template/remove/1', '127.0.0.1', '内网IP', '1', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-26 00:19:09'),
(509, '模板模型', 1, 'com.ruoyi.template.controller.OlyTemplateController.addSave()', 'POST', 1, 'admin', '研发部门', '/oly/template/add', '127.0.0.1', '内网IP', '{\"templateId\":[\"0\"],\"templateUrl\":[\"\"],\"parentId\":[\"0\"],\"templateType\":[\"0\"],\"templateName\":[\"cesh\"],\"visible\":[\"1\"],\"built\":[\"0\"],\"orderNum\":[\"1\"],\"remark\":[\"1\"],\"templateHtml\":[\"\\n\\n                    \"],\"templateParam\":[\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"built\":0,\"createBy\":\"1\",\"createTime\":1650903702403,\"orderNum\":1,\"params\":{},\"parentId\":0,\"remark\":\"1\",\"templateId\":2,\"templateName\":\"cesh\",\"templateParam\":\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\",\"templateType\":0,\"templateUrl\":\"\",\"visible\":1}}', 0, NULL, '2022-04-26 00:21:42'),
(510, '模板模型', 2, 'com.ruoyi.template.controller.OlyTemplateController.editSave()', 'POST', 1, 'admin', '研发部门', '/oly/template/edit', '127.0.0.1', '内网IP', '{\"templateId\":[\"2\"],\"templateUrl\":[\"\"],\"parentId\":[\"0\"],\"templateType\":[\"0\"],\"templateName\":[\"cesh\"],\"visible\":[\"1\"],\"built\":[\"0\"],\"orderNum\":[\"1\"],\"remark\":[\"1\"],\"templateHtml\":[\"\\n\\n                    \"],\"templateParam\":[\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\"]}', '{\"msg\":\"操作成功\",\"code\":0,\"data\":{\"built\":0,\"orderNum\":1,\"params\":{},\"parentId\":0,\"remark\":\"1\",\"templateId\":2,\"templateName\":\"cesh\",\"templateParam\":\"{\\n  \\\"ni\\\": \\\"你好\\\"\\n}\",\"templateType\":0,\"templateUrl\":\"\",\"updateBy\":\"1\",\"updateTime\":1650904351735,\"visible\":1}}', 0, NULL, '2022-04-26 00:32:31'),
(511, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈管理系统\"],\"sys.common.description\":[\"止戈管理系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oly/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oly/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-26 04:02:11'),
(512, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-user\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-26 04:13:18'),
(513, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1085\"],\"menuType\":[\"C\"],\"menuName\":[\"个人资料\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-26 04:16:55'),
(514, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1085\"],\"menuType\":[\"C\"],\"menuName\":[\"内容中心\"],\"url\":[\"/cms/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-26 06:10:41'),
(515, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '研发部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"roleIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-27 07:15:42'),
(516, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '研发部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-27 07:16:04'),
(517, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"测试\"],\"roleKey\":[\"comj\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1085,1086,1087,1,1084,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,1074,116,1063,1071,1066,1069,1067,1068,1070,1072,1073,1077,1078,1079,1080,1081,1082,1083,1076,1065,1064,1062,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-27 07:18:02'),
(518, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-27 07:19:26'),
(519, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"102\"],\"deptName\":[\"测试部门\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-27 07:26:00'),
(520, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-28 23:20:14'),
(521, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_user_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-28 23:21:25'),
(522, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-28 23:25:58'),
(523, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_user_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-28 23:26:07'),
(524, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_user_info', '127.0.0.1', '内网IP', '\"sys_user_info\"', NULL, 0, NULL, '2022-04-28 23:26:27'),
(525, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'ry', '测试部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-29 02:44:44'),
(526, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"223\"],\"hobby\":[\"\"],\"contact\":[\"\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-29 07:05:32'),
(527, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-29 07:07:13'),
(528, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"若依\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-29 07:07:20'),
(529, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-29 07:07:42'),
(530, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"}]\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-30 09:50:03'),
(531, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"}]\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-30 09:57:31'),
(532, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admi\\\",\\\"contactName\\\":\\\"yy\\\"},{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"}]\"],\"touch\":[\"\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-30 12:19:51'),
(533, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"},{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admi\\\",\\\"contactName\\\":\\\"yy\\\"}]\"],\"touch\":[\"[{\\\"touchId\\\":\\\"电话\\\",\\\"touchName\\\":\\\"17678999448\\\"}]\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-30 12:20:48'),
(534, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admi\\\",\\\"contactName\\\":\\\"yy\\\"},{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"}]\"],\"touch\":[\"[{\\\"touchId\\\":\\\"17678999448\\\",\\\"touchName\\\":\\\"电话\\\"}]\"],\"local\":[\"\"],\"introduce\":[\"\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-04-30 12:27:42'),
(535, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateUserInfo()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateUserInfo', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"birthday\":[\"\"],\"tags\":[\"112\"],\"hobby\":[\"\"],\"contact\":[\"[{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admin\\\",\\\"contactName\\\":\\\"qq\\\"},{\\\"contactUrl\\\":\\\"http://127.0.0.1:8090/admi\\\",\\\"contactName\\\":\\\"yy\\\"}]\"],\"touch\":[\"[{\\\"touchId\\\":\\\"17678999448\\\",\\\"touchName\\\":\\\"电话\\\"}]\"],\"local\":[\"上海浦东新区\"],\"introduce\":[\"上海浦东新区\"],\"teach\":[\"\"],\"shows\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-01 03:22:07'),
(536, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"评论管理\"],\"url\":[\"/cms/comment\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-02 14:42:49'),
(537, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.comment.open\":[\"true\"],\"oly.comment.reply\":[\"\"],\"oly.comment.defauleVisible\":[\"0\"],\"oly.comment.oneSize\":[\"10\",\"10\"],\"configGroup\":[\"commentConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 05:00:08'),
(538, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.comment.open\":[\"true\"],\"oly.comment.reply\":[\"\"],\"oly.comment.defauleVisible\":[\"0\"],\"oly.comment.oneSize\":[\"10\",\"10\"],\"configGroup\":[\"commentConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 05:00:18'),
(539, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.comment.open\":[\"true\"],\"oly.comment.reply\":[\"\"],\"oly.comment.defauleVisible\":[\"0\"],\"oly.comment.oneSize\":[\"10\",\"10\"],\"configGroup\":[\"commentConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 05:02:15'),
(540, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.comment.open\":[\"false\"],\"oly.comment.reply\":[\"\"],\"oly.comment.defauleVisible\":[\"0\"],\"oly.comment.oneSize\":[\"10\",\"10\"],\"configGroup\":[\"commentConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 05:04:18'),
(541, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"2\"],\"configGroup\":[\"sysUser\"],\"configName\":[\"用户管理-账号初始密码\"],\"configKey\":[\"sys.user.initPassword\"],\"configValueType\":[\"3\"],\"configValue\":[\"123456\"],\"configType\":[\"0\"],\"remark\":[\"初始化密码 123456\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 06:24:20'),
(542, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"4\"],\"configGroup\":[\"sysUser\"],\"configName\":[\"账号自助-是否开启用户注册功能\"],\"configKey\":[\"sys.account.registerUser\"],\"configValueType\":[\"2\"],\"configValue\":[\"false\"],\"configType\":[\"0\"],\"remark\":[\"是否开启注册用户功能（true开启，false关闭）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-03 06:24:38'),
(543, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"109\"],\"userName\":[\"内容管理员\"],\"deptName\":[\"财务部门\"],\"phonenumber\":[\"17678999448\"],\"email\":[\"634866553@qq.com\"],\"loginName\":[\"cmsAdmin\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"内容管理员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:15:18'),
(544, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"建站系统\"],\"orderNum\":[\"0\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:16:21'),
(545, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"建站系统\"],\"deptName\":[\"系统管理\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:16:40'),
(546, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"建站系统\"],\"deptName\":[\"网站用户\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:17:08'),
(547, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"添加内容菜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:46:59'),
(548, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1089\"],\"menuType\":[\"F\"],\"menuName\":[\"删除内容菜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:48:27'),
(549, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1090\"],\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"删除内容菜单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:49:03'),
(550, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"修改内容导航\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:50:56'),
(551, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1091\"],\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"修改内容菜单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:51:38'),
(552, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"查看内容菜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:view\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 06:53:19'),
(553, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1067\"],\"menuType\":[\"F\"],\"menuName\":[\"查看分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:view\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:40:29'),
(554, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1067\"],\"menuType\":[\"F\"],\"menuName\":[\"删除分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:remove\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:40:29'),
(555, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1067\"],\"menuType\":[\"F\"],\"menuName\":[\"添加分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:40:29'),
(556, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1067\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:40:29'),
(557, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"F\"],\"menuName\":[\"查看标签\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:view\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:41:50'),
(558, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"F\"],\"menuName\":[\"添加标签\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:46:59'),
(559, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"F\"],\"menuName\":[\"删除标签\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:48:25'),
(560, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"F\"],\"menuName\":[\"修改标签\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:49:22'),
(561, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"查看主题\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:52:07'),
(562, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"上传主题\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:53:01'),
(563, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"删除主题\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:53:44'),
(564, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"修改主题\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:54:46'),
(565, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"F\"],\"menuName\":[\"查看外链\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:55:31'),
(566, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"F\"],\"menuName\":[\"添加外链\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:56:07'),
(567, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"F\"],\"menuName\":[\"修改外链\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:56:40'),
(568, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"F\"],\"menuName\":[\"删除外链\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:link:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 07:57:21'),
(569, '主题管理-备份主题', 5, 'com.oly.cms.admin.controller.page.CmsThemeController.packageTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/packageTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 10:17:37'),
(570, '主题管理-删除备份主题', 5, 'com.oly.cms.admin.controller.page.CmsThemeController.deleteBackTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/removeBackTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgblog_20220504101734.zip\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 12:26:41'),
(571, '主题管理-删除备份主题', 5, 'com.oly.cms.admin.controller.page.CmsThemeController.deleteBackTheme()', 'POST', 1, 'admin', '研发部门', '/cms/theme/removeBackTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms.zip\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 12:26:44'),
(572, '主题管理-下载备份主题', 5, 'com.oly.cms.admin.controller.page.CmsThemeController.downloadBackTheme()', 'GET', 1, 'admin', '研发部门', '/cms/theme/downloadBackTheme', '127.0.0.1', '内网IP', '{\"themeName\":[\"zgcms_20220325182522.zip\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 12:38:01'),
(573, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 17:25:11'),
(574, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"演示角色\"],\"roleKey\":[\"systemView\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"menuIds\":[\"1084,100,1000,101,1007,102,1012,1016,1020,105,1025,106,1030,107,1035,114,115,1057,1074,116,1063,1071,1066,1092,1067,1093,1068,1097,1072,1101,1073,1077,1078,1079,1080,1081,1082,1083,1064,1062,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:22:39'),
(575, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '研发部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"roleIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:22:58'),
(576, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"演示角色\"],\"roleKey\":[\"systemView\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"menuIds\":[\"1,1084,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,114,115,1057,1058,1059,1060,1061,1074,116,1063,1071,1066,1092,1067,1093,1068,1097,1070,1072,1101,1073,1077,1078,1079,1080,1081,1082,1083,1076,1105,1106,1107,1108,1088,1065,1064,1062,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:50:34'),
(577, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"导航列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:50:39'),
(578, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1109\"],\"parentId\":[\"1066\"],\"menuType\":[\"F\"],\"menuName\":[\"获取内容菜单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:column:list\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:51:47'),
(579, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1067\"],\"menuType\":[\"F\"],\"menuName\":[\"分类列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:cat:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:53:02'),
(580, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"F\"],\"menuName\":[\"标签列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:tag:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:53:58'),
(581, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"主题列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:theme:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 18:55:13'),
(582, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"F\"],\"menuName\":[\"查看文章\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:view\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 21:18:37');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(583, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"F\"],\"menuName\":[\"文章列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 21:19:22'),
(584, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"F\"],\"menuName\":[\"添加文章\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 21:19:54'),
(585, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"F\"],\"menuName\":[\"修改文章\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 21:20:41'),
(586, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"F\"],\"menuName\":[\"删除按钮\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:article:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-04 21:48:36'),
(587, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'cmsAdmin', '财务部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"演示角色\"],\"roleKey\":[\"systemView\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"menuIds\":[\"1063,1071,1066,1092,1067,1093,1068,1097,1070,1072,1101,1073,1077,1078,1079,1080,1081,1082,1083,1076,1106,1105,1107,1108,1088,1065,1064,1062\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 03:23:13'),
(588, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'cmsAdmin', '财务部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"109\"],\"userName\":[\"内容管理员\"],\"dept.deptName\":[\"财务部门\"],\"phonenumber\":[\"17678999448\"],\"email\":[\"634866553@qq.com\"],\"loginName\":[\"cmsAdmin\"],\"sex\":[\"0\"],\"role\":[\"4\"],\"remark\":[\"内容管理员\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 03:23:13'),
(589, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 03:23:13'),
(590, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/04/25/QJ8454619350_20220425203955A001.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"04\" \"25\" \"QJ8454619350_20220425203955A001.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:24:30'),
(591, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/30/logo_hw_20220330203150A001.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"30\" \"logo_hw_20220330203150A001.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:46:54'),
(592, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"139261_thumb-1920-337990.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-337990.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\05\\\\thumb-1920-337990_20220505084733A001.jpg\",\"ossType\":0,\"params\":{},\"size\":139261},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-05 08:47:34'),
(593, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/thumb-1920-337990_20220505084733A001.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"thumb-1920-337990_20220505084733A001.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:47:46'),
(594, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"167963_thumb-1920-399827.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-399827.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\05\\\\thumb-1920-399827_20220505084843A002.jpg\",\"ossType\":0,\"params\":{},\"size\":167963},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-05 08:48:43'),
(595, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/thumb-1920-399827_20220505084843A002.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"thumb-1920-399827_20220505084843A002.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:48:54'),
(596, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/thumb-1920-399827_20220505084843A002.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"thumb-1920-399827_20220505084843A002.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:49:02'),
(597, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"121178_QJ8518313644.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\05\\\\QJ8518313644_20220505084940A003.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-05 08:49:41'),
(598, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/QJ8518313644_20220505084940A003.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"QJ8518313644_20220505084940A003.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:49:48'),
(599, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/QJ8518313644_20220505084940A003.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"QJ8518313644_20220505084940A003.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:51:22'),
(600, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"121178_QJ8518313644.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\05\\\\QJ8518313644_20220505085236A004.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-05 08:52:36'),
(601, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/QJ8518313644_20220505085236A004.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"QJ8518313644_20220505085236A004.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:52:42'),
(602, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/03/10/logo_hw_20220310235557A003.png', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"03\" \"10\" \"logo_hw_20220310235557A003.png\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-05 08:52:51'),
(603, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:54:46'),
(604, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:55:10'),
(605, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:23'),
(606, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:25'),
(607, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:26'),
(608, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:27'),
(609, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:27'),
(610, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:27'),
(611, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:27'),
(612, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:28'),
(613, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:28'),
(614, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 08:58:28'),
(615, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:00:10'),
(616, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:00:25'),
(617, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.qiniu.domain\":[\"6gffdd\"],\"oly.oss.qiniu.access.key\":[\"fdvfv\"],\"oly.oss.qiniu.secret.key\":[\"vv\"],\"oly.oss.qiniu.bucket\":[\"fv\"],\"oly.oss.qiniu.zone\":[\"vdv\"],\"oly.oss.qiniu.style.rule\":[\"vxcv\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:00:37'),
(618, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1085\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-user\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:01:22'),
(619, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:02:02'),
(620, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:03:54'),
(621, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:05:34'),
(622, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:05:40'),
(623, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:06:17'),
(624, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:07:49'),
(625, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:08:00'),
(626, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:09:56'),
(627, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 09:10:59'),
(628, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"hush\"],\"oly.mail.host\":[\"smtp.163.com\"],\"oly.mail.protocol\":[\"smtp\"],\"oly.mail.ssl.port\":[\"465\"],\"oly.mail.username\":[\"m17678999448@163.com\"],\"oly.mail.password\":[\"m634866553\"],\"oly.mail.enabled\":[\"true\",\"\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 10:58:49'),
(629, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"hush\"],\"oly.mail.host\":[\"smtp.163.com\"],\"oly.mail.protocol\":[\"smtp\"],\"oly.mail.ssl.port\":[\"465\"],\"oly.mail.username\":[\"m17678999448@163.com\"],\"oly.mail.password\":[\"m634866553\"],\"oly.mail.enabled\":[\"true\",\"\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 10:58:49'),
(630, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oly/oss/download/\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-05 10:58:49'),
(631, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/05/QJ8518313644_20220505085236A004.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"05\" \"QJ8518313644_20220505085236A004.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-07 14:13:10'),
(632, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"167963_thumb-1920-399827.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-399827.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\07\\\\thumb-1920-399827_20220507141326A001.jpg\",\"ossType\":0,\"params\":{},\"size\":167963},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-07 14:13:27'),
(633, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:27:47'),
(634, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:28:00'),
(635, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:28:10'),
(636, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:29:41'),
(637, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:33:00'),
(638, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 14:36:03'),
(639, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 16:53:53'),
(640, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 16:54:00'),
(641, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 16:54:03'),
(642, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 16:54:05'),
(643, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/07/thumb-1920-399827_20220507141326A001.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"07\" \"thumb-1920-399827_20220507141326A001.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 16:56:00'),
(644, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"134514_QJ8454619350.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\08\\\\QJ8454619350_20220508170047A001.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-08 17:00:50'),
(645, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:02:29'),
(646, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:03:03'),
(647, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:04:05'),
(648, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:04:14'),
(649, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:04:18'),
(650, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:04:22'),
(651, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:07:13'),
(652, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteByFk', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:07:18'),
(653, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/image/2022/05/08/QJ8454619350_20220508170047A001.jpg', '127.0.0.1', '内网IP', '\"image\" \"2022\" \"05\" \"08\" \"QJ8454619350_20220508170047A001.jpg\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-08 17:09:32'),
(654, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"121178_QJ8518313644.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\09\\\\QJ8518313644_20220509020614A001.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-09 02:06:15'),
(655, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\05\\\\09\\\\问卷调查_20220509020637A002.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-09 02:06:37'),
(656, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E9_97_AE_E5_8D_B7_E8_B0_83_E6_9F_A5.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"问卷调查.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\05\\\\09\\\\%E9%97%AE%E5%8D%B7%E8%B0%83%E6%9F%A5_20220509075636A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-09 07:56:38'),
(657, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteById/24', '127.0.0.1', '内网IP', '24', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-09 08:14:52'),
(658, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/deleteById/25', '127.0.0.1', '内网IP', '25', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-09 08:15:02'),
(659, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197_dd.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"dd.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\05\\\\09\\\\dd_20220509081636A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-09 08:16:36'),
(660, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/document/2022/05/09/dd_20220509081636A001.docx', '127.0.0.1', '内网IP', '\"document\" \"2022\" \"05\" \"09\" \"dd_20220509081636A001.docx\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-09 12:39:28'),
(661, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E6_96_87_E6_A1_A3_E6_A8_A1_E6_8B_9F.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"文档模拟.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\05\\\\09\\\\WDMN_20220509123946A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-09 12:39:47'),
(662, '文件管理', 3, 'com.ruoyi.oss.controller.OlyOssController.delete()', 'GET', 1, 'admin', '研发部门', '/oly/oss/delete/document/2022/05/09/WDMN_20220509123946A001.docx', '127.0.0.1', '内网IP', '\"document\" \"2022\" \"05\" \"09\" \"WDMN_20220509123946A001.docx\"', '{\"code\":200,\"msg\":\"删除附件成功\"}', 0, NULL, '2022-05-09 12:40:04'),
(663, '文章上传图片', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.articleImgUploadMarkdown()', 'POST', 1, 'admin', '研发部门', '/cms/article/articleImgByMarkdown', '127.0.0.1', '内网IP', '{\"guid\":[\"1652184069579\"]}', NULL, 1, '上传的文件名最长5个字符', '2022-05-10 20:01:22'),
(664, '文章上传图片', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.articleImgUploadMarkdown()', 'POST', 1, 'admin', '研发部门', '/cms/article/articleImgByMarkdown', '127.0.0.1', '内网IP', '{\"guid\":[\"1652184510919\"]}', '\"{\\\"success\\\":1,\\\"message\\\":\\\"上传成功\\\",\\\"url\\\":\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\\\\\2022\\\\\\\\05\\\\\\\\10\\\\\\\\thumb-1920-337990_20220510200839A001.jpg\\\"}\"', 0, NULL, '2022-05-10 20:08:40'),
(665, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.addTagArticle()', 'POST', 1, 'admin', '研发部门', '/cms/article/addTagArticle', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"tagId\":[\"1\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-05-11 10:37:01'),
(666, '文章上传图片', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.articleImgUploadMarkdown()', 'POST', 1, 'admin', '研发部门', '/cms/article/articleImgByMarkdown', '127.0.0.1', '内网IP', '{\"guid\":[\"1652273960121\"]}', '\"{\\\"success\\\":1,\\\"message\\\":\\\"上传成功\\\",\\\"url\\\":\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\\\\\2022\\\\\\\\05\\\\\\\\11\\\\\\\\QJ8454619350_20220511205935A001.jpg\\\"}\"', 0, NULL, '2022-05-11 20:59:37'),
(667, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E6_96_87_E6_A1_A3_E6_A8_A1_E6_8B_9F.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, '上传文件不被允许', '2022-05-13 08:26:15'),
(668, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E6_96_87_E6_A1_A3_E6_A8_A1_E6_8B_9F.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', NULL, 1, '上传文件不被允许', '2022-05-13 08:26:37'),
(669, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"11197__E6_96_87_E6_A1_A3_E6_A8_A1_E6_8B_9F.docx\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oly/oss/download/\",\"fileHeard\":\"application/zip\",\"fileName\":\"文档模拟.docx\",\"fileType\":\"document\",\"fk\":\"document\\\\2022\\\\05\\\\13\\\\WDMN_20220513090940A001.docx\",\"ossType\":0,\"params\":{},\"size\":11197},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-13 09:09:42'),
(670, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oss/download/\"],\"oly.oss.support.type\":[\"\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 06:40:59'),
(671, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"134514_QJ8454619350.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\14\\\\QJ8454619350_20220514064123A001.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-14 06:41:24'),
(672, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈管理系统\"],\"sys.common.description\":[\"止戈管理系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 16:02:42'),
(673, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 23:30:53'),
(674, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 23:31:14'),
(675, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 23:48:57'),
(676, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-14 23:50:09'),
(677, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 00:28:58'),
(678, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"167963_thumb-1920-399827.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-399827.jpg\",\"fileType\":\"image\",\"fk\":\"image\\\\2022\\\\05\\\\15\\\\thumb-1920-399827_20220515090549A001.jpg\",\"ossType\":0,\"params\":{},\"size\":167963},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-15 09:05:51'),
(679, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 11:47:48'),
(680, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '{\"fileId\":[\"134514_QJ8454619350.jpg\"],\"initialPreview\":[\"[]\"],\"initialPreviewConfig\":[\"[]\"],\"initialPreviewThumbTags\":[\"[]\"]}', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/15/QJ8454619350_20220515114815A002.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-15 11:48:16'),
(681, '内容分类管理', 2, 'com.oly.cms.admin.controller.page.CmsCatController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"catId\":[\"1\"],\"catName\":[\"止戈标签\"],\"parent\":[\"0\"],\"catUrl\":[\"/cat/test\"],\"catType\":[\"1\"],\"orderNum\":[\"0\"],\"visible\":[\"2\"],\"catIcon\":[\"\"],\"remark\":[\"止戈标签\"],\"keywords\":[\"内容\"],\"description\":[\"内容\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:14:34'),
(682, '内容分类管理', 1, 'com.oly.cms.admin.controller.page.CmsCatController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/cat/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"parent\":[\"1\"],\"catName\":[\"止戈\"],\"catUrl\":[\"\"],\"catType\":[\"0\"],\"orderNum\":[\"2\"],\"visible\":[\"2\"],\"catIcon\":[\"\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:14:47'),
(683, '内容栏目管理', 2, 'com.oly.cms.admin.controller.page.CmsColumnController.edit()', 'POST', 1, 'admin', '研发部门', '/cms/column/edit', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"columnId\":[\"1\"],\"parent\":[\"0\"],\"columnName\":[\"止戈文档\"],\"columnLocate\":[\"0\"],\"columnUrl\":[\"\"],\"openType\":[\"1\"],\"orderNum\":[\"1\"],\"visible\":[\"1\"],\"perms\":[\"\"],\"columnIcon\":[\"\"],\"remark\":[\"\"],\"keywords\":[\"\"],\"description\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:17:40'),
(684, '内容-标签修改', 2, 'com.oly.cms.admin.controller.page.CmsTagController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/tag/edit', '127.0.0.1', '内网IP', '{\"tagId\":[\"1\"],\"tagName\":[\"踩踩踩2\"],\"tagUrl\":[\"\"],\"orderNum\":[\"3\"],\"tagType\":[\"1\"],\"visible\":[\"2\"],\"tagIco\":[\"\"],\"perms\":[\"\"],\"remark\":[\"\"],\"keywords\":[\"cccc\"],\"description\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:17:51'),
(685, '内容-标签修改', 2, 'com.oly.cms.admin.controller.page.CmsTagController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/tag/edit', '127.0.0.1', '内网IP', '{\"tagId\":[\"1\"],\"tagName\":[\"踩踩\"],\"tagUrl\":[\"\"],\"orderNum\":[\"3\"],\"tagType\":[\"1\"],\"visible\":[\"2\"],\"tagIco\":[\"\"],\"perms\":[\"\"],\"remark\":[\"\"],\"keywords\":[\"cccc\"],\"description\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:18:02'),
(686, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-15 22:23:20'),
(687, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈管理系统\"],\"sys.common.description\":[\"止戈管理系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:37:49'),
(688, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.cms.articleCat.maxNum\":[\"2\"],\"oly.cms.articleTag.maxNum\":[\"2\"],\"oly.cms.articleKeyword.maxNum\":[\"10\"],\"oly.cms.articleImg.maxNum\":[\"2\"],\"oly.cms.articleUrl.fixedPrefix\":[\"\"],\"oly.cms.articleVisible.default\":[\"2\"],\"configGroup\":[\"cmsConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:38:00'),
(689, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.mail.from.name\":[\"hush\"],\"oly.mail.host\":[\"smtp.163.com\"],\"oly.mail.protocol\":[\"smtp\"],\"oly.mail.ssl.port\":[\"465\"],\"oly.mail.username\":[\"m17678999448@163.com\"],\"oly.mail.password\":[\"m634866553\"],\"oly.mail.enabled\":[\"true\",\"\"],\"configGroup\":[\"mailConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:38:15'),
(690, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.oss.native.domain\":[\"http://127.0.0.1:8090/oss/download/\"],\"oly.oss.support.type\":[\"\"],\"configGroup\":[\"ossConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:38:22'),
(691, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.theme.more\":[\"true\"],\"oly.theme.setting\":[\"true\"],\"configGroup\":[\"themeConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:38:45'),
(692, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 17:38:52'),
(693, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.cms.articleCat.maxNum\":[\"2\"],\"oly.cms.articleTag.maxNum\":[\"2\"],\"oly.cms.articleKeyword.maxNum\":[\"10\"],\"oly.cms.articleImg.maxNum\":[\"2\"],\"oly.cms.articleUrl.fixedPrefix\":[\"\"],\"oly.cms.articleVisible.default\":[\"2\"],\"configGroup\":[\"cmsConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 19:43:41'),
(694, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1063\"],\"menuType\":[\"M\"],\"menuName\":[\"内容维护\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 20:59:14'),
(695, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1118\"],\"menuType\":[\"C\"],\"menuName\":[\"反馈管理\"],\"url\":[\"/cms/contact\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-16 21:01:19'),
(696, '反馈|建议', 1, 'com.oly.cms.admin.controller.page.CmsContactController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/add', '127.0.0.1', '内网IP', '{\"visible\":[\"0\"],\"subject\":[\"我在测试反馈\"],\"content\":[\"我在测试反馈\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"17678999448\"],\"contactType\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-17 08:57:50'),
(697, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"1\"],\"visible\":[\"0\"],\"content\":[\"我在测试反馈\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"handleResult\":[\"已处理\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-17 16:19:44'),
(698, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"1\"],\"visible\":[\"1\"],\"content\":[\"我在测试反馈\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"handleResult\":[\"已处理\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-17 16:24:46'),
(699, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/17/QJ8454619350_20220517225122A001.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-17 22:51:24'),
(700, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/17/QJ8518313644_20220517225156A002.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-17 22:51:56');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(701, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/17/QJ8454619350_20220517225229A003.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-17 22:52:29'),
(702, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/17/QJ8518313644_20220517225355A004.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-17 22:53:55'),
(703, '反馈|建议', 1, 'com.oly.cms.admin.controller.page.CmsContactController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/add', '127.0.0.1', '内网IP', '{\"visible\":[\"0\"],\"subject\":[\"发帖呼吁尽快有同样然\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"contactType\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-17 23:46:12'),
(704, '反馈|建议', 1, 'com.oly.cms.admin.controller.page.CmsContactController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/add', '127.0.0.1', '内网IP', '{\"visible\":[\"0\"],\"subject\":[\"发帖呼吁尽快有同样然\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"contactType\":[\"0\"],\"content\":[\"<p>发帖呼吁尽快<font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#73a5ad\\\">有同样然</font><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-17 23:48:14'),
(705, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-337990.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\",\"ossType\":0,\"params\":{},\"size\":139261},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-18 19:18:22'),
(706, '反馈|建议', 1, 'com.oly.cms.admin.controller.page.CmsContactController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/add', '127.0.0.1', '内网IP', '{\"visible\":[\"0\"],\"subject\":[\"测试表单吃饭DVD部分的\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"17678999448\"],\"contactType\":[\"0\"],\"content\":[\"<p>测试表单吃饭DVD部分的<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\\\" style=\\\"width: 641.323px;\\\" data-filename=\\\"thumb-1920-337990.jpg\\\"><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:18:39'),
(707, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"content\":[\"<p>测试表单吃饭DVD部分的<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\\\" style=\\\"width: 641.323px;\\\" data-filename=\\\"thumb-1920-337990.jpg\\\"><br></p>\"]}', NULL, 1, '', '2022-05-18 19:19:06'),
(708, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"4\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"17678999448\"],\"visible\":[\"0\"],\"content\":[\"<p>测试表单吃饭DVD部分的<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\\\" style=\\\"width: 641.323px;\\\" data-filename=\\\"thumb-1920-337990.jpg\\\"><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:20:54'),
(709, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"4\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"17678999448\"],\"visible\":[\"1\"],\"content\":[\"<p>测试表单吃饭DVD部分的<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518191820A001.jpg\\\" style=\\\"width: 641.323px;\\\" data-filename=\\\"thumb-1920-337990.jpg\\\"><br></p>\"],\"handResult\":[\"<p>谷蛋白的表达分别代表</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:22:14'),
(710, '反馈|建议', 1, 'com.oly.cms.admin.controller.page.CmsContactController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/add', '127.0.0.1', '内网IP', '{\"visible\":[\"0\"],\"subject\":[\"测试表单吃饭DVD部分的相当长\"],\"email\":[\"\"],\"touch\":[\"\"],\"contactType\":[\"0\"],\"content\":[\"<p>&nbsp;现场v现场v</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:31:21'),
(711, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"5\"],\"email\":[\"\"],\"touch\":[\"\"],\"visible\":[\"1\"],\"content\":[\"<p>&nbsp;现场v现场v</p>\"],\"handResult\":[\"<p>发vBBC从vv持续下挫</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:31:36'),
(712, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"3\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"visible\":[\"0\"],\"content\":[\"<p>发帖呼吁尽快<font style=\\\"background-color: rgb(255, 255, 0);\\\" color=\\\"#73a5ad\\\">有同样然</font><br></p>\"],\"handResult\":[\"<p>vcx此程序v徐v下</p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:33:02'),
(713, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-337990.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/18/thumb-1920-337990_20220518193613A002.jpg\",\"ossType\":0,\"params\":{},\"size\":139261},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-18 19:36:14'),
(714, '反馈|建议', 2, 'com.oly.cms.admin.controller.page.CmsContactController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/contact/edit', '127.0.0.1', '内网IP', '{\"contactId\":[\"2\"],\"email\":[\"634866553@qq.com\"],\"touch\":[\"\"],\"visible\":[\"1\"],\"content\":[\"<p><br></p>\"],\"handleResult\":[\"<p><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/18/thumb-1920-337990_20220518193613A002.jpg\\\" style=\\\"width: 634.656px;\\\" data-filename=\\\"thumb-1920-337990.jpg\\\"><br></p>\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-18 19:36:19'),
(715, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 20:10:30'),
(716, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"cms_like_record\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 20:11:42'),
(717, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/cms_like_record', '127.0.0.1', '内网IP', '\"cms_like_record\"', NULL, 0, NULL, '2022-05-19 20:11:50'),
(718, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 23:20:43'),
(719, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"1\"],\"articleTitle\":[\"test\"],\"articleUrl\":[\"1648444486926\"],\"keywords\":[\"test\"],\"editor-markdown-doc\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\"],\"editor-html-code\":[\"<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\\r\\n\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\"],\"articleContent\":[\"<p>dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"dfvfvxcvcxvcxvcxvcvvxcvcvcvcxvxcvxccxc\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 23:20:51'),
(720, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oly/oss/download/image\\\\2022\\\\03\\\\30\\\\logo_hw_20220330203150A001.png\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 23:24:58'),
(721, '文章上传图片', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.articleImgUploadMarkdown()', 'POST', 1, 'admin', '研发部门', '/cms/article/articleImgByMarkdown', '127.0.0.1', '内网IP', '{\"guid\":[\"1652974616614\"]}', '\"{\\\"success\\\":1,\\\"message\\\":\\\"上传成功\\\",\\\"url\\\":\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\"}\"', 0, NULL, '2022-05-19 23:37:06'),
(722, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![]![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p>![]<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\"],\"articleMd\":[\"![]![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p>![]<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-19 23:37:21'),
(723, '文章上传图片', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.articleImgUploadFroala()', 'POST', 1, 'admin', '研发部门', '/cms/article/articleImgByFroala', '127.0.0.1', '内网IP', '', '\"{\\\"msg\\\":\\\"上传成功\\\",\\\"uploaded\\\":\\\"true\\\",\\\"link\\\":\\\"http://127.0.0.1:8090/oss/download/image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg\\\"}\"', 0, NULL, '2022-05-20 16:38:53'),
(724, '内容文章管理', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.add()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleTitle\":[\"测试文章\"],\"articleUrl\":[\"1653035901471\"],\"keywords\":[\"cvv\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"1\"],\"articleType\":[\"3\"],\"description\":[\"\"],\"allowComment\":[\"1\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg\"],\"articleContent\":[\"<p>发布功能和规格和价格考虑过<img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/20/thumb-1920-337990_20220520163852A002.jpg\\\" style=\\\"width: 705px;\\\" class=\\\"fr-fic fr-dii\\\" msg=\\\"上传成功\\\" uploaded=\\\"true\\\"></p>\"],\"articleBuild\":[\"0\"],\"articleSummary\":[\"发布功能和规格和价格考虑过\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 16:40:04'),
(725, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/article/editVisible', '127.0.0.1', '内网IP', '{\"visible\":[\"3\"],\"articleIds\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 16:40:11'),
(726, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 16:52:38'),
(727, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<p><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\"],\"articleMd\":[\"![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<p><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\">9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 16:55:30'),
(728, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"- ![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)\\r\\n-\\r\\n\\r\\n------------\\r\\n\\r\\n9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<ul>\\r\\n<li><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\"><br>-</ul>\\r\\n<hr>\\r\\n<p>9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成</p>\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\"],\"articleMd\":[\"- ![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)\\n-\\n\\n------------\\n\\n9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<ul>\\n<li><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\"><br>-</ul>\\n<hr>\\n<p>9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 17:03:17'),
(729, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"2\"],\"articleTitle\":[\"支持Spring9899吹嘘成9899吹嘘成\"],\"articleUrl\":[\"1648471744193\"],\"keywords\":[\"特色\"],\"editor-markdown-doc\":[\"\\r\\n- 1\\r\\n- 2\\r\\n- 3\\r\\n\\r\\n\\r\\n- ![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)\\r\\n-\\r\\n\\r\\n------------\\r\\n\\r\\n9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"editor-html-code\":[\"<ul>\\r\\n<li>1</li><li>2</li><li>3</li></ul>\\r\\n<ul>\\r\\n<li><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\"><br>-</ul>\\r\\n<hr>\\r\\n<p>9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成</p>\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"\"],\"chooseTag\":[\"\"],\"articleType\":[\"3\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\"],\"articleMd\":[\"\\n- 1\\n- 2\\n- 3\\n\\n\\n- ![](http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg)\\n-\\n\\n------------\\n\\n9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成\"],\"articleContent\":[\"<ul>\\n<li>1</li><li>2</li><li>3</li></ul>\\n<ul>\\n<li><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/19/thumb-1920-337990_20220519233705A001.jpg\\\" alt=\\\"\\\"><br>-</ul>\\n<hr>\\n<p>9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成9899吹嘘成</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"9899吹嘘成9899吹嘘成9899吹嘘', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-20 17:04:24'),
(730, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-05-22 22:24:07'),
(731, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.countCode\":[\"\"],\"oly.web.post.copyright\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-22 22:24:15'),
(732, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.cms.articleCat.maxNum\":[\"2\"],\"oly.cms.articleTag.maxNum\":[\"2\"],\"oly.cms.articleKeyword.maxNum\":[\"10\"],\"oly.cms.articleImg.maxNum\":[\"2\"],\"oly.cms.articleUrl.fixedPrefix\":[\"\"],\"oly.cms.articleVisible.default\":[\"2\"],\"configGroup\":[\"cmsConfig\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-22 22:24:28'),
(733, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.theme.zgblog.post.now\":[\"10\"],\"oly.web.theme.zgblog.post.top\":[\"10\"],\"oly.web.theme.zgblog.post.look\":[\"10\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-22 22:24:49'),
(734, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1087\"],\"parentId\":[\"1085\"],\"menuType\":[\"C\"],\"menuName\":[\"内容中心\"],\"url\":[\"/cms/profile/user\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 15:15:17'),
(735, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-purple\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"topnav\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 15:16:06'),
(736, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"false\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 15:16:26'),
(737, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"false\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 15:17:05'),
(738, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 15:19:54'),
(739, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"研发部门\"],\"role\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 22:32:12'),
(740, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"研发部门\"],\"sys.account.defaultRoleIds\":[\"2\"],\"role\":[\"2\"],\"sys.account.defaultPostIds\":[\"4\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 22:35:59'),
(741, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"4\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 22:36:31'),
(742, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"市场部门\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"4\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 22:40:38'),
(743, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 22:53:33'),
(744, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:20:06'),
(745, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:21:31'),
(746, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:23:43'),
(747, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"2\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:24:02'),
(748, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptName\":[\"\"],\"sys.account.defaultRoleIds\":[\"4\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:24:14'),
(749, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"deptId\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:32:34'),
(750, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/system/config/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"174,175\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:49:34'),
(751, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"178\"],\"configGroup\":[\"sysUser\"],\"configName\":[\"sys.account.defaultDept\"],\"configKey\":[\"sys.account.defaultDept\"],\"configValueType\":[\"3\"],\"configValue\":[\"103\"],\"remark\":[\"\"],\"configType\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-23 23:50:28'),
(752, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:25:29'),
(753, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:31:40'),
(754, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:32:19'),
(755, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:33:16'),
(756, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:33:20'),
(757, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"4\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:55:00'),
(758, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.user.initPassword\":[\"123456\"],\"sys.account.passwordValidateDays\":[\"0\"],\"sys.account.initPasswordModify\":[\"0\"],\"sys.account.chrtype\":[\"0\"],\"sys.account.registerUser\":[\"true\"],\"sys.account.defaultDept\":[\"103\"],\"sys.account.defaultRoleIds\":[\"2\"],\"sys.account.defaultPostIds\":[\"2\"],\"configGroup\":[\"sysUser\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 01:55:13'),
(759, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"132\"],\"dictLabel\":[\"图文\"],\"dictValue\":[\"0\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"淘客商品教程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:35:05'),
(760, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"132\"],\"dictLabel\":[\"图文\"],\"dictValue\":[\"0\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"图文类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:35:44'),
(761, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"143\"],\"dictLabel\":[\"长文\"],\"dictValue\":[\"1\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"长文限制1024个字符\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:37:52'),
(762, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"144\"],\"dictLabel\":[\"问答\"],\"dictValue\":[\"2\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"问答类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:39:34'),
(763, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"162\"],\"dictLabel\":[\"影音\"],\"dictValue\":[\"3\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"包含视频音乐\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:40:31'),
(764, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"176\"],\"dictLabel\":[\"图文\"],\"dictValue\":[\"0\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"图文类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:44:33'),
(765, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"177\"],\"dictLabel\":[\"长文\"],\"dictValue\":[\"1\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"长文限制1024\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:45:21'),
(766, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"178\"],\"dictLabel\":[\"问答\"],\"dictValue\":[\"2\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"问答类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:46:03'),
(767, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"179\"],\"dictLabel\":[\"影音\"],\"dictValue\":[\"3\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"包含视频音乐图片等\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:46:47'),
(768, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"投票\"],\"dictValue\":[\"5\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"投票类型 基础\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:49:39'),
(769, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"200\"],\"dictLabel\":[\"投票\"],\"dictValue\":[\"5\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"投票类型 基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:49:52'),
(770, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"162\"],\"dictLabel\":[\"影音\"],\"dictValue\":[\"3\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"包含视频音乐 基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:00'),
(771, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"144\"],\"dictLabel\":[\"问答\"],\"dictValue\":[\"2\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"问答类型  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:11'),
(772, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"143\"],\"dictLabel\":[\"长文\"],\"dictValue\":[\"1\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"长文限制1024个字符  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:20'),
(773, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"132\"],\"dictLabel\":[\"图文\"],\"dictValue\":[\"0\"],\"dictType\":[\"cms_article_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"图文类型   基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:29'),
(774, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"176\"],\"dictLabel\":[\"图文\"],\"dictValue\":[\"0\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"图文类型 基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:43'),
(775, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"177\"],\"dictLabel\":[\"长文\"],\"dictValue\":[\"1\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"长文限制1024  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:50'),
(776, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"178\"],\"dictLabel\":[\"问答\"],\"dictValue\":[\"2\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"问答类型  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:50:58'),
(777, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"179\"],\"dictLabel\":[\"影音\"],\"dictValue\":[\"3\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"包含视频音乐图片等  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:51:08');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(778, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"投票\"],\"dictValue\":[\"5\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"投票类型  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 19:53:31'),
(779, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 23:25:17'),
(780, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"cms_atricle_theme\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-24 23:25:17'),
(781, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/cms_atricle_theme', '127.0.0.1', '内网IP', '\"cms_atricle_theme\"', NULL, 0, NULL, '2022-05-24 23:25:30'),
(782, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"主题可能不存在,请确定!\",\"code\":500}', 0, NULL, '2022-05-25 23:05:18'),
(783, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"主题可能不存在,请确定!\",\"code\":500}', 0, NULL, '2022-05-25 23:05:24'),
(784, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'into cms_article_theme where theme_name=\'zgblog\'\' at line 1\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsArticleLiquidMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: delete from into cms_article_theme where theme_name=?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'into cms_article_theme where theme_name=\'zgblog\'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'into cms_article_theme where theme_name=\'zgblog\'\' at line 1', '2022-05-25 23:07:13'),
(785, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsArticleLiquidMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: delete from cms_article_theme where theme_name=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist', '2022-05-25 23:10:16'),
(786, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsArticleLiquidMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: delete from cms_article_theme where theme_name=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'olytest.cms_article_theme\' doesn\'t exist', '2022-05-25 23:11:34'),
(787, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-25 23:14:15'),
(788, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.article.supportType\":[\"4\"],\"oly.web.comment.enable\":[\"true\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:15:31'),
(789, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-25 23:15:34'),
(790, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.article.supportType\":[\"2\"],\"oly.web.comment.enable\":[\"true\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:17:42'),
(791, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-25 23:17:44'),
(792, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.article.supportType\":[\"1,2,3,4\"],\"oly.web.comment.enable\":[\"true\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:18:32'),
(793, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":5}', 0, NULL, '2022-05-25 23:18:35'),
(794, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":5}', 0, NULL, '2022-05-25 23:18:58'),
(795, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"201\"],\"dictLabel\":[\"投票\"],\"dictValue\":[\"4\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"投票类型  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:28:39'),
(796, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"201\"],\"dictLabel\":[\"投票\"],\"dictValue\":[\"4\"],\"dictType\":[\"cms_support_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"投票类型  基础类型\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:28:58'),
(797, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.article.supportType\":[\"\"],\"oly.web.comment.enable\":[\"true\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-25 23:29:06'),
(798, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-25 23:29:09'),
(799, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 15:50:06'),
(800, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"117\"],\"configGroup\":[\"zgcms\"],\"configName\":[\"oly.web.theme.zgcms.cat.style\"],\"configKey\":[\"oly.web.theme.zgcms.cat.style\"],\"configValueType\":[\"3\"],\"configValue\":[\"1\"],\"configType\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 19:15:52'),
(801, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 19:16:30'),
(802, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\">黔ICP备19001474号-3</a>\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:31:24'),
(803, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.author\":[\"止戈\"],\"oly.web.copyright\":[\"\"],\"oly.web.keywords\":[\"\"],\"oly.web.description\":[\"\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:41:44'),
(804, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" color=\\\"white\\\">黔ICP备19001474号-3</a>\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:50:46'),
(805, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" color=\\\"white\\\">黔ICP备19001474号-3</a>\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:52:05'),
(806, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" style=\\\"color:white\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:53:48'),
(807, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.domain\":[\"http://127.0.0.1:8090\"],\"oly.web.title\":[\"止戈博客\"],\"oly.web.index\":[\"/index\"],\"oly.web.logo\":[\"\"],\"oly.web.ico\":[\"\"],\"oly.web.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:54:53'),
(808, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:55:58'),
(809, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:57:37'),
(810, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:57:57'),
(811, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:57:58'),
(812, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"oly.web.article.supportType\":[\"\"],\"oly.web.comment.enable\":[\"true\"],\"configGroup\":[\"zgblog\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-26 20:58:00'),
(813, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:58:02'),
(814, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:58:06'),
(815, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:58:10'),
(816, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:58:25'),
(817, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-26 20:58:27'),
(818, '内容文章管理', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.add()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleTitle\":[\"test2\"],\"articleUrl\":[\"1653588598694\"],\"keywords\":[\"tesddsv\"],\"editor-markdown-doc\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\"],\"editor-html-code\":[\"<p>dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf</p>\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"1\"],\"articleType\":[\"1\"],\"description\":[\"\"],\"allowComment\":[\"1\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\",\"\",\"\",\"\",\"\"],\"articleMd\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\"],\"articleContent\":[\"<p>dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:11:00'),
(819, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/article/editVisible', '127.0.0.1', '内网IP', '{\"visible\":[\"3\"],\"articleIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:11:57'),
(820, '主题管理-重建索引', 2, 'com.oly.cms.admin.controller.page.CmsThemeController.buildArticleIndex()', 'POST', 1, 'admin', '研发部门', '/cms/theme/buildArticleIndex/zgblog', '127.0.0.1', '内网IP', '\"zgblog\"', '{\"msg\":\"操作成功\",\"code\":0,\"data\":0}', 0, NULL, '2022-05-27 02:15:23'),
(821, '内容文章管理', 1, 'com.oly.cms.admin.controller.page.CmsArticleController.add()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleTitle\":[\"test22\"],\"articleUrl\":[\"1653588954255\"],\"keywords\":[\"fdvfdgfd\"],\"editor-markdown-doc\":[\"\"],\"editor-html-code\":[\"\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"1\"],\"articleType\":[\"1\"],\"description\":[\"\"],\"allowComment\":[\"1\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\",\"\",\"\",\"\",\"\"],\"articleMd\":[\"\"],\"articleContent\":[\"\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:16:23'),
(822, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editVisible()', 'POST', 1, 'admin', '研发部门', '/cms/article/editVisible', '127.0.0.1', '内网IP', '{\"visible\":[\"3\"],\"articleIds\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:16:33'),
(823, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"5\"],\"articleTitle\":[\"test22\"],\"articleUrl\":[\"1653588954255\"],\"keywords\":[\"fdvfdgfd\"],\"editor-markdown-doc\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcv\"],\"editor-html-code\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcv</p>\\r\\n\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"1\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcv\"],\"articleContent\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcv</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:32:16'),
(824, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"4\"],\"articleTitle\":[\"test2\"],\"articleUrl\":[\"1653588598694\"],\"keywords\":[\"tesddsv\"],\"editor-markdown-doc\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\"],\"editor-html-code\":[\"<p>dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf</p>\\r\\n\"],\"cats\":[\"2\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"1\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\"],\"articleContent\":[\"<p>dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:32:29'),
(825, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"5\"],\"articleTitle\":[\"test22\"],\"articleUrl\":[\"1653588954255\"],\"keywords\":[\"fdvfdgfd\"],\"editor-markdown-doc\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb\"],\"editor-html-code\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb</p>\\r\\n\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"1\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb\"],\"articleContent\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:32:55'),
(826, '内容文章管理', 2, 'com.oly.cms.admin.controller.page.CmsArticleController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/edit', '127.0.0.1', '内网IP', '{\"articleId\":[\"5\"],\"articleTitle\":[\"test22\"],\"articleUrl\":[\"1653588954255\"],\"keywords\":[\"fdvfdgfd\"],\"editor-markdown-doc\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb\"],\"editor-html-code\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb</p>\\r\\n\"],\"cats\":[\"1\"],\"tags\":[\"1\"],\"chooseTag\":[\"\"],\"articleType\":[\"1\"],\"allowComment\":[\"1\"],\"description\":[\"\"],\"reprintUrl\":[\"\"],\"articleImg\":[\"\"],\"articleMd\":[\"vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb\"],\"articleContent\":[\"<p>vbvcbvcbvcbvcbvcbvcbvcbvcbvcbcvgbghgfhgfhgfhgfhgfhgfhgfhgfhgfhgfbvbvcvcbbvcbvbvvcvcb</p>\\n\"],\"articleToc\":[\"\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\"],\"articleBuild\":[\"1\"],\"articleSummary\":[\"dfgfdgfdgfdgfdgfdgfdgfdgvxcvcxvcxvcvbvfddgf\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 02:35:07'),
(827, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈管理系统\"],\"sys.common.description\":[\"止戈管理系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:25:59'),
(828, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"\"],\"sys.login.info\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:26:47'),
(829, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈管理系统\"],\"sys.common.description\":[\"止戈管理系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:27:20'),
(830, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:27:28'),
(831, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"\"],\"sys.login.info\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\\r\\nhttp://127.0.0.1:8090/admin\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:31:21'),
(832, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"\"],\"sys.login.info\":[\"1111111111\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:34:29'),
(833, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"\"],\"sys.login.info\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\\r\\nhttp://127.0.0.1:8090/admin\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:34:52'),
(834, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"\"],\"sys.login.info\":[\"   <ul class=\\\"m-b\\\">\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> SpringBoot</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Mybatis</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Shiro</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Thymeleaf</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Bootstrap</li>\\r\\n                    </ul>\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:44:26'),
(835, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈建站系统\"],\"sys.common.description\":[\"止戈建站系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 10:45:33'),
(836, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/09/QJ8518313644_20220509020614A001.jpg\"],\"sys.login.info\":[\"   <ul class=\\\"m-b\\\">\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> SpringBoot</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Mybatis</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Shiro</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Thymeleaf</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Bootstrap</li>\\r\\n                    </ul>\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 11:25:36'),
(837, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.common.title\":[\"止戈建站系统\"],\"sys.common.description\":[\"止戈建站系统\"],\"sys.common.logo\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.ico\":[\"http://127.0.0.1:8090/oss/download/avatar/2022/03/10/blob_20220310223629A001.png\"],\"sys.common.footer\":[\"<a href=\\\"https://beian.miit.gov.cn/\\\" target=\\\"_blank\\\" >黔ICP备19001474号-3</a>\"],\"configGroup\":[\"sysCommon\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:16:27'),
(838, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/09/QJ8518313644_20220509020614A001.jpg\"],\"sys.login.info\":[\"   <ul class=\\\"m-b\\\">\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> SpringBoot</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Mybatis</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Shiro</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Thymeleaf</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Bootstrap</li>\\r\\n                    </ul>\"],\"sys.login.msg\":[\"false\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:25:12'),
(839, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.login.back\":[\"http://127.0.0.1:8090/oss/download/image/2022/05/09/QJ8518313644_20220509020614A001.jpg\"],\"sys.login.info\":[\"   <ul class=\\\"m-b\\\">\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> SpringBoot</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Mybatis</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Shiro</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Thymeleaf</li>\\r\\n                        <li><i class=\\\"fa fa-arrow-circle-o-right m-r-xs\\\"></i> Bootstrap</li>\\r\\n                    </ul>\"],\"sys.login.msg\":[\"true\"],\"configGroup\":[\"sysLogin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 02:08:31'),
(842, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-yellow\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"topnav\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 04:32:46'),
(843, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 17:48:00'),
(844, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; line-height: 24px; white-space: pre;\\\"><div><span style=\\\"color: #569cd6;\\\">package</span> <span style=\\\"color: #4ec9b0;\\\">com</span>.<span style=\\\"color: #4ec9b0;\\\">ruoyi</span>.<span style=\\\"color: #4ec9b0;\\\">system</span>.<span style=\\\"color: #4ec9b0;\\\">core</span>.<span style=\\\"color: #4ec9b0;\\\">service</span>.<span style=\\\"color: #4ec9b0;\\\">impl</span>;</div><br><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">java</span>.<span style=\\\"color: #4ec9b0;\\\">util</span>.<span style=\\\"color: #4ec9b0;\\\">ArrayList</span>;</div><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">java</span>.<span style=\\\"color: #4ec9b0;\\\">util</span>.<span style=\\\"color: #4ec9b0;\\\">List</span>;</div><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">java</span>.<span style=\\\"color: #4ec9b0;\\\">util</span>.<span style=\\\"color: #4ec9b0;\\\">stream</span>.<span style=\\\"color: #4ec9b0;\\\">Collectors</span>;</div><br><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">javax</span>.<span style=\\\"color: #4ec9b0;\\\">validation</span>.<span style=\\\"color: #4ec9b0;\\\">Validator</span>;</div><br><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">com</span>.<span style=\\\"color: #4ec9b0;\\\">ruoyi</span>.<span style=\\\"color: #4ec9b0;\\\">common</span>.<span style=\\\"color: #4ec9b0;\\\">annotation</span>.<span style=\\\"color: #4ec9b0;\\\">DataScope</span>;</div><div><span style=\\\"color: #569cd6;\\\">import</span> <span style=\\\"color: #4ec9b0;\\\">com</span>.<span style=\\\"color: #4ec9b0;\\\">ruoyi</span>.<span style=\\\"color: #4ec9b0;\\\">common</span>.<span style=\\\"color: #4ec9b0;\\\">constant</span>.<span style=\\\"color: #4ec', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-system\\system-core\\target\\classes\\mapper\\system\\core\\SysNoticeMapper.xml]\r\n### The error may involve com.ruoyi.system.core.mapper.SysNoticeMapper.updateNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = sysdate()          where notice_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2022-05-28 17:49:42'),
(845, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; line-height: 24px; white-space: pre;\\\"><div>&nbsp;<span style=\\\"color: #569cd6;\\\">public</span> <span style=\\\"color: #4ec9b0;\\\">SysUser</span> <span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #4ec9b0;\\\">String</span> <span style=\\\"color: #9cdcfe;\\\">userName</span>) {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; <span style=\\\"color: #c586c0;\\\">return</span> <span style=\\\"color: #9cdcfe;\\\">userMapper</span>.<span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #9cdcfe;\\\">userName</span>);</div><div>&nbsp; &nbsp; }</div></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 17:52:00'),
(846, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 17:52:03'),
(847, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-337990.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/thumb-1920-337990_20220528180109A001.jpg\",\"ossType\":0,\"params\":{},\"size\":139261},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:01:10'),
(848, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-399827.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/thumb-1920-399827_20220528180228A002.jpg\",\"ossType\":0,\"params\":{},\"size\":167963},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:02:29'),
(849, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"thumb-1920-337990.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/thumb-1920-337990_20220528180304A003.jpg\",\"ossType\":0,\"params\":{},\"size\":139261},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:03:04'),
(850, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8454619350.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/QJ8454619350_20220528180523A004.jpg\",\"ossType\":0,\"params\":{},\"size\":134514},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:05:23'),
(851, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/QJ8518313644_20220528180713A005.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:07:14'),
(852, '文件管理', 1, 'com.ruoyi.oss.controller.OlyOssAdminController.upload()', 'POST', 1, 'admin', '研发部门', '/oly/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"data\":{\"createBy\":\"1\",\"domain\":\"http://127.0.0.1:8090/oss/download/\",\"fileHeard\":\"image/jpeg\",\"fileName\":\"QJ8518313644.jpg\",\"fileType\":\"image\",\"fk\":\"image/2022/05/28/QJ8518313644_20220528180915A006.jpg\",\"ossType\":0,\"params\":{},\"size\":121178},\"msg\":\"上传成功\"}', 0, NULL, '2022-05-28 18:09:15'),
(853, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; line-height: 24px; white-space: pre;\\\"><div><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\\\" style=\\\"width: 794px;\\\" data-filename=\\\"QJ8518313644.jpg\\\">&nbsp;<span style=\\\"color: #569cd6;\\\">public</span> <span style=\\\"color: #4ec9b0;\\\">SysUser</span> <span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #4ec9b0;\\\">String</span> <span style=\\\"color: #9cdcfe;\\\">userName</span>) {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; <span style=\\\"color: #c586c0;\\\">return</span> <span style=\\\"color: #9cdcfe;\\\">userMapper</span>.<span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #9cdcfe;\\\">userName</span>);</div><div>&nbsp; &nbsp; }</div></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:09:18'),
(854, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:09:20'),
(855, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; line-height: 24px; white-space: pre;\\\"><div><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\\\" style=\\\"width: 794px;\\\" data-filename=\\\"QJ8518313644.jpg\\\">&nbsp;</div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\"><br></span></div><div><span style=\\\"color: #569cd6;\\\">public</span> <span style=\\\"color: #4ec9b0;\\\">SysUser</span> <span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #4ec9b0;\\\">String</span> <span style=\\\"color: #9cdcfe;\\\">userName</span>) {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; <span style=\\\"color: #c586c0;\\\">return</span> <span style=\\\"color: #9cdcfe;\\\">userMapper</span>.<span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #9cdcfe;\\\">userName</span>);</div><div>&nbsp; &nbsp; }</div></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:16:03'),
(856, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:16:05'),
(857, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"background-color: rgb(30, 30, 30); line-height: 24px;\\\"><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\\\" style=\\\"width: 794px;\\\" data-filename=\\\"QJ8518313644.jpg\\\">&nbsp;</div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\"><br></span></div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><span style=\\\"color: #569cd6;\\\">public</span> <span style=\\\"color: #4ec9b0;\\\">SysUser</span> <span style=\\\"color: #dcdcaa;\\\">selectUserByLoginName</span>(<span style=\\\"color: #4ec9b0;\\\">String</span> <span style=\\\"color: #9cdcfe;\\\">userName</span>) {</div><div style=\\\"color: rgb', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-system\\system-core\\target\\classes\\mapper\\system\\core\\SysNoticeMapper.xml]\r\n### The error may involve com.ruoyi.system.core.mapper.SysNoticeMapper.updateNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = sysdate()          where notice_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2022-05-28 18:22:36'),
(858, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"background-color: rgb(30, 30, 30); line-height: 24px;\\\"><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\\\" style=\\\"width: 794px;\\\" data-filename=\\\"QJ8518313644.jpg\\\">&nbsp;</div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\">&lt;script&gt;<br></div><div style=\\\"\\\"><font color=\\\"#d4d4d4\\\" face=\\\"Consolas, Courier New, monospace\\\"><span style=\\\"font-size: 18px; white-space: pre;\\\">\\t   alert(1);\\r\\n\\t&lt;/script&gt;</span></font><br></div></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:23:15'),
(859, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:23:35');
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`) VALUES
(860, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 若依新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<div style=\\\"background-color: rgb(30, 30, 30); line-height: 24px;\\\"><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><img src=\\\"http://127.0.0.1:8090/oss/download/image/2022/05/28/QJ8518313644_20220528180915A006.jpg\\\" style=\\\"width: 794px;\\\" data-filename=\\\"QJ8518313644.jpg\\\">&nbsp;</div><div style=\\\"color: rgb(212, 212, 212); font-family: Consolas, &quot;Courier New&quot;, monospace; font-size: 18px; white-space: pre;\\\"><br></div></div>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:24:01'),
(861, '公告管理', 9, 'com.ruoyi.web.controller.system.SysNoticeController.refreshCache()', 'GET', 1, 'admin', '研发部门', '/system/notice/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 19:36:40'),
(862, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-yellow\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"topnav\"],\"sys.index.demoMenu\":[\"false\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-29 05:23:52'),
(863, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editByGkSaves()', 'POST', 1, 'admin', '研发部门', '/system/config/updateByGk', '127.0.0.1', '内网IP', '{\"sys.index.skinName\":[\"skin-yellow\"],\"sys.index.sideTheme\":[\"theme-dark\"],\"sys.index.menuStyle\":[\"topnav\"],\"sys.index.demoMenu\":[\"true\"],\"sys.index.ignoreFooter\":[\"true\"],\"configGroup\":[\"sysIndex\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-29 05:24:18'),
(864, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"cms_union\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 12:40:58'),
(865, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 12:41:04'),
(866, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"cms_union\"],\"tableComment\":[\"联盟推广\"],\"className\":[\"CmsUnion\"],\"functionAuthor\":[\"zg\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"42\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"商品id\"],\"columns[0].javaType\":[\"String\"],\"columns[0].javaField\":[\"shopId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"43\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"商品名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"shopName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"44\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"商品主图\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"shopImg\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"textarea\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"45\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"商品详情页链接地址\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"shopIndex\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"textarea\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"46\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"店铺名称\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"homeName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"47\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"商品价格(单位：元)\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"shopPrice', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 12:42:29'),
(867, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/cms_union', '127.0.0.1', '内网IP', '\"cms_union\"', NULL, 0, NULL, '2022-05-30 12:44:08'),
(868, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1069\"],\"parentId\":[\"1063\"],\"menuType\":[\"C\"],\"menuName\":[\"联盟管理\"],\"url\":[\"/cms/union\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 20:02:27'),
(869, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1069\"],\"menuType\":[\"F\"],\"menuName\":[\"添加联盟\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 20:04:05'),
(870, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1069\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑联盟\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 20:04:54'),
(871, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1069\"],\"menuType\":[\"F\"],\"menuName\":[\"删除联盟\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 20:05:49'),
(872, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1069\"],\"menuType\":[\"F\"],\"menuName\":[\"查看联盟\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"cms:union:view\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 20:06:30'),
(873, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"118\"],\"dictName\":[\"商品状态\"],\"dictType\":[\"cms_union_visible\"],\"status\":[\"0\"],\"remark\":[\"商品状态\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 23:54:06'),
(874, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"119\"],\"dictName\":[\"联盟类型\"],\"dictType\":[\"cms_union_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-30 23:54:31'),
(875, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"a06d5e04-ad80-443d-acc9-7e8300bf8941_用户数据.xlsx\",\"code\":0}', 0, NULL, '2022-05-31 04:00:18'),
(876, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"288dbffc-9113-4208-bc1c-ed2f9c867186_用户数据.xlsx\",\"code\":0}', 0, NULL, '2022-05-31 04:03:28'),
(877, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"4e384273-dc92-4157-9c27-8bb4b9ac5b59_用户数据.xlsx\",\"code\":0}', 0, NULL, '2022-05-31 04:09:00'),
(878, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'createBy\' in \'field list\'\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsUnionMapper.xml]\r\n### The error may involve com.oly.cms.admin.mapper.CmsUnionMapper.insertCmsUnion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cms_union          ( shop_name,             shop_img,             shop_index,             home_name,             shop_price,             shop_sales,             income_ratio,             commission,             wang_name,             sort_url,             taoke_url,             coupon_count,             coupon_num,             coupon_price,             coupon_start_time,             coupon_end_time,             coupon_url,             coupon_code,             coupon_sort_url,             market_is,                                                                               create_time,             createBy,                          visible,                          tao_type )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                              sysdate(),             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'createBy\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'createBy\' in \'field list\'<br/>2、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'createBy\' in \'field list\'\r\n### The error may exist in file [C:\\project', '2022-06-01 03:29:33'),
(879, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsUnionMapper.xml]\r\n### The error may involve com.oly.cms.admin.mapper.CmsUnionMapper.insertCmsUnion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cms_union          ( shop_name,             shop_img,             shop_index,             home_name,             shop_price,             shop_sales,             income_ratio,             commission,             wang_name,             sort_url,             taoke_url,             coupon_count,             coupon_num,             coupon_price,             coupon_start_time,             coupon_end_time,             coupon_url,             coupon_code,             coupon_sort_url,             market_is,                                                                               create_time,             create_by,                          visible,                          tao_type )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                              sysdate(),             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'<br/>2、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_by\' in \'field list\'\r\n### The error may exist in file [C:\\pr', '2022-06-01 03:34:54'),
(880, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'shop_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsUnionMapper.xml]\r\n### The error may involve com.oly.cms.admin.mapper.CmsUnionMapper.insertCmsUnion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cms_union          ( shop_name,             shop_img,             shop_index,             home_name,             shop_price,             shop_sales,             income_ratio,             commission,             wang_name,             sort_url,             taoke_url,             coupon_count,             coupon_num,             coupon_price,             coupon_start_time,             coupon_end_time,             coupon_url,             coupon_code,             coupon_sort_url,             market_is,                                                                               create_time,             create_by,                          visible,                          tao_type )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                              sysdate(),             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'shop_id\' doesn\'t have a default value\n; Field \'shop_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'shop_id\' doesn\'t have a default value<br/>2、商品id null 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'shop_id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoY', '2022-06-01 03:43:32'),
(881, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、商品id 645730512068 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_by\' doesn\'t have a default value\r\n### The error may exist in file [C:\\project\\RuoYi\\473\\RuoYi\\ruoyi-oly\\oly-cms\\cms-admin\\target\\classes\\mapper\\oly\\CmsUnionMapper.xml]\r\n### The error may involve com.oly.cms.admin.mapper.CmsUnionMapper.insertCmsUnion-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into cms_union          ( shop_id,             shop_name,             shop_img,             shop_index,             home_name,             shop_price,             shop_sales,             income_ratio,             commission,             wang_name,             sort_url,             taoke_url,             coupon_count,             coupon_num,             coupon_price,             coupon_start_time,             coupon_end_time,             coupon_url,             coupon_code,             coupon_sort_url,             market_is,                                                                               create_time,             create_by,                          visible,                          tao_type )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                                              sysdate(),             ?,                          ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'update_by\' doesn\'t have a default value\n; Field \'update_by\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'update_by\' doesn\'t have a default value<br/>2、商品id 640132801259 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'update_by\' doesn\'t have a d', '2022-06-01 03:51:27'),
(882, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 38 条，数据如下：<br/>1、商品id 645730512068 导入成功<br/>2、商品id 640132801259 导入成功<br/>3、商品id 606518315346 导入成功<br/>4、商品id 597345497102 导入成功<br/>5、商品id 579837973670 导入成功<br/>6、商品id 564677404266 导入成功<br/>7、商品id 558728467046 导入成功<br/>8、商品id 614521691764 导入成功<br/>9、商品id 569639712367 导入成功<br/>10、商品id 567758659175 导入成功<br/>11、商品id 617968247973 导入成功<br/>12、商品id 615846742896 导入成功<br/>13、商品id 602897454410 导入成功<br/>14、商品id 597210467626 导入成功<br/>15、商品id 567119947990 导入成功<br/>16、商品id 24517144470 导入成功<br/>17、商品id 580442138828 导入成功<br/>18、商品id 610541583700 导入成功<br/>19、商品id 578167245233 导入成功<br/>20、商品id 20600624998 导入成功<br/>21、商品id 614502953910 导入成功<br/>22、商品id 599263048413 导入成功<br/>23、商品id 602799485551 导入成功<br/>24、商品id 578985014923 导入成功<br/>25、商品id 559077508298 导入成功<br/>26、商品id 606645276518 导入成功<br/>27、商品id 608689411162 导入成功<br/>28、商品id 601501037373 导入成功<br/>29、商品id 587575032289 导入成功<br/>30、商品id 610045888881 导入成功<br/>31、商品id 609838119857 导入成功<br/>32、商品id 565973797354 导入成功<br/>33、商品id 554926440769 导入成功<br/>34、商品id 594083012474 导入成功<br/>35、商品id 587603338781 导入成功<br/>36、商品id 587991649073 导入成功<br/>37、商品id 527981440603 导入成功<br/>38、商品id 598088771970 导入成功\",\"code\":0}', 0, NULL, '2022-06-01 03:56:08'),
(883, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 38 条，数据如下：<br/>1、商品id 645730512068 更新成功<br/>2、商品id 640132801259 更新成功<br/>3、商品id 606518315346 更新成功<br/>4、商品id 597345497102 更新成功<br/>5、商品id 579837973670 更新成功<br/>6、商品id 564677404266 更新成功<br/>7、商品id 558728467046 更新成功<br/>8、商品id 614521691764 更新成功<br/>9、商品id 569639712367 更新成功<br/>10、商品id 567758659175 更新成功<br/>11、商品id 617968247973 更新成功<br/>12、商品id 615846742896 更新成功<br/>13、商品id 602897454410 更新成功<br/>14、商品id 597210467626 更新成功<br/>15、商品id 567119947990 更新成功<br/>16、商品id 24517144470 更新成功<br/>17、商品id 580442138828 更新成功<br/>18、商品id 610541583700 更新成功<br/>19、商品id 578167245233 更新成功<br/>20、商品id 20600624998 更新成功<br/>21、商品id 614502953910 更新成功<br/>22、商品id 599263048413 更新成功<br/>23、商品id 602799485551 更新成功<br/>24、商品id 578985014923 更新成功<br/>25、商品id 559077508298 更新成功<br/>26、商品id 606645276518 更新成功<br/>27、商品id 608689411162 更新成功<br/>28、商品id 601501037373 更新成功<br/>29、商品id 587575032289 更新成功<br/>30、商品id 610045888881 更新成功<br/>31、商品id 609838119857 更新成功<br/>32、商品id 565973797354 更新成功<br/>33、商品id 554926440769 更新成功<br/>34、商品id 594083012474 更新成功<br/>35、商品id 587603338781 更新成功<br/>36、商品id 587991649073 更新成功<br/>37、商品id 527981440603 更新成功<br/>38、商品id 598088771970 更新成功\",\"code\":0}', 0, NULL, '2022-06-01 03:56:52'),
(884, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 38 条，数据如下：<br/>1、商品id 645730512068 更新成功<br/>2、商品id 640132801259 更新成功<br/>3、商品id 606518315346 更新成功<br/>4、商品id 597345497102 更新成功<br/>5、商品id 579837973670 更新成功<br/>6、商品id 564677404266 更新成功<br/>7、商品id 558728467046 更新成功<br/>8、商品id 614521691764 更新成功<br/>9、商品id 569639712367 更新成功<br/>10、商品id 567758659175 更新成功<br/>11、商品id 617968247973 更新成功<br/>12、商品id 615846742896 更新成功<br/>13、商品id 602897454410 更新成功<br/>14、商品id 597210467626 更新成功<br/>15、商品id 567119947990 更新成功<br/>16、商品id 24517144470 更新成功<br/>17、商品id 580442138828 更新成功<br/>18、商品id 610541583700 更新成功<br/>19、商品id 578167245233 更新成功<br/>20、商品id 20600624998 更新成功<br/>21、商品id 614502953910 更新成功<br/>22、商品id 599263048413 更新成功<br/>23、商品id 602799485551 更新成功<br/>24、商品id 578985014923 更新成功<br/>25、商品id 559077508298 更新成功<br/>26、商品id 606645276518 更新成功<br/>27、商品id 608689411162 更新成功<br/>28、商品id 601501037373 更新成功<br/>29、商品id 587575032289 更新成功<br/>30、商品id 610045888881 更新成功<br/>31、商品id 609838119857 更新成功<br/>32、商品id 565973797354 更新成功<br/>33、商品id 554926440769 更新成功<br/>34、商品id 594083012474 更新成功<br/>35、商品id 587603338781 更新成功<br/>36、商品id 587991649073 更新成功<br/>37、商品id 527981440603 更新成功<br/>38、商品id 598088771970 更新成功\",\"code\":0}', 0, NULL, '2022-06-01 04:01:38'),
(885, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"taoType\":[\"0\"]}', NULL, 1, '很抱歉，导入失败！共 38 条数据格式不正确，错误如下：<br/>1、商品id 645730512068 已存在<br/>2、商品id 640132801259 已存在<br/>3、商品id 606518315346 已存在<br/>4、商品id 597345497102 已存在<br/>5、商品id 579837973670 已存在<br/>6、商品id 564677404266 已存在<br/>7、商品id 558728467046 已存在<br/>8、商品id 614521691764 已存在<br/>9、商品id 569639712367 已存在<br/>10、商品id 567758659175 已存在<br/>11、商品id 617968247973 已存在<br/>12、商品id 615846742896 已存在<br/>13、商品id 602897454410 已存在<br/>14、商品id 597210467626 已存在<br/>15、商品id 567119947990 已存在<br/>16、商品id 24517144470 已存在<br/>17、商品id 580442138828 已存在<br/>18、商品id 610541583700 已存在<br/>19、商品id 578167245233 已存在<br/>20、商品id 20600624998 已存在<br/>21、商品id 614502953910 已存在<br/>22、商品id 599263048413 已存在<br/>23、商品id 602799485551 已存在<br/>24、商品id 578985014923 已存在<br/>25、商品id 559077508298 已存在<br/>26、商品id 606645276518 已存在<br/>27、商品id 608689411162 已存在<br/>28、商品id 601501037373 已存在<br/>29、商品id 587575032289 已存在<br/>30、商品id 610045888881 已存在<br/>31、商品id 609838119857 已存在<br/>32、商品id 565973797354 已存在<br/>33、商品id 554926440769 已存在<br/>34、商品id 594083012474 已存在<br/>35、商品id 587603338781 已存在<br/>36、商品id 587991649073 已存在<br/>37、商品id 527981440603 已存在<br/>38、商品id 598088771970 已存在', '2022-06-01 04:02:02'),
(886, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20600624998,24517144470,527981440603,554926440769,558728467046,559077508298,564677404266,565973797354,567119947990,567758659175\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:35:24'),
(887, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"569639712367,578167245233,578985014923,579837973670,580442138828,587575032289,587603338781,587991649073,594083012474,597210467626\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:35:28'),
(888, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"597345497102,598088771970,599263048413,601501037373,602799485551,602897454410,606518315346,606645276518,608689411162,609838119857\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:35:32'),
(889, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"610045888881,610541583700,614502953910,614521691764,615846742896,617968247973,640132801259,645730512068\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:35:36'),
(890, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"150\"],\"dictLabel\":[\"淘宝\"],\"dictValue\":[\"TB\"],\"dictType\":[\"cms_union_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:36:27'),
(891, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"151\"],\"dictLabel\":[\"京东\"],\"dictValue\":[\"JD\"],\"dictType\":[\"cms_union_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:36:37'),
(892, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"152\"],\"dictLabel\":[\"苏宁\"],\"dictValue\":[\"SN\"],\"dictType\":[\"cms_union_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:36:45'),
(893, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"153\"],\"dictLabel\":[\"拼多多\"],\"dictValue\":[\"PDD\"],\"dictType\":[\"cms_union_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:36:55'),
(894, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"152\"],\"dictLabel\":[\"苏宁\"],\"dictValue\":[\"SN\"],\"dictType\":[\"cms_union_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:37:03'),
(895, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"TB\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 49 条，数据如下：<br/>1、商品id tb_null 导入成功<br/>2、商品id tb_null 更新成功<br/>3、商品id tb_null 更新成功<br/>4、商品id tb_null 更新成功<br/>5、商品id tb_null 更新成功<br/>6、商品id tb_null 更新成功<br/>7、商品id tb_null 更新成功<br/>8、商品id tb_null 更新成功<br/>9、商品id tb_null 更新成功<br/>10、商品id tb_null 更新成功<br/>11、商品id tb_null 更新成功<br/>12、商品id tb_null 更新成功<br/>13、商品id tb_null 更新成功<br/>14、商品id tb_null 更新成功<br/>15、商品id tb_null 更新成功<br/>16、商品id tb_null 更新成功<br/>17、商品id tb_null 更新成功<br/>18、商品id tb_null 更新成功<br/>19、商品id tb_null 更新成功<br/>20、商品id tb_null 更新成功<br/>21、商品id tb_null 更新成功<br/>22、商品id tb_null 更新成功<br/>23、商品id tb_null 更新成功<br/>24、商品id tb_null 更新成功<br/>25、商品id tb_null 更新成功<br/>26、商品id tb_null 更新成功<br/>27、商品id tb_null 更新成功<br/>28、商品id tb_null 更新成功<br/>29、商品id tb_null 更新成功<br/>30、商品id tb_null 更新成功<br/>31、商品id tb_null 更新成功<br/>32、商品id tb_null 更新成功<br/>33、商品id tb_null 更新成功<br/>34、商品id tb_null 更新成功<br/>35、商品id tb_null 更新成功<br/>36、商品id tb_null 更新成功<br/>37、商品id tb_null 更新成功<br/>38、商品id tb_null 更新成功<br/>39、商品id tb_null 更新成功<br/>40、商品id tb_null 更新成功<br/>41、商品id tb_null 更新成功<br/>42、商品id tb_null 更新成功<br/>43、商品id tb_null 更新成功<br/>44、商品id tb_null 更新成功<br/>45、商品id tb_null 更新成功<br/>46、商品id tb_null 更新成功<br/>47、商品id tb_null 更新成功<br/>48、商品id tb_null 更新成功<br/>49、商品id tb_null 更新成功\",\"code\":0}', 0, NULL, '2022-06-01 22:37:39'),
(896, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"tb_null\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:40:51'),
(897, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"TB\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 38 条，数据如下：<br/>1、商品id tb_645730512068 导入成功<br/>2、商品id tb_640132801259 导入成功<br/>3、商品id tb_606518315346 导入成功<br/>4、商品id tb_597345497102 导入成功<br/>5、商品id tb_579837973670 导入成功<br/>6、商品id tb_564677404266 导入成功<br/>7、商品id tb_558728467046 导入成功<br/>8、商品id tb_614521691764 导入成功<br/>9、商品id tb_569639712367 导入成功<br/>10、商品id tb_567758659175 导入成功<br/>11、商品id tb_617968247973 导入成功<br/>12、商品id tb_615846742896 导入成功<br/>13、商品id tb_602897454410 导入成功<br/>14、商品id tb_597210467626 导入成功<br/>15、商品id tb_567119947990 导入成功<br/>16、商品id tb_24517144470 导入成功<br/>17、商品id tb_580442138828 导入成功<br/>18、商品id tb_610541583700 导入成功<br/>19、商品id tb_578167245233 导入成功<br/>20、商品id tb_20600624998 导入成功<br/>21、商品id tb_614502953910 导入成功<br/>22、商品id tb_599263048413 导入成功<br/>23、商品id tb_602799485551 导入成功<br/>24、商品id tb_578985014923 导入成功<br/>25、商品id tb_559077508298 导入成功<br/>26、商品id tb_606645276518 导入成功<br/>27、商品id tb_608689411162 导入成功<br/>28、商品id tb_601501037373 导入成功<br/>29、商品id tb_587575032289 导入成功<br/>30、商品id tb_610045888881 导入成功<br/>31、商品id tb_609838119857 导入成功<br/>32、商品id tb_565973797354 导入成功<br/>33、商品id tb_554926440769 导入成功<br/>34、商品id tb_594083012474 导入成功<br/>35、商品id tb_587603338781 导入成功<br/>36、商品id tb_587991649073 导入成功<br/>37、商品id tb_527981440603 导入成功<br/>38、商品id tb_598088771970 导入成功\",\"code\":0}', 0, NULL, '2022-06-01 22:46:47'),
(898, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"TB\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 49 条，数据如下：<br/>1、商品id tb_null 导入成功<br/>2、商品id tb_null 更新成功<br/>3、商品id tb_null 更新成功<br/>4、商品id tb_null 更新成功<br/>5、商品id tb_null 更新成功<br/>6、商品id tb_null 更新成功<br/>7、商品id tb_null 更新成功<br/>8、商品id tb_null 更新成功<br/>9、商品id tb_null 更新成功<br/>10、商品id tb_null 更新成功<br/>11、商品id tb_null 更新成功<br/>12、商品id tb_null 更新成功<br/>13、商品id tb_null 更新成功<br/>14、商品id tb_null 更新成功<br/>15、商品id tb_null 更新成功<br/>16、商品id tb_null 更新成功<br/>17、商品id tb_null 更新成功<br/>18、商品id tb_null 更新成功<br/>19、商品id tb_null 更新成功<br/>20、商品id tb_null 更新成功<br/>21、商品id tb_null 更新成功<br/>22、商品id tb_null 更新成功<br/>23、商品id tb_null 更新成功<br/>24、商品id tb_null 更新成功<br/>25、商品id tb_null 更新成功<br/>26、商品id tb_null 更新成功<br/>27、商品id tb_null 更新成功<br/>28、商品id tb_null 更新成功<br/>29、商品id tb_null 更新成功<br/>30、商品id tb_null 更新成功<br/>31、商品id tb_null 更新成功<br/>32、商品id tb_null 更新成功<br/>33、商品id tb_null 更新成功<br/>34、商品id tb_null 更新成功<br/>35、商品id tb_null 更新成功<br/>36、商品id tb_null 更新成功<br/>37、商品id tb_null 更新成功<br/>38、商品id tb_null 更新成功<br/>39、商品id tb_null 更新成功<br/>40、商品id tb_null 更新成功<br/>41、商品id tb_null 更新成功<br/>42、商品id tb_null 更新成功<br/>43、商品id tb_null 更新成功<br/>44、商品id tb_null 更新成功<br/>45、商品id tb_null 更新成功<br/>46、商品id tb_null 更新成功<br/>47、商品id tb_null 更新成功<br/>48、商品id tb_null 更新成功<br/>49、商品id tb_null 更新成功\",\"code\":0}', 0, NULL, '2022-06-01 22:48:25'),
(899, '联盟推广', 3, 'com.oly.cms.admin.controller.page.CmsUnionController.remove()', 'POST', 1, 'admin', '研发部门', '/cms/union/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"tb_null\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-01 22:52:52'),
(900, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"JD\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 49 条，数据如下：<br/>1、商品id jd_3365600153006209 导入成功<br/>2、商品id jd_4145743538372087 导入成功<br/>3、商品id jd_5241083017312225 导入成功<br/>4、商品id jd_5491413412933424 导入成功<br/>5、商品id jd_3675502931212055 导入成功<br/>6、商品id jd_8111655361665011 导入成功<br/>7、商品id jd_5715920714203505 导入成功<br/>8、商品id jd_6483987253455660 导入成功<br/>9、商品id jd_7064843821195528 导入成功<br/>10、商品id jd_1821745353433617 导入成功<br/>11、商品id jd_9083943154341986 导入成功<br/>12、商品id jd_0021199443396097 导入成功<br/>13、商品id jd_5052454553141291 导入成功<br/>14、商品id jd_7449750103118404 导入成功<br/>15、商品id jd_7504426236050259 导入成功<br/>16、商品id jd_3082586129900045 导入成功<br/>17、商品id jd_5700300081737123 导入成功<br/>18、商品id jd_3041353184205109 导入成功<br/>19、商品id jd_2523503823355687 导入成功<br/>20、商品id jd_5369225011384337 导入成功<br/>21、商品id jd_1528651206695410 导入成功<br/>22、商品id jd_2153364146781204 导入成功<br/>23、商品id jd_7762438055231355 导入成功<br/>24、商品id jd_4178405468831335 导入成功<br/>25、商品id jd_5757151546212524 导入成功<br/>26、商品id jd_6695381768500398 导入成功<br/>27、商品id jd_3724243269034741 导入成功<br/>28、商品id jd_3247623202070273 导入成功<br/>29、商品id jd_6842548136928118 导入成功<br/>30、商品id jd_5341010031787506 导入成功<br/>31、商品id jd_1395422373504441 导入成功<br/>32、商品id jd_1176118294307141 导入成功<br/>33、商品id jd_9564871611114853 导入成功<br/>34、商品id jd_8154400448583220 导入成功<br/>35、商品id jd_3823944742482516 导入成功<br/>36、商品id jd_9326389857143741 导入成功<br/>37、商品id jd_0446384455270118 导入成功<br/>38、商品id jd_0021936432671575 导入成功<br/>39、商品id jd_1155803534025741 导入成功<br/>40、商品id jd_8676139502538399 导入成功<br/>41、商品id jd_1951113356492861 导入成功<br/>42、商品id jd_0762178880300456 导入成功<br/>43、商品id jd_1674454715332070 导入成功<br/>44、商品id jd_3511304424639228 导入成功<br/>45、商品id jd_4102430545348924 导入成功<br/>46、商品id jd_2140013421302001 导入成功<br/>47、商品id jd_7403838070383413 导入成功<br/>48、商品id jd_1734550950110223 导入成功<br/>49、商品id jd_4953902224503143 导入成功\",\"code\":0}', 0, NULL, '2022-06-01 22:53:12'),
(901, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"TB\"],\"updateSupport\":[\"on\"]}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 38 条，数据如下：<br/>1、商品id tb_645730512068 导入成功<br/>2、商品id tb_640132801259 导入成功<br/>3、商品id tb_606518315346 导入成功<br/>4、商品id tb_597345497102 导入成功<br/>5、商品id tb_579837973670 导入成功<br/>6、商品id tb_564677404266 导入成功<br/>7、商品id tb_558728467046 导入成功<br/>8、商品id tb_614521691764 导入成功<br/>9、商品id tb_569639712367 导入成功<br/>10、商品id tb_567758659175 导入成功<br/>11、商品id tb_617968247973 导入成功<br/>12、商品id tb_615846742896 导入成功<br/>13、商品id tb_602897454410 导入成功<br/>14、商品id tb_597210467626 导入成功<br/>15、商品id tb_567119947990 导入成功<br/>16、商品id tb_24517144470 导入成功<br/>17、商品id tb_580442138828 导入成功<br/>18、商品id tb_610541583700 导入成功<br/>19、商品id tb_578167245233 导入成功<br/>20、商品id tb_20600624998 导入成功<br/>21、商品id tb_614502953910 导入成功<br/>22、商品id tb_599263048413 导入成功<br/>23、商品id tb_602799485551 导入成功<br/>24、商品id tb_578985014923 导入成功<br/>25、商品id tb_559077508298 导入成功<br/>26、商品id tb_606645276518 导入成功<br/>27、商品id tb_608689411162 导入成功<br/>28、商品id tb_601501037373 导入成功<br/>29、商品id tb_587575032289 导入成功<br/>30、商品id tb_610045888881 导入成功<br/>31、商品id tb_609838119857 导入成功<br/>32、商品id tb_565973797354 导入成功<br/>33、商品id tb_554926440769 导入成功<br/>34、商品id tb_594083012474 导入成功<br/>35、商品id tb_587603338781 导入成功<br/>36、商品id tb_587991649073 导入成功<br/>37、商品id tb_527981440603 导入成功<br/>38、商品id tb_598088771970 导入成功\",\"code\":0}', 0, NULL, '2022-06-01 23:34:39'),
(902, '联盟推广', 6, 'com.oly.cms.admin.controller.page.CmsUnionController.importData()', 'POST', 1, 'admin', '研发部门', '/cms/union/importData', '127.0.0.1', '内网IP', '{\"unionType\":[\"TB\"],\"updateSupport\":[\"on\"]}', NULL, 1, '很抱歉，导入失败！共 49 条数据格式不正确，错误如下：<br/>1、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>2、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>3、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>4、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>5、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>6、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>7、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>8、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>9、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>10、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>11、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>12、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>13、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>14、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>15、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>16、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>17、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>18、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>19、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>20、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>21、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>22、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>23、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>24、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>25、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>26、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>27、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>28、商品id tb_null 导入失败：shopIndex: 商品页不能为空, taokeUrl: 推广链接不能为空<br/>29、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>30、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不能为空<br/>31、商品id tb_null 导入失败：taokeUrl: 推广链接不能为空, shopIndex: 商品页不', '2022-06-02 02:04:27');

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
(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-01-13 08:17:23', 'admin', '2022-05-05 08:55:10', '普通角色'),
(3, '测试', 'comj', 1, '1', '0', '2', 'admin', '2022-04-27 07:18:02', '', NULL, NULL),
(4, '演示角色', 'systemView', 3, '1', '0', '0', 'admin', '2022-05-04 18:22:38', 'cmsAdmin', '2022-05-05 03:19:47', NULL);

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
(2, 1061),
(4, 1062),
(4, 1063),
(4, 1064),
(4, 1065),
(4, 1066),
(4, 1067),
(4, 1068),
(4, 1070),
(4, 1071),
(4, 1072),
(4, 1073),
(4, 1076),
(4, 1077),
(4, 1078),
(4, 1079),
(4, 1080),
(4, 1081),
(4, 1082),
(4, 1083),
(4, 1088),
(4, 1092),
(4, 1093),
(4, 1097),
(4, 1101),
(4, 1105),
(4, 1106),
(4, 1107),
(4, 1108);

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
(1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', 'http://127.0.0.1:8090/oss/download/avatar/2022/05/15/blob_20220515114748A001.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-06-02 02:03:58', '2022-01-13 08:17:23', 'admin', '2022-01-13 08:17:23', '', '2022-06-02 02:03:57', '管理员'),
(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-04-29 02:44:33', '2022-01-13 08:17:23', 'admin', '2022-01-13 08:17:23', 'ry', '2022-04-29 02:44:44', '测试员'),
(3, 109, 'cmsAdmin', '内容管理员', '00', '634866553@qq.com', '17678999448', '0', '', 'c461db5d8282ff20fd1e77833b9e7ff6', '313376', '0', '0', '127.0.0.1', '2022-05-14 20:35:13', NULL, 'admin', '2022-05-04 06:15:18', 'cmsAdmin', '2022-05-14 20:35:12', '内容管理员'),
(4, NULL, 'testUser', 'testUser', '01', '', '', '0', '', '568a0007d929463f2ce60d888d2aad45', '5ef113', '0', '0', '127.0.0.1', '2022-05-23 20:37:53', '2022-05-23 20:36:16', '', '2022-05-23 20:36:16', '', '2022-05-23 20:37:53', NULL),
(5, 103, 'test2', 'test2', '01', '', '', '0', '', 'dcf6dfa1fb3241ead1d2cef1f9c83a7b', 'e43831', '0', '0', '', NULL, '2022-05-24 01:24:35', '', '2022-05-24 01:24:35', '', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_info`
--

CREATE TABLE `sys_user_info` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `tags` varchar(128) DEFAULT NULL COMMENT '标签',
  `hobby` varchar(256) DEFAULT NULL COMMENT '爱好',
  `local` varchar(128) DEFAULT NULL COMMENT '位置',
  `introduce` varchar(256) DEFAULT NULL COMMENT '介绍',
  `teach` varchar(512) DEFAULT NULL COMMENT '教育',
  `contact` varchar(128) DEFAULT NULL COMMENT '社交',
  `touch` varchar(128) DEFAULT NULL COMMENT '联系',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `shows` text COMMENT '更多展示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详细信息';

--
-- 转存表中的数据 `sys_user_info`
--

INSERT INTO `sys_user_info` (`user_id`, `tags`, `hobby`, `local`, `introduce`, `teach`, `contact`, `touch`, `birthday`, `shows`) VALUES
(1, '112', '', '上海浦东新区', '上海浦东新区', '', '[{\"contactUrl\":\"http://127.0.0.1:8090/admin\",\"contactName\":\"qq\"},{\"contactUrl\":\"http://127.0.0.1:8090/admi\",\"contactName\":\"yy\"}]', '[{\"touchId\":\"17678999448\",\"touchName\":\"电话\"}]', NULL, ''),
(2, '', '', '', '', '', '', '', NULL, ''),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(2, 2),
(3, 4),
(5, 2);

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
(2, 2),
(3, 4);

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
-- 表的索引 `cms_article_theme`
--
ALTER TABLE `cms_article_theme`
  ADD PRIMARY KEY (`article_id`,`theme_name`);

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
-- 表的索引 `cms_union`
--
ALTER TABLE `cms_union`
  ADD PRIMARY KEY (`shop_id`);

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
-- 表的索引 `sys_user_info`
--
ALTER TABLE `sys_user_info`
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
  MODIFY `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cms_cat`
--
ALTER TABLE `cms_cat`
  MODIFY `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=6;

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
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cms_contact`
--
ALTER TABLE `cms_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `cms_like_record`
--
ALTER TABLE `cms_like_record`
  MODIFY `like_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cms_link`
--
ALTER TABLE `cms_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `cms_log_record`
--
ALTER TABLE `cms_log_record`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID', AUTO_INCREMENT=925;

--
-- 使用表AUTO_INCREMENT `cms_look_record`
--
ALTER TABLE `cms_look_record`
  MODIFY `look_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=92;

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
  MODIFY `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `gen_table_column`
--
ALTER TABLE `gen_table_column`
  MODIFY `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号', AUTO_INCREMENT=74;

--
-- 使用表AUTO_INCREMENT `oly_mail`
--
ALTER TABLE `oly_mail`
  MODIFY `mail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `oly_oss`
--
ALTER TABLE `oly_oss`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- 使用表AUTO_INCREMENT `oly_template`
--
ALTER TABLE `oly_template`
  MODIFY `template_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模板Id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sys_config`
--
ALTER TABLE `sys_config`
  MODIFY `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键', AUTO_INCREMENT=188;

--
-- 使用表AUTO_INCREMENT `sys_dept`
--
ALTER TABLE `sys_dept`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id', AUTO_INCREMENT=111;

--
-- 使用表AUTO_INCREMENT `sys_dict_data`
--
ALTER TABLE `sys_dict_data`
  MODIFY `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码', AUTO_INCREMENT=202;

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
  MODIFY `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID', AUTO_INCREMENT=686;

--
-- 使用表AUTO_INCREMENT `sys_menu`
--
ALTER TABLE `sys_menu`
  MODIFY `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID', AUTO_INCREMENT=1124;

--
-- 使用表AUTO_INCREMENT `sys_notice`
--
ALTER TABLE `sys_notice`
  MODIFY `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `sys_oper_log`
--
ALTER TABLE `sys_oper_log`
  MODIFY `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键', AUTO_INCREMENT=903;

--
-- 使用表AUTO_INCREMENT `sys_post`
--
ALTER TABLE `sys_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=6;

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
