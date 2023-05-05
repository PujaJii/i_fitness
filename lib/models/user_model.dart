// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.response,
    this.userData,
  });

  String? response;
  UserData? userData;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    response: json["response"] == null ? null : json["response"],
    userData: json["userData"] == null ? null : UserData.fromJson(json["userData"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
    "userData": userData == null ? null : userData!.toJson(),
  };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.status,
    this.profileImg,
    this.lang,
  });

  int? id;
  String? name;
  String? email;
  String? password;
  DateTime? createdAt;
  String? status;
  dynamic profileImg;
  dynamic lang;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    status: json["status"] == null ? null : json["status"],
    profileImg: json["profile_img"],
    lang: json["lang"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "status": status == null ? null : status,
    "profile_img": profileImg,
    "lang": lang,
  };
}
