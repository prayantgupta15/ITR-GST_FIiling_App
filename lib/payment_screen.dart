import 'package:askcommercials/Utils/StringUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPressed = false, isSaved = false;

  void _saveImage(String path) async {
    GallerySaver.saveImage(path, albumName: 'Ask Comm.').then((bool success) {
     Fluttertoast.showToast(msg: "QR Code saved in Gallery");
    });
  }

  void copy(String msg) {
    Clipboard.setData(ClipboardData(text: msg));
    Fluttertoast.showToast(msg: 'Copied $msg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Payment'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              ExpansionTile(
                children: <Widget>[
                  RaisedButton(
                    child: Icon(Icons.file_download),
                    color: Colors.blue,
                    onPressed: () {
                      _saveImage(StringUtils.GPAY_CODE_URL);
                    },
                  ),
                  Image(image: AssetImage(StringUtils.GPAY))
                ],
                title: Text("Google Pay QR", style: ts),
              ),
              Divider(),
              ExpansionTile(
                  children: <Widget>[
                    RaisedButton(
                      child: Icon(Icons.file_download),
                      color: Colors.blue,
                      onPressed: () {
                      _saveImage(StringUtils.PAYTM_CODE_URL);
                      },
                    ),
                Image(
                  image: AssetImage(StringUtils.PAYTM),
                )
              ], title: Text("Paytm QR", style: ts)),
              Divider(),
              ExpansionTile(
                children: <Widget>[
                  ListTile(
                      title:
                          Text("Acc Name: ${StringUtils.ACC_NAME}", style: ts),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy, color: Colors.orange),
                        onPressed: () {
                          copy(StringUtils.ACC_NAME);
                        },
                      )),
                  ListTile(
                      title: Text("A/C No: ${StringUtils.ACC_NO}", style: ts),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy, color: Colors.orange),
                        onPressed: () {
                          copy(StringUtils.ACC_NO);
                        },
                      )),
                  ListTile(
                      title: Text("IFSC Code: ${StringUtils.IFSC}", style: ts),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy, color: Colors.orange),
                        onPressed: () {
                          copy(StringUtils.IFSC);
                        },
                      )),
                  ListTile(
                      title:
                          Text("Acc Branch: ${StringUtils.BRANCH}", style: ts),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy, color: Colors.orange),
                        onPressed: () {
                          copy(StringUtils.BRANCH);
                        },
                      )),
                ],
                title: Text("Bank Details", style: ts),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
