import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    name.dispose();
    address.dispose();
    number.dispose();
    email.dispose();
    password.dispose();
    repass.dispose();
    super.dispose();
  }

  final name = TextEditingController();
  final address = TextEditingController();
  final number = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repass = TextEditingController();
  var dbref = FirebaseFirestore.instance.collection('UserData');
  var dbid = FirebaseFirestore.instance.collection('UserData').doc();
  num balance = 1000;
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
        valueListenables: [name, address, number, email, password, repass],
        builder: (context, values, __) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15),
                    width: double.infinity,
                    child: Text(
                      'Let\'s Start ',
                      style: TextStyle(
                        fontFamily: 'Bowlby',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        errorText: _errorname,
                        labelText: 'Full Name',
                        suffixIcon: Icon(Icons.person_sharp),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: address,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        errorText: _erroraddress,
                        labelText: 'Address',
                        suffixIcon: Icon(Icons.location_city),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: number,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        errorText: _errornumber,
                        labelText: 'Mobile Number',
                        suffixIcon: Icon(Icons.phone_android_rounded),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        errorText: _errormail,
                        labelText: 'E-mail Address',
                        suffixIcon: Icon(Icons.mail_outline),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      decoration: InputDecoration(
                        errorText: _errorpin,
                        labelText: 'Login PIN',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: repass,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      decoration: InputDecoration(
                        errorText: _errorrepass,
                        labelText: 'Re-enter PIN',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        floatingLabelStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.black)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              (BorderSide(width: 1.0, color: Colors.blue)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: ElevatedButton(
                      onPressed: sign,
                      child: wait
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.red,
                            ))
                          : Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'DelaGothic'),
                            ),
                      style: ElevatedButton.styleFrom(
                          enableFeedback: false,
                          elevation: 20,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> sign() async {
    setState(() {
      wait = !wait;
    });
    if (_erroraddress == null &&
        _errormail == null &&
        _errorname == null &&
        _errornumber == null &&
        _errorpin == null &&
        _errorrepass == null) {
      Map<String, dynamic> users = {
        'balance': balance,
        'name': name.text,
        'address': address.text,
        'mobilenumber': number.text,
        'e-mailaddress': email.text,
        'pin': password.text
      };
      await dbref.add(users);
      setState(() {
        wait = !wait;
      });
      Navigator.pop(context);
    } else {}
  }

  String? get _errorname {
    if (name.value.text.isEmpty) {
      return 'Enter Name';
    } else {
      return null;
    }
  }

  String? get _erroraddress {
    if (address.value.text.isEmpty) {
      return 'Enter Address';
    } else {
      return null;
    }
  }

  String? get _errornumber {
    final number_check = number.value.text;
    if (number_check.isEmpty) {
      return 'Enter the number';
    }
    if (number_check.length > 10 || number_check.length < 10) {
      return 'Enter valid number';
    } else {
      return null;
    }
  }

  String? get _errormail {
    String sym1 = '@';
    String sym2 = '.com';
    if (email.value.text.isEmpty) {
      return 'Enter E-mail';
    }
    if (!email.value.text.contains(sym1) || !email.value.text.contains(sym2)) {
      return 'Enter Valid E-mail';
    } else {
      return null;
    }
  }

  String? get _errorpin {
    final number_check = password.value.text;
    if (number_check.isEmpty) {
      return 'Enter PIN';
    }
    if (number_check.length < 4) {
      return 'Contains At-least 4 number';
    } else {
      return null;
    }
  }

  String? get _errorrepass {
    final number_check = repass.value.text;
    if (number_check.isEmpty) {
      return 'Enter PIN again';
    }
    if (number_check != password.value.text) {
      return 'PIN doesn\'t Match';
    } else {
      return null;
    }
  }
}
