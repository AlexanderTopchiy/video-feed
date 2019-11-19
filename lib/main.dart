import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:video_feed/actions/actions.dart';
import 'package:video_feed/models/app_state.dart';
import 'package:video_feed/reducers/reducers.dart';
import 'package:video_feed/video_list_screen.dart';

void main() => runApp(VideoFeedApp());

class VideoFeedApp extends StatefulWidget {
  final store = Store<AppState, AppStateBuilder, AppActions>(
    reducerBuilder.build(),
    AppState(),
    AppActions()
  );

  @override
  _VideoFeedAppState createState() => _VideoFeedAppState();
}

class _VideoFeedAppState extends State<VideoFeedApp> {
  Store<AppState, AppStateBuilder, AppActions> store;

  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: MaterialApp(
        home: VideoListScreen(),
      ),
    );
  }
}
