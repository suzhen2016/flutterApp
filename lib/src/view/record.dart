import 'package:flutter/material.dart';
import './../components/text.dart';
import './../components/layout.dart';
import './../components/sizeBox.dart';

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
        return Scaffold(
            backgroundColor: Color.fromRGBO(224, 234, 23, 0.5),
            
			body : Scrollbar(
				// child: SingleChildScrollView(
					child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
                            // 显示文本信息的字段
                            SzText(),
							// 图标icon
                            LayoutIcon(),
                            // SizeBox
                            DivBox()
						]
					)
				// )
			)
		);
	}
}