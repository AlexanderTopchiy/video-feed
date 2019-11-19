import 'package:flutter/material.dart';
import 'package:video_feed/video_widget.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300.0,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 50.0),
          child: VideoWidget(
              isPlaying: true,
              urlSource: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
          ),
        ),
      ),
    );
  }
}