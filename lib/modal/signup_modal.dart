import 'dart:convert';


class Register{


  //constructor
  Register({
    this.name,
    this.email,
    this.password,
    this.phone,


  });

  String? name;
  String? email;
  String? password;
  String? phone;

  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,


  };


}


