import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/screens/ServiceProviders/google_map.dart';
import 'package:final_year_project/screens/add_ser/check/check_latlong.dart';
import 'package:final_year_project/screens/components/user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class MyServiceList extends StatefulWidget {
  // String deliver;
  String servicess;
  MyServiceList({
    Key? key,
    required this.servicess,
  }) : super(key: key);

  @override
  State<MyServiceList> createState() => _MyServiceListState();
}

class _MyServiceListState extends State<MyServiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3c83f1),
        title: Text(widget.servicess),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(widget.servicess)
            .where("user_id", isEqualTo: Userdata.userId)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot Data = snapshot.data!.docs[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            print(Data["Address"]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(Data["user_image"]),
                                      ),
                                      title: Text(
                                        Data["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        Data["phoneNo"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: InkWell(
                                        onTap: () async {
                                          // print("call");
                                          // var number = Data[
                                          //     "phoneNo"]; //set the number here
                                          // bool? res =
                                          //     await FlutterPhoneDirectCaller
                                          //         .callNumber(number);
                                          var collection = FirebaseFirestore
                                              .instance
                                              .collection(widget.servicess);
                                          await collection
                                              .doc(Data.id)
                                              .delete();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Service",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Price Per hour",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.servicess,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "PKR ${Data["priceperhour"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Address",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        Text(
                                          Data["Address"],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        LatLngCheck.latnumber =
                                            Data["latitude"];
                                        LatLngCheck.lonnumber =
                                            Data["Longitude"];
                                        LatLngCheck.name = Data["name"];

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GetUserCurrentLocation()));
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            "Location",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 05,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Experience:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "${Data["experience"]} Years",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
