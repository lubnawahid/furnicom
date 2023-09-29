
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/api.dart';
import 'details.dart';

class CategoryDetails extends StatefulWidget {
  int id;

  CategoryDetails({required this.id});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  List _loaddata=[];

  _fetchData() async {
    int id=widget.id;
    var res = await Api().getData('/api/category_product_view/'+id.toString());
    print(id);
    print(res.body);
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
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue,Color(0xFF387B74)],
            ),
          ),
        ),
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),
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
                            width: 90, fit: BoxFit.fill,
                          ),

                          title: Column(
                            children: [
                              Text(_loaddata[index]['productname'], style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),

                              SizedBox(height: 10,),
                              Text("Rs:" + _loaddata[index]['price'],
                                  style: TextStyle(fontSize: 20))
                            ],
                          ),


                          trailing:
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:Color(0xFF387B74),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(id:_loaddata[index]['id'])));
                            },
                            child: const Text('select'),
                          ),
                        )
                    ),
                  );

                }),
          ],
        ),
      ),

    );
  }
}