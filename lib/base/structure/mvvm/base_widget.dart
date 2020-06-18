import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 基类Widget，MVVM中的View，与Provider配合实现
/// 只更新一个Model，只传入了一个T
class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  /// 需要经常更新的包裹在builder中，通过consumer更新
  final Widget Function(BuildContext context, T value, Widget child) builder;
  /// 具体对应的Provider，处理逻辑，充当VM
  final T model;
  /// 不需要更新的，通过child传入
  final Widget child;
  /// 初始化完成，可以请求数据了
  final Function(T model) onModelReady;
  final bool autoDispose;

  BaseWidget({ 
    Key key,
    @required this.builder,
    @required this.model,
    this.child,
    this.onModelReady,
    this.autoDispose: true,
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => BaseWidgetState<T>();
}

class BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady?.call(model);

    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) {
      model.dispose();
    }
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>( 
      create: (_) => model,
      child: Consumer<T>( 
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

/// 基类Widget，MVVM中的View，与Provider配合实现
/// 传入了两个Model，对应Consumer<A, B>，可更新两个，如果需要更多的，按照同样的方式声明，Provider最多支持6个
class BaseWidget2<A extends ChangeNotifier, B extends ChangeNotifier> extends StatefulWidget {
  /// 需要经常更新的包裹在builder中，通过consumer更新
  final Widget Function(BuildContext context, A model1, B model2, Widget child) builder;
  final A model1;
  final B model2;
  /// 不需要更新的，通过child传入
  final Widget child;
  /// 初始化完成，可以请求数据了
  final Function(A model1, B model2) onModelReady;
  final bool autoDispose;

  BaseWidget2({ 
    Key key,
    @required this.builder,
    @required this.model1,
    @required this.model2,
    this.child,
    this.onModelReady,
    this.autoDispose: true,
  }) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => BaseWidgetState2<A, B>();
}

class BaseWidgetState2<A extends ChangeNotifier, B extends ChangeNotifier> extends State<BaseWidget2<A, B>> {
  A model1;
  B model2;

  @override
  void initState() {
    model1 = widget.model1;
    model2 = widget.model2;
    widget.onModelReady?.call(model1, model2);

    super.initState();
  }

  @override
  void dispose() {
    if (widget.autoDispose) {
      model1.dispose();
      model2.dispose();
    }
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider( 
      providers: [
        ChangeNotifierProvider<A>(create: (_) => model1),
        ChangeNotifierProvider<B>(create: (_) => model2),
      ],
      child: Consumer2<A, B>( 
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}