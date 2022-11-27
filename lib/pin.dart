import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:pay_anywhere/sharedprefs.dart';

class MyPin extends StatefulWidget {
  const MyPin({super.key});

  @override
  State<MyPin> createState() => _MyPinState();
}

class _MyPinState extends State<MyPin> {
  late String pin;
  late String userpin;
  var recpt = '9865762048';
  Future<bool> gettingpindata() async {
    userpin = await sharedpref.getdata('pindata');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final arg = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as Map;
    void sms() async {
      if (pin == userpin) {
        String message = arg['string'] + ':' + arg['number'] + ':' + arg['amt'];
        List<String> recipents = [recpt];
        String _result = await sendSMS(
                message: message, recipients: recipents, sendDirect: true)
            .catchError((onError) {
          print(onError);
        });

        Navigator.pushReplacementNamed(context, '/homepage');
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Enter valid PIN')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: gettingpindata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                !snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Text(
                    'Enter PIN',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: OtpPinField(
                    otpPinFieldInputType: OtpPinFieldInputType
                        .custom, // OtpPinFieldInputType.none || OtpPinFieldInputType.password || OtpPinFieldInputType.custom
                    otpPinInputCustom:
                        "●", // A String which you want to show when you use 'inputType: OtpPinFieldInputType.custom, '
                    onSubmit: ((text) => pin = text),
                    onChange: (text) {
                      setState(() {
                        pin = text;
                      });
                    },

                    // to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      defaultFieldBorderColor: Colors
                          .black, // border color for inactive/unfocused Otp_Pin_Field
                      activeFieldBorderColor: Colors
                          .red, // border color for active/focused Otp_Pin_Field
                      defaultFieldBackgroundColor: Colors
                          .white, // Background Color for inactive/unfocused Otp_Pin_Field
                      activeFieldBackgroundColor: Colors
                          .transparent, // Background Color for active/focused Otp_Pin_Field
                    ),
                    maxLength: 4, // no of pin field
                    highlightBorder:
                        true, // want to highlight focused/active Otp_Pin_Field
                    fieldWidth: 50, //to give width to your Otp_Pin_Field
                    fieldHeight: 50, //to give height to your Otp_Pin_Field
                    keyboardType:
                        TextInputType.number, // type of keyboard you want
                    autoFocus: true, //want to open keyboard or not

                    // predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    //use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () => sms(),
                    child: Text(
                      'DONE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        enableFeedback: false,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            );
          }),
    );
  }
}
