import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/helpers/service_locator.dart';
import 'package:graduation_project/core/helpers/toast_manager.dart';
import 'package:graduation_project/core/theming/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/core/Presentation/widgets/step_widget.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_cubit.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';
import 'package:graduation_project/features/create%20videos/Presentation/widgets/input_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GenerateVideoCubit(
            generateViedoUseCase: getIt.get<GenerateViedoUseCase>(),
          ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StepWidget(
                    stepNumber: "1",
                    headTitle: "Input",
                    subTitle: "",
                    circleColor: AppColors.wamdahSecoundPrimary,
                    fontSize: 15,
                  ),
                  StepWidget(
                    stepNumber: "2",
                    headTitle: "Content",
                    subTitle: "",
                    circleColor: AppColors.wamdahSecoundPrimary,
                    fontSize: 15,
                  ),
                  StepWidget(
                    stepNumber: "3",
                    headTitle: "Language",
                    subTitle: "",
                    circleColor: AppColors.wamdahSecoundPrimary,
                    fontSize: 15,
                  ),
                  StepWidget(
                    stepNumber: "4",
                    headTitle: "Style",
                    subTitle: "",
                    circleColor: AppColors.wamdahSecoundPrimary,
                    fontSize: 15,
                  ),
                  StepWidget(
                    stepNumber: "5",
                    headTitle: "Generate",
                    subTitle: "",
                    circleColor: AppColors.wamdahSecoundPrimary,
                    fontSize: 15,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              InputWidget(
                text: "Input your prompt or choose a script",
                controller: promotController,
              ),
              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "category",
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
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                          height: 50.h, // Or whatever fits
                          child: CustomDropdown<String>(
                            width: 500, // or double.infinity
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
                          height: 50.h, // Or whatever fits
                          child: CustomDropdown<String>(
                            width: 550, // or double.infinity
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
                    if (state is GenerateVideoError) {
                    } else if (state is GenerateVideoLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (context) => SizedBox(
                              height: 300,
                              width: 300,
                              child: AlertDialog(
                                icon: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => Navigator.pop(context),
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Generating Video...",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(width: 10),

                                        Lottie.asset(
                                          "assets/animations/Animation - 1747426014372.json",
                                          height: 200,
                                          width: 200,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                ),
                              ),
                            ),
                      );
                    } else if (state is GenerateVideoSuccess) {
                      ToastManager.showBottomSmallToastSuccess(
                        context: context,
                        description: "Video Generated Successfully",
                        bgColor: Colors.green,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        context.read<GenerateVideoCubit>().generateVideo(
                          promot: promotController.text.toLowerCase().trim(),
                          language: languageOption.toLowerCase(),
                          accentOrDialect: accentOption.toLowerCase(),
                          type: selectedOption.toLowerCase(),
                        );
                        print("prompt: ${promotController.text}");
                        print("language: $languageOption");
                        print("accent: $accentOption");
                        print("type: $selectedOption");
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
            ],
          ),
        ),
      ),
    );
  }
}
