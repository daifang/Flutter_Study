import 'package:flutter/material.dart';
import './pages/Publish.dart';
import './pages/Market.dart';
import './pages/Mine.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int pageIndex = 0; // 页面索引
  List<Widget> pageList = new List();
  List<String> title = new List();

  @override
  void initState() {
    super.initState();
    pageList.add(PictureListTest());
    pageList.add(Notes());
    pageList.add(Mine());
    title.add('首页');
    title.add('疫情一览');
    title.add('个人中心');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title[pageIndex])),
        // leading: Icon(Icons.accessibility),
        backgroundColor: Colors.pink[300],
      ),
      body: Container(
          child: pageList[pageIndex], padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Center(child: Text('首页'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Center(child: Text('疫情一览'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Center(child: Text('个人页面'))),
        ],
        onTap: (value) {
          setState(() {
            pageIndex = value;
            print('页面下标值 --->> $pageIndex');
          });
        },
        currentIndex: pageIndex,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[400],
          child: Center(child: Icon(Icons.add)),
          onPressed: () {
            print('添加');
          }),
    ));
  }
}

// // 记事页面
// class Note extends StatelessWidget {
//   const Note({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print('记事');
//     return Container(
//         child: Padding(
//       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: Column(
//         children: [
//           Expanded(child: Text('标题'), flex: 1),
//           Expanded(child: Text('图片URL'), flex: 1),
//           Expanded(child: Text('正文'), flex: 5)
//         ],
//       ),
//     ));
//   }
// }

// // 图片列表页
// // ignore: must_be_immutable
// class PictureListTest extends StatelessWidget {
//   PictureListTest({Key key}) : super(key: key);
//   List<Widget> imgUrl = new List();
//   int j = 1;
//   @override
//   Widget build(BuildContext context) {
//     print('图片列表');
//     for (var i = 0; i < 100; i++) {
//       if (j == 6) j = 1;
//       imgUrl.add(Padding(
//           padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
//           child: Column(children: [
//             Expanded(
//                 flex: 5,
//                 child: Image.network(
//                     'https://www.itying.com/images/flutter/$j.png',
//                     fit: BoxFit.cover)),
//             Expanded(
//                 flex: 1,
//                 child: Padding(
//                   child: Text('标题$j'),
//                   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                 ))
//           ])));
//       j++;
//     }
//     return GridView.count(
//         crossAxisCount: 2, childAspectRatio: 1.0, children: imgUrl);
//   }
// }
