import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class RecentVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  const RecentVideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<RecentVideoPlayerWidget> createState() => _RecentVideoPlayerWidgetState();
}

class _RecentVideoPlayerWidgetState extends State<RecentVideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
