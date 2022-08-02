import 'dart:convert';

AlertModal alertModalFromJson(String str) => AlertModal.fromJson(json.decode(str));

String alertModalToJson(AlertModal data) => json.encode(data.toJson());

class AlertModal {
  AlertModal({
    required this.alerts,
  });

  List<Alert> alerts;

  factory AlertModal.fromJson(Map<String, dynamic> json) => AlertModal(
    alerts: List<Alert>.from(json["alerts"].map((x) => Alert.fromJson(x))).toList(),
  );

  Map<String, dynamic> toJson() => {
    "alerts": List<dynamic>.from(alerts.map((x) => x.toJson())),
  };
}

class Alert {
  Alert({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    id: json["id"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
