import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../modal/alert_modal.dart';

Future<List<AlertModal>> fetchAlert( )async{
  var url = Uri.parse("https://df15-2401-4900-51d4-84e9-e82b-89a1-abb1-f1e8.in.ngrok.io/AlertShow");
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