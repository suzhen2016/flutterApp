import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  RecordPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		body: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
					Text('你点击了按钮次数6:'),
				]
			)
		),
    );
}
}