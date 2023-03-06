import 'package:flutter/material.dart';

import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  late String str;
  @override
  Widget build(BuildContext contex) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: ((context) => GWBloc()..add(giveMeAVideo())),
        child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
          return Material(
            // ignore: prefer_const_literals_to_create_immutables
            child: state.listVideoData.isNotEmpty
                ? ListView.builder(
                    itemCount: state.listVideoData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, '/1',
                                arguments:
                                    state.listVideoData[index].videoDownloader);
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: myWidth,
                              child: Image(
                                image: NetworkImage(
                                    state.listVideoData[index].videoPreview),
                                fit: BoxFit.fitWidth,
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Container(),
          );
        }));
  }
}
