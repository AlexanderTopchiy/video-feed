import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String urlSource;
  final bool isPlaying;
  final double volume;

  VideoWidget({@required this.urlSource, @required this.isPlaying, this.volume});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _videoPlayerController;
  Future _initVideoPlayer;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.urlSource);
    _initVideoPlayer = _videoPlayerController
        .initialize()
        .then((_) {
          setState(() {});
        });

    if (widget.isPlaying) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
      _videoPlayerController.setVolume(widget.volume);
    }
  }

    @override
  void didUpdateWidget(VideoWidget oldWidget) {
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
        _videoPlayerController.setVolume(widget.volume);
      } else {
        _videoPlayerController.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initVideoPlayer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return VideoPlayer(_videoPlayerController);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}