 **OneBlog** 一个简洁美观、功能强大并且自适应的Java博客。使用springboot开发，前端使用Bootstrap。支持移动端自适应，配有完备的前台和后台管理功能。    

![JDK](https://img.shields.io/badge/JDK-1.8-green.svg)
![Maven](https://img.shields.io/badge/Maven-3.3.1-green.svg)
![MySQL](https://img.shields.io/badge/MySQL-5.6.4-green.svg)
![Redis](https://img.shields.io/badge/Redis-3.0.503-green.svg)
[![license](https://img.shields.io/badge/license-GPL%20v3-yellow.svg)](https://gitee.com/yadong.zhang/DBlog/blob/master/LICENSE)

----
# 写在前面的话
ps: 虽然我知道，大部分人都是来了**直接下载源代码**后就潇洒的离开，并且只有等到下次**突然想到**“我天~~我得去看看OneBlog这烂项目更新新功能了吗”的时候才会重新来到这儿，即使你重新来过，我估计你也只有两个选择：    

发现更新代码了 --> 下载源码后重复上面的步骤    
发现没更新代码 --> 直接关闭浏览器

虽然我知道现实就是如此的残酷，但我还是要以我萤虫之力对各位到来的同仁发出一声诚挚的嘶吼：

**如果喜欢，请多多分享！！多多Star！！**

----

# Demo 演示

[前台demo](http://dblog-web.zhyd.me/)

[后台demo(root,123456)](http://dblog-admin.zhyd.me)

![admin端首页](https://images.gitee.com/uploads/images/2019/0129/191117_221c6064_784199.png "admin-index.png")
![admin端文章列表也](https://images.gitee.com/uploads/images/2019/0129/191135_21e4f61c_784199.png "admin-article.png")
![admin端发布文章页](https://images.gitee.com/uploads/images/2019/0129/191150_0d28d51a_784199.png "admin-publish-article.png")
![admin端系统配置页](https://images.gitee.com/uploads/images/2019/0129/191203_cc6941e4_784199.png "admin-config.png")
![admin端文章搬运工](https://images.gitee.com/uploads/images/2019/0129/191214_5e8f3c34_784199.png "admin-spider.png")
![admin端文章搬运工](https://images.gitee.com/uploads/images/2019/0129/191237_d015fcda_784199.png "admin-spider2.png")
![web端首页-pc](https://images.gitee.com/uploads/images/2019/0129/191409_d2604f7d_784199.png "web-index-pc.png")
![web端首页-mobile](https://images.gitee.com/uploads/images/2019/0129/191428_c76317e8_784199.png "web-index.png")
![web端文章详情页](https://images.gitee.com/uploads/images/2019/0129/191448_a2777443_784199.png "web-article-detail.png")

----

# 模块划分

| 模块  | 释义 | 备注 |
| :------------: | :------------: | :------------: |
| blog-core | 核心业务类模块，提供基本的数据操作、工具处理等 | 该模块只是作为核心依赖包存在 |
| blog-admin | 后台管理模块 | 该模块作为单独项目打包部署 |
| blog-web | 前台模块 | 该模块作为单独项目打包部署 |
| blog-file | 文件存储功能模块 | 支持local、七牛云和阿里云OSS |
| ~~blog-spider~~ | 爬虫相关代码模块 | 已使用[blog-hunter](https://gitee.com/yadong.zhang/blog-hunter)插件替代 |


# 技术栈

- Springboot 2.0.8
- Apache Shiro 1.2.2
- Logback
- Redis
- Lombok
- Websocket
- MySQL、Mybatis、Mapper、Pagehelper
- Freemarker
- Bootstrap 3.3.0
- wangEditor
- jQuery 1.11.1、jQuery Lazyload 1.9.7、fancybox、iCheck
- 阿里云OSS
- kaptcha
- Qiniu
- webMagic
- ...

# 功能简介

- 支持wangEditor和Markdown两种富文本编辑器，可以自行选择
- 在线申请友情链接，无需站长手动配置，只需申请方添加完站长的连接后自行申请即可
- 支持将文件提交到百度站长收录平台，加快百度引擎的收录
- 自研评论系统
- 后台配备完善的权限管理
- 自带robots、sitemap等seo模板，实现自动生成robots和sitemap
- 集成七牛云，实现文件云存储
- 系统配置支持快速配置。可通过后台手动修改诸如域名信息、SEO优化、赞赏码、七牛云以及更新维护通知等。
- 管理员可向在线的用户发送实时消息（需用户授权 - 基于websocket实现，具体参考[DBlog建站之Websocket的使用](https://www.zhyd.me/article/111)）
- “文章搬运工”功能，支持一键同步imooc、csdn、iteye或者cnblogs上的文章，可抓取列表和单个文章


# 使用方法(以blog-web项目为例)

1. 使用IDE导入本项目
2. 新建数据库`CREATE DATABASE dblog;`
3. 导入数据库`docs/db/dblog.sql`
4. 初始化数据库`docs/db/init_data.sql`
5. 修改配置文件
   1. 数据库链接属性(在`[blog-core]/resources/config/application-center-{env}.yml`配置文件中搜索`datasource`或定位到L.5) 
   2. redis配置(在`[blog-core]/resources/config/application-center-{env}.yml`配置文件中搜索`redis`或定位到L.14)
   3. 以上两个必备的配置项修改完成后就能启动项目了。关于其他配置项，请参考后台“系统配置”页面
6. 运行项目(三种方式，任选其一)
   1. 项目根目录下执行`mvn -X clean package -Dmaven.test.skip=true -Ptest`编译打包（注：-Ptest中的test为环境标识），然后cd到blog-web目录下执行`java -jar target/blog-web.jar`
   2. 在`blog-web`项目根目录下执行`mvn spring-boot:run`(注，如果报依赖错误，可在相关的依赖模块先执行install操作)
   3. 直接运行`BlogWebApplication.java`
7. 浏览器访问`http://127.0.0.1:8443`
8. `blog-admin`项目的启动方式与`blog-web`类似，请参考上面的使用说明

# 后续扩展
- [ ] 1. 页面缓存
- [ ] 2. cc防护
- [ ] 3. 配套小程序
- [ ] 4. 待续...
...

# 在用OneBlog的网站 （排名按照留言先后顺序 ）
- [张亚东博客](https://www.zhyd.me)
- [攻城狮不是猫博客](http://www.jsdblog.com)
- [刘辉辉的博客](http://www.axxo.top)
- [时光号](http://www.shiguanghao.cn/)
- [罗远祥博客](https://www.luoyuanxiangvip.com/)
- [小公举的博客](https://loveyatou.top/)
- [彭江毅的博客](https://pengjiangyi.com)
- [晓飞的博客](https://dreamatach.com)
- [拾忆的博客](http://www.lsshiyi.cn/)
- [https://blog.itourshare.net/](https://blog.itourshare.net/)
- [码农擎天柱](http://blog.qinlei.vip/)
- [陈晓雷的博客](http://www.csxll.top)
- [小猩博客](http://www.cmhblog.com/)
- [宋高俊博客](http://www.senghor.cn/)
- [Li Pan's 博客](http://www.lipan.xyz/)
- [MTR小站](https://www.itmtr.cn/)
- [老揭博客](http://www.laojieblog.com/)
- 更多待续...
----
# 特别感谢

- 广大的开源爱好者
- 无私的网友
- [gentelella](https://github.com/puikinsh/gentelella): 一款开源的Bootstrap3后台管理模板
- [七牛云](https://portal.qiniu.com/signup?code=3l8yx2v0f21ci): 强大的对象存储、CDN等服务提供商
- [emoji表情列表](https://github.com/caiyongji/emoji-list#nature): emoji表情列表
- [blog-hunter](https://github.com/zhangyd-c/blog-hunter): 博客猎手，基于webMagic的博客爬取工具，支持慕课、csdn、iteye、cnblogs、掘金和V2EX等各大主流博客平台。
- 待续...

# 开源协议
[![license](https://img.shields.io/badge/license-GPL%20v3-yellow.svg)](https://gitee.com/yadong.zhang/DBlog/blob/master/LICENSE)
