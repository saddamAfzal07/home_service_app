import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:final_year_project/screens/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Final Year Project',
      theme: ThemeData(
        // fontFamily: 'baloo',
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
