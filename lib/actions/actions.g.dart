// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<bool> playVideo =
      new ActionDispatcher<bool>('AppActions-playVideo');
  final ActionDispatcher<bool> pauseVideo =
      new ActionDispatcher<bool>('AppActions-pauseVideo');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    playVideo.setDispatcher(dispatcher);
    pauseVideo.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<bool> playVideo =
      new ActionName<bool>('AppActions-playVideo');
  static final ActionName<bool> pauseVideo =
      new ActionName<bool>('AppActions-pauseVideo');
}
