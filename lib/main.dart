import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/home.dart';
import 'package:furnicom/page/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences  sharedp;
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 sharedp = await SharedPreferences.getInstance();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int pref = sharedp.getInt('login_id')??0;
  int userpref = sharedp.getInt('user_id') ??0;
  @override
  Widget build(BuildContext context) {
    print("login id $pref");
    print("user Id $userpref");
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:pref !=0 ? HomePage() : Welcome(),
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