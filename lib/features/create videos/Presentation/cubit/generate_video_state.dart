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
  final String message;
  GenerateVideoError({required this.message});
}

/// Generate script states
class GenerateScriptLoading extends GenerateVideoState {}

class GenerateScriptSuccess extends GenerateVideoState {
  final GenerateScriptEntity script;
  GenerateScriptSuccess({required this.script});
}

class GenerateScriptError extends GenerateVideoState {
  final String message;
  GenerateScriptError({required this.message});
}

/// Video status polling states
class GenerateVideoStatusInitial extends GenerateVideoState {}

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
  final String message;
  GenerateVideoStatusError({required this.message});
}

class GenerateVideoStatusTimeout extends GenerateVideoState {}
