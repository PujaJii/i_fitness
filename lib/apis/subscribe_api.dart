import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/subscription_model.dart';


class SubscribeApi {

  static var client = http.Client();

  static Future<SubscriptionModel> subscribe(String User_Id, String PlanId,String Amt) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Content-Type' : 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}SubscriptionApi/Subscription'));
    request.body = json.encode({
      'User_Id': User_Id,
      'PlanId': PlanId,
      'Amt': Amt
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return subscriptionModelFromJson(jsonString);
    }
    return subscriptionModelFromJson(response.reasonPhrase!);
  }
}