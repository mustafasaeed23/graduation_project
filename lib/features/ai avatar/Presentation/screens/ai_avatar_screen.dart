import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_bloc.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_event.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_state.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/widgets/CustomSpokesPersonWidget.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/presentation/url_video_player_widget.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../create videos/Presentation/widgets/input_widget.dart';
import '../../../settings/Presentation/widgets/drop_down_widget.dart';

class AiAvatarScreen extends StatefulWidget {
  const AiAvatarScreen({super.key});

  @override
  State<AiAvatarScreen> createState() => _AiAvatarScreenState();
}

class _AiAvatarScreenState extends State<AiAvatarScreen> {
  String selectedOption = "Educational";
  String selectedAccent = "Egyptian";
  String selectedLanguage = "Arabic";
  String selectedSpeaker = '';
  final TextEditingController promptController = TextEditingController();
  GenerateScriptEntity? generateScript;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputWidget(
                text: "Input your prompt or choose a script",
                controller: promptController,
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: "Generate Script",
                  onPressed: _handleGenerateScript,
                  color: AppColors.wamdahSecoundPrimary,
                  width: 60.w,
                  height: 40.h,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),

              BlocConsumer<
                GenerateAiAvatarVideosBloc,
                GenerateAiAvatarVideosState
              >(
                listener: _handleBlocListener,
                builder: (context, state) => _buildBlocUI(state),
              ),

              _buildDropdownsAndSpokespersonSection(),

              SizedBox(height: 30.h),
              _buildLanguageAndAccentRow(),

              SizedBox(height: 60.h),
              Center(
                child: CustomButton(
                  onPressed: _handleGenerateVideo,
                  iconAsset: "assets/icons/Frame.svg",
                  text: "Generate",
                  width: 150,
                  height: 40,
                  fontSize: 14,
                  color: AppColors.wamdahGoldColor2,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  void _handleGenerateScript() {
    context.read<GenerateAiAvatarVideosBloc>().add(
      GenerateScriptEventAiAvatar(
        userPromot: promptController.text,
        language: selectedLanguage.toLowerCase(),
        accentOrDialect: selectedAccent.toLowerCase(),
        type: selectedOption.toLowerCase(),
      ),
    );
  }

  void _handleGenerateVideo() {
    if (generateScript == null || selectedSpeaker.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please generate a script and select a speaker."),
        ),
      );
      return;
    }

    context.read<GenerateAiAvatarVideosBloc>().add(
      GenerateVideoEvent(
        title: generateScript!.title,
        generatedScript: generateScript!.generatedScript,
        language: selectedLanguage.toLowerCase(),
        accentOrDialect: selectedAccent.toLowerCase(),
        speaker: selectedSpeaker.toLowerCase(),
        type: selectedOption.toLowerCase(),
      ),
    );
  }

  void _handleBlocListener(
    BuildContext context,
    GenerateAiAvatarVideosState state,
  ) {
    if (state is AiAvatarVideoError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    } else if (state is GenerateScriptLoaded) {
      setState(() {
        generateScript = state.generateScriptEntity;
      });
    }
  }

  Widget _buildBlocUI(GenerateAiAvatarVideosState state) {
    if (state is GenerateAiAvatarScriptLoading ||
        state is AiAvatarVideoGenerating) {
      return _buildLoading("Generating...");
    } else if (state is GenerateScriptLoaded) {
      return _buildGeneratedScript(state.generateScriptEntity);
    } else if (state is VideoStatusLoadingWithProgress) {
      return _buildVideoProgressDialog(state.progressCount as double);
    } else if (state is AiAvatarVideoLoaded) {
      return _buildVideoSection(state.video.videoUrl);
    } else if (state is AiAvatarVideoError) {
      return _buildErrorText(state.message);
    }
    return const SizedBox.shrink();
  }

  Widget _buildGeneratedScript(GenerateScriptEntity script) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Title :"),
          SizedBox(height: 10.h),
          Text(
            script.title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 20.h),
          _buildSectionTitle("Generated Script"),
          SizedBox(height: 10.h),
          Text(
            script.generatedScript,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoProgressDialog(double progress) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Generating video... ${(progress).toStringAsFixed(1)}%"),
          SizedBox(height: 10.h),
          Lottie.asset(
            "assets/animations/Animation - 1748706708268.json",
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoSection(String? videoUrl) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Video generated successfully!"),
          SizedBox(height: 10.h),
          if (videoUrl != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  "Video URL: $videoUrl",
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10.h),
                UrlVideoPlayerWidget(videoUrl: videoUrl),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildErrorText(String message) {
    return Text(
      message,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.wamdahGoldColor2,
        fontSize: 15,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.wamdahGoldColor2,
        fontSize: 15,
      ),
    );
  }

  Widget _buildLoading(String message) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(color: AppColors.wamdahGoldColor2),
          SizedBox(height: 10.h),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDropdownsAndSpokespersonSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Category"),
        SizedBox(height: 15.h),
        CustomDropdown<String>(
          width: double.infinity,
          items: ["Educational", "Tech", "Tourism", "Nutrition"],
          value: selectedOption,
          onChanged: (val) => setState(() => selectedOption = val!),
          itemToString: (val) => val.toString(),
        ),
        SizedBox(height: 15.h),
        _buildSectionTitle("Pick Your Spokesperson"),
        SizedBox(height: 15.h),
        CustomSpokesPersonWidget(
          onSpeakerSelected: (name) => setState(() => selectedSpeaker = name),
        ),
      ],
    );
  }

  Widget _buildLanguageAndAccentRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Language"),
              SizedBox(height: 20.h),
              CustomDropdown<String>(
                width: double.infinity,
                items: ["Arabic", "English"],
                value: selectedLanguage,
                onChanged: (val) => setState(() => selectedLanguage = val!),
                itemToString: (val) => val.toString(),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Accent"),
              SizedBox(height: 20.h),
              CustomDropdown<String>(
                width: double.infinity,
                items: ["Egyptian", "British", "American"],
                value: selectedAccent,
                onChanged: (val) => setState(() => selectedAccent = val!),
                itemToString: (val) => val.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
