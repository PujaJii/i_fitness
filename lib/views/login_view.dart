import 'package:i_fitness/controllers/user_controller.dart';
import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/button_style.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginView extends StatefulWidget {



  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  UserController userController = Get.put(UserController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/spbg1.jpg', fit: BoxFit.cover,)
          ),
          Positioned(
            top: 100,
              right: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Hero(
                      tag: 'logo',
                      child: Image.asset('assets/images/logo.png', scale: 10)),
                  const SizedBox(height: 30),
                  MyWidgets.textView('LOGIN', Colors.black, 30, fontWeight: FontWeight.bold),
                    MyWidgets.textView('Here', Colors.black, 20),
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
                        controller: userController.emailTEC,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                        !input!.contains("@") ? "invalid email Format" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 18.0),
                          hintText: 'Enter Email',
                          labelText: '   Enter Email',
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              // light
                              fontStyle: FontStyle.normal),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: AppColors.white,
                              )
                          ),
                        )
                    ),
                  ),

                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                        obscureText: true,
                        controller: userController.passwordTEC,
                        // keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 13.5, color: AppColors.white),
                        validator: (input) =>
                        input!.isEmpty ? "Enter password" : null,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white70),
                          fillColor: AppColors.btnColor,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 18.0),
                          hintText: 'Enter password',
                          labelText: '   Enter password',
                          labelStyle: const TextStyle(
                              fontSize: 14,
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
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          userController.getLogin();
                        }


                      }, child: MyWidgets.textView("Login", AppColors.white, 14, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 30,
            child: InkWell(
              onTap: (){
                Get.to(() => const RegisterView());
              },
              child: Column(
                children: [
                  MyWidgets.textView('Do not have any account ?', AppColors.offWhite, 12),
                  MyWidgets.textView('Signup  |  Register', AppColors.offWhite, 14, fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
