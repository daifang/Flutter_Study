import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';

class MySwiper extends StatelessWidget {
  const MySwiper({Key key, this.imgDataList}) : super(key: key);
  final List imgDataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return (FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: imgDataList[index],
              fit: BoxFit.cover,
            ));
          },
          itemCount: imgDataList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}
