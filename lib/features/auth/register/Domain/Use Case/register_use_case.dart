import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/auth/register/Data/Models/register_model.dart';
import 'package:graduation_project/features/auth/register/Domain/Contract%20Repo/register_contract_repo.dart';

class RegisterUseCase {
  final RegisterContractRepo registerContractRepo;
  RegisterUseCase({required this.registerContractRepo});

  Future<Either<Failure, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return await registerContractRepo.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
