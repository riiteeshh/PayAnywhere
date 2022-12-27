import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter/material.dart';
import 'package:pay_anywhere/sharedprefs.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:telephony/telephony.dart';
import './keyexcg.dart';

// sender should be +977

class keyss extends StatefulWidget {
  @override
  State<keyss> createState() => _keyssState();
}

class _keyssState extends State<keyss> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String sms = "";
  Telephony telephony = Telephony.instance;

  var dbref = FirebaseFirestore.instance.collection('UserData');

  Future<bool> perm() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      //add more permission to request here.
    ].request();
    return true;
  }

  @override
  void initState() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.phone,
          //add more permission to request here.
        ].request();
        sms = message.body.toString();
        print(message.address);
        print(message.body);

        //  var securitycode = '123478'; // security code for ntc
        //var sendernumber = message.address;
        var x = sms;

        var y = x.split(
            ":"); // var y = x.split(":"); // o/p:[topup, +9779865762048, 50]
        if (y.length == 2) {
          if (y[0] == 'public') {
            String public;
            print('public');
            List<String> str = [];

            List<num> cdunit = [];
            List mid = [];
            num midd;
            int cd;
            print('reached');
            int prvt = await sharedpref.getnumdata('prvt');
            print('reach');
            str = y[1].split('');
            print('str$str');
            for (int i = 0; i < str.length; i++) {
              print('for$i');
              //str[i].codeUnits;
              print('str$str');
              cdunit.addAll(str[i].codeUnits);
              print('cdunit$cdunit');
            }
            print(str);
            for (int i = 0; i < cdunit.length; i++) {
              print(cdunit[i]);
              midd = (cdunit[i] - 68).abs();
              mid.add(midd);
              print(mid);
            }
            public = mid.join("");
            print('publickey$public');
            //  excgkey(publickey, sendernumber);

            await deffie.secretkey(public, prvt);
          }
        }
      },
      listenInBackground: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Listen Incoming SMS in Flutter"),
            backgroundColor: Colors.redAccent),
        body: FutureBuilder(
            future: perm(),
            builder: (context, snapshot) {
              if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recieved SMS Text:",
                        style: TextStyle(fontSize: 30),
                      ),
                      Divider(),
                      Text(
                        "SMS Text:" + sms,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ));
            }),
      ),
    );
  }

  void excgkey(String publickey, var sendernumber) async {
    print('called');
    String message = 'public:$publickey';
    List<String> recipents = [sendernumber.toString()];

    await sendSMS(message: message, recipients: recipents, sendDirect: true)
        .catchError((onError) {
      print(onError);
    });
  }

  String getpublickey(String publickeystr) {
    List<String> str = [];
    List cdunit = [];
    List mid = [];
    num midd;
    String publickey;

    str = publickeystr.split("");
    print(str);
    for (int i = 0; i < str.length; i++) {
      cdunit.add(str[i].codeUnits);
      midd = cdunit[i] - 68;
      mid.add(midd);
    }
    publickey = mid.join("");
    print('publickey$publickey');
    return publickey;
  }

  static num secretkey(String publickkey, num prvtkey) {
    num publ = int.parse(publickkey);

    num sec = pow(publ, prvtkey) % 17;
    print('secretkey$sec');
    return sec;
  }
}
