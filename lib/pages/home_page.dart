import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  bool refresh = false;

  Future<List<Member>> fetchMember() async {
    var response = await http.get(
        Uri.parse('https://mysitebackend.herokuapp.com/api/member/get/all'));
    var memberObjsJson = jsonDecode(response.body);

    List<Member> result = [];
    for (var i in memberObjsJson) {
      Member a = Member.fromJson(i);
      result.add(a);
    }
    StateMembers.memberList = result;
    return result;
  }

  Future<List<Member>> refreshMember() async {
    refresh = true;
    var response = await http.get(
        Uri.parse('https://mysitebackend.herokuapp.com/api/member/get/all'));
    var memberObjsJson = jsonDecode(response.body);

    List<Member> result = [];
    for (var i in memberObjsJson) {
      Member a = Member.fromJson(i);
      result.add(a);
    }
    refresh = false;
    StateMembers.memberList = result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white70,
        // color: Colors.black87,
        child: RefreshIndicator(
          onRefresh: refreshMember,
          child: FutureBuilder(
              future: fetchMember(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done ||
                    refresh) {
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
      ),
    );
  }
}
