import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/page/feedback.dart';
import 'package:furnicom/page/userprofile.dart';
import 'package:furnicom/shopowner/addprdct.dart';

import 'package:furnicom/shopowner/spitem.dart';

import '../core/color.dart';
import '../core/space.dart';
import '../core/textstyle.dart';
import '../data/model_data.dart';
import '../model/models.dart';
import '../services/api.dart';
import '../widgets/custom.dart';
import '../widgets/item.dart';
import '../widgets/tab.dart';
import 'custom.dart';

class SHomePage extends StatefulWidget {
  @override
  State<SHomePage> createState() => _SHomePageState();
}

class _SHomePageState extends State<SHomePage> {
  // List _loaddata=[];
  // late int id;
  // _fetchproductData() async {
  //   var res = await Api()
  //       .getData('/api/product_all_view');
  //   if (res.statusCode == 200) {
  //     var items = json.decode(res.body)['data'];
  //     print(items);
  //     setState(() {
  //       _loaddata = items;
  //     });
  //   } else {
  //     setState(() {
  //       _loaddata = [];
  //       Fluttertoast.showToast(
  //         msg: "Currently there is no data available",
  //         backgroundColor: Colors.grey,
  //       );
  //     }
  //     );
  //   }
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _fetchproductData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SCustomAppBar(),
            Text(
              'Furniture in\nunique style',
              style: heading,
            ),
            SpaceVH(height: 10),
            // Text(
            //   'We have wide rang of Furn',
            //   style: subHeading,
            // ),
            SpaceVH(height: 20),
            Container(
              height: 70.0,
              child: TabBarButton(

              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       physics: BouncingScrollPhysics(),
            //       itemCount: _loaddata.length,
            //       itemBuilder: (builder, index) {
            //         id = _loaddata[index]['id'];
            //
            //         return Card(
            //
            //           child:ListTile(
            //             leading: Image.network(
            //               Api().url + _loaddata[index]['images'],
            //
            //             ),
            //           )
            //         );
            //       }),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 100.0,
          color: green,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bottomNavButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SHomePage(),
                            ));
                      },
                      icon: Icons.home_outlined,
                    ),
                    SpaceVH(width: 60),
                    bottomNavButton(
                      onPress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => feedback(),
                        //     ));
                      },
                      icon: Icons.chat_outlined,
                    ),

                    SpaceVH(width: 60),
                    bottomNavButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Userprofile(),
                            ));
                      },
                      icon: Icons.person_outline_outlined,
                    ),
                    SpaceVH(width: 60),
                    bottomNavButton(
                      onPress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => feedback(),
                        //     ));
                      },
                      icon: Icons.notifications,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProduct(),
              ));
        },
        backgroundColor: green, // Set the background color of the FAB.
        child: Icon(Icons.add), // Set the icon for the FAB.
      ),

    );

  }


  IconButton bottomNavButton(
      {required Function() onPress, required IconData icon}) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        size: 40,
        color: white,
      ),
    );
  }
}