import 'package:flutter/material.dart';

class MyPage extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        return Scrollbar(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        PageViewDemo(),
                        SizedBox(
                            height: 20.0,
                        ),
                        PageViewBuildDemo(),

                        SizedBox(
                            height: 20.0,
                        ),
                        
                        GridViewDemo(),

                    ],
                ),
            )
        );
        
      }
}

// 三个系统
class GridViewDemo extends StatelessWidget {
    // List<Widget> _buildItems (int len) {
    //     return List.generate(len, (int index) => {
    //         Container(
    //             alignment: Alignment(0.0, 0.0),
    //             color: Colors.grey[300],
    //             child: Text('苏镇$index'),
    //         )
    //     });
    // }
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Container(
            height: 200.0,
            child: GridView.count(
                crossAxisCount: 4, // 横排放的数量
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: <Widget>[
                     Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    ),
                    Container(
                        alignment: Alignment(0.0, 0.0),
                        color: Colors.grey[300],
                        child: Text('苏镇1'),
                    )
                ],
            ),
        );
      }
}


class PageViewBuildDemo extends StatelessWidget{

    Widget _pageItemBuilder (BuildContext content, int index) {
        return Stack(
            children: <Widget>[
                // Text('开始了')
                SizedBox.expand(        // 自动铺满宽度
                    child: Image.asset('assets/img/nbabg.png',
                    fit: BoxFit.cover,)

                ),
                Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text('苏镇', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,color: Colors.white),),
                            Text('时间：2019-10-20', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.white),)
                        ],
                    ),
                )
            ],
        );
    }
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Container(
            height: 150.0,
            child: PageView.builder(
                itemCount: 5,
                itemBuilder: _pageItemBuilder,
            ),
        );
      }
}

class PageViewDemo extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        return Container(
            height: 150.0,
            child: PageView(
                pageSnapping: false,                 // 翻页不平滑，看手势滚到哪就是哪；
                // reverse: true,                       // 内容倒叙排列
                // scrollDirection: Axis.vertical,         // 垂直翻页
                onPageChanged: (content) => debugPrint('$content'),  // 传入一个回调函数
                controller: PageController(
                    initialPage: 0,
                    keepPage: true,                     // 记录用户的滚动页面位置
                    viewportFraction: 1.0,             // 占满屏幕的比列
                ),
                children: <Widget>[
                    Container(
                        color: Colors.brown[900],
                        alignment: Alignment(0.0, 0.0),
                        child: Text('苏镇1',style: TextStyle(color: Colors.white70,fontSize: 30.0),),
                    ),
                    Container(
                        color: Colors.pink[900],
                        alignment: Alignment(0.0, 0.0),
                        child: Text('苏镇2',style: TextStyle(color: Colors.white70,fontSize: 30.0),),
                    ),
                    Container(
                        color: Colors.red[900],
                        alignment: Alignment(0.0, 0.0),
                        child: Text('苏镇3',style: TextStyle(color: Colors.white70,fontSize: 30.0),),
                    ),
                    Container(
                        color: Colors.yellow[900],
                        alignment: Alignment(0.0, 0.0),
                        child: Text('苏镇4',style: TextStyle(color: Colors.white70,fontSize: 30.0),),
                    )
                    
                ],
            )
        );
      }
}

