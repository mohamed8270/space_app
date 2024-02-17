import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebsiteInner extends StatefulWidget {
  final String WebUrl;
  const WebsiteInner({super.key, required this.WebUrl});

  @override
  State<WebsiteInner> createState() => _WebsiteInnerState();
}

class _WebsiteInnerState extends State<WebsiteInner> {
  final Completer<WebViewPlusController> controller =
      Completer<WebViewPlusController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPlus(
        initialUrl: widget.WebUrl,
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
