
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewPage extends StatefulWidget {
    final String title;
    final String url;

    WebViewPage({
        this.title,
        this.url
    });
    @override
    State<StatefulWidget> createState()=>new WebViewPageState(title, url);
}

class WebViewPageState extends State<WebViewPage>{
    
    String title;
    String url;

    WebViewPageState(this.title,this.url);
    

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                body:  WebviewScaffold(
                url: url, // 'http://117.48.201.174:9000', // 登录的URL
                    appBar: new AppBar(
                        title: Text(title),
                        iconTheme: new IconThemeData(color: Colors.white),
                    ),
                ),
            ),
        );
    }

}