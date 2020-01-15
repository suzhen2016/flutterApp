import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: Theme( // 覆盖颜色主题
                data: Theme.of(context).copyWith(
                    primaryColorLight : Colors.yellow
                ),
                // child: ThemDemo()
                child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            // TextFiledDemo(),
                            FromDemo(),
                        ],
                    ),
                ),
            ),
        );
    }
}

class FromDemo extends StatefulWidget {
    @override
    _FromDemoState createState() => new _FromDemoState();
}

class _FromDemoState extends State<FromDemo> {
    final logoinFormkey = GlobalKey<FormState>();
    String username = '';
    String password = '';

    bool autovalidate = false;

    String validatorUsername (value) {
        if (value.isEmpty) {
            return 'userName 不能为空';
        }
        return null;
    }
    
    // 提交登录信息，发起获取form表单值与验证字段
    void submitLogin () {
        if (logoinFormkey.currentState.validate()) { // 验证字段
            logoinFormkey.currentState.save();      // 获取数据
            debugPrint('登录成功:用户名：$username, 密码： $password');
            // 登录提示信息
            Scaffold.of(context).showSnackBar(
                SnackBar(
                    content: Center(child : Text('登录中...')),
                )
            );
        } else {    // 不过增加验证提示
            setState(() {
                autovalidate = true;  
            });
        }
        
    }

    String validatorPassword (value) {
        if (value.isEmpty) {
            return 'password 不能为空';
        }
        return null;
    }

    @override
    Widget build(BuildContext context) {
        return Form(    // form表单
            key : logoinFormkey, // 绑定form的key，适用保存save
            child: Column(
                children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: 'userName',
                            helperText: '',
                        ),
                        onSaved : (value) {
                            username = value;
                        },
                        validator: validatorUsername,
                        autovalidate: autovalidate,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'passWord',
                            helperText: '',
                        ),
                        onSaved: (value) {
                            password = value;
                        },
                        validator: validatorPassword,
                        autovalidate: autovalidate,
                    ),
                    SizedBox(
                        height: 15.0,
                    ),
                    Container(
                        width: double.infinity,
                        child: RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            color: Colors.blue,
                            elevation: 0.0,  // 去掉自带的边框
                            // highlightColor: 40.0,
                            child: Text('登录',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                            onPressed: () {
                                submitLogin();
                            },
                        ),
                    )
                ],
            ),
        );
    }
}

/*
 * 输入框案列  input
 * 输入，提交，样式
*/
// stful 代码片段
class TextFiledDemo extends StatefulWidget {
  @override
  _TextFiledDemoState createState() => new _TextFiledDemoState();
}

class _TextFiledDemoState extends State<TextFiledDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            icon: Icon(Icons.subject),
            // labelText: '姓名',               // label
            hintText: '请输入姓名',           // placeholed
            // helperText: '请输入姓名'       // 提示
            // border: InputBorder.none,    // 下划线
            border: OutlineInputBorder(),   // 边框
            filled: true,                   // 背景颜色
        ),
        onChanged: (value) {                // 检测输入值得变化
            debugPrint('检测变化$value');
        },
        onSubmitted: (value) {
            debugPrint('提交值$value');
        },
    );
  }
}

/*
 * 修改主题颜色
*/
class ThemDemo extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
      return Container(
          color: Theme.of(context).primaryColorLight,
      );
    }
}