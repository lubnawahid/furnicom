import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';



class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome Page'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                'images/modern-living-room-interior-design.jpg',
                width: 350.0,
                height: 530.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              ' A hearty welcome to you!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF387B74),
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
