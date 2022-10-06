import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserApi{
  static var client = http.Client();

  static Future<UserModel> getLogin(String email, String password) async {
    var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.post(Uri.parse('${baseUrl}login'), body: {'email': email, 'password':password});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userModelFromJson(jsonString);
    }
    return userModelFromJson(response.body);
  }

  static Future<UserModel> getSignUp(String name, String email, String password) async {
    var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.post(Uri.parse('${baseUrl}register'), body: {'name': name, 'email':email,'password':password});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userModelFromJson(jsonString);
    }
    return userModelFromJson(response.body);
  }
}