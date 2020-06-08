import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:askcommercials/payment_screen.dart';
import 'package:askcommercials/webView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CollapsingList(),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  TextStyle tsH = TextStyle(
      fontSize: 20,
      fontFamily: UtilsImporter().stringUtils.HKGrotesk,
      fontWeight: FontWeight.bold);
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 50.0,
        child: Container(
            color: Colors.orange,
            child: Center(
                child: Text(
              headerText,
              style: tsH,
            ))),
      ),
    );
  }

  TextStyle ts = TextStyle(
      fontFamily: UtilsImporter().stringUtils.HKGrotesk,
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          makeHeader('Quick Fills'),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Card(
                              elevation: 8,
                              child: Image(image: AssetImage('assets/2.PNG'))),
                          ListTile(
                            title: Text(
                              "ITR Filling",
                              style: ts,
                            ),
                            subtitle: Text("Income Tax Return Filing"),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => WebViewScreen(
                                      url: StringUtils.ITR_URL,
                                      title: "ITR Filling",
                                    )));
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Card(
                              elevation: 8,
                              child: Image(image: AssetImage('assets/1.PNG'))),
                          ListTile(
                            title: Text(
                              "GST Filling",
                              style: ts,
                            ),
                            subtitle: Text("Good & Service Tax Filing"),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => WebViewScreen(
                                      url: StringUtils.GST_URL,
                                      title: "GST Return",
                                    )));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Card(
                              elevation: 8,
                              child: Image(image: AssetImage('assets/3.png'))),
                          ListTile(
                            title: Text(
                              "Forms",
                              style: ts,
                            ),
                            subtitle: Text("LIC, DSC, MSME.etc"),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => WebViewScreen(
                                      url: StringUtils.FORMS_URL,
                                      title: "Forms",
                                    )));
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Column(
                        children: <Widget>[
                          Card(
                              elevation: 8,
                              child: Image(image: AssetImage('assets/4.png'))),
                          ListTile(
                            title: Text(
                              "Payment",
                              style: ts,
                            ),
                            subtitle: Text("Paytm/UPI/G-PAY"),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => PaymentScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ),
          makeHeader('Services'),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: Icon(
                  Icons.room_service,
                  color: Colors.orange,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
                title: Text(StringUtils.ServicesName[index], style: ts),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => WebViewScreen(
                                url: StringUtils.Services_URLS[index],
                                title: StringUtils.ServicesName[index],
                              )));
                },
              );
            }, childCount: StringUtils.Services_URLS.length),
          ),
          makeHeader('Contact Us'),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: Text(
                  "Contact No.",
                  style: ts,
                ),
                subtitle: Text(StringUtils.PHONENO),
                leading: Icon(
                  Icons.phone_iphone,
                  color: Colors.green,
                ),
                onTap: () async {
                  var url = 'tel:${StringUtils.PHONENO}';
                  if (await canLaunch(url))
                    await launch(url);
                  else
                    throw 'cant';
                },
              ),
              ListTile(
                title: Text(
                  "Landline No.",
                  style: ts,
                ),
                subtitle: Text(StringUtils.LANDLINE_NO),
                leading: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                onTap: () async {
                  var url = 'tel:${StringUtils.PHONENO}';
                  if (await canLaunch(url))
                    await launch(url);
                  else
                    throw 'cant';
                },
              ),
              ListTile(
                title: Text(
                  "Email.",
                  style: ts,
                ),
                subtitle: Text(StringUtils.EMAIL),
                leading: Icon(
                  Icons.email,
                  color: Colors.red,
                ),
                onTap: () async {
                  var url = 'mailto:${StringUtils.EMAIL}';

                  if (await canLaunch(url))
                    await launch(url);
                  else
                    throw 'cant';
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
