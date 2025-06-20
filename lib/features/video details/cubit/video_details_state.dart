import 'package:graduation_project/features/dashboard/Domain/entities/videos_entity.dart';

abstract class VideoDetailsState {}

class VideoDetailsInitial extends VideoDetailsState {}

class VideoDetailsLoading extends VideoDetailsState {}

class VideoDetailsLoaded extends VideoDetailsState {
  final VideosEntity entity;

  VideoDetailsLoaded({required this.entity});
}

class VideoDetailsError extends VideoDetailsState {
  final String message;
  VideoDetailsError({required this.message});
}
