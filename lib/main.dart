import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';
import 'package:flutter_application_gw/screens/settings.dart';
import 'package:flutter_application_gw/screens/start.dart';
import 'package:flutter_application_gw/screens/video_play.dart';

bool choosingTheme = true;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      theme: choosingTheme ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Start(),
        '/1': (context) => const VideoPlay(),
        '/2': (context) => const Settings(),
      }));
}
