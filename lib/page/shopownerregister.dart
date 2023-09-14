import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/api.dart';
import 'login.dart';

class Shopownerregister extends StatefulWidget {
  const Shopownerregister({Key? key}) : super(key: key);

  @override
  State<Shopownerregister> createState() => _ShopownerregisterState();
}

class _ShopownerregisterState extends State<Shopownerregister> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController shopnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void registerShopowner() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      "shopname": shopnameController.text.trim(),
      "address": addressController.text.trim(),

      "email": emailcontroller.text.trim(),
      "phonenumber": phonenumberController.text,
      "place": placeController.text.trim(),
      "username": usernameController.text,
      "password": passwordController.text,
    };
    print("Shopowner data${data}");
    var res = await Api().authData(data,'/api/shopowner_register');
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter some text';
                    }
                    return null;
                  },
                  controller: shopnameController,
                  decoration: InputDecoration(
                    labelText: "shopname",
                    hintText: "Enter Your Shopname",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter some text';
                    }
                    return null;
                  },
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "address",
                    hintText: "Enter Your address",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
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
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: " email",
                      hintText: "email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter some text';
                    }
                    return null;
                  },
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: "place",
                    hintText: "Enter Your Place",
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Mobile Number";
                      }
                      RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

                      if (number.hasMatch(value)) {
                        return null;
                      } else {
                        return 'Invalid Mobile Number';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: phonenumberController,
                    decoration: InputDecoration(
                      labelText: " phone number",
                      hintText: "phone number",
                      prefixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )),

        Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter some text';
                }
                return null;
              },
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "username",
                hintText: "username",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              validator: (valuePass) {
                if (valuePass!.isEmpty) {
                  return 'Please enter your password';
                } else if (valuePass.length < 6) {
                  return 'Password is too short';
                } else {
                  return null;
                }
              },
              obscureText: _obscureText,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "password",
                hintText: "password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              validator: (valueConPass) {
                if (valueConPass!.isEmpty) {
                  return 'Please confirm your Password';
                } else if (valueConPass.length < 6) {
                  return 'Please check your password';
                } else if (valueConPass == passwordController) {
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
            )),


              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {

                  registerShopowner();
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
                      style: TextStyle(color:Color(0xFF387B74),fontSize: 16),
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
