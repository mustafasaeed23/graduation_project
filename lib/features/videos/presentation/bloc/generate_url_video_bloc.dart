import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/videos/domain/entities/url_video_entity.dart';
import 'package:graduation_project/features/videos/domain/entities/script_entity.dart';
import 'package:graduation_project/features/videos/domain/usecases/generate_url_video_use_cases.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_event.dart';
import 'package:graduation_project/features/videos/presentation/bloc/generate_url_video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoUseCase useCase;

  VideoBloc({required this.useCase}) : super(VideoInitial()) {
    on<GenerateScriptEvent>(_onGenerateScript);
    on<GenerateVideoEvent>(_onGenerateVideo);
    on<PollVideoStatusEvent>(_onPollVideoStatus);
  }

  Future<void> _onGenerateScript(
    GenerateScriptEvent event,
    Emitter<VideoState> emit,
  ) async {
    emit(ScriptLoading());
    try {
      final ScriptEntity script = await useCase.generateScript(
        url: event.url,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
      );
      emit(ScriptLoaded(script));
    } catch (e) {
      emit(VideoError('Failed to generate script: $e'));
    }
  }

  Future<void> _onGenerateVideo(
    GenerateVideoEvent event,
    Emitter<VideoState> emit,
  ) async {
    emit(VideoGenerating());
    try {
      final String jobId = await useCase.generateVideo(
        title: event.title,
        generatedScript: event.generatedScript,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
      );
      emit(VideoGenerated(jobId));
      add(PollVideoStatusEvent(jobId)); // Start polling automatically
    } catch (e) {
      emit(VideoError('Failed to generate video: $e'));
    }
  }

  Future<void> _onPollVideoStatus(
    PollVideoStatusEvent event,
    Emitter<VideoState> emit,
  ) async {
    try {
      while (true) {
        final UrlVideoEntity status = await useCase.checkVideoStatus(
          event.jobId,
        );

        if (status.status == 'completed') {
          emit(VideoStatusLoaded(status));
          break;
        } else {
          emit(VideoStatusLoadingWithProgress(progressCount: status.progress!));
          await Future.delayed(Duration(seconds: 2)); // Poll every 2 seconds
        }
      }
    } catch (e) {
      emit(VideoError('Failed to get video status: $e'));
    }
  }
}
