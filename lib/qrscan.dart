import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pay_anywhere/homepage.dart';
import 'package:pay_anywhere/yourqr.dart';

class QRScan extends StatefulWidget {
  const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  var getResult = '';

  @override
  void initState() {
    super.initState();
    scanQRCode();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
        if (getResult.length == 10 && getResult.startsWith('9')) {
          Navigator.pushReplacementNamed(context, '/scan',
              arguments: {'id': getResult});
        } else {
          StateError('Not Valid QR');
          // scanQRCode();
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Error Occured'),
                    content: Text('Not Valid QR Code'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Text('HomePage'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRScan()));
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Text('Retry'),
                        ),
                      ),
                    ],
                  ));
        }
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
