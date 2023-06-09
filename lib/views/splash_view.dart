import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:i_fitness/views/home.dart';
import 'package:i_fitness/regis/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../main.dart';
import '../styles/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  String notificationsStr = '';
  getNotifications() {
    //On Terminated
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      print(event);
      if (event != null) {
        // listController.getTodayLists();

        print("notification event: ${event.notification}, notification msg: ${event.notification!.title}");


      }
    });

    //On Foreground
    FirebaseMessaging.onMessage.listen((event) {
      print(event);
      print('Got a message whilst in the foreground!');
      print('Message data: ${event.data}');
      //listController.getTodayLists();
      // if (event.notification != null) {
      //   setState(() {
      //     notificationsStr =
      //     'Title : ${event.notification!.title}, Body : ${event.notification!.body} This is from Foreground State';
      //     MySnackbar.whiteSnackbar('Notification for you', notificationsStr!);
      //   });
      //   print('Message also contained a notification: ${event.notification}');
      // }
    });

    //Background
    FirebaseMessaging.onMessageOpenedApp.listen((event) =>
    // setState(() {
    notificationsStr =
    'Title : ${event.notification!.title}, Body : ${event.notification!.body} This is from Background State'
      //  MySnackbar.whiteSnackbar('Notification for you', notificationsStr!);
      // }),
    );
  }
  @override
  void initState() {
    getNotifications();
    LocalNotificationServices.initialize();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/spbg1.jpg', fit: BoxFit.cover,)
            ),
            Positioned(
                left: 0,
                right: 0,
                child: Hero(
                  tag: 'logo',
                    child: Image.asset('assets/images/logo.png', scale: 9))
            ),
            Positioned(
                left: 35,
                right: 35,
                bottom: 15,
                child: Column(
                  children: [
                    InkWell (
                        onTap: () {
                          if(box.read('isLoading') == true){
                            Get.offAll(()=>const HomePage());
                          }else{
                            Get.to(() => const LoginView());
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
