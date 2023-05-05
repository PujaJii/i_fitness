// To parse this JSON data, do
//
//     final editerModel = editerModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    this.response,
  });

  String? response;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    response: json["response"] == null ? null : json["response"],
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
  };
}
