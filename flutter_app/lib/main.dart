import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/App.dart'; // 首页
import './pages/Login.dart'; // 登录页
import 'dart/localStroage.dart'; // localStroage
import 'pages/Loading.dart'; // 加载页

void main() {
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var localStroage = LocalStroage();
  var isLogin;
  // @override
  // Widget build(BuildContext context) {
  //   return App();
  // }
  @override
  void initState() {
    super.initState();
    _getLoginState();
  }

  _getLoginState() {
    localStroage.getItem('isLogin').then((result) {
      print('result----->>>$result');
      setState(() {
        if (result == null)
          isLogin = false;
        else
          isLogin = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('isLogin ----->>> $isLogin');
    if (isLogin == null) {
      return Loading();
    }
    if (isLogin) {
      return App(
        exit: (bool state) {
          setState(() {
            isLogin = state;
          });
        },
      );
    }
    return Login(login: (bool state) {
      print('------state: $state------');
      setState(() {
        isLogin = state;
      });
    });
  }
}
