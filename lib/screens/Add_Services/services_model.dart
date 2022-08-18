class UserModel {
  String? Image;
  String? Servicename;

  String? time;
  int index;
  UserModel({
    required this.Image,
    required this.Servicename,
    this.time,
    required this.index,
  });
}

List<UserModel> UserNotifications = [
  UserModel(
    Image: "assets/images/electrician.png",
    Servicename: "Electrical Services",
    time: "Available",
    index: 0,
  ),
  UserModel(
    Image: "assets/images/air-conditioner.png",
    Servicename: "AC Repair Services",
    time: "Available",
    index: 1,
  ),
  UserModel(
    Image: "assets/images/plumber.png",
    Servicename: "Plumber Services",
    time: "Available",
    index: 2,
  ),
  UserModel(
    Image: "assets/images/mechanic.png",
    Servicename: "Mechanic Services",
    time: "Available",
    index: 3,
  ),
  UserModel(
    Image: "assets/images/laundry-machine.png",
    Servicename: "Laundry Services",
    time: "Available",
    index: 4,
  ),
  UserModel(
    Image: "assets/images/mop.png",
    Servicename: "Cleaning Services",
    time: "Available",
    index: 5,
  ),
];
