import 'package:flutter/material.dart';

import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  late String str;
  @override
  Widget build(BuildContext contex) {
    //double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: ((context) => GWBloc()..add(giveMeAVideo())),
        child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              // Движущийся appbar
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    title: const Text("MyVideo"),
                    floating: true,
                    expandedHeight: 50.0,
                    forceElevated: innerBoxIsScrolled,
                  ),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: myWidth,
                                child: Image(
                                  image: NetworkImage(
                                      state.listVideoData[index].videoPreview),
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : Container(),
            ),
            endDrawer: Drawer(
              //Боковое меню
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    // Заголовок и его background
                    height: 64,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Text(
                        "Меню",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Настрйоки"),
                    onTap: () => Navigator.pushNamed(context, '/2'),
                  )
                ],
              ),
            ),
          );
        }));
  }

  void onTapSetings() {}
}
