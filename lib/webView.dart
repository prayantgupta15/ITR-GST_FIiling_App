import 'dart:async';

import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  String url, title;
  WebViewScreen({@required this.url, this.title});
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  WebViewState state;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    flutterWebviewPlugin.onStateChanged.listen((onData) {
//      print("type:" + onData.type.toString());
//      if (onData.type == WebViewState.shouldStart) {
//        flutterWebviewPlugin.stopLoading();
////        flutterWebviewPlugin.goBack();
//      }
//    });
    _onUrlChanged =
        flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      print("urlchanged" + url);

      if (url == widget.url) {
        print(" matching");
        flutterWebviewPlugin.show();
      } else {
        print(" not matching");
        flutterWebviewPlugin.stopLoading();
//        flutterWebviewPlugin.goBack();
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch ${url}';
        }
      }

//      if (mounted) {
//        if (url.contains('whatsapp') ||
//            url.contains('tel') ||
//            url.contains('mailto')) {
//          print("found");
//          if (await canLaunch(url)) {
//            await launch(url);
//          } else {
//            throw 'Could not launch ${url}';
//          }
//        }
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    _flutterWebviewPlugin.

    return WebviewScaffold(
      url: widget.url,
//            javascriptChannels: jsChannels,
//            mediaPlaybackRequiresUserGesture: false,

      withJavascript: true,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: true,
      hidden: true,
//      initialChild: Container(
//        child: const Center(
//          child: Text("Ruko zra"),
//        ),
//      ),
//      bottomNavigationBar: BottomAppBar(
//        child: Row(
//          children: <Widget>[
//            IconButton(
//              icon: const Icon(Icons.arrow_back_ios),
//              onPressed: () {
//                flutterWebViewPlugin.goBack();
//              },
//            ),
//            IconButton(
//              icon: const Icon(Icons.arrow_forward_ios),
//              onPressed: () {
//                flutterWebViewPlugin.goForward();
//              },
//            ),
//            IconButton(
//              icon: const Icon(Icons.autorenew),
//              onPressed: () {
//                flutterWebViewPlugin.reload();
//              },
//            ),
//          ],
//        ),
//      ),
    );
  }
}
