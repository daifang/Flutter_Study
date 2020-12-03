import 'package:flutter/material.dart';
import 'package:flutter_app/http/http.dart';
import '../components/mySwiper.dart';
import '../components/NavListView.dart';

// 图片列表页
// ignore: must_be_immutable
class PictureListTest extends StatelessWidget {
  PictureListTest({Key key}) : super(key: key);
  List<Map<String, dynamic>> navList = [
    {'title': '图片1', 'imgUrl': 'https://www.itying.com/images/flutter/1.png'},
    {'title': '图片2', 'imgUrl': 'https://www.itying.com/images/flutter/2.png'},
    {'title': '图片3', 'imgUrl': 'https://www.itying.com/images/flutter/3.png'},
    {'title': '图片4', 'imgUrl': 'https://www.itying.com/images/flutter/4.png'},
    {'title': '图片5', 'imgUrl': 'https://www.itying.com/images/flutter/5.png'},
    {'title': '图片6', 'imgUrl': 'https://www.itying.com/images/flutter/6.png'},
    {'title': '图片7', 'imgUrl': 'https://www.itying.com/images/flutter/7.png'}
  ];
  List<Widget> imgUrl = new List();
  int j = 1;
  Future future = get('https://www.itying.com/images/flutter/1.png');
  List<String> imgWiper = [
    'https://www.itying.com/images/flutter/1.png',
    'https://www.itying.com/images/flutter/2.png',
    'https://www.itying.com/images/flutter/3.png',
    'https://www.itying.com/images/flutter/4.png',
    'https://www.itying.com/images/flutter/5.png'
  ];
  @override
  Widget build(BuildContext context) {
    print('图片列表');
    imgUrl = [];
    for (var i = 0; i < 35; i++) {
      if (j == 8) j = 1;
      imgUrl.add(Padding(
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
                      flex: 5,
                      child: ClipRRect(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.png',
                          image: 'https://www.itying.com/images/flutter/$j.png',
                          fit: BoxFit.cover,
                          height: 200.0,
                          width: 200.0,
                        ),
                        borderRadius: BorderRadius.circular(2.0),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        child: Text('商品$j'),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        child: Text(
                          '描述$j，描述描述描述描述描述描述描述描述描述描述描述描述描述描述',
                          style: TextStyle(fontSize: 10),
                        ),
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      ))
                ]),
                onTap: () {
                  print("点击事件");
                },
              ),
            )),
      ));
      j++;
    }
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // 存在数据
            return (ListView(children: [
              MySwiper(imgDataList: imgWiper),
              NavView(dataList: navList),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: imgUrl,
                childAspectRatio: 0.65,
                physics: NeverScrollableScrollPhysics(),
              )
            ]));
          } else if (snapshot.hasError) {
            return (Center(child: Text('出现错误:${snapshot.error}')));
          } else {
            // 加载中
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
