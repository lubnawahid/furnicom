import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furnicom/shopowner/productallview.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/api.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late SharedPreferences prefs;
  List _loaddata=[];

  _fetchData() async {
    var res = await Api()
        .getData('/api/category_all_view');
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
  bool _isLoading=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController quantController=TextEditingController();
  TextEditingController descController=TextEditingController();
  TextEditingController amountController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var dropdownvalue ;


  File? imageFile;

  late  final _filename;
  late  final bytes;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose from"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.pop(context);
                      //  _openGallery(context);
                    },
                  ),
                  SizedBox(height: 10),
                  const Padding(padding: EdgeInsets.all(0.0)),
                  GestureDetector(
                    child: const Text("Camera"),
                    onTap: () {
                      _getFromCamera();

                      Navigator.pop(context);
                      //   _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(()  {

        imageFile = File(pickedFile.path);
        _filename = basename(imageFile!.path);
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
        print("imageFile:${imageFile}");
        print(_filename);
        print(_nameWithoutExtension);
        print(_extenion);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        //  _filename = basename(imageFile!.path).toString();
        final _nameWithoutExtension = basenameWithoutExtension(imageFile!.path);
        final _extenion = extension(imageFile!.path);
      });
    }
  }
  Future<void> submitForm(
      {String ? name,
        String? desc,
        String? quant,
        String? amount,
        String? image,
        String? categ}) async {
    var uri = Uri.parse(Api().url+ '/api/add_products');

    prefs = await SharedPreferences.getInstance();
    var request = http.MultipartRequest('POST', uri);
    Map<String,String> headers={

      "Content-type": "multipart/form-data"
    };
    request.files.add(await
    http.MultipartFile.fromPath(
        'images',imageFile!.path


    ),
    );
    request.headers.addAll(headers);
    print('res');


    request.fields.addAll({
      'productname': name!,
      'description': desc!,
      'price': amount!,
      'category': categ!,
      'quantity' :quant!,


    });


    //headers:{ "Content-Type":"multipart/form-data" } ,
// final imageFile=await _imageFile!.readAsBytes();
// final imageUpload=http.MultipartFile.fromBytes('image', imageFile,filename: '')

    // request.fields['servicename'] = name;
    // request.fields['description'] = description;
    // request.fields['price'] = amount;
    // request.fields['category'] = categ;
    //
    //
    //
    // print(request.fields);
    // final imageStream = http.ByteStream(imageFile!.openRead());
    // final imageLength = await imageFile!.length();
    //
    // final multipartFile =  http.MultipartFile(
    //   'images',imageStream,imageLength,
    //   filename: _filename ,
    //
    // );
    // request.addAll(multipartFile);
    // print(_filename);
    //
    // final response = await request.send();
    print("request: "+request.toString());
    var res = await request.send();

    print("This is response:"+res.toString());


    // var response;
    if (res.statusCode == 201) {
      print('Form submitted successfully');
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => Aproduct()));
    } else {
      print('Error submitting form. Status code: ${res.statusCode}');
    }
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
        IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,)),
        title: Text('Add product'),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Product Name',

                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Product Price',

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: descController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: ' Description',

                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: quantController,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: ' quantity',

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)) ,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    hint: Text('Categories'),
                    value: dropdownvalue,
                    items: _loaddata
                        .map((type) => DropdownMenuItem<String>(
                      value: type['id'].toString(),
                      child: Text(
                        type['categoryname'].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
                        .toList(),
                    onChanged: (type) {
                      setState(() {
                        dropdownvalue = type!;
                      });
                    }),
              ),
            ),
            SizedBox(height: 20,),
            Container(

              child: imageFile == null
                  ? Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF387B74),
                      ),
                      onPressed: () {
                        //    _getFromGallery();
                        _showChoiceDialog(context);
                      },
                      child: Text("Upload Image"),
                    ),
                    Container(
                      height: 40.0,
                    ),

                  ],
                ),
              ): Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.file(
                      imageFile!,
                      width: 100,
                      height: 100,
                      //  fit: BoxFit.cover,
                    ),
                  ), ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF387B74),
                    ),
                    onPressed: () {
                      //    _getFromGallery();
                      _showChoiceDialog(context);
                    },
                    child: Text("Upload Image"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 40,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF387B74),
                ),
                child: const Text('Submit',style: TextStyle(fontSize: 18),),
                onPressed: () {

                  submitForm(
                      name: nameController.text,desc: descController.text,quant:quantController.text,amount: amountController.text,image: _filename,categ: dropdownvalue);
                },
              ),
            ),

          ],
        ),
      ),

    );
  }

}