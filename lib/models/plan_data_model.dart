// To parse this JSON data, do
//
//     final planDataModel = planDataModelFromJson(jsonString);

import 'dart:convert';

PlanDataModel planDataModelFromJson(String str) => PlanDataModel.fromJson(json.decode(str));

String planDataModelToJson(PlanDataModel data) => json.encode(data.toJson());

class PlanDataModel {
  String? status;
  String? msg;
  List<PlanData>? data;

  PlanDataModel({
    this.status,
    this.msg,
    this.data,
  });

  factory PlanDataModel.fromJson(Map<String, dynamic> json) => PlanDataModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<PlanData>.from(json["data"]!.map((x) => PlanData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PlanData {
  int? id;
  String? title;
  String? imgUrl;

  PlanData({
    this.id,
    this.title,
    this.imgUrl,
  });

  factory PlanData.fromJson(Map<String, dynamic> json) => PlanData(
    id: json["Id"],
    title: json["Title"],
    imgUrl: json["ImgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "ImgUrl": imgUrl,
  };
}
