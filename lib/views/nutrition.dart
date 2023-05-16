import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/daily_videos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/commonmodule/blogs.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> cats = [
      'The Basics',
      'Weight Loss',
      'Muscle Gain',
      'Cross Training',
    ];
    List<String> heading = [
      'Add Variety to your healthy diet',
      'Why Weight Loss is important?',
      'Every workout for everyone',
      'Why Cross-Training Is Effective for All?',
    ];
    List<String> img = [
      'assets/images/nutrition.png',
      'assets/images/nutrition1.png',
      'assets/images/gym_f.png',
      'assets/images/gym_h.png',
    ];
    List<String> des = [
      MyBlogs.theBasic,
      MyBlogs.weightLoss,
      MyBlogs.muscleGain,
      MyBlogs.crossTraining,
    ];

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/loginbg.jpg',
                fit: BoxFit.cover,
              )
          ),
          ListView(
            children: [
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
                padding: const EdgeInsets.only(left: 15.0),
                child: MyWidgets.textView('Health & Nutrition', Colors.white, 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/fruits.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 5,top: 5),
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
                    ],
                  ),
                ),
              ),const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10,right: 20),
                child:
                MyWidgets.textView('A solid nutrition foundation goes hand in hand with your'
                    ' training plan. Our week by week guide helps you maximise your result !',
                    Colors.white, 13),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: (4/3)),
                  itemCount: cats.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                       onTap: () {
                         Get.to(() => DailyVideos(img[index],cats[index],heading[index],des[index]));
                       },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(img[index]),
                              fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: GridTile(
                            footer: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              height: 45,
                              child: GridTileBar(
                                backgroundColor: Colors.grey,
                                title: Center(child: MyWidgets.textView(cats[index], Colors.white, 17))
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container()
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
               )  
            ],
          )
        ],
      ),
    );
  }
}
