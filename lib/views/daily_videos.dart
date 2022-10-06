import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyVideos extends StatelessWidget {
  String img;
  String title;
  String heading;
  String des;

  DailyVideos(this.img, this.title, this.heading, this.des, {super.key});

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
              )
          ),
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8,),
              HeaderView(6),
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
                child: MyWidgets.textView(title, Colors.white, 18),
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
                    image: DecorationImage(
                        image: AssetImage(img),
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
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: MyWidgets.textView(heading, Colors.white, 18),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: MyWidgets.textView(des, Colors.white, 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
