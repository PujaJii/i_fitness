// To parse this JSON data, do
//
//     final homeContentModel = homeContentModelFromJson(jsonString);

import 'dart:convert';

HomeContentModel homeContentModelFromJson(String str) => HomeContentModel.fromJson(json.decode(str));

String homeContentModelToJson(HomeContentModel data) => json.encode(data.toJson());

class HomeContentModel {
  String? status;
  String? msg;
  List<DailyVideos>? dailyVideo;
  List<Blogs>? blog;

  HomeContentModel({
    this.status,
    this.msg,
    this.dailyVideo,
    this.blog,
  });

  factory HomeContentModel.fromJson(Map<String, dynamic> json) => HomeContentModel(
    status: json["status"],
    msg: json["msg"],
    dailyVideo: json["DailyVideo"] == null ? [] : List<DailyVideos>.from(json["DailyVideo"]!.map((x) => DailyVideos.fromJson(x))),
    blog: json["Blog"] == null ? [] : List<Blogs>.from(json["Blog"]!.map((x) => Blogs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "DailyVideo": dailyVideo == null ? [] : List<dynamic>.from(dailyVideo!.map((x) => x.toJson())),
    "Blog": blog == null ? [] : List<dynamic>.from(blog!.map((x) => x.toJson())),
  };
}

class DailyVideos {
  int? id;
  String? title;
  String? description;
  String? videoUrl;

  DailyVideos({
    this.id,
    this.title,
    this.description,
    this.videoUrl,
  });

  factory DailyVideos.fromJson(Map<String, dynamic> json) => DailyVideos(
    id: json["Id"],
    title: json["Title"],
    description: json["Description"],
    videoUrl: json["Video_Url"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "Description": description,
    "Video_Url": videoUrl,
  };
}

class Blogs {
  int? id;
  String? title;
  String? description;
  String? imgUrl;

  Blogs({
    this.id,
    this.title,
    this.description,
    this.imgUrl,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
    id: json["Id"],
    title: json["Title"],
    description: json["Description"],
    imgUrl: json["Img_Url"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "Description": description,
    "Img_Url": imgUrl,
  };
}
