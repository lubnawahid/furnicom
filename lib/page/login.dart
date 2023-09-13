


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/homescreen.dart';
import 'package:furnicom/page/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'home.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true;
  void _togglePasswordVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  String user="user";
  String sp="shopowner";
  String role="";
  String status ="";
  String ststatus="1";
  bool _isLoading = false;
  late SharedPreferences localStorage;


  TextEditingController userController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'username': userController.text.trim(), //username for email
      'password': pwdController.text.trim()
    };
    // print("data${data}");
    var res = await Api().authData(data, '/api/login');
    var body = json.decode(res.body);
    //print(body);
    if (body['success'] == true) {
      print(body);

      role = body['data']['role'];
      status = body['data']['l_status'];
      print("status${status}");
      print("ststatus${ststatus}");
      print("user${user}");
      print("shopowner${sp}");

      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('role', role.toString());
      localStorage.setInt('login_id', body['data']['login_id']);
      localStorage.setInt('user_id', body['data']['user_id']);

      print('login_id ${body['data']['login_id']}');
      print('user_id ${body['data']['user_id']}');





      if (user == role ) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      else if (sp == role &&
          ststatus == status
      ) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Shomescreen()));


      }



      else {
        Fluttertoast.showToast(
          msg: "Please wait for admin approval",
          backgroundColor: Colors.grey,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome Page'),
      //   centerTitle: true,
      // ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Image.asset(
                    'images/shot-empty-armchair-with-flower-pot.jpg',
                    width: 350.0,
                    height: 300.0,
                  ),


                  Align(alignment: Alignment.center,
                    child: Text('welcome back!',style: TextStyle(color:Colors.black,fontSize: 17),textAlign: TextAlign.center,),

                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: userController,
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.person),
                        labelText: "username",
                        hintText: "username",
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                      ),


                    ),
                  ),SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: pwdController,

                      obscureText: _obscureText,
                      decoration: InputDecoration(

                        prefixIcon: Icon(Icons.lock),
                        labelText: "password",



                        border:
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        suffixIcon:IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => fpassword()));
                  },
                    child:Text("Forgot Password?",style: TextStyle(color:Color(0xFF387B74),fontSize: 14),),


                  ),
                  ElevatedButton(
                    child: Text("Login",style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      _pressLoginButton();
                    },
                    // if (pwdController.text == user) {
                    //  Navigator.push(
                    //  context, MaterialPageRoute(builder: (context) => homescreen()));
                    // } else if (pwdController.text == ta) {
                    // Navigator.push(
                    //   context,
                    // MaterialPageRoute(builder: (context) => agencyhomescreen()));
                    // }else{
                    //  print("error");
                    //  }
                    // },
                    style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary:Color(0xFF387B74),fixedSize: Size(300, 50)),

                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      const Text('Does not have an account?',style:TextStyle(fontSize: 16),),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                      },
                        child: const Text('Register Here',style: TextStyle(color:Color(0xFF387B74),fontSize: 16),),
                      ),

                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),



                ],

    )

    ),
    )
    );
  }
}

