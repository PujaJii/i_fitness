import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/subscribe_api.dart';
import 'package:i_fitness/models/subscription_model.dart';
import 'package:i_fitness/views/payment.dart';

import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';


class SubscribeController extends GetxController{


  var isLoading = false.obs;


  subscribePlan (String planId, String amount, String planName) async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    var subscribeData = <DataList>[].obs;
    isLoading(true);
    var api_response = await SubscribeApi.subscribe(box.read('id').toString(),planId,amount);

    if(api_response!=null){

      if(api_response.status=='success'){
        Get.back();
        subscribeData.assignAll(api_response.data!);
        MySnackbar.successSnackBar('Completed','Your Plan Subscribe successfully');
        Get.to(()=> PaymentPage(list: subscribeData,planName: planName,));

      }else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Failed',api_response.msg.toString());
      }else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', api_response.msg.toString());
      }
    } else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}