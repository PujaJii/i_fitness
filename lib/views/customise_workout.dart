import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/button_style.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomiseWorkout extends StatefulWidget {
  const CustomiseWorkout({Key? key}) : super(key: key);

  @override
  State<CustomiseWorkout> createState() => _CustomiseWorkoutState();
}

class _CustomiseWorkoutState extends State<CustomiseWorkout> {
  int _val = 0;
  int _val1 = 0;
  int _val2 = 0;

  changeValues(var val) {
    setState(() {
      _val = val;
    });
  }

  changeValues1(var val1) {
    setState(() {
      _val1 = val1;
    });
  }
  changeValues2(var val2) {
    setState(() {
      _val2 = val2;
    });
  }
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60,),
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gym_d.png'),fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 15),
                child: MyWidgets.textView('Target Body Parts', Colors.white, 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.blueGrey,
                            Colors.grey
                          ]
                      )),
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _val,
                            onChanged: (value) => changeValues(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Abs & Core',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _val,
                            onChanged: (value) => changeValues(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Arms',style: TextStyle(color: Colors.white,fontSize: 14),)
                        ],
                      ),
                    ), const SizedBox(width: 5,),
                    Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _val,
                            onChanged: (value) => changeValues(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Butt',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _val,
                            onChanged: (value) => changeValues(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Upper body',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ],
                      ),
                    ),const SizedBox(width: 5,),
                    Container(
                      width: 110,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 5,
                            groupValue: _val,
                            onChanged: (value) => changeValues(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Legs',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 15),
                child: MyWidgets.textView('Difficulty', Colors.white, 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 6,
                            groupValue: _val1,
                            onChanged: (value) => changeValues1(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Basic',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 7,
                            groupValue: _val1,
                            onChanged: (value) => changeValues1(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Intermediate',style: TextStyle(color: Colors.white,fontSize: 14),)
                        ],
                      ),
                    ), const SizedBox(width: 5,),
                    Container(
                      width: 110,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 8,
                            groupValue: _val1,
                            onChanged: (value) => changeValues1(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Tough',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 15),
                child: MyWidgets.textView('Equipments', Colors.white, 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.grey
                              ]
                          )),
                      child: Row(
                        children: [
                          Radio(
                            value: 9,
                            groupValue: _val2,
                            onChanged: (value) => changeValues2(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('No Equipment',style: TextStyle(color: Colors.white,fontSize: 12),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      width: 160,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.blueGrey,
                            Colors.grey
                          ]
                        )
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 10,
                            groupValue: _val2,
                            onChanged: (value) => changeValues2(value),
                            fillColor: MaterialStateProperty.all(Colors.black),
                          ),
                          const Text('Resistant Band',style: TextStyle(color: Colors.white,fontSize: 14),)
                        ],
                      ),
                    ), const SizedBox(width: 5,),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 50,
            right: 50,
            child: ElevatedButton(
                style: curveButtonStyleThemeColor,
                onPressed: () {  },
                child: MyWidgets.textView("Start WorkOut", AppColors.white, 14,
                    fontWeight: FontWeight.bold)
            ),
          )
        ],
      ),
    );
  }
}
