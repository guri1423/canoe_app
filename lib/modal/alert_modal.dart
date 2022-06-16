

import 'dart:convert';

List<AlertModal> alertModalFromJson(String str) => List<AlertModal>.from(json.decode(str).map((x) => AlertModal.fromJson(x)));



class AlertModal {
  AlertModal({
    required this.id,
    required this.message,
    required this.v,
  });

  String id;
  String message;
  int v;

  factory AlertModal.fromJson(Map<String, dynamic> json) => AlertModal(
    id: json["_id"],
    message: json["Message"],
    v: json["__v"],
  );


}
