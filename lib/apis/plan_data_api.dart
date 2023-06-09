import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/plan_data_model.dart';



class PlanDataApi{
  static var client = http.Client();


  static Future<PlanDataModel> getPlanData() async {
    final box = GetStorage();
    var baseUrl = GlobalConfiguration().get('base_url');
    var headers = {
      'Authorization': 'Bearer ${box.read('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}SubscriptionApi/PlaDetails?Plan_Id=${2}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonString = await response.stream.bytesToString();
      return planDataModelFromJson(jsonString);
    }
    return planDataModelFromJson(request.body);
  }
}