import 'package:flutter/material.dart';
import 'package:pay_anywhere/pin.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final mobnumber = TextEditingController();
  final amount = TextEditingController();
  var bal = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Title(
            color: Colors.red,
            child: Container(
              width: double.infinity,
              child: Text(
                'Top-Up',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Bowlby',
                    fontSize: 25,
                    letterSpacing: 2),
              ),
            )),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 100,
            child: Card(
              color: Colors.red.withOpacity(0.9),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.wallet,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 57),
                    child: Text(
                      'Rs.$bal',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 57, top: 49),
                    child: Text(
                      'Balance',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      splashColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter the Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: mobnumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'MobileNumber',
                    suffixIcon: Icon(
                      Icons.people,
                      color: Colors.red,
                    ),
                    floatingLabelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.black)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.red)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    suffixIcon: Icon(
                      Icons.attach_money_outlined,
                      color: Colors.green,
                    ),
                    floatingLabelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.black)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: (BorderSide(width: 1.0, color: Colors.red)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      onPressed: cancel,
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 22, color: Colors.red),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 1,
                          shadowColor: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 25),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: ElevatedButton(
                      onPressed: send,
                      child: Text(
                        'Send ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'DelaGothic'),
                      ),
                      style: ElevatedButton.styleFrom(
                          enableFeedback: false,
                          elevation: 20,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void cancel() {
    mobnumber.clear();
    amount.clear();
    Navigator.pop(context);
  }

  void send() {
    String top = 'topup';
    Navigator.pushNamed(context, '/pinpage', arguments: {
      'string': top,
      'number': mobnumber.text,
      'amt': amount.text
    });
  }
}
