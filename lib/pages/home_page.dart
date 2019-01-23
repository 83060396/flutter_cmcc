import 'package:cmcc/common/utils/navigator_util.dart';
import 'package:cmcc/pages/CommonHtml5Page.dart';
import 'package:cmcc/widget/TitleBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          "西安",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
        title: TitleBar(
          "西安",
          needRightLocalIcon: true,
          onPressed: () {},
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Add Alarm',
              onPressed: () {
                NavigatorUtil.pushPage(
                    context, new CommonHtml5Page("http://www.baidu.com", "百度"));
              }),
          new IconButton(
              icon: new Icon(Icons.center_focus_weak),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
          new IconButton(
              icon: new Icon(Icons.textsms),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
        ],
      ),
      body: Center(
        child: Text("contents"),
      ),
    );
  }
}
