import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'video_controller.dart';

const Color primaryTeal = Color(0xFF0BA7B3);
const Color lightBg = Color(0xFFEAF8F9);

class VideoView extends StatelessWidget {
  VideoView({super.key});

  final controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // VIDEO PLAYER
          Obx(() {
            if (!controller.isVideoInitialized.value ||
                controller.playerController == null) {
              return const SizedBox(
                height: 240,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            return Stack(
              children: [
                SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: VideoPlayer(controller.playerController!),
                ),

                // BACK
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),

                // PLAY / PAUSE
                Positioned.fill(
                  child: GestureDetector(
                    onTap: controller.togglePlayPause,
                    child: Center(
                      child: Obx(() {
                        return CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white70,
                          child: Icon(
                            controller.isPlaying.value
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 32,
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // PROGRESS BAR
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: VideoProgressIndicator(
                    controller.playerController!,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: primaryTeal,
                      bufferedColor: Colors.white70,
                      backgroundColor: Colors.white30,
                    ),
                  ),
                ),
              ],
            );
          }),

          // VIDEO INFO
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Meditation Journey",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          // JOURNEY LIST (FROM API)
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.videos.length,
                itemBuilder: (context, index) {
                  final video = controller.videos[index];
                  final bool locked = video['status'] == 'locked';
                  final bool completed = video['status'] == 'completed';

                  return GestureDetector(
                    onTap: locked
                        ? null
                        : () =>
                        controller.playVideo(video['video_url']),
                    child: JourneyItem(
                      completed: completed,
                      locked: locked,
                      title: video['title'],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


class JourneyItem extends StatelessWidget {
  final bool completed;
  final bool locked;
  final String title;

  const JourneyItem({
    super.key,
    this.completed = false,
    this.locked = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor:
              completed ? Colors.green : Colors.grey.shade400,
              child: Icon(
                completed ? Icons.check : Icons.lock,
                size: 16,
                color: Colors.white,
              ),
            ),
            Container(height: 60, width: 2, color: Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Video",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text(
                        "Understanding the Basic of Meditation",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.play_arrow, color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
