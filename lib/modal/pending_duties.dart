import 'dart:convert';


class PendingDutiesModal{


  //constructor
  PendingDutiesModal({
    this.duties,


  });

  int? duties;


  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "duties": duties,





  };


}


