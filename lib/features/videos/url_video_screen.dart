import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_bloc.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_event.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_state.dart';
import 'package:graduation_project/features/videos/presentation/url_video_player_widget.dart';
import 'package:lottie/lottie.dart';

class UrlVideoScreen extends StatefulWidget {
  const UrlVideoScreen({super.key});

  @override
  State<UrlVideoScreen> createState() => _UrlVideoScreenState();
}

class _UrlVideoScreenState extends State<UrlVideoScreen> {
  String languageOption = "Arabic";
  String accentOption = "Egyptian";
  final TextEditingController urlController = TextEditingController();
  // Store generated script info to enable video generation
  ScriptEntity? generatedScript;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  InputWidget(
                    text: 'Input your URL',
                    controller: urlController,
                  ),
                  SizedBox(height: 20.h),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      text: "Generate Script",
                      onPressed: () {
                        final url = urlController.text.trim();
                        if (url.isEmpty) return;
                        setState(() {
                          generatedScript = null;
                        });
                        context.read<VideoBloc>().add(
                          GenerateScriptEvent(
                            url: url,
                            language: languageOption.toLowerCase(),
                            accentOrDialect: accentOption.toLowerCase(),
                          ),
                        );
                      },
                      color: AppColors.wamdahSecoundPrimary,
                      width: 60.w,
                      height: 40.h,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  BlocConsumer<VideoBloc, VideoState>(
                    listener: (context, state) {
                      if (state is VideoError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is ScriptLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ScriptLoaded) {
                        // Store script for later use in generating video
                        generatedScript = state.script;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title :",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.wamdahGoldColor2,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                state.script.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Generated Script",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.wamdahGoldColor2,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                state.script.generatedScript,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is VideoGenerating) {
                        return Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(
                                color: AppColors.wamdahGoldColor2,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Generating video...",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      } else if (state is VideoStatusLoadingWithProgress) {
                        return AlertDialog(
                          backgroundColor: Colors.white,

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Generating video... ${state.progressCount}%",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Lottie.asset(
                                "assets/animations/Animation - 1748706708268.json",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        );
                      } else if (state is VideoStatusLoaded) {
                        final videoUrl = state.video.videoUrl;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Video generated successfully!",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.wamdahGoldColor2,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              SelectableText(
                                "Video URL: $videoUrl",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 10),

                              // Button to open video in browser
                              // ElevatedButton.icon(
                              //   icon: Icon(Icons.open_in_new),
                              //   label: Text("Open Video in Browser"),
                              //   onPressed:
                              //       videoUrl != null
                              //           ? () => _openUrl(videoUrl)
                              //           : null,
                              // ),
                              SizedBox(height: 20),
                              if (videoUrl != null)
                                UrlVideoPlayerWidget(videoUrl: videoUrl),
                            ],
                          ),
                        );
                      } else if (state is VideoError) {
                        return Text(
                          state.message,
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),

                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Language",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: AppColors.wamdahGoldColor2,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 50.h,
                              child: CustomDropdown<String>(
                                width: double.infinity,
                                items: ["Arabic", "English"],
                                value: languageOption,
                                onChanged: (val) {
                                  setState(() {
                                    languageOption = val!;
                                  });
                                },
                                itemToString: (val) => val,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Accent",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: AppColors.wamdahGoldColor2,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 50.h,
                              child: CustomDropdown<String>(
                                width: double.infinity,
                                items: [
                                  "Egyptian",
                                  "Syrian",
                                  "American",
                                  "British",
                                ],
                                value: accentOption,
                                onChanged: (val) {
                                  setState(() {
                                    accentOption = val!;
                                  });
                                },
                                itemToString: (val) => val,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 60.h),
                  Center(
                    child: CustomButton(
                      iconAsset: "assets/icons/Frame.svg",
                      text: "Generate Video",
                      width: 60.w,
                      height: 40.h,
                      fontSize: 14,
                      color: AppColors.wamdahGoldColor2,
                      textColor: Colors.white,
                      onPressed: () {
                        context.read<VideoBloc>().add(
                          GenerateVideoEvent(
                            title: generatedScript!.title,
                            generatedScript: generatedScript!.generatedScript,
                            language: languageOption.toLowerCase(),
                            accentOrDialect: accentOption.toLowerCase(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
