import 'package:flutter/material.dart';
import '../dart/toast.dart';
import '../dart/localStroage.dart';

class Login extends StatefulWidget {
  final login;
  Login({Key key, @required this.login}) : super(key: key);

  @override
  _LoainState createState() => _LoainState();
}

class _LoainState extends State<Login> {
  String userName, password, userNameError, passwordError;
  var localStroage = LocalStroage();
  @override
  Login get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Center(
            child: Text('登录'),
          ),
        ),
        body: Material(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "用户名",
                          helperText: '用户名:123',
                          labelStyle: TextStyle(color: Colors.pink[300]),
                          errorText: userNameError,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.pink[200]),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.pink[400]),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          )),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          userName = value;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "密码",
                            helperText: '密码:123',
                            labelStyle: TextStyle(color: Colors.pink[300]),
                            errorText: passwordError,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.pink[200]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Colors.pink[400]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            )),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ButtonTheme(
                            height: 40,
                            child: RaisedButton(
                              onPressed: () {
                                toast('正在登陆');
                                if (userName == null) {
                                  toast('请填写用户名');
                                  return;
                                }
                                if (password == null) {
                                  toast('请填写密码');
                                  return;
                                }
                                if (userName == '123' && password == '123') {
                                  // 登录状态存储
                                  localStroage.setItem('isLogin', true);
                                  toast('登录成功');
                                  widget.login(true);
                                  return;
                                }
                                toast('登录失败');
                              },
                              child: Text(
                                '登录',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              color: Colors.pink[300],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: ButtonTheme(
                            height: 40,
                            child: RaisedButton(
                              shape:
                                  Border.all(width: 1, color: Colors.grey[100]),
                              onPressed: () {
                                toast('跳转注册');
                              },
                              child: Text('注册',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
