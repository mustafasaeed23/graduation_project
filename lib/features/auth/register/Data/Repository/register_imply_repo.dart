import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/Errors/exceptions.dart';
import 'package:graduation_project/core/Errors/failures.dart';
import 'package:graduation_project/core/Errors/strings.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/features/auth/register/Data/Data%20Source/register_data_source.dart';
import 'package:graduation_project/features/auth/register/Data/Models/register_model.dart';
import 'package:graduation_project/features/auth/register/Domain/Contract%20Repo/register_contract_repo.dart';

class RegisterImplyRepo implements RegisterContractRepo {
  final RegisterDataSource registerDataSource;
  RegisterImplyRepo({required this.registerDataSource});
  @override
  Future<Either<Failure, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await registerDataSource.register(
        name: name,
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
