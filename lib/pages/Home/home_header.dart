import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:spotify_pay_flutter/components/member_card.dart';
import 'package:spotify_pay_flutter/models/member.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key, required this.size, required this.membersData})
      : super(key: key);

  final Size size;
  final List<Member> membersData;
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    var format = DateFormat.yMMMMEEEEd();
    var dateString = format.formatInBuddhistCalendarThai(DateTime.now());

    return Stack(
      children: [
        Container(
          height: size.height * .42,
          width: size.width,
          decoration: BoxDecoration(
            // color: Colors.green,
            // color: Color(0xfffBEE5D3),
            color: Color(0xFFF002233),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สวัสดีตอนค่ำ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  dateString,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                MemberCard(data: membersData[5])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
