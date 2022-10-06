// To parse this JSON data, do
//
//     final catModel = catModelFromJson(jsonString);

import 'dart:convert';

CatModel catModelFromJson(String str) => CatModel.fromJson(json.decode(str));

String catModelToJson(CatModel data) => json.encode(data.toJson());

class CatModel {
  CatModel({
    this.response,
    this.data,
  });

  String? response;
  List<CatDataList>? data;

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    response: json["response"] == null ? null : json["response"],
    data: json["data"] == null ? null : List<CatDataList>.from(json["data"].map((x) => CatDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CatDataList {
  CatDataList({
    this.id,
    this.title,
    this.subTitle,
    this.url,
    this.createdAt,
  });

  int? id;
  String? title;
  String? subTitle;
  String? url;
  DateTime? createdAt;

  factory CatDataList.fromJson(Map<String, dynamic> json) => CatDataList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    url: json["url"] == null ? null : json["url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "sub_title": subTitle == null ? null : subTitle,
    "url": url == null ? null : url,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
  };
}
