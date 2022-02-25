import 'package:meta/meta.dart';
import 'dart:convert';

class SignupModel {
  SignupModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory SignupModel.fromMap(Map<String, dynamic> json) => SignupModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.image,
    required this.token,
  });

  String name;
  String email;
  String phone;
  int id;
  String image;
  String token;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "phone": phone,
    "id": id,
    "image": image,
    "token": token,
  };
}
