import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/shopowner/productupdate.dart';

import '../services/api.dart';

class Aproduct extends StatefulWidget {
  const Aproduct({Key? key}) : super(key: key);

  @override
  State<Aproduct> createState() => _AproductState();
}

class _AproductState extends State<Aproduct> {

  List _loaddata=[];

  _fetchData() async {
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
          msg:"Currently there is no data available",
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Color(0xFF387B74)],
            ),
          ),
        ),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },
            icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Products"),
        actions:[
          // IconButton(icon: Icon(Icons.add), onPressed: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => Aaddproducts()));
          //},
          // )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount:_loaddata.length,
                shrinkWrap: true,
                itemBuilder: (context, index)
                {
                  int id= _loaddata[index]['id'];
                  return GestureDetector(
                    onTap: () => {

                    },
                    child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(),
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
                              Text(_loaddata[index]['description'],

                                  style: TextStyle(fontSize: 15)),
                              SizedBox(height: 10,),
                              Text("Rs:" + _loaddata[index]['price'],
                                  style: TextStyle(fontSize: 15))
                            ],
                          ),

                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF387B74),
                            ),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ProductUpdate(id:id) ));
                            },
                            child: const Text('Update'),
                          ),
                      SizedBox(width: 8),

                  ],
                ),
                    ),
                  ),
                  );

                }

                ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatingActionButton(
      //   child:  Icon(Icons.add),
      //   backgroundColor: Colors.black,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => Aeventpage()));
      //
      //   },
      // ),
    );
  }
}