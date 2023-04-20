import 'package:flutter/material.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';

import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/controllers/search.dart';
import 'package:flutter_application_gw/main.dart';
import 'package:flutter_application_gw/screens/settings.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  late String str;
  int _selectedIndex = 2;
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
    String qrCodeResult = "Not Yet Scanned";
    return BlocProvider(
        create: ((context) => GWBloc()..add(giveMeAVideo())),
        child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              body: Container(
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [],
                ),
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
}
