// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) => LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  String? status;
  String? msg;
  List<UserInfo>? data;
  String? token;

  LogInModel({
    this.status,
    this.msg,
    this.data,
    this.token,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<UserInfo>.from(json["data"]!.map((x) => UserInfo.fromJson(x))),
    token: json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "Token": token,
  };
}

class UserInfo {
  int? id;
  String? name;
  String? emailId;
  String? password;
  dynamic phoneNo;
  dynamic profilePicture;
  dynamic coverPicture;
  String? userType;
  bool? isActive;

  UserInfo({
    this.id,
    this.name,
    this.emailId,
    this.password,
    this.phoneNo,
    this.profilePicture,
    this.coverPicture,
    this.userType,
    this.isActive,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["Id"],
    name: json["Name"],
    emailId: json["Email_Id"],
    password: json["Password"],
    phoneNo: json["Phone_No"],
    profilePicture: json["Profile_Picture"],
    coverPicture: json["Cover_Picture"],
    userType: json["User_Type"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Email_Id": emailId,
    "Password": password,
    "Phone_No": phoneNo,
    "Profile_Picture": profilePicture,
    "Cover_Picture": coverPicture,
    "User_Type": userType,
    "IsActive": isActive,
  };
}
