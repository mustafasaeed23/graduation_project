import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/generate_ai_avtar_video_use_case.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_event.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/bloc/generate_ai_avatar_videos_state.dart';

class GenerateAiAvatarVideosBloc
    extends Bloc<GenerateAiAvatarVideosEvent, GenerateAiAvatarVideosState> {
  final GenerateAiAvtarVideoUseCase useCases;

  GenerateAiAvatarVideosBloc({required this.useCases})
    : super(GenerateAiAvatarVideosInitial()) {
    on<GenerateScriptEventAiAvatar>(_onGenerateScript);
    on<GenerateVideoEvent>(_onGenerateVideo);
    on<CheckVideoStatusEvent>(_onCheckVideoStatus);
  }

  Future<void> _onGenerateScript(
    GenerateScriptEventAiAvatar event,
    Emitter<GenerateAiAvatarVideosState> emit,
  ) async {
    emit(GenerateAiAvatarScriptLoading());
    try {
      final script = await useCases.generateScript(
        userPromot: event.userPromot,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
        type: event.type,
      );
      emit(GenerateScriptLoaded(script));
    } catch (e) {
      emit(GenerateAiAvatarVideosInitial()); // or a dedicated error state
    }
  }

  Future<void> _onGenerateVideo(
    GenerateVideoEvent event,
    Emitter<GenerateAiAvatarVideosState> emit,
  ) async {
    emit(AiAvatarVideoGenerating());
    try {
      final jobId = await useCases.generateVideo(
        title: event.title,
        generatedScript: event.generatedScript,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
        speaker: event.speaker,
        type: event.type,
      );
      emit(AiAvtatarVideoGenerated(jobId));
      add(CheckVideoStatusEvent(jobId)); // Start polling
    } catch (e) {
      emit(GenerateAiAvatarVideosInitial()); // or an error state
    }
  }

  Future<void> _onCheckVideoStatus(
    CheckVideoStatusEvent event,
    Emitter<GenerateAiAvatarVideosState> emit,
  ) async {
    emit(AiAvatarVideoLoading());
    try {
      while (true) {
        final result = await useCases.checkVideoStatus(event.jobId);

        if (result.status == 'completed') {
          emit(AiAvatarVideoLoaded(result));
          break;
        } else {
          emit(VideoStatusLoadingWithProgress(result.progress ?? 0));
          await Future.delayed(Duration(seconds: 2));
        }
      }
    } catch (e) {
      emit(GenerateAiAvatarVideosInitial()); // or an error state
    }
  }
}
