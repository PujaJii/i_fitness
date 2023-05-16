import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const HeaderView(4),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/gym_a.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black54),
                          child: const Icon(Icons.arrow_back_ios,color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.themeColor,
                                Colors.purple,
                              ],
                            )),
                            child: Center(
                                child: MyWidgets.textView(
                                    'Ends In 15 Days', Colors.white, 11)),
                          ),
                          MyWidgets.textView(
                              'Commit To Getting Fit', Colors.white, 15),
                          MyWidgets.textView('1,548 Participants', Colors.white, 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.themeColor,
                        AppColors.btnColor,
                      ],
                    )),
                child: Center(
                    child: MyWidgets.textView('JOIN CHALLENGE', Colors.white, 16)
                ),
              ),const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: MyWidgets.textView('If you join, your participation will be visible to other participants',
                    Colors.white, 13),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 3,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyWidgets.textView('Target time', Colors.white, 15),
                        MyWidgets.textView('Time Frame', Colors.white, 15),
                        MyWidgets.textView('Eligible sports type', Colors.white, 15),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            MyWidgets.textView(':  20 mins', Colors.white, 15),
                            MyWidgets.textView(':  Up to 22nd Dec 2022', Colors.white, 15),
                            MyWidgets.textView(':  Training', Colors.white, 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ), const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 3,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: MyWidgets.textView('DETAILS :', Colors.white, 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
