import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import '../models/home_models.dart';


class HomeApi{
  static var client = http.Client();

  static Future<HomeModel> getHomeData(String type) async {
    var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.post(Uri.parse('${baseUrl}vlog'), body: {'type': type});

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return homeModelFromJson(jsonString);
    }
    return homeModelFromJson(response.body);
  }
}