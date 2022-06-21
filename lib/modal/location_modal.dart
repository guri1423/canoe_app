

import 'dart:convert';

List<LocationModal> locationModalFromJson(String str) => List<LocationModal>.from(json.decode(str).map((x) => LocationModal.fromJson(x)));



class LocationModal {
  LocationModal({
    required this.id,
    required this.Email,
    required this.Latitude,
    required this.Longitude,
  });

  String id;
  String Email;
  double Latitude;
  double Longitude;

  factory LocationModal.fromJson(Map<String, dynamic> json) => LocationModal(
    id: json["_id"],
    Email: json["Email"],
    Latitude: json["Latitude"],
    Longitude: json["Longitude"]
  );


}
