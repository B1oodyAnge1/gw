import 'package:flutter/material.dart';
import 'package:flutter_application_gw/video_player/basic_overlay_widget.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(
          alignment: Alignment.topCenter,
          child: buildVideo(),
        )
      : const SizedBox(
          height: 200,
          child: Center(
            heightFactor: 10,
            child: CircularProgressIndicator(),
          ),
        );
  Widget buildVideo() => Stack(children: <Widget>[
        buildVildeoPlayer(),
        Positioned.fill(
          child: BasicOverlayWidget(controller: controller),
        )
      ]);

  Widget buildVildeoPlayer() => buildFullScreen(
      child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller)));

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = controller.value.size;
    final width = size.width;
    final height = size.height;
    return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ));
  }
}
