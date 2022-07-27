import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_year_project/screens/home_screen/drawer.dart';
import 'package:final_year_project/screens/service_categories/electricians.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final List<String> images = [
    "assets/images/bus1.jpg",
    "assets/images/bus2.jpg",
    "assets/images/bus3.jpg",
    "assets/images/bus4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff3c83f1),
        elevation: 0,
        title: Text("i-Services"),
      ),
      drawer: Drawerbox(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(
            //   clipBehavior: Clip.none,
            //   // fit: StackFit.expand,
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       height: 100,
            //       color: Color(0xff3c83f1),
            //     ),
            //     Positioned(
            //       top: 100,
            //       left: 0,
            //       right: 0,
            //
            //
            //     child:
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "What would you like \n to find?",
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),

            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36),
                  topLeft: Radius.circular(36),
                ),
              ),
              height: 600,
              // width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: InkWell(
                          onTap: () {
                            print("move");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Electricians(
                                          servicess: "Electrician",
                                          deliver: "Electrician",
                                        ))));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    // offset: Offset(
                                    //     0, 0), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            height: 100,
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                        "assets/images/electrician.png")),
                                Text(
                                  "Electrician",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Electricians(
                                        servicess: "AC-Repair",
                                        deliver: "AC Repair",
                                      ))));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          height: 100,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 50,
                                  child: Image.asset(
                                      "assets/images/air-conditioner.png")),
                              Text(
                                "Ac Repair",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        height: 100,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 50,
                                child:
                                    Image.asset("assets/images/plumber.png")),
                            Text(
                              "Plumber",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  //=====>>>>2nd row=======>>>>>>>
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) => Electricians(
                            //               servicess: "Electrician",

                            //             ))));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    // offset: Offset(
                                    //     0, 0), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            height: 100,
                            width: 110,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 50,
                                    child: Image.asset(
                                        "assets/images/mechanic.png")),
                                Text(
                                  "Mechanic",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => Electricians(
                          //               servicess: "Generator Service",
                          //             )))
                          //             );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          height: 100,
                          width: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 50,
                                  child: Image.asset(
                                      "assets/images/laundry-machine.png")),
                              Text(
                                "Laundry",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        height: 100,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height: 50,
                                child: Image.asset("assets/images/mop.png")),
                            Text(
                              "Cleaner",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // ),

            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: CarouselSlider(
            //     items: images
            //         .map((item) => Container(
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(14),
            //               ),
            //               // height: 100,
            //               // width: 100,
            //               child: Center(
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(14),
            //                   child: Image.asset(
            //                     item,
            //                     fit: BoxFit.cover,
            //                     width: 1000,
            //                   ),
            //                 ),
            //               ),
            //             ))
            //         .toList(),
            //     options: CarouselOptions(
            //         autoPlay: true,
            //         aspectRatio: 3,
            //         enlargeCenterPage: true,
            //         onPageChanged: (index, reason) {
            //           setState(() {
            //             _current = index;
            //           });
            //         }),
            //   ),
            // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
