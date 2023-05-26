
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../apis/edit_profile_api.dart';
import '../styles/commonmodule/my_alert_dilog.dart';
import '../styles/commonmodule/my_snack_bar.dart';
import '../views/profile.dart';

class EditProfileController extends GetxController{

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();


  var isLoading = false.obs;
  var isLoading1 = false.obs;

  editDetails (String imageBase64) async {
    MyAlertDialog.circularProgressDialog();
     final box = GetStorage();

    isLoading(true);
    var api_response = await EditProfileApi.editDetails(
      box.read('id').toString(), name.text,number.text,imageBase64);

    if(api_response!=null){

      if(api_response.status=='success') {

        Get.offAll(() => const ProfilePage(1542));
        MySnackbar.successSnackBar('Updated', api_response.msg.toString());
      }
      else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Update Failed', api_response.msg.toString());
      }
      else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', 'Please try again later');
      }
    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }


  TextEditingController oldPass = TextEditingController();
  TextEditingController Pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();


  changePassword () async {
    MyAlertDialog.circularProgressDialog();
     final box = GetStorage();

    isLoading1(true);
    var api_response = await EditProfileApi.changePassword(
      box.read('id').toString(),
      oldPass.text,
      Pass.text,
      confirmPass.text,
    );

    if(api_response!=null){

      if(api_response.status=='success') {

        Get.offAll(() => const ProfilePage(1542));
        MySnackbar.successSnackBar('Updated', api_response.msg.toString());
      }
      else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Update Failed', api_response.msg.toString());
      }
      else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', 'Please try again later');
      }
    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}