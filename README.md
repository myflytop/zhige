## 止戈简介
目前同步至若依4.7.4,内容部分已经基本完成。
* 模板：支持普通页面,数据页面以及一些案例模板,其中页面主要以HTML片段，案例模板可以是图片，文档等等。HTML片段方便系统维护及管理，案例模板则可以规范站点内容的维护或者各种单子发票的统一。
* 主题：支持主题上传,切换以及个性化设置,备份主题,支持多主题。通过简单配置,即可实现实现群站效果。
* 栏目：前端菜单管理,支持多级树,可以应付复杂的导航,已支持额外SEO字段。
* 分类：支持多级树,完全可以应付复杂分类,已支持额外SEO字段。
* 标签：标签用于标记文章特色,已支持额外SEO字段。
* 文章：支持不同类型,特色推荐,多关键字的文章发布,支持额外SEO字段。
* 储存：储存方面统一接口,文件可视化管理,方便后续的维护以及扩展。
* 邮件：邮件支持在线配置,发送,支持多种类型邮件发送,支持定时发送。
* 链接：支持分组,方便做导航类网站。
* 文章：包含评论,浏览记录,评分,收藏等。
* 反馈: 支持不同类型反馈,方便搜集用户在使用中存在的问题。
* 标签：使用Thymeleaf模板,可直接调用service,简化主题开发
***

#### 预览地址
- [主题zgblog预览地址](https://pingpinduo.site)
- [主题butgo预览地址](https://pingpinduo.site/butgo/index) 
- [后台预览地址](https://pingpinduo.site/admin)
- 管理员账号admin/admin123  
- 浏览账号viewer/admin123
- 其中butgo基于hexo的主题butterfly
## 目录说明
```
RuoYi
 ├── bin
 ├── doc
 ├── LICENSE
 ├── pom.xml
 ├── README.md
 ├── ruoyi-admin      管理模块
 ├── ruoyi-common     通用工具类
 ├── ruoyi-framework  项目核心
 ├── ruoyi-generator  代码生成
 ├── ruoyi-mail       邮件模块
 ├── ruoyi-mybatis    数据连接
 ├── ruoyi-oly
 │   ├── oly-cms      内容聚合模块
 │   │   ├── cms-admin   管内容理
 │   │   ├── cms-comment  评论
 │   │   ├── cms-common    通用工具
 │   │   ├── cms-general   通用服务
 │   │   ├── cms-hander    控制模块
 │   │   ├── cms-web       前端模块
 ├── ruoyi-oss        储存模块
 ├── ruoyi-quartz     定时任务
 ├── ruoyi-system
 │   ├── system-config 配置模块
 │   ├── system-core   系统模块
 │   └── system-dict   字典模块
 ├── ruoyi-template   模板模块
 ├── ry.bat
 ├── ry.sh
 └── sql   数据库脚本
```

## 安装$运行
- 项目默认工作目录在用户目录/.ruoyi目录下,同级目录config用于存放覆盖默认配置的一些文件。
- 系统已经集成flyway,因此只需要建数据库即可，如果是在Linux下运行本程序,由于Mysql默认大小写敏感,运行时会导致quartz找不到表，导致本程序无法启动。所以在安装数据库时配置lower_case_table_names=1,避免再次折腾,寻找解决方案。
### 配置
  1. 默认方式
 本程序所有操作,在用户工作目录的/.zgcms下。包括日志记录,主题文件,本地文件储存,备份文件等等...默认配置如下：
 
```
ruoyi:
  # 名称
  name: zgcms
  # 版本
  version: 4.7.3
  # 版权年份
  copyrightYear: 2021
  # 实例演示开关
  demoEnabled: true
  # 是否指定任意目录
  appointProfile: false
  # 储存相关根目录
  profile: .zgcms
  # 获取ip地址开关
  addressEnabled: false
```
2. 指定目录
- 不指定任意目录，依旧在用户工作目录下

```
ruoyi:
  # 名称
  name: zgcms
  # 版本
  version: 4.7.3
  # 版权年份
  copyrightYear: 2021
  # 实例演示开关
  demoEnabled: true
  # 是否指定任意目录
  appointProfile: false
  # 储存相关根目录
  profile: xx
  # 获取ip地址开关
  addressEnabled: false
```

- 指定任意目录,须将 appointProfile: false改为appointProfile: true。另外windows须指定盘符如C:/.ruoyi,linux 直接配置如/.ruoyi,需确保用户拥有对应的目录操作权限.

```
# windows
ruoyi:
  # 名称
  name: zgcms
  # 版本
  version: 4.7.3
  # 版权年份
  copyrightYear: 2021
  # 实例演示开关
  demoEnabled: true
  # 是否指定任意目录
  appointProfile: true
  # 储存相关根目录
  profile: C:/.zgcms
  # 获取ip地址开关
  addressEnabled: false
```

```
# linux
ruoyi:
  # 名称
  name: zgcms
  # 版本
  version: 4.7.3
  # 版权年份
  copyrightYear: 2021
  # 实例演示开关
  demoEnabled: true
  # 是否指定任意目录
  appointProfile: true
  # 储存相关根目录
  profile: /.zgcms
  # 获取ip地址开关
  addressEnabled: false
```

- 启动文件位于ruoyi-admin下的RuoYiApplication.java下
- 后台地址：/admin


## 注意事项
默认没有安装主题文件,需要自己手动安装。
- [示例主题地址](https://gitee.com/Getawy/zgblog)

## 关于主题
  主题还在优化中,想要体验的自己加群下载(qq群:893754716),相关文档还在编写中
#### 项目地址
- [后台地址](https://gitee.com/Getawy/zhige)
- [主题zgblog地址](https://gitee.com/Getawy/zgblog)
## 演示图

<table>
    <tr>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/登录页.png"/></td>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/管理页.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/首页.png"/></td>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/移动端.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/优惠卷.png"/></td>
        <td><img src="https://gitee.com/Getawy/zhige/raw/master/doc/img/文档.png"/></td>
    </tr>
</table>

## 注意事项
- 预览账号为为管理账号，望千万不要手欠，随意修改删除预览数据。
- 如果项目对你有帮助，请点下小红星⭐表示支持，谢谢！
- qq群号：893754716




