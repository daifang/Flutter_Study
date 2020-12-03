import 'package:flutter/material.dart';

class GoodDetails extends StatelessWidget {
  final dynamic goodId;
  const GoodDetails({Key key, this.goodId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页'), backgroundColor: Colors.pink[500]),
      body: Container(
          color: Colors.grey[100],
          child: Center(
            child: Text(
              '这是这一页的id --->> $goodId',
              style: TextStyle(fontSize: 18, color: Colors.pink),
            ),
          )),
    );
  }
}
