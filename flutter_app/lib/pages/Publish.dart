import 'package:flutter/material.dart';
import 'package:flutter_app/dart/toast.dart';
import 'package:flutter_app/http/http.dart';
import '../http/http.dart';

// 记事页面
class Notes extends StatefulWidget {
  Notes({Key key, List list}) : super(key: key);
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Widget> list = [];
  List<Widget> list1 = [];
  List<Widget> secList = [];
  String url = "/txapi/ncovcity/index?key=285ed712e35d23a3caa2a5e9c62c2574";
  @override
  void initState() {
    super.initState();
    get(url).then((res) {
      print(res);
      if (res['code'] == 500) {
        print('请求失败${res[0]},${res[1]}');
      } else {
        print('请求成功${res[0]},${res[1]}');
        if (res['data']['code'] == 130) {
          toast(res['data']['msg']);
          secList.add(Center(child: Text('请求失败')));
          return;
        }
        for (int i = 0; i < res['data']['newslist'].length; i++) {
          // print(1);
          for (int j = 0;
              j < res['data']['newslist'][i]['cities'].length;
              j++) {
            // print(2);
            secList.add(Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                    res['data']['newslist'][i]['cities'][j]['cityName'],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  Text(
                      '确诊: ${res['data']['newslist'][i]['cities'][j]['confirmedCount'].toString()}'),
                  Text(
                      '治愈: ${res['data']['newslist'][i]['cities'][j]['curedCount'].toString()}'),
                  Text(
                      '疑似: ${res['data']['newslist'][i]['cities'][j]['suspectedCount'].toString()}')
                ])));
          }
          // print(secList);
          Widget container = Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                    res['data']['newslist'][i]['provinceName'],
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                  res['data']['newslist'][i]['cities'].length > 0
                      ? Wrap(children: secList)
                      : Text(" ")
                ])),
          );
          secList = [];
          list1.add(container);
        }
        setState(() {
          list = list1;
          // print(list);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Center(
            child: FutureBuilder(
                future: get(url),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // 存在数据
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return list[index];
                        });
                  } else if (snapshot.hasError) {
                    return (Text('出现错误:${snapshot.error}'));
                  } else {
                    // 加载中
                    return CircularProgressIndicator();
                  }
                })));
  }
}
