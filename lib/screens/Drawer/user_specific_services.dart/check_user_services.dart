import 'package:final_year_project/screens/Add_Services/services_model.dart';
import 'package:final_year_project/screens/Drawer/user_specific_services.dart/my_service_list.dart';
import 'package:final_year_project/screens/dashboard_screen/dashboard.dart';
import 'package:flutter/material.dart';

class UserSerices extends StatefulWidget {
  const UserSerices({Key? key}) : super(key: key);

  @override
  State<UserSerices> createState() => _UserSericesState();
}

class _UserSericesState extends State<UserSerices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Service",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => Dashboard())));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Services",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 5,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: UserNotifications.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        if (UserNotifications[index].index == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "Electrician Services",
                                      )));
                        } else if (UserNotifications[index].index == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "AC-Repair Services",
                                      )));
                        } else if (UserNotifications[index].index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "Plumber Services",
                                      )));
                        } else if (UserNotifications[index].index == 3) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "Mechanic Services",
                                      )));
                        } else if (UserNotifications[index].index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "Laundry Services",
                                      )));
                        } else if (UserNotifications[index].index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyServiceList(
                                        servicess: "Cleaning Services",
                                      )));
                        }
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            UserNotifications[index].Image.toString(),
                          ),
                        ),
                        title: Text(
                          "${UserNotifications[index].Servicename} ",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle:
                            Text(UserNotifications[index].time.toString()),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 17,
                          color: Colors.black,
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
