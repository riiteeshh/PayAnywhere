import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay_anywhere/homepage.dart';
import 'package:pay_anywhere/pin.dart';
import 'package:pay_anywhere/topupage.dart';
import 'package:pay_anywhere/transactonpage.dart';
import 'package:pay_anywhere/yourqr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.setMockInitialValues({});
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
        '/homepage': (context) => HomePage(),
        '/pinpage': (context) => MyPin(),
        '/transactionpage': (context) => TransactionPage(),
        '/topuppage': (context) => TopupPage(),
        '/yourqr': (context) => QRYour(),
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
            ),
            Container(
              margin: EdgeInsets.only(top: 55),
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
