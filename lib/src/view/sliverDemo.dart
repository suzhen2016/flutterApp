import 'package:flutter/material.dart';

class SliverDemoMain extends StatelessWidget{
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            body: CustomScrollView(
                
                slivers: <Widget>[
                    SliverAppBar(
                        // title: Text("列表"),
                        leading: IconButton(
                            icon:Icon(Icons.arrow_back_ios),
                            onPressed:() => Navigator.pop(context, false),
                        ),
                        pinned: true,
                        floating: true,
                        expandedHeight: 178.0, // 高度
                        flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                                'suzhen'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 15.0,
                                    letterSpacing: 3.0,
                                    fontWeight: FontWeight.w300,
                                ),
                            ),
                            centerTitle: true,
                            background: Image.asset('assets/img/zhong3.png',
                                fit: BoxFit.cover,),
                        ),
                    ),
                    SliverSafeArea(
                        sliver: SliverPadding(
                            padding : EdgeInsets.all(8.0),
                            // 栅格系统
                            // sliver : SliverGridList(),
                            // list列表
                            sliver:SliverListDemo()
                        ),
                    )
                    
                ],
            ),
        );
      }
}

// listview 排布
class SliverListDemo extends StatelessWidget {
    // String url = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573924873348&di=4c8a6f90cfcec3c3b328fa5a7daeef14&imgtype=0&src=http%3A%2F%2Fdimg08.c-ctrip.com%2Fimages%2F100r070000002lpiuFF4F_R_1024_10000_Q90.jpg';
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext content, int index) {
                        return Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: Material(   // 类似div的盒子
                                    borderRadius: BorderRadius.circular(15.0),
                                    elevation: 14.0,                            // 影阴长度
                                    shadowColor: Colors.grey.withOpacity(0.3),  // 影阴颜色
                                    child: Stack(
                                        children: <Widget>[
                                            AspectRatio(
                                                aspectRatio: 16/9,
                                                // child : Image.asset(
                                                //                 "assets/img/zhong1.png",
                                                //                 fit: BoxFit.cover
                                                //         ),
                                                child: Card(
                                                    margin: EdgeInsets.all(0.0),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadiusDirectional.circular(15)),
                                                            clipBehavior: Clip.antiAlias,
                                                            child: Image.asset(
                                                                "assets/img/zhong1.png",
                                                                fit: BoxFit.cover
                                                        ),
                                                ),
                                            ),
                                           
                                            Positioned(
                                                left:32.0,
                                                bottom: 16.0,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                        Text('记者：苏镇',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                                        Text('时间：2012-12-02',style: TextStyle(fontSize: 16.0,color: Colors.white),)
                                                    ],
                                                    // child: 
                                                ),
                                            )
                                            
                                        ],
                                    )
                                )
                        );
                    },
                    childCount: 8
                )

            );
      }
}

// 栅格分布
class SliverGridList extends StatelessWidget {

    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return SliverPadding (  // 添加四周的边距
                padding: EdgeInsets.all(2.0),
                sliver : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,   // 数量
                        crossAxisSpacing: 8.0,  // 横向间距
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 1.0,
                        
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext content, int index) {
                            return Container(
                                child: Image.asset('assets/img/zhong3.png',
                                fit: BoxFit.cover,),
                            );
                        },
                        childCount: 10
                    )

                )
        );
      }
}