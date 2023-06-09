import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:i_fitness/models/fetch_plan_model.dart';



class FetchPlanApi{
  static var client = http.Client();

  static Future<FetchPlanModel> getPlans() async {
    var baseUrl = GlobalConfiguration().get('base_url');


    var response = await client.get(Uri.parse('${baseUrl}PlansApi/FetchPlans'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return fetchPlanModelFromJson(jsonString);
    }
    return fetchPlanModelFromJson(response.body);
  }
}