import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/fetch_plan_api.dart';

import '../models/fetch_plan_model.dart';




class FetchPlanController extends GetxController{

  var isLoading = false.obs;
  final box = GetStorage();
  var list = <PlansList>[];

  fetchPlans() async {
    try {
      isLoading(true);
      var apiResponse = await FetchPlanApi.getPlans();

      if (apiResponse != null) {
        if (apiResponse.status == 'success') {
          list.assignAll(apiResponse.plansList!);
          print('done plans');
        }
      }
    } finally {
      isLoading(false);
    }
  }
}