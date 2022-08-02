// To parse this JSON data, do
//
//     final locationDutiesModel = locationDutiesModelFromJson(jsonString);

import 'dart:convert';

LocationDutiesModel locationDutiesModelFromJson(String str) => LocationDutiesModel.fromJson(json.decode(str));



class LocationDutiesModel {
  LocationDutiesModel({
    required this.location,
    required this.status,
  });

  List<Location> location;
  String status;

  factory LocationDutiesModel.fromJson(Map<String, dynamic> json) => LocationDutiesModel(
    location: List<Location>.from(json["location"].map((x) => Location.fromJson(x))),
    status: json["status"],
  );


}

class Location {
  Location({
    this.id,
    this.location,
    this.pendingDuties,
    this.totalDuties,
    this.createdAt,
    this.updatedAt,
    this.duties,
  });

  int? id;
  String? location;
  String? pendingDuties;
  String? totalDuties;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Duty>? duties;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    location: json["location"],
    pendingDuties: json["pending_duties"],
    totalDuties: json["total_duties"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    duties: List<Duty>.from(json["duties"].map((x) => Duty.fromJson(x))),
  );


}

class Duty {
  Duty({
    this.id,
    this.dutyLocationId,
    this.dutyBoatTypeId,
    this.dutyBoatNumberId,
    this.status,
    this.userEmail,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.boatType,
    this.boatNumber,
  });

  int? id;
  String? dutyLocationId;
  String? dutyBoatTypeId;
  String? dutyBoatNumberId;
  String? status;
  dynamic? userEmail;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  Boat? boatType;
  Boat? boatNumber;

  factory Duty.fromJson(Map<String, dynamic> json) => Duty(
    id: json["id"],
    dutyLocationId: json["duty_location_id"],
    dutyBoatTypeId: json["duty_boat_type_id"],
    dutyBoatNumberId: json["duty_boat_number_id"],
    status: json["status"],
    userEmail: json["user_email"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    boatType: Boat.fromJson(json["boat_type"]),
    boatNumber: Boat.fromJson(json["boat_number"]),
  );


}

class Boat {
  Boat({
    this.id,
    this.number,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  int? id;
  String? number;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? type;

  factory Boat.fromJson(Map<String, dynamic> json) => Boat(
    id: json["id"],
    number: json["number"] == null ? null : json["number"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    type: json["type"] == null ? null : json["type"],
  );


}
