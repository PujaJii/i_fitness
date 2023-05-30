// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
  String? status;
  String? msg;
  List<SubscribeInfo>? data;

  SubscriptionModel({
    this.status,
    this.msg,
    this.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<SubscribeInfo>.from(json["data"]!.map((x) => SubscribeInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SubscribeInfo {
  int? id;
  int? planId;
  String? startDate;
  String? endDate;
  bool? status;
  int? amt;
  String? paymentStatus;

  SubscribeInfo({
    this.id,
    this.planId,
    this.startDate,
    this.endDate,
    this.status,
    this.amt,
    this.paymentStatus,
  });

  factory SubscribeInfo.fromJson(Map<String, dynamic> json) => SubscribeInfo(
    id: json["Id"],
    planId: json["PlanId"],
    startDate: json["Start_Date"],
    endDate: json["End_Date"],
    status: json["Status"],
    amt: json["Amt"],
    paymentStatus: json["Payment_Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "PlanId": planId,
    "Start_Date": startDate,
    "End_Date": endDate,
    "Status": status,
    "Amt": amt,
    "Payment_Status": paymentStatus,
  };
}
