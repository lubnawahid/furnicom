import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/page/details.dart';

import '../services/api.dart';

class CategoryDetails extends StatefulWidget {
  final int id;
  const CategoryDetails({required this.id});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  List _loaddata = [];
  late int id;

  _fetchCategoryData() async {
    var res = await Api()
        .getData('/api/category_product_view' +id.toString());
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
    _fetchCategoryData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _loaddata.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          id = _loaddata[index]['id'];
          return Card(
            child: ListTile(
              leading: Image.network(
                Api().url + _loaddata[index]['images'],
                width: 70, fit: BoxFit.fill,
              ),
              title: Column(
                children: [
                  Text(_loaddata[index]['productname'], style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Rs:" + _loaddata[index]['price'],
                      style: TextStyle(fontSize: 15))
                ],
              ),
              trailing: ElevatedButton(
                onPressed: (){
                //   Navigator.of(context).push(
                //     MaterialPageRoute(builder:(context) => DetailsPage(id: id),
                //     ),
                //   );
                },
                child: Text('select'),
              ),
            ),
          );
        },
      ),
    );
  }
}

