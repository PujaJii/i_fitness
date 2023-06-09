import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

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
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 5,right: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Center(child: MyWidgets.textView('No Recent Notifications...', Colors.white, 20)),
        ],
      ),
    );
  }
}
