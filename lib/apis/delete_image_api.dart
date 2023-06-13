import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/delete_image_model.dart';





class DeleteImageApi{

  static final box = GetStorage();

  static Future<DeleteImageModel> deleteImage(
      String Id,
      String User_Id,
      ) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/DeleteImage'));
    request.body = json.encode({
      "Id": Id,
      "User_Id": User_Id
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return deleteImageModelFromJson(jsonString);
    }
    return deleteImageModelFromJson(response.reasonPhrase!);
  }
}
