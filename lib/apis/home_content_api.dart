import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/home_content_model.dart';


class HomeContentApi{
  static var client = http.Client();

  static Future<HomeContentModel> getHomeContent() async {
    var baseUrl = GlobalConfiguration().get('base_url');
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = await client.get(Uri.parse('${baseUrl}HomeApi/HomePage'));
    request.headers.addAll(headers);

    //http.StreamedResponse response = await request.send();

    if (request.statusCode == 200) {
      var jsonString = request.body;
      return homeContentModelFromJson(jsonString);
    }
    return homeContentModelFromJson(request.body);
  }
}