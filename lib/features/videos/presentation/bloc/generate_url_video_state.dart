import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class ScriptLoading extends VideoState {}

class ScriptLoaded extends VideoState {
  final ScriptEntity script;

  ScriptLoaded(this.script);

  @override
  String toString() => 'ScriptLoaded { script: $script }';
}

class VideoGenerating extends VideoState {}

class VideoGenerated extends VideoState {
  final String jobId;

  VideoGenerated(this.jobId);

  @override
  String toString() => 'VideoGenerated { jobId: $jobId }';
}

class VideoStatusLoading extends VideoState {}

class VideoStatusLoaded extends VideoState {
  final UrlVideoEntity video;

  VideoStatusLoaded(this.video);

  @override
  String toString() => 'VideoStatusLoaded { video: $video }';
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);

  @override
  String toString() => 'VideoError { message: $message }';
}

class VideoStatusLoadingWithProgress extends VideoState {
  final int progressCount;

  VideoStatusLoadingWithProgress({required this.progressCount});

  @override
  String toString() => 'VideoStatusLoadingWithProgress { progressCount: $progressCount }';
}
