import 'package:graduation_project/features/create%20videos/Data/Models/create_video_model.dart';

abstract class GenerateVideoState {}

class GenerateVideoInitial extends GenerateVideoState {}

class GenerateVideoLoading extends GenerateVideoState {}

class GenerateVideoSuccess extends GenerateVideoState {
  final VideoDataModel video;
  GenerateVideoSuccess({required this.video});
}

class GenerateVideoError extends GenerateVideoState {
  final String error;
  GenerateVideoError({required this.error});
}
