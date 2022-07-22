import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.status,
    required this.message,
  });

  String status;
  List<Message> message;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    status: json["status"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.id,
    this.userId,
    this.userName,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? userName;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    message: json["message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "message": message,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}