import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final String blogUrl;
  ArticlePage({required this.blogUrl});
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  
  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
        Text("WebTech LabProject"),
      ],), 
      elevation: 0.0,
       ),
      body:Container(
      child: WebView(initialUrl: widget.blogUrl,
      onWebViewCreated: ((WebViewController){
        _completer.complete(WebViewController);
      }),
    )));
  }
}

