import 'dart:convert';

import 'package:canoe_app/modal/location_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../modal/alert_modal.dart';

Future<List<AlertModal>> fetchAlert( )async{
  var url = Uri.parse("https://27e3-2401-4900-1bc3-5ca8-1c8c-204e-f289-f54a.in.ngrok.io/AlertShow");
  http.Response response;
    response = await http.get(url);
  print(response.body);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
 print(jsonResponse);
    return jsonResponse.map((data) =>  AlertModal.fromJson(data));

  }else{
    throw Exception("error");
  }

}

Future<List<LocationModal>> fetchLocation() async{
  var url = Uri.parse("https://4436-2401-4900-55b1-4260-a8f1-56a9-bcfd-91d9.in.ngrok.io/LatLong/:Email");
  http.Response response;
  response = await http.get(url);
  print(response.body);
  if(response.statusCode==200){
    var  jsonResponse= await json.decode(response.body);
    print(jsonResponse);
    return jsonResponse.map((data) =>  LocationModal.fromJson(data));

  }else{
    throw Exception("error");
  }


}