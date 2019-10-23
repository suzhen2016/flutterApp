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
	Widget redBox = DecoratedBox(
		decoration: BoxDecoration(color: Colors.red), // 背景颜色
	);
	//下划线widget预定义以供复用。  
    // Widget divider1 = Divider(color: Colors.blue,);
    // Widget divider2 = Divider(color: Colors.green);
	String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		return Scaffold(
			body : Scrollbar(
				child: SingleChildScrollView(
					child: Column(
						// 显式指定对齐方式为左对齐，排除对齐干扰
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Stack(
								alignment:Alignment.topLeft,
								children: <Widget>[
									Positioned( // 定位元素
										// left: 18.0,
										child: ConstrainedBox( // B：实现盒模型的布局 ConstrainedBox 
												constraints: new BoxConstraints(
												minWidth: double.infinity, //宽度尽可能大
												minHeight: 300.0, //最小高度为50像素
											),
											child: Container(
												height: 5.0, 
												child: redBox
											),
										),
									),
									Container(
										decoration: new BoxDecoration(
												// 内容区域背景颜色
												color: Colors.white,
												// 设置四周边框
												border: new Border.all(width: 1, color: Colors.blue),
											),
										child: Text("我是定位的元素",style: TextStyle(color: Colors.blue)),
									),
									Padding(
										padding: EdgeInsets.all(0.0),
										child: Container(
											height: 255.0,
											width: double.infinity,
											child: Scrollbar( // 显示进度条
												child: SingleChildScrollView(
													child: Column( 
														//动态创建一个List<Widget>  
														children: str.split("") 
															//每一个字母都用一个Text显示,字体为原来的两倍
															.map((c) => Text(c, textScaleFactor: 2.0,)) 
															.toList(),
														),
												),
											),
										)
									),
								]
							),
							FlatButton(
								child: Text("阅读文章"),
								textColor: Colors.blue,
								onPressed: () {
									//导航到新路由
									Navigator.pushNamed(context, "edit_page");   
								},
							),
							// ListView(
							// 	shrinkWrap: true, 
							// 	padding: const EdgeInsets.all(20.0),
							// 	children: <Widget>[
							// 		const Text('I\'m dedicating every day to you'),
							// 		const Text('Domestic life was never quite my style'),
							// 		const Text('When you smile, you knock me out, I fall apart'),
							// 		const Text('And I thought I was so smart'),
							// 	],
							// ),
							// ListView.separated(
							// 	itemCount: 100,
							// 	//列表项构造器
							// 	itemBuilder: (BuildContext context, int index) {
							// 		return ListTile(title: Text("$index"));
							// 	},
							// 	//分割器构造器
							// 	separatorBuilder: (BuildContext context, int index) {
							// 		return index%2 == 0 ? divider1 : divider2;
							// 	},
							// )
						]
					)
				)
			)
		);
	}
}