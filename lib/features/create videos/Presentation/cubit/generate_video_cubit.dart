import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_script_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Domain/Entites/generate_video_status_entity.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/poll_video_status_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';

class GenerateVideoCubit extends Cubit<GenerateVideoState> {
  GenerateVideoCubit({
    required this.generateViedoUseCase,
    required this.generateScriptUseCase,
    required this.getVideoStatusUseCase, // Inject the use case for video status
  }) : super(GenerateVideoInitial());

  final GenerateViedoUseCase generateViedoUseCase;
  final GenerateScriptUseCase generateScriptUseCase;
  final PollVideoStatusUseCase getVideoStatusUseCase;

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
    final result = await generateViedoUseCase.call(
      generatedScript: generatedScript,
      title: title,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
    result.fold((failure) => emit(GenerateVideoError(error: failure.message)), (
      jobID,
    ) {
      emit(GenerateVideoSuccess(jobId: jobID));
      print("jobID $jobID");
    });
  }

  // generate script
  Future<void> generateScript({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    emit(GenerateScriptLoading());
    final result = await generateScriptUseCase.call(
      userPromot: promot,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
    result.fold(
      (failure) {
        emit(GenerateScriptError(error: failure.message));
        print(failure.message);
      },
      (script) {
        emit(GenerateScriptSuccess(script: script));
        print(script);
      },
    );
  }

  /// Poll video status by jobId
  Future<void> checkVideoStatus(String jobId) async {
    emit(GenerateVideoStatusLoading());

    final endTime = DateTime.now().add(_timeoutDuration);

    _timer?.cancel();
    _timer = Timer.periodic(_pollInterval, (timer) async {
      if (DateTime.now().isAfter(endTime)) {
        timer.cancel();
        emit(GenerateVideoStatusTimeout());
        return;
      }

      try {
        final result = await getVideoStatusUseCase.execute(jobId);

        result.fold(
          (failure) {
            timer.cancel();
            emit(GenerateVideoStatusError(error: failure.message));
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
      } catch (e) {
        timer.cancel();
        emit(GenerateVideoStatusError(error: e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
