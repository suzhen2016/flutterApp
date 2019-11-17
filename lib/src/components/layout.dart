
import 'package:flutter/material.dart';

class LayoutIcon extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
        return Container(
            // child: Icon(Icons.pool, size: 32, color: Colors.red,),
            
            // child: Row(
            //     children: <Widget>[
            //         IconBage(Icons.poll, size: 30.0),
            //         IconBage(Icons.portable_wifi_off, size: 30.0),
            //         IconBage(Icons.power, size: 30.0),
            //     ],
            // ),
            
            child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴
                children: <Widget>[
                    IconBage(Icons.poll, size: 30.0),
                    IconBage(Icons.portable_wifi_off, size: 50.0),
                    IconBage(Icons.power, size: 30.0),
                ],
            ),
        );
      }
}

class IconBage extends StatelessWidget{

    final IconData icon;
    final double size;

    IconBage(this.icon,
        {this.size = 30.0}
    );
    @override
      Widget build(BuildContext context) {
        return Container(
            child: Icon(icon, size : size, color: Colors.white,),
            width: 50.0 + size,
            height: 50.0 + size,
            color: Color.fromRGBO(3, 54, 225, 1.0),
        );
      }
}