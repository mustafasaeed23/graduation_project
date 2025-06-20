import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/video%20details/cubit/video_details_state.dart';
import 'package:graduation_project/features/video%20details/domain/usecases/video_details_use_case.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit({required this.videoDetailsUseCase})
    : super(VideoDetailsInitial());

  final VideoDetailsUseCase videoDetailsUseCase;

  Future<void> renameVideo({
    required String newTitle,
    required String videoId,
  }) async {
    emit(VideoDetailsLoading());
    final result = await videoDetailsUseCase.renameVideoTitle(
      newTitle: newTitle,
      videoId: videoId,
    );

    result.fold(
      (failure) {
        emit(VideoDetailsError(message: failure.message));
        print(failure.message);
      },
      (video) {
        emit(VideoDetailsLoaded(entity: video));
      },
    );
  }
}
