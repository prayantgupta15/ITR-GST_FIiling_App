import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:askcommercials/main.dart';
import 'package:askcommercials/profile.dart';
import 'package:askcommercials/webView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();
//
//  // On destroy stream
//  StreamSubscription _onDestroy;
//
//  // On urlChanged stream
//  StreamSubscription<String> _onUrlChanged;
//
//  // On urlChanged stream
//  StreamSubscription<WebViewStateChanged> _onStateChanged;
//
//  StreamSubscription<WebViewHttpError> _onHttpError;
//
//  StreamSubscription<double> _onProgressChanged;
//
//  StreamSubscription<double> _onScrollYChanged;
//
//  StreamSubscription<double> _onScrollXChanged;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    // Add a listener to on destroy WebView, so you can make came actions.
//    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
//      if (mounted) {
//        // Actions like show a info toast.
//        _scaffoldKey.currentState.showSnackBar(
//            const SnackBar(content: const Text('Webview Destroyed')));
//      }
//    });
//
//    // Add a listener to on url changed
//    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
//      if (mounted) {
//        setState(() {
//          _history.add('onUrlChanged: $url');
//        });
//      }
//    });
//
//    _onProgressChanged =
//        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
//      if (mounted) {
//        setState(() {
//          _history.add('onProgressChanged: $progress');
//        });
//      }
//    });
//
//    _onScrollYChanged =
//        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
//      if (mounted) {
//        setState(() {
//          _history.add('Scroll in Y Direction: $y');
//        });
//      }
//    });
//
//    _onScrollXChanged =
//        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
//      if (mounted) {
//        setState(() {
//          _history.add('Scroll in X Direction: $x');
//        });
//      }
//    });
//
//    _onStateChanged =
//        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
//      if (mounted) {
//        setState(() {
//          _history.add('onStateChanged: ${state.type} ${state.url}');
//        });
//      }
//    });
//
//    _onHttpError =
//        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
//      if (mounted) {
//        setState(() {
//          _history.add('onHttpError: ${error.code} ${error.url}');
//        });
//      }
//    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
//    _onDestroy.cancel();
//    _onUrlChanged.cancel();
//    _onStateChanged.cancel();
//    _onHttpError.cancel();
//    _onProgressChanged.cancel();
//    _onScrollXChanged.cancel();
//    _onScrollYChanged.cancel();

    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle formTitleTextStyle = TextStyle(
      fontFamily: UtilsImporter().stringUtils.HKGrotesk,
      fontWeight: FontWeight.w500,
      fontSize: 25.0,
      color: Colors.black,
//        color: Theme.of(context).primaryColorDark
    );

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => ListTile(
                        title: Text("Index: $index"),
                      ),
                  childCount: 55),
            )
          ],
        ),
        drawer: Drawer(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[BoxShadow(color: Colors.red)],
                    image:
                        DecorationImage(image: AssetImage('assets/icon.jpeg'))),
              ),
              ListTile(
                title: Text("Fill ITR"),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              WebViewScreen(url: StringUtils.ITR_URL)));
                },
              ),
              ListTile(
                title: Text("Fill GST"),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              WebViewScreen(url: StringUtils.GST_URL)));
                },
              ),
              ListTile(
                title: Text("Contact Us"),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              WebViewScreen(url: StringUtils.CONTACT_URL)));
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              shape: CircleBorder(),
              child: Container(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Hero(
                  tag: 'profile',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/icon.jpeg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.message),
              color: Colors.white,
              onPressed: () {
                print("jkk");
              },
            )),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
