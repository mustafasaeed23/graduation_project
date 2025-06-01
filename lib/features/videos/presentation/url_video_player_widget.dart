import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:video_player/video_player.dart';

class UrlVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const UrlVideoPlayerWidget({required this.videoUrl, Key? key})
    : super(key: key);

  @override
  State<UrlVideoPlayerWidget> createState() => _UrlVideoPlayerWidgetState();
}

class _UrlVideoPlayerWidgetState extends State<UrlVideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.wamdahGoldColor2),
      );
    }

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
        height:
            (MediaQuery.of(context).size.width * 0.9) *
            0.1, // maintain 16:9 ratio
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoPlayer(_controller),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: AppColors.wamdahGoldColor2,
                backgroundColor: Colors.grey,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
