import 'package:flutter/material.dart';
import 'package:pay_anywhere/qrscan.dart';
import './yourqr.dart';

class QRTab extends StatefulWidget {
  const QRTab({super.key});

  @override
  State<QRTab> createState() => _QRTabState();
}

class _QRTabState extends State<QRTab> {
  var selectedindex = 0;
  @override
  final List<Widget> pages = [QRScan(), QRYour()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontStyle: FontStyle.italic,
        ),
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded), label: 'Scan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2_rounded), label: 'Your Code')
        ],
        currentIndex: selectedindex,
        onTap: change,
      ),
    );
  }

  void change(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
