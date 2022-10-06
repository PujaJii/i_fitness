import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/button_style.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/loginbg.jpg',
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 100,
              right: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/images/logo.png', scale: 2.2),
                  const SizedBox(height: 30),
                  MyWidgets.textView('CREATE', Colors.white, 30,
                      fontWeight: FontWeight.bold),
                  MyWidgets.textView('Account', Colors.white, 20),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    //padding: Ed,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: userController.name,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                        input!.isEmpty ? "Enter Your Name" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter Name',
                          labelText: '   Enter Name',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              // light
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    //padding: Ed,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: userController.regEmail,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                            !input!.contains("@") ? "invalid email Format" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter email',
                          labelText: '   Enter email',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              // light
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    //padding: Ed,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        obscureText: true,
                        controller: userController.regPassword,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                            input!.isEmpty ? "Enter password" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter password',
                          labelText: '   Enter password',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              // light
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    //padding: Ed,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        obscureText: true,
                        controller: userController.regRepassword,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                        input!.isEmpty ? "Enter confirm password" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          hintText: 'Enter confirm password',
                          labelText: '   Enter confirm password',
                          labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              // light
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )),
                        )),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: curveButtonStyleThemeColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if(userController.regPassword.text == userController.regRepassword.text){
                            userController.getSignUp();
                          }
                        }
                      },
                      child: MyWidgets.textView("Register  ", AppColors.white, 14,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 30,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Column(
                children: [
                  MyWidgets.textView(
                      'Already having account ?', AppColors.offWhite, 12),
                  MyWidgets.textView('Signin  |  Login', AppColors.offWhite, 14,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
