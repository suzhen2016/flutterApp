import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homeTab.dart';
import './record.dart';
import './myPage.dart';
import './form.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _counter = 0;
	int _selectedIndex = 0;
	final List<Widget> _children = [
		new HomeTabPage( counter: 4),
		new RecordPage(),
        new FormDemo(),
		new MyPage()
	];
	final List<String> _bar = [
		'首页','列表','form','我的'
	];
	void _incrementCounter() {
		setState(() {
			_counter++;
			print(' _counter ${ _counter }');
		});
	}

	// 返回每个隐藏的菜单项
	selectView(IconData icon, String text, String id) {
		return new PopupMenuItem<String>(
			value: id,
			child: new Row(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					new Icon(icon, color: Colors.blue),
					new Text(text),
				],
			)
		);
	}


  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(  // 顶部状态栏
				title: Text(_bar[_selectedIndex]),
				automaticallyImplyLeading : false,
				centerTitle: true,
				elevation:0,
				actions: <Widget>[
					// 非隐藏的菜单
					new IconButton(
						icon: new Icon(Icons.add_alarm),
						tooltip: 'Add Alarm',
						onPressed: () {}
					),
					// 隐藏的菜单
					new PopupMenuButton<String>(
						itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
							this.selectView(Icons.message, '发起群', 'A'),
							this.selectView(Icons.group_add, '添加服务', 'B'),
							this.selectView(Icons.cast_connected, '扫一扫码', 'C'),
						],
						onSelected: (String action) {
							// 点击选项的时候
							switch (action) {
								case 'A': break;
								case 'B': break;
								case 'C': break;
							}
						},
					),
				],

			),
			bottomNavigationBar: BottomNavigationBar( // 底部导航
                type : BottomNavigationBarType.fixed, // 解决大于四个就空白的问题
				items: <BottomNavigationBarItem>[
					BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
					BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('列表')),
                    BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('form')),
					BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
				],
				currentIndex: _selectedIndex,
				fixedColor: Colors.blue, // 激活状态下的颜色
				onTap: _onItemTapped, // 点击事件执行方法切换body内容
			),
			body: _children[_selectedIndex], // 内容区域 HomeTabPage(counter: _counter),
			floatingActionButton: FloatingActionButton(   // 浮动按钮
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: Icon(Icons.add),
			), // This trailing comma makes auto-formatting nicer for build methods.
		);
  	}
  	void _onItemTapped(int index) {
		  setState(() {
				_selectedIndex = index;
                print(index);
			});
  		}
}