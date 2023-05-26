// To parse this JSON data, do
//
//     final fetchProfileModel = fetchProfileModelFromJson(jsonString);

import 'dart:convert';

FetchProfileModel fetchProfileModelFromJson(String str) => FetchProfileModel.fromJson(json.decode(str));

String fetchProfileModelToJson(FetchProfileModel data) => json.encode(data.toJson());

class FetchProfileModel {
  String? status;
  String? msg;
  List<UserData>? data;

  FetchProfileModel({
    this.status,
    this.msg,
    this.data,
  });

  factory FetchProfileModel.fromJson(Map<String, dynamic> json) => FetchProfileModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<UserData>.from(json["data"]!.map((x) => UserData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserData {
  String? id;
  String? name;
  String? emailId;
  String? password;
  String? phoneNo;
  String? profilePicture;
  String? baseUrlProfilePicture;
  String? coverPicture;
  String? baseUrlCoverPicture;

  UserData({
    this.id,
    this.name,
    this.emailId,
    this.password,
    this.phoneNo,
    this.profilePicture,
    this.baseUrlProfilePicture,
    this.coverPicture,
    this.baseUrlCoverPicture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["Id"],
    name: json["Name"],
    emailId: json["Email_Id"],
    password: json["Password"],
    phoneNo: json["Phone_No"],
    profilePicture: json["Profile_Picture"],
    baseUrlProfilePicture: json["BaseUrl_Profile_Picture"],
    coverPicture: json["Cover_Picture"],
    baseUrlCoverPicture: json["BaseUrl_Cover_Picture"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Email_Id": emailId,
    "Password": password,
    "Phone_No": phoneNo,
    "Profile_Picture": profilePicture,
    "BaseUrl_Profile_Picture": baseUrlProfilePicture,
    "Cover_Picture": coverPicture,
    "BaseUrl_Cover_Picture": baseUrlCoverPicture,
  };
}
