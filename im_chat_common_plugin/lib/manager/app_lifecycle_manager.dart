import 'package:flutter/material.dart';

class AppLifecycleManager with WidgetsBindingObserver {
  // 私有构造函数
  AppLifecycleManager._();

  // 单例实例
  static final AppLifecycleManager _instance = AppLifecycleManager._();

  // 获取单例实例的方法
  static AppLifecycleManager get instance => _instance;

  // 存储监听回调
  final List<void Function(AppLifecycleState)> _listeners = [];

  // 应用生命周期状态变化回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState:$state");

    // 通知所有注册的监听器
    for (var listener in _listeners) {
      listener(state);
    }

    // 处理具体的状态
    if (state == AppLifecycleState.paused) {
      _onAppEnterBackground();
    } else if (state == AppLifecycleState.resumed) {
      _onAppEnterForeground();
    } else if (state == AppLifecycleState.inactive) {
      _onAppInactive();
    }
  }

  // 应用进入后台时的处理
  void _onAppEnterBackground() {
    print("应用进入后台");
  }

  // 应用恢复到前台时的处理
  void _onAppEnterForeground() {
    print("应用从后台恢复到前台");
  }

  // 应用挂起
  void _onAppInactive() {
    print("应用挂起");
  }

  // 注册生命周期观察
  void init() {
    WidgetsBinding.instance.addObserver(this); // 注册生命周期观察者
  }

  // 注销生命周期观察
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 注销生命周期观察者
  }

  // 添加监听方法
  void addListener(void Function(AppLifecycleState) listener) {
    _listeners.add(listener);
  }

  // 移除监听方法
  void removeListener(void Function(AppLifecycleState) listener) {
    _listeners.remove(listener);
  }
}
