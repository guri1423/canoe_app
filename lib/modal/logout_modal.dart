import 'dart:convert';


class LogoutModal{


  //constructor
  LogoutModal({
    this.email,


  });

  String? email;



  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "email": email,




  };


}


