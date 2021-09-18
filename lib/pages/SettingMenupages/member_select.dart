import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/config/state_members.dart';
import 'package:spotify_pay_flutter/models/member_model.dart';

class MemberSelect extends StatefulWidget {
  const MemberSelect({Key? key}) : super(key: key);

  @override
  _MemberSelectState createState() => _MemberSelectState();
}

class _MemberSelectState extends State<MemberSelect> {
  String _selectedMemberId = "";

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
            return ListTile(
              title: Text(member.name),
              leading: Radio(
                groupValue: _selectedMemberId,
                value: member.id,
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    _selectedMemberId = value!;
                  });
                  StateMembers.memberIdSelect = value!;
                },
              ),
            );
          },
        ));
  }
}
