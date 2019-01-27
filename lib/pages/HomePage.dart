import 'package:cmcc/common/utils/navigator_util.dart';
import 'package:cmcc/common/utils/screen.dart';
import 'package:cmcc/common/utils/sq_color.dart';
import 'package:cmcc/models/IconResBean.dart';
import 'package:cmcc/pages/BannerWidget.dart';
import 'package:cmcc/pages/CommonHtml5Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => HomePageState();
}

List<IconResBean> iconList;
double navAlpha = 0;
ScrollController scrollController = ScrollController();

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
    iconList = List();
    iconList
      ..add(IconResBean("充值交费",
          "https://app.10086.cn/group2/M00/02/54/ChoDJVurPpWAR42hAAAPwT2Y_PA295.png"))
      ..add(IconResBean("套餐余量",
          "https://app.10086.cn/group2/M00/02/54/ChoDJlurQEyAHEP7AAALsh8jk-k248.png"))
      ..add(IconResBean("全球通",
          "https://app.10086.cn/group2/M00/03/6D/ChoDJlwkcPKACz9FAAFc3wSB9ho727.gif"))
      ..add(IconResBean("大流量",
          "https://app.10086.cn/group2/M00/02/8A/ChoDJluwbpGAXdbZAAANL8FIfJc015.png"))
      ..add(IconResBean("流量特惠",
          "https://app.10086.cn/group2/M00/03/65/ChoDJVwcRoaAOoz-AAATMfieSVA915.png"))
      ..add(IconResBean("套餐办理",
          "https://app.10086.cn/group2/M00/03/72/ChoDJlwsYs2AZbOaAAATg3rEXnI382.png"))
      ..add(IconResBean("流量直充",
          "https://app.10086.cn/group2/M00/02/65/ChoDJVuskWaAIYkoAAAJHVxg4AA245.png"))
      ..add(IconResBean("移动王卡",
          "https://app.10086.cn/group1/M00/03/1E/ChoDJFvz0EyADTzLAAAGvaQgC8U524.png"))
      ..add(IconResBean("签到有礼",
          "https://app.10086.cn/group2/M00/03/1E/ChoDJlvz0HmAXeCCAAAI3Q2_ImE567.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _appBar(context),
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

  Future<void> fetchData() async {}

  Widget _content(BuildContext context) {
    return Stack(
      children: <Widget>[
        RefreshIndicator(
            backgroundColor: SQColor.blue,
            onRefresh: fetchData,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: bannerView,
                  ),
                  _getGridView(),
                  getJoinServer(),
                  getJoinServer1(),
                  getJoinServer2(),
                ],
              ),
            )),
        buildNavigationBar(),
      ],
    );
  }

  Widget buildActions(Color iconColor) {
    return Row(children: <Widget>[
      Container(
        width: 44,
        child: Image.asset('images/actionbar_checkin.png', color: iconColor),
      ),
      Container(
        width: 44,
        child: Image.asset('images/actionbar_search.png', color: iconColor),
      ),
      SizedBox(width: 15)
    ]);
  }

  Widget buildLeftActions(Color iconColor) {
    return Container(
      height: Screen.navigationBarHeight,
      padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
      child: Row(children: <Widget>[
        Container(
          width: 32,
          child: Text(
            "西安",
            style: TextStyle(color: SQColor.white, fontSize: 16),
          ),
        ),
        Container(
          width: 15,
          child: Image.asset("images/common_white_arrow_down.png"),
        ),
        SizedBox(width: 190),
        Container(
          width: 33,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Image.asset(
            'images/menu_icon_serch.png',
            color: iconColor,
          ),
        ),
        Container(
          width: 30,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Image.asset(
            'images/menu_icon_sweep.png',
            color: iconColor,
          ),
        ),
        Container(
          width: 40,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Image.asset(
            'images/title_menu_message.png',
          ),
        ),
      ]),
    );
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          child: Container(
            child: buildLeftActions(SQColor.white),
          ),
        ),
