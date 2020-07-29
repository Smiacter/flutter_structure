# Flutter Structure

一个常见的App架构参考代码，tab + mvvm(provider) + network + config，希望能做到新开项目时，仅需要配置相关参数就能快速进行开发

代码参考了两个项目，大多代码都很相似，只是自己理解和重新按照自己的编码习惯重新整合，非常感谢这两位兄弟的开源！

[参考项目1：flutter_deer](https://github.com/simplezhli/flutter_deer)

[参考项目2：fun_android_flutter](https://github.com/phoenixsky/fun_android_flutter)

## 完成情况

- [x] 基本架构
- [x] 基于dio的网络封装，支持泛型，需配合FlutterJsonBeanFactory
- [x] 基于Provider的MVVM，普通界面与list界面基类封装
- [x] 基本使用测试，普通界面与list界面的测试页

## TODO

- [ ] 网络封装与MVVM的结合在错误处理上存在问题，待优化
- [x] 基础架构代码（不随项目而变）和可配置项的完全分离[ 含各种本地资源如图片配置]
  - 注，想要完全分离比较困难，如网络超时时间，分页数等，如果在基础代码外配置而在基础代码中使用会有交叉，每个项目引入头文件也不同
  - 可以考虑使用JSON文件配置，启动时导入相关配置
  - 或者直接使用定义的值，遇到特殊情况再修改Base中的相关配置
- [ ] 路由管理
- [x] 屏幕适配[基于flustars中的ScreenUtil]
- [ ] 常用控件封装
  - [ ] Image支持Padding参数
  - [x] Toast和Alert
  - [x] ActionSheet
  - [x] 方便使用的Button封装[基于FButton](https://github.com/Fliggy-Mobile/fbutton)
  - [x] 方便使用的Image控件封装，圆角，网络，本地图片，Uint8List格式，配合[multi_image_picker]**选中的**[Asset]类型，添加点击事件【细节：可增加自带Image显示的过渡动画，当前会有一点突兀，Uint8List显示会先白一下再显示出图片】
  - [x] 多图选择，基于[multi_image_picker](https://pub.dev/packages/multi_image_picker)
  - [x] 增加了车牌输入（键盘与输入框为一体）的自定义控件，可根据每个项目的UI做定制小范围修改
- [x] 主题模式可配置，配置只支持light（MaterialApp中themeMode设置为light即可）
- [x] 使用[flui](flui)等UI框架(插件)？【使用了flui、FButton】
- [x] 尝试动态配置UI，分别使用了flui中的dynamic和自定义规则（使用flutter_staggered_grid_view配置不规则Grid），详见gas_page
- [ ] 使用动画
  - [x] Flare动画简单使用
- [ ] refresh刷新换成[frefresh](https://github.com/Fliggy-Mobile/frefresh)
- [ ] ...

## 如何接入

如何引入

代码目录结构

...

## 使用规范

- 如何配置
- 普通页面如何使用
- 列表页面如何使用
- 不依赖MVVM，完全自定义开发使用

## 其他

暂时没想到的其他项