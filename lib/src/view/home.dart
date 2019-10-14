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
		new HomeTabPage(),
		new RecordPage(),
		new MyPage('我的主页')
	];
	final List<String> _bar = [
		'首页','报价记录','我的'
	];
	void _incrementCounter() {
		setState(() {
			_counter++;
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      	appBar: AppBar(
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
			onTap: _onItemTapped,
		),
		body: _children[_selectedIndex] , // HomeTabPage(counter: _counter),
		floatingActionButton: FloatingActionButton(
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
    	// if(index==1) {
			// Navigator.pushNamed(context, "record_page");
			//  Navigator.pop(context);
			//  Navigator.push(context, CupertinoPageRoute(  
			// 	builder: (context) => RecordPage(),
			// 	maintainState : true
			// ));
		// }
  	}
}