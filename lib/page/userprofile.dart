//
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';



class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF387B74),
        title: Text("Profile"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            tooltip: "Logout",
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },
            icon: Icon(
              Icons.logout,
              size: 28,
            ),
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/user.png"),
                          )
                      ),
                    ),



                  ],
                ),
              ),
              SizedBox(height: 60,),
              // buildTextField("Name",nameController),
              // // buildTextField("Agency name",agencynameController),
              // buildTextField("collegename",collegenameController),
              // buildTextField("Phone number", phonenumberController),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(

                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Name",

                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(

                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      labelText: "phone number",
                      hintText: "phone number",

                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              SizedBox(height: 70,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Userprofile()));
                    },
                    child: Text("CANCEL",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){
                    },
                    child: Text("EDIT",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF387B74),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget buildTextField(String labelText,TextEditingController controller){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: controller,
        //obscureText: isPasswordTextField ? isObscurePassword: false,
        decoration: InputDecoration(
          // suffixIcon: isPasswordTextField ?
          //     IconButton(
          //         onPressed: () {
          //           setState(() {
          //             isObscurePassword=!isObscurePassword;
          //           });
          //         },
          //         icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
          //     ):null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 18,color: Colors.blue),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // hintText: controller,
          // hintStyle: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.grey
          // )

        ),
      ),
    );
  }

  static ClassNotify() {}
}





