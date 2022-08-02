
import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));


class UserProfileModel {
  UserProfileModel({
   required this.status,
   required this.user,
  });

  String status;
  User user;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    status: json["status"],
    user: User.fromJson(json["user"]),
  );


}

class User {
  User({
   required this.id,
  required  this.name,
  required  this.email,
  required  this.phone,
   required this.role,
  required  this.rememberToken,

  });

  int id;
  String name;
  String email;
  String phone;
  String role;

  String rememberToken;


  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
    rememberToken: json["remember_token"],

  );


}
