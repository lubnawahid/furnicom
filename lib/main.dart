import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/home.dart';
import 'package:furnicom/page/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF387B74, <int, Color>{
          50: Color(0xFF387B74),
          100: Color(0xFF387B74),
          200: Color(0xFF387B74),
          300: Color(0xFF387B74),
          400: Color(0xFF387B74),
          500: Color(0xFF387B74),
          600: Color(0xFF387B74),
          700: Color(0xFF387B74),
          800: Color(0xFF387B74),
          900: Color(0xFF387B74),
        }),
      ),
    );
  }
}