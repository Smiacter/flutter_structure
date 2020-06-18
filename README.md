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
- [ ] 基础架构代码（不随项目而变）和可配置项的完全分离
- [ ] 常用控件封装
- [ ] 使用[flui](flui)等控件框架？
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