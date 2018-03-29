## 简介
项目使用 laravel5.4+vue2.0 构建的后台管理系统,主题是AdminLte主要功能包括权限树管理,角色管理,用户管理,操作日志、websocket消息推送等；


### 安装
首先从 `github` 克隆项目到本地
```
git clone https://github.com/HeRedBo/laravel-vue
```

安装 Laravel 开发依赖
```
composer install
```

安装前端依赖

```
npm install
```


配置开发环境
```
cp .env.example .env 并根据自己的实际情况修改相关配置项 如 mysql 与 redis  连接等
```

填充测试数据
```
cp .env.example .env  ##  根据自己的实际情况配置各个连接项
php artisan migrate  ## 创建数据表
导入 database目录下`lara_blog.sql` 数据 
```

运行 
```
npm run test
php artisan serve // 开启 web 服务
打开浏览器访问 http://localhost:8000 查看效果
```

开发模式
```
npm run watch
php artisan serve // 开启 web 服务
打开浏览器访问 http://localhost:3000 查看效果
```

启动swoole websocket服务
```
php artisan swoole start
```
websocket连接储存在Store模块里

```
this.$store.state.websocket
```
### 日志记录

采用laravel事件机制


```
Event::fire(new AdminLogger('delete', "删除了后台用户[{$user->username}]"));
```

