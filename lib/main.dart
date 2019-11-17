
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import './src/view/home.dart';
import './src/view/detail.dart';
import './src/view/record.dart';
import './src/view/editPage.dart';
import './src/view/sliverDemo.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(new MyApp());
	if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
		SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
		SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
	}
}

// 主页面home
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //去除右上角的Debug标签
      title: '利小保',
      theme: ThemeData(
        primarySwatch: Colors.red,    // 主题色
      ),
		
      // BackButtonIcon: Icon(Icons.arrow_back_ios, color: Colors.white), //自定义图标
      // 注册路由表
      routes:{
        "detail_page": (context)=> DetailPage(),
        // "pick_page": (context)=> MyImagePage(),
        "edit_page" : (contenxt) => EditPage(),
        "record_page" : (context)=> RecordPage(),
        "home_page" : (context)=> MyHomePage(),
        "sliver_page" : (context)=> SliverDemoMain(),
      } ,
      home: MyHomePage(title: '首页'),
	);
  }
}




//  class MyImagePage extends StatefulWidget {
//    @override
//    _MyImagePageState createState() => _MyImagePageState();
//  }

//  class _MyImagePageState extends State<MyImagePage> {
//    	File _image;
//  	//  Future <File> _image;

//  	Future _getImage(ImageSource source) async {
//  		var image = await ImagePicker.pickImage( source : source);
//  			setState(() {
//  				_image = image;
//  			});
//  	}

  //  @override
//    Widget build(BuildContext context) {
//      	return Scaffold(
//        		appBar: AppBar(
//          		title: Text('上传图片'),
//  				centerTitle: true,
//        		),
//        		body: Center(
//  				  child: Column(
//  					   mainAxisAlignment: MainAxisAlignment.center,
//  						children: <Widget>[
//  							Padding(
//  								padding: const EdgeInsets.only(top: 16.0),
//  								child: _image == null ? Text('未选择') : Image.file(_image,width: 100.0)
//  							),
//  							RaisedButton(
//  								color: Colors.blue,
//  								highlightColor: Colors.blue[700],
//  								colorBrightness: Brightness.dark,
//  								splashColor: Colors.grey,
//  								child: Text("相册"),
//  								shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//  								onPressed: () {
//  									//导航到新路由
//  										_getImage( ImageSource.gallery);
//  									},
//  								),
//  							RaisedButton(
//  								child: Text("相机"),
//  								textColor: Colors.blue,
//  								onPressed: () {
//  									//导航到新路由
//  									_getImage( ImageSource.camera);
//  								},
//  							),
//  						]
//  					)
//  				),
//        		floatingActionButton: Column(
//  		  		mainAxisAlignment: MainAxisAlignment.end,
//  				children: <Widget>[
//  					// 相册选取照片
//  					FloatingActionButton(
//  						onPressed: () {
//  							_getImage( ImageSource.gallery);
//  						},
//  						child: const Icon(Icons.photo_library),
//  					),
//  					// 相机照片
					
//  				]
//        		),
//      	);
//    	}
//  }