import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/button_style.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:i_fitness/views/register2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register1 extends StatefulWidget {
  const Register1({Key? key}) : super(key: key);

  @override
  State<Register1> createState() => _Register1State();
}


class _Register1State extends State<Register1> {
  bool isSelected1 = true;
  bool isSelected2 = true;

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
          Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Hero(
                      tag: 'regLogo',
                      child: Image.asset('assets/images/logo.png', scale: 9)),
                  const SizedBox(height: 30),
                  MyWidgets.textView('WHAT\'S YOUR GOAL?', Colors.white, 25, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected1 = false;
                        isSelected2 = true;
                      });
                    },
                    child: Container(
                     height: 50,
                     width: 300,
                     decoration: BoxDecoration(
                       gradient:LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           colors: isSelected1 ? [
                             const Color(0xc8214ed3),
                             const Color(0x49214ed3),

                           ]:
                           [
                             const Color(0xff214ed3),
                             const Color(0xff214ed3),
                           ]
                       ),
                         borderRadius: BorderRadius.circular(30),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         MyWidgets.textView('Loose weight',
                             Colors.white, 17,
                             fontWeight: FontWeight.bold),
                         MyWidgets.textView('Get lean fast & healthy',
                             Colors.white, 14),
                       ],
                     ),
                 ),
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected2 = false;
                        isSelected1 = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        gradient:LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: isSelected2? [
                            const Color(0xc8214ed3),
                            const Color(0x49214ed3),
                          ]: [
                            const Color(0xff214ed3),
                            const Color(0xff214ed3),

                          ]
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyWidgets.textView('Get Lean',
                              Colors.white, 17,
                              fontWeight: FontWeight.bold),
                          MyWidgets.textView('Tone up & get in better shape',
                              Colors.white, 14),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  isSelected1 && isSelected2 ?
                  Container(color: Colors.transparent): ElevatedButton(
                      style: curveButtonStyleThemeColor,
                      onPressed: () {
                        Get.to(() => const Register2());
                      },
                      child: MyWidgets.textView("Next", AppColors.white, 14,
                          fontWeight: FontWeight.bold)
                  )
                ],
             )
          ),
        ],
      ),
    );
  }
}
