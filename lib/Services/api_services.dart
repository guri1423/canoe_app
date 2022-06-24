import 'dart:convert';
import 'package:canoe_app/modal/login_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:canoe_app/modal/location_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../modal/alert_modal.dart';

Future<List<AlertModal>> fetchAlert( )async{
  var url = Uri.parse("https://e6c7-2401-4900-51ff-f714-508b-8d2f-bae-fe0.in.ngrok.io/ALertShow");
  http.Response response;
    response = await http.get(url);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
  print(jsonResponse);
  List DetailData=jsonResponse;
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



Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
  String url = "https://e6c7-2401-4900-51ff-f714-508b-8d2f-bae-fe0.in.ngrok.io/user/login";

  final response = await http.post(Uri.parse(url), body: requestModel.toJson());
  if (response.statusCode == 200 || response.statusCode == 400) {
    return LoginResponseModel.fromJson(
      json.decode(response.body),
    );
  } else {
    throw Exception('Failed to load data!');
  }
}