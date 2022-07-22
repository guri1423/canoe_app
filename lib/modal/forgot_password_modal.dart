import 'dart:convert';


class ForgotPasswordModal{


  //constructor
  ForgotPasswordModal({
    this.email,


  });

  String? email;


  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "email": email,



  };


}


