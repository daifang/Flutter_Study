import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/http/http.dart';
import '../components/mySwiper.dart';
import '../components/NavListView.dart';
import '../router/routeStatic.dart';
import '../dart/toast.dart';
import 'package:async/async.dart';

// 图片列表页
// ignore: must_be_immutable
class PictureListTest extends StatelessWidget {
  PictureListTest({Key key}) : super(key: key);
  List<Map<String, dynamic>> navList = [
    {'title': 'P1', 'imgUrl': 'https://www.itying.com/images/flutter/1.png'},
    {'title': 'P2', 'imgUrl': 'https://www.itying.com/images/flutter/2.png'},
    {'title': 'P3', 'imgUrl': 'https://www.itying.com/images/flutter/3.png'},
    {'title': 'P4', 'imgUrl': 'https://www.itying.com/images/flutter/4.png'},
    {'title': 'P5', 'imgUrl': 'https://www.itying.com/images/flutter/5.png'},
    {'title': 'P6', 'imgUrl': 'https://www.itying.com/images/flutter/6.png'},
    {'title': 'P7', 'imgUrl': 'https://www.itying.com/images/flutter/7.png'}
  ];
  List<Widget> imgUrl = new List();
  int j = 1;

  final AsyncMemoizer _memoizer = AsyncMemoizer();
  _gerData() {
    return _memoizer.runOnce(() async {
      return await get('https://www.baidu.com');
    });
  }

  List<String> imgWiper = [
    'https://www.itying.com/images/flutter/1.png',
    'https://www.itying.com/images/flutter/2.png',
    'https://www.itying.com/images/flutter/3.png',
    'https://www.itying.com/images/flutter/4.png',
    'https://www.itying.com/images/flutter/5.png'
  ];

  List<Widget> _createItems(BuildContext context) {
    return (navList
        .map((val) => Padding(
              padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
              child: Material(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      hoverColor: Colors.grey[400],
                      child: Column(children: [
                        Expanded(
                            flex: 6,
                            child: ClipRRect(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                image: val['imgUrl'],
                                fit: BoxFit.cover,
                                height: 200.0,
                                width: 200.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              child: Text(val['title']),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              child: Row(
                                children: [Text('发布日期:'), Text('2020/2/3')],
                              ),
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                            ))
                      ]),
                      onTap: () {
                        print("点击事件");
                        StaticRoute.router.navigateTo(
                            context, '/details?id=${val['title']}',
                            transition: TransitionType.material);
                      },
                      onDoubleTap: () {
                        toast('双击事件 ---- >> ${val['title']}');
                      },
                      onLongPress: () {
                        toast('长按事件，可举报 ---- >> ${val['title']}');
                      },
                    ),
                  )),
            ))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    print('图片列表');
    return FutureBuilder(
        future: _gerData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // 存在数据
            return (ListView(children: [
              MySwiper(imgDataList: imgWiper),
              NavView(dataList: navList),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: _createItems(context),
                childAspectRatio: 0.8,
                physics: NeverScrollableScrollPhysics(),
              )
            ]));
          } else if (snapshot.hasError) {
            toast('${snapshot.error}');
            return (Center(child: Text('出现错误')));
          } else {
            // 加载中
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.pink[100],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
              ),
            );
          }
        });
  }
}
