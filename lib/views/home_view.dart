import 'package:i_fitness/controllers/home_controller.dart';
import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/blogSeeMore.dart';
import 'package:i_fitness/views/new_view.dart';
import 'package:i_fitness/views/my_video_view.dart';
import 'package:i_fitness/views/video_see_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

  return Scaffold(
    body:
            //GetX initialized
    GetX<HomeController>(
        initState: (context) {
      homeController.getHomeVideo('video');
      homeController.getHomeImg('img');
      }, builder: (controller) {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator(color: AppColors.btnColor2,));
      } else {
        // print('Data fetched');
        return Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/loginbg.jpg',
                  fit: BoxFit.cover,
                )
            ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      HeaderView(0),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 20, top: 25),
                              child: MyWidgets.textView(
                                  'Daily Videos', Colors.white, 18)),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 10),
                            child: InkWell(
                                onTap: () {
                                  Get.to(() =>  SeeMoreVideo());
                                },
                                child: const Text(
                                  'See more',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.videoList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() =>  MyVideoView(
                                    controller.videoList[index].link!,
                                    controller.videoList[index].title!,
                                    controller.videoList[index].description!,
                                    controller.videoList[index].type!,
                                  )
                                  );
                                },
                                child: Container(
                                    width: 240,
                                    height: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white12,
                                    ),
                                    margin: const EdgeInsets.all(8),
                                    child: NewView(controller
                                        .videoList[index].link!)),
                              );
                            },
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 15),
                            child: Text(
                              'Our Blogs',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 8),
                            child: InkWell(
                                onTap: () {
                                  Get.to(BlogSeeMore());
                                },
                                child: const Text(
                                  'See more',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10,),
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.imgList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 6),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() =>  MyVideoView(
                                    controller.imgList[index].link!,
                                    controller.imgList[index].title!,
                                    controller.imgList[index].description!,
                                    controller.imgList[index].type!,
                                  ));
                                },
                                child: Container(
                                  width: 170,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white12,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(controller.imgList[index].link!))
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.only(left: 10,top: 110),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.black54
                                        ),
                                        child: Center(
                                            child: MyWidgets.textView(controller.imgList[index].title!,
                                                Colors.white,11)
                                        ),
                                      ),
                                      MyWidgets.textView(controller.imgList[index].subTitle!, Colors.white , 14),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: 4,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              'Discover  New  People',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              HomeController.launchCaller('https://www.facebook.com/tserieshealthandfitness/');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black87,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      child: Image.asset(
                                          'assets/images/fblogo.png',
                                          fit: BoxFit.cover),
                                    ),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    const Text('Follow Friends From Facebook',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: 110,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black87,
                              ),
                              child: InkWell(
                                onTap: () {
                                  HomeController.share('https://play.google.com/store/apps/details?id=com.news.sankhep');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.black87,
                                      child: Image.asset(
                                          'assets/images/add_friend.png',
                                          color: Colors.white),
                                    ),
                                    const Text(
                                      'Share App',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 9),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('Share this app with friends',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 11),
                                          textAlign: TextAlign.center),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Add widget here...
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ],
        );
      }
    })

  );
  }
}
