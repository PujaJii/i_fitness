import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../apis/user_api.dart';
import '../styles/commonmodule/my_alert_dilog.dart';
import '../styles/commonmodule/my_snack_bar.dart';
import '../views/home.dart';
import '../views/register1.dart';


class UserController extends GetxController{
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController regEmail = TextEditingController();
  TextEditingController regPassword = TextEditingController();
  TextEditingController regRepassword = TextEditingController();



  var isLoading = false.obs;


  getLogin () async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    isLoading(true);
    var api_response = await UserApi.getLogin(emailTEC.text, passwordTEC.text);

    if(api_response!=null){

      if(api_response.response=='ok'){

        String id = api_response.userData!.id.toString();
        String email = api_response.userData!.email.toString();


        box.write('id', id);
        box.write('email', email);
        box.write('isLoading', 'true');
        Get.offAll(() => const HomePage());
        MySnackbar.successSnackBar('Login Success', 'Welcome');
      }else if(api_response.response=='invalid email'){
        Get.back();
        MySnackbar.infoSnackBar('Invalid Email', 'Invalid email, please try again with another one');

      }else if(api_response.response=='invalid Password!'){
        Get.back();
        MySnackbar.infoSnackBar('Invalid password', 'Invalid password, please try again with another one');

      }else{
        Get.back();
        MySnackbar.errorSnackBar('Server Down', 'Please try again later');
      }

    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }

  getSignUp () async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    isLoading(true);
    var api_response = await UserApi.getSignUp(name.text,regEmail.text,regPassword.text);

    if(api_response!=null){

      if(api_response.response=='ok'){

        String id = api_response.userData!.id.toString();
        String name = api_response.userData!.name.toString();
        String email = api_response.userData!.email.toString();

        box.write('id', id);
        box.write('name', name);
        box.write('email', email);
        box.write('isLoading', 'true');
        Get.offAll(() => const Register1());
        MySnackbar.successSnackBar('Register Success', 'Welcome');
      }else if(api_response.response=='user exist'){
        Get.back();
        MySnackbar.infoSnackBar('SignUp Failed', 'Email Already exist');

      }else{
        Get.back();
        MySnackbar.errorSnackBar('Server Down', 'Please try again later');
      }

    }else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}