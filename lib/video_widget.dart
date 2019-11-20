import 'package:chewie/chewie.dart';
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
  ChewieController _chewieController;
  Future _initVideoPlayer;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.urlSource);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3/2,
      looping: true,
    );
    _initVideoPlayer = _videoPlayerController
        .initialize()
        .then((_) {
          setState(() {});
        });

    if (widget.isPlaying) {
      _chewieController.play();
      _chewieController.setVolume(widget.volume);
    }
  }

    @override
  void didUpdateWidget(VideoWidget oldWidget) {
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        _chewieController.play();
        _chewieController.setVolume(widget.volume);
      } else {
        _chewieController.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initVideoPlayer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Chewie(controller: _chewieController);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}