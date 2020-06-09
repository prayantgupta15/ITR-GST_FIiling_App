import 'dart:io';
import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:askcommercials/Utils/utils_importer.dart';
import 'package:askcommercials/profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String version = ' ';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  //VERSION CHECK
  versionCheck(BuildContext context) async {
    print("VERSION CHeck()");
//    final databaseReference = Firestore.instance;

//    try {
//      databaseReference
//          .collection('APP_NEW_VERSION')
//          .getDocuments()
//          .then((QuerySnapshot snapshot) {
//        snapshot.documents.forEach((f) {
//          double currentVersion = double.parse(f
//              .data['force_update_current_version']
//              .trim()
//              .replaceAll(".", ""));
//          version = f.data['force_update_current_version'];
//          print('currentVersion' + currentVersion.toString());
//        });
//      });
//    } catch (e) {
//      print(e.toString());
//    }
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));
    version = info.version;
    print('currentVersion' + currentVersion.toString());

    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));

    try {
      _firebaseMessaging.getToken().then((token) {
        print("token: " + token.toString());
      });
    } catch (e) {
      print(e.toString());
    }
    try {
      // Using default duration to force fetching from remote server.
      print("trying");
      await remoteConfig.fetch(expiration: const Duration(seconds: 5));
      print("after fetch");
      await remoteConfig.activateFetched();
      remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));
      print('newVersion' + newVersion.toString());
      if (newVersion > currentVersion) {
        _showVersionDialog(context);
      } else {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => Profile()));
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  //SHOW DIALOG
  _showVersionDialog(context) async {
    print("showDialog()");
    await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        String title = "New Update Available";
        String message =
            "There is a newer version of app available please update it now.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(StringUtils.APP_URL),
                  ),
                  FlatButton(
                    child: Text(btnLabelCancel),
                    onPressed: () {
                      Navigator.pop(context); //CLOSES DIALOG
                      Navigator.pushReplacement(context,
                          CupertinoPageRoute(builder: (context) => Profile()));
                    },
                  ),
                ],
              )
            : new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(StringUtils.APP_URL),
                  ),
                  FlatButton(
                    child: Text(btnLabelCancel),
                    onPressed: () {
                      Navigator.pop(context); //CLOSES ALERTDIALOG
                      Navigator.pushReplacement(context,
                          CupertinoPageRoute(builder: (context) => Profile()));
                    },
                  ),
                ],
              );
      },
    );
  }

  //LAUNCH URL
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print("INITSTATE()");
    try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }
    super.initState();

//    Future.delayed(const Duration(milliseconds: 2000), () {
//      Navigator.pushReplacement(
//          context, CupertinoPageRoute(builder: (context) => Profile()));
//    });
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD()");
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(35),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.deepOrange,
                    image: DecorationImage(
                      image: AssetImage(StringUtils.LOGO),
                      fit: BoxFit.cover,
                    )),
                height: MediaQuery.of(context).size.width * 0.45,
                width: MediaQuery.of(context).size.width * 0.8,
//                child: Image(
//                  image: AssetImage('assets/icon.jpeg'),
//                  fit: BoxFit.fitWidth,
//                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "ASK COMMERCIALS",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.bold,
                fontFamily: UtilsImporter().stringUtils.HKGrotesk,
              ),
            ),
            Text(
              "Your Perfect Business Partner",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: UtilsImporter().stringUtils.Girassol,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: 30,
        alignment: Alignment.bottomCenter,
        color: Colors.orange,
        child: Text(
          "Build Version " + version,
          style: TextStyle(
              color: Colors.white,
              fontFamily: UtilsImporter().stringUtils.HKGrotesk,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
