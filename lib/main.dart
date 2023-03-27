import 'package:flutter/material.dart';
import 'package:flutter_application_gw/screens/settings.dart';
import 'package:flutter_application_gw/screens/start.dart';
import 'package:flutter_application_gw/screens/video_play.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Start(),
    '/1': (context) => const VideoPlay(),
    '/2': (context) => const Settings(),
  }));
}
