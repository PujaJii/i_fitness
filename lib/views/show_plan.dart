import 'package:get_storage/get_storage.dart';
import 'package:i_fitness/controllers/fetch_plan_controller.dart';
import 'package:i_fitness/controllers/subscribe_controller.dart';
import 'package:i_fitness/styles/common_module/my_snack_bar.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/app_colors.dart';

class ShowPlanPage extends StatelessWidget {
  const ShowPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubscribeController subscribeController = Get.put(SubscribeController());
    FetchPlanController fetchPlanController = Get.put(FetchPlanController());
    // List<String> planName =
    // [
    //   'Fitness premium plan',
    //   'Fitness basic plan',
    // ];
    // List<int> planAmount =
    // [
    //   599,
    //   1999
    // ];
    // List<String> planDescription = [
    //   'Description 1',
    //   'Description 2',
    // ];
    final box = GetStorage();
    return Scaffold(
        body: GetX<FetchPlanController>(initState: (context) {
           fetchPlanController.fetchPlans();
        }, builder: (controller) {
          if (controller.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.btnColor2,
            ));
          } else {
            return Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/loginbg.jpg',
                      fit: BoxFit.cover,
                    )),
                ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
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
                              child: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          MyWidgets.textView('PLANS', Colors.white, 20,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/gym_l.png'),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 16),
                      child: MyWidgets.textView(
                          'All plans for your fitness friend', Colors.white, 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: MyWidgets.textView(
                          'Get fit with your personalised plan', Colors.white, 15),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                        ),
                        MyWidgets.textView(
                            '  Premium training plan', Colors.white, 14)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    box.read('isSubscribe').toString() == '1'
                        ? Container(
                            margin: EdgeInsets.all(18),
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset('assets/images/logo.png',
                                      scale: 18),
                                ),
                                Column(
                                  children: [
                                    Text('You already have a active plan'),
                                    // Text(
                                    //     'Expires on ${box.read('expire_date').toString()}'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    ListView.builder(
                      itemCount: controller.list.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white70,
                          ),
                          child: ListTile(
                            //horizontalTitleGap: 10,
                            minVerticalPadding: 10,
                            titleAlignment: ListTileTitleAlignment.center,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/gym_g.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.list[index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 15, color: AppColors.themeColor)),
                                MyWidgets.textView('₹  ${controller.list[index].price}/month',
                                    Colors.black, 15),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            subtitle: Text(controller.list[index].description.toString()),
                            trailing: InkWell(
                              onTap: () {
                                if (box.read('isSubscribe').toString() == '0') {
                                  print(controller.list[index].price);
                                  subscribeController.subscribePlan(
                                      '${index + 1}',
                                      controller.list[index].price!,
                                      controller.list[index].title.toString());
                                } else {
                                  MySnackbar.infoSnackBar('Can\'t proceed!',
                                      'You already have a active plan');
                                }
                              },
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: box.read('isSubscribe').toString() == '1'
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.grey,
                                              Colors.grey,
                                            ],
                                          )
                                        : LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.blueAccent,
                                              AppColors.themeColor,
                                            ],
                                          )),
                                child: Center(
                                    child: MyWidgets.textView(
                                  'Buy now',
                                  Colors.white,
                                  15,
                                )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Just pays a certain sum every month so that '
                        'You may use the gym\'s services daily. Monthly memberships'
                        ' can also be turned into yearly memberships. If You'
                        ' like coming to our gym to take fitness classes, for example,'
                        ' then you also have the option to pay for a longer subscription',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Add widget here...
                  ],
                ),
              ],
            );
          }
        }));
  }
}
