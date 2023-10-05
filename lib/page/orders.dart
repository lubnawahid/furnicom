import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List _loaddata = [];
  late SharedPreferences prefs;
  bool isLoading = false;
  late String Statusdata = "not delivered";
  late String orderstts = "";


  _fetchOrder() async {

    prefs = await SharedPreferences.getInstance();
    int? user = prefs.getInt('user_id');
    print(user);

    var res = await Api()
        .getData('/api/order_single_view/'+user.toString());
    if (res.statusCode == 200) {
      var body = json.decode(res.body);

      var items = json.decode(res.body)['data'];
      print("order Items${items}");
      setState(() {
        _loaddata = items;
      });
    } else {
      _loaddata = [];
      Fluttertoast.showToast(
        msg:"Currently there is no data available",
        backgroundColor: Colors.grey,
      );
    }

  }


  _approveData(int id, String orderstts) async {
    print("items${id}");
    var res = await Api().postData('/api/order_status/' + id.toString());

    print("resssssss${json.decode(res.body)}");

    if (res.statusCode == 200) {
      //var items = json.decode(res.body);
      //print("resssssss${items.data}");

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cartitemsample()));
      Fluttertoast.showToast(
        msg: "status updated succesfully",
        backgroundColor: Colors.grey,
      );
    } else {
      // cart = [];
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


    _fetchOrder();
  }


  String extractFirstThreeWords(String sentence) {
    RegExp regex = RegExp(r'^(\w+\s){0,2}\w+');
    Match match = regex.firstMatch(sentence) as Match;
    return match?.group(0) ?? '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.greenAccent,

          title: Text("My orders"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Color(0xFF387B74)],
              ),
            ),
          ),
        ),
        body:

        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(

              shrinkWrap: true,
              itemCount:_loaddata.length,
              itemBuilder: (BuildContext context, int index){
                int id=_loaddata[index]['id'];

                return Card(
                    margin: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 250,
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [

                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,

                                child: Image(image: NetworkImage(Api().url+ _loaddata[index]['images'])),
                              ),

                              Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Text(_loaddata[index]['productname'].toString(),style: TextStyle(fontSize: 20)),
                                  SizedBox(height: 8,),

                                  Text("Rs "+_loaddata[index]['total_price'].toString(),style: TextStyle(fontSize: 20)),
                                  SizedBox(height: 8,),

                                  ElevatedButton(
                                    onPressed: () async {
                                      await _approveData(
                                          _loaddata[index]['id'],
                                          orderstts);
                                      print('completed');
                                      _fetchOrder();
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    child: _loaddata[index]
                                    ['order_status'] ==
                                        "0"
                                        ? Text("Not delivered",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.red))
                                        : Text("Delivered",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.green)),
                                  )

                                ],
                              ),
                            ],
                          ),




                        ],
                      ),
                    )
                );

              }
          ),
        )
    );
  }
}
