import 'dart:convert';


class CreateNewPasswordModal{


  //constructor
  CreateNewPasswordModal({
    this.email,
    this.password,
    this.confirmpassword,


  });

  String? email;
  String? password;
  String? confirmpassword;


  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "email": email,
    "new_password": password,
    "confirm_password": confirmpassword,



  };


}


