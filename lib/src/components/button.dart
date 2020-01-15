import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => new _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
    double num = 0.0;
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectDateTime = TimeOfDay(hour: 9, minute: 30);

    // 日期选择
    _selectDate () async {
        // 返回值是一个时间格式的数据
        final DateTime date = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2019),
            lastDate: DateTime(2030)
        );
        if (date == null) return;

        setState(() {
            selectedDate = date;     
        });
    }

    // 选择日期时间钟表
    Future<void> _selectDateTime () async {
        // 返回值是一个时间格式的数据
        final TimeOfDay time = await showTimePicker(
            context: context,
            initialTime: selectDateTime,
        );
        if (time == null) return;

        setState(() {
            selectDateTime = time;     
        });
    }

    // 底部弹窗按钮
    _openSheet() {
        print('sheet');
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
                return Container(
                    height: 220.0,
                    child: Column(
                        children: <Widget>[
                            SizedBox(height: 20.0,),
                            SizedBox(
                                height: 50.0,
                                child: Text('数学', style: TextStyle(fontSize: 20.0)),
                            ),
                            SizedBox(
                                height: 50.0,
                                child: Text('语文', style: TextStyle(fontSize: 20.0)),
                            ),
                            SizedBox(
                                height: 50.0,
                                child: Text('英语', style: TextStyle(fontSize: 20.0)),
                            ),
                            SizedBox(
                                height: 50.0,
                                child: Text('取消', style: TextStyle(fontSize: 15.0)),
                            ),
                            
                            // Text('语文', style: TextStyle(fontSize: 20.0)),
                            // Text('英语', style: TextStyle(fontSize: 20.0)),
                            // Text('取消', style: TextStyle(fontSize: 15.0)),
                        ],
                    ),
                );
            }
        );
    }
  @override
  Widget build(BuildContext context) {
        return new Scaffold(
            appBar: AppBar(title: Text('按钮组件'),),
            body : Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                            SizedBox(height: 50.0,),
                            Slider(
                                value: num,
                                activeColor: Colors.red,
                                inactiveColor: Colors.blue,
                                label: '${num.toInt()}',
                                min: 0.0,
                                max: 100.0,
                                divisions: 10, // 分数
                                onChanged: (val) {
                                    setState(() {
                                        num = val;                           
                                    });
                                },
                            ),
                            Text('活块的数据：$num'),
                            InkWell(
                                onTap: this._selectDate,
                                child: Column(
                                    children: <Widget>[
                                        Text('时间'),
                                        Text(DateFormat.yMd().format(selectedDate)),
                                        Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Row(
                                                children: <Widget>[
                                                    Text(DateFormat.yMMMd().format(selectedDate)),
                                                    Icon(Icons.arrow_drop_down)
                                                ],
                                            ),
                                        )
                                        
                                    ],
                                ),
                            ),
                            InkWell(
                                onTap: this._selectDateTime,
                                child: Row (
                                    children: <Widget>[
                                        Text('日期时间：'),
                                        Text(selectDateTime.format(context))
                                        
                                    ],
                                ),
                            ),
                            FlatButton(
                                child: Text('BottomSheet'),
                                onPressed: this._openSheet
                            )
                        ],
                    ),
                ),
            )
        
        );
  }
}