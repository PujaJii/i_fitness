// To parse this JSON data, do
//
//     final deleteImageModel = deleteImageModelFromJson(jsonString);

import 'dart:convert';

DeleteImageModel deleteImageModelFromJson(String str) => DeleteImageModel.fromJson(json.decode(str));

String deleteImageModelToJson(DeleteImageModel data) => json.encode(data.toJson());

class DeleteImageModel {
  String? status;
  String? msg;
  List<ListAfterDelete>? data;

  DeleteImageModel({
    this.status,
    this.msg,
    this.data,
  });

  factory DeleteImageModel.fromJson(Map<String, dynamic> json) => DeleteImageModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<ListAfterDelete>.from(json["data"]!.map((x) => ListAfterDelete.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ListAfterDelete {
  int? id;
  String? imgUrl;
  String? ondate;

  ListAfterDelete({
    this.id,
    this.imgUrl,
    this.ondate,
  });

  factory ListAfterDelete.fromJson(Map<String, dynamic> json) => ListAfterDelete(
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
