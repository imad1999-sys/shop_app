import 'package:meta/meta.dart';

class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  UserData? data;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: json['data'] != null ? UserData.fromMap(json["data"]) : null,
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data!.toMap(),
  };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };
}
