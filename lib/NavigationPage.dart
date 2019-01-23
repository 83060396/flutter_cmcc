import 'package:cmcc/pages/home_page.dart';
import 'package:cmcc/pages/know_ledge_page.dart';
import 'package:cmcc/pages/personal_page.dart';
import 'package:cmcc/pages/project_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavigationState();
  }
}

class NavigationState extends State<NavigationPage>
    with TickerProviderStateMixin {
  //当前页面
  int currentPosition = 0;

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  var tabImages;
  var _pageList;
  var appBarTitles = ['首页', '分类', '发现', '优惠', '我的'];

  void initData() {
    tabImages = [
      [
        getTabImage('images/tab_home_unselect.png'),
        getTabImage('images/tab_home_select.png')
      ],
      [
        getTabImage('images/tab_classify_unselect.png'),
        getTabImage('images/tab_classify_select.png')
      ],
      [
        getTabImage('images/tab_find_unselect.png'),
        getTabImage('images/tab_find_select.png')
      ],
      [
        getTabImage('images/tab_mall_unselect.png'),
        getTabImage('images/tab_mall_select.png')
      ],
      [
        getTabImage('images/tab_mine_unselect.png'),
        getTabImage('images/tab_mine_select.png')
      ],
    ];
    _pageList = [
      HomePage(),
      KnowledgePage(),
      ProjectPage(),
      PersonalPage(),
      ProjectPage(),
    ];
  }

  int _tabIndex = 0;

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  @override
  void initState() {
    initData(); //初始化数据
    super.initState();
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: Colors.blue));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: Colors.black54));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
            BottomNavigationBarItem(icon: getTabIcon(4), title: getTabTitle(4)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}
