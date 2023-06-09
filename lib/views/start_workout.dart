import 'dart:async';

import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/common_module/header.dart';
import 'package:i_fitness/styles/common_module/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../styles/button_style.dart';

class StartWorkout extends StatefulWidget {
  final String url;
  final String title;
  final String des;
  const StartWorkout(this.url, this.title, this.des,  {Key? key}) : super(key: key);

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  Timer? myTimer;
  Duration myDuration = const Duration();
  bool isRunning = false;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }
  void startTimer() {
    myTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown(),
    );
  }

  void stopTimer() {
   setState(() {
     myTimer!.cancel();
   });
  }
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
  }
  void setCountDown() {
    const addSec = 1;
    setState(() {
      final seconds = myDuration.inSeconds + addSec;
        myDuration = Duration(seconds: seconds);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final sec = strDigits(myDuration.inSeconds.remainder(60));
    final min = strDigits(myDuration.inMinutes.remainder(60));
    final hrs = strDigits(myDuration.inHours.remainder(24));
    showMyDialog() async {
      return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  const Text('Total time',style: TextStyle(fontSize: 25)),
            content: Text('  $hrs  :  $min  :  $sec',style: const TextStyle(fontSize: 25)),
            actions: [
              ElevatedButton(
                style: curveButtonStyleThemeColor,
                child: const Text('Submit',style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const HeaderView(9),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyWidgets.textView('Daily Videos', Colors.white, 17),
              ),
              const SizedBox(height: 10,),
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          children: [
                            VideoPlayer(_controller),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: _controller.value.isPlaying? Colors.transparent: Colors.black26,
                                child: _controller.value.isPlaying? Container():
                                const Icon(Icons.play_arrow,color: Colors.white,size: 50),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: VideoProgressIndicator(_controller,
                                colors: VideoProgressColors(playedColor: AppColors.themeColorTwo),
                                allowScrubbing: true,
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                              ),
                            ),
                          ],
                        )
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(child: CircularProgressIndicator(color: AppColors.themeColor,)),
                    );
                  }
                },
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyWidgets.textView(widget.title, Colors.white, 18,fontWeight: FontWeight.bold),
              ),const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all( 8.0),
                child: MyWidgets.textView(widget.des,
                    Colors.white, 12),
              ),isRunning?
              const Center(child:  Text('Timer',style: TextStyle(fontSize: 25,color: Colors.white),)): Container(),
              isRunning ?Center(
                child: Text('$hrs  :  $min  :  $sec',
                    style: const TextStyle(fontSize: 25,color: Colors.white)),
              ):Container(),
              isRunning ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: curveButtonStyleThemeColor,
                        child: MyWidgets.textView(myTimer!.isActive?'Pause':'Play', Colors.white, 15),
                        onPressed: () {
                          if(myTimer!.isActive) {
                            stopTimer();
                          }else{
                            startTimer();
                          }
                        },
                      ),
                      ElevatedButton(
                        style: curveButtonStyleThemeColor,
                        child: MyWidgets.textView('Cancel', Colors.white, 15),
                        onPressed: () {
                          setState(() {
                            resetTimer();
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: curveButtonStyleThemeColor,
                    child: MyWidgets.textView('Done', Colors.white, 15),
                    onPressed: () {
                      setState(() {
                        isRunning = false;
                        resetTimer();
                        showMyDialog();
                      });
                    },
                  ),
                ],
              ) : Center(
                child: Column(
                  children: [
                    // MyWidgets.textView('$hrs  :  $min  :  $sec', Colors.white, 15),
                    ElevatedButton(
                        style: curveButtonStyleThemeColor,
                        onPressed: () {
                          setState(()
                          {
                            isRunning = true;
                            startTimer();
                          });
                          },
                        child: MyWidgets.textView("Start WorkOut", AppColors.white, 14,
                            fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: 10,
          //   left: 50,
          //   right: 50,
          //   child: ElevatedButton(
          //       style: curveButtonStyleThemeColor,
          //       onPressed: () { _showMyDialog(); },
          //       child: MyWidgets.textView("Start WorkOut", AppColors.white, 14,
          //           fontWeight: FontWeight.bold)
          //   ),
          // )
        ],
      ),
    );
  }
}
