import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/auth/register/Data/Models/register_model.dart';

abstract class RegisterContractRepo {
  Future<Either<Failure, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
  });
}
