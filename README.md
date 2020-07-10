# 若依内容管理系统简介
1.  模板管理：用户可以自定义模板，填充对应的数据以便应付不同需求。
2.  主题管理：支持主题上传，切换以及模板，切换不用重启服务器。
3.  缓存管理：支持Redis缓存，提高系统相应速度。同时支持查看缓存,重置缓存。
4.  栏目管理：前端菜单管理，支持多级树，可以应付复杂的导航,已支持额外SEO字段。
5.  分类管理：支持多级树，完全可以应付复杂分类,已支持额外SEO字段。
6.  标签管理：标签用于标记文章特色,已支持额外SEO字段。
7.  文章管理：支持不同类型，多关键字的文章发布。
8.  储存管理：按时间归类，目前至此本地和七牛，后续会有扩展。
9.  邮件管理：邮件在线配置，发送，支持多种类型邮件发送。
10. websocket模块：内含websocket模块，基本案例单聊，群聊。
11. 配置管理：完整的网站配置，方便SEO，个性化设置。
12. 标签开发：简化主题制作，直接调用Service。
13. 支持用户：丰富内容系统，方便二次开发。
14. 内置淘宝：支持批量上传优惠卷
15. 文章检索系统：使用solr检索文章
16. 链接管理：支持分组,方便做导航类网站
17. 文章相关操作：包含评论,浏览记录,评分,收藏等
...
<table>
    <tr>
        <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-17-58.888Z_bea53a3e3992411fbb19fc4bf110ca44.png"/></td>
        <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-18-47.326Z_0dababe1f6504073bbc5f5b4acf03c49.png"/></td>
    </tr>
    <tr>
         <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-19-27.145Z_2f844738e5934fa0a63778166f069440.png"/></td>
         <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-23-29.915Z_8ba3734cbb7046389334e9b6ff8e0fc1.png"/></td>
     </tr>
      <tr>
              <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-23-52.807Z_3fd7f8395421435ba76aa56d293e41ae.png"/></td>
              <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-24-21.337Z_193493110dec4615a83cca1e21d08c44.png"/></td>
      </tr>
       <tr>
               <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-24-42.599Z_380c6fbbed90427d87d6e65b74c969bb.png"/></td>
               <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-25-07.965Z_0bd4080dc90a4ea186967b5a93a899ff.png"/></td>
     </tr>
     <tr>
   <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-25-25.220Z_423b799f9bf74be0a66a35b13a05e81c.png"/></td>
                 <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-25-42.175Z_1c1b25d0a7764cab9845a7dc2afb62c6.png"/></td>
    </tr>
     <tr>
     <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-25-57.235Z_28af556dd9dc4c18909eb03d8bcbadeb.png"/></td>
     <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-26-47.443Z_0f6816585b7b4bd0b89d0967d51ec660.png"/></td>
     </tr>
    <tr>
                  <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-27-24.764Z_03629c87ba3e439aab7361c146c4cdaa.png"/></td>
                   <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-28-01.312Z_917396099c25473f894af6f6556732f8.png"/></td>
              </tr>
                <tr>
                     <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T03-28-09.932Z_e5dd2b3af1d74d8aa42ff16398bd13d7.png"/></td>
                     <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T04-55-18.571Z_af7c3327e8af442bb64ef74d5f0a31da.png"/></td>
                 </tr>
                 <tr>                                       
                     <td><img src="http://image.bobey.site//upload/2020/7/火狐截图_2020-07-10T04-55-52.202Z_9c8c597a8a82418eb766cd1e7bf1ffdb.png"/></td>
                 </tr>                                          
</table>

# 运行说明
1. 和运行若依项目一样,端口为8090。
2. 邮件和七牛云均为本人配置,可以直接使用,如有必要请换成自己的跑。
3. 默认redis数据索引库为1.
4. solr相关在另外一个库,目前没有整合到菜单,也没整合到搜索
5. 默认主页导航到淘宝客,其中管理页为/admin,博客为/blog/index,淘客为/淘客
6. 项目能跑起来,有一些bug,欢迎反馈
7. 修改配置,需要刷新静态变量,/blog/api/blogConfigRefresh和/taoke/api/taokeConfigRefresh

# 项目演示
1. 地址：https://pinpinduo.icu
2. 首次加载可能有点慢,请不要随便修改导航菜单
3. 欢迎提出意见,以及反馈

## 若依简介

一直想做一款后台管理系统，看了很多优秀的开源项目但是发现没有合适的。于是利用空闲休息时间开始自己写了一套后台系统。如此有了若依。她可以用于所有的Web应用程序，如网站管理后台，网站会员中心，CMS，CRM，OA。所有前端后台代码封装过后十分精简易上手，出错概率低。同时支持移动客户端访问。系统会陆续更新一些实用功能。

性别男，若依是给还没有出生女儿取的名字（寓意：你若不离不弃，我必生死相依）

