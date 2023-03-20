import 'package:flutter/material.dart';

import 'package:flutter_application_gw/video_player/asset_player_widget.dart';

class VideoPlay extends StatelessWidget {
  const VideoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    final String? down = ModalRoute.of(context)?.settings.arguments as String?;

    return Material(
      color: Colors.white,
      child: AssetPlayerWidget(
        down: down,
      ),
    );
  }
}
