import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feedback1.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {


  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF387B74),
        title: Text('Feedback',),

      ),

      body: ListView.builder(
        shrinkWrap: true,
    //   itemCount: _loaddata.length,
        itemBuilder: (context,index){

          return Padding(
            padding: const EdgeInsets.only(top: 16,right: 12,left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    //  child: Icon(Icons.notifications_outlined,color: Colors.blue,size: 36,),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                         // Text(_loaddata[index]['feedback'],style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),

                        ],
                      ),
                    ),
                    SizedBox(width: 14,),

                   // Text(_loaddata[index]['date'],style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(height: 12,),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                )
              ],
            ),
          );
        },


      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Addfeedback()));

        },
        label: const Text('New'),
        icon: const Icon(Icons.add),
        backgroundColor:Color(0xFF387B74),
      ),

    );
  }
}
