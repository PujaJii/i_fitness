import 'dart:io';

import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/challenges.dart';
import 'package:i_fitness/views/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {

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
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                     HeaderView(1),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
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
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: MyWidgets.textView('Progress', Colors.white, 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: InkWell(
                              onTap: () {
                                // Get.to(const TouchLight());
                              },
                              child: MyWidgets.textView('See more', Colors.white, 15)
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
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
                          child: MyWidgets.textView('Training Statistics', Colors.white, 17),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                      child: Container(
                        height: 1.5,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child:
                          Image.asset('assets/images/gym_g.png', fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
                      child: Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: MyWidgets.textView('Recent Workouts', Colors.white, 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: MyWidgets.textView('Your workouts will be shown here as soon as you complete your first one. Start your workout now',
                                Colors.white, 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(() =>  const UrlCall(title: 'UrlCall',));
                          },

                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blueAccent,
                                    AppColors.themeColor,
                                  ],
                                )
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            child: Center(
                                child: MyWidgets.textView('Show Workouts',
                                    Colors.white, 16,fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: MyWidgets.textView('Challenges', Colors.white,
                              17,fontWeight: FontWeight.bold),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: MyWidgets.textView('Past Challenges', Colors.white, 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 8, bottom: 8),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const ChallengesPage());
                              },
                              child: Container(
                                width: 340,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/gym_a.png',
                                      )),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white54,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, bottom: 5),
                                  child: Column(
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
                                            Colors.blueAccent,
                                            AppColors.themeColor,
                                          ],
                                        )),
                                        child: Center(
                                            child: MyWidgets.textView('Ends In 15 Days', Colors.white, 11)
                                        ),
                                      ),
                                    MyWidgets.textView('Commit To Getting Fit', Colors.white, 15),
                                    MyWidgets.textView('1,548 Participants', Colors.white, 8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
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
                          child: MyWidgets.textView('Progress Pics', Colors.white, 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: MyWidgets.textView('See more', Colors.white, 15),
                        ),
                      ],
                    ),
                    imageFileList!.isNotEmpty?
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: imageFileList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          width: 100,
                          height: 200,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            image:  DecorationImage(
                                image: FileImage(imageFileList![index]),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children:  [
                              Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: InkWell(
                                      onTap: () {
                                        imageFileList!.remove(imageFileList![index]);
                                        setState(() {
                                        });
                                      },
                                      child: const Icon(Icons.delete_forever,color: Colors.white,size: 30,)
                                  )),
                            ],
                          ),
                        );
                      },
                    )
                    : Container(
                      height: 50,
                      width: 50,
                      color: Colors.transparent,
                      child: MyWidgets.textView('     No Image', Colors.white, 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: MyWidgets.textView('Keep track of your progress - This pictures are only visible to you',
                                Colors.white, 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            _getFromCamera();
                            setState(() {
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blueAccent,
                                    AppColors.themeColor,
                                  ],
                                )),margin: const EdgeInsets.only(right: 8),
                            child: const Center(
                                child: Text(
                              'Take a pic',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                             )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child:
                      Image.asset('assets/images/fruits.png', fit: BoxFit.fill),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: MyWidgets.textView('Health & Nutrition', Colors.white, 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child:
                            MyWidgets.textView('Maximise you training result - with valuable health & nutrition tips',
                                Colors.white, 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(()=> NutritionPage());
                          },
                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.blueAccent,
                                    AppColors.themeColor,
                                  ],
                                )),margin: const EdgeInsets.only(right: 8),
                            child: const Center(
                                child: Text(
                                  'Check it out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60,)
            ],
          )
        ],
      ),
    );
  }

  // PickedFile? img;
  // List imageArray = [];

  // _openCam() async {
  //    img = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //    if (img != null) {
  //      setState(() {
  //        imageArray.add(img);
  //      });
  //    }
  // }
  // var imageFile;
  List<File>? imageFileList = [];
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFileList!.add(File(pickedFile.path));
      setState(() {
        imageFileList;
       // print(imageFile.toString().length);
      });
    }
  }
}
