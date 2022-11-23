import 'package:flutter/material.dart';
import 'package:pay_anywhere/yourqr.dart';
import './qrpage.dart';
import './sharedprefs.dart';
import './topupage.dart';
import './transactonpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool change = true;
  String? username, contactnumber;
  Future<bool> gettingdata() async {
    username = await sharedpref.getdata('username');
    contactnumber = await sharedpref.getdata('contactnumber');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: Title(
              color: Colors.red,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Bowlby',
                          fontSize: 25,
                          letterSpacing: 2),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          sharedpref.cleardata();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        icon: Icon(
                          Icons.logout_rounded,
                          size: 30,
                        )),
                  ),
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 120,
          height: 80,
          margin: EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            enableFeedback: false,
            backgroundColor: Colors.red,
            splashColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QRTab()));
            },
            child: Icon(
              Icons.qr_code_scanner_rounded,
              size: 40,
            ),
          ),
        ),
        body: FutureBuilder(
            future: gettingdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  !snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      color: Colors.red.withOpacity(0.9),
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              'Hello,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/yourqr',
                                      arguments: {
                                        'number': contactnumber,
                                        'name': username,
                                      });
                                },
                                icon: Icon(
                                  Icons.qr_code_outlined,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 45, bottom: 20, left: 20, right: 20),
                            child: Text(
                              username!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'FuzzybubblesBold',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 19),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 82, bottom: 20, left: 20, right: 20),
                            child: change
                                ? Text(
                                    'XXXXX',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  )
                                : Text(
                                    '020479879456514151',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 125, bottom: 20, left: 20, right: 20),
                            child: Text(
                              'NPR.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 112, bottom: 20, left: 80, right: 20),
                            child: Row(
                              children: [
                                change
                                    ? Text(
                                        'XXXX.xx',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )
                                    : Text(
                                        '10000',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        change = !change;
                                      });
                                    },
                                    icon: change
                                        ? Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.white,
                                          )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 5),
                          width: double.infinity,
                          child: Text(
                            ' Services',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'FuzzybubblesBold'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 33, left: 15),
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/transactionpage');
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 10,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          'asset/images/sendmoney.png')),
                                  Text(
                                    'Send Money',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 33, left: 135),
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/topuppage');
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 10,
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          'asset/images/topup.png')),
                                  Text(
                                    'Top-Up ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
