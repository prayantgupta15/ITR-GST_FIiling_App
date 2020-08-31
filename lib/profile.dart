import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:askcommercials/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: SafeArea(
              child: Scaffold(
                  body: CollapsingList(),
              ),
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

    void launchWhatsApp() async {
        String whatsappUrl =
            "whatsapp://send/?phone=${StringUtils.PHONENO}&text=${StringUtils.MESSAGE}";
        if (await canLaunch(whatsappUrl)) {
            await launch(whatsappUrl);
        } else {
            throw 'Could not launch ${whatsappUrl}';
        }
    }

    void launchMyURL(String url)async{
        if (await canLaunch(url)) {
            await launch(url,
                forceWebView: true,
                enableJavaScript: true,
                forceSafariVC: true,
headers: null
            );
        } else {
            throw 'Could not launch';
        }
    }

    TextStyle ts = TextStyle(
        fontFamily: UtilsImporter().stringUtils.HKGrotesk,
        fontWeight: FontWeight.bold);
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                floatingActionButton: SpeedDial(

                    animatedIcon: AnimatedIcons.view_list,
                    backgroundColor: Colors.orange,
                    animatedIconTheme: IconThemeData(size: 28.0),
//          onOpen: () => print('OPENING DIAL'),
//          onClose: () => print('DIAL CLOSED'),
                    visible: true,
                    children: [
                        SpeedDialChild(
                            label: 'Facebook',
                            labelStyle: ts,
                            labelBackgroundColor: Colors.blue,
                            backgroundColor: Colors.blue,
                            child: IconButton(
                                icon: Icon(MdiIcons.facebook),
                                onPressed: () {
                                    launchMyURL(StringUtils.FB_URL);
                                },
                            ),
                        ),

                        SpeedDialChild(
                            label: 'Whatsapp',
                            labelStyle: ts,
                            labelBackgroundColor: Colors.green,
                            backgroundColor: Colors.green,
                            child: IconButton(
                                icon: Icon(
                                    MdiIcons.whatsapp,
                                ),
                                onPressed: () => launchWhatsApp(),
                            ),
                        ),
                        SpeedDialChild(
                            label: 'Linkedin',
                            labelStyle: ts,
                            labelBackgroundColor: Colors.blueAccent,
                            backgroundColor: Colors.blueAccent,
                            child: IconButton(
                                icon: Icon(MdiIcons.linkedinBox),
                                onPressed: () {
                                    launchMyURL(StringUtils.LINKEDIN_URL);
                                },
                            ),
                        ),
                        SpeedDialChild(
                            label: 'Justdial',
                            labelBackgroundColor: Colors.orangeAccent,
                            labelStyle: ts,
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                                icon: Icon(MdiIcons.informationVariant),
                                onPressed: () => launchMyURL(StringUtils.JD_URL)
                            ),
                        ),
                        SpeedDialChild(
                            label: 'Locate',
                            labelBackgroundColor: Colors.redAccent,
                            labelStyle: ts,
                            backgroundColor: Colors.redAccent,
                            child: IconButton(
                                icon: Icon(Icons.location_searching),
                                onPressed: () => launchMyURL(StringUtils.MAP_URL),
                            ),
                        ),
                    ],
                ),
                body: CustomScrollView(
                    slivers: <Widget>[
                        makeHeader('Quick Fills'),
                        SliverList(
                            delegate: SliverChildListDelegate([
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                        Expanded(
                                            child: FlatButton(
                                                child: Column(
                                                    children: <Widget>[
                                                        Material(
                                                            elevation: 8,
                                                            borderRadius: BorderRadius.circular(20),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                    color: Colors.deepOrange,
                                                                    image: DecorationImage(
                                                                        image: AssetImage('assets/2.PNG'),
                                                                        fit: BoxFit.cover,
                                                                    )),
                                                                height: MediaQuery.of(context).size.width * 0.3,
                                                                width: MediaQuery.of(context).size.width * 0.3,
                                                            ),
                                                        ),
                                                        ListTile(
                                                            title: Text(
                                                                "ITR Filing",
                                                                style: ts,
                                                            ),
                                                            subtitle: Text("Income Tax Return Filing"),
                                                        ),
                                                    ],
                                                ),
                                                splashColor: Colors.orange,
                                                onPressed: () {
                                                    //TODO:OPEN DIALOFG
                                                    showDialog(
                                                        barrierDismissible: true,
                                                        context: context,
                                                        builder: (context){
                                                            return CupertinoAlertDialog(
                                                            title: Text("Are you our existing client?"),
                                                                content: Text("If your are our existing client then no need to enter"
                                                                    " all details."),
                                                                actions: <Widget>[
                                                                    FlatButton(
                                                                        child: Text("No"),
                                                                        onPressed: (){
                                                                            Navigator.of(context).pop();
                                                                            launchMyURL(StringUtils.ITR_URL_NON_EXIST);
                                                                        },
                                                                    ),
                                                                    FlatButton(
                                                                        child: Text("Yes"),
                                                                        onPressed: (){
                                                                            Navigator.pop(context);
                                                                            launchMyURL(StringUtils.ITR_URL_EXIST);
                                                                        },
                                                                    )
                                                                ],

                                                            );
                                                        }
                                                    );
                                                },
                                            ),
                                        ),
                                        Expanded(
                                            child: FlatButton(
                                                child: Column(
                                                    children: <Widget>[
                                                        Material(
                                                            elevation: 8,
                                                            borderRadius: BorderRadius.circular(20),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                    color: Colors.deepOrange,
                                                                    image: DecorationImage(
                                                                        image: AssetImage('assets/1.PNG'),
                                                                        fit: BoxFit.cover,
                                                                    )),
                                                                height: MediaQuery.of(context).size.width * 0.3,
                                                                width: MediaQuery.of(context).size.width * 0.3,
                                                            ),
                                                        ),
                                                        ListTile(
                                                            title: Text(
                                                                "GST Filing",
                                                                style: ts,
                                                            ),
                                                            subtitle: Text("Good & Service Tax Filing"),
                                                        ),
                                                    ],
                                                ),
                                                onPressed: () {
                                                    launchMyURL(StringUtils.GST_URL);
                                                },
                                            ),
                                        ),
                                    ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                        Expanded(
                                            child: FlatButton(
                                                child: Column(
                                                    children: <Widget>[
                                                        Material(
                                                            elevation: 8,
                                                            borderRadius: BorderRadius.circular(20),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                    color: Colors.deepOrange,
                                                                    image: DecorationImage(
                                                                        image: AssetImage('assets/3.png'),
                                                                        fit: BoxFit.cover,
                                                                    )),
                                                                height: MediaQuery.of(context).size.width * 0.3,
                                                                width: MediaQuery.of(context).size.width * 0.3,
                                                            ),
                                                        ),
                                                        ListTile(
                                                            title: Text(
                                                                "Forms",
                                                                style: ts,
                                                            ),
                                                            subtitle: Text("LIC,DSC,MSME,Company Reg. etc"),
                                                        ),
                                                    ],
                                                ),
                                                onPressed: () {
                                                    launchMyURL(StringUtils.FORMS_URL);
                                                },
                                            ),
                                        ),
                                        Expanded(
                                            child: FlatButton(
                                                child: Column(
                                                    children: <Widget>[
                                                        Material(
                                                            elevation: 8,
                                                            borderRadius: BorderRadius.circular(20),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(20),
                                                                    color: Colors.deepOrange,
                                                                    image: DecorationImage(
                                                                        image: AssetImage('assets/4.png'),
                                                                        fit: BoxFit.cover,
                                                                    )),
                                                                height: MediaQuery.of(context).size.width * 0.3,
                                                                width: MediaQuery.of(context).size.width * 0.3,
                                                            ),
                                                        ),
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
                                        launchMyURL(StringUtils.Services_URLS[index]);
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
                                        var url = 'tel:${StringUtils.LANDLINE_NO}';
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
                                ListTile(
                                    title: Text(
                                        "Office Location",
                                        style: ts,
                                    ),
                                    leading: Icon(Icons.map, color: Colors.orange),
                                    onTap: () => launchMyURL(StringUtils.MAP_URL)
                                    //openMapsSheet(context),
                                ),
                            ]),
                        )
                    ],
                ),
            ),
        );
    }
}