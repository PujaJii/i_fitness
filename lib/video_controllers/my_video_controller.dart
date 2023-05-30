import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class MyVideoController extends GetxController{

  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;
  late String abc;

  MyVideoController(this.abc);


  @override
  void onInit() {
    controller = VideoPlayerController.network(abc);
    initializeVideoPlayerFuture = controller.initialize();
    // controller.play();
    // controller.initialize().then((value) => controller.play());
    // controller.play();
    // controller.setLooping(true);
    // controller.addListener(() { });
    controller.setVolume(0);
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}