import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Qr extends StatefulWidget {
  Qr(
      {Key? key,
      required this.title,
      required this.price,
      required this.imgPath})
      : super(key: key);
  final String title;
  final String price;
  final String imgPath;
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  bool pressCopy = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color(0xFFF002232),
          elevation: 0),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        width: size.width,
        color: Color(0xFFF002232),
        child: Column(
          children: [
            Container(
                height: size.height * .5,
                width: size.width * .75,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      '${widget.imgPath}',
                      scale: 1.9,
                      fit: BoxFit.none,
                    ),
                    Positioned(
                        left: 20,
                        bottom: 0,
                        child: Text(
                          "ราคา",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Positioned(
                        right: 20,
                        bottom: 0,
                        child: Text(
                          "${widget.price} บาท",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
            Expanded(
                child: SizedBox(
              height: 1,
            )),
            Container(
              height: size.width * .35,
              width: size.width * .75,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       "พร้อมเพย์",
                  //     ),
                  //   ],
                  // ),
                  // Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      pressCopy
                          ? Text("คัดลอกเรียบร้อย",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                          : Text("094-093-2105",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: "0940932105"));
                            setState(() {
                              pressCopy = true;
                            });
                          },
                          child: const Text('คัดลอกหมายเลข'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 1,
            )),
          ],
        ),
      ),
    );
  }
}
