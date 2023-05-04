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
    HomeView(),
    const ProgressPage(),
    const WorkOut(),
    const PlansPage(),
  ];

  int currentIndex = 0;

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
                backgroundColor: Colors.black.withOpacity(0.1), //here set your transparent level
                elevation: 0,
                selectedItemColor: Colors.purple[700],
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
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


/*
NavigationBarTheme(
data: const NavigationBarThemeData(
indicatorColor: Colors.transparent,
),

child: NavigationBar(
elevation: 5,
labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
onDestinationSelected: (value) {
setState(() {
currentIndex = value;
});
},
selectedIndex: currentIndex,
height: 55,
backgroundColor: Color(0x00ffffff),
animationDuration: const Duration(seconds: 2),
destinations: [
NavigationDestination(
icon: const Icon(Icons.home_outlined,),
selectedIcon: Icon(Icons.home_outlined,
size: 35,
color: Colors.purple[600],),
label: 'Home'),
NavigationDestination(
icon: Image.asset('assets/images/trend.png',height: 23,width: 23),
selectedIcon: Image.asset('assets/images/trend.png',height: 28,width: 28,
color: Colors.purple[600],),
label: 'Favorite'),
NavigationDestination(
icon: Image.asset('assets/images/workout.png',height: 23,width: 23),
selectedIcon: Image.asset('assets/images/workout.png',height: 28,width: 28,
color: AppColors.btnColor,),
label: 'Location'),
NavigationDestination(
icon: const Icon(Icons.chat_outlined),
selectedIcon: Icon(Icons.chat,
size: 35,
color: AppColors.btnColor,),
label: 'Massages'),
NavigationDestination(
icon: const Icon(Icons.chat_outlined),
selectedIcon: Icon(Icons.chat,
size: 35,
color: AppColors.btnColor,),
label: 'Massages'),
],
),
),
*/