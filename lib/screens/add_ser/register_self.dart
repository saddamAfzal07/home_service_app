import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/screens/components/user_id.dart';
import 'package:final_year_project/screens/dashboard_screen/dashboard.dart';
import 'package:final_year_project/screens/home_screen/homescreen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

class RegisterService extends StatefulWidget {
  String service;
  RegisterService({Key? key, required this.service}) : super(key: key);

  @override
  State<RegisterService> createState() => _RegisterServiceState();
}

class _RegisterServiceState extends State<RegisterService> {
  TextEditingController name = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();

  // Auth controller = Get.put(Auth());
  final _formKey = GlobalKey<FormState>();
  submit() {
    final isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      if (image != null) {
        profilesubmit(shopname.text);
        // controller.uploadFile(image!.path);
        // controller.profilesubmit(image!.path, firstname.text, lasttname.text,
        //     phoneno.text, selecteddate, _initialPaymentOption);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Image must be selected"),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
        ));
      }

      // controller.saveProfile(firstname.text, lasttname.text, phoneno.text,
      //     selecteddate, _initialPaymentOption);
    } else {}
  }

  File? image;
  bool isimagepick = false;
  final _picker = ImagePicker();
  Future getimage() async {
    final pickedfile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      setState(() {
        image = File(pickedfile.path);
        isimagepick = true;
        print(image);
      });
    } else {
      print("Not any image is selected");
    }
  }

  profilesubmit(String addressname) async {
    var pathimage = image!.path;
    var temp = pathimage.lastIndexOf("/");
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref = FirebaseStorage.instance.ref("Services").child(result);
    var response = await ref.putFile(image!);
    print("updaated $response");
    var imageurl = await ref.getDownloadURL();
    //For Search method
    List<String> splitlist = addressname.split(' ');
    List<String> indexlist = [];
    for (int i = 0; i < splitlist.length; i++) {
      for (int j = 0; j < splitlist[i].length +i; j++) {

        indexlist.add(splitlist[i].substring(0, j).toLowerCase());
      }
    }

    try {
      var response =
          await FirebaseFirestore.instance.collection(widget.service).add({
        'name': name.text,
        'shopname': addressname,
        'searchlist': indexlist,
        "experience": experience.text,
        "phoneNo": phone.text,
        "user_image": imageurl,
        "user_id": Userdata.userId,
        "priceperhour": price.text,
      });
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Added Successfully"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(),
        ),
        (route) => false,
      );

      // snackbar(
      //   "Successfully Submit",
      //   "",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      print("Firebase response1111 ${response.id}");
      print("Done Susscessfullt");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3c83f1),
        title: Text(widget.service),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            margin: EdgeInsets.all(22),
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              getimage();
                            },
                            child: Container(
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: image == null
                                  ? Image.asset("assets/images/user.png",
                                      fit: BoxFit.contain)
                                  : ClipOval(
                                      child: Image.file(
                                        File(image!.path).absolute,
                                        // height: 100,
                                        // width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -0,
                            child: InkWell(
                              onTap: () {
                                getimage();
                              },
                              child: Icon(
                                Icons.camera_alt,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,
                        validator:
                            RequiredValidator(errorText: "Name is required"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          prefix: SizedBox(
                            width: 10,
                          ),
                          labelText: "Name",
                          hintText: "Enter Name",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: shopname,
                        validator:
                            RequiredValidator(errorText: "Address is required"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          prefix: SizedBox(
                            width: 10,
                          ),
                          labelText: "Address",
                          hintText: "Enter Address",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: experience,
                        keyboardType: TextInputType.phone,
                        validator: RequiredValidator(
                            errorText: "Experience is required"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefix: SizedBox(
                            width: 10,
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Experience",
                          hintText: "Enter your Experience",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: price,
                        keyboardType: TextInputType.phone,
                        validator:
                            RequiredValidator(errorText: "Price required"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefix: SizedBox(
                            width: 10,
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Price Per hour",
                          hintText: "Enter Price Per hour",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        validator: RequiredValidator(
                            errorText: "Phone no is required"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefix: SizedBox(
                            width: 10,
                          ),
                          border: OutlineInputBorder(),
                          labelText: "Mobile no",
                          hintText: "Enter Mobile no",
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Colors.white,
                            backgroundColor: Color(0xFF4167b2),
                          ),
                          onPressed: () {
                            submit();
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
