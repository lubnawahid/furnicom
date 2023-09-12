import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Shopownerregister extends StatefulWidget {
  const Shopownerregister({Key? key}) : super(key: key);

  @override
  State<Shopownerregister> createState() => _ShopownerregisterState();
}

class _ShopownerregisterState extends State<Shopownerregister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
        backgroundColor: Color(0xFF387B74),
      ),

      body: SingleChildScrollView(
        child: Form(

          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "REGISTER HERE!",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(


                  decoration: InputDecoration(
                    labelText: "Shop Name",
                    hintText: "Enter Your Shop Name",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child:TextFormField(


                    decoration: InputDecoration(
                      labelText: "address",
                      hintText: "Enter Your Address",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "email",
                      hintText: "Enter Your Email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "place",
                      hintText: "Enter Your Place",
                      prefixIcon: Icon(Icons.location_on),
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

              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "username",
                      hintText: "Enter Your Username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      labelText: "password",
                      hintText: "Enter Your Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),

              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    primary: Color(0xFF387B74),
                    fixedSize: Size(300, 50)),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: const Text(
                      'login',
                      style: TextStyle(color: Color(0xFF387B74), fontSize: 16),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}