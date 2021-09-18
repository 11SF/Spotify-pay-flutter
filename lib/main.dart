import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
import 'package:spotify_pay_flutter/pages/home_page.dart';
import 'package:spotify_pay_flutter/pages/main_page.dart';
import 'package:spotify_pay_flutter/pages/pay_page.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
