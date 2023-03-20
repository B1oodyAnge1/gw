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
              body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  title: Container(
                    color: Colors.red,
                    height: 50,
                  ),
                  floating: true,
                  expandedHeight: 50.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: state.listVideoData.isNotEmpty
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Container(),
          ));
        }));
  }
}
