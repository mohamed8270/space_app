import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WikipediaPage extends StatefulWidget {
  final String NewsUrl;
  const WikipediaPage({super.key, required this.NewsUrl});

  @override
  State<WikipediaPage> createState() => _WikipediaPageState();
}

class _WikipediaPageState extends State<WikipediaPage> {
  final Completer<WebViewPlusController> controller =
      Completer<WebViewPlusController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPlus(
        initialUrl: widget.NewsUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewPlusController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}
