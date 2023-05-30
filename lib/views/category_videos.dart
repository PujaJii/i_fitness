import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/video_controllers/new_view.dart';
import 'package:i_fitness/views/notification.dart';
import 'package:i_fitness/views/profile.dart';
import 'package:i_fitness/views/start_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cat_video_controller.dart';
import '../styles/app_colors.dart';

class CategoryVideos extends StatelessWidget {
  final String cat_id;
  const CategoryVideos(this.cat_id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatVideoController catVideoController = Get.put(CatVideoController());
    return Scaffold(
      body: GetX<CatVideoController>(initState: (context) {
        catVideoController.getVideoList(cat_id);
      }, builder: (controller) {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: AppColors.btnColor2,));
        } else {
          debugPrint('Data fetched');
          return
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/spbg.jpg',
                      fit: BoxFit.cover,
                    )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              padding: const EdgeInsets.only(left: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black54),
                              child: const Icon(Icons.arrow_back_ios,color: Colors.white),
                            ),
                          ),
                          MyWidgets.textView(controller.videoList[0].type.toString(), Colors.white, 25),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(() => const NotificationPage());
                                  },
                                  child: const Icon(Icons.notifications_on_outlined,
                                    color: Colors.white,size: 26,)
                              ),
                              const SizedBox(width: 20,),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const ProfilePage(10));
                                },
                                child: const Hero(
                                  tag: 'a10',
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundImage: AssetImage('assets/images/profile.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyWidgets.textView(
                          'The main focus of this workout is your core & abs withs some extra exercises targeting your arms, butt & thighs',
                          Colors.white, 14),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(Icons.access_time_rounded,color: Colors.white,)
                        ),
                        MyWidgets.textView('   Estimated time : ', Colors.white, 14)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/trend.png',color: Colors.white),
                        ),
                        MyWidgets.textView('    Intermediate', Colors.white, 14)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('assets/images/stretching.png',color: Colors.white),
                        ),
                        MyWidgets.textView('   Abs & core, Legs, upper body', Colors.white, 14)
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: MyWidgets.textView('Warm Up', Colors.white, 22)
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.videoList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                            height: 100,
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.to(()=> StartWorkout(controller.videoList[index].url!,
                                  controller.videoList[index].name!,
                                  controller.videoList[index].des!,
                                ));
                              },
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  Container(
                                    height: 80,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                   child: NewView(
                                     controller.videoList[index].url!
                                   ),
                                  ),const SizedBox(width: 20,),
                                  MyWidgets.textView(controller.videoList[index].name!, Colors.white, 15)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            );
        }
      }
      ),
    );
  }
}

