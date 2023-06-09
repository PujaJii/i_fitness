import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/controllers/plan_data_controller.dart';
import 'package:i_fitness/styles/common_module/header.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_fitness/views/show_plan.dart';

import '../styles/app_colors.dart';


class NutritionPage extends StatelessWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlanDataController planDataController = Get.put(PlanDataController());
    final box = GetStorage();

    // List<String> cats = [
    //   'The Basics',
    //   'Weight Loss',
    //   'Muscle Gain',
    //   'Cross Training',
    // ];
    // List<String> heading = [
    //   'Add Variety to your healthy diet',
    //   'Why Weight Loss is important?',
    //   'Every workout for everyone',
    //   'Why Cross-Training Is Effective for All?',
    // ];
    // List<String> img = [
    //   'assets/images/nutrition.png',
    //   'assets/images/nutrition1.png',
    //   'assets/images/gym_f.png',
    //   'assets/images/gym_h.png',
    // ];
    // List<String> des = [
    //   MyBlogs.theBasic,
    //   MyBlogs.weightLoss,
    //   MyBlogs.muscleGain,
    //   MyBlogs.crossTraining,
    // ];

    return Scaffold(
      body: Stack(
        children:[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/loginbg.jpg',
                fit: BoxFit.cover,
              )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
              const HeaderView(8),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 15),
                child: MyWidgets.textView('Health & Nutrition', Colors.white, 18),
              ),
              box.read('isSubscribe').toString() == '0'?
              Container(
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset('assets/images/logo.png',
                          scale: 18),
                    ),
                    Column(
                      children: [
                        Text('Please Subscribe for unlock\nthis section!!',textAlign: TextAlign.center),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: () {
                            Get.to(()=> ShowPlanPage());
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: box.read('isSubscribe').toString() == '1'
                                    ? LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.grey,
                                    Colors.grey,
                                  ],
                                )
                                    : LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blueAccent,
                                    AppColors.themeColor,
                                  ],
                                )),
                            child: Center(
                                child: MyWidgets.textView(
                                  'Subscribe',
                                  Colors.white,
                                  15,
                                )),
                          ),
                        ),
                        // Text(
                        //     'Expires on ${box.read('expire_date').toString()}'),
                      ],
                    ),
                  ],
                ),
              ):
              Expanded(
                child: GetX<PlanDataController>(
                  initState: (context) {
                    planDataController.fetchPlansData();
                  },
                  builder: (controller) {
                    if(controller.isLoading.value){
                      return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.btnColor2,
                          ));
                    }else{
                      return Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              // shrinkWrap: true,
                              itemCount : controller.list.length,
                              itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white12,
                                        image: DecorationImage(image: NetworkImage(controller.list[index].imgUrl.toString()),fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: MyWidgets.textView(controller.list[index].title.toString(), Colors.white, 18,fontWeight: FontWeight.bold),
                                  ),const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MyWidgets.textView(controller.list[index].title.toString(),
                                        Colors.white, 12),
                                  )
                                ],
                              );
                            },),
                          ),
                        ],
                      );
                    }
                },),
              )
              // Container(
              //   width: double.infinity,
              //   height: 180,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.white,
              //       image: const DecorationImage(
              //           image: AssetImage('assets/images/fruits.png'),
              //           fit: BoxFit.cover)),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 8, bottom: 5,top: 5),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         InkWell(
              //           onTap: () {
              //             Get.back();
              //           },
              //           child: Container(
              //             padding: const EdgeInsets.only(left: 8),
              //             height: 30,
              //             width: 30,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(15),
              //                 color: Colors.black54),
              //             child: const Icon(Icons.arrow_back_ios,color: Colors.white),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),const SizedBox(height: 15,),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, top: 10,right: 20),
              //   child:
              //   MyWidgets.textView('A solid nutrition foundation goes hand in hand with your'
              //       ' training plan. Our week by week guide helps you maximise your result !',
              //       Colors.white, 13),
              // ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,childAspectRatio: (4/3)),
              //     itemCount: cats.length,
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //          onTap: () {
              //            Get.to(() => DailyVideos(img[index],cats[index],heading[index],des[index]));
              //          },
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage(img[index]),
              //                 fit: BoxFit.cover),
              //               borderRadius: BorderRadius.circular(30),
              //               color: Colors.white),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: GridTile(
              //               footer: Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   color: Colors.white,
              //                 ),
              //                 height: 45,
              //                 child: GridTileBar(
              //                   backgroundColor: Colors.grey,
              //                   title: Center(child: MyWidgets.textView(cats[index], Colors.white, 17))
              //                 ),
              //               ),
              //               child: Stack(
              //                 children: [
              //                   Container()
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //  )
            ],
          )
        ],
      ),
    );
  }
}
