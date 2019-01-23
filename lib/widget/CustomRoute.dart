import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  CustomRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
//              return FadeTransition(
//                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                    parent: animation1, curve: Curves.fastOutSlowIn)),
//                child: child,
//              );
              // 幻灯片路由动画
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.easeInOut)),
                child: child,
              );
            });
}
