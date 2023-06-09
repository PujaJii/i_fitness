import 'package:i_fitness/controllers/register_controller.dart';
import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/button_style.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
 // UserController userController = Get.put(UserController());
  RegisterController registerController =  Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/spbg2.jpg'),
                      fit: BoxFit.cover)),
              child: Container(color: Colors.black38,)
          ),
          Positioned(
              top: 100,
              right: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/images/logo.png', scale: 12),
                  const SizedBox(height: 10),
                  MyWidgets.textView('CREATE', Colors.white, 28,
                      fontWeight: FontWeight.bold),
                  MyWidgets.textView('Account', Colors.white, 18),
                ],
              )),
          Center(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: registerController.name,
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
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: registerController.regEmail,
                            style: TextStyle(fontSize: 13.5, color: AppColors.white),
                            validator: (input) =>
                                !input!.contains('@') ? 'invalid email Format' : null,
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
                            keyboardType: TextInputType.number,
                            controller: registerController.regPassword,
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
                            keyboardType: TextInputType.number,
                            controller: registerController.regRePassword,
                            textInputAction: TextInputAction.done,
                            style: TextStyle(fontSize: 13.5, color: AppColors.white),
                            validator: (input) =>
                            input!.isEmpty ?
                            "Enter confirm password" :
                            input != registerController.regPassword.text ?
                            'Password must be same':
                            null,
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
                                registerController.getRegistered();
                            }
                          },
                          child: MyWidgets.textView("Register  ", AppColors.white, 14,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
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
