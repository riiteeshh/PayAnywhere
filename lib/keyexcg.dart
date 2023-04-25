import 'dart:math';

import 'package:encryptor/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:pay_anywhere/homepage.dart';
import 'package:pay_anywhere/sharedprefs.dart';

class deffie {
  static BigInt enc(num p, num q, num prvt) {
    print('reached enc');
    BigInt A;
    A = ((BigInt.from(q)) ^ BigInt.from(prvt)) % BigInt.from(p);
    // A = pow(q, prvt) % p;
    print('publickey$A');
    return A;
  }

  static String chg(String key) {
    print('reached chg');
    String changed;
    List intr = [];
    List splitted;
    int C;
    String D;

    splitted = key.split("");
    print(splitted);
    for (int i = 0; i < key.length; i++) {
      C = (int.parse(splitted[i]) + 68);
      print('changed$C');
      intr.add(String.fromCharCode(C));
    }
    changed = intr.join("");
    print('changedt$changed');
    return changed;
  }

  static String getpublickey(String publickeystr) {
    List<String> str = [];
    List cdunit = [];
    List mid = [];
    num midd;
    String publickey;

    str = publickeystr.split("");
    print(str);
    for (int i = 0; i < str.length; i++) {
      cdunit.add(str[i].codeUnits);
      midd = (cdunit[i] - 68).abs();
      mid.add(midd);
    }
    publickey = mid.join("");
    print('publickey$publickey');
    return publickey;
  }

  static Future<String> secretkey(
      String publickkey, num prvtkey, BuildContext context) async {
    num publ = int.parse(publickkey);
    print('publ$publ');
    print('prvt$prvtkey');
    print('data${pow(publ, prvtkey)}');
    BigInt sec =
        ((BigInt.from(publ)) ^ (BigInt.from(prvtkey))) % BigInt.from(15485863);
    //num sec = pow(publ, prvtkey) % 919; //used 919
    print('sec$sec');
    print('moddded${pow(publ, prvtkey) % 15485863}');
    final plainText = await sharedpref.getdata('sendingdata');
    var encrypted = Encryptor.encrypt(sec.toString(), plainText);
    var decrypted = Encryptor.decrypt(sec.toString(), encrypted);
    String message = encrypted;
    List<String> recipents = ['9860916869'];
    String _result =
        await sendSMS(message: message, recipients: recipents, sendDirect: true)
            .catchError((onError) {
      print(onError);
    });

    print(encrypted);
    print(decrypted);
    Navigator.pushReplacementNamed(context, '/homepage');

    return encrypted;
  }
}
