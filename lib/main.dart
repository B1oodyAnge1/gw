import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';
import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/screens/settings.dart';
import 'package:flutter_application_gw/screens/start.dart';
import 'package:flutter_application_gw/screens/video_play.dart';
import 'package:flutter_application_gw/seves/chooseTheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ThemeMode _themeMode = ThemeMode.system;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();

  static(BuildContext context) {}
  static _HomeState of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>()!;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext contex) {
    return BlocProvider(
        create: ((context) =>
            GWBloc()..add(giveMeChoose(chooseThemeNow: statusTheme))),
        child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
          return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: _themeMode,
              initialRoute: '/',
              routes: {
                '/': (context) => const Start(),
                '/1': (context) => const VideoPlay(),
                '/2': (context) => const Settings(),
              });
        }));
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
