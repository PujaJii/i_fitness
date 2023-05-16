import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:i_fitness/models/log_in_model.dart';
import 'package:http/http.dart' as http;


class LogInApi {

  static var client = http.Client();

  static Future<LogInModel> getLogIn(String Email_Id, String Password) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Content-Type' : 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/Login'));
    request.body = json.encode({
      "Email_Id": Email_Id,
      "Password": Password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return logInModelFromJson(jsonString);
    }
    return logInModelFromJson(response.reasonPhrase!);
  }
}