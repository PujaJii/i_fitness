import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../controllers/payment_controller.dart';
import '../styles/app_colors.dart';
import '../styles/common_module/my_widgets.dart';





class PaymentPage extends StatefulWidget {
  final dynamic list,planName;
  const PaymentPage({Key? key, required this.list, required this.planName}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

void showAlertDialog(BuildContext context, String title, String message){
  // set up the buttons
  Widget continueButton = ElevatedButton(
    child: const Text("Continue"),
    onPressed:  () {
      Get.back();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay _razorpay = Razorpay();
  final box = GetStorage();
  PaymentController controller = Get.put(PaymentController());


  void handlePaymentErrorResponse(PaymentFailureResponse response){
    showAlertDialog(
        context,
        "Payment Failed",
     //   "Code: ${response.code}\n"
            "Description: ${response.message}\n"
       //     "Metadata:${response.error.toString()}"
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
    controller.proceedPayment(
        widget.list[0].id.toString(),
        response.paymentId.toString(),
        widget.list[0].amt.toString(),
        widget.list[0].endDate.toString()
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void onCheckOut() async {
    var payAmount = widget.list[0].amt.toString();
    // int myAmount = int.parse(payAmount);
     print('my amount .. $payAmount');
    var options = {
      'key': 'rzp_test_UBnA43TkHx28tU',/// Remaining
      'amount': (double.parse(payAmount)*100).roundToDouble().toString(),
      'name': box.read('name'),
      'description': widget.planName.toString(),
      'prefill': {
        'contact': box.read('number'),
        'email':  box.read('email')
      },
      'external' : {
        'wallets' : ['paytm']
      }
    };
    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint('Getting error $e');
    }
  }

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/spbg.jpg',
                fit: BoxFit.cover,
              )),
          Column(
             mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Image.asset('assets/images/logo.png',
                          scale: 14),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Plan name',style: TextStyle(color: Colors.grey[700])),
                        Text(widget.planName.toString()),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Start date',style: TextStyle(color: Colors.grey[700])),
                        Text(widget.list[0].startDate.toString()),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('End date',style: TextStyle(color: Colors.grey[700])),
                        Text(widget.list[0].endDate.toString()),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount',style: TextStyle(color: Colors.grey[700])),
                        Text(widget.list[0].amt.toString()),
                      ],
                    ),
                    SizedBox(height: 50,),
                    InkWell (
                      onTap: () {
                        onCheckOut();
                      },
                      child: Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blueAccent,
                                AppColors.themeColor,
                              ],
                            )
                        ),
                        child: Center(
                            child: MyWidgets.textView('  Pay    ₹ ${widget.list[0].amt.toString()}  ',
                              Colors.white, 15,)),
                      ),
                    )

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}