

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/userregister.dart';


class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(


        body:  Container(
            height: 400,

            child:Padding(
                padding:const EdgeInsets.all(20),
                child: GridView(

                  children: [

                    GestureDetector(
                      onTap: () {
                   //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Shopownerregister()));
                      },

                      child:  Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color:Color(0xFF387B74),),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/entrepreneur.png",height: 100,),
                            Text("ShopOwner",style: TextStyle(color: Colors.white,fontSize: 30),)
                          ],
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Userregister()));
                      },
                      child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color:Color(0xFF387B74),),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/user.png",height: 80,),
                            Text("User",style: TextStyle(color: Colors.white,fontSize: 30),)
                          ],
                        ),
                      ),
                    ),


                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                )
            )
        )
    );

  }
}
