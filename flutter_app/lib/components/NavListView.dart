import 'package:flutter/material.dart';
import '../dart/toast.dart';

class NavView extends StatelessWidget {
  const NavView({Key key, this.dataList}) : super(key: key);
  final List<Map<String, dynamic>> dataList; // 传入的图片和标题值
  Widget _getItem(BuildContext context, item) {
    return (InkWell(
        onTap: () {
          toast("你点击了我${item['title']}");
        },
        child: Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(children: [
                  Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(item['imgUrl']),
                          radius: 50.0,
                        ),
                      ),
                      flex: 2),
                  Expanded(child: Text(item['title']), flex: 1)
                ])))));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey[100],
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: dataList.map((item) {
              return _getItem(context, item);
            }).toList()));
  }
}
