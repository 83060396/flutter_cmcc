import 'package:cmcc/common/utils/navigator_util.dart';
import 'package:cmcc/models/IconResBean.dart';
import 'package:cmcc/models/TypeResBean.dart';
import 'package:cmcc/pages/CommonHtml5Page.dart';
import 'package:flutter/material.dart';

int index = 0;
List<TypeResBean> typeList;

class TypePage extends StatefulWidget {
  @override
  _TypePageState createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  void initState() {
    super.initState();
    initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        elevation: 0, //阴影高度
        centerTitle: true, //居中显示
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.textsms),
              tooltip: 'Add Alarm',
              onPressed: () {
                NavigatorUtil.pushPage(
                    context, new CommonHtml5Page("http://www.baidu.com", "百度"));
              }),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
                color: Color.fromARGB(255, 241, 244, 243),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return buildText(index);
                  },
                  itemCount: typeList.length,
                ),
              ),
              flex: 1),
          Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(6.0, 5.0, 0, 5.0),
                        child: Text(
                          '热门精选',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                      _getGridView(),
                    ],
                  ),
                ),
              ),
              flex: 4),
        ],
      ),
    );
  }

  Widget buildText(int mIndex) {
    if (index == mIndex) {
      return Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 90.0,
            height: 50.0,
            color: Colors.white,
            child: Text(typeList[mIndex].iconName,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          Container(
            color: Colors.blue,
            width: 5.0,
            height: 50.0,
          ),
        ],
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          index = mIndex;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 90.0,
        height: 51.0,
        child: Text(
          typeList[mIndex].iconName,
          style: TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Widget _getGridView() {
  return GridView.count(
    physics: NeverScrollableScrollPhysics(),
    //解决scollview嵌套  滑动gridview的区域 没反应的问题
    crossAxisSpacing: 15.0,
    mainAxisSpacing: 10.0,
    crossAxisCount: 3,
    shrinkWrap: true,
    //这个解决colum里面嵌套gridview显示不出来的问题
    childAspectRatio: 0.7,
    //宽高比 必须设置
    children: _singleView(),
  );
}

List<Widget> _singleView() {
  return typeList[index].list.map((IconResBean detail) {
    return Column(
      children: <Widget>[
        Image.network(
          detail.iconUrl,
          width: 70.0,
          height: 70.0,
          fit: BoxFit.fill,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
          child: Text(
            detail.iconName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }).toList();
}

initDate() {
  List<IconResBean> picList1 = List();
  picList1.add(IconResBean('美女1',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3781315478,1934124074&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女2',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2908685083,3079518550&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女3',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1570444243,2428502615&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女4',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3402156445,2973077239&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女5',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1048531140,213711847&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女6',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1004664987,1272603277&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女1',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3781315478,1934124074&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女2',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2908685083,3079518550&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女3',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1570444243,2428502615&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女4',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3402156445,2973077239&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女5',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1048531140,213711847&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女6',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1004664987,1272603277&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女1',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3781315478,1934124074&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女2',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2908685083,3079518550&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女3',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1570444243,2428502615&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女4',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3402156445,2973077239&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女5',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1048531140,213711847&fm=27&gp=0.jpg'));
  picList1.add(IconResBean('美女6',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1004664987,1272603277&fm=27&gp=0.jpg'));

  List<IconResBean> picList2 = List();
  picList2.add(IconResBean('风景1',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=124155087,2314196803&fm=27&gp=0.jpg'));
  picList2.add(IconResBean('风景2',
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3272199364,3404297250&fm=27&gp=0.jpg'));
  picList2.add(IconResBean('风景3',
      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2366882342,2282069833&fm=27&gp=0.jpg'));

  List<IconResBean> picList3 = List();
  picList3.add(IconResBean('跑车1',
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1656811409,1242727312&fm=27&gp=0.jpg'));
  picList3.add(IconResBean('跑车2',
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=248774050,4268131522&fm=27&gp=0.jpg'));
  picList3.add(IconResBean('跑车3',
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=240983388,3429403328&fm=27&gp=0.jpg'));
  picList3.add(IconResBean('跑车4',
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2249861203,2254664290&fm=27&gp=0.jpg'));

  typeList = new List();
  typeList
    ..add(TypeResBean('美女', picList1))
    ..add(TypeResBean('风景', picList2))
    ..add(TypeResBean('跑车', picList3));
}
