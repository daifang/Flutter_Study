import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'XXX',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[300],
            title: Text('XXX'),
          ),
          body: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.pink[100],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
            ),
          ),
        ));
  }
}
