import 'package:cmcc/common/utils/object_util.dart';
import 'package:cmcc/common/utils/regex_util.dart';
import 'package:cmcc/common/utils/timeline_util.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static String getImgPathJpg(String name, {String format: 'jpg'}) {
    return 'images/$name.$format';
  }

  static Color nameToColor(String name) {
    // assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }

  static String getTimeLine(BuildContext context, int timeMillis) {
    return TimelineUtil.format(timeMillis,
        locale: Localizations.localeOf(context).languageCode,
        dayFormat: DayFormat.Common);
  }

  static double getTitleFontSize(String title) {
    if (ObjectUtil.isEmpty(title) || title.length < 10) {
      return 18.0;
    }
    int count = 0;
    List<String> list = title.split("");
    for (int i = 0, length = list.length; i < length; i++) {
      String ss = list[i];
      if (RegexUtil.isZh(ss)) {
        count++;
      }
    }

    return (count >= 10 || title.length > 16) ? 14.0 : 18.0;
  }
}
