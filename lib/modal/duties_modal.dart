

import 'dart:convert';

PendingDutiesModel pendingDutiesModelFromJson(String str) => PendingDutiesModel.fromJson(json.decode(str));

String pendingDutiesModelToJson(PendingDutiesModel data) => json.encode(data.toJson());

class PendingDutiesModel {
  PendingDutiesModel({
    required this.duties,
  });

  List<Duty> duties;

  factory PendingDutiesModel.fromJson(Map<String, dynamic> json) => PendingDutiesModel(
    duties: List<Duty>.from(json["duties"].map((x) => Duty.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "duties": List<dynamic>.from(duties.map((x) => x.toJson())),
  };
}

class Duty {
  Duty({

    this.locationId,

    this.boatNumberId,

  });


  String? locationId;

  String? boatNumberId;


  factory Duty.fromJson(Map<String, dynamic> json) => Duty(

    locationId: json["location_id"],

    boatNumberId: json["boat_number_id"],

  );

  Map<String, dynamic> toJson() => {

    "location_id": locationId,

    "boat_number_id": boatNumberId,

  };
}
