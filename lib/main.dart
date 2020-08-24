import 'package:askcommercials/LoadingScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: prefer_collection_literals

//final Set<JavascriptChannel> jsChannels = [
//  JavascriptChannel(
//      name: 'Print',
//      onMessageReceived: (JavascriptMessage message) {
//        print(message.message);
//      }),
//].toSet();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AskCommercials',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange,
          accentColor: Colors.orange),
      home: LoadingScreen(),
    );
  }
}
