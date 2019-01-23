import 'package:cmcc/NavigationPage.dart';
import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() {
  runApp(StartPage());
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "程序入口",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        // 路由
        '/NavigationPage': (BuildContext context) => new NavigationPage()
      },
    );
  }
}
