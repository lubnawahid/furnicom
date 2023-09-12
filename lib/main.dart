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
    );
  }
}