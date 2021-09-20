import 'package:flutter/material.dart';
import 'package:spotify_pay_flutter/pages/qr_page.dart';
// import 'package:flutter_svg/svg.dart';

class Pay extends StatefulWidget {
  Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  Widget pricePanel({int? month, int? price, required VoidCallback callback}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: callback,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  '$month เดือน',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
                Text('$price ฿',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<Widget> priceMenu = [
      pricePanel(
          month: 1,
          price: 35,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Qr(
                          title: '1 เดือน',
                          price: '35',
                          imgPath: 'assets/pp_35.jpeg',
                        )));
          }),
      pricePanel(
          month: 2,
          price: 70,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Qr(
                          title: '2 เดือน',
                          price: '70',
                          imgPath: 'assets/pp_70.jpeg',
                        )));
          }),
      pricePanel(
          month: 3,
          price: 105,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Qr(
                          title: '3 เดือน',
                          price: '105',
                          imgPath: 'assets/pp_105.jpeg',
                        )));
          }),
      pricePanel(
          month: 6,
          price: 210,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Qr(
                          title: '6 เดือน',
                          price: '210',
                          imgPath: 'assets/pp_210.jpeg',
                        )));
          }),
      pricePanel(
          month: 12,
          price: 420,
          callback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Qr(
                          title: '12 เดือน',
                          price: '420',
                          imgPath: 'assets/pp_420.jpeg',
                        )));
          }),
    ];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("จ่ายเงิน"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          color: Colors.green,
          child: Stack(children: [
            Column(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 1,
                )),
                Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    color: Colors.grey[50],
                  ),
                  height: size.height * .6,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ราคา 35฿ /เดือน",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("เลือกจำนวนเดือนที่ต้องการจ่าย",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 30,
                        ),
                        for (var i in priceMenu)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: i,
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Transform.rotate(
                  angle: 56.8,
                  child: Image(
                    image: AssetImage('assets/money.png'),
                    width: MediaQuery.of(context).size.width * 0.59,
                    // color: Color.fromRGBO(255, 255, 255, 0.9),
                    // colorBlendMode: BlendMode.modulate),
                  ),
                )
              ]),
            ),
          ]),
        ));
  }
}
