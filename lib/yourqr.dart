import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRYour extends StatefulWidget {
  @override
  State<QRYour> createState() => _QRYourState();
}

class _QRYourState extends State<QRYour> {
  var yourqr = '9865762048';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Title(
          color: Colors.blue,
          child: Container(
            width: double.infinity,
            child: Text(
              'Your Code',
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: QrImage(
                data: yourqr,
                version: QrVersions.auto,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Ritesh Pandey',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Scan the code to recieve money',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
