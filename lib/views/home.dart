import 'package:flutter/services.dart';
import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/views/home_view.dart';
import 'package:i_fitness/views/plans_page.dart';
import 'package:i_fitness/views/progress_page.dart';
import 'package:i_fitness/views/workout_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    const HomeView(),
    const ProgressPage(),
    const WorkOut(),
    const PlansPage(),
  ];

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: _screens,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                backgroundColor: Colors.white12, //here set your transparent level
                //backgroundColor: Colors.black.withOpacity(0.1), //here set your transparent level
                elevation: 0,
                selectedItemColor: AppColors.themeColor,
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
                },
                currentIndex: currentIndex,
                items:  [
                  BottomNavigationBarItem(
                     icon: Image.asset('assets/images/home.png',
                         height: 23,
                         width: 23,
                         color: Colors.white),
                     activeIcon: Image.asset('assets/images/home.png',
                         height: 28,
                         width: 28,
                         color: AppColors.themeColorTwo),
                     label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/images/trend.png',
                          height: 23,
                          width: 23,
                          color: Colors.white),
                      activeIcon: Image.asset('assets/images/trend.png',
                          height: 28,
                          width: 28,
                          color: AppColors.themeColorTwo),
                      label: 'Progress'),
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/images/abc.png',
                          height: 28,
                          width: 28,
                          color: Colors.white),
                      activeIcon: Image.asset('assets/images/abc.png',
                          height: 34,
                          width: 34,
                          color: AppColors.themeColorTwo),
                      label: 'Workout'),
                  BottomNavigationBarItem(
                      icon: Image.asset('assets/images/task.png',
                          height: 23,
                          width: 23,
                          color: Colors.white),
                      activeIcon: Image.asset('assets/images/task.png',
                          height: 28,
                          width: 28,
                          color: AppColors.themeColorTwo),
                      label: 'Plans')
                ],
              )),
        ],
      ),
    );
  }
}