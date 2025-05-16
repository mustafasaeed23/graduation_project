import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';
import 'package:page_transition/page_transition.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.video.videoSourceEntity.secureUrl,
      )
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final video = widget.video;
    final screenWidth = MediaQuery.of(context).size.width;
    final videoWidth = screenWidth * 0.9; // 90% width
    final videoHeight = videoWidth * 9 / 16; // 16:9 ratio

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
            SizedBox(width: 50.w),
            Text(video.title, style: const TextStyle(color: Colors.white)),
            SizedBox(width: 50.w),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.pop();
                },
              ),
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
                  // color: Colors.black,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white.withOpacity(0.1),
                  //     blurRadius: 10,
                  //     spreadRadius: 1,
                  //     offset: const Offset(0, 4),
                  //   ),
                  // ],
                ),
                clipBehavior: Clip.hardEdge,
                child:
                    _isInitialized
                        ? Stack(
                          alignment: Alignment.center,
                          children: [
                            VideoPlayer(_controller),
                            // Dark transparent overlay for better button visibility
                            Container(color: Colors.black26),
                            // Play/Pause button
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.white70,
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: AppColors.wamdahGoldColor2,
                                  size: 32,
                                ),
                              ),
                            ),
                            // Video progress indicator at the bottom
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
                        )
                        : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
              ),
              const SizedBox(height: 24),
              // Video Details
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
