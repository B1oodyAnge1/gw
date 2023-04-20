import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_gw/bloc/gw_block.dart';
import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/controllers/class.dart';
import 'package:flutter_application_gw/video_player/asset_player_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySearchDelegate extends SearchDelegate {
  MySearchDelegate({Key? key, required this.searchResults});

  final List<VideoData> searchResults;

  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear))
      ];
  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: ((context) => GWBloc()..add(giveMeAVideo())),
      child: BlocBuilder<GWBloc, GWState>(builder: (context, state) {
        return Material(
          child: state.listVideoData.isNotEmpty
              ? AssetPlayerWidget(
                  down: state.listVideoData[0].videoDownloader,
                )
              : Container(),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<VideoData> suggestions = searchResults.where((searchResult) {
      final result = searchResult.videoName.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: ((context, index) {
          final suggestion = suggestions[index];
          return ListTile(
              title: Text(suggestion.videoName),
              onTap: (() {
                query = suggestion.videoName;
                Navigator.pushNamed(context, '/1',
                    arguments: suggestion.videoDownloader);
              }));
        }));
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      );
}
