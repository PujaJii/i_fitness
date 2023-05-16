import 'package:http/http.dart' as http;
import '../models/cat_model.dart';



class CatApi{
  static var client = http.Client();

  static Future<CatModel> getCatData() async {
   // var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.post(Uri.parse('https://iwebnext.us/fitness/public/api/cat'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return catModelFromJson(jsonString);
    }
    return catModelFromJson(response.body);
  }
}