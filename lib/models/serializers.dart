import 'package:built_value/serializer.dart';
import 'package:video_feed/models/app_state.dart';

part 'serializers.g.dart';

@SerializersFor(
  const [
  AppState,
])

final Serializers serializers = _$serializers;