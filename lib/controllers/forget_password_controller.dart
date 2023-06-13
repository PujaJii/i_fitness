import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/forget_password_api.dart';
import 'package:i_fitness/regis/login_view.dart';

import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';




class ForgetPasswordController {
  var isLoading = false.obs;
  final box = GetStorage();
  TextEditingController mail_id = TextEditingController();


  getPassword() async {
    MyAlertDialog.circularProgressDialog();
      isLoading(true);
      var api_Response = await ForgetPasswordApi.forgetPassword(mail_id.text);

      if(api_Response!=null){

        if(api_Response.status=='success'){

          Get.offAll(() => const LoginView());
          // print(loginList);
          MySnackbar.successSnackBar('Check your mail',api_Response.msg.toString());
        }
        else if(api_Response.status=='failed'){
          Get.back();
          MySnackbar.infoSnackBar('Failed',api_Response.msg.toString());
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
