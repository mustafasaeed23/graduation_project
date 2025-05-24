import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class RecentVideoContainer extends StatefulWidget {
  const RecentVideoContainer({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.createdAt,
    required this.duration,
  });

  final String videoUrl;
  final String title;
  final String createdAt;
  final String duration;

  @override
  State<RecentVideoContainer> createState() => _RecentVideoContainerState();
}

class _RecentVideoContainerState extends State<RecentVideoContainer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
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
    return Container(
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child:
                  _isInitialized
                      ? Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline,
                              color: AppColors.wamdahGoldColor2,
                              size: 50,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ],
                      )
                      : Center(child: CircularProgressIndicator()),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Text(
              widget.createdAt,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "${widget.duration} sec",
                  style: GoogleFonts.poppins(
                    color: AppColors.wamdahGoldColor2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/edit.svg",
                  color: AppColors.wamdahGoldColor2,
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/icons/save.svg",
                  color: AppColors.wamdahGoldColor2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
