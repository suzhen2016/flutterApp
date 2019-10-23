import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homeTab.dart';
import './record.dart';
import './myPage.dart';
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
		new MyPage('我的主页')
	];
	final List<String> _bar = [
		'首页','报价列表','我的'
	];
	void _incrementCounter() {
		setState(() {
			_counter++;
			print(' _counter ${ _counter }');
		});
	}

  	@override
  	Widget build(BuildContext context) {
    	return Scaffold(
			appBar: AppBar(  // 顶部状态栏
				title: Text(_bar[_selectedIndex]),
				automaticallyImplyLeading : false,
				centerTitle: true,
			),
			bottomNavigationBar: BottomNavigationBar( // 底部导航
				items: <BottomNavigationBarItem>[
					BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
					BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('报价记录')),
					BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
				],
				currentIndex: _selectedIndex,
				fixedColor: Colors.blue,
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
			});
  		}
}