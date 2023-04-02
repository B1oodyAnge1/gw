import 'package:flutter_application_gw/screens/start.dart';

abstract class GWEvent extends Start {
  const GWEvent();
  @override
  List<Object?> get props => [];
}

class giveMeAVideo extends GWEvent {
  giveMeAVideo();
}

class giveMeChoose extends GWEvent {
  giveMeChoose();
}
