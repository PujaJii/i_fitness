import 'package:i_fitness/views/my_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class ViewVideo extends StatelessWidget {
  String videoLink;

  ViewVideo(this.videoLink, {Key? key}) : super(key: key);

  // String url = 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4';
  @override
  Widget build(BuildContext context) {
    final MyVideoController myVideoController = Get.put(MyVideoController(videoLink));
    return FutureBuilder(
      future: myVideoController.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
              aspectRatio: myVideoController.controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(myVideoController.controller),
                ],
              )
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}