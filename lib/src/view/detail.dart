
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// 详情页
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
		centerTitle: true,
		leading: IconButton(
			icon:Icon(Icons.arrow_back_ios),
				onPressed:() => Navigator.pop(context, false),
			),

      ),
      body: Center(
        child: Column(
			children: <Widget>[
				Text('Hello word , 你好世界'),
				RandomWordsWidget()
			]
		),
      ),
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