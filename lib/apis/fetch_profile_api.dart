import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:i_fitness/models/fetch_profile_model.dart';
import 'package:http/http.dart' as http;

class FetchProfileApi{

  static final box = GetStorage();

  static Future<FetchProfileModel> fetchProfile(
      String User_Id,
      ) async {

    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}RegisterApi/FetchProfile?User_Id=${User_Id}'));
    // request.body = json.encode({
    //   "User_Id": User_Id,
    // });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return fetchProfileModelFromJson(jsonString);
    }
    return fetchProfileModelFromJson(response.reasonPhrase!);
  }
}