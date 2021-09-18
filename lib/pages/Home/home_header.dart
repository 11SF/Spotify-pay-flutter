import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:spotify_pay_flutter/components/member_card.dart';
import 'package:spotify_pay_flutter/config/state_members.dart';
import 'package:spotify_pay_flutter/models/member_model.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:spotify_pay_flutter/pages/setting.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key, required this.size, required this.membersData})
      : super(key: key);

  final Size size;
  final List<Member> membersData;

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String getWelcomeMsg(DateTime date) {
    return date.toString();
  }

  late Member memBerSelected;

  static setPinCard() {}

  @override
  Widget build(BuildContext context) {
    String welcomeMsg = '';
    Color colorCode = Color(0xFFF);
    Color textColor;
    // ignore: null_check_always_fails
    if (StateMembers.memberIdSelect != "") {
      for (var i in StateMembers.memberList) {
        if (i.id == StateMembers.memberIdSelect) {
          setState(() {
            memBerSelected = i;
          });
        }
      }
    }

    initializeDateFormatting();
    var now = DateTime.now();
    var format = DateFormat.yMMMMEEEEd();
    var dateString = format.formatInBuddhistCalendarThai(now);

    if (now.hour >= 6 && now.hour < 11) {
      welcomeMsg = 'สวัสดีตอนเช้า';
      colorCode = Color(0xFFCAF7E3);
      textColor = Colors.black;
    } else if (now.hour >= 11 && now.hour < 13) {
      welcomeMsg = 'สวัสดีตอนเที่ยง';
      colorCode = Color(0xFFBB371A);
      textColor = Colors.white;
    } else if (now.hour >= 13 && now.hour < 16) {
      welcomeMsg = 'สวัสดีตอนบ่าย';
      colorCode = Color(0xFFFB9300);
      textColor = Colors.white;
    } else if (now.hour >= 16 && now.hour < 18) {
      welcomeMsg = 'สวัสดีตอนเย็น';
      colorCode = Color(0xFFF54748);
      textColor = Colors.white;
    } else if (now.hour >= 18 && now.hour < 22) {
      welcomeMsg = 'สวัสดีตอนค่ำ';
      colorCode = Color(0xFF343F56);
      textColor = Colors.white;
    } else {
      welcomeMsg = 'ฝันดีนะค้าบบ';
      colorCode = Color(0xFFF002233);
      textColor = Colors.white;
    }

    return Stack(
      children: [
        Container(
          height: widget.size.height * .45,
          width: widget.size.width,
          decoration: BoxDecoration(
            // color: Colors.green,
            // color: Color(0xfffBEE5D3),
            color: colorCode,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Setting()),
                        );
                        print("setting");
                      },
                    ),
                    Expanded(
                      child: SizedBox(height: 1),
                    ),
                    IconButton(
                      icon: ClipOval(
                          // child: Image.network(
                          //     "https://cdn.discordapp.com/attachments/557626019247423508/870389553003896902/107698195_2967815813287518_541907919760258090_n.png"),
                          ),
                      onPressed: () {
                        print("profile");
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      welcomeMsg,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      dateString,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    StateMembers.memberIdSelect == ""
                        ? MemberCard(
                            data: widget.membersData[5],
                            haveData: false,
                          )
                        : MemberCard(data: this.memBerSelected, haveData: true)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
