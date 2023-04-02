import 'package:flutter_application_gw/controllers/class.dart';
import 'package:flutter_application_gw/screens/start.dart';

class GWState extends Start {
  final bool chooseTheme;

  final List<VideoData> listVideoData;

  // ignore: use_key_in_widget_constructors
  const GWState({
    this.chooseTheme = false,
    this.listVideoData = const [],
  });
  GWState copyWith({
    String? nameVideo,
    List<VideoData>? listVideoData,
    bool? chooseTheme,
  }) {
    return GWState(
      chooseTheme: chooseTheme ?? this.chooseTheme,
      listVideoData: listVideoData ?? this.listVideoData,
    );
  }

  @override
  List<Object?> get props => [chooseTheme, listVideoData];
}
