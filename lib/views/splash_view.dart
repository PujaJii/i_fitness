import 'dart:async';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/home.dart';
import 'package:i_fitness/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../styles/app_colors.dart';

class SplashView extends StatelessWidget {
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
//    print('userId`````````````: ${box.read('userId')}');
    Timer(const Duration(seconds: 4), () {
      //Get.offAll(HomeView());
      if (box.hasData('login')) {

      } else {
        //Get.offAll(LoginView());
      }
    });

    return Scaffold(
        body:
        Stack(
          children: [
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Image.asset('assets/images/spbg1.jpg', fit: BoxFit.cover,)
            ),
            //getstbg.png
            Positioned(
                left: 0,
                right: 0,
                child: Hero(
                  tag: 'logo',
                    child: Image.asset('assets/images/logo.png', scale: 9))),

            Positioned(
                left: 35,
                right: 35,
                bottom: 15,
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          if(box.read('isLoading')=='true'){
                            Get.offAll(()=>const HomePage());
                          }else{
                            Get.to(() =>  LoginView());
                          }
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.themeColor,
                              Colors.blueAccent,
                            ],
                          )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyWidgets.textView('Get Started', Colors.white, 20),
                              const SizedBox(width: 15,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(Icons.arrow_forward_ios,size: 15),
                              )
                            ],
                          ),
                        )
                    ),
                    const SizedBox(height: 6),
                    MyWidgets.textView(
                        'My continuing, you accept our Terms of Service\nand acknowledge receipt of out Privacy Policy',
                        Colors.white60, 12)
                  ],
                )
            )
          ],
        )
    );
  }
}
