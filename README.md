#### 工程目录结构
```    
   * Category 		  分类    
   * Database	      数据库
   * Macros   		  宏定义
   * Networking 	  网络 
   * SuperClass 	  父类    
   * ThirdVendor 	  不再pod中的第三方库
   * Utils	     	  工具类
   * ViewControllers  视图控制器
```

#### CocoaPod
``` 
   * 其他 https://github.com/jobbole/awesome-ios-cn#libraries-and-frameworks
   * coocapods的替换方案Carthage，将第三方添加为动态库
```



关于项目的基本目录结构图

> BaseProject
>
> - Category  —分类
>
>   - UIButton+SCButton
>   - NSFileManager+SCFileManager
>   - UILabel+SCLable
>
> - Database — 数据库
>
>   - SCDatabaseManager
>
> - Macros  — 宏定义
>
>   - SCAppMacro
>   - SCColorFontMacro
>   - SCRequestURLMacro
>   - SCNotifiCationConst
>
> - Networking — 网络请求
>
>   - SCNetWorkManager
>
> - SuperClass — 父类
>
>   - SCMainNavigationViewController
>   - SCTabBarViewController
>   - SCBaseViewController
>
> - ThirdVendor - 不在pod中的第三方库
>
>   - GDataXML
>
> - Utils — 工具类
>
>   - ObjcRuntime
>     - SCObjcRuntime
>   - SCCustomerTableview
>     - SCTableViewController
>
> - ViewControllers - 控制器
>
>   - Login
>     - SCLoginViewController
>   - Home — 不同login添加视图的方式
>     - Models
>     - Views
>     - ViewControllers
>
> - podfile
>
>   -   pod 'AFNetworking', '~> 3.1.0'    #网络请求
>
>   -   pod 'SDWebImage', '~> 3.7.2'      #图片加载
>
>   -   pod 'FMDB', '~> 2.6.2'            #sqlite数据库
>
>   -   pod 'Masonry', '~> 1.0.2'         #相对布局
>
>   -   pod 'MBProgressHUD', '~> 1.0.0'   #显示加载activity
>
>   -   pod 'MJRefresh', '~> 3.1.12'      #刷新
>
>   -   pod 'YYKit', '~> 1.0.9'           #控件封装
>
>       ​

#### 项目整体结构图

![BaseProject](https://github.com/WonderC/BaseProject/blob/master/projectImages/BaseProject.png)

没有tabbar的情况

![NoTabBar](https://github.com/WonderC/BaseProject/blob/master/projectImages/NoTabBar.png)

####关于SCBaseViewController_SCPrivateMethod.h
SCBaseViewController_SCPrivateMethod 是SCBaseViewController的Extension。
添加扩展用来来解决子类需要使用父类的一个私有属性（方法）。

####网络请求使用的是再次对afnetworking3.0封装的
####数据库Database是对FMDB的再次封装

因不同的需求原因，Database和SCNetworking 没有测试请自行修改

`水平有限`👏欢迎大神多多提点


