import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class coursespage extends StatefulWidget {
  const coursespage({super.key});

  @override
  State<coursespage> createState() => _coursespageState();
}

class _coursespageState extends State<coursespage> {
  final videoURL = "https://www.youtube.com/watch?v=HB4I2CgkcCo";
  late YoutubePlayerController _controller;

  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Courses")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Computer Course',
            style:
                TextStyle(fontSize: 30, color: Color.fromRGBO(113, 214, 92, 1)),
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                    playedColor: Colors.lightGreen, handleColor: Colors.green),
              )
            ],
          ),
        ],
      ),
    );
  }
}
