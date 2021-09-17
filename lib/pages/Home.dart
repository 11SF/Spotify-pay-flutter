import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_pay_flutter/models/member.dart';

import 'Home/home_header.dart';
import 'Home/member_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  var data = [1, 2, 3, 4, 5, 6];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    log('$index');
    setState(() {
      _selectedIndex = index;
    });
    log('$List[$_selectedIndex]');
  }

  Future<List<Member>> fetchMember() async {
    var response = await http.get(
        Uri.parse('https://mysitebackend.herokuapp.com/api/member/get/all'));
    var memberObjsJson = jsonDecode(response.body);

    List<Member> result = [];
    for (var i in memberObjsJson) {
      Member a = Member.fromJson(i);
      result.add(a);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppbar(),
      body: Container(
        color: Colors.white70,
        // color: Colors.black87,
        child: FutureBuilder(
            future: fetchMember(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Member> result = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          child: HomeHeader(size: size, membersData: result)),
                      Container(child: MemberList(membersData: result)),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF1DB954),
      onTap: _onItemTapped,
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: ClipOval(
            child: Image.network(
                "https://cdn.discordapp.com/attachments/557626019247423508/870389553003896902/107698195_2967815813287518_541907919760258090_n.png"),
          ),
          onPressed: () {},
        )
      ],
      // backgroundColor: Colors.transparent,
      // backgroundColor: Colors.green,
      backgroundColor: Color(0xFFF002233),
      elevation: 0,
    );
  }
}