//        Positioned(
//          right: 0,
//          child: Container(
//            child: buildActions(SQColor.white),
//          ),
//        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            color: SQColor.blue,
            child: Row(
              children: <Widget>[
                buildLeftActions(SQColor.white),
//                Expanded(
//                  child: Text(
//                    '首页',
//                    style: TextStyle(
//                        background: Paint(),
//                        fontSize: 17,
//                        fontWeight: FontWeight.bold,
//                        color: SQColor.white),
//                    textAlign: TextAlign.center,
//                  ),
//                ),
//                buildActions(SQColor.white),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _getGridView() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      //解决scollview嵌套  滑动gridview的区域 没反应的问题
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      crossAxisCount: 5,
      shrinkWrap: true,
      //这个解决colum里面嵌套gridview显示不出来的问题
      childAspectRatio: 0.95,
      //宽高比 必须设置
      children: _singleView(),
    );
  }

  List<Widget> _singleView() {
    return iconList.map((IconResBean iconRes) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.network(
              iconRes.iconUrl,
              alignment: Alignment.center,
              height: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          ),
          Center(
            child: Text(
              iconRes.iconName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget getJoinServer() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network(
                  "https://app.10086.cn/group2/M00/02/22/ChoDJluhw5OAbmYQAAApm95JLdc063.jpg"),
              Center(
                child: Text(
                  "流量专区",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group2/M00/03/6D/ChoDJlwl1WKAHgs5AAEOAzN46ZQ438.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6E/ChoDJFwl22GAQjJ1AADGAtjoYzU265.jpg"),
                flex: 1,
              )
            ],
          ),
          Container(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/76/ChoDI1w2oF6AVGUyAADp6EuIoTI990.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6F/ChoDJFwnIKeAVuipAABb-mWXAVI403.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6E/ChoDI1wl3k6AMN4CAACVZVzDq90317.png"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group2/M00/03/6E/ChoDJlwl3wGAZZXHAADUzV_1M5k183.png"),
                flex: 1,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getJoinServer1() {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network(
                  "https://app.10086.cn/group2/M00/02/22/ChoDJluhw5OAbmYQAAApm95JLdc063.jpg"),
              Center(
                child: Text(
                  "号卡专区",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://app.10086.cn/group1/M00/02/50/ChoDI1urLgeAPX2CAADPHxF-yh8479.jpg",
                  height: 100,
                  fit: BoxFit.fill,
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        "https://app.10086.cn/group1/M00/02/50/ChoDI1urLgeAPX2CAADPHxF-yh8479.jpg",
                        width: 200,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      color: Colors.blue,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            "https://app.10086.cn/group1/M00/02/50/ChoDI1urLgeAPX2CAADPHxF-yh8479.jpg",
                            width: 100,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Image.network(
                            "https://app.10086.cn/group1/M00/02/50/ChoDI1urLgeAPX2CAADPHxF-yh8479.jpg",
                            width: 100,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getJoinServer2() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network(
                  "https://app.10086.cn/group2/M00/02/22/ChoDJluhw5OAbmYQAAApm95JLdc063.jpg"),
              Center(
                child: Text(
                  "流量专区",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group2/M00/03/6D/ChoDJlwl1WKAHgs5AAEOAzN46ZQ438.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6E/ChoDJFwl22GAQjJ1AADGAtjoYzU265.jpg"),
                flex: 1,
              )
            ],
          ),
          Container(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/76/ChoDI1w2oF6AVGUyAADp6EuIoTI990.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6F/ChoDJFwnIKeAVuipAABb-mWXAVI403.jpg"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group1/M00/03/6E/ChoDI1wl3k6AMN4CAACVZVzDq90317.png"),
                flex: 1,
              ),
              Container(
                width: 5.0,
              ),
              Expanded(
                child: Image.network(
                    "https://app.10086.cn/group2/M00/03/6E/ChoDJlwl3wGAZZXHAADUzV_1M5k183.png"),
                flex: 1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
