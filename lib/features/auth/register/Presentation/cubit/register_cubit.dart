import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/auth/register/Domain/Use%20Case/register_use_case.dart';
import 'package:graduation_project/features/auth/register/Presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase})
    : super(RegisterInitialState());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase.register(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(RegisterErrorState(error: failure.message));
        print("error ${failure.message}");
      },
      (registerModel) {
        emit(RegisterSuccessState());
      },
    );
  }
}
