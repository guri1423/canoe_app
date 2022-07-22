import 'dart:convert';


import 'package:canoe_app/Services/storage_services.dart';
import 'package:canoe_app/modal/enquiry_modal.dart';
import 'package:canoe_app/modal/get_message_model.dart';
import 'package:canoe_app/modal/location_duties_model.dart';

import 'package:canoe_app/modal/login_modal.dart';
import 'package:canoe_app/modal/logout_modal.dart';
import 'package:canoe_app/modal/message_modal.dart';


import 'package:canoe_app/modal/signup_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../modal/alert_modal.dart';

final StorageServices _services = StorageServices();

Future<List<AlertModal>> fetchAlert( )async{
  var url = Uri.parse("https://shield.omkatech.com/api/alerts");
  http.Response response;
    response = await http.get(url);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
  print(jsonResponse);
  List DetailData=jsonResponse["alerts"];
  print(DetailData);
    return DetailData.map((data) =>  AlertModal.fromJson(data)).toList();

  }else{
    throw Exception("error");
  }

}

Future<List> fetchLocation() async{
  var url = Uri.parse("https://4436-2401-4900-55b1-4260-a8f1-56a9-bcfd-91d9.in.ngrok.io/LatLong/:Email");
  http.Response response;
  response = await http.get(url);
  print(response.body);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
    print(jsonResponse);
    return jsonResponse;

  }else{
    throw Exception("error");
  }


}




Future<bool?> userLogin(LoginRequestModal model) async{

  print(model.email);
  print(model.password);

  String url = "https://shield.omkatech.com/api/login";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse['token']);
    await _services.storeToken(jsonResponse['token']);








    if (jsonResponse['message']=="Login Successfull"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to load data");
  }

}



Future<bool?> userRegister(Register model) async{
  print(model.name);
  print(model.email);
  print(model.password);

  String url = "https://shield.omkatech.com/api/register";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    var jsonResponse = json.decode(response.body);
    print(jsonResponse["message"]);
    if (jsonResponse['message']=="User Registered Successfully |"){
      await _services.storeToken(jsonResponse['token']);
      await _services.storeEmail(model.email!);
      await _services.storeUserName(model.name!);

      return true;
    }
    else{
      return false;
    }

  }

  else{
    throw Exception("Failed to load data");
  }

}


Future<bool?> userforgotpassword(model) async{

  print(model.email);

  String url = "https://shield.omkatech.com/api/forgot-password";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status']=="true"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to load data");
  }

}

Future<bool?> newPassword( model) async{

  print(model.email);
  print(model.password);
  print(model.confirmpassword);

  String url = "https://shield.omkatech.com/api/reset-password";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status']=="true"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to load data");
  }

}



Future<bool?> userEnquiry(Enquiry model) async{

  print(model.email);
  print(model.message);
  print(model.name);
  print(model.phone);

  String url = "https://shield.omkatech.com/api/enquiry";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['message']=="Enquiry Updated Succesfully"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to send data");
  }

}

// Future<bool?> sendMessage(MessageModal model) async{
//
//   String url = "https://shield.omkatech.com/api/send-message";
//
//   final response = await http.post(Uri.parse(url), body: model.toJson());
//   if (response.statusCode==200|| response.statusCode==400){
//     print(response.body);
//     var jsonResponse = json.decode(response.body);
//     if (jsonResponse['status']=="true"){
//       return true;}
//     else{
//       return false;
//     }
//
//   }
//   else{
//     throw Exception("Failed to load data");
//   }
//
// }
//
Stream<dynamic> getMessage() async*{
  String url = "https://shield.omkatech.com/api/recieve-message";

  final response = await http.get(Uri.parse(url), );
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status']=="true"){
      yield messageModelFromJson(response.body);}
    else{
      yield true;
    }
  }
  else{
    throw Exception("Failed to load data");
  }

}


Future<int?> pendingDuties() async{
  var url = Uri.parse("https://shield.omkatech.com/api/total_pending_duties");
  http.Response response;
  response = await http.get(url);
  print(response.body);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
    print(jsonResponse["duties"]);
    return jsonResponse["duties"];

  }else{
    throw Exception("error");
  }


}

Future<bool?> logout(LogoutModal model) async{

  print(model.email);
  print(model.password);

  String url = "https://shield.omkatech.comapi/logout";

  final response = await http.post(Uri.parse(url), body: model.toJson());
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status']=="true"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to load data");
  }

}


Future<dynamic> sendMessageUser(SendMessageModal model) async{

 String? tokenValue = await _services.getToken();
  print(tokenValue);
  // print(model.user_id);
  print(model.message);

  String url = "https://shield.omkatech.com/api/send-message";

  final response = await http.post(Uri.parse(url), body: model.toJson(),
      headers: {
        'Authorization': 'Bearer $tokenValue',
      } );
  if (response.statusCode==200|| response.statusCode==400){
    print(response.body);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['status']=="true"){
      return true;}
    else{
      return false;
    }

  }
  else{
    throw Exception("Failed to load data");
  }

}


Future<dynamic> locationPendingDuties() async{
  var url = Uri.parse("https://shield.omkatech.com/api/location_pending_duties");
  http.Response response;
  response = await http.get(url);
  print(response.body);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
    print(jsonResponse["duties"]);
    return jsonResponse["duties"]["location"];


  }else{
    throw Exception("error");
  }


}
