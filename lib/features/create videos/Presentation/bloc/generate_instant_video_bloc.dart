import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_instant_video_use_cases.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_event.dart';
import 'package:graduation_project/features/create%20videos/Presentation/bloc/generate_instant_video_state.dart';

class GenerateInstantVideoBloc
    extends Bloc<GenerateInstantVideoEvent, InstantVideoState> {
  final GenerateInstantVideoUseCase useCases;

  GenerateInstantVideoBloc({required this.useCases})
    : super(InstantVideoInitial()) {
    on<GenerateInstantVideoScriptEvent>(_onGenerateScript);
    on<GenerateInstantVideo>(_onGenerateVideo);
    on<PollInstantVideoStatusEvent>(_onPollVideoStatus);
  }

  Future<void> _onGenerateScript(
    GenerateInstantVideoScriptEvent event,
    Emitter<InstantVideoState> emit,
  ) async {
    emit(InstantVideoScriptLoading());
    try {
      final script = await useCases.generateScript(
        userPromot: event.userPromot,
        type: event.type,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
      );
      emit(InstantVideoScriptLoaded(script));
    } catch (e) {
      emit(InstantVideoError('Failed to generate script: $e'));
    }
  }

  Future<void> _onGenerateVideo(
    GenerateInstantVideo event,
    Emitter<InstantVideoState> emit,
  ) async {
    emit(InstantVideoGenerating());
    try {
      final jobId = await useCases.generateVideo(
        title: event.title,
        generatedScript: event.generatedScript,
        language: event.language,
        accentOrDialect: event.accentOrDialect,
        type: event.type,
      );
      emit(InstantVideoGenerated(jobId));
      add(PollInstantVideoStatusEvent(jobId)); // Start polling
    } catch (e) {
      emit(InstantVideoError('Failed to generate video: $e'));
    }
  }

  Future<void> _onPollVideoStatus(
    PollInstantVideoStatusEvent event,
    Emitter<InstantVideoState> emit,
  ) async {
    try {
      while (true) {
        final status = await useCases.checkVideoStatus(event.jobId);

        if (status.status == 'completed') {
          emit(InstantVideoStatusLoaded(status));
          break;
        } else {
          emit(
            InsatntVideoStatusLoadingWithProgress(
              progressCount: status.progress!,
            ),
          );
          await Future.delayed(Duration(seconds: 2));
        }
      }
    } catch (e) {
      emit(InstantVideoError('Failed to get video status: $e'));
    }
  }
}
