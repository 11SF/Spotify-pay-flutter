import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class Pay extends StatefulWidget {
  Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    GestureDetector pricePanel({int? month, int? price}) {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('$month เดือน')),
                Text('$price ฿')
              ],
            ),
          ),
        ),
      );
    }

    List<Widget> priceMenu = [
      pricePanel(month: 1, price: 35),
      pricePanel(month: 2, price: 70),
      pricePanel(month: 3, price: 105),
      pricePanel(month: 6, price: 210),
      pricePanel(month: 12, price: 420)
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("จ่ายเงิน"),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Container(
          color: Colors.green,
          child: Column(
            children: [
              Image(image: AssetImage('assets/pay_icon.png')),
              Expanded(
                  child: SizedBox(
                height: 1,
              )),
              Stack(children: [
                Image(image: AssetImage('pay_icon.png')),
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
                ),
              ])
            ],
          ),
        ));
  }
}
