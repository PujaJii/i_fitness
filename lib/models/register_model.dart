// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? status;
  String? msg;
  String? token;
  String? isSubscribe;
  String? previousStatus;

  RegisterModel({
    this.status,
    this.msg,
    this.token,
    this.isSubscribe,
    this.previousStatus,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    msg: json["msg"],
    token: json["Token"],
    isSubscribe: json["IsSubscribe"],
    previousStatus: json["Previous_Status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "Token": token,
    "IsSubscribe": isSubscribe,
    "Previous_Status": previousStatus,
  };
}
