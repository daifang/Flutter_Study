import 'dart:ui';

import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
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
                child: Text('颜色代码: ${index % 18}'),
              ),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}
