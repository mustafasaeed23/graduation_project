import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';

abstract class InstantVideoState {}

class InstantVideoInitial extends InstantVideoState {}

class InstantVideoScriptLoading extends InstantVideoState {}

class InstantVideoScriptLoaded extends InstantVideoState {
  final ScriptEntity script;

  InstantVideoScriptLoaded(this.script);

  @override
  String toString() => 'ScriptLoaded { script: $script }';
}

class InstantVideoGenerating extends InstantVideoState {}

class InstantVideoGenerated extends InstantVideoState {
  final String jobId;

  InstantVideoGenerated(this.jobId);

  @override
  String toString() => 'VideoGenerated { jobId: $jobId }';
}

class InstantVideoStatusLoading extends InstantVideoState {}

class InstantVideoStatusLoaded extends InstantVideoState {
  final UrlVideoEntity video;

  InstantVideoStatusLoaded(this.video);

  @override
  String toString() => 'VideoStatusLoaded { video: $video }';
}

class InstantVideoError extends InstantVideoState {
  final String message;

  InstantVideoError(this.message);

  @override
  String toString() => 'VideoError { message: $message }';
}

class InsatntVideoStatusLoadingWithProgress extends InstantVideoState {
  final int progressCount;

  InsatntVideoStatusLoadingWithProgress({required this.progressCount});

  @override
  String toString() =>
      'VideoStatusLoadingWithProgress { progressCount: $progressCount }';
}
