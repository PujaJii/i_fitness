import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/apis/payment_api.dart';
import 'package:i_fitness/views/home.dart';
import '../styles/common_module/my_alert_dialog.dart';
import '../styles/common_module/my_snack_bar.dart';


class PaymentController extends GetxController{


  var isLoading = false.obs;


  proceedPayment (String Id, String Txn_Id, String Amt, String expire_date) async {
    MyAlertDialog.circularProgressDialog();
    final box = GetStorage();
    isLoading(true);
    var api_response = await PaymentApi.proceedPay(Id,Amt,Txn_Id);

    if(api_response!=null){

      if(api_response.status=='success'){
        Get.offAll(()=> HomePage());
        MySnackbar.successSnackBar('Payment Complete','Your Plan Activated successfully');
        box.write('isPaid', true);
        box.write('expire_date', expire_date);

      }else if(api_response.status=='failed'){
        Get.back();
        MySnackbar.infoSnackBar('Failed','Payment Failed');
      }else{
        Get.back();
        MySnackbar.errorSnackBar('Internal Server Down', 'Payment Failed');
      }
    } else{
      Get.back();
      MySnackbar.errorSnackBar('Server Down', 'Please try again later');
    }
  }
}