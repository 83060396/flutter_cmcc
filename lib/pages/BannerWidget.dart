import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

var bannerList = [
  'https://app.10086.cn/group1/M00/03/80/ChoDJFxG4DeAUucZAAL5ihnVddc879.jpg',
  'https://app.10086.cn/group1/M00/03/72/ChoDI1wsKfGAQbo_AAHeNuaMQ_M335.jpg',
  'https://app.10086.cn/group1/M00/03/7E/ChoDI1xBf4WAeZaUAAH4BDd0zfg804.jpg',
  'https://app.10086.cn/group2/M00/03/7E/ChoDJlxFG5aAAKEWAAJVQKUwSPo955.jpg',
  'https://app.10086.cn/group1/M00/03/80/ChoDI1xG4beAXkJSAAMHGnvt8gE073.jpg',
  'https://app.10086.cn/group2/M00/03/72/ChoDJlwtYNSABAAmAAFudlC5urU571.jpg',
  'https://app.10086.cn/group1/M00/03/7D/ChoDJFxBRIGARbnBAAIvw92k62I473.jpg',
  'https://app.10086.cn/group2/M00/03/63/ChoDJVwYrxiAKY8iAAHnQbCLsAk260.jpg',
];
var bannerView = Swiper(
  itemBuilder: _swiperBuilder,
  itemCount: bannerList.length,
  curve: Curves.decelerate,
  pagination: SwiperPagination(
    alignment: Alignment.bottomRight,
    builder: DotSwiperPaginationBuilder(
      size: 5.0,
      activeSize: 6.0,
      space: 5.0,
      color: Colors.white,
      activeColor: Colors.grey,
    ),
  ),
  /*control: SwiperControl(),*/
  autoplay: true,
  onTap: (index) => debugPrint('点击了第$index个'),
);

Widget _swiperBuilder(BuildContext context, int index) {
  return Image.network(
    bannerList[index],
    fit: BoxFit.fill,
  );
}
