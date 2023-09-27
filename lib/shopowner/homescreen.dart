

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/shopowner/productallview.dart';

import '../core/color.dart';
import '../core/space.dart';
import '../page/login.dart';
import 'addprdct.dart';

class Shopowner extends StatefulWidget {
  const Shopowner({Key? key}) : super(key: key);

  @override
  State<Shopowner> createState() => _ShopownerState();
}

class _ShopownerState extends State<Shopowner> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:Padding(
            padding:const EdgeInsets.all(20),
            child:
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey[300],
                    ),

                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
               Container(
                 height: 500,

               child:   GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: .65,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/download.jpg',
                                  height: 100,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('Manage Products',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Aproduct()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/products.jpg',
                                  height: 100,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('Products',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),







                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewfeedback()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/order.jpg',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('View Orders',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewfeedback()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/feedback.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('Status Updation',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),
                   ],
                  ),
               ),
                ],
              ),
            ),
          )







      ),

      appBar: AppBar(
        /*leading: IconButton(onPressed: () {

          }, icon: Icon(Icons.menu)),*/
        title: Text("HomePage"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Lubna Wahid"),
              accountEmail: Text("Lubnalubz5714@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "L",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),



            ListTile(
              leading: Icon(
                Icons.task,
              ),
              title: const Text('Complaint'),
              onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint_Details()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
              ),
              title: const Text('Feedback'),
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingBarScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },
            ),
          ],
        ),
      ),


    );
  }
}























