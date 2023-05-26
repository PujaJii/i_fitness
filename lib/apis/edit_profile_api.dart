import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/edit_profile_model.dart';


class EditProfileApi{
  static var client = http.Client();
  static final box = GetStorage();

  static Future<EditProfileModel> editDetails(
      String Id,
      String Name,
      String Phone_No,
      String Profile_Picture,
      ) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/EditProfile'));
    request.body = json.encode({
      "Id": Id,
      "Name": Name,
      "Phone_No": Phone_No,
      "Profile_Picture": Profile_Picture
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return editProfileModelFromJson(jsonString);
    }
    return editProfileModelFromJson(response.reasonPhrase!);
  }




   static Future<EditProfileModel> changePassword(
      String Id,
      String OldPassword,
      String Password,
      String ConfirmPassword,
      ) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/ChangePassword'));
    request.body = json.encode({
      "Id": Id,
      "OldPassword": OldPassword,
      "Password": Password,
      "ConfirmPassword": ConfirmPassword,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return editProfileModelFromJson(jsonString);
    }
    return editProfileModelFromJson(response.reasonPhrase!);
  }


}
