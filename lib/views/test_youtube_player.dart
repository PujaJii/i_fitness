import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';




class MyHomePage extends StatelessWidget {
  final String videoUrl = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YouTubePlayerWidget(videoUrl: videoUrl),
              ),
            );
          },
          child: Text('Play Video'),
        ),
      ),
    );
  }
}

class YouTubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  YouTubePlayerWidget({required this.videoUrl});

  @override
  _YouTubePlayerWidgetState createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
