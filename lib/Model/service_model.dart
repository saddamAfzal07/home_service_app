import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String? name;
  String? address;
  String? experience;
  String? phoneno;
  String? priceperhour;
  String? userid;
  String? userimage;
  Service({
    required this.name,
    required this.address,
    required this.experience,
    required this.phoneno,
    required this.priceperhour,
    required this.userid,
    required this.userimage,
  });
  factory Service.fromMap(DocumentSnapshot snapshot) {
    return Service(
      name: snapshot['name'],
      address: snapshot['shopname'],
      experience: snapshot['experience'],
      phoneno: snapshot['phoneNo'],
      priceperhour: snapshot['priceperhour'],
      userid: snapshot['user_id'],
      userimage: snapshot['user_image'],
    );
  }
}
