import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:i_fitness/models/register_model.dart';
import 'package:http/http.dart' as http;


class RegisterApi {

  static var client = http.Client();

  static Future<RegisterModel> getRegister(String Name, String Email_id, String Password) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/Registration'));
    request.body = json.encode({
      "Name": Name,
      "Email_id": Email_id,
      "Password": Password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return registerModelFromJson(jsonString);
    }
    return registerModelFromJson(response.reasonPhrase!);
  }
}