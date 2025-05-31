import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/ai%20avatar/Domain/usecases/get_all_ai_avtars_use_case.dart';
import 'package:graduation_project/features/ai%20avatar/Presentation/cubit/ai_avatar_state.dart';

class AiAvatarCubit extends Cubit<AiAvatarState> {
  AiAvatarCubit({required this.getAllAiAvtarsUseCase})
    : super(AiAvatarInitial());

  final GetAllAiAvtarsUseCase getAllAiAvtarsUseCase;

  Future<void> getAllAiAvtars() async {
    emit(AiAvatarLoading());
    final failureOrAiAvtars = await getAllAiAvtarsUseCase.call();
    failureOrAiAvtars.fold(
      (failure) => emit(AiAvatarError(message: failure.message)),
      (aiAvtars) => emit(AiAvatarLoaded(entity: aiAvtars)),
    );
  }
}
