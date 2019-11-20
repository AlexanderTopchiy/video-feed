import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:video_feed/video_widget.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  @override
  Widget build(BuildContext context) {

    return InViewNotifierList(
      scrollDirection: Axis.vertical,
      initialInViewIds: ['0'],
      isInViewPortCondition:
          (double deltaTop, double deltaBottom, double viewPortDimension) {
        return deltaTop < (0.5 * viewPortDimension) &&
            deltaBottom > (0.5 * viewPortDimension);
      },
      children: List.generate(
        10,
        (index) {
          return Container(
            width: double.infinity,
            height: 300.0,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 50.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final InViewState inViewState =
                    InViewNotifierList.of(context);

                inViewState.addContext(context: context, id: '$index');

                return AnimatedBuilder(
                  animation: inViewState,
                  builder: (BuildContext context, Widget child) {
                    return VideoWidget(
                      urlSource: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                      isPlaying: inViewState.inView('$index'),
                      volume: 0.5,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}