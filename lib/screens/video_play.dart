import 'package:flutter/material.dart';

import 'package:flutter_application_gw/video_player/asset_player_widget.dart';
import 'package:flutter/services.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key});
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? down = ModalRoute.of(context)?.settings.arguments as String?;

    return Material(
      color: Colors.black,
      child: AssetPlayerWidget(
        down: down,
      ),
    );
  }
}
