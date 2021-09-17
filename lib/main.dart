import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
import 'package:spotify_pay_flutter/pages/Home.dart';

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
      home: Home(),
    );
  }
}
