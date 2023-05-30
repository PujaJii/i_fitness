import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/subscribe_api.dart';
import 'package:i_fitness/models/subscription_model.dart';

import '../styles/commonmodule/my_alert_dilog.dart';
import '../styles/commonmodule/my_snack_bar.dart';


class SubscribeController extends GetxController{


  var isLoading = false.obs;


  getLogIn (String planId, String amount) async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    var subscribeData = <SubscribeInfo>[].obs;
    isLoading(true);
    var api_response = await SubscribeApi.subscribe(box.read('id'),planId,amount);

    if(api_response!=null){

      if(api_response.status=='success'){
        subscribeData.assignAll(api_response.data!);
        MySnackbar.successSnackBar('Welcome','Log in successful');
      }else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Failed','Log in failed');
      }else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', 'Log in failed');
      }
    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}