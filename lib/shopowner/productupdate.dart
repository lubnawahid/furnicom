import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/shopowner/productallview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api.dart';
import 'package:http/http.dart' as http;
class ProductUpdate extends StatefulWidget {
  final int id;

  ProductUpdate({required this.id});

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {
  List _loaddata = [];

  _fetchData() async {
    var res = await Api().getData('/api/category_all_view');
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
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
    _viewPro();
  }

  late int id;
  String productname = '';
  String description = '';
  String quantity = '';
  String price= '';
  // String category = '';

  late SharedPreferences prefs;
  TextEditingController productnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();


  int currentTab = 2;
  Future<void> _viewPro() async {
    int id = widget.id;
    var res = await Api().getData('/api/product_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      productname = body['data']['productname'];
      description = body['data']['description'];
      price = body['data']['price'];
      quantity = body['data']['quantity'];


      productnameController.text = productname;
      descriptionController.text = description;
      priceController.text = price;
      quantityController.text = quantity;

    });
  }

  // Initial Selected Value
  Future<void> _update(String productname, String description, String price,
      String quantity) async {
    int id = widget.id;

    prefs = await SharedPreferences.getInstance();

    var uri = Uri.parse(Api().url +'/api/product_update/'+id.toString()); // Replace with your API endpoint

    // var http;
    var request = http.MultipartRequest('PUT', uri);
    request.fields['productname'] = productname;
    request.fields['description'] = description;
    request.fields['price'] = price;
    request.fields['quantity'] = quantity;
    // request.fields['category'] = category;


    print(request.fields);



    final response = await request.send();

    if (response.statusCode == 200) {
      print('Product Updated successfully');
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => Aproduct()));
    } else {
      print('Error Updating event. Status code: ${response.statusCode}');
    }
  }

  _deleteData(int id) async {
    var res = await Api().deleteData('/api/product_delete/' + id.toString());
    if (res.statusCode == 200) {
      setState(() {
        Navigator.pushReplacement(context as BuildContext,
            MaterialPageRoute(builder: (context) => Aproduct()));
        Fluttertoast.showToast(
          msg: "Product Deleted Successfully",
          backgroundColor: Colors.grey,
        );
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  // var dropdownvalue;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        title: Text('Add product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: productnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: SizedBox(
            //     width: double.maxFinite,
            //     child: DropdownButtonFormField<String>(
            //         decoration: InputDecoration(
            //           disabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(5)),
            //           enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(5)),
            //         ),
            //         hint: Text('Categories'),
            //         value: dropdownvalue,
            //         items: _loaddata
            //             .map((type) => DropdownMenuItem<String>(
            //                   value: type['id'].toString(),
            //                   child: Text(
            //                     type['categoryname'].toString(),
            //                     style: TextStyle(color: Colors.black),
            //                   ),
            //                 ))
            //             .toList(),
            //         onChanged: (type) {
            //           setState(() {
            //             dropdownvalue = type!;
            //           });
            //         }),
            //   ),
            // ),
            SizedBox(
              height: 70,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // print(dropdownvalue);
                      _update(
                          productnameController.text,
                          descriptionController.text,
                          priceController.text,
                          quantityController.text

                          // dropdownvalue
                          );
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary:Color(0xFF387B74),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 25,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _deleteData(widget.id);
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF387B74),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 25,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
