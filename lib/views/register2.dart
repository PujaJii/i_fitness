import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register2 extends StatefulWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {

  List<RadioModel> sampleData =  <RadioModel>[];
  bool changeBtn = false;

  @override
  void initState() {
    super.initState();
    sampleData.add( RadioModel(false, 'Not At All', 'I work in a office or do no workout'));
    sampleData.add( RadioModel(false, 'Slightly Active', 'I do up to 2 hours physical activity per week'));
    sampleData.add( RadioModel(false, 'Active', 'Up to 4 hours physical activity per week'));
    sampleData.add( RadioModel(false, 'Very Active', 'Intense physical activity everyday '));
  }

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
              )),
          Positioned(
              top: 70,
              right: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Hero(
                      tag: 'regLogo',
                      child : Image.asset('assets/images/logo.png', scale: 9)),
                  const SizedBox(height: 10),
                  MyWidgets.textView('Activeness', Colors.white, 25,
                      fontWeight: FontWeight.bold),
                  MyWidgets.textView('In Daily Life', Colors.grey, 20),
                ],
             )
          ),
          Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: Column(
                children: [
               SizedBox(
                  height: 300,
                 child: ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 35),
                     itemCount: sampleData.length,
                     itemBuilder: (context, index) {
                       return InkWell(
                         onTap: () {
                           setState(() {
                             sampleData.forEach((element) => element.isSelected = false);
                             sampleData[index].isSelected = true;
                             changeBtn = true;
                           });
                         },
                         child: Container(
                           margin: const EdgeInsets.symmetric(vertical: 10),
                           height: 50,
                           width: 300,
                           decoration: BoxDecoration(
                             gradient:LinearGradient(
                                 begin: Alignment.topCenter,
                                 end: Alignment.bottomCenter,
                                 colors: sampleData[index].isSelected?
                                 [
                                   const Color(0xff214ed3),
                                   const Color(0xff214ed3),
                                 ] :
                                 [
                                   const Color(0xc8214ed3),
                                   const Color(0x49214ed3),
                                 ]
                             ),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               MyWidgets.textView(sampleData[index].buttonText,
                                   Colors.white, 17,
                                   fontWeight: FontWeight.bold),
                               MyWidgets.textView(sampleData[index].text,
                                   Colors.white, 14),
                             ],
                           ),
                         ),
                       );
                     },
                 ),
               ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            Get.back();
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.grey,
                                  Colors.grey,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: MyWidgets.textView('Cancel',
                                  Colors.black, 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                         onTap: () {
                           setState(() {
                             if(changeBtn){
                               Get.offAll(() => const HomePage());
                             }
                           });
                         },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: changeBtn? [
                                  Colors.purple,
                                  AppColors.btnColor,
                                ] : [
                                  Colors.grey,
                                  Colors.grey,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                              child: MyWidgets.textView('Proceed',
                                  changeBtn? Colors.white: Colors.black, 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}


class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);

}