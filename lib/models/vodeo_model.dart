// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    this.response,
    this.data,
  });

  String? response;
  List<VideoDataList>? data;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    response: json["response"] == null ? null : json["response"],
    data: json["data"] == null ? null : List<VideoDataList>.from(json["data"].map((x) => VideoDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class VideoDataList {
  VideoDataList({
    this.id,
    this.name,
    this.url,
    this.createdAt,
    this.subName,
    this.duration,
    this.excFor,
    this.excParts,
    this.des,
    this.type,
    this.catId,
  });

  int? id;
  String? name;
  String? url;
  DateTime? createdAt;
  String? subName;
  String? duration;
  String? excFor;
  String? excParts;
  String? des;
  String? type;
  String? catId;

  factory VideoDataList.fromJson(Map<String, dynamic> json) => VideoDataList(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    url: json["url"] == null ? null : json["url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    subName: json["sub_name"] == null ? null : json["sub_name"],
    duration: json["duration"] == null ? null : json["duration"],
    excFor: json["exc_for"] == null ? null : json["exc_for"],
    excParts: json["exc_parts"] == null ? null : json["exc_parts"],
    des: json["des"] == null ? null : json["des"],
    type: json["type"] == null ? null : json["type"],
    catId: json["cat_id"] == null ? null : json["cat_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "url": url == null ? null : url,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "sub_name": subName == null ? null : subName,
    "duration": duration == null ? null : duration,
    "exc_for": excFor == null ? null : excFor,
    "exc_parts": excParts == null ? null : excParts,
    "des": des == null ? null : des,
    "type": type == null ? null : type,
    "cat_id": catId == null ? null : catId,
  };
}
