import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/feedback%202.dart';




class Addfeedback extends StatefulWidget {
  const Addfeedback({Key? key}) : super(key: key);

  @override
  State<Addfeedback> createState() => _AddfeedbackState();
}

class _AddfeedbackState extends State<Addfeedback> {

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF387B74),
        title: Text('Add feedback'),
      ),

      body:  SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: size.height*.35,
            //   child:
            //   Image.asset('Images/img_14.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,top: 20),
                child: Container(
                    height: 350.0,
                    child: Stack(
                        children: [
                          TextField(
                          //  controller: feedbackController,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: 'Please Explain breifly about your Product',
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),

                            ),
                          ),
                        ]
                    )
                )
            ),

            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedback3()));
                  },
                  child: Text('Submit',style: TextStyle(fontSize: 19),),
                  style: ElevatedButton.styleFrom(fixedSize: Size(230, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Color(0xFF387B74)),
                ),
              ),

            )],
        ),

      ),
    );
  }
}
