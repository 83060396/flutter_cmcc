import 'package:cmcc/common/utils/object_util.dart';
import 'package:cmcc/widget/CustomRoute.dart';
import 'package:flutter/cupertino.dart';

class NavigatorUtil {
  static void pushPage(BuildContext context, Widget page, {String pageName}) {
    if (context == null || page == null) return;
    Navigator.push(context, new CustomRoute(page));
  }

  static void pushWeb(BuildContext context,
      {String title, String titleId, String url, bool isHome: false}) {
    if (context == null || ObjectUtil.isEmpty(url)) return;
    if (url.endsWith(".apk")) {
      launchInBrowser(url, title: title ?? titleId);
    }
  }

  static Future<Null> launchInBrowser(String url, {String title}) async {}
}
