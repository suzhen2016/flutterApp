
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsWebPage extends StatefulWidget {
    final String title;

    NewsWebPage({
        this.title,
    });
    @override
    State<StatefulWidget> createState()=>new NewsWebPageState(title);
}

class NewsWebPageState extends State<NewsWebPage>{
    
    String title;
    // 标记是否是加载中
    bool loading = true;
    // 标记当前页面是否是我们自定义的回调页面
    bool isLoadingCallbackPage = false;
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
    // URL变化监听器
    StreamSubscription<String> onUrlChanged;
    // WebView加载状态变化监听器
    StreamSubscription<WebViewStateChanged> onStateChanged;
    // 插件提供的对象，该对象用于WebView的各种操作
    FlutterWebviewPlugin flutterWebViewPlugin = new FlutterWebviewPlugin();

    NewsWebPageState(this.title);

    @override
    void initState() {
        onStateChanged = flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state){
            // state.type是一个枚举类型，取值有：WebViewState.shouldStart, WebViewState.startLoad, WebViewState.finishLoad
            switch (state.type) {
                case WebViewState.shouldStart:
                    // 准备加载
                    setState(() {
                        loading = true;
                    });
                    break;
                case WebViewState.startLoad:
                    // 开始加载
                    break;
                case WebViewState.finishLoad:
                    // 加载完成
                    setState(() {
                        loading = false;
                    });
                    if (isLoadingCallbackPage) {
                        // 当前是回调页面，则调用js方法获取数据
                        // parseResult();
                    }
                    break;
                case WebViewState.abortLoad :
                    break;
            }
        });
        onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
            debugPrint('监听加载过程');
            // this.parseResult();
        });
    }
    // 解析WebView中的数据
    void parseResult() {
        //    flutterWebViewPlugin.evalJavascript("get();").then((result) {
        //      // result json字符串，包含token信息
        //
        //    });
        // 滑动监听
        flutterWebViewPlugin.onScrollYChanged.listen((double offsetY) {
            // compare vertical scroll changes here with old value
            debugPrint('滑动监听上下$offsetY');
        });

        // 滑动监听 左右
        flutterWebViewPlugin.onScrollXChanged.listen((double offsetX) { 
            // compare horizontal scroll changes here with old value
            debugPrint('滑动监听左右$offsetX');
        });
        // flutterWebviewPlugin.launch(url, hidden: true);   // 隐藏显示
    }

    @override
    Widget build(BuildContext context) {
        List<Widget> titleContent = [];
        titleContent.add(new Text(
            title, style: new TextStyle(color: Colors.white),
        ));
        if (loading) {
            // 如果还在加载中，就在标题栏上显示一个圆形的loading
            titleContent.add(new CupertinoActivityIndicator());
        }
        titleContent.add(new Container(width: 50.0));
        // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
        return new WebviewScaffold(
            key: scaffoldKey,
            url: 'http://117.48.201.174:9000', // 登录的URL
            appBar: new AppBar(
                title: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: titleContent,
                ),
                iconTheme: new IconThemeData(color: Colors.white),
            ),
            withZoom: false,        // 允许网页缩放
            withLocalStorage: true, // 允许LocalStorage
            withJavascript: true,   // 允许执行js代码
            clearCache: false,
            scrollBar: true,       // 是否显示滚动条
        );
    }

    @override
    void dispose() {
        // 回收相关资源
        // Every listener should be canceled, the same should be done with this stream.
        onUrlChanged.cancel();
        onStateChanged.cancel();
        flutterWebViewPlugin.dispose();
        super.dispose();
    }
}