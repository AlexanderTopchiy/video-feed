import 'package:built_redux/built_redux.dart';

part 'actions.g.dart';

abstract class AppActions extends ReduxActions {
  ActionDispatcher<bool> playVideo;
  ActionDispatcher<bool> pauseVideo;
  
  AppActions._();

  factory AppActions() => _$AppActions();
}