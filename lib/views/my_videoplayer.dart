import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  String videoLinks;
  String title;
  String duration;

  MyVideoPlayer(this.videoLinks, this.title, this.duration, {Key? key}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoLinks);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
     _controller.setVolume(0);
    // _controller.addListener(() {  });
    // _controller.initialize().then((_) {
    //    setState(() {
    //      _controller.play();
    //    });
    // });
    // _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: FutureBuilder(
        future:_initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack (
                  children: [
                    VideoPlayer(_controller),
                    Container(
                      padding: const EdgeInsets.only(left: 15,bottom: 20),
                      alignment: Alignment.bottomLeft,
                      child: MyWidgets.textView(widget.title, Colors.white, 15),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 17,bottom: 8),
                      alignment: Alignment.bottomLeft,
                      child: MyWidgets.textView(widget.duration, Colors.white, 11),
                    ),
                  ],
                )
            );
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }
        },
      ),
    );
  }
}
