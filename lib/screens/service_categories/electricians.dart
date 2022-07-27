import 'package:final_year_project/Model/service_model.dart';
import 'package:final_year_project/screens/components/user_id.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Electricians extends StatefulWidget {
  String deliver;
  String servicess;
  Electricians({Key? key, required this.servicess, required this.deliver})
      : super(key: key);

  @override
  State<Electricians> createState() => _ElectriciansState();
}

class _ElectriciansState extends State<Electricians> {
  // TextEditingController search = TextEditingController();
  String shopname = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c83f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff3c83f1),
        title: Text(widget.deliver),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (shopname != "" && shopname != null)
            ? FirebaseFirestore.instance
                .collection(widget.servicess)
                .where('searchlist', arrayContains: shopname)
                .snapshots()
            : FirebaseFirestore.instance
                .collection(widget.servicess)
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
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    child: TextField(
                      // controller: search,
                      decoration: InputDecoration(
                        prefix: InkWell(
                            onTap: () {
                              print("click");
                              // setState(() {
                              //   shopname = search.text;
                              //   print(shopname);
                              // });
                            },
                            child: Icon(Icons.search)),
                        hintText: "Search",
                      ),
                      onChanged: (val) {
                        setState(() {
                          shopname = val;
                          print(shopname);
                        });
                      },
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),

                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot Data = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(Data["user_image"]),
                                  ),
                                  title: Text(
                                    Data["name"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    Data["phoneNo"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  trailing: InkWell(
                                    onTap: () async {
                                      print("call");
                                      var number =
                                          Data["phoneNo"]; //set the number here
                                      bool? res = await FlutterPhoneDirectCaller
                                          .callNumber(number);
                                      // callNumber;

                                      // setState(() {
                                      //   _makePhoneCall('tel:0597924917');
                                      // });
                                    },
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
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
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.deliver,
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      Data["shopname"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 05,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        "Experience:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
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
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      //  ListTile(
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(Data["user_image"]),
                      //   ),
                      //   title: Text(Data["name"]),
                      // );
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
