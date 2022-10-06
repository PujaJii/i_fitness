import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPlanPage extends StatelessWidget {
  const ShowPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/loginbg.jpg', fit: BoxFit.cover,)
          ),
          ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 15),
                child: Row(
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
                    ),const SizedBox(width: 15,),
                    MyWidgets.textView('PLANS', Colors.white, 20, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 5,right: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),const SizedBox(height: 15,),
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gym_l.png'),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: MyWidgets.textView('12 - Week Body \nTransformation', Colors.white, 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 10),
                child: MyWidgets.textView('Get fit with your personalised plan', Colors.white, 15),
              ),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.monetization_on,color: Colors.amber,),
                  MyWidgets.textView('  Premium training plan', Colors.white, 14)
                ],
              ),const SizedBox(height: 5,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.flag,color: Colors.white,),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: MyWidgets.textView(
                        'Weather you want to build muscle,'
                        ' lose weight or just commit to getting fit,'
                        ' this plan will give you the result you want ', Colors.white, 14),
                  )
                ],
              ),const SizedBox(height: 5,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Icon(Icons.calendar_month_outlined,color: Colors.white,),
                  MyWidgets.textView('  12 weeks', Colors.white, 14)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: MyWidgets.textView('Sample Plan Week', Colors.white, 18),
              ),
              SizedBox(
                height: 200,
                // decoration: const BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 15,),
                            Container(height: 35,width: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[600]),
                              child: Center(child: MyWidgets.textView('MON', Colors.white, 11)),
                            ),const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidgets.textView(' Workout 1 ', Colors.white, 14),
                                MyWidgets.textView(' Jumping jacks, knee push ups squats, les raises, pause ',
                                    Colors.white, 11),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
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
                    padding: const EdgeInsets.only(left: 15),
                    child: MyWidgets.textView('What people are saying', Colors.white, 17.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: MyWidgets.textView('See More', Colors.white, 16),
                  ),
                ],
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0,top: 5),
                      child: Row(
                        children: [
                          const SizedBox(width: 15,),
                          const CircleAvatar(
                            radius: 15,
                              backgroundImage: AssetImage('assets/images/profile.png')),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyWidgets.textView(' UserName', Colors.white, 14),
                              MyWidgets.textView(' Comments,Comments,Comments,',
                                  Colors.white, 11),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),


              //Add widget here...
            ],
          ),
        ],
      ),
    );
  }
}
