// To parse this JSON data, do
//
//     final forgetPasswordModel = forgetPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
  String? status;
  String? msg;
  String? password;

  ForgetPasswordModel({
    this.status,
    this.msg,
    this.password,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
    status: json["status"],
    msg: json["msg"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "password": password,
  };
}
