import 'package:built_redux/built_redux.dart';
import 'package:video_feed/actions/actions.dart';
import 'package:video_feed/models/app_state.dart';

var reducerBuilder = ReducerBuilder<AppState, AppStateBuilder>()
  ..add(AppActionsNames.playVideo, playVideo)
  ..add(AppActionsNames.pauseVideo, pauseVideo);

void playVideo(AppState state, Action<bool> action, AppStateBuilder builder) {
  builder.isPlaying = action.payload;
}

void pauseVideo(AppState state, Action<bool> action, AppStateBuilder builder) {
  builder.isPlaying = action.payload;
}