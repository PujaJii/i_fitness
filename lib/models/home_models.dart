// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.response,
    this.data,
  });

  String? response;
  List<HomeDataList>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    response: json["response"] == null ? null : json["response"],
    data: json["data"] == null ? null : List<HomeDataList>.from(json["data"].map((x) => HomeDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HomeDataList {
  HomeDataList({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.link,
    this.createdAt,
    this.type,
  });

  int? id;
  String? title;
  String? subTitle;
  String? description;
  String? link;
  DateTime? createdAt;
  String? type;

  factory HomeDataList.fromJson(Map<String, dynamic> json) => HomeDataList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    subTitle: json["sub_title"] == null ? null : json["sub_title"],
    description: json["description"] == null ? null : json["description"],
    link: json["link"] == null ? null : json["link"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "sub_title": subTitle == null ? null : subTitle,
    "description": description == null ? null : description,
    "link": link == null ? null : link,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "type": type == null ? null : type,
  };
}
