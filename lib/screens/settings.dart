import 'package:flutter/material.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';
import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/main.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String str;
  bool? v;
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Settings',
      style: optionStyle,
    ),
    Text(
      'Index 2: QR',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(
          context,
          '/2',
        );
      }
      if (index == 2) {
        Navigator.pushNamed(
          context,
          '/3',
        );
      }

      if (index == 0) {
        Navigator.pushNamed(
          context,
          '/',
        );
      }
    });
  }

  @override
  Widget build(BuildContext contex) {
    //double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: ((context) => GWBloc()..add(giveMeAVideo())),
        child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
          v = Theme.of(context).scaffoldBackgroundColor == Colors.black
              ? true
              : false;
          return Scaffold(
            body: NestedScrollView(
              // Движущийся appbar
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      title: Text(
                        "MyVideo",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      floating: true,
                      expandedHeight: 50.0,
                      forceElevated: innerBoxIsScrolled,
                      automaticallyImplyLeading: false),
                ];
              },
              body: ListView(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 20,
                ),
                children: <Widget>[
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const <Widget>[
                            Text(
                              "Темная тема",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Switch(
                              value: v as bool,
                              onChanged: (value) {
                                setState(() {
                                  v = value;
                                  if (value != false) {
                                    Home.of(context)
                                        .changeTheme(ThemeMode.dark);
                                  } else {
                                    Home.of(context)
                                        .changeTheme(ThemeMode.light);
                                  }
                                });
                              },
                              activeTrackColor: Colors.blue,
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_2),
                  label: 'QR',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              onTap: _onItemTapped,
            ),
          );
        }));
  }

  void onTapSetings() {}
}
