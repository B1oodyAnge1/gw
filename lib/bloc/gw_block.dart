import 'package:flutter_application_gw/bloc/gw_event.dart';
import 'package:flutter_application_gw/bloc/gw_state.dart';
import 'package:flutter_application_gw/controllers/class.dart';
import 'package:flutter_application_gw/controllers/dio_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GWBloc extends Bloc<GWEvent, GWState> {
  GWBloc() : super(const GWState()) {
    on<GWEvent>((event, emit) async {
      if (event is giveMeAVideo) {
        await myVideo(event, state, emit);
      }
    });
  }
}

Future myVideo(giveMeAVideo event, GWState state, Emitter<GWState> emit) async {
  List<VideoData> videoList = await getHttp();

  emit(state.copyWith(listVideoData: videoList));
}
