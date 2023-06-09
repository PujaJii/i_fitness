// To parse this JSON data, do
//
//     final fetchPlanModel = fetchPlanModelFromJson(jsonString);

import 'dart:convert';

FetchPlanModel fetchPlanModelFromJson(String str) => FetchPlanModel.fromJson(json.decode(str));

String fetchPlanModelToJson(FetchPlanModel data) => json.encode(data.toJson());

class FetchPlanModel {
  String? status;
  String? msg;
  List<PlansList>? plansList;

  FetchPlanModel({
    this.status,
    this.msg,
    this.plansList,
  });

  factory FetchPlanModel.fromJson(Map<String, dynamic> json) => FetchPlanModel(
    status: json["status"],
    msg: json["msg"],
    plansList: json["PlansList"] == null ? [] : List<PlansList>.from(json["PlansList"]!.map((x) => PlansList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "PlansList": plansList == null ? [] : List<dynamic>.from(plansList!.map((x) => x.toJson())),
  };
}

class PlansList {
  int? id;
  String? title;
  String? description;
  String? price;

  PlansList({
    this.id,
    this.title,
    this.description,
    this.price,
  });

  factory PlansList.fromJson(Map<String, dynamic> json) => PlansList(
    id: json["Id"],
    title: json["Title"],
    description: json["Description"],
    price: json["Price"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Title": title,
    "Description": description,
    "Price": price,
  };
}
