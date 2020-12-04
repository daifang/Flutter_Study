import 'dart:ui';

import 'package:flutter/material.dart';
import '../dart/localStroage.dart';

class Mine extends StatefulWidget {
  final exit;
  Mine({Key key, @required this.exit}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  var localStroage = LocalStroage();

  @override
  // TODO: implement widget
  Mine get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    'https://www.itying.com/images/flutter/7.png',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium)),
            backgroundColor: Colors.pink[400],
            expandedHeight: 200),
        SliverFixedExtentList(
          itemExtent: 80.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Card(
              child: Container(
                alignment: Alignment.center,
                color: Colors.primaries[(index % 18)],
                child: ButtonTheme(
                  child: RaisedButton(
                      child: Text('退出登录'),
                      onPressed: () {
                        localStroage.clear();
                        widget.exit(false);
                      }),
                ),
              ),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}
