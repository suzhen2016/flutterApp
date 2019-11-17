import 'package:flutter/material.dart';

class SzText extends StatelessWidget{

    final TextStyle _textStyle = TextStyle(
        fontSize: 16.0,
        color: Color.fromRGBO(255, 113, 22, 0.7)
    );

    final String _user = '苏氏之道';
    final String _date = '2019-11-05';
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Text(
            "$_user 诗和远方. 时间： $_date",
            textAlign: TextAlign.center,
            style: _textStyle,
            
        );
      }
}