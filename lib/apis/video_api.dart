import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import '../models/video_model.dart';



class VideoApi{
  static var client = http.Client();

  static Future<VideoModel> getVideoData(String cat_id) async {
    print('cat_id in api: $cat_id');
   // var baseUrl = GlobalConfiguration().get('base_url');

    var response = await client.post(Uri.parse('https://iwebnext.us/fitness/public/api/video'), body: {'cat_id': cat_id});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return videoModelFromJson(jsonString);
    }
    return videoModelFromJson(response.body);
  }
}