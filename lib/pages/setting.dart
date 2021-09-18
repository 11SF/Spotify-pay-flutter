import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/pages/SettingMenupages/member_select.dart';

import 'home_page.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  InkWell settingMenuPanel(
      {String? label, IconData? icon, required VoidCallback callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 3, color: Colors.grey[350]!))),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            Icon(icon),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(label!),
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
          callback: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MemberSelect()));
          }),
      // settingMenuPanel(
      //     label: "ตั้งค่าผู้ใช้", icon: Icons.account_circle, callback: () {}),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("ตั้งค่า"),
          // leading: IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
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
            SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("ออกจากระบบ"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red[400]!))),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
