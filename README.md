自助超市系统(FoodStore)
------------------------

> 1. 前台模块包含：注册登录(不允许用户多处登录)，商品浏览，商品加入购物车，购物车结算，用户购物信息传到后台。 
> 2. 后台模块包含：注册登录，商品管理，用户购物信息管理，前台用户信息管理，后台用户密码修改。
> 3. 样式模板：bootstrap模板

* 后台管理地址：http://${ip:port}/${project_name}/Admin/admin/index/index.jsp
* 未做过修改可复制此地址：http://localhost:8080/FoodStore/Admin/admin/index/index.jsp
* 前台管理地址：http://${ip:port}/${project_name}/Home/index.jsp
* 未做过修改可复制此地址：http://localhost:8080/FoodStore/Home/index.jsp
* 后台测试账号: Admin/admin 或 test/123456
* 前台测试账号：Home@qq.com/home 或 test@qq.com/123456

平台部署和配置说明
------------------------

> 1. 开发工具中导入项目war包或者导入项目源码文件(需具备jdk、tomcat、mysql等开发环境)。
> 2. Eclipse为例：Eclipse中项目名右键→Build Path→Configure Build Path→Libraries→移除项目中的Tomcat→Add Library→Server Runtime加入自己开发环境的Tomcat,完成后Apply and Close。
> 3. 创建mysql用户和数据库，运行/FoodStore/sql/foodstore.sql文件。
> 4. 修改数据库配置文件：/FoodStore/src/team.dlrow.foodstore.util/db.properties
> 5. 运行项目Run on Server