import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/page/feedback.dart';
import 'package:furnicom/page/userprofile.dart';

import '../core/color.dart';
import '../core/space.dart';
import '../core/textstyle.dart';
import '../data/model_data.dart';
import '../model/models.dart';
import '../services/api.dart';
import '../widgets/custom.dart';
import '../widgets/item.dart';
import '../widgets/tab.dart';
import 'categorydetails.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _loaddata=[];
  late int id;
  _fetchData() async {
    var res = await Api()
        .getData('/api/category_all_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);

        _loaddata = items;

    } else {

        _loaddata = [];
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,


      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

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
CustomAppBar(),
            Text(
              'Furniture in\nunique style',
              style: heading,
            ),
            SpaceVH(height: 10),
            Text(
              'We have wide rang of Furniture',
              style: subHeading,
            ),
            SpaceVH(height: 110),

            Expanded(
              child: FutureBuilder(
                future: _fetchData(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: _loaddata.length,
                      itemBuilder: (BuildContext ctx, index) {
                        id = _loaddata[index]['id'];
                        // print("res$id");
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails()),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                Api().url + _loaddata[index]['images'],

                                fit: BoxFit.cover,
                                height: 90, // Adjust the height as needed
                              ),
                              SizedBox(height: 8),
                              Text(
                                _loaddata[index]['categoryname'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );



                  }
                },
              ),
            ),
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
                              builder: (context) => HomePage(),
                            ));
                      },
                      icon: Icons.home_outlined,
                    ),
                    SpaceVH(width: 60),
                    bottomNavButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => feedback(),
                            ));
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