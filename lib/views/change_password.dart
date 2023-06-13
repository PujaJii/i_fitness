import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_fitness/controllers/edit_controller.dart';

import '../styles/app_colors.dart';
import '../styles/button_style.dart';
import '../styles/common_module/my_widgets.dart';




class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  EditProfileController editProfileController = Get.find();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/spbg.jpg', fit: BoxFit.cover,)
            ),
            Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: TextFormField(
                      controller: editProfileController.oldPass,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        // validator: (input) =>
                        // input!.isEmpty ? "Enter Your Name" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter Current Password',
                          labelText: '   Current Password',
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: TextFormField(
                        controller: editProfileController.Pass,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        // validator: (input) =>
                        // input!.isEmpty ? "Enter Your Name" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter New Password',
                          labelText: '   New Password',
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: TextFormField(
                        controller: editProfileController.confirmPass,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        // validator: (input) =>
                        // input!.isEmpty ? "Enter Your Name" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter Confirm Password',
                          labelText: '   Confirm Password',
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
                            editProfileController.changePassword();
                          }
                        },
                        child: MyWidgets.textView("Submit", AppColors.white, 14,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
