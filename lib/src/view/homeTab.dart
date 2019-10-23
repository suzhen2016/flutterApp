import 'package:flutter/material.dart';


class HomeTabPage extends StatelessWidget {
  
  final  int counter;
  HomeTabPage({Key key, @required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	  // A:定义盒模型  容器
	  Widget redBox = DecoratedBox(
			decoration: BoxDecoration(color: Colors.red), // 背景颜色
		);
		// String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		return Scrollbar(
			child: SingleChildScrollView(
				child: Column(
					// 显式指定对齐方式为左对齐，排除对齐干扰
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Stack(
							alignment:Alignment.topLeft,
							children: <Widget>[
								// C: 实现盒子 Container
								Container(
									// margin: EdgeInsets.only(left: 40, top: 40),
									// 设置 child 居中
									alignment: Alignment(0, 0),
									height: 230.0,
									// width: 300,
									// 边框设置
									decoration: new BoxDecoration(
										// 内容区域背景颜色
										color: Colors.red,
										// 设置四周边框
										// border: new Border.all(width: 1, color: Colors.blue),
										// 设置四周边框圆角 角度等的多种方式
										// borderRadius: BorderRadius.all(Radius.circular(20.0)),
										// borderRadius: new BorderRadius.circular((20.0)), // 圆角度
										borderRadius: new BorderRadius.vertical(bottom: Radius.elliptical(20, 20)), // 也可控件一边圆角大小
									),
								),
								// D: 实现有内padding
								Padding(
									// 上下左右各添加8像素补白
									padding: EdgeInsets.all(8.0),
									child: Column(
										// 显式指定对齐方式为左对齐，排除对齐干扰
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											// Image(
											// 	image: AssetImage("assets/img/nbabg.png"),
											// 	// width: 300.0
											// 	fit: BoxFit.cover
											// ),
											Card(
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadiusDirectional.circular(15)),
													clipBehavior: Clip.antiAlias,
													child: Image.asset(
														"assets/img/nbabg.png",
														// width: double.maxFinite,
														fit: BoxFit.cover
													),
											),
										],
									),
								),
							],
						),

						Padding( 
							// 显示进度条  可滚动的
							// child: SingleChildScrollView(
								padding: EdgeInsets.all(16.0),
								// 布局开始
								// child: Center(
									child: Column(
										// 覆盖竖行排列的默认顺序
										mainAxisAlignment: MainAxisAlignment.start,
										children: <Widget>[
											// E：行布局实现
											Row(
												mainAxisAlignment: MainAxisAlignment.start,
												children: <Widget>[
													new ClipOval(
														child: Container(
															// margin: EdgeInsets.only(left: 10, right: 10),
															width: 50,
															height: 50,
															color: Colors.red,
															child: Center(
																child: Text('8',style: Theme.of(context).textTheme.display1),
															)
														),
													),
													new ClipOval(
														child: Container(
															width: 50,
															height: 50,
															color: Colors.red,
														),
													),
													new ClipOval(
														child: Container(
															width: 50,
															height: 50,
															color: Colors.red,
															child: Center(
																child: Text('88',style: Theme.of(context).textTheme.display1),
															)
														),
													),
													new ClipOval(
														child: Container(
															width: 50,
															height: 50,
															color: Colors.red,
															child: Text('冀',
																textAlign: TextAlign.center,
																style: TextStyle(
																	fontSize: 20.0,
																	height: 1.4,
																	color: Colors.white,
																)
															),
														),
													),
												],
											),

											Padding(
												// 上下左右各添加8像素补白
												padding: EdgeInsets.all(8.0),
												child: Container(
													height: 320.0,
													// width: 120.0,
													color: Colors.blue[50],
													child: Align(
														alignment: Alignment(1.0, -1.0),
														child: FlutterLogo(
															size: 60,
														),
													),
												),
											),
											
											Text('你点击了按钮次数:'),

											Text('$counter',
												style: Theme.of(context).textTheme.display1,
											),

											FlatButton(
												child: Text("列表页"),
												textColor: Colors.blue,
												onPressed: () {
													//导航到新路由
													Navigator.pushNamed(context, "detail_page");   
												},
											),
										],
									),
								// ),
							// ),
						)
					]
				)
			)
		);
   }
}








// Scrollbar( 
// 			// 显示进度条  可滚动的
// 			child: SingleChildScrollView(
// 				// padding: EdgeInsets.all(16.0),
// 				// 布局开始
// 				child: Center(
// 					child: Column(
// 						// 覆盖竖行排列的默认顺序
// 						mainAxisAlignment: MainAxisAlignment.start,
// 						children: <Widget>[
// 							// B：实现盒模型的布局 ConstrainedBox 
// 							// ConstrainedBox(
// 							// 		constraints: new BoxConstraints(
// 							// 		minWidth: double.infinity, //宽度尽可能大
// 							// 		minHeight: 50.0, //最小高度为50像素
// 							// 	),
// 							// 	child: Container(
// 							// 		height: 5.0, 
// 							// 		child: redBox
// 							// 	),
// 							// ),

