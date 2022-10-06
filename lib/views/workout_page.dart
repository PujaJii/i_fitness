import 'package:i_fitness/controllers/workout_controller.dart';
import 'package:i_fitness/views/category_videos.dart';
import 'package:i_fitness/views/foxtrot.dart';
import 'package:i_fitness/views/my_videoplayer.dart';
import 'package:i_fitness/views/pause_video.dart';
import 'package:i_fitness/views/start_workout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import '../styles/commonmodule/header.dart';
import '../styles/commonmodule/my_widgets.dart';
import 'customise_workout.dart';


class WorkOut extends StatelessWidget {
  const WorkOut({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    WorkoutController workoutController = Get.put(WorkoutController());

    return Scaffold(
      body: GetX<WorkoutController>(initState: (context) {
        workoutController.getCatList();
        workoutController.getVideoList("0");
      }, builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          print('Data fetched');
          return
          Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset('assets/images/loginbg.jpg', fit: BoxFit.cover,)
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        HeaderView(2),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0,left: 5,right: 5),
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: MyWidgets.textView('Good Morning', Colors.white, 17),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: MyWidgets.textView('Is this time for your workout ?', Colors.white, 14),
                            ),
                          ],
                        ),const SizedBox(height: 10,),
                        InkWell(
                          onTap: () {
                            Get.to(() => FoxtrotPage());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.only(top: 150,left: 15),
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.white,
                                image:DecorationImage(
                                    image: AssetImage('assets/images/gym_d.png'),
                                    fit: BoxFit.cover)
                            ),
                            child: MyWidgets.textView('FOXTROT', Colors.white , 20,fontWeight: FontWeight.bold),
                          ),
                        ), const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            height: 3,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: MyWidgets.textView('Guided Workout', Colors.white, 17),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 10),
                              child: MyWidgets.textView('See more', Colors.white, 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child:
                          InViewNotifierList(

                            scrollDirection: Axis.horizontal,
                            itemCount: controller.videoList.length,
                            isInViewPortCondition: (double deltaTop, double deltaBottom, double viewPortDimension)
                            {
                              return deltaTop < (0.5 * viewPortDimension)+ 100.0 &&
                                  deltaBottom > (0.5 * viewPortDimension)- 100.0;
                            },
                            builder: (BuildContext context, int index) {
                              return InViewNotifierWidget(
                                id: '$index',
                                builder: (BuildContext context, bool isInView,
                                    Widget? child) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(()=> StartWorkout(
                                        controller.videoList[index].url.toString(),
                                        controller.videoList[index].name.toString(),
                                        controller.videoList[index].des.toString()
                                      ));
                                    },
                                    child: Container(
                                        width: 320,
                                        height: 200,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                          color: Colors.white12,
                                        ),
                                        margin: const EdgeInsets.all(8),
                                      child: isInView?
                                      MyVideoPlayer(
                                          controller.videoList[index].url.toString(),
                                          controller.videoList[index].name.toString(),
                                          controller.videoList[index].duration.toString())
                                          :VideoPause(controller.videoList[index].url.toString())
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            height: 3,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: MyWidgets.textView('Categories', Colors.white, 17),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, top: 10),
                              child: MyWidgets.textView('See more', Colors.white, 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.catList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(()=> CategoryVideos(controller.catList[index].id.toString()));
                                },
                                child: Container(
                                  width: 210,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white12,
                                      image:  DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(controller.catList[index].url!)
                                      )
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.only(left: 10,top: 90),
                                 child: MyWidgets.textView(controller.catList[index].title!, Colors.white, 15),
                                ),
                              );
                            },
                          ),
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
                        InkWell(
                          onTap: () {
                            Get.to(()=> const CustomiseWorkout());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: Colors.white,
                                image:DecorationImage(
                                    image: AssetImage('assets/images/gym_d.png'),
                                    fit: BoxFit.cover)),
                            child:
                            Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyWidgets.textView('Customise', Colors.white , 30,fontWeight: FontWeight.bold),
                                MyWidgets.textView('Your Workout', Colors.white , 19),
                              ],
                            ),
                          ),
                        ),


                        const SizedBox(height: 50,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60,)
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
