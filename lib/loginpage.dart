import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';
import './signuppage.dart';
import './homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    number.dispose();
    password.dispose();
    super.dispose();
  }

  var number = TextEditingController();
  var password = TextEditingController();
  bool showpass = false;
  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
        valueListenables: [number, password],
        builder: (context, values, __) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 12,
                          ),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Image.asset('asset/images/money.gif'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red.withOpacity(0.9),
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 15),
                            width: double.infinity,
                            child: Text(
                              'WELCOME\nBACK ! ',
                              style: TextStyle(
                                fontFamily: 'Bowlby',
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.aspectRatio *
                                        70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: number,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                errorText: _errornumber,
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.yellow)),
                                errorStyle: TextStyle(color: Colors.yellow),
                                labelText: 'Mobile Number',
                                suffixIcon: Icon(Icons.people),
                                floatingLabelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: (BorderSide(
                                      width: 1.0, color: Colors.black)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: (BorderSide(
                                      width: 1.0, color: Colors.amber)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: showpass ? false : true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: password,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                errorText: _errorpass,
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.yellow)),
                                errorStyle: TextStyle(color: Colors.yellow),
                                labelText: 'Password',
                                suffixIcon: showpass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye),
                                floatingLabelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: (BorderSide(
                                      width: 1.0, color: Colors.black)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: (BorderSide(
                                      width: 1.0, color: Colors.amber)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Row(
                              children: [
                                Checkbox(
                                  splashRadius: 30,
                                  side: BorderSide(width: 2),
                                  activeColor: Colors.amber,
                                  value: showpass,
                                  onChanged: (newval) {
                                    setState(() {
                                      showpass = newval!;
                                    });
                                  },
                                ),
                                Text(
                                  'Show Password',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: showpass
                                          ? Colors.amber
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 6),
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: TextButton(
                                  onPressed: sign,
                                  child: Text(
                                    'SIGN UP>>',
                                    style: TextStyle(
                                        fontSize: 22,
                                        decoration: TextDecoration.underline),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Colors.red.withOpacity(0.1),
                                      elevation: 0,
                                      shadowColor: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                child: ElevatedButton(
                                  onPressed: logg,
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'DelaGothic'),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      enableFeedback: false,
                                      elevation: 20,
                                      backgroundColor: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void sign() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUp()));
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

  String? get _errorpass {
    final pass_check = password.value.text;
    if (pass_check.isEmpty) {
      return 'Enter the password';
    } else {
      return null;
    }
  }

  void logg() {
    if (_errornumber == null && _errorpass == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
