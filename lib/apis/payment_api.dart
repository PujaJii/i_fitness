import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/payment_model.dart';



class PaymentApi{

  static var client = http.Client();

  static Future<PaymentModel> proceedPay(String Id, String Amt,String Txn_Id) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}SubscriptionApi/Payment'));
    request.body = json.encode({
      "Id": Id,
      "Amt": Amt,
      "Txn_Id": Txn_Id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return paymentModelFromJson(jsonString);
    }
    return paymentModelFromJson(response.reasonPhrase!);
  }
}