import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';
import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/main.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String str;
  String _scanBarcode = 'Unknown';
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
        scanQR();
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
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
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
                      backgroundColor: Theme.of(context).indicatorColor,
                      title: const Text("MyVideo",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
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
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const <Widget>[
                                Text(
                                  "Темная тема",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Switch(
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
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const <Widget>[
                                Text(
                                  "Размер шрифта",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 90,
                                  ),
                                  child: Text("22"),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.chevron_right),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const <Widget>[
                                Text(
                                  "Язык",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 160),
                                  child: Text("Русский"),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.chevron_right),
                                )
                              ],
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
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Настройки',
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
