import 'dart:convert';

LocationDutiesModel locationDutiesModelFromJson(String str) => LocationDutiesModel.fromJson(json.decode(str));

String locationDutiesModelToJson(LocationDutiesModel data) => json.encode(data.toJson());

class LocationDutiesModel {
  LocationDutiesModel({
    required this.duties,
   required this.location,
  });

  Map<String, int> duties;
  List<Location> location;

  factory LocationDutiesModel.fromJson(Map<String, dynamic> json) => LocationDutiesModel(
    duties: Map.from(json["duties"]).map((k, v) => MapEntry<String, int>(k, v)),
    location: List<Location>.from(json["location"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "duties": Map.from(duties).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "location": List<dynamic>.from(location.map((x) => x.toJson())),
  };
}

class Location {
  Location({
    this.id,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location": location,
    "created_at": createdAt.toString(),
    "updated_at": updatedAt.toString(),
  };
}
