import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';
import 'package:video_player/video_player.dart';

class RecentVideoDetailsScreen extends StatefulWidget {
  final VideosEntity video;

  const RecentVideoDetailsScreen({super.key, required this.video});

  @override
  State<RecentVideoDetailsScreen> createState() =>
      _RecentVideoDetailsScreenState();
}

class _RecentVideoDetailsScreenState extends State<RecentVideoDetailsScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isMuted = false;
  bool _isBuffering = false;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(widget.video.videoSourceEntity.secureUrl)
          ..initialize().then((_) {
            setState(() {
              _isInitialized = true;
            });
          })
          ..addListener(() {
            setState(() {
              _isBuffering = _controller.value.isBuffering;
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _toggleVolume() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void _toggleFullscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullscreenVideoPlayer(controller: _controller),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo2.png", height: 80),
            SizedBox(width: 30.w),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 600,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child:
                    _isInitialized
                        ? GestureDetector(
                          onTap: _toggleControls,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(_controller),
                              if (_isBuffering)
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              if (_showControls) ...[
                                Container(color: Colors.black26),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 32,
                                        color: AppColors.wamdahGoldColor2,
                                      ),
                                      onPressed: _togglePlayPause,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        _isMuted
                                            ? Icons.volume_off
                                            : Icons.volume_up,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                      onPressed: _toggleVolume,
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: VideoProgressIndicator(
                                    _controller,
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                      playedColor: AppColors.wamdahGoldColor2,
                                      bufferedColor: Colors.white30,
                                      backgroundColor: Colors.white10,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        )
                        : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        video.title,
                        style: GoogleFonts.poppins(
                          color: AppColors.wamdahGoldColor2,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 500,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Duration: ${video.duration} seconds',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Created at: ${video.createdAt.formatIsoStringToTime(context)}',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Language: ${video.language.toUpperCase()}',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Accent: ${video.accentOrDialect.toUpperCase()}',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class FullscreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const FullscreenVideoPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
