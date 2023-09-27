import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              colors: [Colors.blue, Colors.purple],
            ),
          ),
        ),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
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
                          leading: CircleAvatar(

                            backgroundColor: Colors.green,
                            backgroundImage:
                            NetworkImage(Api().url+_loaddata[index]['image']),

                          ) ,
                          title: Text(
                            _loaddata[index]['productname'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          trailing:
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),
                            onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => Aproductupdate(id:id) ));
                            },
                            child: const Text('Update'),
                          ),
                        )
                    ),
                  );

                }),
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