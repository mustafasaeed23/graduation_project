import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/core/Errors/strings.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/features/auth/login/Data/Data%20Source/login_data_source.dart';
import 'package:graduation_project/features/auth/login/Data/Models/login_model.dart';
import 'package:graduation_project/features/auth/login/Domain/Contract%20Repository/login_contract_repo.dart';

class LoginImplyRepo implements LoginContractRepo {
  final LoginDataSource loginDataSource;
  LoginImplyRepo({required this.loginDataSource});
  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await loginDataSource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.message));
    } on OfflineException {
      return const Left(OfflineFailure(message: OFFLINE_FAILURE_MESSAGE));
    } catch (err) {
      printDebug(err);
      return const Left(
        ServerFailure(message: "Something went wrong, please try again later"),
      );
    }
  }
}
