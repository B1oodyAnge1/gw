import 'class.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<VideoData>> getHttp() async {
  VideoData video;
  List<VideoData> videoList = [];
  final response = await dio.get(
      'https://cloud-api.yandex.net/v1/disk/public/resources?public_key=https%3A%2F%2Fdisk.yandex.ru%2Fd%2FGzlM4jgxcOGHGQ');

  final Map<dynamic, dynamic> videoData = response.data;
  List<dynamic> n = videoData['_embedded']['items'];

  n.forEach((element) {
    video = VideoData()
      ..createVideoData(element['name'], element['file'], element['preview']);
    videoList.add(video);
  });

  return videoList;
}
