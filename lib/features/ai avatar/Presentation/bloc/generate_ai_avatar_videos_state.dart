import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class GenerateAiAvatarVideosState {}

class GenerateAiAvatarVideosInitial extends GenerateAiAvatarVideosState {}

class GenerateAiAvatarScriptLoading extends GenerateAiAvatarVideosState {}

class GenerateScriptLoaded extends GenerateAiAvatarVideosState {
  final GenerateScriptEntity generateScriptEntity;
  GenerateScriptLoaded(this.generateScriptEntity);
}

class AiAvatarVideoGenerating extends GenerateAiAvatarVideosState {}

class AiAvtatarVideoGenerated extends GenerateAiAvatarVideosState {
  final String jobId;
  AiAvtatarVideoGenerated(this.jobId);
}

class AiAvatarVideoLoading extends GenerateAiAvatarVideosState {}

class AiAvatarVideoLoaded extends GenerateAiAvatarVideosState {
  final UrlVideoEntity video;
  AiAvatarVideoLoaded(this.video);
}

class AiAvatarVideoError extends GenerateAiAvatarVideosState {
  final String message;
  AiAvatarVideoError(this.message);
}

class VideoStatusLoadingWithProgress extends GenerateAiAvatarVideosState {
  final int progressCount;
  VideoStatusLoadingWithProgress(this.progressCount);
}
