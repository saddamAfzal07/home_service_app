import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/screens/add_ser/check/check_latlong.dart';
import 'package:final_year_project/screens/components/user_id.dart';
import 'package:final_year_project/screens/forget_password/forget_password.dart';
import 'package:final_year_project/screens/Drawer/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map userprofiledata = {
    "username": "",
    "profile": "",
    "email": "",
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfileData();
  }

  String? name = "";
  String? email = "";
  String? phone = "";
  getUserProfileData() async {
    print("start");
    print(name);
    try {
      print("gone");
      User? user = FirebaseAuth.instance.currentUser;
      var response = await FirebaseFirestore.instance
          .collection('Userlist')
          .doc(user!.uid)
          .get();

      setState(() {
        name = response.data()!["user_name"];
        email = response.data()!["email"];
        phone = response.data()!["phoneno"];
        LatLngCheck.currentuserName = response.data()!["user_name"];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "User Name    ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  name.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Mobile #        ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  phone.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Email             ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  email.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotScreen()));
                  },
                  child: Text(
                    "Change Password ?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade400,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 35,
                      color: Colors.blue,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
