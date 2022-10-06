import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/show_plan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imglist = [
      'assets/images/gym_l.png',
      'assets/images/gym_j.jpg',
      'assets/images/gym_k.jpg',
    ];
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,),
                child: MyWidgets.textView('PLANS', Colors.white, 19,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CarouselSlider.builder(
                itemCount: imglist.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                      image: DecorationImage(
                          image: AssetImage(imglist[itemIndex]),
                          fit: BoxFit.cover)),
                ),
                options: CarouselOptions(
                  height: 180,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 900),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 10),
              MyWidgets.textView('12 - Week Body Transformation', Colors.white, 20),
              MyWidgets.textView('Get fit with your personalised plan', Colors.white, 15),
              const SizedBox(height: 20,),
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage('assets/images/workout_a.png'),
                        fit: BoxFit.cover)
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                        left: 5,
                        child: MyWidgets.textView('Daily Workout', Colors.white, 20)),
                  ],
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(10),
                child: MyWidgets.textView('Plan your workout, subscribe to new personalised plan and stay healthy',
                    Colors.white, 16),
              )),
            ],
          ),
          Positioned(
            bottom: 80,
            right: 100,
            left: 100,
            child: InkWell(
              onTap: () {
                Get.to(() => const ShowPlanPage());
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.themeColor,
                        Colors.purple,
                      ],
                    )),
                child: Center(
                    child: MyWidgets.textView('Show Plan', Colors.white, 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
