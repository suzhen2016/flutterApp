import 'package:flutter/material.dart';

class MyPage extends StatelessWidget  {
  final String text;
  MyPage(this.text);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(text),
    );
  }
}