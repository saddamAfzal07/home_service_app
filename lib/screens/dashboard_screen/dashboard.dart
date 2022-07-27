import 'package:final_year_project/screens/add_ser/add_services.dart';
import 'package:final_year_project/screens/home_screen/homescreen.dart';
import 'package:final_year_project/screens/my_tickets/my_tickets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const Categories(),
    const MyTickets(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          setState(() {
            currentScreen = HomeScreen();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff3c83f1),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = Categories();
                      currentTab = 1;
                    });
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset(
                          "assets/images/addservice.png",
                          height: 45,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/customer.png",
                      height: 45,
                      width: 45,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
