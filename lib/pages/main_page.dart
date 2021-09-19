import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/pages/home_page.dart';
import 'package:spotify_pay_flutter/pages/pay_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = <Widget>[Home(), Pay()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'จ่ายเงิน',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF1DB954),
        // selectedItemColor: Colors.amber,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
