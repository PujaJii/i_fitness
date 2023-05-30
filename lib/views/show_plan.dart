import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_colors.dart';

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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/gym_l.png'),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 16),
                child: MyWidgets.textView('All plans for your fitness friend', Colors.white, 18,
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
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white70,),
                  child: ListTile(
                    //horizontalTitleGap: 10,
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: Container(
                      height: 40,width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(image: AssetImage('assets/images/gym_g.png'),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fitness premium plan',
                            style: TextStyle(fontSize: 15,color: AppColors.themeColor)),
                        MyWidgets.textView('\$  1,999/month', Colors.black, 15),
                        SizedBox(height: 5,)
                      ],
                    ),
                    subtitle: Text('Short Description Short Description '),
                    trailing:  InkWell (
                      onTap: () {

                      },
                      child: Container(
                        height: 30,
                        width: 100,
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
                        child: Center(
                            child: MyWidgets.textView('Buy now', Colors.white, 15,)),
                      ),
                    ) ,
                  ),
                );
              },),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('Just pays a certain sum every month so that '
                    'You may use the gym\'s services daily. Monthly memberships'
                    ' can also be turned into yearly memberships. If You'
                    ' like coming to our gym to take fitness classes, for example,'
                    ' then you also have the option to pay for a longer subscription',
                  style: TextStyle(color: Colors.white),
                ),
              )

              //Add widget here...
            ],
          ),
        ],
      ),
    );
  }
}
