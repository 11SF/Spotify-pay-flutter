import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/pages/home_page.dart';

class Pay extends StatefulWidget {
  Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("จ่ายเงิน"),
        backgroundColor: Colors.green,
      ),
      body: Text(
        "Hello Jay",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
    );
  }
}
