
// To parse this JSON data, do
//
//     final updateDutiesModel = updateDutiesModelFromJson(jsonString);

import 'dart:convert';

UpdateDutiesModel updateDutiesModelFromJson(String str) => UpdateDutiesModel.fromJson(json.decode(str));

String updateDutiesModelToJson(UpdateDutiesModel data) => json.encode(data.toJson());

class UpdateDutiesModel {
  UpdateDutiesModel({
    this.message,
    this.duties,
    this.status,
  });

  String? message;
  Duties? duties;
  String? status;

  factory UpdateDutiesModel.fromJson(Map<String, dynamic> json) => UpdateDutiesModel(
    message: json["message"],
    duties: Duties.fromJson(json["duties"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "duties": duties!.toJson(),
    "status": status,
  };
}

class Duties {
  Duties({
    this.id,
    this.dutyLocationId,
    this.dutyBoatTypeId,
    this.dutyBoatNumberId,
    this.status,
    this.userEmail,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  dynamic? id;
  String? dutyLocationId;
  String? dutyBoatTypeId;
  String? dutyBoatNumberId;
  String? status;
  String? userEmail;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Duties.fromJson(Map<String, dynamic> json) => Duties(
    id: json["id"],
    dutyLocationId: json["duty_location_id"],
    dutyBoatTypeId: json["duty_boat_type_id"],
    dutyBoatNumberId: json["duty_boat_number_id"],
    status: json["status"],
    userEmail: json["user_email"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "duty_location_id": dutyLocationId,
    "duty_boat_type_id": dutyBoatTypeId,
    "duty_boat_number_id": dutyBoatNumberId,
    "status": status,
    "user_email": userEmail,
    "deleted_at": deletedAt,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
