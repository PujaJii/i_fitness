import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class NewView extends StatefulWidget {
  final String videoLinks;
  const NewView(this.videoLinks, {Key? key}) : super(key: key);

  @override
  State<NewView> createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoLinks);
    _initializeVideoPlayerFuture = _controller.initialize();
    // !widget.playing? _controller.play():_controller.pause();
    // _controller.setLooping(true);
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
      borderRadius: BorderRadius.circular(20),
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
                      alignment: Alignment.center,
                      color:Colors.white12,
                      child:const Icon(Icons.play_circle,color: Colors.white,size: 30),
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
