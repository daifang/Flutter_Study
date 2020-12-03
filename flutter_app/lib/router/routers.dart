import './router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routers {
  static String root = '/';
  static String details = '/details';
  static void configRoute(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('404 not fount');
    });
    // 详情页
    router.define(details, handler: toDetails);
  }
}
