import 'package:i_fitness/styles/app_colors.dart';
import 'package:i_fitness/styles/commonmodule/header.dart';
import 'package:i_fitness/styles/commonmodule/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoView extends StatefulWidget {
  final String url;
  final String title;
  final String des;
  final String type;

  const MyVideoView(this.url, this.title, this.des, this.type, {Key? key}) : super(key: key);

  @override
  State<MyVideoView> createState() => _MyVideoViewState();
}

class _MyVideoViewState extends State<MyVideoView> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late YoutubePlayerController _controllerYoutube;

  @override
  void initState() {
    _controllerYoutube = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.addListener(() { });
    // _controller.initialize().then((value) => _controller.play());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                child: MyWidgets.textView('Daily Blogs & Videos', Colors.white, 17),
              ),
              const SizedBox(height: 10,),
              widget.type == 'video'?
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
                                child:
                                YoutubePlayer(
                                  controller: _controllerYoutube,
                                  showVideoProgressIndicator: true,
                                ),
                                // VideoProgressIndicator(_controller,
                                //   colors: VideoProgressColors(playedColor: AppColors.themeColorTwo),
                                //   allowScrubbing: true,
                                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                                // ),
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
              ):
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white12,
                    image: DecorationImage(image: NetworkImage(widget.url),fit: BoxFit.cover)),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyWidgets.textView(widget.title, Colors.white, 18,fontWeight: FontWeight.bold),
              ),const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyWidgets.textView(widget.des,
                    Colors.white, 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
