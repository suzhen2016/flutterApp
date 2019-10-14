import 'package:flutter/material.dart';

class HomeTabPage extends StatelessWidget {
  HomeTabPage({Key key, this.counter : 1 }) : super(key: key);
  final  int counter;
  @override
  Widget build(BuildContext context) {
    return  Center(
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				Text('你点击了按钮次数:'),
				Text('$counter',
				  style: Theme.of(context).textTheme.display1,
				),
				FlatButton(
					child: Text("详情页 route"),
					textColor: Colors.blue,
					onPressed: () {
						//导航到新路由
						Navigator.pushNamed(context, "detail_page");   
						// Navigator.push( context,
						// 	new MaterialPageRoute(builder: (context) {
						// 			return new DetailPage();
						// 		}));
						},
					),
				FlatButton(
					child: Text("选择图片"),
					textColor: Colors.blue,
					onPressed: () {
						//导航到新路由
						Navigator.pushNamed(context, "pick_page");
					},
				),
			],
			),
		);
   }
}