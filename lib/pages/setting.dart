import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/config/state_members.dart';
import 'package:spotify_pay_flutter/pages/SettingMenupages/member_select.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String membernameSelect = StateMembers.membernameSelect;
  InkWell settingMenuPanel(
      {String? label,
      IconData? icon,
      String? subLebel,
      required VoidCallback callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 3, color: Colors.grey[350]!))),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Icon(icon),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label!,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  subLebel != null
                      ? Text(
                          subLebel,
                          style: TextStyle(color: Colors.grey[500]),
                        )
                      : Container()
                ],
              ),
            )),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> settingMenu = [
      settingMenuPanel(
          label: "สมาชิกที่แสดง",
          icon: Icons.supervisor_account,
          subLebel: StateMembers.membernameSelect,
          callback: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MemberSelect()))
                .then((value) {
              setState(() {
                membernameSelect = StateMembers.membernameSelect;
              });
            });
          }),
      // settingMenuPanel(
      //     label: "ตั้งค่าผู้ใช้", icon: Icons.account_circle, callback: () {}),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("ตั้งค่า"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: settingMenu.length,
                itemBuilder: (context, index) => settingMenu[index]),
            Expanded(
                child: SizedBox(
              height: 1,
            )),
            // SizedBox(
            //   width: 200,
            //   height: 45,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       child: Text("ออกจากระบบ"),
            //       style: ButtonStyle(
            //           backgroundColor:
            //               MaterialStateProperty.all<Color>(Colors.red[400]!))),
            // ),
            // SizedBox(
            //   height: 50,
            // )
          ],
        ));
  }
}
