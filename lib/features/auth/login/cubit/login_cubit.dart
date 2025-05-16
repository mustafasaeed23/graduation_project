import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/auth/login/Domain/Use%20Cases/login_use_case.dart';
import 'package:graduation_project/features/auth/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUseCase(email: email, password: password);
    result.fold(
      (failure) {
        emit(LoginError(error: failure.message));
        print(failure.message);
      },
      (loginModel) {
        emit(LoginSuccess());
        print("Login successful: ${loginModel.accessToken}");
      },
    );
  }
}
