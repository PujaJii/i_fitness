// To parse this JSON data, do
//
//     final uploadImageModel = uploadImageModelFromJson(jsonString);

import 'dart:convert';

UploadImageModel uploadImageModelFromJson(String str) => UploadImageModel.fromJson(json.decode(str));

String uploadImageModelToJson(UploadImageModel data) => json.encode(data.toJson());

class UploadImageModel {
  String? status;
  String? msg;
  List<UploadedImage>? data;

  UploadImageModel({
    this.status,
    this.msg,
    this.data,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) => UploadImageModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<UploadedImage>.from(json["data"]!.map((x) => UploadedImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UploadedImage {
  int? id;
  String? imgUrl;
  String? ondate;

  UploadedImage({
    this.id,
    this.imgUrl,
    this.ondate,
  });

  factory UploadedImage.fromJson(Map<String, dynamic> json) => UploadedImage(
    id: json["Id"],
    imgUrl: json["ImgUrl"],
    ondate: json["Ondate"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ImgUrl": imgUrl,
    "Ondate": ondate,
  };
}
