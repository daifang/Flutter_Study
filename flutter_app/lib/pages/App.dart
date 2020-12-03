import 'package:flutter/material.dart';
import './Publish.dart';
import './Market.dart';
import './Mine.dart';
import '../router/routers.dart';
import '../router/routeStatic.dart';
import 'package:fluro/fluro.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<App> {
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
