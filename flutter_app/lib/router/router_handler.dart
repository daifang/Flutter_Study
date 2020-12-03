import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/Details.dart';

Handler toDetails =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  dynamic goodId = params['id'][0];
  print('params --->> $params ---------- $goodId');
  return (GoodDetails(goodId: goodId));
});
