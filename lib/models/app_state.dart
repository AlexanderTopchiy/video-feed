import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  bool get isPlaying;

  AppState._();

  static Serializer<AppState> get serializer => _$appStateSerializer;
  factory AppState([updates(AppStateBuilder b)]) => _$AppState();
}