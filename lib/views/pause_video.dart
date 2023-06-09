import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPause extends StatefulWidget {
  String videoLinks;

  VideoPause(this.videoLinks, {Key? key}) : super(key: key);

  @override
  State<VideoPause> createState() => _VideoPauseState();
}

class _VideoPauseState extends State<VideoPause> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoLinks);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.pause();
    _controller.setVolume(0);
    _controller.addListener(() {  });
    // _controller.initialize().then((_) {
    //    setState(() {
    //      _controller.play();
    //    });
    // });
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
                child: VideoPlayer(_controller)
            );
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }
        },
      ),
    );
  }
}
