import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_cubit.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/steps_video_widget.dart';
import 'package:graduation_project/features/settings/Presentation/widgets/drop_down_widget.dart';
import 'package:lottie/lottie.dart';

class CreateVideoScreen extends StatefulWidget {
  CreateVideoScreen({super.key});

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  String selectedOption = "Motivational";
  String languageOption = "Arabic";
  String accentOption = "Egyptian";
  final TextEditingController promotController = TextEditingController();

  // Script & Title variables to display after generation
  String? generatedScript;
  String? generatedTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GenerateVideoCubit(
            generateViedoUseCase: getIt.get<GenerateViedoUseCase>(),
            generateScriptUseCase: getIt.get<GenerateScriptUseCase>(),
            getVideoStatusUseCase: getIt.get<PollVideoStatusUseCase>(),
          ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              StepsVideoWidget(),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: InputWidget(
                  text: "Input your prompt or choose a script",
                  controller: promotController,
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
                      var cubit = context.read<GenerateVideoCubit>();

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
                          cubit.generateScript(
                            promot: promotController.text.toLowerCase(),
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
                        setState(() {
                          selectedOption = val!;
                        });
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
                    Column(
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
                            width: 500,
                            items: ["English", "Arabic"],
                            value: languageOption,
                            onChanged: (val) {
                              setState(() {
                                languageOption = val!;
                              });
                            },
                            itemToString: (val) => val.toString(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Column(
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
                            width: 550,
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
                            itemToString: (val) => val.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: BlocConsumer<GenerateVideoCubit, GenerateVideoState>(
                  listener: (context, state) {
                    if (state is GenerateVideoSuccess) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              content: Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                      );
                    } else if (state is GenerateVideoError) {
                      ToastManager.showBottomSmallToastSuccess(
                        context: context,
                        description: state.error,
                        bgColor: Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GenerateVideoLoading) {
                      return SizedBox(
                        width: 35.w,
                        height: 40.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                    return CustomButton(
                      onPressed: () {
                        if (generatedScript != null && generatedTitle != null) {
                          context.read<GenerateVideoCubit>().generateVideo(
                            generatedScript: generatedScript!,
                            title: generatedTitle!,
                            language: languageOption.toLowerCase(),
                            accentOrDialect: accentOption.toLowerCase(),
                            type: selectedOption.toLowerCase(),
                          );
                          print("generatedScript $generatedScript");
                          print("generatedTitle: $generatedTitle");
                          print("language: $languageOption");
                          print("accent: $accentOption");
                          print("type: $selectedOption");
                        } else {
                          ToastManager.showBottomSmallToastSuccess(
                            context: context,
                            description: "Please generate the script first",
                            textColor: Colors.white,
                            bgColor: Colors.red,
                          );
                        }
                      },
                      iconAsset: "assets/icons/Frame.svg",
                      text: "Generate",
                      width: 150,
                      height: 40,
                      fontSize: 14,
                      color: AppColors.wamdahGoldColor2,
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
