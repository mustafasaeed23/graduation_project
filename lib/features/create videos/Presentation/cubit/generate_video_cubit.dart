import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/create%20videos/Domain/Use%20Cases/generate_viedo_use_case.dart';
import 'package:graduation_project/features/create%20videos/Presentation/cubit/generate_video_state.dart';

class GenerateVideoCubit extends Cubit<GenerateVideoState> {
  GenerateVideoCubit({required this.generateViedoUseCase})
    : super(GenerateVideoInitial());

  final GenerateViedoUseCase generateViedoUseCase;

  Future<void> generateVideo({
    required String promot,
    required String language,
    required String accentOrDialect,
    required String type,
  }) async {
    emit(GenerateVideoLoading());
    final result = await generateViedoUseCase.call(
      promot: promot,
      language: language,
      accentOrDialect: accentOrDialect,
      type: type,
    );
    result.fold(
      (failure) => emit(GenerateVideoError(error: failure.message)),
      (video) => emit(GenerateVideoSuccess(video: video)),
    );
  }
}
