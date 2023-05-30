import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/video_controllers/my_video_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';


class BlogSeeMore extends StatelessWidget {
   BlogSeeMore({Key? key}) : super(key: key);

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
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
           Column(
             children: [
               const SizedBox(height: 55,),
               MyWidgets.textView('Our Blogs', Colors.white, 18),
               Expanded(
                   child: ListView.builder(
                    itemCount: homeController.imgList.length,
                       padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            InkWell(
                        onTap: () {
                             Get.to(() => MyVideoView(
                                homeController.imgList[index].link!,
                                homeController.imgList[index].title!,
                                homeController.imgList[index].description!,
                                homeController.imgList[index].type!,
                              ));
                        },
                              child: Container(
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(homeController.imgList[index].link!),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyWidgets.textView(homeController.imgList[index].title!, Colors.white, 18),
                            ),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyWidgets.textView(homeController.imgList[index].description!, Colors.white, 16),
                            ),
                            const SizedBox(height: 5,),
                          ],
                        );
                      },))
             ],
           )
         ],
      ),
    );
  }
}
