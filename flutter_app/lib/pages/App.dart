import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/dart/toast.dart';
import './Publish.dart';
import './Market.dart';
import './Mine.dart';
import '../router/routers.dart';
import '../router/routeStatic.dart';
import 'package:fluro/fluro.dart';
import '../dart/toast.dart';

class App extends StatefulWidget {
  final exit;
  App({Key key, this.exit}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<App> {
  int pageIndex = 0; // 页面索引
  List<Widget> pageList = new List();
  List<String> title = new List();
  @override
  // TODO: implement widget
  App get widget => super.widget;
  @override
  void initState() {
    super.initState();
    pageList.add(PictureListTest());
    pageList.add(Notes());
    pageList.add(Mine(exit: (bool state) {
      widget.exit(state);
    }));
    title.add('首页');
    title.add('数据请求');
    title.add('个人中心');
  }

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routers.configRoute(router);
    StaticRoute.router = router;
    return MaterialApp(
        onGenerateRoute: StaticRoute.router.generator,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(title[pageIndex])),
            // leading: Icon(Icons.accessibility),
            backgroundColor: Colors.pink[300],
            brightness: Brightness.light,
          ),
          body: IndexedStack(children: pageList, index: pageIndex),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.pink,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Center(child: Text('首页'))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), title: Center(child: Text('数据请求'))),
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
                toast('添加操作');
              }),
        ));
  }
}
