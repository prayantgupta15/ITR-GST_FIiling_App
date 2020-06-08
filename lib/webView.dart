import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  String url, title;
  WebViewScreen({@required this.url, this.title});
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
//            javascriptChannels: jsChannels,
//            mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: false,
//            hidden: true,
      initialChild: Container(
//              color: Colors.redAccent,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
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
