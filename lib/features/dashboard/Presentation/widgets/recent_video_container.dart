import 'package:flutter/material.dart';
import 'package:graduation_project/features/dashboard/Presentation/cubit/dashboard_cubit.dart';
import 'package:graduation_project/features/video%20details/cubit/video_details_cubit.dart';
import 'package:graduation_project/features/video%20details/cubit/video_details_state.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/theming/colors.dart';

class RecentVideoContainer extends StatefulWidget {
  const RecentVideoContainer({
    super.key,
    required this.videoUrl,
    required this.videoId,
    required this.title,
    required this.createdAt,
    required this.duration,
  });

  final String videoUrl;
  final String videoId;
  final String title;
  final String createdAt;
  final String duration;

  @override
  State<RecentVideoContainer> createState() => _RecentVideoContainerState();
}

class _RecentVideoContainerState extends State<RecentVideoContainer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title;

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

  void _showRenameDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController(
      text: _title,
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: AppColors.drawerBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Rename Video',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            content: TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter new title",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.wamdahGoldColor2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.wamdahGoldColor2),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  final newTitle = titleController.text.trim();
                  if (newTitle.isNotEmpty) {
                    context.read<VideoDetailsCubit>().renameVideo(
                      newTitle: newTitle,
                      videoId: widget.videoId,
                    );
                    Navigator.pop(context);
                    context.read<DashboardCubit>().getDashboardInformation();
                  }
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(color: AppColors.wamdahGoldColor2),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoDetailsCubit, VideoDetailsState>(
      listener: (context, state) {
        if (state is VideoDetailsLoaded && state.entity.sId == widget.videoId) {
          setState(() {
            _title = state.entity.title;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Renamed to: ${state.entity.title}")),
          );
        } else if (state is VideoDetailsError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
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
                          : const Center(child: CircularProgressIndicator()),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  _title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12,
                ),
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
                    GestureDetector(
                      onTap: () => _showRenameDialog(context),
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        color: AppColors.wamdahGoldColor2,
                      ),
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
      },
    );
  }
}
