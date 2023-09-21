

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnicom/shopowner/homescreen.dart';
import 'package:furnicom/shopowner/productallview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../services/api.dart';


class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? imageFile;
  late final _filename;
  late final bytes;
  late SharedPreferences prefs;
  TextEditingController productnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  Future<void> submitForm(String Productname, String Description, String Price,
      String Quantity, String images) async {
    prefs = await SharedPreferences.getInstance();
    var shopowner = (prefs.getInt('shopowner') ?? 0);

    var uri =
    Uri.parse(Api().url + '/api/product'); // Replace with your API endpoint

    var request = http.MultipartRequest('POST', uri);

    //request.fields['shopowner'] = shopowner.toString();
    request.fields['productname'] = Productname;
    request.fields['description'] = Description;
    request.fields['price'] = Price;
    request.fields['quantity'] = Quantity;

    request.fields['images'] = images;

    print(request.fields);
    final imageStream = http.ByteStream(imageFile!.openRead());
    final imageLength = await imageFile!.length();

    final multipartFile = await http.MultipartFile(
      'images', imageStream, imageLength,
      filename: _filename,
// contentType: MediaType('image', 'jpeg'), // Replace with your desired image type
    );
    request.files.add(multipartFile);

    final response = await request.send();
    print(response);

    if (response.statusCode == 201) {
      print('Form submitted successfully');
       Navigator.push(this.context, MaterialPageRoute(builder: (context) => Aproduct()));
    }
    else {
      print('Error submitting form. Status code: ${response.statusCode}');
    }
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text("Choose From"),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      _getFromGallery();

                      Navigator.pop(context);
                    },
                    child: Text("Gallery")),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      _getFromCamera();

                      Navigator.pop(context);
                    },
                    child: Text("camera")),
              ],
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
      setState(() {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Add Product",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              // Image.asset(
              //   "Images/AddProducts.jpg",
              //   width: 540.0,
              //   height: 350.0,
              //   fit: BoxFit.fill,
              // ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: productnameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }

// Return null if the entered password is valid
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Color(0xFF387B74),
                        prefixIconColor:Color(0xFF387B74),
                        prefixIcon: Icon(Icons.person),
                        label: Text("Product name "),
// hintText: "Enter your Username",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Color(0xFF387B74),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }

// Return null if the entered password is valid
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIconColor: Color(0xFF387B74),
                      prefixIcon: Icon(Icons.production_quantity_limits),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color:Color(0xFF387B74))),
                      label: Text("description"),
//hintText: "Enter your Age",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: priceController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }

// Return null if the entered password is valid
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIconColor: Color(0xFF387B74),
                      prefixIcon: Icon(Icons.production_quantity_limits),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color:Color(0xFF387B74))),
                      label: Text("Price"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: quantityController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }

// Return null if the entered password is valid
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIconColor: Color(0xFF387B74),
                        prefixIcon: const Icon(Icons.high_quality),
                        label: const Text("quantity"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color:Color(0xFF387B74))))),
              ),

              Container(
                child: imageFile == null
                    ? Container(
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _getFromGallery();
                          _showChoiceDialog(context);
                        },
                        child: Text("Upload Image"),
                      ),
                      Container(
                        height: 40.0,
                      ),
                    ],
                  ),
                )
                    : Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Image.file(
                        imageFile!,
                        width: 100,
                        height: 100,
//  fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
//    _getFromGallery();
                        _showChoiceDialog(context);
                      },
                      child: Text("Upload Image"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  submitForm(
                      productnameController.text,
                      descriptionController.text,
                      priceController.text,
                      quantityController.text,

                      _filename);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                    primary: Color(0xFF387B74),
                    fixedSize: Size(350, 57)),
                child: const Text("Add Product",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
