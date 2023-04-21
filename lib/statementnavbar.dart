import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pay_anywhere/statement.dart';
import 'package:pay_anywhere/statement_sent_page.dart';

class StatementNavBar extends StatefulWidget {
  const StatementNavBar({super.key});

  @override
  State<StatementNavBar> createState() => _StatementNavBarState();
}

class _StatementNavBarState extends State<StatementNavBar> {
  int _selectedindex = 0;

  List pages = [StatementPage(), StatementSentPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: (value) {
          setState(() {
            _selectedindex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Recieved',
              icon: Icon(
                Icons.receipt,
              )),
          BottomNavigationBarItem(
            label: 'Sent',
            icon: Icon(
              Icons.send,
            ),
          ),
        ],
      ),
      body: pages[_selectedindex],
    );
  }
}
