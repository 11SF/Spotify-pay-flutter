import 'dart:async';
import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_pay_flutter/config/state_members.dart';
import 'package:spotify_pay_flutter/models/member_model.dart';

import 'Home/home_header.dart';
import 'Home/member_list.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  bool isLoading = false;
  bool isRefresh = false;
  late List<Member> _memberResult;

  @override
  void initState() {
    super.initState();
    fetchMember();
  }

  Future<void> fetchMember() async {
    isLoading = true;
    var response = await http.get(
        Uri.parse('https://mysitebackend.herokuapp.com/api/member/get/all'));
    var memberObjsJson = jsonDecode(response.body);

    List<Member> result = [];
    for (var i in memberObjsJson) {
      Member a = Member.fromJson(i);
      result.add(a);
    }
    StateMembers.memberList = result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('memberSelectId');
    if (id != null) {
      StateMembers.memberIdSelect = id;
    }
    String? name = prefs.getString('memberSelectName');
    if (name != null) {
      StateMembers.membernameSelect = name;
    }
    isLoading = false;
    setState(() {
      _memberResult = StateMembers.memberList;
    });
  }

  Future<void> refreshMember() async {
    isRefresh = true;
    await this.fetchMember();
    isRefresh = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: RefreshIndicator(
          onRefresh: refreshMember,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          child: HomeHeader(
                              size: size, membersData: _memberResult)),
                      Container(child: MemberList(membersData: _memberResult)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
