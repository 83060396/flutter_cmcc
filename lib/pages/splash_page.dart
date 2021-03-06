import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmcc/common/config/Constant.dart';
import 'package:cmcc/common/net/http_utils.dart';
import 'package:cmcc/common/resources/colors.dart';
import 'package:cmcc/common/utils/navigator_util.dart';
import 'package:cmcc/common/utils/object_util.dart';
import 'package:cmcc/common/utils/sp_helper.dart';
import 'package:cmcc/common/utils/sp_util.dart';
import 'package:cmcc/common/utils/swiper.dart';
import 'package:cmcc/common/utils/timer_util.dart';
import 'package:cmcc/common/utils/utils.dart';
import 'package:cmcc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;
  List<Widget> _bannerList = new List();
  int _status = 0;
  int _count = 3;
  SplashModel _splashModel;
  List<String> _guideList = [
    Utils.getImgPathJpg('aa'),
    Utils.getImgPathJpg('bb'),
    Utils.getImgPathJpg('cc'),
    Utils.getImgPathJpg('dd'),
    Utils.getImgPathJpg('ee'),
  ];
  @override
  void initState() {
    super.initState();
    _loadSplashData();
    _initAsync();
  }

  void _loadSplashData() async {
    HttpUtils httpUtil = new HttpUtils();
    httpUtil.getSplash().then((model) async {
      await SpUtil.getInstance();
      _splashModel = SpHelper.getSplashModel();
      if (!ObjectUtil.isEmpty(model.imgUrl)) {
        if (_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
          SpHelper.putObject(Constant.KEY_SPLASH_MODEL, model);
          setState(() {
            _splashModel = model;
          });
        }
      } else {
        SpHelper.putObject(Constant.KEY_SPLASH_MODEL, null);
      }
    });
  }

  void _initAsync() {
    Observable.just(1).delay(new Duration(milliseconds: 1000)).listen((_) {
//      SpUtil.putBool(Constant.KEY_GUIDE, false);
      if (SpUtil.getBool(Constant.KEY_GUIDE) != true &&
          ObjectUtil.isNotEmpty(_guideList)) {
        SpUtil.putBool(Constant.KEY_GUIDE, true);
        _initBanner();
      } else {
        _initSplash();
      }
    });
  }

  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 160.0),
                child: new InkWell(
                  onTap: () {
                    _goMain();
                  },
                  child: new CircleAvatar(
                    radius: 48.0,
                    backgroundColor: Colors.indigoAccent,
                    child: new Padding(
                      padding: EdgeInsets.all(2.0),
                      child: new Text(
                        '立即体验',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
      } else {
        _bannerList.add(new Image.asset(
          _guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  void _initSplash() {
    _splashModel = SpHelper.getSplashModel();
    if (_splashModel == null) {
      _goMain();
    } else {
      _doCountDown();
    }
  }

  void _doCountDown() {
    setState(() {
      _status = 1;
    });
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_tick == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/NavigationPage');
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      Utils.getImgPathJpg('app_start_page'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _buildAdWidget() {
    if (_splashModel == null) {
      return new Container(
        height: 0.0,
      );
    }
    return new Offstage(
      offstage: !(_status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url)) return;
          _goMain();
          NavigatorUtil.pushWeb(context,
              title: _splashModel.title, url: _splashModel.url);
        },
        child: new Container(
          alignment: Alignment.center,
          child: new CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            imageUrl: _splashModel.imgUrl,
            placeholder: _buildSplashBg(),
            errorWidget: _buildSplashBg(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: !(_status == 0),
            child: _buildSplashBg(),
          ),
          new Offstage(
            offstage: !(_status == 2),
            child: ObjectUtil.isEmpty(_bannerList)
                ? new Container()
                : new MySwiper(
                    autoStart: false,
                    circular: false,
                    indicator: CircleSwiperIndicator(
                      radius: 4.0,
                      padding: EdgeInsets.only(bottom: 30.0),
                      itemColor: Colors.black26,
                    ),
                    children: _bannerList),
          ),
          _buildAdWidget(),
          new Offstage(
            offstage: !(_status == 1),
            child: new Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _goMain();
                },
                child: new Container(
                    padding: EdgeInsets.all(12.0),
                    child: new Text(
                      '跳过 $_count',
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: new Border.all(
                            width: 0.33, color: ColorT.divider))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
