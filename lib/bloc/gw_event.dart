import 'package:flutter_application_gw/start.dart';

abstract class GWEvent extends Start {
  const GWEvent();
  @override
  List<Object?> get props => [];
}

class giveMeAVideo extends GWEvent {
  giveMeAVideo();
}
