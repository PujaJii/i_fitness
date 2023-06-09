
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/delete_image_api.dart';
import 'package:i_fitness/apis/upload_imae_api.dart';
import 'package:i_fitness/models/delete_image_model.dart';
import 'package:i_fitness/models/upload_progress_image.dart';
import 'package:i_fitness/views/home.dart';
import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';

class UploadImageController extends GetxController{


  var isLoading = false.obs;

  uploadImage (String imageBase64) async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    var list = <UploadedImage>[];

    isLoading(true);
    var api_response = await UploadImageApi.uploadImage(
        imageBase64, box.read('id').toString());

    if(api_response!=null){

      if(api_response.status=='success') {

        list.assignAll(api_response.data!);

        Get.offAll(() => const HomePage());
        MySnackbar.successSnackBar('Uploaded', api_response.msg.toString());
      }
      else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('upload Failed', api_response.msg.toString());
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

  deleteImage (String imageId) async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    var list = <ListAfterDelete>[];

    isLoading(true);
    var api_response = await DeleteImageApi.deleteImage(
        imageId, box.read('id').toString());

    if(api_response!=null){

      if(api_response.status=='success') {

        list.assignAll(api_response.data!);
        Get.offAll(() => const HomePage());
        MySnackbar.successSnackBar('Deleted', api_response.msg.toString());
      }
      else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Delete Failed', api_response.msg.toString());
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