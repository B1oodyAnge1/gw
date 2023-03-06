import 'package:flutter_application_gw/class.dart';
import 'package:flutter_application_gw/start.dart';

class GWState extends Start {
  final String? nameVideo;
  final String? fileVideo;
  final String? previewVideo;
  final List<VideoData> listVideoData;

  // ignore: use_key_in_widget_constructors
  const GWState({
    this.nameVideo = '',
    this.fileVideo = '',
    this.previewVideo = '',
    this.listVideoData = const [],
  });
  GWState copyWith({
    String? nameVideo,
    String? fileVideo,
    String? previewVideo,
    List<VideoData>? listVideoData,
  }) {
    return GWState(
      nameVideo: nameVideo ?? this.nameVideo,
      fileVideo: fileVideo ?? this.fileVideo,
      previewVideo: previewVideo ?? this.previewVideo,
      listVideoData: listVideoData ?? this.listVideoData,
    );
  }

  @override
  List<Object?> get props =>
      [nameVideo, fileVideo, previewVideo, listVideoData];
}