> 如需前后端分离版本，请移步 [RuoYi-Vue](https://gitee.com/y_project/RuoYi-Vue)

> 如需单应用，请移步 [RuoYi-fast](https://gitee.com/y_project/RuoYi-fast)  `(保持同步更新)`，如需其他版本，请移步 [项目扩展](http://doc.ruoyi.vip/ruoyi/document/xmkz.html)  `(不定时更新)`

> 阿里云通用云产品1888优惠券 ：[点我领取](https://www.aliyun.com/minisite/goods?userCode=brki8iof)&nbsp;&nbsp;&nbsp;&nbsp;腾讯云通用云产品2860优惠券 ：[点我领取](https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console)&nbsp;&nbsp;`(仅限新用户)`

> 阿里云Hi拼购 限量爆款 低至199元/年 [点我进入](https://www.aliyun.com/acts/hi-group-buying?userCode=brki8iof)&nbsp;&nbsp;`(仅限新用户)`

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13. 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14. 系统接口：根据业务代码自动生成相关的api接口文档。
15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16. 在线构建器：拖动表单元素生成相应的HTML代码。
17. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
## 在线体验
> admin/admin123  
> 陆陆续续收到一些打赏，为了更好的体验已用于演示服务器升级。谢谢各位小伙伴。

演示地址：http://ruoyi.vip  

文档地址：http://doc.ruoyi.vip

## 演示图

<table>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/25b5e333768d013d45a990c152dbe4d9d6e.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/e29fd81b2d43b517f99535564af41f9d1d5.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/629f1510fb6205f773c8c284863406b694f.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/9124eda87df0e72427cd63f458b813e3363.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/438c59467afd0097cfbe9c89db932661687.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/72a015041db6843aca7f7b273688cb346f8.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/ecb5f1c9929f1933f733f796749b2df73d9.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/e4283d500eb10e8dd8701e7742f7facb065.jpg"/></td>
    </tr>	 
    <tr>
        <td><img src="https://oscimg.oschina.net/oscnet/2531dbf419a1b114e1177f8d2a120b8a9c3.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/8b740a42dddc1e5a8a150d97c5060df258b.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/00e642dc3515919b3760968cc496a12a849.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/f72d28a3e60413a4e1b5c7c2f45f962fd65.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/19222e495869a2a99fc31c5d2bd4539e1e7.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/264d25176f4e22b4b38e95fe6ce73775299.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/d85fbb59be27fb33f68bdbb6e8bc967c97b.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/bb902d2c54bad02a052e9a05e5f22a93df1.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/30cda883bb9a7f74f1454314e64f949942d.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/deebaaa8d6b14a419ed5911f49e3f222a6f.jpg"/></td>
    </tr>
	<tr>
        <td><img src="https://oscimg.oschina.net/oscnet/bed2b98a44e7ae820c2885329e711965c28.jpg"/></td>
        <td><img src="https://oscimg.oschina.net/oscnet/up-6d73c2140ce694e3de4c05035fdc1868d4c.png"/></td>
    </tr>
</table>


## 若依交流群

QQ群： [![加入QQ群](https://img.shields.io/badge/已满-1389287-blue.svg)](https://jq.qq.com/?_wv=1027&k=5HBAaYN)  [![加入QQ群](https://img.shields.io/badge/已满-1679294-blue.svg)](https://jq.qq.com/?_wv=1027&k=5cHeRVW)  [![加入QQ群](https://img.shields.io/badge/已满-1529866-blue.svg)](https://jq.qq.com/?_wv=1027&k=53R0L5Z)  [![加入QQ群](https://img.shields.io/badge/已满-1772718-blue.svg)](https://jq.qq.com/?_wv=1027&k=5g75dCU)  [![加入QQ群](https://img.shields.io/badge/已满-1366522-blue.svg)](https://jq.qq.com/?_wv=1027&k=58cPoHA)  [![加入QQ群](https://img.shields.io/badge/已满-1382251-blue.svg)](https://jq.qq.com/?_wv=1027&k=5Ofd4Pb)  [![加入QQ群](https://img.shields.io/badge/已满-1145125-blue.svg)](https://jq.qq.com/?_wv=1027&k=5yugASz)  [![加入QQ群](https://img.shields.io/badge/已满-86752435-blue.svg)](https://jq.qq.com/?_wv=1027&k=5Rf3d2P)  [![加入QQ群](https://img.shields.io/badge/已满-134072510-blue.svg)](https://jq.qq.com/?_wv=1027&k=5ZIjaeP)  [![加入QQ群](https://img.shields.io/badge/已满-210336300-blue.svg)](https://jq.qq.com/?_wv=1027&k=5CJw1jY)  [![加入QQ群](https://img.shields.io/badge/339522636-blue.svg)](https://jq.qq.com/?_wv=1027&k=5omzbKc)