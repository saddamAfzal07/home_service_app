import 'package:final_year_project/screens/components/user_id.dart';
import 'package:final_year_project/screens/dashboard_screen/dashboard.dart';
import 'package:final_year_project/screens/forget_password/forget_password.dart';
import 'package:final_year_project/screens/home_screen/homescreen.dart';
import 'package:final_year_project/screens/auth_screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences? logindata;
  bool? newuser;

  login(String email1, pass1) async {
    // final isvalid = _formKey.currentState!.validate();
    // if (isvalid) {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email1,
        password: pass1,
      );
      Userdata.userId = credential.user!.uid;
      print(Userdata.userId);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(),
        ),
        (route) => false,
      );

      logindata!.setBool("login", false);
      logindata!.setString("username", email.text);
      logindata!.setString("password", password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User not found"),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
        ));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong Password"),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
        ));
        print('Wrong password provided for that user.');
      }
    }
    // } else {}
  }

  String? passvalidation(value) {
    if (value == null || value.isEmpty) {
      return " password is required";
    } else if (value.length < 5) {
      return " password must be  5 Characters";
    } else if (value.length > 15) {
      return " password is too Long";
    } else {
      return null;
    }
  }

  late SharedPreferences logindataa;
  late String usernamme;
  late String pass;

  void checkiflogin() async {
    logindata = await SharedPreferences.getInstance();

    newuser = (logindata!.getBool("login") ?? true);
    print(newuser);
    if (newuser == false) {
      logindataa = await SharedPreferences.getInstance();
      setState(() {
        usernamme = logindataa.getString("username").toString();
        pass = logindataa.getString("password").toString();
      });
      login(
        usernamme,
        pass,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkiflogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
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
                        TextFormField(
                          controller: email,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Email is required"),
                              EmailValidator(errorText: "Not a valid Email"),
                            ],
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefix: SizedBox(
                              width: 5,
                            ),
                            labelText: "Email",
                            hintText: "Enter your email",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                              child: Icon(Icons.email_outlined),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          validator: passvalidation,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefix: SizedBox(
                              width: 5,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "Password",
                            hintText: "Enter your password",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                              child: Icon(Icons.lock_outline),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotScreen()));
                            },
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade400,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              primary: Colors.white,
                              backgroundColor: Color(0xFF4167b2),
                            ),
                            onPressed: () {
                              final isvalid = _formKey.currentState!.validate();
                              if (isvalid) {
                                login(email.text, password.text);
                              } else {}
                              // login();
                            },
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account? ",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
