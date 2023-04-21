import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './sharedprefs.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({super.key});

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  dynamic? amt;
  var dbref = FirebaseFirestore.instance.collection('UserData');

  Future<dynamic> statementRecievedData() async {
    var id = await sharedpref.getdata('id');
    await dbref.doc(id).get().then((data) {
      if (data.exists) {
        amt = data['recieved'];
        print(amt);
      }
    });
    return amt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Statement',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Bowlby',
              fontSize: 20,
              letterSpacing: 2),
        ),
      ),
      body: FutureBuilder(
          future: statementRecievedData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.86,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.red, fontSize: 25),
                        ),
                        title: Text(snapshot.data[index]['from']),
                        subtitle: Text(snapshot.data[index]['date']),
                        trailing: Text(
                          snapshot.data[index]['amount'],
                          style: TextStyle(fontSize: 25, color: Colors.green),
                        ),
                      );
                    }),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
