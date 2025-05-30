import 'package:graduation_project/features/create%20videos/Data/Models/generate_video_reposne.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_script_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';

abstract class GenerateVideoState {}

class GenerateVideoInitial extends GenerateVideoState {}

class GenerateVideoLoading extends GenerateVideoState {}

class GenerateVideoSuccess extends GenerateVideoState {
  final GenerateVideoEntity jobId;
  GenerateVideoSuccess({required this.jobId});
}

class GenerateVideoError extends GenerateVideoState {
  final String error;
  GenerateVideoError({required this.error});
}

/// Generate script states
class GenerateScriptSuccess extends GenerateVideoState {
  final GenerateScriptEntity script;
  GenerateScriptSuccess({required this.script});
}

class GenerateScriptError extends GenerateVideoState {
  final String error;
  GenerateScriptError({required this.error});
}

class GenerateScriptLoading extends GenerateVideoState {}

/// New: Video status checking states (for polling video generation status)
class GenerateVideoStatusLoading extends GenerateVideoState {}

class GenerateVideoStatusInProgress extends GenerateVideoState {
  final GenerateVideoStatusEntity videoStatus;
  GenerateVideoStatusInProgress({required this.videoStatus});
}

class GenerateVideoStatusCompleted extends GenerateVideoState {
  final GenerateVideoStatusEntity videoStatus;
  GenerateVideoStatusCompleted({required this.videoStatus});
}

class GenerateVideoStatusError extends GenerateVideoState {
  final String error;
  GenerateVideoStatusError({required this.error});
}

class GenerateVideoStatusTimeout extends GenerateVideoState {}

class GenerateVideoStatusInitial extends GenerateVideoState {}