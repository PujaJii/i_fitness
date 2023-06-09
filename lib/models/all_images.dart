// To parse this JSON data, do
//
//     final imageListModel = imageListModelFromJson(jsonString);

import 'dart:convert';

ImageListModel imageListModelFromJson(String str) => ImageListModel.fromJson(json.decode(str));

String imageListModelToJson(ImageListModel data) => json.encode(data.toJson());

class ImageListModel {
  String? status;
  String? msg;
  List<ListData>? data;

  ImageListModel({
    this.status,
    this.msg,
    this.data,
  });

  factory ImageListModel.fromJson(Map<String, dynamic> json) => ImageListModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<ListData>.from(json["data"]!.map((x) => ListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ListData {
  int? id;
  String? imgUrl;
  String? ondate;

  ListData({
    this.id,
    this.imgUrl,
    this.ondate,
  });

  factory ListData.fromJson(Map<String, dynamic> json) => ListData(
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
