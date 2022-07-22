import 'dart:convert';


class Enquiry{


  //constructor
  Enquiry({
    this.name,
    this.email,
    this.message,
    this.phone,


  });

  String? name;
  String? email;
  String? message;
  String? phone;

  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "message": message,
    "phone": phone,


  };


}


