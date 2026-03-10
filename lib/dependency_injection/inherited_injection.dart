import 'package:flutter/material.dart';
import 'package:testapp/dependency_injection/app_info.dart';

class InheritedInjection extends InheritedWidget {
  final AppInfo _appInfo = AppInfo();
  final Widget child;

  // InheritedInjection({super.key , required this.child}) : super();
  InheritedInjection({Key? key, required this.child})
      : super(key: key, child: child);

  AppInfo get appInfo => _appInfo;

  static InheritedInjection? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedInjection>());
  }

  @override
  bool updateShouldNotify(InheritedInjection oldWidget) {
    return true;
  }
}

