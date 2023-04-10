import 'package:flutter/material.dart';
import 'package:flutter_application_gw/Theme/theme_constants.dart';

import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/main.dart';
import 'package:flutter_application_gw/screens/settings.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  late String str;
  int _selectedIndex = 0;
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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(
          context,
          '/2',
        );
      } else {
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: myWidth,
                                  child: Image(
                                    image: NetworkImage(state
                                        .listVideoData[index].videoPreview),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Text(
                                    state.listVideoData[index].videoName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
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
