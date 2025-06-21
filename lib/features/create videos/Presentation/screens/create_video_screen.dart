import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/steps_video_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_bloc.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_event.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_state.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/presentation/url_video_player_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateVideoScreen extends StatefulWidget {
  const CreateVideoScreen({super.key});

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  String selectedOption = "Educational";
  String languageOption = "Arabic";
  String accentOption = "Egyptian";
  final TextEditingController promptController = TextEditingController();
  ScriptEntity? generatedScript;

  Future<void> _openUrl(String url) async {
    // You need to add url_launcher to your pubspec.yaml dependencies
    // import 'package:url_launcher/url_launcher.dart';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepsVideoWidget(),
                  SizedBox(height: 20.h),
                  InputWidget(
                    text: 'Input your prompt or choose a script',
                    controller: promptController,
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomButton(
                      text: "Generate Script",
                      onPressed: () {
                        final prompt = promptController.text.trim();
                        if (prompt.isEmpty) return;
                        context.read<GenerateInstantVideoBloc>().add(
                          GenerateInstantVideoScriptEvent(
                            userPromot: prompt,
                            language: languageOption.toLowerCase(),
                            accentOrDialect: accentOption.toLowerCase(),
                            type: selectedOption.toLowerCase(),
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
                  BlocConsumer<GenerateInstantVideoBloc, InstantVideoState>(
                    listener: (context, state) {
                      if (state is InstantVideoError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is InstantVideoScriptLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is InstantVideoScriptLoaded) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            generatedScript = state.script;
                          });
                        });
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              "Title:",
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
                            SizedBox(height: 20.h),
                            Text(
                              "Script:",
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
                        );
                      } else if (state is InstantVideoGenerating) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10),
                            Text(
                              "Generating video...",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        );
                      } else if (state
                          is InsatntVideoStatusLoadingWithProgress) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
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
                              ),
                            ],
                          ),
                        );
                      } else if (state is InstantVideoStatusLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
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
                              "Video URL: ${state.video.videoUrl}",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10.h),
                            ElevatedButton.icon(
                              icon: Icon(Icons.open_in_new),
                              label: Text("Open Video in Browser"),
                              onPressed:
                                  state.video.videoUrl != null
                                      ? () => _openUrl(state.video.videoUrl!)
                                      : null,
                            ),
                            SizedBox(height: 20),
                            if (state.video.videoUrl != null)
                              UrlVideoPlayerWidget(
                                videoUrl: state.video.videoUrl!,
                              ),
                          ],
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
                            CustomDropdown<String>(
                              width: double.infinity,
                              items: ["Arabic", "English"],
                              value: languageOption,
                              onChanged:
                                  (val) =>
                                      setState(() => languageOption = val!),
                              itemToString: (val) => val,
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
                            CustomDropdown<String>(
                              width: double.infinity,
                              items: [
                                "Egyptian",
                                "Egyptian(prof.Ghada)",
                                "Egyptian(ms.Gehad)",
                                "American",
                                "British",

                              ],
                              value: accentOption,
                              onChanged:
                                  (val) => setState(() => accentOption = val!),
                              itemToString: (val) => val,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Category",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: AppColors.wamdahGoldColor2,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdown<String>(
                    width: double.infinity,
                    items: ["Educational", "Tech", "Tourism", "Nutrition"],
                    value: selectedOption,
                    onChanged: (val) => setState(() => selectedOption = val!),
                    itemToString: (val) => val,
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: CustomButton(
                      iconAsset: "assets/icons/Frame.svg",
                      text: "Generate Video",
                      width: 60.w,
                      height: 40.h,
                      fontSize: 14,
                      color: AppColors.wamdahGoldColor2,
                      textColor: Colors.white,
                      onPressed:
                          generatedScript == null
                              ? null
                              : () {
                                context.read<GenerateInstantVideoBloc>().add(
                                  GenerateInstantVideo(
                                    title: generatedScript!.title,
                                    generatedScript:
                                        generatedScript!.generatedScript,
                                    language: languageOption.toLowerCase(),
                                    accentOrDialect: accentOption.toLowerCase(),
                                    type: selectedOption.toLowerCase(),
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
