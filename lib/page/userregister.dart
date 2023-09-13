import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api.dart';
import 'login.dart';

class Userregister extends StatefulWidget {
  const Userregister({Key? key}) : super(key: key);

  @override
  State<Userregister> createState() => _UserregisterState();
}

class _UserregisterState extends State<Userregister> {
  bool _isLoading=false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController nameController =TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void registerUser()async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "name": nameController.text.trim(),
      "address": addressController.text.trim(),
      "pincode":pincodeController.text,

      "email": emailController.text.trim(),
      "phonenumber": phonenumberController.text,

      "place": placeController.text.trim(),

      "username": usernameController.text,
      "password": passwordController.text,
    };
    print("user data${data}");
    var res = await Api().authData(data,'/api/user_register');
    var body = json.decode(res.body);
    print('body${body}');
    if(body['success']==true)
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Color(0xFF387B74),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "REGISTER HERE!",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'please enter some text';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "name",
                    hintText: "Enter Your Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child:TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: addressController,
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
                  child:TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: pincodeController,
                    decoration: InputDecoration(
                      labelText: "pincode",
                      hintText: "Enter Your Pncode",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: placeController,
                    decoration: InputDecoration(
                      labelText: "place",
                      hintText: "Enter Your Place",
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return 'please enter some text';
                      }
                      return null;
                    },
                    controller: usernameController,
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
                    validator: (valuePass) {
                      if(valuePass!.isEmpty){
                        return 'Please enter your password';
                      }
                      else if(valuePass.length<6){
                        return 'Password is too short';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    obscureText: _obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
              ),
              Card(

                  margin: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (valueConPass){
                      if (valueConPass!.isEmpty){
                        return 'Please confirm your Password';
                      }
                      else if (valueConPass.length<6){
                        return 'Please check your password';

                      }
                      else if (valueConPass == passwordController){
                        return null;
                      }
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "confirm password",
                      hintText: "confirm password",

                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (valueMail) {
                      if (valueMail!.isEmpty) {
                        return 'Please enter Email Id';
                      }

                      RegExp email = new RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (email.hasMatch(valueMail)) {
                        return null;
                      } else {
                        return 'Invalid Email Id';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "email",
                      hintText: "email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return "Please enter Mobile Number";

                      }
                      RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                      if (number.hasMatch(value)) {
                        return null;
                      }
                      else {
                        return 'Invalid Mobile Number';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: phonenumberController,
                    decoration: InputDecoration(
                      labelText: "phone number",
                      hintText: "phone number",
                      labelStyle: TextStyle(fontSize: 15,color: Colors.black),
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),



              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  registerUser();
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