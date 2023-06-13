import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/all_images.dart';


class FetchImagesApi{
  // static var client = http.Client();

  static Future<ImageListModel> getDailyImages() async {
    final box = GetStorage();
    var baseUrl = GlobalConfiguration().get('base_url');
    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}RegisterApi/FetchAllImage?User_Id=${box.read('id').toString()}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return imageListModelFromJson(jsonString);
    }
    return imageListModelFromJson(request.body);
  }
}