import 'package:final_year_project/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:action_slider/action_slider.dart';
import 'package:action_slider/action_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Lottie.asset("assets/images/lottieScreen.json"),
            Text(
              "TezRaftar",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Available on Call",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
            ),
            ActionSlider.standard(
              sliderBehavior: SliderBehavior.stretch,
              rolling: true,
              width: 350.0,
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              backgroundColor: Colors.white,
              toggleColor: Colors.blue,
              iconAlignment: Alignment.centerRight,
              loadingIcon: SizedBox(
                  width: 55,
                  child: Center(
                      child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                        strokeWidth: 2.0, color: Colors.white),
                  ))),
              successIcon: const SizedBox(
                  width: 55,
                  child: Center(
                      child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                  ))),
              icon: const SizedBox(
                  width: 55,
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ))),
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(seconds: 2));
                controller.success();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                //starts success animation
                await Future.delayed(const Duration(seconds: 1));
                controller.reset(); //resets the slider
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 46,
            //     child: TextButton(
            //       style: TextButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(24)),
            //           primary: Colors.white,
            //           backgroundColor: Colors.white),
            //       onPressed: () {
            //         Navigator.pushReplacement(context,
            //             MaterialPageRoute(builder: (context) => LoginScreen()));
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const [
            //           Text(
            //             "Get Started",
            //             style: TextStyle(
            //               fontSize: 22,
            //               fontWeight: FontWeight.w700,
            //               color: Colors.blue,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Icon(
            //             Icons.arrow_forward,
            //             size: 30,
            //             color: Colors.blue,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
