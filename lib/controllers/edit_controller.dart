
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../apis/edit_profile_api.dart';
import '../styles/commonmodule/my_alert_dilog.dart';
import '../styles/commonmodule/my_snack_bar.dart';
import '../views/profile.dart';

class EditProfileController extends GetxController{

  TextEditingController name = TextEditingController();
  TextEditingController regEmail = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  var isLoading = false.obs;

  editDetails () async {
    MyAlertDialog.circularProgressDialog();
    // final box = GetStorage();

    isLoading(true);
    var api_response = await EditProfileApi.editDetails(
        name.text,regEmail.text,number.text,currentPassword.text,newPassword.text);

    if(api_response!=null){

      if(api_response.response=='ok'){

        Get.offAll(() => ProfilePage(1542));
        MySnackbar.successSnackBar('Register Success', 'Welcome');
      }
      // else if(api_response.response=='user exist'){
      //   Get.back();
      //   MySnackbar.infoSnackBar('SignUp Failed', 'Email Already exist');
      //
      // }
      else{
        Get.back();
        MySnackbar.errorSnackBar('Server Down', 'Please try again later');
      }

    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}