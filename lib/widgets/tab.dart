import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/data/tab_bar.dart';

import '../core/color.dart';
import '../core/textstyle.dart';
import '../services/api.dart';

class TabBarButton extends StatefulWidget {

  const TabBarButton({Key? key}) : super(key: key);

  @override
  _TabBarButtonState createState() => _TabBarButtonState();
}

class _TabBarButtonState extends State<TabBarButton> {
  List _loaddata=[];
  late int id =0;
  _fetchProductData() async {
    var res = await Api()
        .getData('/api/product_all_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;
      });
    } else {
      setState(() {
        _loaddata = [];
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      }
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchProductData();
  }
  //nt id = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < tabBarMenu.length; i++)
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                id = tabBarMenu[i].id;
              });
            },
            child: Container(
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: id == i ? gray : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Text(
                  tabBarMenu[i].name,
                  style: id == i ? tabButtonS : tabButtonU,
                ),
              ),
            ),
          ),
      ],
    );
  }
}