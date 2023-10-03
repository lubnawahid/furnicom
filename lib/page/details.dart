import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/page/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/color.dart';
import '../core/space.dart';
import '../core/textstyle.dart';
import '../model/models.dart';
import '../services/api.dart';

class DetailsPage extends StatefulWidget {
final int id;
  DetailsPage({required this.id});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isLoading = false;
  late int productid;
  late int id, cid;
  late SharedPreferences localStorage;
  TextEditingController productnameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String productname='';
  String price='';
  String description='';
String images='';
  int selectIndex = 0;
  int qty = 1;

  Future<void> _viewPro() async {
    int id = widget.id;
    var res = await Api().getData('/api/product_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {

      productname = body['data']['productname'];
      productid =body['data']['id'];
      price = body['data']['price'];
      description = body['data']['description'];
      images=body['data']['images'];
      productnameController.text = productname;

      descriptionController.text=description;
      priceController.text = price;


    });
  }

  Future AddCart() async {
    var prefs = await SharedPreferences.getInstance();
    id = (prefs.getInt('user_id') ?? 0);
    print('id ${id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user": id.toString(),
      "product": productid.toString(),
      "quantity": "1",
      // "artist": id.toString(),
    };
//   print(data);
    var res = await Api().authData(data, '/api/cart');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      //   print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

       Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>Cart()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: black,
          ),
        ),
        centerTitle: true,
        title: Text(
        ''
         // style: itemCardHeading,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: black),


          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height / 1.7,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: height / 10.0,
                  child: Container(
                    width: 60.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.3),
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    // child: InkWell(
                    //   onTap: () {
                    //     setState(() {
                    //
                    //     });
                    //   },
                    // //   child: Container(
                    // //     height: 400,
                    // //     width: 400,
                    // //     margin: EdgeInsets.symmetric(vertical: 5.0),
                    // //     child: Image.network(Api().url+images,
                    // //       width: height/2.8,
                    // //       fit: BoxFit.cover,
                    // //   ),
                    // // )
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.
                      network(Api().url+images,
                      fit: BoxFit.cover,
                      width: height / 1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     ''
                     // style: heading.copyWith(fontSize: 28.0),
                    ),

                  ],
                ),
                SpaceVH(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                productname,
                  style: Heading,
                ),
          ],
                ),

                    SpaceVH(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  description,
                  style: itemCardDes,
                ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: gray,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            MaterialButton(
                              minWidth: 10,
                              onPressed: () {
                                setState(() {
                                  qty++;
                                });
                              },
                              child: Text(
                                '+',
                                style:
                                itemCardHeading.copyWith(color: lightBlack),
                              ),
                            ),
                            Text(
                              '$qty',
                              style:
                              itemCardHeading.copyWith(color: lightBlack),
                            ),
                            MaterialButton(
                              minWidth: 10,
                              onPressed: () {
                                if (qty > 1)
                                  setState(() {
                                    qty--;
                                  });
                              },
                              child: Text(
                                '-',
                                style:
                                itemCardHeading.copyWith(color: lightBlack),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
                ),
                SpaceVH(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [

                        TextSpan(
                          text: 'Price:'+price,
                          style: subHeading,
                        ),

                      ]),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: itemCardHeading.copyWith(color: white),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                     AddCart();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF387B74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: itemCardHeading.copyWith(color: white),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}