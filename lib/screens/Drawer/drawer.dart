import 'dart:ui';
import 'package:final_year_project/screens/Drawer/user_specific_services.dart/check_user_services.dart';
import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:final_year_project/screens/user_profile/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerbox extends StatelessWidget {
  const Drawerbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView(shrinkWrap: true, children: [
              Container(
                height: 100,
                color: Color(0xff3c83f1),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tezraftar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Make your life easy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile()));
                      },
                    ),
                    Divider(
                      thickness: 1.2,
                    ),
                    ListTile(
                      leading: Icon(Icons.home, color: Colors.green),
                      title: Text(
                        "My Services",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserSerices()));
                      },
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        "Policy",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Colors.green,
                      ),
                      title: Text(
                        "Help",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        "Log out",
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('username');
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
