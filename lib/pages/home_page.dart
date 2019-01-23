import 'package:cmcc/common/utils/navigator_util.dart';
import 'package:cmcc/pages/CommonHtml5Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _content(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      leading: Center(
        child: Text(
          "西安",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
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
    );
  }

  Widget _content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Text(""),
          )
        ],
      ),
    );
  }
}
