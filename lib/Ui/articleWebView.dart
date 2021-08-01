import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/Ui/ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String articleUrl;
  ArticleWebView({@required this.articleUrl});
  @override
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: kAppBar,
        body: Container(
            child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
          initialUrl: widget.articleUrl,
        )));
  }
}
