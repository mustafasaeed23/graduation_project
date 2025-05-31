import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/settings/Domain/usecases/get_user_profile_use_case.dart';
import 'package:graduation_project/features/settings/Presentation/cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.getUserProfileUseCase})
    : super(SettingsInitial());
  final GetUserProfileUseCase getUserProfileUseCase;

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final result = await getUserProfileUseCase.call();
    result.fold(
      (failure) {
        emit(UserProfileError(message: failure.message));
        print(failure.message);
      },
      (user) {
        emit(UserProfileLoaded(entity: user));
      },
    );
  }
}
