import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/upload_progress_image.dart';




class UploadImageApi{
  static var client = http.Client();
  static final box = GetStorage();

  static Future<UploadImageModel> uploadImage(
      String ImgUrl,
      String User_Id,
      ) async {
    var baseUrl = GlobalConfiguration().get('base_url');

    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}RegisterApi/UploadImage'));
    request.body = json.encode({
      "ImgUrl": ImgUrl,
      "User_Id": User_Id
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return uploadImageModelFromJson(jsonString);
    }
    return uploadImageModelFromJson(response.reasonPhrase!);
  }
}
