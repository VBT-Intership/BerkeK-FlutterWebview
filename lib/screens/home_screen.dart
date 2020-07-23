import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_example/models/Content.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  final Content content;

  HomeScreen({this.content});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WebViewController controller;

  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.content.contentType == "website"
          ? _createWebview()
          : _createWebviewStaticContent(),
    );
  }

  Widget _createWebview() {
    return SafeArea(
      child: IndexedStack(
        index: _stackToView,
        children: [
          WebView(
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.content.contentUrl,
            onPageFinished: _handleLoad,
          ),
          _progressBar()
        ],
      ),
    );
  }

  Widget _createWebviewStaticContent() {
    return SafeArea(
      child: WebView(
        onWebViewCreated: (controller) {
          this.controller = controller;
          controller.loadUrl(Uri.dataFromString(widget.content.contentUrl,
                  mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
              .toString());
        },
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "",
      ),
    );
  }

  _progressBar() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
