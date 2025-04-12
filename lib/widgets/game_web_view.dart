import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

int userScore = 0;

class GameWebView extends StatefulWidget {
  final String url;
  final String title;
  const GameWebView({super.key, required this.url, required this.title});

  @override
  State<GameWebView> createState() => _GameWebViewState();
}

class _GameWebViewState extends State<GameWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..addJavaScriptChannel(
            'GameChannel',
            onMessageReceived: (JavaScriptMessage message) {
              try {
                final Map<String, dynamic> result = jsonDecode(message.message);
                final int score = result['score']; 

                setState(() {
                  userScore = score;
                });

              } catch (e) {
                print("Error : $e");
              }
            },
          )
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) {
                controller.runJavaScript('''
          window.GameResult = {
            postMessage: function(msg) {
              GameChannel.postMessage(msg);
            }
          };
        ''');
        },
            ),         
          )
          ..loadRequest(Uri.parse(widget.url));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: WebViewWidget(controller: controller));
  }
}