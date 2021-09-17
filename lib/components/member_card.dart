import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({Key? key, required this.data})
      : super(
          key: key,
        );
  final Member data;

  int getStatus() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String dateFormat = date.toString().split(" ")[0];
    int month = int.parse(dateFormat.split("-")[1]);
    int year = int.parse(dateFormat.split("-")[0]) + 543;
    List<int> temp = getDate(data.expireDate);
    if (temp[1] > month || year < temp[2]) {
      return 1;
    } else if (month == temp[1]) {
      return 2;
    } else {
      return 3;
    }
  }

  List<int> getDate(String date) {
    List<String> _temp = date.split("/");
    List<int> temp = [];
    for (String i in _temp) {
      temp.add(int.parse(i));
    }
    return temp;
  }

  String getMessageStatus(int status) {
    switch (status) {
      case 1:
        return "ฟังเพลงยาว ๆ ไปครับ";
      case 2:
        return "ถึงเวลาจ่ายแล้วครับผมม";
      case 3:
        return "ระวังจะได้ฟัง JOOX";
      default:
        return "error";
    }
  }

  String dateToString(String dateString) {
    // data.countMonth,
    // data.expireDate
    List<int> temp = getDate(dateString);
    const month = [
      "มกราคม",
      "กุมภาพันธ์",
      "มีนาคม",
      "เมษายน",
      "พฤษภาคม",
      "มิถุนายน",
      "กรกฎาคม",
      "สิงหาคม",
      "กันยายน",
      "ตุลาคม",
      "พฤศจิกายน",
      "ธันวาคม"
    ];
    return '${temp[0]} ${month[temp[1] - 1]} ${temp[2]}';
  }

  // MemberCard(this.index)
  static const card_style = [
    BoxDecoration(
        gradient: LinearGradient(
      colors: [
        const Color(0xFF1DB954),
        const Color(0xFF0C7475),
      ],
      begin: const FractionalOffset(0.0, 0.4),
      end: const FractionalOffset(0.1, 1.0),
      stops: [0.0, 1],
      tileMode: TileMode.clamp,
    )),
    BoxDecoration(
        gradient: LinearGradient(
      colors: [
        const Color(0xFFF8CA14),
        const Color(0xFFF87B21),
      ],
      begin: const FractionalOffset(0.0, 1.0),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
    BoxDecoration(
        gradient: LinearGradient(
      colors: [
        const Color(0xFFD9091B),
        const Color(0xFF164496),
      ],
      begin: const FractionalOffset(0.0, 1.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
  ];
  @override
  Widget build(BuildContext context) {
    int status = getStatus() - 1;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      child: Container(
        height: 230,
        decoration: card_style[status],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              height: 260,
              child: Image.network(
                '${data.imgSrc}',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      data.name,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    getMessageStatus(getStatus()),
                    style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 1,
                  )),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "จ่ายล่าสุด : ${dateToString(data.lastDate)}",
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "หมดอายุ  : ${dateToString(data.expireDate)}",
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
