// ignore_for_file: avoid_print

import 'dart:io';

class VideoData {
  String videoName = '';
  String videoDownloader = '';
  String videoPreview = '';
  createVideoData(String name, String downloader, String preview) {
    videoName = name;
    videoDownloader = downloader;
    videoPreview = preview;
  }

  stdoutVideoData() {
    print("Video Name: $videoName");
    print("Video Downloader: $videoDownloader");
    print("Video Preview: $videoPreview");
    print('=====================================');
  }
}
