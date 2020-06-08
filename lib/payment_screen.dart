import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPressed = false, isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Payment'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Text("Loading QR Code..."),
              Image(
                image: NetworkImage(StringUtils.PAYMENT_CODE_URL),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              RaisedButton(
                child: isSaved ? Text("Downloaded ") : Text("Download QR Code"),
                onPressed: () {
                  setState(() {
                    isPressed = true;
                  });
                  GallerySaver.saveImage(
                    //path:
                    StringUtils.PAYMENT_CODE_URL,
                    albumName: 'AskCommercials',
                  ).then((bool success) {
                    setState(() {
                      isPressed = false;
                      isSaved = true;
                      print('Image Saved');
                    });
                  });
                },
              ),
              isPressed ? CircularProgressIndicator() : Container()
            ],
          )
        ],
      )),
    );
  }
}
