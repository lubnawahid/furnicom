import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/home.dart';



class Feedback3 extends StatefulWidget {
  const Feedback3({Key? key}) : super(key: key);

  @override
  State<Feedback3> createState() => _Feedback3State();
}

class _Feedback3State extends State<Feedback3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/tick.png",
                height: 600,
                width: 300,
                alignment: Alignment.center,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Thank you for your feedback",
                  textAlign: TextAlign.center, selectionColor: Color(0xFF387B74),),
              ),


              ElevatedButton(onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    primary: Color(0xFF387B74),
                    fixedSize: Size(200, 50)),
                child: Text("OK", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}