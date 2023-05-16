import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/commonmodule/my_widgets.dart';



class PrivacyPage extends StatelessWidget {
  final String header;
  const PrivacyPage(this.header, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/spbg.jpg',
                fit: BoxFit.cover,
              )
          ),
          Column(
            children: [
              const SizedBox(height: 49.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20,),
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
                  const SizedBox(width: 20,),
                  MyWidgets.textView(header, Colors.white, 19,fontWeight: FontWeight.bold),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
