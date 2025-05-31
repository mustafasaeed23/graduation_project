import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/Api/wamdah_dio.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_cubit.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/percentage_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/steps_video_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/video_dialog.dart';
import 'package:graduation_project/features/dashboard/Presentation/screens/dashboard_screen.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:lottie/lottie.dart';

class CreateVideoScreen extends StatefulWidget {
  const CreateVideoScreen({Key? key}) : super(key: key);

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  String selectedOption = "Motivational";
  String languageOption = "Arabic";
  String accentOption = "Egyptian";
  final TextEditingController promptController = TextEditingController();

  String? generatedScript;
  String? generatedTitle;

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => GenerateVideoCubit(
            generateVideoUseCase: getIt.get<GenerateViedoUseCase>(),
            generateScriptUseCase: getIt.get<GenerateScriptUseCase>(),
            pollVideoStatusUseCase: getIt.get<PollVideoStatusUseCase>(),
          ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              children: [
                StepsVideoWidget(),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: InputWidget(
                    text: "Input your prompt or choose a script",
                    controller: promptController,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: BlocConsumer<GenerateVideoCubit, GenerateVideoState>(
                      listener: (context, state) {
                        if (state is GenerateScriptSuccess) {
                          setState(() {
                            generatedScript = state.script.generatedScript;
                            generatedTitle = state.script.title;
                          });
                          ToastManager.showBottomSmallToastSuccess(
                            context: context,
                            description: "Script Generated Successfully",
                            textColor: Colors.white,
                            bgColor: AppColors.wamdahSecoundPrimary,
                          );
                        } else if (state is GenerateScriptError) {
                          ToastManager.showBottomSmallToastSuccess(
                            context: context,
                            description: "Try again",
                            textColor: Colors.white,
                            bgColor: Colors.red,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is GenerateScriptLoading) {
                          return SizedBox(
                            width: 35.w,
                            height: 40.h,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.wamdahSecoundPrimary,
                                ),
                              ),
                            ),
                          );
                        }
                        return CustomButton(
                          text: "Generate Script",
                          onPressed: () {
                            context.read<GenerateVideoCubit>().generateScript(
                              prompt: promptController.text.toLowerCase(),
                              language: languageOption.toLowerCase(),
                              accentOrDialect: accentOption.toLowerCase(),
                              type: selectedOption.toLowerCase(),
                            );
                          },
                          color: AppColors.wamdahSecoundPrimary,
                          width: 35.w,
                          height: 40.h,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                if (generatedTitle != null || generatedScript != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (generatedTitle != null) ...[
                          Text(
                            "Title:",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.wamdahGoldColor2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            generatedTitle!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                        if (generatedScript != null) ...[
                          Text(
                            "Script:",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.wamdahGoldColor2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            generatedScript!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: AppColors.wamdahGoldColor2,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomDropdown<String>(
                        width: double.infinity,
                        items: ["Motivational", "Tech", "Educational"],
                        value: selectedOption,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              selectedOption = val;
                            });
                          }
                        },
                        itemToString: (val) => val.toString(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(height: 20),
                            SizedBox(
                              height: 50.h,
                              child: CustomDropdown<String>(
                                width: double.infinity,
                                items: ["English", "Arabic"],
                                value: languageOption,
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() {
                                      languageOption = val;
                                    });
                                  }
                                },
                                itemToString: (val) => val.toString(),
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
                            SizedBox(height: 20),
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
                                  if (val != null) {
                                    setState(() {
                                      accentOption = val;
                                    });
                                  }
                                },
                                itemToString: (val) => val.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Center(
                  child: BlocBuilder<GenerateVideoCubit, GenerateVideoState>(
                    builder: (context, state) {
                      if (state is GenerateVideoLoading) {
                        return SizedBox(
                          width: 35.w,
                          height: 40.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (state is GenerateVideoError) {
                        return CustomButton(
                          text: "Generate Video",
                          onPressed: () {
                            context.read<GenerateVideoCubit>().generateVideo(
                              generatedScript: generatedScript!,
                              title: generatedTitle!,
                              language: languageOption.toLowerCase(),
                              accentOrDialect: accentOption.toLowerCase(),
                              type: selectedOption.toLowerCase(),
                            );
                          },
                          color: AppColors.wamdahSecoundPrimary,
                          width: 35.w,
                          height: 40.h,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        );
                      }
                      if (state is GenerateVideoSuccess) {
                        context.read<GenerateVideoCubit>().checkVideoStatus(
                          state.jobId.jobId,
                        );

                        Future.delayed(Duration.zero, () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder:
                                (context) => BlocBuilder<
                                  GenerateVideoCubit,
                                  GenerateVideoState
                                >(
                                  builder: (context, state) {
                                    if (state is GenerateVideoStatusLoading ||
                                        state
                                            is GenerateVideoStatusInProgress) {
                                      return const AlertDialog(
                                        content: SizedBox(
                                          width: 300,
                                          height: 300,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      );
                                    } else if (state
                                        is GenerateVideoStatusCompleted) {
                                      final videoUrl =
                                          state
                                              .videoStatus
                                              .video
                                              ?.videoSource
                                              .secureUrl;
                                      if (videoUrl != null) {
                                        return AlertDialog(
                                          content: SizedBox(
                                            width: 300,
                                            height: 300,
                                            child: VideoDialogContent(
                                              videoUrl: videoUrl,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed:
                                                  () =>
                                                      Navigator.of(
                                                        context,
                                                      ).pop(),
                                              child: const Text("Close"),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                            "Video URL not available.",
                                          ),
                                        );
                                      }
                                    } else if (state
                                        is GenerateVideoStatusError) {
                                      return AlertDialog(
                                        title: const Text("Error"),
                                        content: Text(
                                          state.message ??
                                              "Unknown error occurred.",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () =>
                                                    Navigator.of(context).pop(),
                                            child: const Text("Close"),
                                          ),
                                        ],
                                      );
                                    } else if (state
                                        is GenerateVideoStatusTimeout) {
                                      return AlertDialog(
                                        title: const Text("Timeout"),
                                        content: const Text(
                                          "Video generation timed out. Please try again later.",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () =>
                                                    Navigator.of(context).pop(),
                                            child: const Text("Close"),
                                          ),
                                        ],
                                      );
                                    }

                                    return AlertDialog(
                                      content: LoadingWithPercentage(
                                        onButtonPressed: () {
                                          // context.pop();
                                          context.pushNamed(Routes.homePage);
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder:
                                          //         (context) =>
                                          //             DashboardScreen(),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ); // No matching state
                                  },
                                ),
                          );
                        });
                      }

                      return CustomButton(
                        text: "Generate Video",
                        onPressed: () {
                          context.read<GenerateVideoCubit>().generateVideo(
                            generatedScript: generatedScript!,
                            title: generatedTitle!,
                            language: languageOption.toLowerCase(),
                            accentOrDialect: accentOption.toLowerCase(),
                            type: selectedOption.toLowerCase(),
                          );
                        },
                        color: AppColors.wamdahSecoundPrimary,
                        width: 35.w,
                        height: 40.h,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
