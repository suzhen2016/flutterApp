import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;


class SliverViewPage extends StatefulWidget {
	 @override
  _SliverViewPageState createState() => new _SliverViewPageState();
}
class _SliverViewPageState extends State<SliverViewPage>{
	Map<String, String> param = {};
	List _tabs = <String>[
      "Tab 1",
      "Tab 2",
      "Tab 3",
    ];
	@override
	Widget build(BuildContext context) {
        return Material(
            child: CustomScrollView(
                slivers: <Widget>[
                    // AppBar，包含一个导航栏
                    SliverAppBar(
                        pinned: true,
                        expandedHeight: 200.0,
                        centerTitle: true,
                        title: const Text('我的', style: TextStyle(fontSize: 20.0), ),
                        backgroundColor: Colors.blue,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover,),
                            // titlePadding : 
                            // sharp:Colors.red
                        ),
                        // bottom : PreferredSize(
                        //     child: Text('苏镇'),
                        //     preferredSize: Size(30, 30)
                        // )

                        bottom : new BottomBar(
                            fixedHeight: 100.0,
                        ),
                       
                        
                    ),
                    SliverPersistentHeader(
                        delegate: _SliverAppBarDelegate(
                            minHeight:55,
                            maxHeight:200,
                        ),
                        pinned: true,
                        floating: false,
                    ),
                    
                    SliverToBoxAdapter(
                        child: Text('header'),
                    ),
                  
                   
                    SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: new SliverGrid( //Grid
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, //Grid按两列显示
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 4.0,
                            ),
                            delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                                    //创建子widget      
                                    return new Container(
                                        alignment: Alignment.center,
                                        color: Colors.cyan[100 * (index % 9)],
                                        child: new Text('grid item $index'),
                                    );
                                },
                                childCount: 20,
                            ),
                        ),
                    ),
                ],
            ),
        );
	}
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    //根据shrinkOffset可变值 和maxHeight最大值  计算出50到100之间的曲线
    double imgSize = ((maxHeight-shrinkOffset)/maxHeight*0.5+0.5)*100;
    //计算出 0.5 到 1 之间的曲线
    double imgX = (shrinkOffset / maxHeight * -0.5 -0.5) * 0.98;
    double imgY = (1 - shrinkOffset / maxHeight) * -0.6;

    //标题size曲线
    double textSize = imgSize / 3;
    //根据shrinkOffset可变值 和maxHeight最大值  计算出0.5到0.7之间的曲线
    double textX = (shrinkOffset / maxHeight * -0.2 -0.5);
    double textY = (1 - shrinkOffset / maxHeight) * 0.8;

    Widget child = Container(
      alignment: Alignment.center,
      child: Stack(
        
        children: <Widget>[
          Align(
            alignment: Alignment(imgX,imgY),
            // child: Container(width: imgSize,height: imgSize,color: Colors.red,),
            child:ClipOval(
              child: Image.asset('assets/images/banner2.jpg', fit: BoxFit.cover,height: imgSize,width: imgSize,),
            ),
          ),

          Align(
            alignment: Alignment(textX,textY),
            child: Text('苏镇',style: TextStyle(fontSize: textSize),),
          ),

        //   Positioned(
        //       right: 50,
        //       top: 0,
        //       child: IconButton(
        //         icon: Icon(Icons.add_a_photo,color: Colors.white,),
        //         onPressed: (){print('object');},
        //       )
        //   ),
        
        ],
      ),
      color: Color(0xffFF8000),
    );
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    print('object 2 ');
    return null;
    // return maxHeight != oldDelegate.maxHeight ||
    //     minHeight != oldDelegate.minHeight ||
    //     child != oldDelegate.child;
  }
}



class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  final double fixedHeight;

  BottomBar({this.fixedHeight});

  @override
  Size get preferredSize {
    return new Size.fromHeight(this.fixedHeight);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: this.fixedHeight,
        child: new Material(
            // color: Theme.of(context).primaryColor,
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new Expanded(
                      child: new Container(),
                    ),
                    new IconButton(
                      icon: new Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        print("share pressed");
                      },
                    )
                  ],
                ),
                // new Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     new Padding(
                //         padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                //         child: new Container(
                //           child: new Container(
                //             alignment: Alignment.centerLeft,
                //             child: new Text('苏镇',
                //               style: Theme.of(context).primaryTextTheme.title,
                //             ),
                //           ),
                //         )),
                //     new Container(
                //       padding: new EdgeInsets.only(
                //           left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                //       alignment: Alignment.centerLeft,
                //       child: new Text(
                //        '苏镇2',
                //         style: Theme.of(context).primaryTextTheme.subhead,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            )
        )
    );
  }
}