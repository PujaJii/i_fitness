import 'package:i_fitness/video_controllers/my_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class ViewVideo extends StatelessWidget {
  final String videoLink;

  const ViewVideo(this.videoLink, {Key? key}) : super(key: key);

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