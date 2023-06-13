import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../apis/regiter_api.dart';
import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';
import '../regis/register1.dart';


class RegisterController extends GetxController{

  TextEditingController name = TextEditingController();
  TextEditingController regEmail = TextEditingController();
  TextEditingController regPassword = TextEditingController();
  TextEditingController regRePassword = TextEditingController();


  var isLoading = false.obs;


  getRegistered () async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    isLoading(true);
    var api_response = await RegisterApi.getRegister(name.text,regEmail.text,regPassword.text);

    if(api_response!=null){

      if(api_response.status=='success'){


        box.write('name', name.text);
        box.write('email', regEmail.text);
        //box.write('isLoading', true);
        box.write('isSubscribe', api_response.isSubscribe.toString());
        Get.offAll(() => const Register1());
        MySnackbar.successSnackBar('Welcome', api_response.msg.toString());
       }else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('SignUp Failed', api_response.msg.toString());

      }else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', api_response.status.toString());
      }

    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}