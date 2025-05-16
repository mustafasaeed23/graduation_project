import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/auth/login/Data/Models/login_model.dart';
import 'package:graduation_project/features/auth/login/Domain/Contract%20Repository/login_contract_repo.dart';

class LoginUseCase {
  final LoginContractRepo loginContractRepo;
  LoginUseCase({required this.loginContractRepo});

  Future<Either<Failure, LoginModel>> call({
    required String email,
    required String password,
  }) async {
    return await loginContractRepo.login(email: email, password: password);
  }
}
