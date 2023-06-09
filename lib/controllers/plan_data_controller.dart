import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/plan_data_api.dart';

import '../models/plan_data_model.dart';





class PlanDataController extends GetxController{

  var isLoading = false.obs;
  final box = GetStorage();
  var list = <PlanData>[];

  fetchPlansData() async {
    try {
      isLoading(true);
      var apiResponse = await PlanDataApi.getPlanData();

      if (apiResponse != null) {
        if (apiResponse.status == 'success') {
          list.assignAll(apiResponse.data!);
          print('done plans');
        }
      }
    } finally {
      isLoading(false);
    }
  }
}