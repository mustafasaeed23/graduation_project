import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';

class GenerateVideoCubit extends Cubit<GenerateVideoState> {
  GenerateVideoCubit({
    required this.generateVideoUseCase,
    required this.generateScriptUseCase,
    required this.pollVideoStatusUseCase,
  }) : super(GenerateVideoInitial());

  final GenerateViedoUseCase generateVideoUseCase;
  final GenerateScriptUseCase generateScriptUseCase;
  final PollVideoStatusUseCase pollVideoStatusUseCase;

  Timer? _timer;
  static const _pollInterval = Duration(seconds: 2);
  static const _timeoutDuration = Duration(minutes: 1);

  Future<void> generateVideo({
    required String generatedScript,
    required String title,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    emit(GenerateVideoLoading());

    final result = await generateVideoUseCase.call(
      generatedScript: generatedScript,
      title: title,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );

    result.fold(
      (failure) => emit(GenerateVideoError(message: failure.message)),
      (jobId) => emit(GenerateVideoSuccess(jobId: jobId)),
    );
  }

  Future<void> generateScript({
    required String prompt,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    emit(GenerateScriptLoading());

    final result = await generateScriptUseCase.call(
      userPromot: prompt,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );

    result.fold(
      (failure) => emit(GenerateScriptError(message: failure.message)),
      (script) => emit(GenerateScriptSuccess(script: script)),
    );
  }

  Future<void> checkVideoStatus(String jobId) async {
    emit(GenerateVideoStatusLoading());

    final endTime = DateTime.now().add(_timeoutDuration);

    _timer?.cancel();
    _timer = Timer.periodic(_pollInterval, (
      timer) async {
      if (DateTime.now().isAfter(endTime)) {
        timer.cancel();
        emit(GenerateVideoStatusTimeout());
        return;
      }

      final result = await pollVideoStatusUseCase.call(jobId);

      result.fold(
        (failure) {
          timer.cancel();
          emit(GenerateVideoStatusError(message: failure.message));
          print(failure.message);
        },
        (videoStatus) {
          if (videoStatus.status == 'completed') {
            timer.cancel();
            emit(GenerateVideoStatusCompleted(videoStatus: videoStatus));
          } else {
            emit(GenerateVideoStatusInProgress(videoStatus: videoStatus));
          }
        },
      );
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
