import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/new_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';


class SeeMoreVideo extends StatelessWidget {
  SeeMoreVideo({Key? key}) : super(key: key);

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
              const SizedBox(height: 60,),
              MyWidgets.textView('Our Videos', Colors.white, 18),
              const SizedBox(height: 10,),
              Expanded(
                  child:
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: homeController.videoList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        width: 100,
                        height: 200,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                          child: NewView(
                              homeController.videoList[index].link!)
                      );
                    },
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
