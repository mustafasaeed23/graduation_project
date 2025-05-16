import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/features/auth/login/Data/Models/login_model.dart';

abstract class LoginContractRepo {
  Future<Either<Failure, LoginModel>> login({required String email, required String password});
}
