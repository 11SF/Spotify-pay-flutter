import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/components/member_card.dart';
import 'package:spotify_pay_flutter/models/member_model.dart';

class MemberList extends StatelessWidget {
  const MemberList({
    Key? key,
    required this.membersData,
  }) : super(key: key);

  final List<Member> membersData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    Text("สมาชิกทั้งหมด",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            for (var member in membersData)
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MemberCard(
                    data: member,
                    haveData: true,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
