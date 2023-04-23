import 'dart:math';

import 'package:encryptor/encryptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:pay_anywhere/sharedprefs.dart';

class deffie {
  static num enc(num p, num q, num prvt) {
    num A;

    A = pow(q, prvt) % p;
    print(A);
    return A;
  }

  static String chg(String key) {
    String changed;
    List intr = [];
    List splitted;
    int C;
    String D;

    splitted = key.split("");
    print(splitted);
    for (int i = 0; i < key.length; i++) {
      C = int.parse(splitted[i]) + 68;
      print(C);
      intr.add(String.fromCharCode(C));
    }
    changed = intr.join("");
    print(changed);
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
      midd = cdunit[i] - 68;
      mid.add(midd);
    }
    publickey = mid.join("");
    print(publickey);
    return publickey;
  }

  static Future<String> secretkey(
      String publickkey, int prvtkey, BuildContext context) async {
    num publ = int.parse(publickkey);

    num sec = pow(publ, prvtkey) % 17;
    print('sec$sec');
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

    return encrypted;
  }
}
