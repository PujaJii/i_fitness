import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_fitness/controllers/forget_password_controller.dart';

import '../styles/app_colors.dart';
import '../styles/button_style.dart';
import '../styles/common_module/my_widgets.dart';





class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/spbg1.jpg'),
                      fit: BoxFit.cover)),
              child: Container(color: Colors.black38,)
          ),
          Center(
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/logo.png',),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: TextFormField(
                        controller: forgetPasswordController.mail_id,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                        input!.isEmpty ? "Enter Your mail" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter Your mail',
                          labelText: '   Mail Id',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 120),
                    child: ElevatedButton(
                        style: curveButtonStyleThemeColor,
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            forgetPasswordController.getPassword();
                          }
                        },
                        child: MyWidgets.textView("Send mail", AppColors.white, 14,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}