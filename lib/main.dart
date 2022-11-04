import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pay_anywhere/transactonpage.dart';
import './loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/scan': ((context) => TransactionPage())
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      print('reached');
      Navigator.pushReplacementNamed(context, '/login');
      //can extract data in next page by
      //final route= ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset('asset/images/money.gif'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: Text(
                'PAY ANYWHERE',
                style: TextStyle(
                    fontFamily: 'Ceviche',
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.aspectRatio * 120,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
