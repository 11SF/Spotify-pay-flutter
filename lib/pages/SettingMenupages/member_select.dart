import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_pay_flutter/config/state_members.dart';
import 'package:spotify_pay_flutter/models/member_model.dart';

class MemberSelect extends StatefulWidget {
  const MemberSelect({Key? key}) : super(key: key);

  @override
  _MemberSelectState createState() => _MemberSelectState();
}

class _MemberSelectState extends State<MemberSelect> {
  String _selectedMemberId = StateMembers.memberIdSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("สมาชิกที่แสดง"),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemCount: StateMembers.memberList.length,
          itemBuilder: (BuildContext context, int index) {
            Member member = StateMembers.memberList[index];
            return RadioListTile(
              title: Text(member.name),
              groupValue: _selectedMemberId,
              value: member.id,
              onChanged: (String? value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('memberSelectId', value!);
                prefs.setString('memberSelectName', member.name);
                // print(member.name);
                setState(() {
                  _selectedMemberId = value;
                });
                StateMembers.memberIdSelect = value;
                StateMembers.membernameSelect = member.name;
                Navigator.pop(context);
              },
            );
          },
        ));
  }
}
