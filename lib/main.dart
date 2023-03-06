import 'package:flutter/material.dart';
import 'package:flutter_application_gw/start.dart';
import 'package:flutter_application_gw/video_play.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Start(),
    '/1': (context) => const VideoPlay(),
  }));
}
