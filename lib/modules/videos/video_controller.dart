import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../core/services/api_service.dart';

class VideoController extends GetxController {

  var isLoading = true.obs;
  var videos = <dynamic>[].obs;


  VideoPlayerController? playerController;
  var isVideoInitialized = false.obs;
  var isPlaying = false.obs;
  var selectedVideoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }


  Future<void> fetchVideos() async {
    try {
      isLoading(true);

      final response = await ApiService.getVideos();
      debugPrint("VIDEO RESPONSE: $response");

      final videoSection = response?['videos'];

      if (videoSection != null &&
          videoSection['videos'] is List &&
          videoSection['videos'].isNotEmpty) {

        videos.assignAll(videoSection['videos']);


        final firstVideo = videos.firstWhere(
              (v) => v['is_locked'] == false,
          orElse: () => videos.first,
        );

        await playVideo(firstVideo['video_url']);
      } else {
        videos.clear();
      }
    } catch (e) {
      debugPrint("fetchVideos error: $e");
      videos.clear();
    } finally {
      isLoading(false);
    }
  }


  Future<void> playVideo(String url) async {
    final secureUrl = url.replaceFirst('http://', 'https://');

    await playerController?.dispose();

    playerController = VideoPlayerController.networkUrl(
      Uri.parse(secureUrl),
    );

    await playerController!.initialize();
    isVideoInitialized(true);
    playerController!.play();
    isPlaying(true);
  }



  void togglePlayPause() {
    if (playerController == null) return;

    if (playerController!.value.isPlaying) {
      playerController!.pause();
    } else {
      playerController!.play();
    }
  }


  void markVideoCompleted(String url) {
    final index =
    videos.indexWhere((v) => v['video_url'] == url);

    if (index != -1) {
      videos[index]['is_completed'] = true;

      // 🔓 Unlock next video
      if (index + 1 < videos.length) {
        videos[index + 1]['is_locked'] = false;
      }

      videos.refresh();
    }
  }

  @override
  void onClose() {
    playerController?.dispose();
    super.onClose();
  }
}
