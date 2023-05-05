
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/edit_profile_model.dart';


class EditProfileApi{
  static var client = http.Client();

  static Future<EditProfileModel> editDetails(
      String name,
      String email,
      String number,
      String currentPassword,
      String newPassword) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post(Uri.parse('${baseUrl}register'), body: {
      'name': name,
      'email':email,
      'number':number,
      'currentPassword':currentPassword,
      'newPassword':newPassword});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return editProfileModelFromJson(jsonString);
    }
    return editProfileModelFromJson(response.body);
  }
}
