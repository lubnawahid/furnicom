import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/page/cart.dart';

import '../core/color.dart';

class SCustomAppBar extends StatefulWidget {
  const SCustomAppBar({Key? key}) : super(key: key);

  @override
  State<SCustomAppBar> createState() => _SCustomAppBarState();
}

class _SCustomAppBarState extends State<SCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      margin: EdgeInsets.only(top: 50.0),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.menu),

          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
          //   },
          //   splashColor: white,
          //   child: Container(
          //     height: 65.0,
          //     width: 50.0,
          //     decoration: BoxDecoration(
          //       color: green,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20.0),
          //         topRight: Radius.circular(10.0),
          //         bottomLeft: Radius.circular(20.0),
          //         bottomRight: Radius.circular(50.0),
          //       ),
          //     ),
          //     // child: Icon(
          //     //   Icons.shopping_cart_outlined,
          //     //   color: white,
          //     //
          //     // ),
          //
          //   ),
          // )
        ],
      ),

    );
  }
}