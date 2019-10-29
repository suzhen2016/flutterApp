import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
	final String text;
	MyPage(this.text);

	@override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage>{
	String _userName = '';
	String _inputText = '';
	Map<String, String> param = {};
	TextEditingController _unameController = TextEditingController();
	
	@override
	Widget build(BuildContext context) {
		this._unameController.addListener(() {
			// print('input ${_unameController.text}');
			// setState(() {
			// 	// this._userName = _unameController.text;
			// });
		});
		this._unameController.selection = TextSelection.fromPosition(
				TextPosition(
					affinity: TextAffinity.downstream,
					offset: this._userName.length));
		@override
		void initState() {
			super.initState();
			this._unameController.text = '苏';
			// this.inputText = '';
		}
		// initState();

		return Scrollbar( // 显示进度条
			child: SingleChildScrollView(
				padding: EdgeInsets.all(16.0),
				child: Center(
					child: Column(
						children: <Widget>[
							TextField(
								textAlign: TextAlign.start,
								// autofocus: true,
								controller: this._unameController,
								keyboardType: TextInputType.text,
								decoration: InputDecoration(
									labelText: "用户名",
									hintText: "用户名或邮箱",
									prefixIcon: Icon(Icons.person),
									helperText: '嘻嘻',
								),
								// textDirection: TextDirection.rtl,
								// maxLength : 30,
								onChanged: (value) {
									this.setState(() {
										this._unameController.text = value;
										this._userName = value;
									});
								},
							),
							TextField(
								keyboardType: TextInputType.text,
								controller: TextEditingController.fromValue(TextEditingValue(
									// 设置内容
									text: this._inputText,
									// 保持光标在最后
									selection: TextSelection.fromPosition(TextPosition(
										affinity: TextAffinity.downstream,
										offset: this._inputText.length)))
									),
								decoration: InputDecoration(
									labelText: "密码",
									hintText: "您的登录密码",
									prefixIcon: Icon(Icons.lock)
								),
								onChanged: (value){
									this.setState((){
										this._inputText = value;
									});
								},
								obscureText: true,
							),
							Text('安徽大声道按个大声道'),
							Text(this._userName),
							// Text('${this._unameController.text}'),
							TextField(
								textAlign: TextAlign.start,
								// autofocus: true,
								controller: this._unameController,
								keyboardType: TextInputType.multiline,
								maxLines: null,
								decoration: InputDecoration(
									
									// labelText: "用户名",
									// hintText: "用户名或邮箱",
									// prefixIcon: Icon(Icons.person),
									// helperText: '嘻嘻嘻',
								),
								// textDirection: TextDirection.rtl,
								// maxLength : 30,
								onChanged: (value) {
									this.setState(() {
										this._unameController.text = value;
										this._userName = value;
									});
								},
							),
							RaisedButton(
								child: Text("赋值"),
								onPressed: () {
									this.setState(() {
										this._unameController.text = "苏氏之道";
										this._userName = _unameController.text;
										// print('赋值完成 ${_unameController.text}');
									});
								},
							),
							RaisedButton(
								child: Text("登录"),
								onPressed: () {
									this.param['userName'] = this._userName;
									this.param['passWord'] = this._inputText;
									print('登录请求条件 ${this.param}');
								},
							),
						],
					)
				),
			),
		);
	}
}