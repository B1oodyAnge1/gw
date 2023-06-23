import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/controllers/search.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  late String str;
  String _scanBarcode = 'Unknown';
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
      _selectedIndex = 0;
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
  Widget build(BuildContext contex) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

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
                      backgroundColor: Theme.of(context).indicatorColor,
                      title: const Text("MyVideo",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      actions: [
                        IconButton(
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: MySearchDelegate(
                                    searchResults: state.listVideoData),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ))
                      ],
                      floating: true,
                      expandedHeight: 50.0,
                      forceElevated: innerBoxIsScrolled,
                      automaticallyImplyLeading: false),
                ];
              },
              body: state.listVideoData.isNotEmpty
                  ? ListView.builder(
                      // builder для списка видео
                      itemCount: state.listVideoData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, '/1',
                                  arguments: state
                                      .listVideoData[index].videoDownloader);
                            });
                          },
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 104,
                                  height: 75,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 16),
                                    child: Image(
                                      image: NetworkImage(state
                                          .listVideoData[index].videoPreview),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 16,
                                  ),
                                  width: myWidth - 110,
                                  child: Text(
                                    state.listVideoData[index].videoName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : Container(),
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
}