// 							// C: 实现盒子 Container
// 							Container(
// 								// margin: EdgeInsets.only(left: 40, top: 40),
// 								// 设置 child 居中
// 								alignment: Alignment(0, 0),
// 								height: 150.0,
// 								// width: 300,
// 								// 边框设置
// 								decoration: new BoxDecoration(
// 									// 内容区域背景颜色
// 									color: Colors.red,
// 									// 设置四周边框
// 									// border: new Border.all(width: 1, color: Colors.blue),
// 									// 设置四周边框圆角 角度等的多种方式
// 									// borderRadius: BorderRadius.all(Radius.circular(20.0)),
// 									// borderRadius: new BorderRadius.circular((20.0)), // 圆角度
// 									borderRadius: new BorderRadius.vertical(bottom: Radius.elliptical(100, 100)), // 也可控件一边圆角大小
// 								),
// 							),

// 							// D: 实现有内padding
// 							Padding(
// 								// 上下左右各添加8像素补白
// 								padding: EdgeInsets.all(8.0),
// 								child: Column(
// 									// 显式指定对齐方式为左对齐，排除对齐干扰
// 									crossAxisAlignment: CrossAxisAlignment.start,
// 									children: <Widget>[
// 										// Image(
// 										// 	image: AssetImage("assets/img/nbabg.png"),
// 										// 	// width: 300.0
// 										// 	fit: BoxFit.cover
// 										// ),
// 										Card(
// 											shape: RoundedRectangleBorder(
// 												borderRadius: BorderRadiusDirectional.circular(15)),
// 												clipBehavior: Clip.antiAlias,
// 												child: Image.asset(
// 													"assets/img/nbabg.png",
// 													// width: double.maxFinite,
// 													fit: BoxFit.cover
// 												),
// 										),
// 									],
// 								),
// 							),
							
// 							// E：行布局实现
// 							Row(
// 								mainAxisAlignment: MainAxisAlignment.start,
// 								children: <Widget>[
// 									new ClipOval(
// 										child: Container(
// 											// margin: EdgeInsets.only(left: 10, right: 10),
// 											width: 50,
// 											height: 50,
// 											color: Colors.red,
// 											child: Center(
// 												child: Text('8',style: Theme.of(context).textTheme.display1),
// 											)
// 										),
// 									),
// 									new ClipOval(
// 										child: Container(
// 											width: 50,
// 											height: 50,
// 											color: Colors.red,
// 										),
// 									),
// 									new ClipOval(
// 										child: Container(
// 											width: 50,
// 											height: 50,
// 											color: Colors.red,
// 											child: Center(
// 												child: Text('88',style: Theme.of(context).textTheme.display1),
// 											)
// 										),
// 									),
// 									new ClipOval(
// 										child: Container(
// 											width: 50,
// 											height: 50,
// 											color: Colors.red,
// 											child: Text('冀',
// 												textAlign: TextAlign.center,
// 												style: TextStyle(
// 													fontSize: 20.0,
// 													height: 1.4,
// 													color: Colors.white,
// 												)
// 											),
// 										),
// 									),
// 								],
// 							),

// 							Padding(
// 								// 上下左右各添加8像素补白
// 								padding: EdgeInsets.all(8.0),
// 								child: Container(
// 									height: 120.0,
// 									// width: 120.0,
// 									color: Colors.blue[50],
// 									child: Align(
// 										alignment: Alignment(1.0, -2.0),
// 										child: FlutterLogo(
// 											size: 60,
// 										),
// 									),
// 								),
// 							),
							
// 							// Stack(
// 							// 	alignment:Alignment.center ,
// 							// 	// fit: StackFit.expand, //未定位widget占满Stack整个空间
// 							// 	children: <Widget>[
// 							// 		Positioned(
// 							// 			top: 18.0,
// 							// 			child: Text("I am Jack"),
// 							// 		),
// 							// 	],
// 							// ),
							
// 							Text('你点击了按钮次数:'),

// 							Text('$counter',
// 								style: Theme.of(context).textTheme.display1,
// 							),

// 							FlatButton(
// 								child: Text("详情页 route"),
// 								textColor: Colors.blue,
// 								onPressed: () {
// 									//导航到新路由
// 									Navigator.pushNamed(context, "detail_page");   
// 									// Navigator.push( context,
// 									// 	new MaterialPageRoute(builder: (context) {
// 									// 			return new DetailPage();
// 									// 		}));
// 								},
// 							),

// 							FlatButton(
// 								child: Text("选择图片"),
// 								textColor: Colors.blue,
// 								onPressed: () {
// 									//导航到新路由
// 									Navigator.pushNamed(context, "pick_page");
// 								},
// 							),
// 						],
// 					),
// 				),
// 			),
// 		);