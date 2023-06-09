import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../views/home.dart';
import '../apis/log_in_api.dart';
import '../models/log_in_model.dart';
import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';


class LogInController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var isLoading = false.obs;


  getLogIn () async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    var loginList = <UserInfo>[].obs;
    isLoading(true);
    var api_response = await LogInApi.getLogIn(email.text,password.text);

    if(api_response!=null){

      if(api_response.status=='success'){
        loginList.assignAll(api_response.data!);
        box.write('id', loginList[0].id);
        box.write('name', loginList[0].name);
        box.write('number', loginList[0].phoneNo);
        box.write('email', email.text);
        box.write('token', api_response.token);
        box.write('isSubscribe', api_response.isSubscribe);
        box.write('isLoading', true);
        // print('userdata------------${api_response.isSubscribe}');
        // print('userdata------------${api_response.previousStatus}');
        Get.offAll(() => const HomePage());
        print(loginList);
        MySnackbar.successSnackBar('Welcome','Log in successful');
      }
      else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Failed','Log in failed');
      }
      else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', 'Log in failed');
      }
    }
    else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}