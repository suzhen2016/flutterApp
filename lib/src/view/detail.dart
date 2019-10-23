
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// 详情页
class DetailPage extends StatelessWidget {
     
  	@override
  	Widget build(BuildContext context) {
		Widget divider1 = Divider(color: Colors.blue,);
		Widget divider2 = Divider(color: Colors.green);
		// 数据源
		List<String> titleItems = <String>[
			'中国梦', 'print',
			'router', 'pages',
			'zoom_out_map', 'zoom_out',
			'youtube_searched_for', 'wifi_tethering',
			'wifi_lock', 'widgets',
			'weekend', 'web',
			'图accessible', 'ac_unit',
		];

		List<Icon> iconItems = <Icon>[
			new Icon(Icons.keyboard), new Icon(Icons.print),
			new Icon(Icons.router), new Icon(Icons.pages),
			new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
			new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
			new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
			new Icon(Icons.weekend), new Icon(Icons.web),
			new Icon(Icons.accessible), new Icon(Icons.ac_unit),
		];

		List<String> subTitleItems = <String>[
			'在北京历史博物馆习近平同志提出...', 'subTitle: print',
			'subTitle: router', 'subTitle: pages',
			'subTitle: zoom_out_map', 'subTitle: zoom_out',
			'subTitle: youtube_searched_for', 'subTitle: wifi_tethering',
			'subTitle: wifi_lock', 'subTitle: widgets',
			'subTitle: weekend', 'subTitle: web',
			'subTitle: accessible', 'subTitle: ac_unit',
		];
		
		List<Widget> _list = new List();

		Widget buildListData(BuildContext context, String titleItem, Icon iconItem, String subTitleItem) {
			return new ListTile(
				leading: iconItem,
				title: new Text(
					titleItem,
					style: TextStyle(fontSize: 18),
				),
				subtitle: new Text(
					subTitleItem,
				),
				trailing: new Icon(Icons.keyboard_arrow_right),
				onTap: () {
					showDialog(
						context: context,
						builder: (BuildContext context) {
							return new AlertDialog(
								title: new Text( 
									'提示',
									style: new TextStyle(color: Colors.black54,fontSize: 18.0,),
								),
								content: new Text('$titleItem'),
							);
						},
					);
				},
			);
		}

		for (int i = 0; i < titleItems.length; i++) {
			_list.add(buildListData(context, titleItems[i], iconItems[i], subTitleItems[i]));
		}
		
		return Scaffold(
			appBar: AppBar(
				title: Text("列表页"),
				centerTitle: true,
				leading: IconButton(
					icon:Icon(Icons.arrow_back_ios),
					onPressed:() => Navigator.pop(context, false),
				),

			),
			body: Scrollbar(
				// A.默认写法
				// child: new ListView(
				// 	children: _list,
				// ),
				
				// B.ListView.builder写法
				child: ListView.builder(
					itemExtent: 60.0,
					itemBuilder: (BuildContext context,int index){
						// return Column(
						// 	crossAxisAlignment: CrossAxisAlignment.start,
						// 	children: <Widget>[
						// 		Text('Hello word , 你好世界 $index'),
						// 	]
						// );
						
						// 无分割线
						return buildListData(context, titleItems[index], iconItems[index], subTitleItems[index]);
						// 有分隔线
					},
					itemCount : titleItems.length,
				),
			)
		);
	}
}
// 随机字符获取
class RandomWordsWidget extends StatelessWidget {
  	@override
  	Widget build(BuildContext context) {
		// 生成随机字符串
		final wordPair = new WordPair.random();
		return Padding(
			padding: const EdgeInsets.all(18.0),
			child: new Text(wordPair.toString()),
		);
	}
}