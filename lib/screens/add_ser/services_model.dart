class UserModel {
  String? Image;
  String? name;

  String? time;
  int index;
  UserModel({
    required this.Image,
    required this.name,
    this.time,
    required this.index,
  });
}

List<UserModel> UserNotifications = [
  UserModel(
    Image: "assets/images/bus1.jpg",
    name: "Electrical Services",
    time: "Available",
    index: 0,
  ),
  UserModel(
    Image: "assets/images/bus1.jpg",
    name: "Refrigertor Services",
    time: "Available",
    index: 1,
  ),
  UserModel(
    Image: "assets/images/bus1.jpg",
    name: "Refrigertor and AC",
    time: "Available",
    index: 2,
  ),
  UserModel(
    Image: "assets/images/bus1.jpg",
    name: "Plumber Services",
    time: "In Progress",
    index: 3,
  ),
];
